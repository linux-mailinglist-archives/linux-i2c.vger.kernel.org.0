Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC8ADA650D
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 11:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfICJWI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 05:22:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:52460 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726946AbfICJWH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 05:22:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C4FBDAC10
        for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2019 09:22:06 +0000 (UTC)
Date:   Tue, 3 Sep 2019 11:22:15 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH 3/7] decode-dimms: Print DDR memory speed in MT/s not MHz
Message-ID: <20190903112215.4fc40aea@endymion>
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

Because it is DDR memory, transaction rate is twice the actual clock
speed. What the user is interested in is MT/s, and that's the number
we display, so use the right unit.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 eeprom/decode-dimms |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- i2c-tools.orig/eeprom/decode-dimms	2019-09-02 11:43:00.090302646 +0200
+++ i2c-tools/eeprom/decode-dimms	2019-09-02 11:47:15.905567693 +0200
@@ -1043,7 +1043,7 @@ sub decode_ddr_sdram($)
 	$pcclk += 100 if ($pcclk % 100) >= 50; # Round properly
 	$pcclk = $pcclk - ($pcclk % 100);
 	$ddrclk = int ($ddrclk);
-	printl("Maximum module speed", "$ddrclk MHz (PC${pcclk})");
+	printl("Maximum module speed", "$ddrclk MT/s (PC${pcclk})");
 
 #size computation
 	my $k = 0;
@@ -1296,7 +1296,7 @@ sub decode_ddr2_sdram($)
 	# Round down to comply with Jedec
 	$pcclk = $pcclk - ($pcclk % 100);
 	$ddrclk = int ($ddrclk);
-	printl("Maximum module speed", "$ddrclk MHz (PC2-${pcclk})");
+	printl("Maximum module speed", "$ddrclk MT/s (PC2-${pcclk})");
 
 #size computation
 	my $k = 0;
@@ -1626,7 +1626,7 @@ sub decode_ddr3_sdram($)
 	# Round down to comply with Jedec
 	$pcclk = $pcclk - ($pcclk % 100);
 	$ddrclk = int ($ddrclk);
-	printl("Maximum module speed", "$ddrclk MHz (PC3-${pcclk})");
+	printl("Maximum module speed", "$ddrclk MT/s (PC3-${pcclk})");
 
 # Size computation
 
@@ -1894,7 +1894,7 @@ sub decode_ddr4_sdram($)
 	# Round down to comply with Jedec
 	$pcclk = $pcclk - ($pcclk % 100);
 	$ddrclk = int ($ddrclk);
-	printl("Maximum module speed", "$ddrclk MHz (PC4-${pcclk})");
+	printl("Maximum module speed", "$ddrclk MT/s (PC4-${pcclk})");
 
 # Size computation
 	my $sdram_width = 4 << ($bytes->[12] & 0x07);

-- 
Jean Delvare
SUSE L3 Support
