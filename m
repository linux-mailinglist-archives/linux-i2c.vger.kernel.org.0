Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1E1A650F
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 11:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfICJXR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 05:23:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:53126 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727077AbfICJXR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 05:23:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 89559AC10
        for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2019 09:23:16 +0000 (UTC)
Date:   Tue, 3 Sep 2019 11:23:24 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH 5/7] decode-dimms: Decode manufacturing data for LPDDR3
Message-ID: <20190903112324.7466e21b@endymion>
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

I assume the manufacturing data format for LPDDR3 is the same as
regular DDR3.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 eeprom/decode-dimms |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- i2c-tools.orig/eeprom/decode-dimms	2019-09-03 10:29:53.609710368 +0200
+++ i2c-tools/eeprom/decode-dimms	2019-09-03 10:33:56.479794382 +0200
@@ -2719,7 +2719,8 @@ for $current (0 .. $#dimm) {
 	$decode_callback{$type}->(\@bytes)
 		if exists $decode_callback{$type};
 
-	if ($type eq "DDR3 SDRAM") {
+	if ($type eq "DDR3 SDRAM" ||
+	    $type eq "LPDDR3 SDRAM") {
 		# Decode DDR3-specific manufacturing data in bytes
 		# 117-149
 		if (@bytes >= 150) {

-- 
Jean Delvare
SUSE L3 Support
