Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC1523D3CF
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 00:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgHEWKq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 18:10:46 -0400
Received: from www.zeus03.de ([194.117.254.33]:36324 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbgHEWKq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 18:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=xutQ1fKO61vOeoLs649G0x9HofL
        n2FduiHeRNBW7/EY=; b=bXy8Fa97zm615LkidVOnZICVLqGz0LP8+1vdgAxAbfk
        gp4/pXiHHoK0EGFgW9Hf555Jqp1iOeOYOOJP0sHzharQNgvoM7P+zS2bpycLvPD2
        SSjZH+sTRGSLRb+YFsSPdibMG74pmNlb/C5DH7eIxspJyqaaaEZaN8rsmkpcQYz8
        =
Received: (qmail 3167251 invoked from network); 6 Aug 2020 00:10:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Aug 2020 00:10:39 +0200
X-UD-Smtp-Session: l3s3148p1@2mlQpCis7LBQT+F6
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Daniel Stodden <daniel.stodden@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools v2] i2ctransfer: add support for I2C_M_RECV_LEN
Date:   Thu,  6 Aug 2020 00:10:33 +0200
Message-Id: <20200805221033.9136-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1:
* use new 'len' variable in one more check

 tools/i2ctransfer.8 |  1 +
 tools/i2ctransfer.c | 44 ++++++++++++++++++++++++++++++++------------
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/tools/i2ctransfer.8 b/tools/i2ctransfer.8
index d16e34e..152d20d 100644
--- a/tools/i2ctransfer.8
+++ b/tools/i2ctransfer.8
@@ -91,6 +91,7 @@ specifies if the message is read or write
 .B <length_of_message>
 specifies the number of bytes read or written in this message.
 It is parsed as an unsigned 16 bit integer, but note that the Linux Kernel applies an additional upper limit (8192 as of v4.10).
+For read messages to targets which support SMBus Block transactions, it can also be '?', then the target will determine the length.
 .TP
 .B [@address]
 specifies the 7-bit address of the chip to be accessed for this message, and is an integer.
diff --git a/tools/i2ctransfer.c b/tools/i2ctransfer.c
index 7b95d48..b0e8d43 100644
--- a/tools/i2ctransfer.c
+++ b/tools/i2ctransfer.c
@@ -45,7 +45,8 @@ static void help(void)
 		"Usage: i2ctransfer [-f] [-y] [-v] [-V] [-a] I2CBUS DESC [DATA] [DESC [DATA]]...\n"
 		"  I2CBUS is an integer or an I2C bus name\n"
 		"  DESC describes the transfer in the form: {r|w}LENGTH[@address]\n"
-		"    1) read/write-flag 2) LENGTH (range 0-65535) 3) I2C address (use last one if omitted)\n"
+		"    1) read/write-flag 2) LENGTH (range 0-65535, or '?')\n"
+		"    3) I2C address (use last one if omitted)\n"
 		"  DATA are LENGTH bytes for a write message. They can be shortened by a suffix:\n"
 		"    = (keep value constant until LENGTH)\n"
 		"    + (increase value by 1 until LENGTH)\n"
@@ -84,17 +85,24 @@ static void print_msgs(struct i2c_msg *msgs, __u32 nmsgs, unsigned flags)
 
 	for (i = 0; i < nmsgs; i++) {
 		int read = msgs[i].flags & I2C_M_RD;
+		int recv_len = msgs[i].flags & I2C_M_RECV_LEN;
 		int print_buf = (read && (flags & PRINT_READ_BUF)) ||
 				(!read && (flags & PRINT_WRITE_BUF));
+		__u16 len = recv_len ? msgs[i].buf[0] + 1 : msgs[i].len;
+
+		if (flags & PRINT_HEADER) {
+			fprintf(output, "msg %u: addr 0x%02x, %s, len ",
+				i, msgs[i].addr, read ? "read" : "write");
+			if (!recv_len || flags & PRINT_READ_BUF)
+				fprintf(output, "%u", len);
+			else
+				fprintf(output, "TBD");
+		}
 
-		if (flags & PRINT_HEADER)
-			fprintf(output, "msg %u: addr 0x%02x, %s, len %u",
-				i, msgs[i].addr, read ? "read" : "write", msgs[i].len);
-
-		if (msgs[i].len && print_buf) {
+		if (len && print_buf) {
 			if (flags & PRINT_HEADER)
 				fprintf(output, ", buf ");
-			for (j = 0; j < msgs[i].len - 1; j++)
+			for (j = 0; j < len - 1; j++)
 				fprintf(output, "0x%02x ", msgs[i].buf[j]);
 			/* Print final byte with newline */
 			fprintf(output, "0x%02x\n", msgs[i].buf[j]);
@@ -192,13 +200,23 @@ int main(int argc, char *argv[])
 				goto err_out_with_arg;
 			}
 
-			len = strtoul(arg_ptr, &end, 0);
-			if (len > 0xffff || arg_ptr == end) {
-				fprintf(stderr, "Error: Length invalid\n");
-				goto err_out_with_arg;
+			if (*arg_ptr == '?') {
+				if (!(flags & I2C_M_RD)) {
+					fprintf(stderr, "Error: variable length not allowed with write\n");
+					goto err_out_with_arg;
+				}
+				len = 256; /* SMBUS3_MAX_BLOCK_LEN + 1 */
+				flags |= I2C_M_RECV_LEN;
+				arg_ptr++;
+			} else {
+				len = strtoul(arg_ptr, &end, 0);
+				if (len > 0xffff || arg_ptr == end) {
+					fprintf(stderr, "Error: Length invalid\n");
+					goto err_out_with_arg;
+				}
+				arg_ptr = end;
 			}
 
-			arg_ptr = end;
 			if (*arg_ptr) {
 				if (*arg_ptr++ != '@') {
 					fprintf(stderr, "Error: Unknown separator after length\n");
@@ -237,6 +255,8 @@ int main(int argc, char *argv[])
 				}
 				memset(buf, 0, len);
 				msgs[nmsgs].buf = buf;
+				if (flags & I2C_M_RECV_LEN)
+					buf[0] = 1; /* number of extra bytes */
 			}
 
 			if (flags & I2C_M_RD || len == 0) {
-- 
2.27.0

