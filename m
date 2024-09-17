Return-Path: <linux-i2c+bounces-6812-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1964197AD38
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 10:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 929981F236F0
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 08:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0681662E8;
	Tue, 17 Sep 2024 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="i6V6HJvx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEC014D444;
	Tue, 17 Sep 2024 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726563203; cv=none; b=F59uyhe4cMFIZvD5jxF/n16HVy2J1ISJ9wws3AwSGJHbmlUa94yQcE6RNRec3BIgYxfD4xv53fL5Dy4rYidEqEexJQQFH3G3IDYoBIcqcQcqw14Fqna16ILr93tde1R3BowbZrV5yVYDMfo6qVN4GrQg8bNiZpXSKrnouYrjeuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726563203; c=relaxed/simple;
	bh=lFaD0/kTE7QPfPS9c4XmDsehPKstsbBEFuL82ZJUByM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IbcYJgi+kbFmwelZH2ldrXq7B6n/4bvZLkslz5GNv0Cfi3YdWuXn2SrgAGMYJdRMniFudivEOqlFMtFvfKcW8tZwmiIcwzaNSE/VVXcFOEqdCFQAcG5VAPwKHOZLfWRLpOaz2iA3DGj8zvWzdJ5OcqAvCv1GZZQenhkI+756lQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=i6V6HJvx; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7161240010;
	Tue, 17 Sep 2024 08:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726563197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bzu2/LmSSLYu3+75znhBlPlRp+dz7fISgxExqm/c8QM=;
	b=i6V6HJvxmhhvu5Zd6EyaEPZ++xBUKLhkGVTkSR25mE/usbouz88eTxcbGt9wtvfaLo81Cm
	lJOgqyH96kaOdO41T0SU/H+tvQWHesZkgOIvvxN/LxS7a2zYraFHSzDbR0DMrmLFk78Y6W
	/zSnitoIe4Wp+Y9VdkC/KI76RYbg/xL/W89S75L2tKC8ZlvIj+82MlxQItJXSVfUqNb82+
	Be1GJSFDC2eSODOvB85dskjwI2pk+E03miSR4OYWTZR0UnXt/nD8kb2WK87rtXmLKDOEN2
	WlQb9/Rot73SvB65iwU+7CFO8WER+9GDqtphDC8M+tigV/+hhg4CV6Gb8CmtCA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v4 0/8] Add support for GE SUNH hot-pluggable connector
Date: Tue, 17 Sep 2024 10:53:04 +0200
Message-Id: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFD6WYC/23PTQqDMBAF4KtI1k3Jj4naVe9RumiSUQNqJLGhR
 bx7oxSk1OUb5n3DzCiAtxDQJZuRh2iDdUMK+SlDun0MDWBrUkaMsJxwWuHWTWP3bLDxPVbemrR
 BpSolyKKGiqFUHD3U9rWht3vKrQ2T8+/tRqTr9MsxecRFignOlaBKgCqEEVfl3NTZ4axdj1Yws
 h0RlBwiLCGgOauZltII+Y/wHSnJ4WORJ0TlmhYlL4nS1S+yLMsHQFr+9UABAAA=
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello,

this series aims at supporting a Linux device with a connector to
physically add and remove an add-on to/from the main device to augment its
features at runtime, adding devices on non-discoverable busses, using
device tree overlays.

Changes since v4 are limited, but I'm sending this to have the state of the
art public before the discussion at the Lonux Plumbers Conference tomorrow
(https://lpc.events/event/18/contributions/1750/). See the changelog at the
end for the details.

The high-level description below is an updated version of to the one in v3.

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
and reset GPIOs. It also provides specific nodes for the various interfaces
(I2C and DSI). Here is how the connector is represented in the fixed part
of the device tree:

    / {
        #include <dt-bindings/gpio/gpio.h>

        addon_connector: addon-connector {
            compatible = "ge,sunh-addon-connector";
            reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
            plugged-gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;

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

The driver detects the connection status from the "plugged" GPIO and reacts
to a connection event by loading a first overlay (the "base" overlay, see
below).

The 'i2c-*' nodes represent the hot-pluggable section of I2C busses
crossing the connector, whose controller is on the main board but which
have devices on the add-on. There is one node per each such bus: this
allows full decoupling between the base board and the overlay, but requires
an additional info to associate the 'i2c-*' node to the physical bus
controller.

Similarly, the 'dsi' node describes how the two sides of the MIPI DSI bus
connect to each other. The base device tree describes the fixed part of the
video pipeline as 'port@0', i.e. the physical bus that terminates on the
connector. 'port@1', representing the continuation of the video bus on the
add-on, will be added by an overlay.

The 'dsi' node would also allow to describe a similar connector having
multiple video busses: these would have one node each, such as 'dsi-foo',
'dsi-bar', 'lvds-foo', 'lvds-bar' etc while keeping the ports for each
connector appropriately separated.

2: the "base" overlay

The "base" overlay describes the common components that are required to
read the model ID. These components are identical for all add-on models,
thus only one "base" overlay is needed:

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

Note the overlay does not have a target node. This allows the overlay to be
fully decoupled from the base tree, and to allow multiple compatible
connectors on the same base board. It also avoids the need to add
properties to nodes in the base tree by avoiding phandle references across
the overlay boundaries. With an exception. Indeed the 'nvmem-cells' and
'nvmem-cell-names' are the only two properties added to a node that is in
the base tree. This is still waiting for a different representation to
avoid adding such properties and all the deadprops and leaks thereof.

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

                devices {
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
those DSI lines to something, in this case the SN65DSI84 DSI-to-LVDS bridge
and from to an LVDS panel.

The 'devices' node, containts one subnode for each device that is not on
any CPU-reachable bus (I2C, DSI, etc): fixed/GPIO regulators, backlight,
the panel etc. In normal (no overlay) device tree systems nodes for these
devices are children of the root node, and are probed as platform devices
by kernel code. With the connector we need to have them under the connector
node, and the choice was to let them be children of the connector node or
to group them into a new subnode. We chose the latter because that provides
a more explicit representation of reality, and is coherent with the 'dsi'
and 'i2c-*' nodes. As a good side effect for the implementation, this means
other nodes under the connector node (dsi, i2c-*) are not considered when
populating platform devices.

After these steps, the add-on is fully described and working on the
system. When the "plugged" GPIO reports a disconnection, the overlays are
unloaded in reverse order and devices removed.

DRM hotplug bridge driver
=========================

DRM natively supports pipelines whose display can be removed, but all the
components preceding it (all the display controller and any bridges) are
assumed to be fixed and cannot be plugged, removed or modified at runtime.

This series adds support for DRM pipelines having a removable part after
the encoder, thus also allowing bridges to be removed and reconnected at
runtime, possibly with different components.

This picture summarizes the DRM structure implemented by this series:

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

Changes in v4:
- Replaced DRM bridge notifier with a new callback in struct drm_bridge_funcs
- Added patch for missing devlink (LEDs used by backlight)
- Various cleanups
- Rebased on v6.11
- Link to v3: https://lore.kernel.org/r/20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com

Changes in v3 (too many changes in v3 to mention them all, but here are the
big ones):
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
Luca Ceresoli (8):
      dt-bindings: connector: add GE SUNH hotplug addon connector
      drm/bridge: allow bridges to be informed about added and removed bridges
      drm/encoder: add drm_encoder_cleanup_from()
      drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges
      i2c: i2c-core-of: follow i2c-parent phandle to probe devices from added nodes
      backlight: led-backlight: add devlink to supplier LEDs
      [RFC] driver core: devlink: do not unblock consumers without any drivers found
      misc: add ge-addon-connector driver

 .../connector/ge,sunh-addon-connector.yaml         | 177 ++++++
 MAINTAINERS                                        |  11 +
 drivers/base/core.c                                |  21 -
 drivers/gpu/drm/bridge/Kconfig                     |  17 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/hotplug-bridge.c            | 661 +++++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c                       |  12 +
 drivers/gpu/drm/drm_encoder.c                      |  21 +
 drivers/i2c/i2c-core-of.c                          |   9 +
 drivers/misc/Kconfig                               |  18 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/ge-sunh-connector.c                   | 481 +++++++++++++++
 drivers/video/backlight/led_bl.c                   |  13 +
 include/drm/drm_bridge.h                           |  23 +
 include/drm/drm_encoder.h                          |   1 +
 15 files changed, 1446 insertions(+), 21 deletions(-)
---
base-commit: c377ce116b054708c8106e58a89123f1eb43e426
change-id: 20240319-hotplug-drm-bridge-16b86e67fe92

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


