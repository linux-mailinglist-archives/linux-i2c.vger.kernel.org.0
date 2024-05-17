Return-Path: <linux-i2c+bounces-3554-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3378C86BF
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 14:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 605A7281B9F
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 12:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E657151C5E;
	Fri, 17 May 2024 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="X/EduMIF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8C43D546;
	Fri, 17 May 2024 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715950731; cv=none; b=qwDJEcbkXyp9V1HEY7A1kQRRdyxJorhgQhFSEDfpsMSOxUI/kdk2RNS1gSj1gc6gZ2Asly8fPfYIavWE3HViojHPwKYD+/g+Yetzh2VdP9slCvhC6IwLWe1TNlpXWpsAf69mtMt0wrrL8mF+5i55CrVqpin94/jY1Ex6l8EbYcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715950731; c=relaxed/simple;
	bh=zrk6+cloSLdiIn9uyTXv4YwejY+Ob7e3tkorYnZx4ak=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KtiBi/DXjS/ZLS8E7OpoRkJu7jkyBrwXGcN34Wl9b7ZsZ97/WJCnilGLdZQBHthA107mV6ILStjZNMmwIudHYpPGqMjXXottElkKzfmgmTinSdn4MgoPfHBB3lsLbATlpS3wfF6NIN+gEB8mmThcAAlYfKEQhyKyEZh+LR0mjTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=X/EduMIF; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
X-Envelope-To: linux-i2c@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1715950724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1Ml8qbMHtSEoymkT/K/7bfJSLCHjhajBrHobl8Pf/aQ=;
	b=X/EduMIFDZseitXtRB+ulnDX9qzY4q7dndnBr5LGTGQy22b9+VMZRQJmQCQDXosoVfeg8S
	dhIQGkkyKbbEngJSH/UkCYCGPVfhF3ZChX3qth6+itxVtvg2gZADqkMjWgXV6aFTVQiCQj
	YTpHZ9uGwce3n9wi8GaMzu+6XAkarvxVbixE6jzYExv50xhumZHfpH9bq2IK9pPaAGnYRk
	CsGAJFreXDHHFHdnaRNY3BMRAThkRc5lhTYthpPaukbHTuj8UX1/4QVB3mwyUayLeFEgvl
	djXoeBB5CFFAaa6elKExv01CzCTetYTYZ6W0QkrQiUZn+FsT4UVkQw5786zfaQ==
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: emas@bang-olufsen.dk
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: perex@perex.cz
X-Envelope-To: lgirdwood@gmail.com
X-Envelope-To: mturquette@baylibre.com
X-Envelope-To: broonie@kernel.org
X-Envelope-To: saravanak@google.com
X-Envelope-To: alsi@bang-olufsen.dk
X-Envelope-To: rafael@kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: tiwai@suse.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linux-clk@vger.kernel.org
X-Envelope-To: sboyd@kernel.org
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: brgl@bgdev.pl
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Subject: [PATCH 00/13] Analog Devices Inc. Automotive Audio Bus (A2B)
 support
Date: Fri, 17 May 2024 14:57:58 +0200
Message-Id: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFZUR2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDI0Mj3USjJN1UU5OkRBOzRMtUA1MloMqCotS0zAqwKdGxtbUAr6uFm1U
 AAAA=
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-i2c@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
X-Migadu-Flow: FLOW_OUT

This series adds support for Analog Devices' Automotive Audio Bus (A2B)
transceivers in the AD242x, AD241x and AD240x series.

The series is based on today's linux-next.

INTRODUCTION
============

A2B buses consist of a seires of daisy-chained A2B transceiver ICs known
as nodes. Every bus consists of a "main" node (attached to the host
processor via I2C) and, typically, a series of "subordinate" nodes
connected in a daisy-chained manner via UTP (unshielded twisted pair).
Digital audio transport is delivered via a standard I2S/TDM interface
between the host and main node. The UTP links may extend for several
meters, exposing peripheral function to the host over a distance.

  ┌──────┐ I2C ┌──────┐     ┌──────┐     ┌──────┐         ┌──────┐
  │      ├─────┤      │ UTP │      │     │      │         │      │
  │ host │     │ main │XXXXX│ sub1 │XXXXX│ sub2 │XX ... XX│ subN │
  │      ├─────┤      │     │      │     │      │         │      │
  └──────┘ TDM └──────┘     └──────┘     └──────┘         └──────┘
                   \______________________________ ... ______/

                                   A2B bus

All A2B nodes expose a number of peripheral functions, and the A2B
protocol allows for them to be controlled directly by the host processor
over I2C:

                  ┌──────────────────────┐
                  ├─────┐          ┌─────┤
  <---  ... \/\/\/│ TRX │  AD2428  │ TRX │\/\/\/ ... --->
            /\/\/\│  A  │          │  B  │/\/\/\
   towards        ├─────┘          └─────┤        towards last
   main node      │ ┌──────┐ ┌─────────┐ │        subordinate node
                  │ │ I2C  │ │ I2S/TDM │ │
                  │ │      │ │   PDM   │ │
                  │ └──────┘ └─────────┘ │
                  │ ┌──────┐ ┌─────────┐ │
                  │ │ GPIO │ │  CLOCK  │ │
                  │ └──────┘ └─────────┘ │
                  └──────────────────────┘

The peripheral functions are as follows:

  I2C interface
  -------------

  On main nodes the I2C interface must by definition function in
  target (slave) mode, as it is attached to the host for management.
  On subordinate nodes the I2C interface functions in controller
  (master) mode, providing an additional I2C adapter to the host for
  each subordinate node connected to the A2B bus.

  The control registers of each node, both main and subordinate, can
  be accessed directly (resp. indirectly) via the I2C interface between
  the host and main node.

  I2S/TDM and PDM interface
  -------------------------

  This is the main feature of A2B, whence the name Audio Bus. Each node
  has two TX and RX pins for I2S function. On the main node the
  interface functions as a bit- and frame-clock consumer. On the
  subordinate nodes it functions as a provider. PCM data is transported
  "upstream" (towards the main node) and "downstream" (towards the last
  subordinate node) via the A2B protocol in so-called A2B superframes.

  Through control registers of the respective nodes, a user can
  configure specific TDM slots to be placed into the superframes for
  transport up or down the A2B bus. Similarly, slots can be pulled from
  the superframes and retransmitted on a given node's I2S/TDM interface.

  In addition, the pins on a node can be reconfigured to run in PDM mode
  for applications such as microphone recording. The data is placed into
  the superframe for forwarding up or down the bus.

  GPIO
  ----

  Unused pins of a node can be muxed to GPIO mode. The GPIO block
  supports interrupts as well, so each node connected to the bus can
  expose a gpiochip/irqchip to the host.

  CLOCK
  -----

  Certain pins can also be muxed to become clock outputs. The clock
  outputs divide the internal PLL, which runs at 2048 times the frame
  sync clock frequency of the main node.

For further details on A2B architecture, check the documentation from
Analog Devices, which is freely available online; this documentation was
used to write the driver:

  AD2420(W)/6(W)/7(W)/8(W)/9(W) Automotive Audio Bus A2B Transceiver
  Technical Reference, Revision 1.1, October 2019, Part Number 82-100138-01

DRIVER DESIGN
=============

To control these chips, a bus driver core has been added under the
drivers/a2b/ directory. Drivers for peripheral functionality are instead
placed in their relevant subsystem directory. What follows is a brief
description of the design.

The A2B core introduces a bus for two device types, and a class type to
represent the overall bus:

  * struct bus_type a2b_bus:

    A bus type for A2B buses. There are two device types:

      * struct device_type a2b_node: an A2B node, main or subordinate
      * struct device_type a2b_func: a peripheral function of a node,
                                     e.g. gpio or codec

  * struct class a2b_bus_class:

    A class type representing the overall A2B bus instance. There is one
    device type:

      * struct device_type a2b_bus: an A2B bus instance

Interrupts can be raised by any node and are multiplexed via the IRQ
line of the main node connected to the host processor. The interrupts
are then dispatched to the relevant node, or, in the case of GPIO, to
the a2b_func device representing the irqchip.

At the top level there is the i2c driver, ad24xx-i2c, hereby called an
A2B interface driver. It sets up the bare necessities required to
interface with the nodes and to demultiplex interrupts. In principle
there exist other interfaces for A2B - newer series chips, for example,
support also SPI, but the hardware is not available for me to test on,
so this series only implements the I2C interface.

The role of the interface driver is to register a class device of type
a2b_bus. The interface driver should implement relevant a2b_bus_ops,
which provide the core with a way to talk to the nodes in an
interface-agnostic fashion.

When an a2b_bus device is registered, the core will traverse the OF node
of the top-level i2c node and look for a child node named node@0. This
node is used to create a new bus device of type a2b_node. It corresponds
to the main node, and so it is always assumed to be present.

The main node is probed by the node driver, ad24xx-node. This is a
generic driver and supports both main and subordinate nodes, as
the setup is very similar.

The A2B core takes a specific interest in the initialization of a2b_node
devices because it must administer the "discovery" process. Discovery
can be thought of as enumeration, and involves programming specific
control registers of the main node and waiting for a specific interrupt
to determine whether there is another subordinate node attached.
According to the design of A2B, the discovery process must happen in a
serial manner, which is to say that it is not possible to discover
subordinate node N until subordinate node N-1 has been discovered.
Moreover, the main node must also be set up before any discovery can
take place.

To address this, the node driver must configure certain a2b_node_ops
before registering its a2b_node with the core via a2b_register_node().
Most of the node setup then takes place in the a2b_node_ops::setup()
function, which is called synchronously by the core. When a node has
been successfully set up, the core will then attempt (another)
discovery. This algorithm will proceed until there are no further nodes
to discover.

When a node is set up by the node driver, it can then optionally add
peripheral function a2b_func devices. These devices are probed by their
respective driver, be it for the GPIO subsystem, sound subsystem, etc.

As was alluded to earlier, the driver relies on OF/device tree for the
hardware description. Here is a simplified example:

  i2c {
    a2b@68 {                                 interface
      compatible = "adi,ad2428";
      reg = <0x68>;
      #interrupt-cells = <1>;
      interrupt-controller;

      node@0 {                               # main node
        compatible = "adi,ad2428-node";
        reg = <0>
        interrupts = <0>;

        clock {                              # main node clock
          compatible = "adi,ad2428-clk";
          #clock-cells = <1>;
          clock-output-names = "clkout1", "clkout2";
        };

        codec {                              # main node audio codec
          compatible = "adi,ad2428-codec";
        };
      };

      node@1 {                               # subordinate node 1
        compatible = "adi,ad2428-node";
        reg = <1>;
        interrupts = <1>;

        gpio {                               # subordinate node 1 GPIO
          compatible = "adi,ad2428-gpio";
          #interrupt-cells = <2>;
          interrupt-controller;
          #gpio-cells = <2>;
          gpio-controller;
        };

        codec {                              # subordinate node 1 audio codec
          compatible = "adi,ad2428-codec";
        };
      };

      node@2 {                               # subordinate node 2 ...
        compatible = "adi,ad2428-node";
        reg = <2>;
        interrupts = <2>;

        codec {                              # subordinate node 2 audio codec
          compatible = "adi,ad2428-codec";
        };
      };

      ... more nodes can follow here
    };
  };

It is not a requirement that all described nodes are actually connected
to the bus.

While the device tree structure is flat, the device topology is nested.
That means a parent-child device topology as follows:

  1-0068
   └─ a2b-0
       └─ a2b-0.0
           ├─ a2b-0.1
           │   ├─ a2b-0.2
           │   │   └─ a2b-0.2-codec
           │   ├─ a2b-0.1-gpio
           │   └─ a2b-0.1-codec
           ├─ a2b-0.0-clk
           └─ a2b-0.0-codec

Where:

  * 1-0068 is the top-level I2C device
  * a2b-0 is the a2b_bus class device
  * a2b-0.0 is the main node a2b_node device
  * a2b-0.N is the Nth subordinate node a2b_node device
  * a2b-0.N-codec is the Nth node's audio codec a2b_func device
  * ditto for a2b-0.N-{clk,gpio} etc.

PATCH ORDER
===========

The series is split up into per-subsystem pieces to make review easier
for relevant maintainers.

Broadly speaking the series goes as follows:

  1. Add the driver core

  2. Add device tree bindings for AD24xx chips

  3. Add device drivers for AD24xx chips
    a) I2C interface driver
    b) node driver
    c) per-subsystem functional block drivers

  4. Add an example "custom" A2B node driver for a Bang & Olufsen
     speaker (Beosound Shape)

  5. Add relevant entries to the MAINTAINERS file

HELP WANTED
===========

I am aware that the current implementation may not be entirely correct
from a driver model perspective, and there are also some shortcomings
which are already evident. Having said that, I am in need of people to
bounce ideas off, so I figure it is OK to submit the code in its current
form. Below I want to identify a few issues and get some feedback.

  How will this get merged?
  -------------------------

  I am a bit clueless as to the review and merge process for a patch
  series that affects multiple subsystems. If somebody can point me to
  an explanation (perhaps already stated on the mailing list?), that
  would be great.

  I made some assumptions on how to structure this series but I am happy
  to amend if things are not correct.

  fw_devlink=on and device registration during discovery
  ------------------------------------------------------

  In the current architecture, device_register() is called for each A2B
  node if and only if the node has been discovered. Since the driver is
  using OF, this seems to violate some assumptions of fw_devlink. Let me
  quote a comment from device_links_driver_bound():

  | If a device binds successfully, it's expected to have created all
  | the device links it needs to or make new device links as it needs
  | them. So, fw_devlink no longer needs to create device links to any
  | of the device's suppliers.

  When using the audio-graph-card2 ASoC machine driver, I have
  experienced fw_devlink=on preventing both the subordinate nodes'
  codecs and the machine driver from being probed, due to a cyclic
  dependency. I have been able to work around this by using Saravana's
  new post-init-providers device tree property, whereby I reference by
  phandle the corresponding OF graph endpoint of the machine driver in
  each codec's device tree node. But this seems like a bit of a hack.
  And I suspect that the logic (and benefits) of fw_devlink=on will be
  broken in other places by this behaviour as well.

  Looking at other subsystems, I see that i2c will register a device for
  each child node, and allow the matching driver's probe function to
  return -ENODEV/-ENXIO if the device doesn't respond. In that case, the
  devices are still registered but remain unbound.

  A similar strategy could be done for A2B as well I think.

  First it is important to note that discovery must happen sequentially,
  i.e. node N cannot be discovered until node N-1 has been discovered
  and its driver bound. This is because node N-1's driver is needed to
  access some of its registers (to enable B-side transceiver switching,
  etc.).

  Node discovery could instead be wired into the a2b_bus_probe()
  function, such that if called for a struct device corresponding to
  node N, and if nodes 0..N-1 have already been probed, then the code
  currently in a2b_bus_discovery_work() can be performed to try and
  discover node N.  If discovered, the a2b_drv->probe() call can then be
  performed. If not discovered, a2b_bus_probe() can return -ENODEV and
  we can conclude that the initial discovery algorithm has completed.

  Here I need some help though. As already stated, there is a strict
  ordering dependency, so I need to ensure that nodes 0..N-1 have
  actually been probed. If I am already calling device_register() on all
  nodes with an OF node to begin with, then I need to establish some
  managed device links to work with this properly. Correct?

  If that works fine, then there is at least one remaining problem.
  Namely, we at B&O are already using this driver in a product which has
  an OF description for up to 10 A2B nodes, but where the customer may
  not necessarily have all nodes connected. This is the Beosound Shape
  setup described in the last patches of this series. To handle this, I
  use a modified audio-graph-card2 driver which defers its probe until
  the A2B bus has finished its discovery. But in the case where some are
  not connected, I will get -ENODEV. What I want to understand here is,
  how will fw_devlink respond? To understand, here is a simplified
  representation of the device tree:

    sound {
      compatible = "adi,a2b-audio-graph-card2";
      ...

      ports {
        port@0 { snd_0_ep: endpoint { remote-endpoint = <&a2b0_codec_ep>; }; };
        port@1 { snd_1_ep: endpoint { remote-endpoint = <&a2b1_codec_ep>; }; };
        ...
        port@10 { snd_10_ep: endpoint { remote-endpoint = <&a2b10_codec_ep>; }; };
      };
    };

    a2b@68 {
      compatible = "adi,ad2428";
      ...

      node@0 {
        codec {
          port { a2b0_codec_ep: endpoint { remote-endpoint = <&snd_0_ep>; }; };
        };
      };

      node@1 {
        codec {
          port { a2b1_codec_ep: endpoint { remote-endpoint = <&snd_1_ep>; }; };
        };
      };

      ...

      node@10 {
        codec {
          port { a2b1_codec_ep: endpoint { remote-endpoint = <&snd_10_ep>; }; };
        };
      };
    };

  The question I have is, how can I ensure that the machine driver will
  probe (sound node) when discovery has completed, even if not all
  codecs are available because not all A2B nodes are connected?

  I understand this might be pushing the limits of device tree somewhat,
  but ASoC is quite device tree heavy and I would like to get some
  advice on what the best way to proceed is. And if going for the
  proposed amendment above (in the style of i2c, with discovery
  integrated into a2b_bus_probe()), will post-init-providers still save
  me in the above situation?

  Perhaps there is a simpler approach here if the assumption I quoted at
  the top of this section is not so crucial. In that case, maybe the
  current implementation is OK?

  Device dependencies and discovery
  ---------------------------------

  Yet another complication that we have recently come upon is what to do
  when the discovery of a node N requires probing devices which
  topologically are beneath the I2C controller of node N. Concretely, we
  have two boards 1 and 2 where the B-side of board 1's A2B node is
  routed through a mux. The mux is controlled via GPIO, and those GPIOs
  are exported by an I2C GPIO expander connected to board 1's A2B's I2C
  controller. Suppose board 1's A2B node is called sub1 and board 2's is
  called sub2. Then the situation looks like this:

                               X
               ┌──────┐        X        ┌──────┐
               │      │     ┌─────┐     │      │
        ... XXX│ sub1 │XXXXX│ mux │XXXXX│ sub2 │
               │      │     └──▲──┘     │      │
               └──────┘        │        └──────┘
                   │           │
                   │ I2C       │
                   │           │
               ┌──────┐        │
               │ GPIO │────────┘
               └──────┘

  The mux itself can be modelled as a simple GPIO mux and hence a
  platform driver. But in order to discover node sub2, it must get
  probed and configured appropriately; the default hardware strapping
  would cause discovery to fail.

  This is not a crucial issue right now and is something we can work
  around, and I don't think it's necessarily a blocker for getting this
  series merged upstream. But feedback on how to approach this might
  inform some useful changes to this series.

  The issue here is that some driver needs to acquire the mux and set
  it. The discovery process must be delayed as long as this returns
  -EPROBE_DEFER. Would it be appropriate for the A2B core to acquire
  this mux based on device tree properties of sub1?

Thank you in advance for all review comments and feedback.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
Alvin Šipraga (13):
      a2b: add A2B driver core
      regmap: add A2B support
      dt-bindings: a2b: Analog Devices AD24xx devices
      a2b: add AD24xx I2C interface driver
      a2b: add AD24xx node driver
      gpio: add AD24xx GPIO driver
      ASoC: codecs: add AD24xx codec driver
      clk: add AD24xx clock driver
      i2c: add AD24xx I2C controller driver
      dt-bindings: vendor-prefixes: add Bang & Olufsen a/s
      dt-bindings: a2b: add compatible string for Beosound Shape node
      a2b: add Beosound Shape node driver
      MAINTAINERS: add maintainership for A2B drivers

 .../devicetree/bindings/a2b/adi,ad24xx-clk.yaml    |   53 +
 .../devicetree/bindings/a2b/adi,ad24xx-codec.yaml  |   52 +
 .../devicetree/bindings/a2b/adi,ad24xx-gpio.yaml   |   76 ++
 .../devicetree/bindings/a2b/adi,ad24xx-i2c.yaml    |   55 +
 .../devicetree/bindings/a2b/adi,ad24xx.yaml        |  254 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |   12 +
 drivers/Kconfig                                    |    2 +
 drivers/Makefile                                   |    1 +
 drivers/a2b/Kconfig                                |   60 +
 drivers/a2b/Makefile                               |   13 +
 drivers/a2b/a2b.c                                  | 1252 ++++++++++++++++++++
 drivers/a2b/ad24xx-i2c.c                           |  532 +++++++++
 drivers/a2b/ad24xx-node.c                          |  887 ++++++++++++++
 drivers/a2b/ad24xx-node.h                          |   42 +
 drivers/a2b/beo-shape-node.c                       |  584 +++++++++
 drivers/base/regmap/Kconfig                        |    6 +-
 drivers/base/regmap/Makefile                       |    1 +
 drivers/base/regmap/regmap-a2b.c                   |   82 ++
 drivers/clk/Kconfig                                |    7 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-ad24xx.c                           |  341 ++++++
 drivers/gpio/Kconfig                               |    6 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-ad24xx.c                         |  302 +++++
 drivers/i2c/busses/Kconfig                         |    7 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-ad24xx.c                    |  121 ++
 include/linux/a2b/a2b.h                            |  444 +++++++
 include/linux/a2b/ad24xx.h                         |  892 ++++++++++++++
 include/linux/regmap.h                             |   38 +
 sound/soc/codecs/Kconfig                           |    5 +
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/ad24xx-codec.c                    |  665 +++++++++++
 34 files changed, 6798 insertions(+), 1 deletion(-)
---
base-commit: c75962170e49f24399141276ae119e6a879f36dc
change-id: 20231212-a2b-e54ba46a9e05


