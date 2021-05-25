Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDD6390276
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 15:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbhEYN3U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 09:29:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:39844 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233277AbhEYN2c (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 09:28:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1621949221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=rmIbVowxR5z0QlnZdfXQKJmhoByK1jxzvDkoCxnjiZ8=;
        b=JzBWTO17CvM6OUxmuH1V8HFDZeXWl6dJ30j9CL0BxPBemp++IM8FdxeL67scBBXsRU0TDp
        86c3Sjour4905zOjT5XNErcCYZdcqIA09ECocIjb0Si1Gr42k/ODjHMy+piwWnwxc73qUx
        udfZDnx3Kxe6SQppprA3PvANeJ8anTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1621949221;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=rmIbVowxR5z0QlnZdfXQKJmhoByK1jxzvDkoCxnjiZ8=;
        b=D/DqrV6EkbIjxJU+CnLOouDJO39Xeqj4lnL5wwFW152+0erEy7MbKmdWGCoQELD3YRvZ/o
        p1vp7kbDP1IUD+DA==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 204A4AF23
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 13:27:01 +0000 (UTC)
Date:   Tue, 25 May 2021 15:26:59 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH] decode-dimms: Actually decode LPDDR3 modules
Message-ID: <20210525152659.44d529f7@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In commit 78ed68308b58 ("decode-dimms: Decode manufacturing data for
LPDDR3") we said we would handle LPDDR3 the same as DDR3, however it
was actually only done for the manufacturing data. Extend the idea to
the rest of the data.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
Note: I can't test this.

 eeprom/decode-dimms |    1 +
 1 file changed, 1 insertion(+)

--- i2c-tools.orig/eeprom/decode-dimms	2020-09-22 10:01:57.020646204 +0200
+++ i2c-tools/eeprom/decode-dimms	2021-05-25 15:08:05.986521469 +0200
@@ -2177,6 +2177,7 @@ sub decode_rambus($)
 	"DDR SDRAM"	=> \&decode_ddr_sdram,
 	"DDR2 SDRAM"	=> \&decode_ddr2_sdram,
 	"DDR3 SDRAM"	=> \&decode_ddr3_sdram,
+	"LPDDR3 SDRAM"	=> \&decode_ddr3_sdram,
 	"DDR4 SDRAM"	=> \&decode_ddr4_sdram,
 	"DDR4E SDRAM"	=> \&decode_ddr4_sdram,
 	"LPDDR4 SDRAM"	=> \&decode_ddr4_sdram,


-- 
Jean Delvare
SUSE L3 Support
