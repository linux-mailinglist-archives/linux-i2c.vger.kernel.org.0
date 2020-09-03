Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3563825BE01
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 11:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgICJA5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 05:00:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:36946 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726268AbgICJA5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Sep 2020 05:00:57 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 16AE8AC4C;
        Thu,  3 Sep 2020 09:00:56 +0000 (UTC)
Date:   Thu, 3 Sep 2020 11:00:54 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     David Jedynak <sileasresearch@gmail.com>
Subject: [PATCH] i2cset: Fix short writes with mask
Message-ID: <20200903110054.52a3a69f@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Short writes used "daddress" for the value, but the masking code did
not expect that, and instead applied the mask to a variable that was
never used.

So change short writes to use "value" for the value, as all other
commands do. Adjust all code paths accordingly.

Reported by David Jedynak.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
I was finally able to give this some (convoluted) testing using
i2c-stub, so it's about time to get this fix merged.

 tools/i2cset.c |   25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

--- i2c-tools.orig/tools/i2cset.c	2020-08-03 16:27:42.557814067 +0200
+++ i2c-tools/tools/i2cset.c	2020-09-03 10:32:40.842931585 +0200
@@ -125,11 +125,11 @@ static int confirm(const char *filename,
 	}
 
 	fprintf(stderr, "I will write to device file %s, chip address "
-		"0x%02x, data address\n0x%02x, ", filename, address, daddress);
-	if (size == I2C_SMBUS_BYTE)
-		fprintf(stderr, "no data.\n");
-	else if (size == I2C_SMBUS_BLOCK_DATA ||
-		 size == I2C_SMBUS_I2C_BLOCK_DATA) {
+		"0x%02x,\n", filename, address);
+	if (size != I2C_SMBUS_BYTE)
+		fprintf(stderr, "data address 0x%02x, ", daddress);
+	if (size == I2C_SMBUS_BLOCK_DATA ||
+	    size == I2C_SMBUS_I2C_BLOCK_DATA) {
 		int i;
 
 		fprintf(stderr, "data");
@@ -140,7 +140,7 @@ static int confirm(const char *filename,
 	} else
 		fprintf(stderr, "data 0x%02x%s, mode %s.\n", value,
 			vmask ? " (masked)" : "",
-			size == I2C_SMBUS_BYTE_DATA ? "byte" : "word");
+			size == I2C_SMBUS_WORD_DATA ? "word" : "byte");
 	if (pec)
 		fprintf(stderr, "PEC checking enabled.\n");
 
@@ -264,6 +264,10 @@ int main(int argc, char *argv[])
 
 	/* read values from command line */
 	switch (size) {
+	case I2C_SMBUS_BYTE:
+		/* short write: data address was not really data address */
+		value = daddress;
+		break;
 	case I2C_SMBUS_BYTE_DATA:
 	case I2C_SMBUS_WORD_DATA:
 		value = strtol(argv[flags+4], &end, 0);
@@ -344,12 +348,10 @@ int main(int argc, char *argv[])
 
 		if (!yes) {
 			fprintf(stderr, "Old value 0x%0*x, write mask "
-				"0x%0*x: Will write 0x%0*x to register "
-				"0x%02x\n",
+				"0x%0*x, will write 0x%0*x\n",
 				size == I2C_SMBUS_WORD_DATA ? 4 : 2, oldvalue,
 				size == I2C_SMBUS_WORD_DATA ? 4 : 2, vmask,
-				size == I2C_SMBUS_WORD_DATA ? 4 : 2, value,
-				daddress);
+				size == I2C_SMBUS_WORD_DATA ? 4 : 2, value);
 
 			fprintf(stderr, "Continue? [Y/n] ");
 			fflush(stderr);
@@ -369,7 +371,7 @@ int main(int argc, char *argv[])
 
 	switch (size) {
 	case I2C_SMBUS_BYTE:
-		res = i2c_smbus_write_byte(file, daddress);
+		res = i2c_smbus_write_byte(file, value);
 		break;
 	case I2C_SMBUS_WORD_DATA:
 		res = i2c_smbus_write_word_data(file, daddress, value);
@@ -407,7 +409,6 @@ int main(int argc, char *argv[])
 	switch (size) {
 	case I2C_SMBUS_BYTE:
 		res = i2c_smbus_read_byte(file);
-		value = daddress;
 		break;
 	case I2C_SMBUS_WORD_DATA:
 		res = i2c_smbus_read_word_data(file, daddress);


-- 
Jean Delvare
SUSE L3 Support
