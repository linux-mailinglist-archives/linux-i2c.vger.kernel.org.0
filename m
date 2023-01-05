Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 780C365EE41
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jan 2023 15:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234557AbjAEODv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Jan 2023 09:03:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233853AbjAEOD2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Jan 2023 09:03:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C81B12D02;
        Thu,  5 Jan 2023 06:03:26 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 712C049C;
        Thu,  5 Jan 2023 15:03:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672927403;
        bh=sKDw4OpqmBnsISOReOprMJ+Izenh3gpsjQyQ2+v5mZc=;
        h=From:To:Cc:Subject:Date:From;
        b=kiHZSV+PZZW0is3TpA/8ACFz/7BXXkHk4oGT7HWHoazofp9XGlsWgU8XY+T04NoTq
         fVUSDtidF8b8AE4AqHjwOVxAKPwWksvC29r7wMhN1zoQ+78t8pPvDT9t9MVP81tIEM
         cgwyCflg31BWiAP/0n0Q8SY7bKMNjf8DVlSYwK9c=
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
Subject: [PATCH v6 0/8] i2c-atr and FPDLink
Date:   Thu,  5 Jan 2023 16:02:59 +0200
Message-Id: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
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

You can find the v5 from:

https://lore.kernel.org/all/20221208104006.316606-1-tomi.valkeinen@ideasonboard.com/

There has again been quite a lot of changes. I will send a diff of v5 to
v6 separately to give a better idea of the changes. Here's are some of
the changes:

- Added namespace for i2c exports
- Consistent naming for FPD-Link
- Added more DT descriptions and kdocs
- Various DT binding improvements suggested in the review
- MAINTAINERS entry for fpd-link
- Use defines instead of BIT(x) in the FPD-Link drivers
- Use pad source/sink defines instead of a number
- Dropped unnecessary debug prints
- UB953: added data-lanes DT property
- UB960: added hsync-active & vsync-active DT properties

 Tomi

Luca Ceresoli (2):
  i2c: core: let adapters be notified of client attach/detach
  i2c: add I2C Address Translator (ATR) support

Tomi Valkeinen (6):
  dt-bindings: media: add TI DS90UB913 FPD-Link III Serializer
  dt-bindings: media: add TI DS90UB953 FPD-Link III Serializer
  dt-bindings: media: add TI DS90UB960 FPD-Link III Deserializer
  media: i2c: add DS90UB960 driver
  media: i2c: add DS90UB913 driver
  media: i2c: add DS90UB953 driver

 .../bindings/media/i2c/ti,ds90ub913.yaml      |  133 +
 .../bindings/media/i2c/ti,ds90ub953.yaml      |  134 +
 .../bindings/media/i2c/ti,ds90ub960.yaml      |  402 ++
 Documentation/i2c/index.rst                   |    1 +
 Documentation/i2c/muxes/i2c-atr.rst           |   83 +
 MAINTAINERS                                   |   16 +
 drivers/i2c/Kconfig                           |    9 +
 drivers/i2c/Makefile                          |    1 +
 drivers/i2c/i2c-atr.c                         |  501 ++
 drivers/i2c/i2c-core-base.c                   |   21 +-
 drivers/media/i2c/Kconfig                     |   47 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/ds90ub913.c                 |  871 ++++
 drivers/media/i2c/ds90ub953.c                 | 1590 ++++++
 drivers/media/i2c/ds90ub960.c                 | 4295 +++++++++++++++++
 include/linux/i2c-atr.h                       |  118 +
 include/linux/i2c.h                           |   16 +
 include/media/i2c/ds90ub9xx.h                 |   16 +
 18 files changed, 8256 insertions(+), 1 deletion(-)
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


base-commit: 76dcd734eca23168cb008912c0f69ff408905235
prerequisite-patch-id: 341bbdcbd14f0b6f38c88f1390f9437873a03430
prerequisite-patch-id: e5d34269150d94ecb7fd670ad31e14aaae78e099
prerequisite-patch-id: 24ff7b1c013fa9acd8b93c2506eae39eb2a1021c
prerequisite-patch-id: 15edf6091d7c2d340f25711961bb8459addc8d58
prerequisite-patch-id: 9beff6fd1d22dbfe565931de81b27739e45ced05
prerequisite-patch-id: 37bc00c7315371c9a906af0d718ecedd871a43e0
prerequisite-patch-id: 8218595c50635ab48a9c8cd8c580da9f431d539f
prerequisite-patch-id: 7f163276a04d212d009ee6e96fb545d5b781cc44
prerequisite-patch-id: 0db299d92565612520411ef624e097131feb2d97
prerequisite-patch-id: 6b521ad1868b9a507930dd6a2e0e2d19b5947456
prerequisite-patch-id: d32e1105a1285cceac8fd8e84649070174a6b23e
prerequisite-patch-id: 2927a4ef079c55e7807cda150d4b9eb29978136a
prerequisite-patch-id: 77546a2e202557910e9a3635534163cc80134ea4
prerequisite-patch-id: 462fabb2b21019636e1f7e793dafc51caf40400e
prerequisite-patch-id: 604c8c3f3e7fab7698eb73795bae573f88b808db
prerequisite-patch-id: 75a3d7b072e718fb2bd854743b9b2023d68a822b
prerequisite-patch-id: a9c64a3360938ac230261ffc3e0cbd8cb66550d3
prerequisite-patch-id: a5c57341047e53ecaeb28181319700dd3ace62aa
prerequisite-patch-id: e9b8da97c9fea3cd3268adf8387cb3df179649e5
prerequisite-patch-id: 2767b8af9e0742b52b81b2dbce3b5ce5203e3610
-- 
2.34.1

