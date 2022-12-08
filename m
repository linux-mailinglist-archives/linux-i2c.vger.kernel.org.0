Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3A5B646D51
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 11:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiLHKnn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 05:43:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiLHKnT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 05:43:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89121222;
        Thu,  8 Dec 2022 02:40:26 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 893EB25B;
        Thu,  8 Dec 2022 11:40:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670496023;
        bh=ab3VDBBlRhkk1OCm+eM9aIt0zkYjaGuasNx+kTETGB4=;
        h=From:To:Cc:Subject:Date:From;
        b=NcuWxdUAooti/wS8UrXxku4R8b30Fb+FkevjbueyMSUXpAN4K+05fGzHheelm+naP
         ZiGKIEIA+cJuJhCdyXA83ZJLDNRWQwEo/soJmAsO9pWSM+WsM/JJ9+e16sRO4uHBhX
         ghN+fenSpn6jVQ4kJQOaplqDCZRDcFK4JPrR/JYw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 0/8] i2c-atr and FPDLink
Date:   Thu,  8 Dec 2022 12:39:58 +0200
Message-Id: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

You can find v4 of the series from:

https://lore.kernel.org/all/20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com/

You can find a longer introduction of the series in that version's cover
letter.

There has been a lot of changes to the DT bindings and the i2c-atr code in this
version, but they are all fixes and cleanups, no architectural changes. The
FPDLink drivers have not been changed, except to reflect the changes in the
DT.

I will send a diff between v4 and v5 to give a better idea of the changes.

One thing that was discussed a bit but not handled in this version is the
i2c-pool/i2c-alias topic. I believe we have three options: 1) use fixed
addresses, defined in DT, 2) get the addresses from an i2c-pool, 3) dynamically
reserve the addresses at runtime. The current series uses 2).

 Tomi

Luca Ceresoli (2):
  i2c: core: let adapters be notified of client attach/detach
  i2c: add I2C Address Translator (ATR) support

Tomi Valkeinen (6):
  dt-bindings: media: add bindings for TI DS90UB913
  dt-bindings: media: add bindings for TI DS90UB953
  dt-bindings: media: add bindings for TI DS90UB960
  media: i2c: add DS90UB960 driver
  media: i2c: add DS90UB913 driver
  media: i2c: add DS90UB953 driver

 .../bindings/media/i2c/ti,ds90ub913.yaml      |  121 +
 .../bindings/media/i2c/ti,ds90ub953.yaml      |  112 +
 .../bindings/media/i2c/ti,ds90ub960.yaml      |  358 ++
 Documentation/i2c/index.rst                   |    1 +
 Documentation/i2c/muxes/i2c-atr.rst           |   78 +
 MAINTAINERS                                   |    8 +
 drivers/i2c/Kconfig                           |    9 +
 drivers/i2c/Makefile                          |    1 +
 drivers/i2c/i2c-atr.c                         |  503 ++
 drivers/i2c/i2c-core-base.c                   |   18 +-
 drivers/media/i2c/Kconfig                     |   47 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/ds90ub913.c                 |  892 ++++
 drivers/media/i2c/ds90ub953.c                 | 1607 +++++++
 drivers/media/i2c/ds90ub960.c                 | 4195 +++++++++++++++++
 include/linux/i2c-atr.h                       |   82 +
 include/linux/i2c.h                           |   16 +
 include/media/i2c/ds90ub9xx.h                 |   16 +
 18 files changed, 8066 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
 create mode 100644 Documentation/i2c/muxes/i2c-atr.rst
 create mode 100644 drivers/i2c/i2c-atr.c
 create mode 100644 drivers/media/i2c/ds90ub913.c
 create mode 100644 drivers/media/i2c/ds90ub953.c
 create mode 100644 drivers/media/i2c/ds90ub960.c
 create mode 100644 include/linux/i2c-atr.h
 create mode 100644 include/media/i2c/ds90ub9xx.h

-- 
2.34.1

