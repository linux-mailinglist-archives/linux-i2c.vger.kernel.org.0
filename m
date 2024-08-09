Return-Path: <linux-i2c+bounces-5269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAA994D3A8
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 17:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0AA91C211D7
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 15:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C916619923C;
	Fri,  9 Aug 2024 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PwN7z2ND"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3335F1990C8;
	Fri,  9 Aug 2024 15:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723217753; cv=none; b=PjlyjiDJBbd3FxNrCLfn92vQktKQp0Fc7N+TDZk2+sXCLFFEdx5qV9aFb8bvPHLhlAxWTqM6alhpRgGtjbc2a7nuwISBe8me2A2oCsB0Z4El1WyZkbyy0tRtZgnIz2DrT73OsUZV+C3E20cDciMzoT5V9iGzbf8wyyt8BWWt6OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723217753; c=relaxed/simple;
	bh=ocZMV2xaZRwRSyqtwNwFF9qp0Jusuc2WJaJIXWvecIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SOdpqqJ9pLHXybJjD5ffoUwWwN2puM6zgYS7KavsLhypCTbJJBNhnRXrXJZQnFzNdDJVBFB8ON0Fg51sQ62eqKiZsiDvpRBdQplVc6bT+GT+HIjk1umx9AAhsiIb6Gi1laqIfjKpIiKsGextvVAjubYUOx/Sox43mF32B8QFd+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PwN7z2ND; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BF92C000A;
	Fri,  9 Aug 2024 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723217749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oSQ+hacy88j78to52wbL7L51YRPgyCpJ1CVB9WAt+iY=;
	b=PwN7z2NDVooO8+EOZkmmb7r2By95CHEx0lIPTHWFkZT15kwQ/Sh3ESOqF+esRpAp4r2LJn
	c8nqf5CpSU0HEBixhpsuj3U4wAltnbyxEseZkQP38gdsuiDqjBjxJFDQFqYOxq++ZvTDgf
	dY+Hl7fTwIgri5qWHvqRlXc94Sx+D6bu2/v5OYp1pjsG1qAgPmQpezT+dHLp7bvt3K/pFZ
	ChTgDzIoD3wViziS6UI5kp+hn9O09BXdHNq8PKWBEvX2Za+ZpkOJ3L+VCvX2q4rt0te/61
	pNT93dnokQIPhHNYklbNmPMtUOqEnN8bE0rokyuj4biUFajOXaVijBAnk7SADQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Aug 2024 17:34:53 +0200
Subject: [PATCH v3 5/7] i2c: i2c-core-of: follow i2c-parent phandle to
 probe devices from added nodes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-hotplug-drm-bridge-v3-5-b4c178380bc9@bootlin.com>
References: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
In-Reply-To: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
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

          eeprom@50 { ompatible = "atmel,24c64"; ... };
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


