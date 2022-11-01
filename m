Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65E6F614B8E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 14:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbiKANVA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 09:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiKANU6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 09:20:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8464710051;
        Tue,  1 Nov 2022 06:20:56 -0700 (PDT)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2C491589;
        Tue,  1 Nov 2022 14:20:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667308853;
        bh=UJ+ZG3hWrU/wLrl83npOj1ol2LF2pAkQulKCaxx1L/A=;
        h=From:To:Cc:Subject:Date:From;
        b=LNRHgiF+1H8X6om/5no6JSLCUTuMbmdyPX0goJbrSFqgU13YJvCqYRK9tLrw+pgZ+
         ghJXUpfFQ/i77zxlS+NqToorzjr6TX3HUyHOyN4txQhFKwnOvW+xMgyarQ1dCgRCxW
         ihhu9u9y7Cd0TQI8+09EwjRZPCPV111387MU8wqE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 0/8] i2c-atr and FPDLink
Date:   Tue,  1 Nov 2022 15:20:24 +0200
Message-Id: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
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

Intro
-----

This is, kind of, v4 of Luca's i2c-atr and FPDLink series, v3 of which
you can find from:

https://lore.kernel.org/all/20220206115939.3091265-1-luca@lucaceresoli.net/

I say "kind of", as the FPDLink drivers have diverged from Luca's
version quite a bit and the drivers support different HW versions. A
Big thanks for Luca for working on the drivers!

I'd really like to send and review i2c-atr and FPDLink drivers
separately, but as the concepts are new and those drivers are linked
together, in the end I decided to keep them in one series. Even so, I
think these patches divide quite clearly into to areas:

1) i2c-atr and the related code in the FPDLink drivers
2) Everything else about FPDLink

The FPDLink drivers support multiple streams and for that reason the
series is based on V4L2 streams series v15:

https://lore.kernel.org/all/20221003121852.616745-1-tomi.valkeinen@ideasonboard.com/

HW overview
-----------

TI's DS90UB9xx IC (UB9xx for short) family is a set of deserializer and
serializer ICs for video, both display and capture. These ICs support
FPDLink 3 and some also support FPDLink 4. From the user's point of view
there's really not much difference between FPDLink 3 and 4.

An example HW setup with two cameras could be like this:

                          +-- [Ser 1] <-- [Camera 1]
[CSI-2 RX] <-- [Deser] <--|
                          +-- [Ser 2] <-- [Camera 2]

The cameras send video streams over CSI-2 to the serializers. The
serializers encode the received data to FPDLink and send it to the
deserializer. The deserializer decodes the data and sends it forward
over CSI-2 bus.

The FPDLink bus is a bi-directional bus, with a fast forward-channel and
a slow back-channel. In addition to the video, the devices support
forwarding GPIOs (both ways) and forwarding i2c transactions with
address translation.

This series is only about the capture ICs. The HW versions supported
by these drivers are:

- UB960, FPDLink 3 deserializer
- UB9702, FPDLink 3/4 deserializer
- UB953, FPDLink 3 CSI-2 serializer
- UB913, FPDLink 3 parallel video serializer
- UB971, FPDLink 3/4 CSI-2 serializer

Note that this series does not support UB954 deserializer, which Luca
has. I don't have it and decided early to drop it for simpler
development. As UB954 is a subset of UB960, adding support for it should
be trivial.

FPDLink Deser and Ser Devices & Drivers
---------------------------------------

The serializer devices are, in a way, child devices of the deserializer.
It is the deserializer driver which creates and removes the serializer
devices, although the serializer device itself is not a child of the
deserializer, but rather the serializer is created as a device on the
i2c bus.

There are perhaps other methods to add the serializer devices. I think a
real bus is an overkill, as FPDLink is a point-to-point link. But if
there's no FPDLink bus, what are the options? Platform device? That's
not good either. So, for the time being, the serializers are i2c clients
on the main i2c bus, even if they're really behind the FPDLink.

Also, the deserializer driver needs to share some information with the
serializers, and it is done with platform data set to the serializer
device. If we had a bus, the bus could probably be used to convey this
information.

I2C & I2C ATR
-------------

We have three different i2c client types:

1) The deserializer is a normal i2c slave, and there's nothing special
about accessing it. The deserializer is connected to the "main" i2c bus.

2) The serializers are also accessible with i2c via FPDLink: when a
transaction to a specific (programmable) address happens on the main
i2c-bus the deserializer takes the transaction and forwards it via
FPDLink to the serializer. This is implemented in the deserializer
driver by just creating the serializer i2c device on the main i2c-bus.
This is not 100% correct, as the serializers are not directly connected
to an i2c bus as i2c slaves.

3) The serializer is an i2c master, and the camera and possibly other
i2c peripherals can be connected to that "remote" i2c bus. The
deserializer hardware has an i2c-alias table which describes which
i2c-alias address the deserializer will react to, what is the real
i2c-address and to which serializer the transactions will be forwarded
to. This is called address translation (ATR).

I2C ATR Thoughts
----------------

I have addressed most of the comments Luca received for the i2c-atr
driver, but other than that the i2c-atr driver is mostly the same.
However, there's one big difference: the i2c bus can be given by the
drivers.

So, looking at the DT, in Luca's version the deserializer node looked
like this for serializers and i2c-atr:

deser {
	remote-chips {
		remote-chip@0 {
			// The serializer
		};
	};

	i2c-atr {
		i2c@0 {
			// This is the bus behind the serializer
		};
	};
};

I have:

deser {
	links {
		link@0 {
			serializer {
				// The serializer
				i2c {
					// This is the bus
				};
			}
		};
	};
};

I think this reflects the hardware much better. But this means that the
i2c-atr "device", which in Luca's version is only the deserializer, is
in my version split between the deser and serializer. However, the only
thing I changed in the i2c-atr driver is that the i2c_atr_add_adapter()
function takes an fwnode handle which tells where the i2c bus is found
(but if it's NULL, it looks for i2c-atr just like in Luca's version).

Perhaps the biggest difference is that in Luca's version the i2c-atr was
private to the deserializer, and the deser driver called
i2c_atr_add_adapter(). In my version the deser shares the i2c-atr with
the serializers, and the serializers call i2c_atr_add_adapter(). I think
this is much better, as the i2c-bus is behind the serializer, and the
serializer's registers affect the bus, and thus the bus should really be
create/destroyed by the serializer driver as it controls the bus'
i2c-master hardware. 

Now, i2c-mux and i2c-atr are quite similar as has been discussed in the
earlier reviews. And while the FPDLink ICs support ATR, we can easily
imagine a simpler deserializer which only supports mux-style forwarding.
For these reasons I believe we have two topics: 1) i2c-atr without
FPDLink, and 2) i2c-atr (and i2c-mux) with FPDlink.

1)
I am not aware of a stand-alone IC that performs address translation.
If there is, I think i2c-atr as it is in this series is a good solution
(but the bus fwnode feature mentioned above can be dropped).

2)
If I suggested adding an i2c-bus fwnode parameter to
i2c_mux_add_adapter(), and the i2c-bus might be under some other device,
I think the reception could be quite negative (and I would agree). For
this reason I'm not very happy with the i2c-atr and using it with
FPDLink.

In fact, I'm thinking that it might be better to just drop the i2c-atr
driver, and add the support directly to the FPDlink drivers. But that
could mean possibly duplicating the same code for other deser/ser
architectures, so I have kept the i2c-atr driver for now.

In any case, I think when figuring out 2), we can forget about ATR and
the added complexity the translation brings, and just think how i2c-mux
could be used in a deser-ser setup. And maybe the answer is "don't use
it, just write the support directly to the deser-ser drivers".

 Tomi

Luca Ceresoli (2):
  i2c: core: let adapters be notified of client attach/detach
  i2c: add I2C Address Translator (ATR) support

Tomi Valkeinen (6):
  dt-bindings: media: add bindings for TI DS90UB960
  dt-bindings: media: add bindings for TI DS90UB913
  dt-bindings: media: add bindings for TI DS90UB953
  media: i2c: add DS90UB960 driver
  media: i2c: add DS90UB913 driver
  media: i2c: add DS90UB953 driver

 .../bindings/media/i2c/ti,ds90ub913.yaml      |  127 +
 .../bindings/media/i2c/ti,ds90ub953.yaml      |  120 +
 .../bindings/media/i2c/ti,ds90ub960.yaml      |  392 ++
 Documentation/i2c/index.rst                   |    1 +
 Documentation/i2c/muxes/i2c-atr.rst           |   78 +
 MAINTAINERS                                   |    7 +
 drivers/i2c/Kconfig                           |    9 +
 drivers/i2c/Makefile                          |    1 +
 drivers/i2c/i2c-atr.c                         |  497 ++
 drivers/i2c/i2c-core-base.c                   |   18 +-
 drivers/media/i2c/Kconfig                     |   28 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/ds90ub913.c                 |  892 ++++
 drivers/media/i2c/ds90ub953.c                 | 1607 +++++++
 drivers/media/i2c/ds90ub960.c                 | 4198 +++++++++++++++++
 include/linux/i2c-atr.h                       |   80 +
 include/linux/i2c.h                           |   16 +
 include/media/i2c/ds90ub9xx.h                 |   16 +
 18 files changed, 8089 insertions(+), 1 deletion(-)
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

