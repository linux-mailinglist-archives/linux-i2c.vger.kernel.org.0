Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B2F2574FC
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 10:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgHaIJX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 04:09:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:50724 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726244AbgHaIJV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Aug 2020 04:09:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 0018CAC85;
        Mon, 31 Aug 2020 08:09:54 +0000 (UTC)
Date:   Mon, 31 Aug 2020 10:09:19 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 3/3] decode-vaio: Scan more i2c buses
Message-ID: <20200831100919.519f66a6@endymion>
In-Reply-To: <20200831100256.077ce253@endymion>
References: <20200831100256.077ce253@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While the laptop I originally developed decode-vaio on, only had 5 i2c
buses, there could be more on other models, and there are definitely
more on the system I use to test the script (using i2c-stub) these
days. So look for the VAIO EEPROM on up to 32 i2c buses to be on the
safe side.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 eeprom/decode-vaio |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Changes since v1: New.

--- i2c-tools.orig/eeprom/decode-vaio	2020-08-31 09:50:38.961927999 +0200
+++ i2c-tools/eeprom/decode-vaio	2020-08-31 09:51:02.085179645 +0200
@@ -237,7 +237,7 @@ END
 	print("\n");
 }
 
-for (my $i = 0, $found=0; $i <= 4 && !$found; $i++)
+for (my $i = 0, $found=0; $i <= 31 && !$found; $i++)
 {
 	if (-r "/sys/bus/i2c/devices/$i-0057/eeprom")
 	{

-- 
Jean Delvare
SUSE L3 Support
