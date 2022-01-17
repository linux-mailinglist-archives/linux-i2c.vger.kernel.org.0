Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 449B74906E9
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jan 2022 12:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238986AbiAQLHz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jan 2022 06:07:55 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:32607 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239042AbiAQLHg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jan 2022 06:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642417656; x=1673953656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=raOPInPiNpoFYNkwMgusjdwrbKTRJG+aT7u9K7/NxHA=;
  b=PrRtaNyvB1l0h/lcVCJvnrTlfQojEUEG3/3WVP13yiUkZYua6HKlMj3G
   5k9j746k6ArNA/hpHO56z8POyiqL4qCLYqbILpxDl3qGTd+3qp2I2s8X4
   UEgZpgrmGqljag7zPqt8qcgM9rEQL2dX2YJzcO1C7mFsK66lMSkU9oCty
   dtwz4eNWIcZSWNultub+amsX/ioOCe1cMYhVRY3IflYrcEy+9YR0gOLz3
   trSIFZqeXijWZMF3LWG5eV7Pw6XrJGTioT5sAL0Ho5j9gE89v889+qNGw
   I3nfrQGSmi3vtBbG2iJ1BvnvFZsKAVB/uBNqbR4tAyPgwQN7n1Ne0O7EI
   Q==;
IronPort-SDR: clx4kXulV/hl1fhZNSCkkRx6Q3CJkydF81k9mB8VgXBu8o/nVioQd0YPDB3T2liYtjdGP4jkgD
 NrsNtGRkZqGof2/nNmZfVkVoO8cJWE7nZZLi1iNMhuhQJscRA2E+OkcQHpFIaD27XQcEqJR+6R
 j8VUn5LJPybwtBqKGXFWmIhHCn/SwlN5cMKskRwhh5iVk/9wX/x582Mwo0IEzvuErdIDP+nN2g
 RgAhA9hDH/TivmO0dZvkP6xqdVaSb06gve7v7tV/TQCkWA9sA7m0Nxddyu5si7u5vJwYNgPvLK
 aTJtEiED40TZ84qJ/CInHeYb
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="82713616"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jan 2022 04:07:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 17 Jan 2022 04:07:28 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 17 Jan 2022 04:07:23 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>, <heiko@sntech.de>,
        <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
        <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
        <atishp@rivosinc.com>
Subject: [PATCH v4 14/14] MAINTAINERS: update riscv/microchip entry
Date:   Mon, 17 Jan 2022 11:07:55 +0000
Message-ID: <20220117110755.3433142-15-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117110755.3433142-1-conor.dooley@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Update the RISC-V/Microchip entry by adding the microchip dts
directory and myself as maintainer

Reviewed-by: Lewis Hanly <lewis.hanly@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2345ce8521..3b1d6be7bd56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16348,8 +16348,10 @@ K:	riscv
 
 RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
 M:	Lewis Hanly <lewis.hanly@microchip.com>
+M:	Conor Dooley <conor.dooley@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
-- 
2.32.0

