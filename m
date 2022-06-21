Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F23D552C47
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 09:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346353AbiFUHop (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jun 2022 03:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347477AbiFUHo2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jun 2022 03:44:28 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA67223BEA;
        Tue, 21 Jun 2022 00:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655797467; x=1687333467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ga0yI8b3nFUJ/A1nAFDaHWb+WYFb6o6Ncf2niaqtUg8=;
  b=pgxHedHjqanp+mm9guBT3gqsqzXv2jXJQ3qVuO1hj8z5qYwjWM8I8SJy
   S24qQslAWKhBYdOkGycP7eOOc5VecESMyzfptgnwOW7r8jJq9EndMUujF
   a84/kdmYxRHTDEPxZS2mQtU7+njxapC8/9BgpL6dEMG2iAFJfAqurkQL+
   LTSMcz4Ucn5Ec3NTCChxC2b10u+qz71Bh9FFAJV8YiHrjHXFtO1BOwQKM
   pdFhytuGOkSRnspHbi8mHPVmfETAGluvtMxX+IpSaL8MUhjt6pVqLmGUz
   C6hpWqY7WhofW3hfbKAMaMGDoll8xWCsEQTUkVxAfIHa/EhfG3vr+sFmI
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="164318494"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jun 2022 00:44:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 21 Jun 2022 00:44:23 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 21 Jun 2022 00:44:21 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <ben.dooks@codethink.co.uk>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
        <conor.dooley@microchip.com>
Subject: [PATCH v6 2/2] MAINTAINERS: add the polarfire soc's i2c driver
Date:   Tue, 21 Jun 2022 08:42:39 +0100
Message-ID: <20220621074238.957177-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621074238.957177-1-conor.dooley@microchip.com>
References: <20220621074238.957177-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
New in v6.
FYI: I have several maintainers updates in flight - usb, pwm, spi
of which some will be in 5.20 & clk/hwrng/pci that are likely to
go into 5.19-rcN.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..90de65041863 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17141,6 +17141,7 @@ M:	Conor Dooley <conor.dooley@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
+F:	drivers/i2c/busses/i2c-microchip-core.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
-- 
2.36.1

