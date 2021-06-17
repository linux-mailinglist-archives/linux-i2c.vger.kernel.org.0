Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE943AB008
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jun 2021 11:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbhFQJqm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Jun 2021 05:46:42 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:59172 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbhFQJql (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Jun 2021 05:46:41 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 15H9U8Ja024573;
        Thu, 17 Jun 2021 17:30:08 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun
 2021 17:44:31 +0800
From:   Jamin Lin <jamin_lin@aspeedtech.com>
To:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        "Andrew Jeffery" <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
        Mike Rapoport <rppt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Guenter Roeck <linux@roeck-us.net>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
CC:     <chiawei_wang@aspeedtech.com>, <troy_lee@aspeedtech.com>,
        <steven_lee@aspeedtech.com>
Subject: [PATCH 0/3] *** Support ASPEED AST2600 I2C ***
Date:   Thu, 17 Jun 2021 17:43:37 +0800
Message-ID: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15H9U8Ja024573
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Support I2C controller of ASPEED AST2600 and
enable the new register set

Jamin Lin (3):
  dts: aspeed: Add node for AST2600 I2C and I2CS
  dt-bindings: i2c-new: Add bindings for AST2600 I2C
  i2c:support new register set for ast2600

 .../bindings/i2c/aspeed,new-i2c.yaml          |  107 +
 arch/arm/boot/dts/aspeed-g6.dtsi              |  150 +-
 drivers/i2c/busses/Kconfig                    |   11 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/ast2600-i2c-global.c       |  205 ++
 drivers/i2c/busses/ast2600-i2c-global.h       |   25 +
 drivers/i2c/busses/i2c-new-aspeed.c           | 1796 +++++++++++++++++
 7 files changed, 2263 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml
 create mode 100644 drivers/i2c/busses/ast2600-i2c-global.c
 create mode 100644 drivers/i2c/busses/ast2600-i2c-global.h
 create mode 100644 drivers/i2c/busses/i2c-new-aspeed.c

-- 
2.17.1

