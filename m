Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07C84787B5
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbhLQJeL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:34:11 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:56762 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234463AbhLQJeE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:34:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639733645; x=1671269645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TDibzwXp0/AuHXb5O6QBcMvGLoIDWdV4nhrP4ikiYgs=;
  b=IcJDN+RGDIVzS9VxUo0YVwzZJaPpUvMkGkMripa+z2MZabshIe5SSnqJ
   IQESsW87UvB6HfglIhN0stn5sSe/31Re2Fr0FZGVpT1kJTUTbbkjAP3Mh
   IDUoUs0olc0wHQJ9Rn+tB5dovDxGzxEAlEktema0KmfBqh58u+VaUe8wJ
   FnLFVgfL4YMgN/yjisbKY2U5v9Opws05QhKK2JB7gTbOhoXFEged+HZI5
   TXayCCe9vhz6hXkxvlW8MNMkJYQWZa4wpfQFpEgqBGoZcLYrrZIqVvVVZ
   k58AaPy289+TCzDWsHF53S2m70ra5BiPTLrieP5mkbfn27ep4i1HrU2iz
   A==;
IronPort-SDR: r1QESrmcOCK5lUf5FF6Gn0Cql1Ju+0e+9pZAOvhWsVIpc52P6vwGhXUymrsWdqF1jX4k/QdndF
 Sy/niIGR57CRxg5z1cy+Nx6swWGhVFT6P4RFjvMFyzx3TvL3T6UO5psIi78fznxYe9q2yzdcpy
 AQ/SWYg0GxxlJgy1IGAmshJykmCdYOlcmUanjXVQTIPsvRWsNpoaccNsP+Idg947VedbAYNMOZ
 rFEtcMMdUtTthvbYj+OHtUwaryWPyPjPgXMhLCSRXX0KHuiqbmvw4k7br64xgN9fXZzAm7ynAC
 JLlvSXfyiW3hjvThwnRZs8P7
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="147002811"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 02:34:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:34:00 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 02:33:54 -0700
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
        <atish.patra@wdc.com>
Subject: [PATCH v2 17/17] MAINTAINERS: update riscv/microchip entry
Date:   Fri, 17 Dec 2021 09:33:25 +0000
Message-ID: <20211217093325.30612-18-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Update the RISC-V/Microchip entry by adding the microchip dts
directory and myself as maintainer

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
2.33.1

