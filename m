Return-Path: <linux-i2c+bounces-5264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA74594D395
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 17:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CF321F22878
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 15:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15462198A39;
	Fri,  9 Aug 2024 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D+7PCffA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C26A168DC;
	Fri,  9 Aug 2024 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723217748; cv=none; b=YZGsGvQNLeylhC+3HiPC7+v2P3Pd+n1zhKveOtILw/d6TZAJ9coRA7S8uy39qj3SgBU+HhmNk1Hzmhz+1stNRbsmASIDPxmWB91XihmzZX8UUfvVka61CdLuzTnMbKdPdDcv01wKjyeCXioWOakNd/3HtW5vjFJXL0wEEuL4t2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723217748; c=relaxed/simple;
	bh=UnIbCgU8yPXNgKZijoCF0eapQHWIWEqG8zD13bcXPww=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jECWR4326bWsgf8fdwGEZsoGe6D/WDjRzWMWlkbCiSljafaPEEG9ZRgxqQyugV/at/hK5S1HjnKvQHsYPzYJsEko+eJQjiNfQScIIL3Ky9xqEbUe1lC4S93XDzvM6FDY9F5WcXNpIYu2L4c5HVNyZYYVj3jFmee6YDu5W45njkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D+7PCffA; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13EAEC0003;
	Fri,  9 Aug 2024 15:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723217738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RuHJlTV54M/i6HRJUGYk/PhFAaX3+AWXoP4eAaMGgYg=;
	b=D+7PCffAepYqM7DXwwY2vqiroKW/mysGQKbmrPQ2hzVurAhhf7H8D4v9EOfIMkN2y19B+W
	7+LgPOf/kMm4wqAg5ELFDAm/bZq4nFhmFeN4tW08PkBiazM6Xb2j64hOsw7V46W5K+SE/n
	tDnKJ5Pz2datfovENwnxTX92UU8nNWRizSggyVjBALFwiFY4I9lLZ0f692jsn5+QBmvP9F
	tGQUAGdBMMZpEAAM+gAtuoCh2QL/iU3QGGuhLvoyjtOK/MmCt8G7qeUkNkLoaYvDUEkP24
	/XsogLwXG61NCQEfaBM5CjqaeQtQua8O0IJ3DXSIjvJBw70gmjYRu77IF54dGQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v3 0/7] Add support for GE SUNH hot-pluggable connector
Date: Fri, 09 Aug 2024 17:34:48 +0200
Message-Id: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABg3tmYC/23NwQ6CMAyA4VcxOzvDChviyfcwHtxWoAkwsuGiI
 by7g5gYE45/036dWUBPGNjlMDOPkQK5IUV+PDDTPoYGOdnUDDIoslxUvHXT2D0bbn3PtSebNoT
 SZ4WqrLEClg5HjzW9NvR2T91SmJx/bz+iWKdfDtQeFwXPeKGl0BJ1Ka28auemjoaTcT1bwQg/R
 IpsF4GEoMmhBqOUleofWZblA/4KiFr7AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello,

this series aims at supporting a Linux device with a connector to
physically add and remove an add-on to/from the main device to augment its
features at runtime, using device tree overlays.

What's new in v3 (a lot!)
=========================

There are big changes compared to v2, in many areas. Here are the main
ones.

 * Totally new device tree structure, much more rational as recommended by
   Rob. Now overlays are fully decoupled from the connector and adding
   properties to nodes in the base tree is (almost) not needed
   anymore. Read below for a description of the new format.

 * The DRM hotplug-bridge driver now adds and removes dynamically a DRM
   connector on hot(un)plug, correctly representing the LVDS connector that
   comes and goes.

However a few new rough edges emerged that are not yet solved in this
v3. Discussion would help in finding the right direction:

 * Describing the NVMEM cell addition still requires adding two properties
   to a node in the base tree. Not sure the current NVMEM cell bindings
   allow to do better.

 * I2C is one of the non-discoverable busses and I added a patch to
   i2c-core-of.c to allow it to handle the new format. It works, but with
   two caveats, see patch 5 for the details.

 * Sima proposed various improvements to the DRM hotplug-driver. For now I
   only did the one that has userspace impact (dynamic creation and removal
   of a connector). The others are still pending, and not all are clear to
   me, so I'd be glad to discuss this again as part of this series.

 * An issue has emerged with the devlink usage in the regulator
   subsystem. I analyzed the problem but the solution I found may well be
   wrong. Details in patch 7.

Now back to introducing the series.

Use case
========

This series targets a professional product (GE SUNH) that is composed of a
"main" part running on battery, with the main SoC and able to work
autonomously with limited features, and an optional "add-on" that enables
more features by adding more hardware peripherals, some of which are on
non-discoverable busses such as I2C and MIPI DSI.

The add-on can be connected and disconnected at runtime at any moment by
the end user, and add-on features need to be enabled and disabled
automatically at runtime.

The add-on has status pins that are connected to GPIOs on the main board,
allowing the CPU to detect add-on insertion and removal. It also has a
reset GPIO allowing to reset all peripherals on the add-on at once.

The features provided by the add-on include a display and a battery charger
to recharge the battery of the main part. The display on the add-on has an
LVDS input but the connector between the base and the add-on has a MIPI DSI
bus, so a DSI-to-LVDS bridge is present on the add-on.

Different add-on models can be connected to the main part, and for this a
model ID is stored in the add-on itself so the software running on the CPU
on the main part knows which non-discoverable hardware to probe.

Overall approach
================

Device tree overlays appear as the most natural solution to support the
addition and removal of devices from a running system.

Several features are missing from the mainline Linux kernel in order to
support this use case:

 1. runtime (un)loading of device tree overlays is currently not exposed
 2. if enabled, overlay (un)loading exposes several issues and limitations
 3. the DRM subsystem assumes video bridges are non-removable

This series targets items 1 and 3 and some of the issues mentioned in item
2. Other issues are being handled separately (see "Device tree overlay
issues" below).

Device tree representation and connector driver
===============================================

The device tree description we propose involves 3 main parts.

1: the main (fixed) device tree

The main device tree describes the connector itself along with the status
and reset GPIOs. It also provides a 'ports' node to describe how the two
sides of the MIPI DSI bus connect to each other. So now, differently from
v1, there is no standalone representation of the DRM bridge because it is
not really a hardware component. Here is how the connector is represented
in the fixed part of the device tree:

    / {
        #include <dt-bindings/gpio/gpio.h>

        addon_connector: addon-connector {
            compatible = "ge,sunh-addon-connector";
            reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
            plugged-gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
            powergood-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;

            i2c-dbat {
                i2c-parent = <&i2c2_ch1>;
                #address-cells = <1>;
                #size-cells = <0>;
            };

            i2c-gp {
                i2c-parent = <&i2c5>;
                #address-cells = <1>;
                #size-cells = <0>;
            };

            i2c-btp {
                i2c-parent = <&i2c3>;
                #address-cells = <1>;
                #size-cells = <0>;
            };

            dsi {
                ports {
                    #address-cells = <1>;
                    #size-cells = <0>;

                    port@0 {
                        reg = <0>;

                        hotplug_bridge_sink: endpoint {
                            remote-endpoint = <&dsi_to_hotplug_bridge>;
                        };
                    };
                };
            };
        };
    };

The connector has a specific compatible string, and this series adds a
driver supporting it. This driver uses the device tree overlay loading and
unloading facilities already implemented by the kernel but not currently
exposed.

The driver detects the connection status from the GPIOs and reacts to a
connection event by loading a first overlay (the "base" overlay).

The 'i2c-*' nodes represent the hot-pluggable section of I2C busses
crossing the connector, whose controller is on the main board but which
have devices on the add-on. There is one node per each such bus: this
allows full decoupling between the base board and the overlay, but requires
an additional info to associate the 'i2c-*' node to the physical bus
controller.

Similarly, the 'dsi' node contains the fixed part of the video
pipeline. 'port@1' represents the physical bus that terminates on the
connector. 'port@1', representing the continuation of the video bus in the
add-on, is added by the overlay.

The 'dsi' node would also allow to describe a similar connector having
multiple video busses: these would have one node each, such as 'dsi-foo',
'dsi-bar', 'lvds-foo', 'lvds-bar' etc while keeping the ports for each
connector appropriately separated.

2: the "base" overlay

The "base" overlay describes the common components that are required to
read the model ID. These are identical for all add-on models, thus only one
"base" overlay is needed:

    /dts-v1/;
    /plugin/;

    / {
        fragment@0 {
            target-path = "";

            __overlay__ {
                nvmem-cells = <&addon_id>;
                nvmem-cell-names = "id";

                i2c-dbat {
                    addon_eeprom: eeprom@51 {
                        compatible = "atmel,24c64";
                        reg = <0x51>;
                        pagesize = <32>;

                        nvmem-layout {
                            compatible = "fixed-layout";
                            #address-cells = <1>;
                            #size-cells = <1>;

                            /* Data cells */
                            addon_id: addon-id@400 {
                                reg = <0x400 0x1>;
                            };
                        };
                    };
                };
            };
        };
    };

Note the overlay does not have a target node, unlike the v2 series. This
allows the overlay to be fully decoupled from the base tree, and
conceptually to have multiple compatible connectors on the same board. It
also avoids the need to add properties to nodes in the base tree, with an
exception.

Indeed this v3 the 'nvmem-cells' and 'nvmem-cell-names' are the only two
properties added to a node that is in the base tree. This is still waiting
for a different representation to avoid adding such properties and all the
deadprops and leaks thereof.

Here an I2C device is added by a subnode of 'i2c-dbat' for an EEPROM. The
i2c-dbat node itself is already present in the base tree, carrying the link
to the actual I2C adapter node.

The EEPROM holds the model ID of each add-on, using always the same I2C
address and memory offset.

3: the "add-on-specific" overlay

Based on the model ID, the connector driver loads the second overlay, which
describes all the add-on hardware not yet described by the base
overlay. This overlay is model-specific.

Excerpt:

    / {
        fragment@0 {
            target-path = "";

            __overlay__ {
                dsi {
                    ports {
                        port@1 {
                            reg = <1>;
                            hotplug_bridge_source: endpoint {
                                remote-endpoint = <&sn65dsi84_from_bridge>;
                            };
                        };
                    };
                };

                i2c-gp {
                    #address-cells = <1>;
                    #size-cells = <0>;

                    dsi-lvds-bridge@2c {
                        compatible = "ti,sn65dsi84";
                        reg = <0x2c>;

                        ports {
                            port@0 {
                                reg = <0>;

                                sn65dsi84_from_bridge: endpoint {
                                    remote-endpoint = <&hotplug_bridge_source>;
                                    data-lanes = <1 2 3 4>;
                                };
                            };
                            port@2 {
                                reg = <2>;

                                sn65dsi84_out0: endpoint {
                                    remote-endpoint = <&panel_dsi_lvds_in0>;
                                };
                            };
                            port@3 {
                                reg = <3>;

                                sn65dsi84_out1: endpoint {
                                    remote-endpoint = <&panel_dsi_lvds_in1>;
                                };
                            };
                        };
                    };
                };

                nobus-devices {
                    reg_addon_3v3_lcd: regulator-addon-3v3-lcd {
                        compatible = "regulator-fixed";
                        regulator-name = "3V3_LCD_ADDON";
                        ...
                    };

                    backlight_addon: backlight-addon {
                        compatible = "led-backlight";
                        ...
                    };

                    addon_panel_dsi_lvds: panel-dsi-lvds {
                        compatible = "...";
                        power-supply = <&reg_addon_3v3_lcd>;
                        backlight = <&backlight_addon>;

                        ports {
                            #address-cells = <1>;
                            #size-cells = <0>;
                            port@0{
                                reg = <0>;
                                dual-lvds-odd-pixels;
                                panel_dsi_lvds_in0: endpoint {
                                    remote-endpoint = <&sn65dsi84_out0>;
                                };
                            };

                            port@1{
                                reg = <1>;
                                dual-lvds-even-pixels;
                                panel_dsi_lvds_in1: endpoint {
                                    remote-endpoint = <&sn65dsi84_out1>;
                                };
                            };
                        };
                    };
                };
            };
        };
    };

Here the 'dsi/ports/port@1' node is completing the 'dsi' section already
present in the base tree, thus describing that this add-on is connecting
those DSI lines to something, in this case the DSI-to-LVDS bridge and a
panel.

The 'nobus-devices' node, which is also new in this v3, containts one
subnode for each device that is not on any CPU-reachable bus (I2C, DSI,
etc): fixed/GPIO regulators, backlight, the panel etc. Nodes for these
devices are children of the root node in normal (no overlay) device tree
systems, and are probed as platform devices by kernel code. With the
connector we need to have them under the connector node, and the choice was
to let them be children of the connector node or to group them into a new
subnode. We chose the latter because that provides a more explicit
representation of reality, and is coherent with the 'dsi' and 'i2c-*'
nodes. As a good side effect for the implementation, this means other nodes
under the connector node (dsi, i2c-*) are not considered when populating
platform devices.

After these steps, the add-on is fully described and working on the
system. When the status GPIOs report a disconnection, the overlays are
unloaded in reverse order.

DRM hotplug bridge driver
=========================

DRM natively supports pipelines whose display can be removed, but all the
components preceding it (all the display controller and any bridges) are
assumed to be fixed and cannot be plugged, removed or modified at runtime.

This series adds support for DRM pipelines having a removable part after
the encoder, thus also allowing bridges to be removed and reconnected at
runtime, possibly with different components.

This picture summarizes the  DRM structure implemented by this series:

 .------------------------.
 |   DISPLAY CONTROLLER   |
 | .---------.   .------. |
 | | ENCODER |<--| CRTC | |
 | '---------'   '------' |
 '------|-----------------'
        |
        |DSI            HOTPLUG
        V              CONNECTOR
   .---------.        .--.    .-.        .---------.         .-------.
   | 0 to N  |        | _|   _| |        | 1 to N  |         |       |
   | BRIDGES |--DSI-->||_   |_  |--DSI-->| BRIDGES |--LVDS-->| PANEL |
   |         |        |  |    | |        |         |         |       |
   '---------'        '--'    '-'        '---------'         '-------'

 [--- fixed components --]  [----------- removable add-on -----------]

Fixed components include:

 * all components up to the DRM encoder, usually part of the SoC
 * optionally some bridges, in the SoC and/or as external chips

Components on the removable add-on include:

 * one or more bridges
 * a fixed connector (not one natively supporting hotplug such as HDMI)
 * the panel

The video bus is MIPI DSI in the example and in the implementation provided
by this series, but the implementation is meant to allow generalization to
other video busses without native hotplug support, such as parallel video
and LVDS.

Note that the term "connector" in this context is different from the "DRM
connector" abstraction already present in the DRM subsystem (struct
drm_connector).

More details in the commit message of patch 4.

That's all
==========

Thanks for you patience in reading this!

Luca

Too many changes in v3 to mention them all, but here are the big ones:
- Rewrote the DT format to allow fully decoupled overlays and to avoid
  adding properties (with the NVMEM exception still to be solved)
- Implemented device instantiation based on the new DT format: i2c in
  i2c-core-of.c nobus-devices in the connector driver
- DRM: insert/remove an LVDS DRM connector on hot(un)plug events
- Added patch for a devlink issue on overlay removal (mostly to start
  discussion)
- Link to v2: https://lore.kernel.org/r/20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com

Changes in v2:
- Added bindings and driver for ge,sunh-addon-connector
- Removed bindings for the hotplug-video-connector, this is now represented
  in DT as part of the ge,sunh-addon-connector
- Various monior improvements to the DRM hotplug-bridge driver
- Link to v1: https://lore.kernel.org/r/20240326-hotplug-drm-bridge-v1-0-4b51b5eb75d5@bootlin.com

Co-developed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (6):
      dt-bindings: connector: add GE SUNH hotplug addon connector
      drm/encoder: add drm_encoder_cleanup_from()
      drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges
      i2c: i2c-core-of: follow i2c-parent phandle to probe devices from added nodes
      misc: add ge-addon-connector driver
      [DO NOT APPLY] driver core: do not unblock consumers any drivers found

Paul Kocialkowski (1):
      drm/bridge: add bridge notifier to be notified of bridge addition and removal

 .../connector/ge,sunh-addon-connector.yaml         | 185 ++++++
 MAINTAINERS                                        |  11 +
 drivers/base/core.c                                |  21 -
 drivers/gpu/drm/bridge/Kconfig                     |  15 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/hotplug-bridge.c            | 665 +++++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c                       |  35 ++
 drivers/gpu/drm/drm_encoder.c                      |  21 +
 drivers/i2c/i2c-core-of.c                          |   9 +
 drivers/misc/Kconfig                               |  18 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/ge-sunh-connector.c                   | 523 ++++++++++++++++
 include/drm/drm_bridge.h                           |  19 +
 include/drm/drm_encoder.h                          |   1 +
 14 files changed, 1504 insertions(+), 21 deletions(-)
---
base-commit: 5c2a33cdaccfa6ecc787f00fb8f034ffb03706be
change-id: 20240319-hotplug-drm-bridge-16b86e67fe92

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


