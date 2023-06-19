Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4003F735697
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 14:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjFSMW0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 08:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjFSMWY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 08:22:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E11D7DB;
        Mon, 19 Jun 2023 05:22:23 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73DD9547;
        Mon, 19 Jun 2023 14:21:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687177308;
        bh=2FWS4cERZu71iRk319OUTrszXLYNV4laX9KC2uKVblA=;
        h=From:To:Cc:Subject:Date:From;
        b=YJgd47V8Ex63HMLXpxv5XRaFTFSI7ZM6f0+3xuNYp67/iosFlQFqjM+3pqaJri76y
         1fyo3gCPPVJ851SeUkyw8xBTPFpRlA/FJLrOGI+pQGoWXpw1gm9PZP8sCqkU7mZ1oz
         pxqyFfvYPRdPN8pu1njOja19aYTkzfXGEcXerqr4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v15 0/8] i2c-atr and FPDLink
Date:   Mon, 19 Jun 2023 15:22:04 +0300
Message-Id: <20230619122212.304962-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

You can find v14 from:

https://lore.kernel.org/all/20230616135922.442979-1-tomi.valkeinen@ideasonboard.com/

In v15 I have squashed the following fix patches from v14:

  media: i2c: ds90ub960: Fix use of UB960_SR_FWD_CTL1
  media: i2c: ds90ub9xx: Add COMMON_CLK kconfig dependency
  media: i2c: ds90ub9xx: Select GPIOLIB rather than OF_GPIO

and I have dropped the rest of the "extra" cleanup / feature patches in
the series. The aim here is to get the base driver merged. I will
continue working on the dropped patches and will post them at some point
later.

 Tomi

Luca Ceresoli (1):
  i2c: add I2C Address Translator (ATR) support

Tomi Valkeinen (7):
  dt-bindings: i2c: Add I2C Address Translator (ATR)
  dt-bindings: media: add TI DS90UB913 FPD-Link III Serializer
  dt-bindings: media: add TI DS90UB953 FPD-Link III Serializer
  dt-bindings: media: add TI DS90UB960 FPD-Link III Deserializer
  media: i2c: add DS90UB960 driver
  media: i2c: add DS90UB913 driver
  media: i2c: add DS90UB953 driver

 .../devicetree/bindings/i2c/i2c-atr.yaml      |   34 +
 .../bindings/media/i2c/ti,ds90ub913.yaml      |  133 +
 .../bindings/media/i2c/ti,ds90ub953.yaml      |  134 +
 .../bindings/media/i2c/ti,ds90ub960.yaml      |  427 ++
 Documentation/i2c/i2c-address-translators.rst |   96 +
 Documentation/i2c/index.rst                   |    1 +
 MAINTAINERS                                   |   16 +
 drivers/i2c/Kconfig                           |    9 +
 drivers/i2c/Makefile                          |    1 +
 drivers/i2c/i2c-atr.c                         |  710 +++
 drivers/media/i2c/Kconfig                     |   47 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/ds90ub913.c                 |  906 ++++
 drivers/media/i2c/ds90ub953.c                 | 1400 ++++++
 drivers/media/i2c/ds90ub960.c                 | 4051 +++++++++++++++++
 include/linux/i2c-atr.h                       |  116 +
 include/media/i2c/ds90ub9xx.h                 |   22 +
 17 files changed, 8106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-atr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
 create mode 100644 Documentation/i2c/i2c-address-translators.rst
 create mode 100644 drivers/i2c/i2c-atr.c
 create mode 100644 drivers/media/i2c/ds90ub913.c
 create mode 100644 drivers/media/i2c/ds90ub953.c
 create mode 100644 drivers/media/i2c/ds90ub960.c
 create mode 100644 include/linux/i2c-atr.h
 create mode 100644 include/media/i2c/ds90ub9xx.h

-- 
2.34.1

