Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E02293D7424
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 13:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236471AbhG0LQU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jul 2021 07:16:20 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:49849 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236464AbhG0LQT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jul 2021 07:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1627384580; x=1658920580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DIHrC52ww/DFXbYGSa4kH26VQ4Zgajs7K4hwctr/DEM=;
  b=zegWKPFMTpG+ijmr+n46UP39/VlRbJzNFEx9heeTMlsm5Qh5bHUAHLK2
   ZFEXRbKN9pj7p7i0xeMEhlnsgEoY4GJR3cxIQN+YhmAH5OK+Nl4hNMYBY
   hH7u7oQsW+yTCjG97IxQB/OxbUWxyg3+bcnS2OzNuHxHCtM3WDuwenoRZ
   XV0lT9a/cOy+jj4ng+826pxDUbDv9QGMgLmInqPLmbcbf2GUC3/K2ww2O
   dZjTunA5T1reV5xdmpdePi2LxqnRdpuzSJVnCZ0wrYtkMXe7xBNSbB/p4
   SLb0qzmLyyRHdH9DAm5ZcDcRNLrY6J4T+538yMK7EnDtUx//s0PSGdAG0
   w==;
IronPort-SDR: ifQlh4pBZHI41bhmt8tMXvi0NBnr4VsspB5x0GdhvjKO47O70GfBV1URXo/Dda992r2XhSTQtE
 DjF5hC30TgkR7T9RDzAMSdmq7bQRKGWiGeT3uZxi5LxFmH0rmovoDqkX7yqKAuQOFbYhiLqsro
 2LYf7qd2CRPgAtjY0V318wtgTbvMEYmyXPuFHitx8JsX1IHoZpeX7dmIHpb0QhQ3H9hM7Dwh6s
 NfHSd1e6hXCWF/pSErKfVkOT4GVyKJ0cyJ4mb4zZYorrYJzrOPdBOKeqj5k7lpy4mEvzEPs7vB
 H6K06Eo2i++hiRKmwVDgLECj
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; 
   d="scan'208";a="130528394"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2021 04:16:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Jul 2021 04:16:19 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 27 Jul 2021 04:16:15 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <andrew@sanpeople.com>,
        <mhoffman@lightlink.com>, <khali@linux-fr.org>, <wsa@kernel.org>,
        "Codrin Ciubotariu" <codrin.ciubotariu@microchip.com>
Subject: [PATCH 3/3] i2c: at91: add advanced digital filtering support for SAMA5D4
Date:   Tue, 27 Jul 2021 14:15:54 +0300
Message-ID: <20210727111554.1338832-4-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727111554.1338832-1-codrin.ciubotariu@microchip.com>
References: <20210727111554.1338832-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C/TWI IP variant found in SAMA5D4 supports advanced digital filtering,
even though, at the time of this patch, it is not present in Datasheet.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 drivers/i2c/busses/i2c-at91-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index e14edd236108..7b6dc56d8c1c 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -120,6 +120,7 @@ static struct at91_twi_pdata sama5d4_config = {
 	.clk_offset = 4,
 	.has_hold_field = true,
 	.has_dig_filtr = true,
+	.has_adv_dig_filtr = true,
 };
 
 static struct at91_twi_pdata sama5d2_config = {
-- 
2.30.2

