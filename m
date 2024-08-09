Return-Path: <linux-i2c+bounces-5273-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6635894D4C2
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 18:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95A2D1C2169A
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 16:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A41C208CA;
	Fri,  9 Aug 2024 16:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpANO2kj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F823D551;
	Fri,  9 Aug 2024 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723221199; cv=none; b=CCBBu0ZtC5p3lmMO6pOO7B2Swjai8vHoCux76x4aawAVZYQ4jObwyJBRAEjnfXe8Jpsdkxc6j5maV+jwO+WHoj9qQQl4DF8nCuWa8iP8GcpjYfXCgecPvIPAqAACq64LVm0hFInvxVYNIzNgrkU0WAfqd0fBO/KIm5TXYiooh2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723221199; c=relaxed/simple;
	bh=XC/qQpmOshEYF8U7yU/VK9HlEgr0jSs2SieZLK7Pjz0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=CsKOiWJYoFckT2DFStBOnre8zHT+LCXZvb0d5uTYlLBzLlAr6uv9N2IQetj13fqpZ1FMz1A9+LJ9gHRFY4lr65CK7Pgrh9SZ8eE+EOqIs6svkFpnvaa5S1Z8LDLuLn9XrSuKtGznhZNFMCMgcuGwRupJuFNu4CfnRkjdTPxxAQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpANO2kj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64940C32782;
	Fri,  9 Aug 2024 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723221198;
	bh=XC/qQpmOshEYF8U7yU/VK9HlEgr0jSs2SieZLK7Pjz0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=NpANO2kj24mAtvtCGVfgh2YWortGOLuvsgc+gej7F3/whHAxdt2HmbBfXVzJ3uy26
	 4tYzKQyC16nNxjAKQ6ZWLxyL6aUVbqXNgQXtinv+xzCN/xO5wYPQX4M/tfR8+YX7Hm
	 Js7Coz3CUkJZbvnnFcmPsmiM7wqDuj85eK7UzW5/yE4upXRfDlVRiYHvjxzc/Ddw6U
	 pevMiIWz/d5NKn/aNMGdB/GOa0iv5qgnQCw9MtrwOPAwpABrswkmZKBE/Sw+TnTYs9
	 8+vwxX4XmPQ9gSlICvDGYD2n7gKIHYTlGTYxLSpu+JBcFGnbmjtrnZmBHZ2BCGlaSV
	 SvRavsP9VP30Q==
Date: Fri, 09 Aug 2024 10:33:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 dri-devel@lists.freedesktop.org, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 linux-i2c@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Robert Foss <rfoss@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Derek Kiernan <derek.kiernan@amd.com>, 
 Saravana Kannan <saravanak@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 David Airlie <airlied@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 devicetree@vger.kernel.org
In-Reply-To: <20240809-hotplug-drm-bridge-v3-1-b4c178380bc9@bootlin.com>
References: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
 <20240809-hotplug-drm-bridge-v3-1-b4c178380bc9@bootlin.com>
Message-Id: <172322119734.685133.9977747524284458277.robh@kernel.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: connector: add GE SUNH hotplug
 addon connector


On Fri, 09 Aug 2024 17:34:49 +0200, Luca Ceresoli wrote:
> Add bindings for the GE SUNH add-on connector. This is a physical,
> hot-pluggable connector that allows to attach and detach at runtime an
> add-on adding peripherals on non-discoverable busses.
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

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.example.dtb: /: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.example.dtb: /: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240809-hotplug-drm-bridge-v3-1-b4c178380bc9@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


