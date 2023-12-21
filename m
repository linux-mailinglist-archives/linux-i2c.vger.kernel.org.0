Return-Path: <linux-i2c+bounces-935-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBBF81C08D
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 22:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633B81F22020
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 21:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA5D77F04;
	Thu, 21 Dec 2023 21:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uEViCGtr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD70876DB6;
	Thu, 21 Dec 2023 21:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1801DC433C7;
	Thu, 21 Dec 2023 21:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703195600;
	bh=oZSWHV9/fUgOL3A+sAmJmZiWKNutaR5jooGY1ED6QmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uEViCGtrWqKue/uBwhlbauDjVJTF0cLSlsa8/fFBeRVcppTb2uuSJQaZwZPn8qTJO
	 ODOXEPf9U6d95gW6U3/ydvH+oAx72igXQDdo/e01QXTZ3n5FTgLKh5YiYPNUOfJQx9
	 fXukp7MK71p0HNTed54HdnwJkeqdzY/BvndNkiaSndNBrVYPoZykzZCIGDjPJ60eEi
	 os5zqYGK6NHqynpMgxz304G/qmvueP9ju0FHY6UrHsJjzgG6Zx/pZ6Mq70G4tpjsoQ
	 fcYNxA/uqwIb9xAFypOTrc9yTdkiFv+2rOMwEy4mNqmIkzHIWJPWcRH0W1dUyfeDhi
	 7XdSvArPmvvnw==
Received: (nullmailer pid 156117 invoked by uid 1000);
	Thu, 21 Dec 2023 21:53:16 -0000
Date: Thu, 21 Dec 2023 15:53:16 -0600
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
Subject: Re: [PATCH v8 03/13] dt-bindings: bus: document RIFSC
Message-ID: <20231221215316.GA155023-robh@kernel.org>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-4-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212152356.345703-4-gatien.chevallier@foss.st.com>

On Tue, Dec 12, 2023 at 04:23:46PM +0100, Gatien Chevallier wrote:
> Document RIFSC (RIF security controller). RIFSC is a firewall controller
> composed of different kinds of hardware resources.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V6:
> 	- Renamed access-controller to access-controllers
> 	- Removal of access-control-provider property
> 	- Removal of access-controller and access-controller-names
> 	  declaration in the patternProperties field. Add
> 	  additionalProperties: true in this field.
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
> 
>  .../bindings/bus/st,stm32mp25-rifsc.yaml      | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
> new file mode 100644
> index 000000000000..95aa7f04c739
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/st,stm32mp25-rifsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Resource isolation framework security controller
> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +description: |
> +  Resource isolation framework (RIF) is a comprehensive set of hardware blocks
> +  designed to enforce and manage isolation of STM32 hardware resources like
> +  memory and peripherals.
> +
> +  The RIFSC (RIF security controller) is composed of three sets of registers,
> +  each managing a specific set of hardware resources:
> +    - RISC registers associated with RISUP logic (resource isolation device unit
> +      for peripherals), assign all non-RIF aware peripherals to zero, one or
> +      any security domains (secure, privilege, compartment).
> +    - RIMC registers: associated with RIMU logic (resource isolation master
> +      unit), assign all non RIF-aware bus master to one security domain by
> +      setting secure, privileged and compartment information on the system bus.
> +      Alternatively, the RISUP logic controlling the device port access to a
> +      peripheral can assign target bus attributes to this peripheral master port
> +      (supported attribute: CID).
> +    - RISC registers associated with RISAL logic (resource isolation device unit
> +      for address space - Lite version), assign address space subregions to one
> +      security domains (secure, privilege, compartment).
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: st,stm32mp25-rifsc

This needs to be exact and include 'simple-bus'. You'll need a custom
'select' with the above to avoid matching all other 'simple-bus' cases.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

