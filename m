Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B911D76168
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jul 2019 10:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbfGZI70 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Jul 2019 04:59:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:48688 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725842AbfGZI70 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Jul 2019 04:59:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id ACA13AF21
        for <linux-i2c@vger.kernel.org>; Fri, 26 Jul 2019 08:59:25 +0000 (UTC)
Date:   Fri, 26 Jul 2019 10:59:24 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH] decode-dimms: Round DDR4 speed properly
Message-ID: <20190726105924.0ce38de7@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The cycle time of high-speed memory modules is stored rounded. We
already have a heuristic to un-round it and display the expected
speed for DDR3 modules. Use the same heuristic for DDR4.

For example this will make PC4-17000 memory properly displayed as
operating at 2133 MHz instead of 2132 MHz. As a side effect, this
fixes a bug where the maximum speed wouldn't be listed in section
"Timings at Standard Speeds" if it had been computed incorrectly
due to the rounded cycle time.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 eeprom/decode-dimms |   30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

--- i2c-tools.orig/eeprom/decode-dimms	2019-07-26 10:48:21.964141808 +0200
+++ i2c-tools/eeprom/decode-dimms	2019-07-26 10:49:04.064695751 +0200
@@ -1554,6 +1554,24 @@ use constant DDR3_REGISTERED	=> 2;
 use constant DDR3_CLOCKED	=> 3;
 use constant DDR3_LOAD_REDUCED	=> 4;
 
+sub ddr3_adjust_ctime($$)
+{
+	my ($ctime, $ftb) = @_;
+	my $ii;
+
+	# Starting with DDR3-1866, vendors may start approximating the
+	# minimum cycle time. Try to guess what they really meant so
+	# that the reported speed matches the standard.
+	for ($ii = 7; $ii < 15; $ii++) {
+		if ($ctime > 7.5/$ii - $ftb/1000 && $ctime < 7.5/$ii + $ftb/1000) {
+			$ctime = 7.5/$ii;
+			last;
+		}
+	}
+
+	return $ctime;
+}
+
 # Parameter: EEPROM bytes 0-127 (using 1-68)
 sub decode_ddr3_sdram($)
 {
@@ -1600,15 +1618,7 @@ sub decode_ddr3_sdram($)
 	prints("Memory Characteristics");
 
 	$ctime = ddr3_mtb_ftb($bytes->[12], $bytes->[34], $mtb, $ftb);
-	# Starting with DDR3-1866, vendors may start approximating the
-	# minimum cycle time. Try to guess what they really meant so
-	# that the reported speed matches the standard.
-	for ($ii = 7; $ii < 15; $ii++) {
-		if ($ctime > 7.5/$ii - $ftb/1000 && $ctime < 7.5/$ii + $ftb/1000) {
-			$ctime = 7.5/$ii;
-			last;
-		}
-	}
+	$ctime = ddr3_adjust_ctime($ctime, $ftb);
 
 	my $ddrclk = 2 * (1000 / $ctime);
 	my $tbits = 1 << (($bytes->[8] & 7) + 3);
@@ -1874,7 +1884,9 @@ sub decode_ddr4_sdram($)
 	prints("Memory Characteristics");
 
 	$ctime = ddr4_mtb_ftb($bytes->[18], $bytes->[125], $mtb, $ftb);
+	$ctime = ddr3_adjust_ctime($ctime, $ftb);
 	$ctime_max = ddr4_mtb_ftb($bytes->[19], $bytes->[124], $mtb, $ftb);
+	$ctime_max = ddr3_adjust_ctime($ctime_max, $ftb);
 
 	my $ddrclk = 2 * (1000 / $ctime);
 	my $tbits = 8 << ($bytes->[13] & 7);

-- 
Jean Delvare
SUSE L3 Support
