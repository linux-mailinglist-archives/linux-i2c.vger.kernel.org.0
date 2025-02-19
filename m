Return-Path: <linux-i2c+bounces-9498-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DF9A3C025
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 14:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E08D7A339B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 13:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675F51E3790;
	Wed, 19 Feb 2025 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jyzTA/hk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB45A19CD01;
	Wed, 19 Feb 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972326; cv=none; b=ax0qWpQJtIMAvBfWTVpv0/GZZVbZsRVuU19HDHNsx7vUNwG+mX2nX0xhvAAuXdp7/Fgz5GuBss1gLsshoO2hj5WsRn0H0ItHZf6XzZGW6g0rvO3Q3MaCC6wcfc64cXewIi9JrmA7zxyqV/qt9aseIILH8RtysvFV2mtgJ8N+AdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972326; c=relaxed/simple;
	bh=ss+b8WFJ460bWqkMhzwN0V/1Oxr3SxGisl0KFPLpS6I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p6cEV740g/TYG5qyXwfCyU4TGY905tMtYE3bEcda2Artra65hc/qpkMdne4WO3QgTNEET5ttIoqhquH/TAP8x+YSbbN7wbtgdP0kgCh9oVFNt94XPNt9dynDPpvQfzg7q/6WR/jmeReesxUtrkl+Pe8bXs78eFqT/ERkZyONZB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jyzTA/hk; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8413A442F7;
	Wed, 19 Feb 2025 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739972322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=40VQPDLl9432aUrN3sAc+VkJbcJXajTxhY3GmtVBO3o=;
	b=jyzTA/hk2CspLLq+x9cJh7syK0+LIGn6EqqtqPFmwKa33Yy6M2hIK8NI0QM+3FKswz6lnL
	HUn9JiMz3g0KpuYt2WUwT44yZrdJjnYVPM42NNqIIRARogu8Anb/leIeYVgAPxcAtu46eV
	A5nXsUoVeSBoGUsSwlwtmhbZxZjDpNp7SxzGFAe/l2aC0W9U4Atz8OBIQvC77JksfpGP/O
	frxXq6v9F+uP2pL9D+dIX8jPDaONdpqti6Z+Z0nBpVkgt2RNCSTZ+Wzeq6IHa9pZiGmpuH
	rSif1XCrS+/T7NaBy+KxjsP5yMPOH4tnq2b9FvphL690g2mwt8Fttl3vqK9cdA==
Date: Wed, 19 Feb 2025 14:38:40 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 0/3] i2c: Introduce i2c bus extensions
Message-ID: <20250219143840.2730cddf@bootlin.com>
In-Reply-To: <20250205173918.600037-1-herve.codina@bootlin.com>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigeefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejueeggeehiedtvefhjedtveeugeehtdekteffkeeggeefkefhlefhfeetiedvheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhlphgtrdgvvhgvnhhtshdpghhithhhuhgsrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlr
 dhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Wolfram,

In order for me to move forward on this new feature sending a patch for the
binding or reworking my proposal can you provide feedback on the topic and
the current implementation available in this RFC.

Best regards,
Hervé

On Wed,  5 Feb 2025 18:39:13 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> The big picture behind this RFC series is to support a Linux device
> with a connector to physically add and remove an add-on to/from the
> main device to augment its features at runtime, adding devices on
> non-discoverable busses, using device tree overlays.
> 
> The related big picture has been already presented in
>   - the 'Add support for GE SUNH hot-pluggable connector' series [0]
>   - the 'Runtime hotplug on non-discoverable busses with device tree
>     overlays' talk at Linux Plumbers Conference 2024 [1].
> 
> This series focuses on the i2c related part.
> 
> An i2c bus is wired to the connector and allows an add-on board to
> connect additional i2c devices to this bus.
> 
> When device tree nodes are added, the I2C core tries to probe client
> devices based on the classic DT structure:
> 
>   i2c@abcd0000 {
>       some-client@42 { compatible = "xyz,blah"; ... };
>   };
> 
> However for hotplug connectors described via device tree overlays [0]
> there is additional level of indirection, which is needed to decouple
> the overlay and the base tree:
> 
>   --- base device tree ---
> 
>   i2c1: i2c@abcd0000 {
>       compatible = "xyz,i2c-ctrl";
>       i2c-bus-extension@0 {
>           i2c-bus = <&i2c_ctrl>;
>       };
>       ...
>   };
> 
>   i2c5: i2c@cafe0000 {
>       compatible = "xyz,i2c-ctrl";
>       i2c-bus-extension@0 {
>           i2c-bus = <&i2c-sensors>;
>       };
>       ...
>   };
> 
>   connector {
>       i2c_ctrl: i2c-ctrl {
>           i2c-parent = <&i2c1>;
>           #address-cells = <1>;
>           #size-cells = <0>;
>       };
> 
>       i2c-sensors {
>           i2c-parent = <&i2c5>;
>           #address-cells = <1>;
>           #size-cells = <0>;
>       };
>   };
> 
>   --- device tree overlay ---
> 
>   ...
>   // This node will overlay on the i2c-ctrl node of the base tree
>   i2c-ctrl {
>       eeprom@50 { compatible = "atmel,24c64"; ... };
>   };
>   ...
> 
>   --- resulting device tree ---
> 
>   i2c1: i2c@abcd0000 {
>       compatible = "xyz,i2c-ctrl";
>       i2c-bus-extension@0 {
>           i2c-bus = <&i2c_ctrl>;
>       };
>       ...
>   };
> 
>   i2c5: i2c@cafe0000 {
>       compatible = "xyz,i2c-ctrl";
>       i2c-bus-extension@0 {
>           i2c-bus = <&i2c-sensors>;
>       };
>       ...
>   };
> 
>   connector {
>       i2c-ctrl {
>           i2c-parent = <&i2c1>;
>           #address-cells = <1>;
>           #size-cells = <0>;
> 
>           eeprom@50 { compatible = "atmel,24c64"; ... };
>       };
> 
>       i2c-sensors {
>           i2c-parent = <&i2c5>;
>           #address-cells = <1>;
>           #size-cells = <0>;
>       };
>   };
> 
> Here i2c-ctrl (same goes for i2c-sensors) represent the part of I2C bus
> that is on the hot-pluggable add-on. On hot-plugging it will physically
> connect to the I2C adapter on the base board. Let's call the 'i2c-ctrl'
> node an "extension node".
> 
> In order to decouple the overlay from the base tree, the I2C adapter
> (i2c@abcd0000) and the extension node (i2c-ctrl) are separate nodes.
> Rightfully, only the former will probe into an I2C adapter, and it will
> do that perhaps during boot, long before overlay insertion or after the
> overlay has been inserted for instance if the I2C adapter is remove and
> re-probed for whatever reason after the overlay insertion.
> 
> The extension node won't probe into an I2C adapter or any other device
> or bus, so its subnodes ('eeprom@50') won't be interpreted as I2C
> clients by current I2C core code.
> 
> The extension node is linked to the adapter node in two ways. The first
> one with the i2c-bus-extension adapter sub-node and the second one with
> the i2c-parent property in the extension node itself.
> 
> The purpose of those two links is to handle device probing in several
> cases.
> 
> - First case: Adapter already probed when add-on devices are added
> 
> When devices are added by the overlay, an OF change notification is
> triggered so that busses can support those new devices.
> 
> Going from a newly added device node, the i2c-parent property allows to
> find the corresponding I2C adapter and register the new I2C client with
> this adapter.
> 
> The patch 1 in this series proposes modification to handle this case
> and, by the nature of the modification, all cases where a phandle refers
> an extension node instead of the adapter node itself.
> 
> - Second case: Add-on devices already present in device-tree when
>   adapter is probed
> 
> In this case, everything is already described in the device-tree and
> then the adapter is probed.
> 
> OF change notifications don't play a role in this case either because
> they were never triggered (the overlay was applied by the bootloader)
> or they were triggered before the adapter is probed and so were
> missed/ignored.
> 
> The adapter probe process registers device already described at the
> adapter node level (current code) and, thanks to i2c-bus-extension
> adapter sub-node and its i2c-bus property, it can also follow the
> extension and registers devices described in those extension nodes.
> 
> The patch 2 and 3 in this series proposes modifications to handle this
> case.
> 
> I know device-tree bindings for i2c-bus-extension and i2c-parent are not
> yet provided in this RFC series.
> 
> I would like to discuss the proposal before going further and write
> those needed bindinds (i2c-bus-extension needs to be added in
> i2c-controller.yaml available in dt-schema repository [2]).
> 
> Best regards,
> Hervé Codina
> 
> [0] https://lore.kernel.org/all/20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com/
> [1] https://lpc.events/event/18/contributions/1696/
> [2] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml
> 
> Herve Codina (3):
>   i2c: core: Follow i2c-parent when retrieving an adapter from node
>   i2c: i2c-core-of: Move children registration in a dedicated function
>   i2c: i2c-core-of: Handle i2c bus extensions
> 
>  drivers/i2c/i2c-core-base.c | 43 ++++++++++++++++++++++++++++-
>  drivers/i2c/i2c-core-of.c   | 54 +++++++++++++++++++++++++++++--------
>  2 files changed, 85 insertions(+), 12 deletions(-)
> 

