Return-Path: <linux-i2c+bounces-12517-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C408AB3C9CF
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Aug 2025 11:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72AA117B001
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Aug 2025 09:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51CE2459CF;
	Sat, 30 Aug 2025 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFVX96Lo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A294F3398A;
	Sat, 30 Aug 2025 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756546291; cv=none; b=fpd1HRKX9QmFisFmxtbL3UovgbhUmYGHmqfsa2G0elxxVy+u5GXwkkfR4nBtxBzeNf/Sgs4WySaAzux8UUQ0wWTiMqpuWxkfKS5G/PXigNAy2XTRiOtNkzvNcdLTMNeQyxrS4W1YFOCGZPpFb+2n/I5nu2nGbZWzTkJ6HQHTN6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756546291; c=relaxed/simple;
	bh=UDyp06qYPFjSkxjAijLno/FfVH6r44QFYaPVALEWk2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TmbbnEZo6hKwJRP7xQ3q9jnxOwGb3eeIZOvyY5ZYduXmyu7iD/lzTVxaUJMv0yi9Yzbmz9sgQqnGFaj4/TiKFV5uIykNcrA0GtnGUAxTK+YEkYs90uMQxUTe2AVlXinpAOrdXBoERuQ36eCLsu+JbOa5fdt8oH5yw1SczqGheL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFVX96Lo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b7d485204so19738025e9.0;
        Sat, 30 Aug 2025 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756546287; x=1757151087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Up2P7vjKi8QklCUcdDHejqfALjW3x9NcVgd4egJte+k=;
        b=ZFVX96LoR52R2XrlGyZJlBuSYIar1tbupndTRyWaq78Nb/EIw9LsGuJd5bwRLbiaXe
         0MkXFXw7kP7iv6owin5wMbkezZO1s7hfKcVGVkTiXs9znreDCNMMWG4PyOrHbJnvtCFT
         4bc+SGhpPR4HLlyOd4ZP2ltvY53+QnNcWeInugAWg55utARi244I1uJqCJYim13g5WcH
         OeGNd4sG1u9GLt1R78dnNsjdYYEpues2ldCwp3SVUaFeTEMBpY9PdCVfwEfWtN8324Io
         1IKdXDncsItlbOjdDwiG4lhXTM8t9HE/D5v+mK3793EYb0GfSm72Sq8DIpg5pxf27TJ2
         W16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756546287; x=1757151087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Up2P7vjKi8QklCUcdDHejqfALjW3x9NcVgd4egJte+k=;
        b=g8sWRYWigi3UhAWh5nynIXdUIfUARVmtVj3wDZWZbVMNUZQWgFLJiBml+ZwhLibMLh
         FLmx48DAFAZHpp0QJwA2F9seUYm2jsDiyQFUDfbn2/e/odrW6PWKVAnk8ZbuZPvh4o77
         leuSg8r2iAt8814+Lizf3cRFxriARLFNWpACpfodloW6hYQGI0iHZ5FLPJ1sDEz1bVlY
         liuYzJpuegAJ3zZ9ZKxRzyFeZOCBYZH4N+gQzt7iBgWDEY67bAZaLUNx8RRvIJwfO/8j
         oqacXhoo7E15j4ur0ZFFUMlo17Qt//2RdW8F3AhXJ53JKMBvT34AEfsRhl+SmMQkq0ZJ
         w05g==
X-Forwarded-Encrypted: i=1; AJvYcCVIDUVmJ3wbT/M4yIDMkcegS3VEx5bgVlHoF59zHjxA5EIdv2xrgUW+HXGBUmtDRE3fyEDrvGlZRS8pLUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6eyvXJp3ufSYfZV+KKub5NUMKtTyoVbjm6C68T+4PWhajKRf+
	c37abnI40MDzXcqjfIjIliP+1NxZiBww/plbc6vrhbZI26aSOv8VI35N
X-Gm-Gg: ASbGncu7ZXahy81tavCyMVgQBXTRuMiC6nIi0NtnZAGYJjgiPRtPHtaHN5hiCnQx+FD
	XI0A7Vsggj2fm+tNcotQ+Oq6WOia7tF/uxu25WpfYx/Kn+1l9kDLhHoYEvhhYQtbJ2suu3E88gt
	mCJmiOe4A6EA83XL9ORMUxjPT/x7FGS1LAkJpJgwssvibAFhdXzzA6AGbfauku9yBKXkfRRsFzh
	lGc08s/iLj2k4d2Mw2hicFQ59+pkw6ZCNt6QOe1XT2gjbq+ZrrKGUc93eXjidypgEbZmcIi2HI/
	ObZ5zQ10KQufEiQTryVu6+kZ+R2Jm1c4pomJ1gOizb8nyI+6zN5TV1G/E3AnsuyQFLHW+y9jqgV
	K/3FUNFLswi+uyOZa2JlNYz27+ZKZfSxrLkGC71o=
X-Google-Smtp-Source: AGHT+IGm5EUshai0ggE9N0NLIalATYYW6X0nOLgwxaCgHxKZ39vhd59uZ6qa29EHcrQ7yfFRK9MM9g==
X-Received: by 2002:a05:6000:25c1:b0:3c6:a970:1501 with SMTP id ffacd0b85a97d-3d1dc78e462mr1154221f8f.5.1756546286483;
        Sat, 30 Aug 2025 02:31:26 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33add294sm6881943f8f.29.2025.08.30.02.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 02:31:25 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org,
	peda@axentia.se,
	jdelvare@suse.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH] i2c: Main i2c-*.c files and algos/ subdirectory : Fix errors and warnings generated by checkpatch
Date: Sat, 30 Aug 2025 12:30:15 +0300
Message-ID: <20250830093016.160753-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed some coding style errors and warnings plus some minor changes
in code as reported by checkpatch script. The busses/ and muxes/
subfolders will be dealt with another commit. Main changes were done
to comments, defines of 'if' statement, swapping 'unsigned' with
'unsigned int' and other minor changes.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/Kconfig              |  2 +-
 drivers/i2c/algos/i2c-algo-bit.c | 29 +++++++++------
 drivers/i2c/algos/i2c-algo-pca.c | 25 +++++++++----
 drivers/i2c/algos/i2c-algo-pcf.c | 61 ++++++++++++++++++++++----------
 drivers/i2c/algos/i2c-algo-pcf.h | 10 +++---
 drivers/i2c/i2c-boardinfo.c      |  2 +-
 drivers/i2c/i2c-core-base.c      | 59 +++++++++++++++++++-----------
 drivers/i2c/i2c-dev.c            | 47 ++++++++++++++----------
 drivers/i2c/i2c-mux.c            |  1 +
 drivers/i2c/i2c-slave-eeprom.c   |  2 +-
 drivers/i2c/i2c-smbus.c          |  2 +-
 drivers/i2c/i2c-stub.c           | 29 +++++++--------
 12 files changed, 170 insertions(+), 99 deletions(-)

diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index c232054fddd6..6a3aa09d316a 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -48,7 +48,7 @@ config I2C_CHARDEV
 	  programs use the I2C bus.  Information on how to do this is
 	  contained in the file <file:Documentation/i2c/dev-interface.rst>.
 
-	  This support is also available as a module.  If so, the module 
+	  This support is also available as a module. If so, the module
 	  will be called i2c-dev.
 
 config I2C_MUX
diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index 6544d27e4419..475f33a8b37a 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -33,12 +33,12 @@
 /* ----- global variables ---------------------------------------------	*/
 
 static int bit_test;	/* see if the line-setting functions work	*/
-module_param(bit_test, int, S_IRUGO);
+module_param(bit_test, int, 0444);
 MODULE_PARM_DESC(bit_test, "lines testing - 0 off; 1 report; 2 fail if stuck");
 
 #ifdef DEBUG
 static int i2c_debug = 1;
-module_param(i2c_debug, int, S_IRUGO | S_IWUSR);
+module_param(i2c_debug, int, 0644);
 MODULE_PARM_DESC(i2c_debug,
 		 "debug level - 0 off; 1 normal; 2 verbose; 3 very verbose");
 #endif
@@ -142,9 +142,12 @@ static void i2c_stop(struct i2c_algo_bit_data *adap)
 
 
 
-/* send a byte without start cond., look for arbitration,
-   check ackn. from slave */
-/* returns:
+/*
+ * send a byte without start cond., look for arbitration,
+ * check ackn. from slave
+ */
+/*
+ * returns:
  * 1 if the device acknowledged
  * 0 if the device did not ack
  * -ETIMEDOUT if an error occurred (while raising the scl line)
@@ -404,7 +407,7 @@ static int readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msg)
 	int rdcount = 0;	/* counts bytes read */
 	unsigned char *temp = msg->buf;
 	int count = msg->len;
-	const unsigned flags = msg->flags;
+	const unsigned int flags = msg->flags;
 	struct i2c_algo_bit_data *adap = i2c_adap->algo_data;
 
 	if (!adap->getsda)
@@ -422,8 +425,10 @@ static int readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msg)
 		temp++;
 		count--;
 
-		/* Some SMBus transactions require that we receive the
-		   transaction length as the first read byte. */
+		/*
+		 * Some SMBus transactions require that we receive the
+		 * transaction length as the first read byte.
+		 */
 		if (rdcount == 1 && (flags & I2C_M_RECV_LEN)) {
 			if (inval <= 0 || inval > I2C_SMBUS_BLOCK_MAX) {
 				if (!(flags & I2C_M_NO_RD_ACK))
@@ -433,9 +438,11 @@ static int readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msg)
 					inval);
 				return -EPROTO;
 			}
-			/* The original count value accounts for the extra
-			   bytes, that is, either 1 for a regular transaction,
-			   or 2 for a PEC transaction. */
+			/*
+			 * The original count value accounts for the extra
+			 * bytes, that is, either 1 for a regular transaction,
+			 * or 2 for a PEC transaction.
+			 */
 			count += inval;
 			msg->len += inval;
 		}
diff --git a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-algo-pca.c
index 74b66aec33d4..9be4901337d4 100644
--- a/drivers/i2c/algos/i2c-algo-pca.c
+++ b/drivers/i2c/algos/i2c-algo-pca.c
@@ -14,12 +14,18 @@
 #include <linux/i2c.h>
 #include <linux/i2c-algo-pca.h>
 
-#define DEB1(fmt, args...) do { if (i2c_debug >= 1)			\
-				 printk(KERN_DEBUG fmt, ## args); } while (0)
-#define DEB2(fmt, args...) do { if (i2c_debug >= 2)			\
-				 printk(KERN_DEBUG fmt, ## args); } while (0)
-#define DEB3(fmt, args...) do { if (i2c_debug >= 3)			\
-				 printk(KERN_DEBUG fmt, ## args); } while (0)
+#define DEB1(fmt, args...)	do {	\
+					if (i2c_debug >= 1)	\
+						printk(KERN_DEBUG fmt, ## args);	\
+				} while (0)
+#define DEB2(fmt, args...)	do {	\
+					if (i2c_debug >= 2)	\
+						printk(KERN_DEBUG fmt, ## args);	\
+				} while (0)
+#define DEB3(fmt, args...)	do {	\
+					if (i2c_debug >= 3)	\
+						printk(KERN_DEBUG fmt, ## args);	\
+				} while (0)
 
 static int i2c_debug;
 
@@ -68,6 +74,7 @@ static void pca_reset(struct i2c_algo_pca_data *adap)
 static int pca_start(struct i2c_algo_pca_data *adap)
 {
 	int sta = pca_get_con(adap);
+
 	DEB2("=== START\n");
 	sta |= I2C_PCA_CON_STA;
 	sta &= ~(I2C_PCA_CON_STO|I2C_PCA_CON_SI);
@@ -83,6 +90,7 @@ static int pca_start(struct i2c_algo_pca_data *adap)
 static int pca_repeated_start(struct i2c_algo_pca_data *adap)
 {
 	int sta = pca_get_con(adap);
+
 	DEB2("=== REPEATED START\n");
 	sta |= I2C_PCA_CON_STA;
 	sta &= ~(I2C_PCA_CON_STO|I2C_PCA_CON_SI);
@@ -102,6 +110,7 @@ static int pca_repeated_start(struct i2c_algo_pca_data *adap)
 static void pca_stop(struct i2c_algo_pca_data *adap)
 {
 	int sta = pca_get_con(adap);
+
 	DEB2("=== STOP\n");
 	sta |= I2C_PCA_CON_STO;
 	sta &= ~(I2C_PCA_CON_STA|I2C_PCA_CON_SI);
@@ -139,6 +148,7 @@ static int pca_tx_byte(struct i2c_algo_pca_data *adap,
 		       __u8 b)
 {
 	int sta = pca_get_con(adap);
+
 	DEB2("=== WRITE %#04x\n", b);
 	pca_outw(adap, I2C_PCA_DAT, b);
 
@@ -207,9 +217,10 @@ static int pca_xfer(struct i2c_adapter *i2c_adap,
 	if (i2c_debug >= 2) {
 		for (curmsg = 0; curmsg < num; curmsg++) {
 			int addr, i;
+
 			msg = &msgs[curmsg];
 
-			addr = (0x7f & msg->addr) ;
+			addr = (0x7f & msg->addr);
 
 			if (msg->flags & I2C_M_RD)
 				printk(KERN_INFO "    [%02d] RD %d bytes from %#02x [%#02x, ...]\n",
diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index fd563e845d4b..9c7cff5dc4a1 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -23,10 +23,26 @@
 #include "i2c-algo-pcf.h"
 
 
-#define DEB2(x) if (i2c_debug >= 2) x
-#define DEB3(x) if (i2c_debug >= 3) x /* print several statistical values */
-#define DEBPROTO(x) if (i2c_debug >= 9) x;
+#define DEB2(x)	\
+	do {	\
+		if (i2c_debug >= 2)	\
+			x;	\
+	} while (0)
+
+#define DEB3(x)	\
+	do {	\
+		if (i2c_debug >= 3)	\
+			x;	\
+	} while (0)
+	/* print several statistical values */
+
+#define DEBPROTO(x)	\
+	do {	\
+		if (i2c_debug >= 9)	\
+			x;	\
+	} while (0)
 	/* debug the protocol by showing transferred bits */
+
 #define DEF_TIMEOUT 16
 
 /*
@@ -147,7 +163,7 @@ static int wait_for_pin(struct i2c_algo_pcf_data *adap, int *status)
  *
  * vdovikin: added detect code for PCF8584
  */
-static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
+static int pcf_init_8584(struct i2c_algo_pcf_data *adap)
 {
 	unsigned char temp;
 
@@ -160,7 +176,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	 * check to see S1 now used as R/W ctrl -
 	 * PCF8584 does that when ESO is zero
 	 */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != (0)) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != (0)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S0 (0x%02x).\n", temp));
 		return -ENXIO; /* definitely not PCF8584 */
 	}
@@ -168,7 +185,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* load own address in S0, effective address is (own << 1) */
 	i2c_outb(adap, get_own(adap));
 	/* check it's really written */
-	if ((temp = i2c_inb(adap)) != get_own(adap)) {
+	temp = i2c_inb(adap);
+	if (temp != get_own(adap)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S0 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -176,7 +194,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* S1=0xA0, next byte in S2 */
 	set_pcf(adap, 1, I2C_PCF_PIN | I2C_PCF_ES1);
 	/* check to see S2 now selected */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != I2C_PCF_ES1) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != I2C_PCF_ES1) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S2 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -184,7 +203,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* load clock register S2 */
 	i2c_outb(adap, get_clock(adap));
 	/* check it's really written, the only 5 lowest bits does matter */
-	if (((temp = i2c_inb(adap)) & 0x1f) != get_clock(adap)) {
+	temp = i2c_inb(adap);
+	if ((temp & 0x1f) != get_clock(adap)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S2 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -193,7 +213,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	set_pcf(adap, 1, I2C_PCF_IDLE);
 
 	/* check to see PCF is really idled and we can access status register */
-	if ((temp = get_pcf(adap, 1)) != (I2C_PCF_PIN | I2C_PCF_BB)) {
+	temp = get_pcf(adap, 1);
+	if (temp != (I2C_PCF_PIN | I2C_PCF_BB)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S1` (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -209,7 +230,7 @@ static int pcf_sendbytes(struct i2c_adapter *i2c_adap, const char *buf,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	int wrcount, status, timeout;
 
-	for (wrcount=0; wrcount<count; ++wrcount) {
+	for (wrcount = 0; wrcount < count; ++wrcount) {
 		DEB2(dev_dbg(&i2c_adap->dev, "i2c_write: writing %2.2X\n",
 				buf[wrcount] & 0xff));
 		i2c_outb(adap, buf[wrcount]);
@@ -246,7 +267,8 @@ static int pcf_readbytes(struct i2c_adapter *i2c_adap, char *buf,
 	/* increment number of bytes to read by one -- read dummy byte */
 	for (i = 0; i <= count; i++) {
 
-		if ((wfp = wait_for_pin(adap, &status))) {
+		wfp = wait_for_pin(adap, &status);
+		if (wfp) {
 			if (wfp == -EINTR)
 				return -EINTR; /* arbitration lost */
 
@@ -299,7 +321,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	struct i2c_msg *pmsg;
 	int i;
-	int ret=0, timeout, status;
+	int ret = 0, timeout, status;
 
 	if (adap->xfer_begin)
 		adap->xfer_begin(adap->data);
@@ -313,7 +335,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		goto out;
 	}
 
-	for (i = 0;ret >= 0 && i < num; i++) {
+	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 
 		DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: Doing %s %d bytes to 0x%02x - %d of %d messages\n",
@@ -358,9 +380,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
 			if (ret != pmsg->len) {
 				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only read %d bytes.\n",ret));
+					    "only read %d bytes.\n", ret));
 			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: read %d bytes.\n",ret));
+				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: read %d bytes.\n", ret));
 			}
 		} else {
 			ret = pcf_sendbytes(i2c_adap, pmsg->buf, pmsg->len,
@@ -368,9 +390,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
 			if (ret != pmsg->len) {
 				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only wrote %d bytes.\n",ret));
+					    "only wrote %d bytes.\n", ret));
 			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: wrote %d bytes.\n",ret));
+				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: wrote %d bytes.\n", ret));
 			}
 		}
 	}
@@ -406,7 +428,8 @@ int i2c_pcf_add_bus(struct i2c_adapter *adap)
 	/* register new adapter to i2c module... */
 	adap->algo = &pcf_algo;
 
-	if ((rval = pcf_init_8584(pcf_adap)))
+	rval = pcf_init_8584(pcf_adap);
+	if (rval)
 		return rval;
 
 	rval = i2c_add_adapter(adap);
@@ -419,6 +442,6 @@ MODULE_AUTHOR("Hans Berglund <hb@spacetec.no>");
 MODULE_DESCRIPTION("I2C-Bus PCF8584 algorithm");
 MODULE_LICENSE("GPL");
 
-module_param(i2c_debug, int, S_IRUGO | S_IWUSR);
+module_param(i2c_debug, int, 0644);
 MODULE_PARM_DESC(i2c_debug,
 	"debug level - 0 off; 1 normal; 2,3 more verbose; 9 pcf-protocol");
diff --git a/drivers/i2c/algos/i2c-algo-pcf.h b/drivers/i2c/algos/i2c-algo-pcf.h
index 2448ab192ce5..c593593c2446 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.h
+++ b/drivers/i2c/algos/i2c-algo-pcf.h
@@ -2,9 +2,9 @@
 /* -------------------------------------------------------------------- */
 /* i2c-pcf8584.h: PCF 8584 global defines				*/
 /* -------------------------------------------------------------------- */
-/*   Copyright (C) 1996 Simon G. Vogl
-                   1999 Hans Berglund
-
+/*  Copyright (C)	1996 Simon G. Vogl
+ *			1999 Hans Berglund
+ *
  */
 /* --------------------------------------------------------------------	*/
 
@@ -25,7 +25,7 @@
 
 #define I2C_PCF_START    (I2C_PCF_PIN | I2C_PCF_ESO | I2C_PCF_STA | I2C_PCF_ACK)
 #define I2C_PCF_STOP     (I2C_PCF_PIN | I2C_PCF_ESO | I2C_PCF_STO | I2C_PCF_ACK)
-#define I2C_PCF_REPSTART (              I2C_PCF_ESO | I2C_PCF_STA | I2C_PCF_ACK)
+#define I2C_PCF_REPSTART	       (I2C_PCF_ESO | I2C_PCF_STA | I2C_PCF_ACK)
 #define I2C_PCF_IDLE     (I2C_PCF_PIN | I2C_PCF_ESO               | I2C_PCF_ACK)
 
 /* ----- Status register bits -----------------------------------------	*/
@@ -55,7 +55,7 @@
 
 
 /* ----- Access to internal registers according to ES1,ES2 ------------	*/
-/* they are mapped to the data port ( a0 = 0 ) 				*/
+/* they are mapped to the data port ( a0 = 0 )				*/
 /* available when ESO == 0 :						*/
 
 #define I2C_PCF_OWNADR	0
diff --git a/drivers/i2c/i2c-boardinfo.c b/drivers/i2c/i2c-boardinfo.c
index 4df8ad092df3..89fc7c39efca 100644
--- a/drivers/i2c/i2c-boardinfo.c
+++ b/drivers/i2c/i2c-boardinfo.c
@@ -48,7 +48,7 @@ EXPORT_SYMBOL_GPL(__i2c_first_dynamic_bus_num);
  * The board info passed can safely be __initdata, but be careful of embedded
  * pointers (for platform_data, functions, etc) since that won't be copied.
  */
-int i2c_register_board_info(int busnum, struct i2c_board_info const *info, unsigned len)
+int i2c_register_board_info(int busnum, struct i2c_board_info const *info, unsigned int len)
 {
 	int status;
 
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ecca8c006b02..fb6de30fc3f8 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -749,8 +749,10 @@ static unsigned short i2c_encode_flags_to_addr(struct i2c_client *client)
 	return addr;
 }
 
-/* This is a permissive address validity check, I2C address map constraints
- * are purposely not enforced, except for the general call address. */
+/*
+ * This is a permissive address validity check, I2C address map constraints
+ * are purposely not enforced, except for the general call address.
+ */
 static int i2c_check_addr_validity(unsigned int addr, unsigned short flags)
 {
 	if (flags & I2C_CLIENT_TEN) {
@@ -765,10 +767,12 @@ static int i2c_check_addr_validity(unsigned int addr, unsigned short flags)
 	return 0;
 }
 
-/* And this is a strict address validity check, used when probing. If a
+/*
+ * And this is a strict address validity check, used when probing. If a
  * device uses a reserved address, then it shouldn't be probed. 7-bit
  * addressing is assumed, 10-bit address devices are rare and should be
- * explicitly enumerated. */
+ * explicitly enumerated.
+ */
 int i2c_check_7bit_addr_validity_strict(unsigned short addr)
 {
 	/*
@@ -967,7 +971,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	bool need_put = false;
 	int status;
 
-	client = kzalloc(sizeof *client, GFP_KERNEL);
+	client = kzalloc(sizeof(*client), GFP_KERNEL);
 	if (!client)
 		return ERR_PTR(-ENOMEM);
 
@@ -986,7 +990,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 
 	status = i2c_check_addr_validity(client->addr, client->flags);
 	if (status) {
-		dev_err(&adap->dev, "Invalid %d-bit I2C address 0x%02hx\n",
+		dev_err(&adap->dev, "Invalid %d-bit I2C address 0x%02x\n",
 			client->flags & I2C_CLIENT_TEN ? 10 : 7, client->addr);
 		goto out_err_silent;
 	}
@@ -1234,6 +1238,7 @@ EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
 static void i2c_adapter_dev_release(struct device *dev)
 {
 	struct i2c_adapter *adap = to_i2c_adapter(dev);
+
 	complete(&adap->dev_released);
 }
 
@@ -1315,7 +1320,7 @@ new_device_store(struct device *dev, struct device_attribute *attr,
 	mutex_lock(&adap->userspace_clients_lock);
 	list_add_tail(&client->detected, &adap->userspace_clients);
 	mutex_unlock(&adap->userspace_clients_lock);
-	dev_info(dev, "%s: Instantiated device %s at 0x%02hx\n", "new_device",
+	dev_info(dev, "%s: Instantiated device %s at 0x%02x\n", "new_device",
 		 info.type, info.addr);
 
 	return count;
@@ -1359,7 +1364,7 @@ delete_device_store(struct device *dev, struct device_attribute *attr,
 	list_for_each_entry_safe(client, next, &adap->userspace_clients,
 				 detected) {
 		if (i2c_encode_flags_to_addr(client) == addr) {
-			dev_info(dev, "%s: Deleting device %s at 0x%02hx\n",
+			dev_info(dev, "%s: Deleting device %s at 0x%02x\n",
 				 "delete_device", client->name, client->addr);
 
 			list_del(&client->detected);
@@ -1375,7 +1380,7 @@ delete_device_store(struct device *dev, struct device_attribute *attr,
 			"delete_device");
 	return res;
 }
-static DEVICE_ATTR_IGNORE_LOCKDEP(delete_device, S_IWUSR, NULL,
+static DEVICE_ATTR_IGNORE_LOCKDEP(delete_device, 0200, NULL,
 				  delete_device_store);
 
 static struct attribute *i2c_adapter_attrs[] = {
@@ -1714,8 +1719,10 @@ static void i2c_do_del_adapter(struct i2c_driver *driver,
 {
 	struct i2c_client *client, *_n;
 
-	/* Remove the devices we created ourselves as the result of hardware
-	 * probing (using a driver's detect method) */
+	/*
+	 * Remove the devices we created ourselves as the result of hardware
+	 * probing (using a driver's detect method)
+	 */
 	list_for_each_entry_safe(client, _n, &driver->clients, detected) {
 		if (client->adapter == adapter) {
 			dev_dbg(&adapter->dev, "Removing %s at 0x%x\n",
@@ -1729,6 +1736,7 @@ static void i2c_do_del_adapter(struct i2c_driver *driver,
 static int __unregister_client(struct device *dev, void *dummy)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
+
 	if (client && strcmp(client->name, "dummy"))
 		i2c_unregister_device(client);
 	return 0;
@@ -1737,6 +1745,7 @@ static int __unregister_client(struct device *dev, void *dummy)
 static int __unregister_dummy(struct device *dev, void *dummy)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
+
 	i2c_unregister_device(client);
 	return 0;
 }
@@ -1788,11 +1797,13 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 	}
 	mutex_unlock(&adap->userspace_clients_lock);
 
-	/* Detach any active clients. This can't fail, thus we do not
+	/*
+	 * Detach any active clients. This can't fail, thus we do not
 	 * check the returned value. This is a two-pass process, because
 	 * we can't remove the dummy devices during the first pass: they
 	 * could have been instantiated by real devices wishing to clean
-	 * them up properly, so we give them a chance to do that first. */
+	 * them up properly, so we give them a chance to do that first.
+	 */
 	device_for_each_child(&adap->dev, NULL, __unregister_client);
 	device_for_each_child(&adap->dev, NULL, __unregister_dummy);
 
@@ -1821,8 +1832,10 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 	idr_remove(&i2c_adapter_idr, adap->nr);
 	mutex_unlock(&core_lock);
 
-	/* Clear the device structure in case this adapter is ever going to be
-	   added again */
+	/*
+	 * Clear the device structure in case this adapter is ever going to be
+	 * added again.
+	 */
 	memset(&adap->dev, 0, sizeof(adap->dev));
 }
 EXPORT_SYMBOL(i2c_del_adapter);
@@ -2056,7 +2069,7 @@ EXPORT_SYMBOL(i2c_del_driver);
 /* ------------------------------------------------------------------------- */
 
 struct i2c_cmd_arg {
-	unsigned	cmd;
+	unsigned int	cmd;
 	void		*arg;
 };
 
@@ -2248,6 +2261,7 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	 */
 	if (static_branch_unlikely(&i2c_trace_msg_key)) {
 		int i;
+
 		for (i = 0; i < num; i++)
 			if (msgs[i].flags & I2C_M_RD)
 				trace_i2c_read(adap, &msgs[i], i);
@@ -2271,6 +2285,7 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 
 	if (static_branch_unlikely(&i2c_trace_msg_key)) {
 		int i;
+
 		for (i = 0; i < ret; i++)
 			if (msgs[i].flags & I2C_M_RD)
 				trace_i2c_reply(adap, &msgs[i], i);
@@ -2475,8 +2490,10 @@ static int i2c_detect_address(struct i2c_client *temp_client,
 	info.addr = addr;
 	err = driver->detect(temp_client, &info);
 	if (err) {
-		/* -ENODEV is returned if the detection fails. We catch it
-		   here as this isn't an error. */
+		/*
+		 * -ENODEV is returned if the detection fails. We catch it
+		 * here as this isn't an error.
+		 */
 		return err == -ENODEV ? 0 : err;
 	}
 
@@ -2491,8 +2508,8 @@ static int i2c_detect_address(struct i2c_client *temp_client,
 		/* Detection succeeded, instantiate the device */
 		if (adapter->class & I2C_CLASS_DEPRECATED)
 			dev_warn(&adapter->dev,
-				"This adapter will soon drop class based instantiation of devices. "
-				"Please make sure client 0x%02x gets instantiated by other means. "
+				"This adapter will soon drop class based instantiation of devices."
+				"Please make sure client 0x%02x gets instantiated by other means."
 				"Check 'Documentation/i2c/instantiating-devices.rst' for details.\n",
 				info.addr);
 
@@ -2521,7 +2538,7 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
 	/* Warn that the adapter lost class based instantiation */
 	if (adapter->class == I2C_CLASS_DEPRECATED) {
 		dev_dbg(&adapter->dev,
-			"This adapter dropped support for I2C classes and won't auto-detect %s devices anymore. "
+			"This adapter dropped support for I2C classes and won't auto-detect %s devices anymore."
 			"If you need it, check 'Documentation/i2c/instantiating-devices.rst' for alternatives.\n",
 			driver->driver.name);
 		return 0;
diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index e9577f920286..4320684f81bb 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -1,16 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
-    i2c-dev.c - i2c-bus driver, char device interface
-
-    Copyright (C) 1995-97 Simon G. Vogl
-    Copyright (C) 1998-99 Frodo Looijaard <frodol@dds.nl>
-    Copyright (C) 2003 Greg Kroah-Hartman <greg@kroah.com>
-
-*/
+ *  i2c-dev.c - i2c-bus driver, char device interface
+ *
+ *  Copyright (C) 1995-97 Simon G. Vogl
+ *  Copyright (C) 1998-99 Frodo Looijaard <frodol@dds.nl>
+ *  Copyright (C) 2003 Greg Kroah-Hartman <greg@kroah.com>
+ */
 
 /* Note that this is a complete rewrite of Simon Vogl's i2c-dev module.
-   But I have used so much of his original code and ideas that it seems
-   only fair to recognize him as co-author -- Frodo */
+ * But I have used so much of his original code and ideas that it seems
+ * only fair to recognize him as co-author -- Frodo
+ */
 
 /* The I2C_RDWR ioctl code is written by Kolja Waschk <waschk@telos.de> */
 
@@ -50,7 +50,7 @@ struct i2c_dev {
 static LIST_HEAD(i2c_dev_list);
 static DEFINE_SPINLOCK(i2c_dev_list_lock);
 
-static struct i2c_dev *i2c_dev_get_by_minor(unsigned index)
+static struct i2c_dev *i2c_dev_get_by_minor(unsigned int index)
 {
 	struct i2c_dev *i2c_dev;
 
@@ -222,9 +222,11 @@ static int i2cdev_check_mux_children(struct device *dev, void *addrp)
 	return result;
 }
 
-/* This address checking function differs from the one in i2c-core
-   in that it considers an address with a registered device, but no
-   driver bound to it, as NOT busy. */
+/*
+ * This address checking function differs from the one in i2c-core
+ * in that it considers an address with a registered device, but no
+ * driver bound to it, as NOT busy.
+ */
 static int i2cdev_check_addr(struct i2c_adapter *adapter, unsigned int addr)
 {
 	struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
@@ -241,7 +243,7 @@ static int i2cdev_check_addr(struct i2c_adapter *adapter, unsigned int addr)
 }
 
 static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
-		unsigned nmsgs, struct i2c_msg *msgs)
+		unsigned int nmsgs, struct i2c_msg *msgs)
 {
 	u8 __user **data_ptrs;
 	int i, res;
@@ -297,6 +299,7 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 	}
 	if (res < 0) {
 		int j;
+
 		for (j = 0; j < i; ++j)
 			kfree(msgs[j].buf);
 		kfree(data_ptrs);
@@ -337,8 +340,10 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 			size);
 		return -EINVAL;
 	}
-	/* Note that I2C_SMBUS_READ and I2C_SMBUS_WRITE are 0 and 1,
-	   so the check is valid if size==I2C_SMBUS_QUICK too. */
+	/*
+	 * Note that I2C_SMBUS_READ and I2C_SMBUS_WRITE are 0 and 1,
+	 * so the check is valid if size==I2C_SMBUS_QUICK too.
+	 */
 	if ((read_write != I2C_SMBUS_READ) &&
 	    (read_write != I2C_SMBUS_WRITE)) {
 		dev_dbg(&client->adapter->dev,
@@ -380,8 +385,10 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 			return -EFAULT;
 	}
 	if (size == I2C_SMBUS_I2C_BLOCK_BROKEN) {
-		/* Convert old I2C block commands to the new
-		   convention. This preserves binary compatibility. */
+		/*
+		 * Convert old I2C block commands to the new
+		 * convention. This preserves binary compatibility.
+		 */
 		size = I2C_SMBUS_I2C_BLOCK_DATA;
 		if (read_write == I2C_SMBUS_READ)
 			temp.block[0] = I2C_SMBUS_BLOCK_MAX;
@@ -471,6 +478,7 @@ static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 	case I2C_SMBUS: {
 		struct i2c_smbus_ioctl_data data_arg;
+
 		if (copy_from_user(&data_arg,
 				   (struct i2c_smbus_ioctl_data __user *) arg,
 				   sizeof(struct i2c_smbus_ioctl_data)))
@@ -531,6 +539,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 {
 	struct i2c_client *client = file->private_data;
 	unsigned long funcs;
+
 	switch (cmd) {
 	case I2C_FUNCS:
 		funcs = i2c_get_functionality(client->adapter);
@@ -560,6 +569,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 		p = compat_ptr(rdwr_arg.msgs);
 		for (i = 0; i < rdwr_arg.nmsgs; i++) {
 			struct i2c_msg32 umsg;
+
 			if (copy_from_user(&umsg, p + i, sizeof(umsg))) {
 				kfree(rdwr_pa);
 				return -EFAULT;
@@ -578,6 +588,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	}
 	case I2C_SMBUS: {
 		struct i2c_smbus_ioctl_data32	data32;
+
 		if (copy_from_user(&data32,
 				   (void __user *) arg,
 				   sizeof(data32)))
diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 4d8690981a55..bb692e5bd5f8 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Multiplexed I2C bus driver.
  *
diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index 6bc2ef650a74..92c1b30981d8 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -164,7 +164,7 @@ static int i2c_slave_eeprom_probe(struct i2c_client *client)
 
 	sysfs_bin_attr_init(&eeprom->bin);
 	eeprom->bin.attr.name = "slave-eeprom";
-	eeprom->bin.attr.mode = S_IRUSR | S_IWUSR;
+	eeprom->bin.attr.mode = 0600;
 	eeprom->bin.read = i2c_slave_eeprom_bin_read;
 	eeprom->bin.write = i2c_slave_eeprom_bin_write;
 	eeprom->bin.size = size;
diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 0316b347f9e7..473bd6d681bc 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -468,7 +468,7 @@ static void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled)
 
 		if (!IS_ERR(i2c_new_scanned_device(adap, &info, addr_list, NULL))) {
 			dev_info(&adap->dev,
-				 "Successfully instantiated SPD at 0x%hx\n",
+				 "Successfully instantiated SPD at 0x%x\n",
 				 addr_list[0]);
 			dimm_count--;
 		}
diff --git a/drivers/i2c/i2c-stub.c b/drivers/i2c/i2c-stub.c
index 09e7b7bf4c5f..4c3dd2f2aaf9 100644
--- a/drivers/i2c/i2c-stub.c
+++ b/drivers/i2c/i2c-stub.c
@@ -1,11 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
-    i2c-stub.c - I2C/SMBus chip emulator
-
-    Copyright (c) 2004 Mark M. Hoffman <mhoffman@lightlink.com>
-    Copyright (C) 2007-2014 Jean Delvare <jdelvare@suse.de>
-
-*/
+ * i2c-stub.c - I2C/SMBus chip emulator
+ *
+ * Copyright (c) 2004 Mark M. Hoffman <mhoffman@lightlink.com>
+ * Copyright (C) 2007-2014 Jean Delvare <jdelvare@suse.de>
+ */
 
 #define pr_fmt(fmt) "i2c-stub: " fmt
 
@@ -33,30 +32,30 @@
 		(STUB_FUNC_DEFAULT | I2C_FUNC_SMBUS_BLOCK_DATA)
 
 static unsigned short chip_addr[MAX_CHIPS];
-module_param_array(chip_addr, ushort, NULL, S_IRUGO);
+module_param_array(chip_addr, ushort, NULL, 0444);
 MODULE_PARM_DESC(chip_addr,
 		 "Chip addresses (up to 10, between 0x03 and 0x77)");
 
 static unsigned long functionality = STUB_FUNC_DEFAULT;
-module_param(functionality, ulong, S_IRUGO | S_IWUSR);
+module_param(functionality, ulong, 0644);
 MODULE_PARM_DESC(functionality, "Override functionality bitfield");
 
 /* Some chips have banked register ranges */
 
 static u8 bank_reg[MAX_CHIPS];
-module_param_array(bank_reg, byte, NULL, S_IRUGO);
+module_param_array(bank_reg, byte, NULL, 0444);
 MODULE_PARM_DESC(bank_reg, "Bank register");
 
 static u8 bank_mask[MAX_CHIPS];
-module_param_array(bank_mask, byte, NULL, S_IRUGO);
+module_param_array(bank_mask, byte, NULL, 0444);
 MODULE_PARM_DESC(bank_mask, "Bank value mask");
 
 static u8 bank_start[MAX_CHIPS];
-module_param_array(bank_start, byte, NULL, S_IRUGO);
+module_param_array(bank_start, byte, NULL, 0444);
 MODULE_PARM_DESC(bank_start, "First banked register");
 
 static u8 bank_end[MAX_CHIPS];
-module_param_array(bank_end, byte, NULL, S_IRUGO);
+module_param_array(bank_end, byte, NULL, 0444);
 MODULE_PARM_DESC(bank_end, "Last banked register");
 
 struct smbus_block_data {
@@ -68,8 +67,10 @@ struct smbus_block_data {
 
 struct stub_chip {
 	u8 pointer;
-	u16 words[256];		/* Byte operations use the LSB as per SMBus
-				   specification */
+	u16 words[256];		/*
+				 * Byte operations use the LSB as per SMBus
+				 * specification
+				 */
 	struct list_head smbus_blocks;
 
 	/* For chips with banks, extra registers are allocated dynamically */
-- 
2.43.0


