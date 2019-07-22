Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6119570943
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 21:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730737AbfGVTF7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 15:05:59 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:13453 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729279AbfGVTF6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 15:05:58 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45srdK1xtXzB2;
        Mon, 22 Jul 2019 21:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1563822277; bh=Cd3CPBPhmGi+2cKdFvDUz5gG7fKm3chTraQURpZnwRA=;
        h=Date:From:Subject:To:Cc:From;
        b=TUlYahmDPhDDHyHpvn5I49ktBx99mMllQDukA4TYCFRnnAsLxSC78zGajWU1954fI
         eUPuEK75Cx9UAQlCj1vOypTNebL12EV0b8Fg6F2ikayAR/H5cTQ6oaly0XHsATu8Dn
         HvtHrsAdyvobx11zkghZqZcwQA3EeoWndPpE8IHH78mOvmnP6dPrBDU/8ytBw+Ac1L
         xP3BkEZ/Ui9bZYOnzoqNN+HcshGw326h5FJCkzjBDTRLbmGnec1zgq6pDvJyK8dvB6
         TGutGDqhvZ0mYrm482q8tVp09AsfATF6Froi4B3v5jiiHCjETCdQXCFtDsLgZDhuj5
         Ep97vv9esAc0A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Mon, 22 Jul 2019 21:05:56 +0200
Message-Id: <90b284b92b1ce27a682526db8a8c5e6dc5eeb5f6.1563822220.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] i2c: at91: fix clk_offset for sama5d2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-i2c@vger.kernel.org
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Cyrille Pitchen <cyrille.pitchen@atmel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In SAMA5D2 datasheet, TWIHS_CWGR register rescription mentions clock
offset of 3 cycles (compared to 4 in eg. SAMA5D3).

Cc: stable@vger.kernel.org # 5.2.x
[needs applying to i2c-at91.c instead for earlier kernels]
Fixes: 0ef6f3213dac ("i2c: at91: add support for new alternative command mode")
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/i2c/busses/i2c-at91-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index 8d55cdd69ff4..435c7d7377a3 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -142,7 +142,7 @@ static struct at91_twi_pdata sama5d4_config = {
 
 static struct at91_twi_pdata sama5d2_config = {
 	.clk_max_div = 7,
-	.clk_offset = 4,
+	.clk_offset = 3,
 	.has_unre_flag = true,
 	.has_alt_cmd = true,
 	.has_hold_field = true,
-- 
2.20.1

