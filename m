Return-Path: <linux-i2c+bounces-5894-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7EC963D54
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1880F1C20D07
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406EB189BA7;
	Thu, 29 Aug 2024 07:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmHgo8oe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF3718786F;
	Thu, 29 Aug 2024 07:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724917271; cv=none; b=e7AJEgSo5tm5rapNpXPiq0bYyq1rv/9KHaJowxW/DznO9AfEMeiWp1Zled0yULxxh2ikMmGSOedqc07wHMvhS9hDCTpR6VY/nBCnbAU/TwwxzByFQAELsMiFvb5Y91fYVn7fe3QJuFXIaSLoyRpGYUcgP61NufmcsnmTKlrUA5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724917271; c=relaxed/simple;
	bh=aHZMkQDzCqEolSJErzNW13s9Sq63WuDyOLBXJI90a54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWeDd6v6+wrQkI99gawchgq7zkYqreTk+yRhGJHSl8UIrjThHMiF+VxvG62RMbVwD92pb2454WLnKAnN95U2+KmiBc8hPYsa2JjBVXF5V4rK0230/a3TM0PO/uFAHIKHBBIPJ7+xgqbRw6W7ys/0VXjE/McalA4bZeKR/a9vncA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmHgo8oe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A786EC4CEC1;
	Thu, 29 Aug 2024 07:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724917270;
	bh=aHZMkQDzCqEolSJErzNW13s9Sq63WuDyOLBXJI90a54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmHgo8oeaXn2wJ2b8iG4fKRTTh3kbaFTECgCXQluuoDp9Z/yKxoWGT+nTuasWhKUr
	 RLuPXenYmL5vn0aS8dkmbw2FkK/cR+XkKbSyXvI0q5pmXFsppFFmrVh0bgWvd8eZcQ
	 W8TazyJCh7G/CjGu7UecXPhhKFG2rd30GY03ytCHs36M41xAze3KHS+LiPMfQB4A7Q
	 w1O9fgbHWPdwGAl178vTeFuHoH73A6dJoLlC36EDXLnrgCX8x6B3keLiJmCIUmm59a
	 kCiRxH1SoIjDS7EfuBYeLR2R8No/h99KuWvC4iV1X9sk7ONiZjIrMbynWk+w/cb+gF
	 pekQrcJWJNslw==
Date: Thu, 29 Aug 2024 09:41:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com, andi.shyti@kernel.org, 
	tglx@linutronix.de, will@kernel.org, joro@8bytes.org, jassisinghbrar@gmail.com, 
	lee@kernel.org, linus.walleij@linaro.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net, 
	robin.murphy@arm.com, cristian.marussi@arm.com, rui.zhang@intel.com, 
	lukasz.luba@arm.com, vkoul@kernel.org, quic_gurus@quicinc.com, agross@kernel.org, 
	bartosz.golaszewski@linaro.org, quic_rjendra@quicinc.com, robimarko@gmail.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com, 
	quic_tsoni@quicinc.com, quic_shazhuss@quicinc.com, 
	Praveen Talari <quic_ptalari@quicinc.com>
Subject: Re: [PATCH 17/22] dt-bindings: serial: document support for SA8255p
Message-ID: <esl3zcntkewslcredif54venyopwgj2niruoeqcvbhqmbyt5qc@odixl23o7omk>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-18-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-18-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:16PM -0700, Nikunj Kela wrote:
> Add compatibles representing UART support on SA8255p.
> 
> Clocks and interconnects are being configured in the firmware VM
> on SA8255p platform, therefore making them optional.
> 
> CC: Praveen Talari <quic_ptalari@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  .../serial/qcom,serial-geni-qcom.yaml         | 58 ++++++++++++++++---
>  1 file changed, 51 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
> index dd33794b3534..dcd43e1353ec 100644
> --- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
> @@ -13,11 +13,42 @@ maintainers:
>  allOf:
>    - $ref: /schemas/serial/serial.yaml#

Please move entire allOf: to the place after "required:" block.

>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sa8255p-geni-uart
> +              - qcom,sa8255p-geni-debug-uart
> +    then:
> +      required:
> +        - power-domains
> +        - power-domain-names
> +      properties:
> +        power-domains:
> +          minItems: 2
> +          maxItems: 2
> +    else:
> +      required:
> +        - clocks
> +        - clock-names
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +        interconnects:
> +          maxItems: 2
> +        interconnect-names:
> +          items:
> +            - const: qup-core
> +            - const: qup-config
> +
>  properties:
>    compatible:
>      enum:
>        - qcom,geni-uart
>        - qcom,geni-debug-uart
> +      - qcom,sa8255p-geni-uart
> +      - qcom,sa8255p-geni-debug-uart

Not compatible with the old ones? Well, it is impossible. Generic
compatible like "qcom,geni-uart" means ALL DEVICES forever will be
compatible, because otherwise it just does not make any sense.  Of
course "all devices forever will be compatible" is impossible as well,
thus DT maintainers are suggesting SoC-specific compatibles all the
time, but if developers decide that they know the future, you should
keep it, right?

>  
>    clocks:
>      maxItems: 1
> @@ -26,12 +57,10 @@ properties:
>      const: se
>  
>    interconnects:
> -    maxItems: 2
> +    description: phandles of interconnect bw provider

Constraints must stay in top-level.

Best regards,
Krzysztof


