Return-Path: <linux-i2c+bounces-6109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E3996B1C3
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 08:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EE901F27A18
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 06:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1668286F;
	Wed,  4 Sep 2024 06:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/oM1lba"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC491386C9;
	Wed,  4 Sep 2024 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725431523; cv=none; b=IlOswsQ5FI/nLeOVifisBQDDUDc8ES7ikyy9ganP7xoyFzoNOG/4ybWWC+0Vs7nUS+OI6wBl9TvGq/Nxl3jKf2PmP8U0JkIXfe2U0mh5xFF56WXXPHsVIvKlo7xPxXCD5tZCGBilau6tQ1acDQerwkcz994JifRO8V1Ea85GjQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725431523; c=relaxed/simple;
	bh=p6zo3cD/MS1jSLLM7Rm6ErwANFF4wNKY4HrupXO3AC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxnpVSHFiDBhD2LSVvQ/FRTsWjEe2t8vedWv7lU7PNAS3PISoOKFRTNaKRROnor1ojGMjlXZHnVIW8W8yUw2cFY7XMGx7d7F8QY2qkV7TCkTx6fSFfl3GLS7M6CSK5FHiNro3z9cgoJ9SlHDP1KXfkieSmGKsex11y6L53Cj5RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/oM1lba; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E96C4CEC2;
	Wed,  4 Sep 2024 06:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725431522;
	bh=p6zo3cD/MS1jSLLM7Rm6ErwANFF4wNKY4HrupXO3AC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/oM1lbaBVfW8xXoJk39xPrtyv63jVjNd+jQW/BBZ8Olrr/Ckv13ZEx+pbWDitVVX
	 vcHd/Vb7oRDU2jghbU8t8bEYWPSumVPnu/R2jezkCn6jTJTybUPPwuNcAQQ2onvGCb
	 bLwY54Jw6/e5Ce/23soMP9bK0FUYTRCW6S6q7jaotdQ2t0C3MOZPwNSffsLgD8CWvJ
	 qXnhZMAcito18IBiiukvpF9NTVG/L2Yv9iN62s20GtdP91KXmI0/7Q5tliR/L9hDGN
	 7y1w3JO6cuGNIKYljzgxLLPAsOaQTgR1w14laJ/AMxidj8U20oWlZk3nFEW6XqyUrC
	 A9HEc92l1wbVg==
Date: Wed, 4 Sep 2024 08:31:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com, andi.shyti@kernel.org, 
	tglx@linutronix.de, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, broonie@kernel.org, cristian.marussi@arm.com, 
	rui.zhang@intel.com, lukasz.luba@arm.com, wim@linux-watchdog.org, linux@roeck-us.net, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com, 
	Praveen Talari <quic_ptalari@quicinc.com>
Subject: Re: [PATCH v2 15/21] dt-bindings: i2c: document support for SA8255p
Message-ID: <xtguaoof7iblrtd2idsa2k4ml64qkttgliyijbeqw5thkdcbx3@jnm75a4wmbqd>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-16-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903220240.2594102-16-quic_nkela@quicinc.com>

On Tue, Sep 03, 2024 at 03:02:34PM -0700, Nikunj Kela wrote:
> Add compatible representing i2c support on SA8255p.
> 
> Clocks and interconnects are being configured in Firmware VM
> on SA8255p, therefore making them optional.
> 
> CC: Praveen Talari <quic_ptalari@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  .../bindings/i2c/qcom,i2c-geni-qcom.yaml      | 33 +++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 

I don't know what to do with this patch. Using specific compatibles next
to generic compatible is just wrong, although mistake was probably
allowing generic compatible. The patch does not explain the differences
in interface which would explain why devices are not compatible. In the
same time my advice of separate binding was not followed, because maybe
these devices are compatible? But then it should be expressed...

You have entire commit msg to explain what and why.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..b477fae734b6 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -15,6 +15,7 @@ properties:
>      enum:
>        - qcom,geni-i2c
>        - qcom,geni-i2c-master-hub
> +      - qcom,sa8255p-geni-i2c
>  
>    clocks:
>      minItems: 1
> @@ -69,8 +70,6 @@ properties:
>  required:
>    - compatible
>    - interrupts
> -  - clocks
> -  - clock-names
>    - reg
>  
>  allOf:
> @@ -81,6 +80,10 @@ allOf:
>            contains:
>              const: qcom,geni-i2c-master-hub
>      then:
> +      required:
> +        - clocks
> +        - clock-names


So it is required here?

> +
>        properties:
>          clocks:
>            minItems: 2
> @@ -100,7 +103,21 @@ allOf:
>            items:
>              - const: qup-core
>              - const: qup-config
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sa8255p-geni-i2c
> +    then:
> +      required:
> +        - power-domains
> +

And possible here? I assume with the same clocks? The same for
interconnects - same values are valid?

>      else:
> +      required:
> +        - clocks
> +        - clock-names

And clocks are required again?

> +
>        properties:
>          clocks:
>            maxItems: 1

Eeee? So now all other variants have max 1 clock?

Nope, this wasn't ever tested on real DTS.

Best regards,
Krzysztof


