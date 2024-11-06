Return-Path: <linux-i2c+bounces-7813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 203359BDB31
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 02:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 874FAB21CFF
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 01:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA62C188CAD;
	Wed,  6 Nov 2024 01:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/TogcHi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C22010E5;
	Wed,  6 Nov 2024 01:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730856566; cv=none; b=cZhhDe6CO7GQnL/9cR7Nfa1rS5cYGOlt7QMyexcHJYXYo0R+ikPfhDdcwjVgDekW4TEUlmLDvK0JpKQQeVp1Jwk5QVE4Iiy/8cXz5o9JsJnxWwrO/f+7mIwJcSYI8cD+jX+mO3u6U9gtXpt56xN5w5GjvhUOIAI4wgVxIoS9tiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730856566; c=relaxed/simple;
	bh=kv4Vaq993VuistPVWc2Sk+7GuVnhfNHl2gptDJKwH7s=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=YLpxNcMARbwYK4BQ5CHhEsYrM1nLE/GISoEcNAnK5HbHfvAbs7AMvXYCsO/C9eIcv61KmlUotnU2ewzHJfw3TI453Kx041WF/6zHaAaJ7JjOUn5n7XDVzE02KqOcAHjl05GKHak91e6nTJeUNZUVcr/1ie9Uo4uTXB/3CErDwtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/TogcHi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1195C4CECF;
	Wed,  6 Nov 2024 01:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730856566;
	bh=kv4Vaq993VuistPVWc2Sk+7GuVnhfNHl2gptDJKwH7s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=i/TogcHiR+QdIUCkjblx1VuteiTdMK/WDkHOlJgSjVGzg/ttBbb9HGTeucO9135kk
	 GCQwhm3Olgo4h/pPjjDhu71P6qnDGIcYJWmtQeqP+lB1xNfszESfvv7bNj5GaZyZv3
	 NUgqq2rZIrBd4WOUqlj7wJjI3EjbQQJfDarAg3WKvCWRlWzOJoW1c8yvwuN3G27NWe
	 Hr2YS2CIlgcabZxdWy6rVH7hbQeZp+xMDFcNSjqWoJiPekLcZPEd/K3dTVFk+n6SFW
	 hf0rXNYFECxt+ZdI7HrCeVDfP7GX8YIB3NrbwQ9SFXEGYcJHkCmsi6Zth/MrLpaq6I
	 pWSVZ129cO2Nw==
Date: Tue, 05 Nov 2024 19:29:24 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, tsbogend@alpha.franken.de, conor+dt@kernel.org, 
 krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-mips@vger.kernel.org, lee@kernel.org
In-Reply-To: <20241106001835.2725522-2-chris.packham@alliedtelesis.co.nz>
References: <20241106001835.2725522-1-chris.packham@alliedtelesis.co.nz>
 <20241106001835.2725522-2-chris.packham@alliedtelesis.co.nz>
Message-Id: <173085656399.878305.11912550915250449727.robh@kernel.org>
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: Add Realtek RTL9300 switch
 peripherals


On Wed, 06 Nov 2024 13:18:32 +1300, Chris Packham wrote:
> Add device tree schema for the Realtek RTL9300 switches. The RTL9300
> family is made up of the RTL9301, RTL9302B, RTL9302C and RTL9303. These
> have the same SoC differ in the Ethernet switch/SERDES arrangement.
> 
> Currently the only supported features are the syscon-reboot and i2c
> controllers. The syscon-reboot is needed to be able to reboot the board.
> The I2C controllers are slightly unusual because they each own an SCL
> pin (GPIO8 for the first controller, GPIO 17 for the second) but have 8
> common SDA pins which can be assigned to either controller (but not
> both).
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Notes:
>     Changes in v9:
>     - None
>     Changes in v8:
>     - Add r-by from Krzysztof
>     - At Lee's request I've separated the i2c binding into a separate patch.
>       This one still has a $ref to it so technically the i2c one needs to go
>       first but they'll be coming in via different trees so they may not
>       arrive in that order.
>     Changes in v7:
>     - Set additionalProperties: false
>     - Remove extraneous examples from i2c binding
>     Changes in v6:
>     - Drop wildcard compatible
>     - Add specific compatibles for the 4 known SoC variants
>     - For the i2c part of the binding accept realtek,rtl9301 as a fallback
>       for the other compatibles
>     - The overall switches will eventually differ because these will have
>       different SERDES/port arrangements so they aren't getting the same
>       fallback treatment
>     Changes in v5:
>       I've combined the two series I had in flight so this is the
>       combination of adding the switch syscon, the reboot and i2c. It makes
>       the changelog a bit meaningless so I've dropped the earlier
>       commentary.
> 
>       As requested I've put a more complete example in the main
>       rtl9300-switch.yaml.
> 
>       I've kept rtl9300-i2c.yaml separate for now but link to it with a $ref
>       from rtl9300-switch.yaml to reduce clutter. The example in
>       rtl9300-i2c.yaml is technically duplicating part of the example from
>       rtl9300-switch.yaml but I feel it's nice to be able to see the example
>       next to where the properties are defined.
> 
>  .../bindings/mfd/realtek,rtl9301-switch.yaml  | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.example.dtb: ethernet-switch@1b000000: reboot@c: 'offset' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/realtek,rtl9301-switch.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.example.dtb: ethernet-switch@1b000000: reboot@c: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/realtek,rtl9301-switch.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.example.dtb: ethernet-switch@1b000000: i2c@36c: False schema does not allow {'compatible': ['realtek,rtl9301-i2c'], 'reg': [[876, 20]], '#address-cells': 1, '#size-cells': 0, 'i2c@0': {'reg': [[0]], '#address-cells': 1, '#size-cells': 0, 'gpio@20': {'compatible': ['nxp,pca9555'], 'gpio-controller': True, '#gpio-cells': 2, 'reg': [[32]]}}, 'i2c@2': {'reg': [[2]], '#address-cells': 1, '#size-cells': 0, 'gpio@20': {'compatible': ['nxp,pca9555'], 'gpio-controller': True, '#gpio-cells': 2, 'reg': [[32]]}}}
	from schema $id: http://devicetree.org/schemas/mfd/realtek,rtl9301-switch.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.example.dtb: ethernet-switch@1b000000: i2c@388: False schema does not allow {'compatible': ['realtek,rtl9301-i2c'], 'reg': [[904, 20]], '#address-cells': 1, '#size-cells': 0, 'i2c@7': {'reg': [[7]], '#address-cells': 1, '#size-cells': 0, 'gpio@20': {'compatible': ['nxp,pca9555'], 'gpio-controller': True, '#gpio-cells': 2, 'reg': [[32]]}}}
	from schema $id: http://devicetree.org/schemas/mfd/realtek,rtl9301-switch.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.example.dtb: reboot@c: 'offset' is a required property
	from schema $id: http://devicetree.org/schemas/power/reset/syscon-reboot.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.example.dtb: reboot@c: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/reset/syscon-reboot.yaml#
Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.example.dtb: /example-0/ethernet-switch@1b000000/i2c@36c: failed to match any schema with compatible: ['realtek,rtl9301-i2c']
Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.example.dtb: /example-0/ethernet-switch@1b000000/i2c@388: failed to match any schema with compatible: ['realtek,rtl9301-i2c']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241106001835.2725522-2-chris.packham@alliedtelesis.co.nz

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


