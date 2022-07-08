Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C350056B68D
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 12:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237498AbiGHKEL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 06:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237443AbiGHKEF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 06:04:05 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5537321E13;
        Fri,  8 Jul 2022 03:04:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,255,1650898800"; 
   d="scan'208";a="125552159"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2022 19:04:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.28])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C3DA54003EB2;
        Fri,  8 Jul 2022 19:03:56 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sven Peter <sven@svenpeter.dev>, Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/2] i2c: Add new driver for Renesas RZ/V2M controller
Date:   Fri,  8 Jul 2022 11:03:48 +0100
Message-Id: <20220708100350.12523-1-phil.edworthy@renesas.com>
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

v4:
 - Multiline comment fix
 - Use GENMASK
 - Fix too many parentheses
 - Better use of sizeof()
 - Move MODULE_DEVICE_TABLE close to use
 - Use pm_runtime_resume_and_get() and check return val
 - Replace NOIRQ_SYSTEM_SLEEP_PM_OPS with SYSTEM_SLEEP_PM_OPS
   so we can use runtime PM in suspend and resume.
v3:
  - dt-binding: Fix example indentation
  driver:
  - Lots of small fixes based on Andy Shevchenko's review
  - Use devm_reset_control_get_shared() instead of devm_reset_control_get() 

v2:
  dt-binding:
  - Use an enum and set the default for clock-frequency
  - Add resets property
  driver:
  - Use the new NOIRQ_SYSTEM_SLEEP_PM_OPS() as suggested by Arnd
  - Lots of small fixes based on Geert's review

Phil Edworthy (2):
  dt-bindings: i2c: Document RZ/V2M I2C controller
  i2c: Add Renesas RZ/V2M controller

 .../bindings/i2c/renesas,rzv2m.yaml           |  80 +++
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-rzv2m.c                | 533 ++++++++++++++++++
 4 files changed, 624 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
 create mode 100644 drivers/i2c/busses/i2c-rzv2m.c

-- 
2.34.1

