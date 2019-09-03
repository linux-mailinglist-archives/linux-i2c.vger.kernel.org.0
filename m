Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E50DCA650E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 11:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfICJWj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 05:22:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:52792 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726946AbfICJWi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 05:22:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E9104AC10
        for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2019 09:22:37 +0000 (UTC)
Date:   Tue, 3 Sep 2019 11:22:46 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH 4/7] decode-dimms: Add DDR5 memory types to the list
Message-ID: <20190903112246.3702690b@endymion>
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

No information available yet about the contents of the DDR5 SPD
EEPROMs but we can already report the basic memory type.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 eeprom/decode-dimms |    1 +
 1 file changed, 1 insertion(+)

--- i2c-tools.orig/eeprom/decode-dimms	2019-09-03 10:18:12.983813689 +0200
+++ i2c-tools/eeprom/decode-dimms	2019-09-03 10:29:53.609710368 +0200
@@ -2707,6 +2707,7 @@ for $current (0 .. $#dimm) {
 			"DDR4 SDRAM", "Reserved",	# 12, 13
 			"DDR4E SDRAM", "LPDDR3 SDRAM",	# 14, 15
 			"LPDDR4 SDRAM", "LPDDR4X SDRAM", # 16, 17
+			"DDR5 SDRAM", "LPDDR5 SDRAM",	# 18, 19
 		);
 		if ($bytes[2] < @type_list) {
 			$type = $type_list[$bytes[2]];

-- 
Jean Delvare
SUSE L3 Support
