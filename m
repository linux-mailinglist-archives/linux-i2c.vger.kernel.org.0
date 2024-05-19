Return-Path: <linux-i2c+bounces-3590-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8068C9473
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 13:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3F74281195
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 11:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4C744C77;
	Sun, 19 May 2024 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYRYETdZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4821401B;
	Sun, 19 May 2024 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716118836; cv=none; b=VwkImj9veDAtX2FqGNSl7kzrOLdW3fVzEEie52XdGrnC1tXYIljwAAXjV8jS3NCEWPj+TAKetDaUcTyhaD099I+AyKeig6WJpI8K4zMwnxlefMplnZOxXzGFQTVHkYh65WFHVo3yHUuJ0wLc5aV4E9NQzBJ23TVqdSUBi1t1Asc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716118836; c=relaxed/simple;
	bh=XE+2nt77E9BjQRhQkjwv9byTbuCMNge4WdDHEESWL78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0i5UN8yyRIIkZ6MEJGbaVwhHL1GKMlO0csoE080Mb9x36NxVjRcIyRLVeDHVghvqS1CW1K+gjcqm1WhlWmWsGDhAoSFveh83B7jg/geD6Io0WOsiprKbR76Sw9BZKQaqEE8sxPc2XrWQJ+HxKD9+d47NUzbufEOjowVKlXNLDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYRYETdZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B37FC4AF07;
	Sun, 19 May 2024 11:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716118835;
	bh=XE+2nt77E9BjQRhQkjwv9byTbuCMNge4WdDHEESWL78=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eYRYETdZJTIqmQNL/AhLwwGO8suBlfW8ZFzsi8GDX9L8Y8EP9AhmJ3NU8DOP/HQmV
	 iLL9X6VpSUVYwyObtoJ0Rn144tNU9yxYywcau0JXPz7egJMBzSOev3/zvZEW8buq4j
	 5IzNJDvQy3ckwIEZSF+aWhgY3XOrlBQ8Jmott5V+Zv4T1nzz0dfIvjsII3VHe2wqmx
	 HEPdvqJlK7M5xe1m50WuBBW1BRDQPXxJxzNcTzNjDW9eqW1OAZyUWxwLbLDZix80Si
	 2ZmrBnhzNdmkWqLn6ckeI1zvy59vqSOemZsJRUFkbxibvXiCA7JKtQyfEEGk+1Qt4N
	 My60/TPNaFSsA==
Message-ID: <f1605873-c36c-4e61-8076-13a7094dc13b@kernel.org>
Date: Sun, 19 May 2024 13:40:25 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] dt-bindings: a2b: Analog Devices AD24xx devices
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Saravana Kannan <saravanak@google.com>
Cc: Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, =?UTF-8?Q?Alvin_=C5=A0ipraga?=
 <alsi@bang-olufsen.dk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
 <20240517-a2b-v1-3-b8647554c67b@bang-olufsen.dk>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240517-a2b-v1-3-b8647554c67b@bang-olufsen.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/05/2024 14:58, Alvin Šipraga wrote:
> From: Alvin Šipraga <alsi@bang-olufsen.dk>
> 
> Add device tree bindings for the AD24xx series A2B transceiver chips,
> including their functional blocks.
> 
> Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
> ---
>  .../devicetree/bindings/a2b/adi,ad24xx-clk.yaml    |  53 +++++

What is a2b and why clock bindings are not in clock?

>  .../devicetree/bindings/a2b/adi,ad24xx-codec.yaml  |  52 +++++
>  .../devicetree/bindings/a2b/adi,ad24xx-gpio.yaml   |  76 +++++++
>  .../devicetree/bindings/a2b/adi,ad24xx-i2c.yaml    |  55 +++++
>  .../devicetree/bindings/a2b/adi,ad24xx.yaml        | 253 +++++++++++++++++++++

Sorry, all this looks weirdly placed.

>  5 files changed, 489 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/a2b/adi,ad24xx-clk.yaml b/Documentation/devicetree/bindings/a2b/adi,ad24xx-clk.yaml
> new file mode 100644
> index 000000000000..819efaa6a3f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/a2b/adi,ad24xx-clk.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/a2b/adi,ad24xx-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices Inc. AD24xx clock functional block
> +
> +maintainers:
> +  - Alvin Šipraga <alsi@bang-olufsen.dk>
> +
> +allOf:
> +  - $ref: /schemas/clock/clock.yaml

Drop. There is no single binding doing this, which is usually a hint you
do something not correct.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad2420-clk
> +      - adi,ad2421-clk
> +      - adi,ad2422-clk
> +      - adi,ad2425-clk
> +      - adi,ad2426-clk
> +      - adi,ad2427-clk
> +      - adi,ad2428-clk
> +      - adi,ad2429-clk
> +

This is just incomplete. See other bindings how clock controller is written.

> +required:
> +  - compatible
> +  - clock-output-names
> +
> +unevaluatedProperties: false

additionalProperties: false
> +
> +examples:
> +  - |
> +    a2b {
> +      #address-cells = <1>;
> +      #size-cells = <0>;

Not related, drop entire node.

> +
> +      node@1 {
> +        compatible = "adi,ad2425-node";

Not related, drop entire node.

> +        reg = <1>;
> +        interrupts = <1>;
> +        adi,tdm-mode = <16>;
> +        adi,tdm-slot-size = <32>;
> +
> +        clock {
> +          compatible = "adi,ad2425-clk";
> +          #clock-cells = <1>;
> +          clock-indices = <1>;
> +          clock-output-names = "A2B1 CLKOUT2";
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/a2b/adi,ad24xx-codec.yaml b/Documentation/devicetree/bindings/a2b/adi,ad24xx-codec.yaml
> new file mode 100644
> index 000000000000..eee12f1c810e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/a2b/adi,ad24xx-codec.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/a2b/adi,ad24xx-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices Inc. AD24xx I2S/TDM functional block
> +
> +maintainers:
> +  - Alvin Šipraga <alsi@bang-olufsen.dk>
> +
> +allOf:
> +  - $ref: /schemas/sound/dai-common.yaml#

Why full path? It's the same directory, isn't it?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad2403-codec
> +      - adi,ad2410-codec
> +      - adi,ad2425-codec
> +      - adi,ad2428-codec
> +      - adi,ad2429-codec
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - '#sound-dai-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    a2b {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      node@2 {
> +        compatible = "adi,ad2428-node";
> +        reg = <2>;
> +        interrupts = <2>;
> +        adi,tdm-mode = <8>;
> +        adi,tdm-slot-size = <32>;

Same comments. Limited review follows.


...


> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false

Sorry, but not. No resources, nothing here. Do not create bindings just
to instantiate drivers.


...

> diff --git a/Documentation/devicetree/bindings/a2b/adi,ad24xx.yaml b/Documentation/devicetree/bindings/a2b/adi,ad24xx.yaml
> new file mode 100644
> index 000000000000..dcda15e8032a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/a2b/adi,ad24xx.yaml
> @@ -0,0 +1,253 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/a2b/adi,ad24xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices Inc. AD24xx Automotive Audio Bus A2B Transceiver
> +
> +description: |
> +  AD24xx chips provide A2B bus functionality together with several peripheral

What is A2B?

> +  functions, including GPIO, I2S/TDM, an I2C controller interface, and
> +  programmable clock outputs.
> +
> +maintainers:
> +  - Alvin Šipraga <alsi@bang-olufsen.dk>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad2403
> +      - adi,ad2410
> +      - adi,ad2425
> +      - adi,ad2428
> +      - adi,ad2429
> +

reg: is second property.

> +  reg-names:
> +    items:
> +      - const: base
> +      - const: bus
> +
> +  reg:
> +    items:
> +      - description: Normal I2C address of the chip
> +      - description: Auxiliary BUS_ADDR I2C address of the chip
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  clock-names:
> +    items:
> +      - const: sync

Again misordered. -names always follow main entry. Anyway, clock-names
for just one entry is not really useful.

> +
> +  clocks:
> +    items:
> +      - description: SYNC input pin clock source
> +
> +  vin-supply:
> +    description: Optional regulator for supply voltage to VIN pin
> +
> +  bus-supply:
> +    description: Optional regulator for out-of-band supply voltage to
> +      subodrinate nodes' VIN pins
> +
> +  interrupts: true

??? This must be specific.

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +patternProperties:
> +  '^node@[0-9]+$':
> +    type: object
> +    unevaluatedProperties: false

Why? This must be additionalProperties: false, or I miss something...

> +
> +    properties:
> +      compatible:
> +        enum:
> +          - adi,ad2401-node
> +          - adi,ad2402-node
> +          - adi,ad2403-node
> +          - adi,ad2410-node
> +          - adi,ad2420-node
> +          - adi,ad2421-node
> +          - adi,ad2422-node
> +          - adi,ad2425-node
> +          - adi,ad2426-node
> +          - adi,ad2427-node
> +          - adi,ad2428-node
> +          - adi,ad2429-node
> +
> +      reg:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      interrupt-controller: true
> +
> +      '#interrupt-cells':
> +        const: 1
> +
> +      gpio:
> +        $ref: adi,ad24xx-gpio.yaml#
> +
> +      codec:
> +        $ref: adi,ad24xx-codec.yaml#
> +
> +      i2c:
> +        $ref: adi,ad24xx-i2c.yaml#
> +
> +      clock:
> +        $ref: adi,ad24xx-clk.yaml#
> +
> +      adi,tdm-mode:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: TDM mode

Please do not add descriptions which are copies of property name. You
basically said ZERO here. Say something useful...

> +        enum: [2, 4, 8, 12, 16, 20, 24, 32]
> +
> +      adi,tdm-slot-size:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: TDM slot size
> +        enum: [16, 32]
> +
> +      adi,invert-sync:
> +        description: Falling edge of SYNC pin indicates the start of an audio
> +          frame, as opposed to rising edge.
> +        type: boolean
> +
> +      adi,early-sync:
> +        description: The SYNC pin changes one cycle before the MSB of the first
> +          data slot.
> +        type: boolean
> +
> +      adi,alternating-sync:
> +        description: Drive SYNC pin during first half of I2S/TDM data
> +          transmission rather than just pulsing it for once cycle.
> +        type: boolean
> +
> +      adi,rx-on-dtx1:
> +        description: Use the DTX1 pin for I2S/TDM RX in place of the DRX1 pin.
> +        type: boolean
> +
> +      adi,a2b-external-switch-mode-1:
> +        description: Use external switch mode 1 instead of 0 on the assumption
> +          that the downstream node is not using A2B bus power.
> +        type: boolean
> +
> +      adi,drive-strength:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Configures drive strength low (0) or high (1, default).
> +        enum: [0, 1]
> +        default: 1
> +
> +      adi,invert-interrupt:
> +        description: Invert polarity of IRQ pin, making it active low.
> +        type: boolean
> +
> +      adi,tristate-interrupt:
> +        description: Rather than always actively driving the IRQ pin, only drive
> +          when the interrupt is active and otherwise set to tristate (high-Z).
> +        type: boolean

It looks you put all children properties into parent node... With so
little explanation tricky to judge.

> +
> +    required:
> +      - compatible
> +      - reg
> +      - adi,tdm-mode
> +      - adi,tdm-slot-size
> +
> +    dependencies:
> +      interrupt-controller: [ '#interrupt-cells' ]
> +      '#interrupt-cells': [ interrupt-controller ]
> +
> +required:
> +  - compatible
> +  - reg-names
> +  - reg
> +  - clock-names
> +  - clocks
> +  - '#address-cells'
> +  - '#size-cells'
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - node@0
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    sync_clk: sync-clock {

Drop, not related.

> +          compatible = "fixed-clock";
> +          #clock-cells = <0>;
> +          clock-frequency = <48000>;
> +    };
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      a2b@68 {
> +        compatible = "adi,ad2428";
> +        reg-names = "base", "bus";
> +        reg = <0x68>, <0x69>;


Please follow DTS coding style. Do not introduce entire different style
and order of properties. reg-names IS NEVER the second property.



Best regards,
Krzysztof


