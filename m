Return-Path: <linux-i2c+bounces-9313-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE0A297C1
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 18:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D57021687D0
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 17:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BCD1FE471;
	Wed,  5 Feb 2025 17:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CSQrz/Tv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8791FBEB0;
	Wed,  5 Feb 2025 17:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777176; cv=none; b=WdHkS1c7XKUk/lqx9vx/1K+QsKABcZuXlY3umxf7kwrweNKSPHpSzjNUHpJxOv+mT/1UFmZZO7xyB+m/bWtmgUinDL8FXmVIkH98G8nAFOkA9d2yKyO8Ntj1yiPINj73q3sg8k3d1Iih6HaKr4XuckN4tLjb6SeogJMl0Pn3N6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777176; c=relaxed/simple;
	bh=iPGpWcukwgcQYMBtj1bWM6A8f+g1aY4OhVhYbn9i4aE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JDDVSewkwn+GCNMRoIG7tSSw9UI4SeJF0RJCIJwJ5d/aC5cpkjrYYJgrPoWCJOKWFhbk3+jc3tJ88viPef9Qi74M0RklQoq2W5KzNJuW8+G0hpMN/ATLYW1ykqHxUS0flG7akb+e31wLZqUAehbEICZURuJb0ZeM05V0hwgrI+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CSQrz/Tv; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 5D825441DF;
	Wed,  5 Feb 2025 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738777165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=623Q7x1bgDoyQw0GOYCtBTZTf643FXfHV5kVHZTEuU0=;
	b=CSQrz/TvnB/mvfNTxmY7ZXbjAwsk9vZD4pEMQkrVOtQymv/FHyKyP9nc2CQ1yrk/lVwzj6
	SKonCLi87y2pJcl/rRJ6qoqh32lDe8/MXNVNhHH9Q9oy3wdOcRZIvx/bgK3DyaEI0GXlSt
	iI+vPO7vmkHg5owpPPt54LCfVMm8hxqvRWxYzQaip1AmKbUSkDCOCw8jrBvnBdR4BtMqtH
	D8pzARKv2sNy7Apj6Bis8fS9fW/L4CJyMswFpZR5TEl+mmNZ+DPtVm1B+bUZTb1rMa+Hwf
	d1qK1p72W4ohQ86ik/JfrYpiBbVMECtHdRObT0jUuwLHZIeG6u99oF0Wdg5NnA==
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [RFC PATCH 0/3] i2c: Introduce i2c bus extensions
Date: Wed,  5 Feb 2025 18:39:13 +0100
Message-ID: <20250205173918.600037-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephefgkeevfeeuueejleetjeeljeekhfefieevfeeifeeiieeigfetvdeigfejfeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdplhhptgdrvghvvghnthhspdhgihhthhhusgdrtghomhenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

The big picture behind this RFC series is to support a Linux device
with a connector to physically add and remove an add-on to/from the
main device to augment its features at runtime, adding devices on
non-discoverable busses, using device tree overlays.

The related big picture has been already presented in
  - the 'Add support for GE SUNH hot-pluggable connector' series [0]
  - the 'Runtime hotplug on non-discoverable busses with device tree
    overlays' talk at Linux Plumbers Conference 2024 [1].

This series focuses on the i2c related part.

An i2c bus is wired to the connector and allows an add-on board to
connect additional i2c devices to this bus.

When device tree nodes are added, the I2C core tries to probe client
devices based on the classic DT structure:

  i2c@abcd0000 {
      some-client@42 { compatible = "xyz,blah"; ... };
  };

However for hotplug connectors described via device tree overlays [0]
there is additional level of indirection, which is needed to decouple
the overlay and the base tree:

  --- base device tree ---

  i2c1: i2c@abcd0000 {
      compatible = "xyz,i2c-ctrl";
      i2c-bus-extension@0 {
          i2c-bus = <&i2c_ctrl>;
      };
      ...
  };

  i2c5: i2c@cafe0000 {
      compatible = "xyz,i2c-ctrl";
      i2c-bus-extension@0 {
          i2c-bus = <&i2c-sensors>;
      };
      ...
  };

  connector {
      i2c_ctrl: i2c-ctrl {
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

  i2c1: i2c@abcd0000 {
      compatible = "xyz,i2c-ctrl";
      i2c-bus-extension@0 {
          i2c-bus = <&i2c_ctrl>;
      };
      ...
  };

  i2c5: i2c@cafe0000 {
      compatible = "xyz,i2c-ctrl";
      i2c-bus-extension@0 {
          i2c-bus = <&i2c-sensors>;
      };
      ...
  };

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
(i2c@abcd0000) and the extension node (i2c-ctrl) are separate nodes.
Rightfully, only the former will probe into an I2C adapter, and it will
do that perhaps during boot, long before overlay insertion or after the
overlay has been inserted for instance if the I2C adapter is remove and
re-probed for whatever reason after the overlay insertion.

The extension node won't probe into an I2C adapter or any other device
or bus, so its subnodes ('eeprom@50') won't be interpreted as I2C
clients by current I2C core code.

The extension node is linked to the adapter node in two ways. The first
one with the i2c-bus-extension adapter sub-node and the second one with
the i2c-parent property in the extension node itself.

The purpose of those two links is to handle device probing in several
cases.

- First case: Adapter already probed when add-on devices are added

When devices are added by the overlay, an OF change notification is
triggered so that busses can support those new devices.

Going from a newly added device node, the i2c-parent property allows to
find the corresponding I2C adapter and register the new I2C client with
this adapter.

The patch 1 in this series proposes modification to handle this case
and, by the nature of the modification, all cases where a phandle refers
an extension node instead of the adapter node itself.

- Second case: Add-on devices already present in device-tree when
  adapter is probed

In this case, everything is already described in the device-tree and
then the adapter is probed.

OF change notifications don't play a role in this case either because
they were never triggered (the overlay was applied by the bootloader)
or they were triggered before the adapter is probed and so were
missed/ignored.

The adapter probe process registers device already described at the
adapter node level (current code) and, thanks to i2c-bus-extension
adapter sub-node and its i2c-bus property, it can also follow the
extension and registers devices described in those extension nodes.

The patch 2 and 3 in this series proposes modifications to handle this
case.

I know device-tree bindings for i2c-bus-extension and i2c-parent are not
yet provided in this RFC series.

I would like to discuss the proposal before going further and write
those needed bindinds (i2c-bus-extension needs to be added in
i2c-controller.yaml available in dt-schema repository [2]).

Best regards,
Hervé Codina

[0] https://lore.kernel.org/all/20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com/
[1] https://lpc.events/event/18/contributions/1696/
[2] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml

Herve Codina (3):
  i2c: core: Follow i2c-parent when retrieving an adapter from node
  i2c: i2c-core-of: Move children registration in a dedicated function
  i2c: i2c-core-of: Handle i2c bus extensions

 drivers/i2c/i2c-core-base.c | 43 ++++++++++++++++++++++++++++-
 drivers/i2c/i2c-core-of.c   | 54 +++++++++++++++++++++++++++++--------
 2 files changed, 85 insertions(+), 12 deletions(-)

-- 
2.47.1


