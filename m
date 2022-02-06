Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775D24AAFC0
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Feb 2022 14:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239785AbiBFN7B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Feb 2022 08:59:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241785AbiBFN6v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Feb 2022 08:58:51 -0500
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C00C03FED7;
        Sun,  6 Feb 2022 05:58:44 -0800 (PST)
Received: from [77.244.183.192] (port=63680 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1nGgCy-00059v-LP; Sun, 06 Feb 2022 12:59:56 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        matti.vaittinen@fi.rohmeurope.com
Subject: [RFCv3 0/6] Hi,
Date:   Sun,  6 Feb 2022 12:59:33 +0100
Message-Id: <20220206115939.3091265-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

this RFCv3, codename "FOSDEM Fries", of RFC patches to support the TI
DS90UB9xx serializer/deserializer chipsets with I2C address translation.

I sent RFCv2 back in 2019 (!). After that I have applied most of the
improvements proposed during code review, most notably device tree
representation and proper use of kernel abstractions for clocks and GPIO. I
have also done many improvements all over the drivers code.

However I still don't consider these drivers "ready", hence the RFC status.

One reason is that, while the I2C ATR idea has been considered good by
Wolfram, its implementation requires I2C core changes that have been tried
but never made it to mainline. I think that discussion needs to be reopened
and work has to be done on that side. Thus for the time being this code
still has the alias pool: it is an interim solution until I2C core is
ready.

Also be aware that the only hardware where I sould test this code runs a
v4.19 kernel. I cannot guarantee it will work perfectly on mainline.

And since my hardware has only one camera connected to each deserializer I
dropped support. However I wrote the code to be able to easily add support
for 2 and 4 camera inputs as well as 2 CSI-2 outputs (DS90UB960).

Finally, I dropped all attempts at supporting hotplug. The goals I had 2+
years ago are not reasonably doable even with current kernels. Luckily all
the users that I talked with are happy without hotplug. For this reason I
simplified the serializer management in the DS90UB954 driver by keeping the
serializer always instantiated.

Even with the above limitations I felt I'd send this v3 anyway since
several people have contacted me since v2 asking whether this
implementation has made progress towards mainline. Some even improved on
top of my code it their own forks. As I cannot afford to work on this topic
in the near future, here is the latest and greatest version I can produce,
with all the improvements I made so far.

That's all, enjoy the code!

References:

[RFCv2] https://lore.kernel.org/lkml/20190723203723.11730-1-luca@lucaceresoli.net/
[RFCv1] https://lore.kernel.org/linux-media/20190108223953.9969-1-luca@lucaceresoli.net/

Best regards.
Luca

Luca Ceresoli (6):
  i2c: core: let adapters be notified of client attach/detach
  i2c: add I2C Address Translator (ATR) support
  media: dt-bindings: add DS90UB953-Q1 video serializer
  media: dt-bindings: add DS90UB954-Q1 video deserializer
  media: ds90ub954: new driver for TI DS90UB954-Q1 video deserializer
  media: ds90ub953: new driver for TI DS90UB953-Q1 video serializer

 .../bindings/media/i2c/ti,ds90ub953-q1.yaml   |   96 +
 .../bindings/media/i2c/ti,ds90ub954-q1.yaml   |  235 +++
 MAINTAINERS                                   |   22 +
 drivers/i2c/Kconfig                           |    9 +
 drivers/i2c/Makefile                          |    1 +
 drivers/i2c/i2c-atr.c                         |  557 ++++++
 drivers/i2c/i2c-core-base.c                   |   18 +-
 drivers/media/i2c/Kconfig                     |   22 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/ds90ub953.c                 |  560 ++++++
 drivers/media/i2c/ds90ub954.c                 | 1648 +++++++++++++++++
 include/dt-bindings/media/ds90ub953.h         |   16 +
 include/linux/i2c-atr.h                       |   82 +
 include/linux/i2c.h                           |   16 +
 14 files changed, 3284 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953-q1.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml
 create mode 100644 drivers/i2c/i2c-atr.c
 create mode 100644 drivers/media/i2c/ds90ub953.c
 create mode 100644 drivers/media/i2c/ds90ub954.c
 create mode 100644 include/dt-bindings/media/ds90ub953.h
 create mode 100644 include/linux/i2c-atr.h

-- 
2.25.1

