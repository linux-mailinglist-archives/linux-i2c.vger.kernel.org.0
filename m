Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B696B2EFF99
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jan 2021 13:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbhAIMoe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jan 2021 07:44:34 -0500
Received: from www.zeus03.de ([194.117.254.33]:50300 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbhAIMoL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Jan 2021 07:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=/M15B02KD7/2rU
        qTqe2B3eb8olNXVlilL4Ocfwzdk8E=; b=biw2VW6S9SE6C9HPGBo8VZsrEBZSKb
        khZ4uuYX4j4Ao+iJLW1OYxNrn3hvowisCVjmlyH5fMiAeXE3LWmg9PDo30S1lGeZ
        dwW1gSi/Vr/aaZnq/qdHS9kOmep/3C3x1FDaIbDR3uyX/fe5fVMYlpLbNniNjING
        wVwld6DwWKYi8=
Received: (qmail 1725031 invoked from network); 9 Jan 2021 13:43:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2021 13:43:28 +0100
X-UD-Smtp-Session: l3s3148p1@ay4FBXe4SJYgAwDPXyBeAD+yeC5KBZLe
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] i2c: refactor documentation of struct i2c_msg
Date:   Sat,  9 Jan 2021 13:43:05 +0100
Message-Id: <20210109124314.27466-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
References: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The information about 'i2c_msg' was spread between kdoc and comments.
Move all the explanations to kdoc and duplicate only the requirements
for the flags in the comments. Also, add some redundancy and fix some
typos while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/uapi/linux/i2c.h | 91 ++++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 36 deletions(-)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index f71a1751cacf..8d2f59f53324 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -32,18 +32,41 @@
 
 /**
  * struct i2c_msg - an I2C transaction segment beginning with START
- * @addr: Slave address, either seven or ten bits.  When this is a ten
- *	bit address, I2C_M_TEN must be set in @flags and the adapter
- *	must support I2C_FUNC_10BIT_ADDR.
- * @flags: I2C_M_RD is handled by all adapters.  No other flags may be
- *	provided unless the adapter exported the relevant I2C_FUNC_*
- *	flags through i2c_check_functionality().
- * @len: Number of data bytes in @buf being read from or written to the
- *	I2C slave address.  For read transactions where I2C_M_RECV_LEN
- *	is set, the caller guarantees that this buffer can hold up to
- *	32 bytes in addition to the initial length byte sent by the
- *	slave (plus, if used, the SMBus PEC); and this value will be
- *	incremented by the number of block data bytes received.
+ *
+ * @addr: Slave address, either 7 or 10 bits. When this is a 10 bit address,
+ *   %I2C_M_TEN must be set in @flags and the adapter must support
+ *   %I2C_FUNC_10BIT_ADDR.
+ *
+ * @flags:
+ *   Supported by all adapters:
+ *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001!
+ *
+ *   Optional:
+ *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes only sense
+ *     in kernelspace, because userspace buffers are copied anyway
+ *
+ *   Only if I2C_FUNC_10BIT_ADDR is set:
+ *   %I2C_M_TEN: this is a 10 bit chip address
+ *
+ *   Only if I2C_FUNC_SMBUS_READ_BLOCK_DATA is set:
+ *   %I2C_M_RECV_LEN: message length will be first received byte
+ *
+ *   Only if I2C_FUNC_NOSTART is set:
+ *   %I2C_M_NOSTART: skip repeated start sequence
+
+ *   Only if I2C_FUNC_PROTOCOL_MANGLING is set:
+ *   %I2C_M_NO_RD_ACK: in a read message, master ACK/NACK bit is skipped
+ *   %I2C_M_IGNORE_NAK: treat NACK from client as ACK
+ *   %I2C_M_REV_DIR_ADDR: toggles the Rd/Wr bit
+ *   %I2C_M_STOP: force a STOP condition after the message
+ *
+ * @len: Number of data bytes in @buf being read from or written to the I2C
+ *   slave address. For read transactions where %I2C_M_RECV_LEN is set, the
+ *   caller guarantees that this buffer can hold up to %I2C_SMBUS_BLOCK_MAX
+ *   bytes in addition to the initial length byte sent by the slave (plus,
+ *   if used, the SMBus PEC); and this value will be incremented by the number
+ *   of block data bytes received.
+ *
  * @buf: The buffer into which data is read, or from which it's written.
  *
  * An i2c_msg is the low level representation of one segment of an I2C
@@ -60,40 +83,36 @@
  * group, it is followed by a STOP.  Otherwise it is followed by the next
  * @i2c_msg transaction segment, beginning with a (repeated) START.
  *
- * Alternatively, when the adapter supports I2C_FUNC_PROTOCOL_MANGLING then
+ * Alternatively, when the adapter supports %I2C_FUNC_PROTOCOL_MANGLING then
  * passing certain @flags may have changed those standard protocol behaviors.
  * Those flags are only for use with broken/nonconforming slaves, and with
- * adapters which are known to support the specific mangling options they
- * need (one or more of IGNORE_NAK, NO_RD_ACK, NOSTART, and REV_DIR_ADDR).
+ * adapters which are known to support the specific mangling options they need.
  */
 struct i2c_msg {
-	__u16 addr;	/* slave address			*/
+	__u16 addr;
 	__u16 flags;
-#define I2C_M_RD		0x0001	/* read data, from slave to master */
-					/* I2C_M_RD is guaranteed to be 0x0001! */
-#define I2C_M_TEN		0x0010	/* this is a ten bit chip address */
-#define I2C_M_DMA_SAFE		0x0200	/* the buffer of this message is DMA safe */
-					/* makes only sense in kernelspace */
-					/* userspace buffers are copied anyway */
-#define I2C_M_RECV_LEN		0x0400	/* length will be first received byte */
-#define I2C_M_NO_RD_ACK		0x0800	/* if I2C_FUNC_PROTOCOL_MANGLING */
-#define I2C_M_IGNORE_NAK	0x1000	/* if I2C_FUNC_PROTOCOL_MANGLING */
-#define I2C_M_REV_DIR_ADDR	0x2000	/* if I2C_FUNC_PROTOCOL_MANGLING */
-#define I2C_M_NOSTART		0x4000	/* if I2C_FUNC_NOSTART */
-#define I2C_M_STOP		0x8000	/* if I2C_FUNC_PROTOCOL_MANGLING */
-	__u16 len;		/* msg length				*/
-	__u8 *buf;		/* pointer to msg data			*/
+#define I2C_M_RD		0x0001	/* guaranteed to be 0x0001! */
+#define I2C_M_TEN		0x0010	/* use only if I2C_FUNC_10BIT_ADDR */
+#define I2C_M_DMA_SAFE		0x0200	/* use only in kernel space */
+#define I2C_M_RECV_LEN		0x0400	/* use only if I2C_FUNC_SMBUS_READ_BLOCK_DATA */
+#define I2C_M_NO_RD_ACK		0x0800	/* use only if I2C_FUNC_PROTOCOL_MANGLING */
+#define I2C_M_IGNORE_NAK	0x1000	/* use only if I2C_FUNC_PROTOCOL_MANGLING */
+#define I2C_M_REV_DIR_ADDR	0x2000	/* use only if I2C_FUNC_PROTOCOL_MANGLING */
+#define I2C_M_NOSTART		0x4000	/* use only if I2C_FUNC_NOSTART */
+#define I2C_M_STOP		0x8000	/* use only if I2C_FUNC_PROTOCOL_MANGLING */
+	__u16 len;
+	__u8 *buf;
 };
 
 /* To determine what functionality is present */
 
 #define I2C_FUNC_I2C			0x00000001
-#define I2C_FUNC_10BIT_ADDR		0x00000002
-#define I2C_FUNC_PROTOCOL_MANGLING	0x00000004 /* I2C_M_IGNORE_NAK etc. */
+#define I2C_FUNC_10BIT_ADDR		0x00000002 /* required for I2C_M_TEN */
+#define I2C_FUNC_PROTOCOL_MANGLING	0x00000004 /* required for I2C_M_IGNORE_NAK etc. */
 #define I2C_FUNC_SMBUS_PEC		0x00000008
-#define I2C_FUNC_NOSTART		0x00000010 /* I2C_M_NOSTART */
+#define I2C_FUNC_NOSTART		0x00000010 /* required for I2C_M_NOSTART */
 #define I2C_FUNC_SLAVE			0x00000020
-#define I2C_FUNC_SMBUS_BLOCK_PROC_CALL	0x00008000 /* SMBus 2.0 */
+#define I2C_FUNC_SMBUS_BLOCK_PROC_CALL	0x00008000 /* SMBus 2.0 or later */
 #define I2C_FUNC_SMBUS_QUICK		0x00010000
 #define I2C_FUNC_SMBUS_READ_BYTE	0x00020000
 #define I2C_FUNC_SMBUS_WRITE_BYTE	0x00040000
@@ -102,11 +121,11 @@ struct i2c_msg {
 #define I2C_FUNC_SMBUS_READ_WORD_DATA	0x00200000
 #define I2C_FUNC_SMBUS_WRITE_WORD_DATA	0x00400000
 #define I2C_FUNC_SMBUS_PROC_CALL	0x00800000
-#define I2C_FUNC_SMBUS_READ_BLOCK_DATA	0x01000000
+#define I2C_FUNC_SMBUS_READ_BLOCK_DATA	0x01000000 /* required for I2C_M_RECV_LEN */
 #define I2C_FUNC_SMBUS_WRITE_BLOCK_DATA 0x02000000
 #define I2C_FUNC_SMBUS_READ_I2C_BLOCK	0x04000000 /* I2C-like block xfer  */
 #define I2C_FUNC_SMBUS_WRITE_I2C_BLOCK	0x08000000 /* w/ 1-byte reg. addr. */
-#define I2C_FUNC_SMBUS_HOST_NOTIFY	0x10000000
+#define I2C_FUNC_SMBUS_HOST_NOTIFY	0x10000000 /* SMBus 2.0 or later */
 
 #define I2C_FUNC_SMBUS_BYTE		(I2C_FUNC_SMBUS_READ_BYTE | \
 					 I2C_FUNC_SMBUS_WRITE_BYTE)
-- 
2.29.2

