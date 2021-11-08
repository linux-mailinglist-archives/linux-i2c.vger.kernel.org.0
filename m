Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1B94497D4
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240704AbhKHPLq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:11:46 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:23991 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240863AbhKHPKf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636384072; x=1667920072;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zstF7h07gTp/nSKCbQQYFsltrxG1f82P+gEsZAQgpqk=;
  b=02kxndMFCiYXF30RPQQL+JnxhzfbfJ3vsL3k/li9U0rExwve71qJ9+ys
   hGdlgZl2yXj7ydkam6b6BVN+ouOnQm7UgMFQaqA2iadowR88L4knZu6Yi
   OdKELw5x8Nbw0Dg3rZ9WwuMCO8ZZ4k2rl9fV+NL9FrKKL+bHT0iv2HJ0V
   heUB7Qnvcy7qz/7L7CO6OLTlyO/+UA3FYQSg1niVfu2080xXqoigtW6Je
   8KpF+lNMpWiUi2RQdwRDb2JkbmKfphzvJwcZYfFVpg5nRO1OiHpG5/BW4
   9GwHFi2hGG23Ldx917Ldg/TjQQdkGbiLuF5a3ntKNRjcxORp3BYVNTCTC
   A==;
IronPort-SDR: Eogmog9AAXgm4HnCJJNC5JQfchpBBEOXSO9Szw9Yd6IV1QVflnJrLHXeS92sou3QG5r9z3DAb0
 u/vPYB9PXTmDijeXfeSAE9Hw4D4QxiXyUiKC9SwSKVmc1uAhYqH7vf8zdmGoYTggva0kJsP7WW
 xE6IUll8rSK8YEXhlMRqt23eNZIlsvjl8CCURx7fsPBrrnRdUJfG8wKqpwRsLOg34SZRx07PTB
 7qRZ86+1cqR97sBJlnGgEoxG+SNGDATG2j6o5Iz8k1VKg4t6bzGcO1bfWINExTZ8NeOfVpmOcA
 yK/txlrGNY6Mc976wnSszjAU
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="138382872"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 08:07:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:49 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 08:07:45 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <bin.meng@windriver.com>
Subject: [PATCH 13/13] MAINTAINERS: update riscv/microchip entry
Date:   Mon, 8 Nov 2021 15:05:54 +0000
Message-ID: <20211108150554.4457-14-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Update the riscv/microchip entry by adding the microchip dts
directory and myself as maintainer

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ca6d6fde85cf..a0000ddd02fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16077,8 +16077,10 @@ K:	riscv
 
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
2.33.1

