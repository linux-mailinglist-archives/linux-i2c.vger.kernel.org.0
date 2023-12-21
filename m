Return-Path: <linux-i2c+bounces-936-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EB381C0A0
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 23:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61FC31F228B9
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 22:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5000177F09;
	Thu, 21 Dec 2023 22:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmqWHv6N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE3277657;
	Thu, 21 Dec 2023 22:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D74C433C7;
	Thu, 21 Dec 2023 22:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703196053;
	bh=BMceOrXlyCYOCEEShEWT7LKLuoQaU2WjKCUjRN8knws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmqWHv6NHL5RK0Is2qEQ23JPVyjHnIwLpMnZVsM1GInSiGtW6Okr3vpqv1DO56haE
	 GLrLRJaZje8Qnhy+c/mSS9glUUI43LQsmj7JEpP7qGUf9a2bTvRNa6qFOe4oQEPMbh
	 nkzcuilXWobWBK1WD7QU4nYf9I4CC1eRtRmYZrcEwCEMEzaeSagbY+QV0pr5tiW6VZ
	 Hp+hwJA+wUwHdLW1d6YoHWalrif1QMXjtr5LG4SmXhIL4qJsQNZrBeKuWpMNWNmEyT
	 I6LGGm5RJXW1AYMP0zYlxaLnI5hW8+tnbSkAMW/cqeGm3JWND7/XQwVrjkyED8Z8Wq
	 05WJuXnmDeb4Q==
Received: (nullmailer pid 165405 invoked by uid 1000);
	Thu, 21 Dec 2023 22:00:49 -0000
Date: Thu, 21 Dec 2023 16:00:49 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
	olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
	mchehab@kernel.org, fabrice.gasnier@foss.st.com,
	andi.shyti@kernel.org, ulf.hansson@linaro.org, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, hugues.fruchet@foss.st.com,
	lee@kernel.org, will@kernel.org, catalin.marinas@arm.com,
	arnd@kernel.org, richardcochran@gmail.com,
	Frank Rowand <frowand.list@gmail.com>, peng.fan@oss.nxp.com,
	lars@metafoo.de, rcsekar@samsung.com, wg@grandegger.com,
	mkl@pengutronix.de, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-medi@web.codeaurora.org, a@vger.kernel.org,
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 04/13] dt-bindings: bus: document ETZPC
Message-ID: <20231221220049.GA156363-robh@kernel.org>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-5-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212152356.345703-5-gatien.chevallier@foss.st.com>

On Tue, Dec 12, 2023 at 04:23:47PM +0100, Gatien Chevallier wrote:
> Document ETZPC (Extended TrustZone protection controller). ETZPC is a
> firewall controller.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V6:
>     	- Renamed access-controller to access-controllers
>     	- Removal of access-control-provider property
>     	- Removal of access-controller and access-controller-names
>     	  declaration in the patternProperties field. Add
>     	  additionalProperties: true in this field.
> 
> Changes in V5:
> 	- Renamed feature-domain* to access-control*
> 
> Changes in V2:
> 	- Corrected errors highlighted by Rob's robot
> 	- No longer define the maxItems for the "feature-domains"
> 	  property
> 	- Fix example (node name, status)
> 	- Declare "feature-domain-names" as an optional
> 	  property for child nodes
> 	- Fix description of "feature-domains" property
> 	- Reordered the properties so it matches ETZPC
> 	- Add missing "feature-domain-controller" property
> 
>  .../bindings/bus/st,stm32-etzpc.yaml          | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
> new file mode 100644
> index 000000000000..9ca0ad39bc19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/st,stm32-etzpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Extended TrustZone protection controller
> +
> +description: |
> +  The ETZPC configures TrustZone security in a SoC having bus masters and
> +  devices with programmable-security attributes (securable resources).
> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: st,stm32-etzpc

Same here, needs 'simple-bus'.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +  "#access-controller-cells":
> +    const: 1
> +    description:
> +      Contains the firewall ID associated to the peripheral.
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    description: Peripherals
> +    type: object
> +
> +    additionalProperties: true
> +
> +    required:
> +      - access-controllers
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - "#access-controller-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // In this example, the usart2 device refers to rifsc as its access
> +    // controller.

Looks like the comment is wrong.


> +    // Access rights are verified before creating devices.
> +
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp13-clks.h>
> +    #include <dt-bindings/reset/stm32mp13-resets.h>
> +
> +    etzpc: bus@5c007000 {
> +        compatible = "st,stm32-etzpc";
> +        reg = <0x5c007000 0x400>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        #access-controller-cells = <1>;
> +        ranges;
> +
> +        usart2: serial@4c001000 {
> +            compatible = "st,stm32h7-uart";
> +            reg = <0x4c001000 0x400>;
> +            interrupts-extended = <&exti 27 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&rcc USART2_K>;
> +            resets = <&rcc USART2_R>;
> +            wakeup-source;
> +            dmas = <&dmamux1 43 0x400 0x5>,
> +                    <&dmamux1 44 0x400 0x1>;
> +            dma-names = "rx", "tx";
> +            access-controllers = <&etzpc 17>;
> +        };
> +    };
> -- 
> 2.25.1
> 

