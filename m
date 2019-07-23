Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE0637215E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2019 23:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392001AbfGWVM2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jul 2019 17:12:28 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:41094 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389263AbfGWVM2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jul 2019 17:12:28 -0400
Received: from [88.149.224.16] (port=34022 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1hq1XR-007idA-35; Tue, 23 Jul 2019 22:37:33 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>
Subject: [RFC,v2 0/6] TI camera serdes and I2C address translation
Date:   Tue, 23 Jul 2019 22:37:17 +0200
Message-Id: <20190723203723.11730-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.17.1
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
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

this is a second round of RFC patches to move forward on discussion about
proper kernel support for the TI DS90UB9xx serializer/deserializer chipsets
with I2C address translation.

RFCv2 is a major improvement over RFCv1, with several parts rewritten from
scratch. I2C address translationis now in its own file, there's decent
remote GPIO support, the deser driver is much closer to being complete, I
added a minimal serializer driver and, last but not least, forwarding one
video stream works.

My long-term goal is to be able to model different camera modules [or
display or other modules] similarly to beaglebone capes or rpi hats,
up to a model where:

 1. there can be different camera modules being designed over time
 2. there can be different base boards being designed over time
 3. there is a standard interconnection between them (mechanical,
    electrical, communication bus)
 4. camera modules and base boards are designed and sold independently
    (thanks to point 3)
 5. a camera module can be removed, and a different model connected, at
    runtime while the other modules are streaming

To allow the required flexibility I introduced the idea of an I2C alias
pool that must be defined in device tree. It is the responsibility of the
DT writer to fill the pool with addresses that are otherwise unused on the
local bus. The pool could not be filled automatically because there might
be conflicting chips on the local bus that are unknown to the software, or
that are just connected later.

Addresses from the pool are assigned to remote I2C slaves at runtime, when
they are added on the remote bus. The technical details of how address
translation works are documented in patch 2.

The big beast is hotplugging. Unfortunately this does not seem to be doable
"the right way" at the moment for at least two reasons. First, a v4l2 media
graph cannot be modified while the pipe is streaming, and AFAIK this will
not be possible soon. Second, because handling hotplug of devicetree-based
peripherals would require runtime DT overlay insertion and removal, which
is a slowly progressing work, but again not ready currently.

To overcome at least some of these limitations I found a compromise. The
model that I would consider "the correct one" looks like this:

 <-- base board -->        <------- remote camera module ------->
                           .---------------------.
 .-----.    .-----.        |         SER         |
 | CPU |----| DES |========|----------.----------|
 `-----'    `-----'  FPD   | GPIO ctl | I2C adap |----+----+----.
                    Link 3 `---------------------'    |    |    |
                    cable        ||||             remote I2C slaves
	                    remote GPIO pins	    

Here the deserializer (DES) is always present and connected, so it can be
probed vie DT during boot. The serializer (SER) is instantiated at runtime
when a link is established on the FPD-Link cable and the model
detected. An I2C adapter is created under the SER, and all the remote I2C
slaves are then instantiated under it.

But this would require to stop and modify the v4l2 pipe, including the
cameras still connected, just because one of them has been removed (or a
cable has gone faulty).

The comprimise I took looks like this:

            .------------------.        .-----.
 .-----.    |                  |========| SER |
 | CPU |----| DES   .----------|        `-----'
 `-----'    |       | I2C adap |----+----+----.
            `------------------'    |    |    |
                                remote I2C slaves

In this case the I2C adapter (representing the "remote" bus) is
instantiated under the DES, and is always present. This stil allows proper
hotplugging of the SER, and userspace can still add/remove remote I2C
slaves. But it makes it possible to instantiate a sensor and leave it
always instantiated, so that the v4l2 pipe is never modified and "believes"
the sensor is always there. Of course this opens other issues, and requires
non-standard wachanisms to start/stop the sensor and handle missing frames
when it is disconnected. My prototype design works thanks to the above
structure, a somewhat tweaked sensor driver and a bit of help from
userspace.

Finally, remote GPIOs.

            .------------------.        .-----.
 .-----.    |                  |========| SER |
 | CPU |----| DES   .----------|        `-----'
 `-----'    |       | GPIO ctl |          ||||
            `------------------'     remote GPIO pins


Similar to the I2C adapter, I chose to instantiate on the DES the GPIO
controllers to control the remote GPIOs, even if it looks like it should be
under the serializers. This decision allows to have the remote GPIOs
described in DT, and always available, so that e.g. the always-instantiated
sensor driver DT node can say 'reset-gpios = <&deser 1 2 0>'.

That's all, see the patches for the details.

References:

[0] Vladimir Zapolskiy proposal on other TI chips:
    https://www.spinics.net/lists/linux-gpio/msg33291.html
[1] Kieran Bingham's patches covering Maxim chips:
    https://www.spinics.net/lists/linux-media/msg142367.html

[RFCv1] https://lore.kernel.org/linux-media/20190108223953.9969-1-luca@lucaceresoli.net/


Luca Ceresoli (6):
  i2c: core: let adapters be notified of client attach/detach
  i2c: add I2C Address Translator (ATR) support
  media: dt-bindings: add DS90UB954-Q1 video deserializer
  media: dt-bindings: add DS90UB953-Q1 video serializer
  media: ds90ub954: new driver for TI DS90UB954-Q1 video deserializer
  media: ds90ub953: new driver for TI DS90UB953-Q1 video serializer

 .../bindings/media/i2c/ti,ds90ub953-q1.txt    |   42 +
 .../bindings/media/i2c/ti,ds90ub954-q1.txt    |  194 ++
 drivers/i2c/Kconfig                           |    9 +
 drivers/i2c/Makefile                          |    1 +
 drivers/i2c/i2c-atr.c                         |  557 ++++++
 drivers/i2c/i2c-core-base.c                   |   16 +
 drivers/media/i2c/Kconfig                     |   24 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/ds90ub953.c                 |  354 ++++
 drivers/media/i2c/ds90ub954.c                 | 1575 +++++++++++++++++
 include/dt-bindings/media/ds90ub953.h         |   16 +
 include/linux/i2c-atr.h                       |   82 +
 include/linux/i2c.h                           |   16 +
 13 files changed, 2889 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953-q1.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.txt
 create mode 100644 drivers/i2c/i2c-atr.c
 create mode 100644 drivers/media/i2c/ds90ub953.c
 create mode 100644 drivers/media/i2c/ds90ub954.c
 create mode 100644 include/dt-bindings/media/ds90ub953.h
 create mode 100644 include/linux/i2c-atr.h

-- 
2.17.1

