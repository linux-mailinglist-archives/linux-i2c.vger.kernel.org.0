Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B019B1174A4
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 19:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfLISnP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 13:43:15 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:34254 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726675AbfLISm7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Dec 2019 13:42:59 -0500
Received: from zenbar.fritz.box (pD95EF75D.dip0.t-ipconnect.de [217.94.247.93])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 3EC8A2E5CCC;
        Mon,  9 Dec 2019 18:29:03 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, lee.jones@linaro.org, lars@metafoo.de,
        pascal.huerst@gmail.com, Daniel Mack <daniel@zonque.org>
Subject: [PATCH 00/10] mfd: Add support for Analog Devices A2B transceiver
Date:   Mon,  9 Dec 2019 19:35:00 +0100
Message-Id: <20191209183511.3576038-1-daniel@zonque.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series adds support for Analog Device's AD242x A2B
transceivers.

  https://www.analog.com/media/en/technical-documentation/user-guides/AD242x_TRM_Rev1.1.pdf

These transceivers are used to form an audio network by connecting the
parts in a daisy-chain. On top of audio, the devices expose some other
functions such as GPIO, programmable clock outputs and remote-side I2C
bus master. The first node in the chain is called the master node, and
all other devices are called slave nodes. Up to 15 such devices can be
connected this way.

The master device responds on two addresses on the I2C bus. The primary
one is used to access all registers in the master node itself, the
secondary is for accessing remote nodes after prior setup through the
master node. In the driver stack, these details are hidden behind
specific regmap configs.

The driver stack is implemented as MFD core and companion drivers that
can be registered as sub-devices in DT. Drivers for these sub-devices
can be used for both master and slave nodes, as they just interface
with the node's regmap.

The master node is responsible for discovering all the slave nodes at
probe time, and it needs to take the used audio and routing modes in
each of the slave devices into account in order to pre-calculate the
bus-timings correctly. Hence, this bus is not hot-pluggable.

Transceivers can both receive and provide audio, and streams can be
routed from one node to any other, including many others. The tricky
bit is how to expose the audio routing in DT in a sane way.
The way it is implemented here, the slave nodes specify the number of
slots they each consume and generate, and which thereof they forward
from one side to the other. This mimics the internal register
structure and should allow for even exotic setups.

Please let me know what you think and what could be improved.


Thanks,
Daniel


Daniel Mack (10):
  dt-bindings: mfd: Add documentation for ad242x
  dt-bindings: i2c: Add documentation for ad242x i2c controllers
  dt-bindings: gpio: Add documentation for AD242x GPIO controllers
  dt-bindings: clock: Add documentation for AD242x clock providers
  dt-bindings: sound: Add documentation for AD242x codecs
  mfd: Add core driver for AD242x A2B transceivers
  i2c: Add driver for AD242x bus controller
  gpio: Add driver for AD242x GPIO controllers
  clk: Add support for AD242x clock output providers
  ASoC: Add codec component for AD242x nodes

 .../bindings/clock/adi,ad242x-clk.yaml        |  32 +
 .../bindings/gpio/adi,ad242x-gpio.yaml        |  65 ++
 .../bindings/i2c/adi,ad242x-i2c.yaml          |  31 +
 .../bindings/mfd/adi,ad242x-bus.yaml          |  29 +
 .../bindings/mfd/adi,ad242x-master.yaml       | 235 +++++++
 .../bindings/mfd/adi,ad242x-slave.yaml        | 108 ++++
 .../bindings/sound/adi,ad242x-codec.yaml      |  31 +
 drivers/clk/Kconfig                           |   6 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-ad242x.c                      | 231 +++++++
 drivers/gpio/Kconfig                          |   6 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-ad242x.c                    | 229 +++++++
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ad242x.c               | 178 +++++
 drivers/mfd/Kconfig                           |  11 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/ad242x-bus.c                      |  42 ++
 drivers/mfd/ad242x-master.c                   | 611 ++++++++++++++++++
 drivers/mfd/ad242x-node.c                     | 262 ++++++++
 drivers/mfd/ad242x-slave.c                    | 234 +++++++
 include/dt-bindings/clock/adi,ad242x.h        |   9 +
 include/linux/mfd/ad242x.h                    | 400 ++++++++++++
 sound/soc/codecs/Kconfig                      |   5 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/ad242x.c                     | 338 ++++++++++
 27 files changed, 3109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/adi,ad242x-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/adi,ad242x-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/adi,ad242x-i2c.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/adi,ad242x-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/adi,ad242x-master.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/adi,ad242x-slave.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/adi,ad242x-codec.yaml
 create mode 100644 drivers/clk/clk-ad242x.c
 create mode 100644 drivers/gpio/gpio-ad242x.c
 create mode 100644 drivers/i2c/busses/i2c-ad242x.c
 create mode 100644 drivers/mfd/ad242x-bus.c
 create mode 100644 drivers/mfd/ad242x-master.c
 create mode 100644 drivers/mfd/ad242x-node.c
 create mode 100644 drivers/mfd/ad242x-slave.c
 create mode 100644 include/dt-bindings/clock/adi,ad242x.h
 create mode 100644 include/linux/mfd/ad242x.h
 create mode 100644 sound/soc/codecs/ad242x.c

-- 
2.23.0

