Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A628559787
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 12:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbiFXKRs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 06:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbiFXKRr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 06:17:47 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9D1157B346;
        Fri, 24 Jun 2022 03:17:46 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,218,1650898800"; 
   d="scan'208";a="125546249"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jun 2022 19:17:46 +0900
Received: from localhost.localdomain (unknown [10.226.93.68])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2C024400C0A6;
        Fri, 24 Jun 2022 19:17:39 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sven Peter <sven@svenpeter.dev>, Jie Deng <jie.deng@intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] i2c: Add new driver for Renesas RZ/V2M controller
Date:   Fri, 24 Jun 2022 11:17:34 +0100
Message-Id: <20220624101736.27217-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

The Renesas RZ/V2M SoC (r9a09g011) has a new i2c controller. This series
add the driver. One annoying problem is that the SoC uses a single reset
line for two i2c controllers, and unfortunately one of the controllers
is managed by some firmware, not by Linux. Therefore, the driver just
deasserts the reset.

Phil Edworthy (2):
  dt-bindings: i2c: Document RZ/V2M I2C controller
  i2c: Add Renesas RZ/V2M controller

 .../bindings/i2c/renesas,rzv2m.yaml           |  76 +++
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-rzv2m.c                | 530 ++++++++++++++++++
 4 files changed, 617 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
 create mode 100644 drivers/i2c/busses/i2c-rzv2m.c

-- 
2.34.1

