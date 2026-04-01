import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_page.dart';

class TicketHistory extends StatefulWidget {
  const TicketHistory({super.key});

  @override
  State<TicketHistory> createState() => _TicketHistoryState();
}

class _TicketHistoryState extends State<TicketHistory> {
  final String? _currentUserId = FirebaseAuth.instance.currentUser?.uid;

  // ── 2. BUILD THE FIRESTORE STREAM ────────────────────────────────
  // This creates a LIVE stream of this user's tickets.
  // Every time Firestore data changes, this stream emits new data.
  Stream<QuerySnapshot> _getTicketStream() {
    return FirebaseFirestore.instance
        .collection('tickets')
        .where('userId', isEqualTo: _currentUserId)
        .orderBy('purchasedAt', descending: true) // newest first
        .snapshots(); // .snapshots() = real-time stream
  }

  // ── 3. HELPER — FORMAT TIMESTAMP TO READABLE DATE ────────────────
  String _formatDate(Timestamp? timestamp) {
    if (timestamp == null) return 'Just now';

    final date = timestamp.toDate(); // Timestamp → DateTime
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays == 0) return 'Today';
    if (diff.inDays == 1) return 'Yesterday';
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:Text(
          "Ticket History",

          style:TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,

        leading: IconButton(
          onPressed: () {

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false,
            );
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,),


        ),
      ),

      body:
      _currentUserId == null

      // If no user is logged in, show message
          ? const Center(child: Text("Please log in to view tickets"))

          : StreamBuilder<QuerySnapshot>(
        stream: _getTicketStream(),
        builder: (context, snapshot) {

          // ── STATE 1: Loading ────────────────────────────────
          // Stream hasn't emitted first value yet
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.indigo),
            );
          }

          // ── STATE 2: Error ──────────────────────────────────
          if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong: ${snapshot.error}"),
            );
          }

          // ── STATE 3: Empty ──────────────────────────────────
          // User is logged in but has no tickets yet
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.confirmation_num_outlined,
                      size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    "No tickets yet!",
                    style: TextStyle(
                        fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          // ── STATE 4: Has Data ───────────────────────────────
          // snapshot.data!.docs = list of Firestore documents
          final docs = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, index) {

              // Each doc is one ticket from Firestore
              final doc = docs[index];

              // doc.data() returns Map<String, dynamic>
              // Cast it so Dart knows the type
              final data = doc.data() as Map<String, dynamic>;

              // Extract each field safely with ?? fallback
              final String from      = data['from'] ?? 'Unknown';
              final String to        = data['to'] ?? 'Unknown';
              final int price        = data['price'] ?? 0;
              final int passengers   = data['passengers'] ?? 1;
              final Timestamp? time  = data['purchasedAt'];
              //final String ticketId  = doc.id; // Firestore doc ID
             // final String status    = _getStatus(data);

              return GestureDetector(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xffd7deff),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Route + Status badge in same row
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$from → $to',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.indigo,
                            ),
                          ),
                          //_statusBadge(status),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Date + Passengers + Price
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${_formatDate(time)} • $passengers passenger(s)',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            '৳$price',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

    );
  }
}
