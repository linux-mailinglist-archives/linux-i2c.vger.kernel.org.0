Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D235EA6508
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 11:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfICJU4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 05:20:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:52032 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726452AbfICJUz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 05:20:55 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id DCA58AC10
        for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2019 09:20:54 +0000 (UTC)
Date:   Tue, 3 Sep 2019 11:21:03 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH 1/7] decode-dimms: Detect and report truncated input files
Message-ID: <20190903112103.57c83378@endymion>
In-Reply-To: <20190903111706.43f9bc2b@endymion>
References: <20190903111706.43f9bc2b@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If using the wrong driver, or if reading from a truncated dump file,
make sure we don't attempt to use data bytes beyond what is
available. Doing so would spit pages of cryptic warnings to the user,
explicit error messages are much better.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 eeprom/decode-dimms |   28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

--- i2c-tools.orig/eeprom/decode-dimms	2019-09-03 10:35:58.809347741 +0200
+++ i2c-tools/eeprom/decode-dimms	2019-09-03 11:08:31.291140716 +0200
@@ -5,7 +5,7 @@
 # Copyright 1998, 1999 Philip Edelbrock <phil@netroedge.com>
 # modified by Christian Zuckschwerdt <zany@triq.net>
 # modified by Burkart Lingner <burkart@bollchen.de>
-# Copyright (C) 2005-2017  Jean Delvare <jdelvare@suse.de>
+# Copyright (C) 2005-2019  Jean Delvare <jdelvare@suse.de>
 #
 #    This program is free software; you can redistribute it and/or modify
 #    it under the terms of the GNU General Public License as published by
@@ -2362,9 +2362,13 @@ sub spd_sizes($)
 sub readspd($$$)
 {
 	my ($offset, $size, $dimm_i) = @_;
-	my @bytes;
+	my (@bytes, $read);
 	if ($use_hexdump) {
 		@bytes = read_hexdump($dimm_i);
+		if (@bytes < $offset + $size) {
+			print STDERR "WARNING: Dump file $dimm_i is truncated\n";
+			$size = @bytes - $offset;
+		}
 		return @bytes[$offset..($offset + $size - 1)];
 	} elsif ($use_sysfs) {
 		# Kernel 2.6 with sysfs
@@ -2373,9 +2377,12 @@ sub readspd($$$)
 		binmode HANDLE;
 		sysseek(HANDLE, $offset, SEEK_SET)
 			or die "Cannot seek $dimm_i/eeprom";
-		sysread(HANDLE, my $eeprom, $size)
-			or die "Cannot read $dimm_i/eeprom";
+		$read = sysread(HANDLE, my $eeprom, $size)
+				or die "Cannot read $dimm_i/eeprom";
 		close HANDLE;
+		if ($read < $size) {
+			print STDERR "WARNING: $dimm_i/eeprom is smaller than expected\n";
+		}
 		@bytes = unpack("C*", $eeprom);
 	} else {
 		# Kernel 2.4 with procfs
@@ -2666,11 +2673,14 @@ for $current (0 .. $#dimm) {
 		printl("Total number of bytes in EEPROM", $spd_size);
 
 		# If there's more data than what we've read, let's
-		# read it now.  DDR3 will need this data.
+		# read it now.  DDR3 and DDR4 will need this data.
 		if ($spd_used > @bytes) {
 			push (@bytes,
 			      readspd(@bytes, $spd_used - @bytes,
 				      $dimm[$current]->{file}));
+			if (@bytes < $spd_used) {
+				print STDERR "WARNING: Fewer data bytes available (".(scalar @bytes).") than needed ($spd_used)\n";
+			}
 		}
 	}
 
@@ -2703,14 +2713,18 @@ for $current (0 .. $#dimm) {
 	if ($type eq "DDR3 SDRAM") {
 		# Decode DDR3-specific manufacturing data in bytes
 		# 117-149
-		decode_ddr3_mfg_data(\@bytes)
+		if (@bytes >= 150) {
+			decode_ddr3_mfg_data(\@bytes)
+		}
 	} elsif ($type eq "DDR4 SDRAM" ||
 		 $type eq "DDR4E SDRAM" ||
 		 $type eq "LPDDR4 SDRAM" ||
 		 $type eq "LPDDR4X SDRAM") {
 		# Decode DDR4-specific manufacturing data in bytes
 		# 320-383
-		decode_ddr4_mfg_data(\@bytes)
+		if (@bytes >= 384) {
+			decode_ddr4_mfg_data(\@bytes);
+		}
 	} else {
 		# Decode next 35 bytes (64-98, common to most
 		# memory types)

-- 
Jean Delvare
SUSE L3 Support
