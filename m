Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D73E845D3B
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 14:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfFNM6W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 08:58:22 -0400
Received: from smtp3-g21.free.fr ([212.27.42.3]:19632 "EHLO smtp3-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfFNM6W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 08:58:22 -0400
Received: from localhost.localdomain (unknown [87.90.123.9])
        (Authenticated sender: fcartegnie)
        by smtp3-g21.free.fr (Postfix) with ESMTPSA id 92FFC13F846;
        Fri, 14 Jun 2019 14:58:17 +0200 (CEST)
From:   Francois Cartegnie <fcvlcdev@free.fr>
To:     linux-i2c@vger.kernel.org
Cc:     Francois Cartegnie <fcvlcdev@free.fr>
Subject: [PATCH] decode-dimms: display MAC from DDR3 SPD
Date:   Fri, 14 Jun 2019 14:58:14 +0200
Message-Id: <20190614125814.22260-1-fcvlcdev@free.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

JEDEC Standard No. 21-C, Annex K, Release 6

Byte 41 is specified, the lower part containing
the MAC value, identical as DDR4.
---
 eeprom/decode-dimms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms
index b976442..2c33f0b 100755
--- a/eeprom/decode-dimms
+++ b/eeprom/decode-dimms
@@ -1703,6 +1703,12 @@ sub decode_ddr3_sdram($)
 		tns3($bytes->[27] * $mtb));
 	printl("Minimum Four Activate Window Delay (tFAW)",
 		tns3(((($bytes->[28] & 15) << 8) + $bytes->[29]) * $mtb));
+# other information
+        my @mac = ("Untested",
+                   "700 K", "600 K", "500 K", "400 K", "300 K", "200 K",
+                   undef, "Unlimited");
+        my $mac = $bytes->[41] & 0x0f;
+        printl_cond(defined $mac[$mac], "Maximum Active Count (MAC)", $mac[$mac]);
 
 # miscellaneous stuff
 	prints("Optional Features");
-- 
2.20.1

