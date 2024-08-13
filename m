Return-Path: <linux-i2c+bounces-5339-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 263699508CD
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 17:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B1661C23FC9
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 15:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036641A00D0;
	Tue, 13 Aug 2024 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5Nl/hQ9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEB81E86A;
	Tue, 13 Aug 2024 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723562343; cv=none; b=QCnAwlSd6GTLDyjV5JFc1zm3svJY06/0V3ByLnI+iysQCvc6LLnkWrWmZuklU0ALQr23EIOHxvarmHCJSu0rj5DMenIFkBm2LKBFDtIuR7OkuKEvSwzIOaxyL2yRmUv2DxIOjWbPiEzHAT++50gV4NL5kB8dCg5nXTwlqEM+6Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723562343; c=relaxed/simple;
	bh=YwFk3U8RSbKyk1/SfrfSfkAz/KdTodY7CpaCz0Yr9dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEe9sVuKSHHWCzp4u2fB7UuYUOTLVn3U+QPP4KhittmrFN2oeuWqdnO4IYbldLQtrKKKlIrBq/mKbo/iidZwUgCSCov6px/+p/B+nddssc+WWFrGnizvVyoHFm0xgkvYgFhffRZyEZ31u3eBykSdSZ5a44qjJoHGpVFSMT19Keg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5Nl/hQ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD920C4AF0F;
	Tue, 13 Aug 2024 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723562343;
	bh=YwFk3U8RSbKyk1/SfrfSfkAz/KdTodY7CpaCz0Yr9dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k5Nl/hQ9T4TF5D2YCpoFawlSAwdVBdfHZkMTFAQpKzToPrZFJ8ynMYgBUb8zGIjx8
	 c6ycSMK4/4x6wVKGzJYtlDHpzeA1eny34jxsrjK9iLh3iKKb9jNk+1pud+RLeziQvq
	 1uxLfKWFjSl2B9MJKDx6ZcPS15EM0BoPdk4RTnRHRN8NOgK11qWaY/7tspw/D/WDEc
	 vEcoJp7ZtRuW2dAHqqH+WSC+9ebCd75wHJ/HCzb2qQ5QEZodMTZAQQfpG2QidTvXaa
	 AO6HXCQ96rr/aeQApRY2g9XKghTJzGNedTg3yLOIi3UMBBG6avbz0UVwlFB9piy7m6
	 TfHBmbd+YylhA==
Date: Tue, 13 Aug 2024 09:19:01 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paul Kocialkowski <contact@paulk.fr>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: connector: add GE SUNH hotplug addon
 connector
Message-ID: <20240813151901.GA953664-robh@kernel.org>
References: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
 <20240809-hotplug-drm-bridge-v3-1-b4c178380bc9@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809-hotplug-drm-bridge-v3-1-b4c178380bc9@bootlin.com>

On Fri, Aug 09, 2024 at 05:34:49PM +0200, Luca Ceresoli wrote:
> Add bindings for the GE SUNH add-on connector. This is a physical,
> hot-pluggable connector that allows to attach and detach at runtime an
> add-on adding peripherals on non-discoverable busses.

Overall, looks pretty good.

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v3:
>  - change the layout to only add subnodes, not properties
>  - add the 'nobus-devices' node description to hold devices not on any bus
>  - add 'i2c-*' nodes for the I2C busses, using a i2c-parent phandle
>  - and the 'dsi' node for the DSI bus
>  - move the entire port@1 node to the overlay (not only the remote-endpoint
>    property)
>  - remove the overlay examples (Overlays in examples are not supported)
>  - add more clarifying descriptions and comments for examples
>  - some rewording
> 
> This patch was added in v2.
> ---
>  .../connector/ge,sunh-addon-connector.yaml         | 185 +++++++++++++++++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 190 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml b/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml
> new file mode 100644
> index 000000000000..2a0b4e0fd089
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml
> @@ -0,0 +1,185 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/ge,sunh-addon-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GE SUNH hotplug add-on connector
> +
> +maintainers:
> +  - Luca Ceresoli <luca.ceresoli@bootlin.com>
> +
> +description:

You need '|' or '>' to preserve line breaks. Elsewhere too.

> +  Represent the physical connector present on GE SUNH devices that allows
> +  to attach and detach at runtime an add-on adding peripherals on
> +  non-discoverable busses. Peripherals on the add-on include I2C sensors
> +  and a video bridge controlled via I2C.
> +
> +  The connector has status GPIOs to notify the connection status to the CPU
> +  and a reset GPIO to allow the CPU to reset all the peripherals on the
> +  add-on. It also has I2C busses and a 4-lane MIPI DSI bus.
> +
> +  Different add-on models can be connected, each having different
> +  peripherals. For this reason each add-on has a model ID stored in a
> +  non-volatile memory, which is accessed in the same way on all add-ons.
> +
> +  Add-on removal can happen at any moment under user control and without
> +  prior notice to the CPU, making all of its components not usable
> +  anymore. Later on, the same or a different add-on model can be connected.
> +
> +properties:
> +  compatible:
> +    const: ge,sunh-addon-connector
> +
> +  reset-gpios:
> +    description: An output GPIO to reset the peripherals on the add-on.

Active state is?

> +    maxItems: 1
> +
> +  plugged-gpios:
> +    description: An input GPIO that is asserted if and only if an add-on is
> +      physically connected.

Asserted is high or low?

> +    maxItems: 1
> +
> +  powergood-gpios:
> +    description: An input GPIO that is asserted if and only if power rails
> +      on the add-on are stable.

Active state is?

> +    maxItems: 1
> +
> +  nobus-devices:

Just 'devices'.

> +    description:
> +      A container for devices not accessible via any data bus. Common use
> +      cases include fixed and GPIO regulators, simple video panels and LED
> +      or GPIO backlight devices. When not hot-pluggable, nodes such devices
> +      are children of the root node.
> +
> +      This node should not be present in the connector description in the
> +      base device tree. It should be added by overlays along with a subnode
> +      per device.
> +
> +    type: object
> +    additionalProperties: false

The schema needs to work with the overlay applied too. 'true' is fine 
here.

> +
> +  dsi:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +
> +        description:
> +          OF graph bindings modeling the MIPI DSI bus across the connector. The
> +          connector splits the video pipeline in a fixed part and a removable
> +          part.
> +
> +          The fixed part of the video pipeline includes all components up to
> +          the display controller and 0 or more bridges. The removable part
> +          includes any bridges and any other components up to the panel.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description:
> +              The last point of the non-removable part of the MIPI DSI bus
> +              line. The remote-endpoint sub-node must point to the last
> +              non-removable video component of the video pipeline.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description:
> +              The first point of the removable part of the MIPI DSI bus
> +              line.  The remote-endpoint sub-node must point to the first
> +              video pipeline component on the add-on. As it describes the
> +              hot-pluggable hardware, the endpoint node cannot be filled
> +              until an add-on is detected, so this node needs to be added
> +              by a device tree overlay at runtime.
> +
> +        required:
> +          - port@0
> +          # port@1 is added by the overlay for any add-on using the DSI lines
> +
> +    required:
> +      - ports
> +
> +patternProperties:
> +  '^i2c-(dbat|gp|btp)$':
> +    description:
> +      An I2C bus that goes through the connector. The adapter (and possibly
> +      some clients) are on the fixed side. Add-ons that have any clients on
> +      this bus have to be added by the add-on overlay, inside this node.
> +
> +    $ref: /schemas/i2c/i2c-controller.yaml#
> +    unevaluatedProperties: false
> +    type: object
> +
> +    properties:
> +      i2c-parent:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          Phandle pointing to the I2C bus controller on the fixed side that
> +          drives this bus
> +
> +required:
> +  - compatible
> +  - i2c-dbat
> +  - i2c-gp
> +  - i2c-btp
> +  - dsi
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  # This is the description of the connector as it should appear in the
> +  # main DTS describing the "main" board up to the connector. This is
> +  # supposed to be used together with the overlays in the two following
> +  # examples. The addon_connector and hotplug_conn_dsi_out labels are
> +  # referenced by the overlays in those examples.
> +  - |
> +    / {
> +        #include <dt-bindings/gpio/gpio.h>
> +
> +        addon_connector: addon-connector {
> +            compatible = "ge,sunh-addon-connector";
> +            reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
> +            plugged-gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
> +            powergood-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
> +
> +            i2c-dbat {
> +                i2c-parent = <&i2c5_ch2>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                // device subnodes to be added by overlays
> +            };
> +
> +            i2c-gp {
> +                i2c-parent = <&i2c4>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                // device subnodes to be added by overlays
> +            };
> +
> +            i2c-btp {
> +                i2c-parent = <&i2c3>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                // device subnodes to be added by overlays
> +            };
> +
> +            dsi {
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                        reg = <0>;
> +
> +                        endpoint {
> +                            remote-endpoint = <&previous_bridge_out>;
> +                        };
> +                    };
> +
> +                    // port@1 to be added by overlay
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42decde38320..9e902db825d7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10254,6 +10254,11 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml
>  F:	drivers/iio/pressure/mprls0025pa*
>  
> +HOTPLUG CONNECTOR FOR GE SUNH ADDONS
> +M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml
> +
>  HP BIOSCFG DRIVER
>  M:	Jorge Lopez <jorge.lopez2@hp.com>
>  L:	platform-driver-x86@vger.kernel.org
> 
> -- 
> 2.34.1
> 

