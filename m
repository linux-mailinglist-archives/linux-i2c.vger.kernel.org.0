Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB2E568B07
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 16:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbiGFONw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 10:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbiGFONv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 10:13:51 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBC61AF29;
        Wed,  6 Jul 2022 07:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657116830; x=1688652830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GLIOOdGeVnPQ6/dJKcYgkaTGFXv/BDSQ4KyNFEOI2kc=;
  b=dRKQ49ApIkhGoEYdq7XXjsHJib8hFNFX27+sathEhMKYKlJrijmrzIjH
   dirJVmE0vo1YUQSAUIoU0BOmDfaSoHb9s2RGRpkGqM7kVzP6yLlyUdNjT
   e4oUX9rneuXygMfdz4z6r/yp561OcCzJ/ZmVQ3Kxhu2E4dG5TrC9xV1Dx
   zzmcJVn70b7GGmdOV4E0Z6Gt3CbGNI7Svq+Y7opBS8VgTfW7YGFwW8QoR
   KerH/0P7VzfGheYjxnz6ZXNgTqi1YWD/sLyL26O7IB5MecJYgBMMDGzmC
   pXfJU5KIcSHTXtd3cF6RStsTW16wlvcdTzHzoFuPwcD/7spWlLZ1i+89u
   A==;
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; 
   d="scan'208";a="180992568"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 07:13:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 07:13:49 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Jul 2022 07:13:47 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <ben.dooks@codethink.co.uk>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
        <conor.dooley@microchip.com>
Subject: [PATCH v7 2/2] MAINTAINERS: add the polarfire soc's i2c driver
Date:   Wed, 6 Jul 2022 15:13:15 +0100
Message-ID: <20220706141313.2504237-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706141313.2504237-1-conor.dooley@microchip.com>
References: <20220706141313.2504237-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the newly added i2c controller driver to the existing entry for
PolarFire SoC.

Acked-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v6:
I rebased this on next-20220706 & it went through without a
conflict. I'll bump it after mw1.

New in v6.
FYI: I have several maintainers updates in flight - usb, pwm, spi
of which some will be in 5.20 & clk/hwrng/pci that are likely to
go into 5.19-rcN.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d64d79eb36a2..3286b727c90b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17428,6 +17428,7 @@ M:	Conor Dooley <conor.dooley@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
+F:	drivers/i2c/busses/i2c-microchip-core.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/rtc/rtc-mpfs.c
 F:	drivers/soc/microchip/
-- 
2.36.1

