Return-Path: <linux-i2c+bounces-6817-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7B197AD4C
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 10:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C2BD1C2178F
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 08:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8DC16132F;
	Tue, 17 Sep 2024 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NfCadUBK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE3F1607B2;
	Tue, 17 Sep 2024 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726563213; cv=none; b=MsbNpH1+uYCb99Tdw1WvroPewcT8Vx1oP+omC3yUIkxoeaLECSkOUgNau17mGTQQd6Z6AWGinzquMsc6PjoWyABO5lvMQtIcWt48Z/fZstzT1EAm34u2wDPF9ZVmesMyZmNXWKAiy9NVi6r08vB0l2/Orvoo2C33ilCEkJzqS8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726563213; c=relaxed/simple;
	bh=cJqQamecAfh1kKbIdUhrIjWf7sADs+aSb770KbZzL5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TFAMbT+1zh4e3+s66DDdlXAwM2PlfD8C5WdXMcGnHq54TuvAyU4lDErI9B9VSlFTJpl+K9W4EvMOrnhTXBEnChtYDpgUAeL7CvDsAaAi+DJltBKPp1YPyoniQDjHZKKfb3FR/gTk0F6Mi2aDWNKLWviklPF/UvehpCE/KsEW7OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NfCadUBK; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A76D4240013;
	Tue, 17 Sep 2024 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726563208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YGkP3RSqsbxDFwItYNCazpWcQ0c7RuUBa78KAXrpiwU=;
	b=NfCadUBKxqPYu6lRcHzEnzlZheitBAe4Ttqi8ZGF4JZQ5Z6p2QFavrsHR4D8Xn/jAN0CB2
	PsD/TalDeXXnmXMk00imlYrQOP+pCFcejlTO3c9QAHdLy9UeOmK+JRUiLHU0XeW6QeTJGo
	dUcGlEb+EUcD+GW9DRhZet3tfDo2uytn1WZb7mm2k80c7WYAlfeB4jEgOLIlFp0I1Kg+W/
	hAMQlnygkUAvQeQSjrezr1n0KJVgHlrI5WDNsu5t9GUjvZplsBuPZApHah9ni2r4zWTL+p
	AOPZBuW+4P8rYGB+R1miXNW2FRxDir4IGdF+P6hROcXKEgfV1ga6JWJjQ4HUSg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 17 Sep 2024 10:53:09 +0200
Subject: [PATCH v4 5/8] i2c: i2c-core-of: follow i2c-parent phandle to
 probe devices from added nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-hotplug-drm-bridge-v4-5-bc4dfee61be6@bootlin.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
In-Reply-To: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
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

When device tree nodes are added, the I2C core tries to probe client
devices based on the classic DT structure:

  i2c@abcd0000 {
      some-client@42 { compatible = "xyz,blah"; ... };
  };

However for hotplug connectors described via device tree overlays there is
additional level of indirection, which is needed to decouple the overlay
and the base tree:

  --- base device tree ---

  i2c1: i2c@abcd0000 { compatible = "xyz,i2c-ctrl"; ... };
  i2c5: i2c@cafe0000 { compatible = "xyz,i2c-ctrl"; ... };

  connector {
      i2c-ctrl {
          i2c-parent = <&i2c1>;
          #address-cells = <1>;
          #size-cells = <0>;
      };

      i2c-sensors {
          i2c-parent = <&i2c5>;
          #address-cells = <1>;
          #size-cells = <0>;
      };
  };

  --- device tree overlay ---

  ...
  // This node will overlay on the i2c-ctrl node of the base tree
  i2c-ctrl {
      eeprom@50 { compatible = "atmel,24c64"; ... };
  };
  ...

  --- resulting device tree ---

  i2c1: i2c@abcd0000 { compatible = "xyz,i2c-ctrl"; ... };
  i2c5: i2c@cafe0000 { compatible = "xyz,i2c-ctrl"; ... };

  connector {
      i2c-ctrl {
          i2c-parent = <&i2c1>;
          #address-cells = <1>;
          #size-cells = <0>;

          eeprom@50 { compatible = "atmel,24c64"; ... };
      };

      i2c-sensors {
          i2c-parent = <&i2c5>;
          #address-cells = <1>;
          #size-cells = <0>;
      };
  };

Here i2c-ctrl (same goes for i2c-sensors) represent the part of I2C bus
that is on the hot-pluggable add-on. On hot-plugging it will physically
connect to the I2C adapter on the base board. Let's call the 'i2c-ctrl'
node an "extension node".

In order to decouple the overlay from the base tree, the I2C adapter
(i2c@abcd0000) and the extension node (i2c-ctrl) are separate
nodes. Rightfully, only the former will probe into an I2C adapter, and it
will do that perhaps during boot, long before overlay insertion.

The extension node won't probe into an I2C adapter or any other device or
bus, so its subnodes ('eeprom@50') won't be interpreted as I2C clients by
current I2C core code. However it has an 'i2c-parent' phandle to point to
the corresponding I2C adapter node. This tells those nodes are I2C clients
of the adapter in that other node.

Extend the i2c-core-of code to look for the adapter via the 'i2c-parent'
phandle when the regular adapter lookup does not find one. This allows all
clients to be probed: both those on the base board (described in the base
device tree) and those on the add-on and described by an overlay.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Note: while this patch works for normal hotplug and unplug, it has some
weaknesses too, due to the implementation being in a OF change
notifier. Two cases come to mind:

 1. In the base device tree there must be _no_ nodes under the "extension
    node" (i2c-ctrl), or they won't be picked up as they are not
    dynamically added.

 2. In case the I2C adapter is unbound and rebound, or it probes after
    overlay insertion, it will miss the OF notifier events and so it won't
    find the devices in the extension node.

The first case is not a limiting factor: fixed I2C devices should just stay
under the good old I2C adapter node.

The second case is a limiting factor, even though not happening in "normal"
use cases. I cannot see any solution without making the adapter aware of
the "bus extensions" it has, so on its probe it can always go look for any
devices there. Taking into account the case of multiple connectors each
having an extension of the same bus, this may look as follows in device
tree:

  --- base device tree ---

  i2c1: i2c@abcd0000 {
      compatible = "xyz,i2c-ctrl"; ...
      i2c-bus-extensions = <&i2c_ctrl_conn0, &i2c_ctrl_conn1>;
  };

  connector@0 {
      i2c_ctrl_conn0: i2c-ctrl {
          i2c-parent = <&i2c1>;
          #address-cells = <1>;
          #size-cells = <0>;
      };
  };

  connector@1 {
      i2c_ctrl_conn1: i2c-ctrl {
          i2c-parent = <&i2c1>;
          #address-cells = <1>;
          #size-cells = <0>;
      };
  };

I'd love to have some feedback and opinions about the basic idea before
digging into the details of this additional step.

---

Changes in v4:
 - fix a typo in commit message

This patch first appeared in v3.
---
 drivers/i2c/i2c-core-of.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index a6c407d36800..71c559539a13 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -170,6 +170,15 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 	switch (of_reconfig_get_state_change(action, rd)) {
 	case OF_RECONFIG_CHANGE_ADD:
 		adap = of_find_i2c_adapter_by_node(rd->dn->parent);
+		if (adap == NULL) {
+			struct device_node *i2c_bus;
+
+			i2c_bus = of_parse_phandle(rd->dn->parent, "i2c-parent", 0);
+			if (i2c_bus) {
+				adap = of_find_i2c_adapter_by_node(i2c_bus);
+				of_node_put(i2c_bus);
+			}
+		}
 		if (adap == NULL)
 			return NOTIFY_OK;	/* not for us */
 

-- 
2.34.1


