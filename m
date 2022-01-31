Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7C14A4639
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 12:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351721AbiAaLvL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 06:51:11 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:63242 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376700AbiAaLqi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 06:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1643629598; x=1675165598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+uRMhA1+KXMC9lDrbzc/2dceALsFfl6ymRO67+ImIZ8=;
  b=F179MNUPZM2fsMy5wjNEUABHHyk8l1i7vZOkKZP4N2dv46T4fWPPGkZu
   m07rVP01/Fge5zDNHM/xXev3pNGRX2fxSU+21/wgutxOd167eCq4lGG8c
   MYVQaFJ9WF50K6gpK2yG3LXMYBdbsMexa9eLE9TSDOLzRT4AnO6n+//K7
   7tW4Dq/8lT9Wjc+DksQ1k5QIl7ZO/hy+gGGE3gROsmeQZ1MP6F3X9Mgvr
   Qvm3kHtggkj97RRF/HgSokb5K4LFoRqXajNLtD03chdBOhAmqb4Y+PPPB
   cMdJmyEyRsmoILDMyQGCiJ/xMV4zo5oYAUtUOq2L8wl/jhUREFMPbg7UN
   A==;
IronPort-SDR: eajPSZH4pSMNBX4KdOiq8o1PyCBQHxIJ2eFvu6iAjHVHssM7If3nsVEHy5O4csYUG1ycv9gwsu
 3GjRxfWiQGnALyTTWJk2Kt1TKcVE9qKOxuC4UiDqeOelPKvogG53n01YMBIvBX5ZyXfCoB0jBi
 d93t6wVH4MHczqlfJwi+Hxpk/6/XjjhJ9Z/vEuqMob0IbGRKrkhXqjiYmFmtGfjxUBvuzBWiDJ
 vDN8nS8rTTkRY4+DMYVdRRqGRSMf0Elvg1AxO+XG0T9zqlGoas/D2641PfwOJGRrMbEs5sA1Ch
 TJEJVYB8u1pm/qg/7CPC0k5U
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="151966756"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jan 2022 04:46:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:46:36 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 31 Jan 2022 04:46:31 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
        <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
CC:     <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
        <heiko@sntech.de>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <ivan.griffin@microchip.com>, <atishp@rivosinc.com>
Subject: [PATCH v5 12/12] MAINTAINERS: update riscv/microchip entry
Date:   Mon, 31 Jan 2022 11:47:27 +0000
Message-ID: <20220131114726.973690-13-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131114726.973690-1-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
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
index ea3e6c914384..779a550dc95b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16575,8 +16575,10 @@ K:	riscv
 
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
2.35.0

