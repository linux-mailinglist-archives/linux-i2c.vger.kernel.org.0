Return-Path: <linux-i2c+bounces-6110-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A3C96B1D3
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 08:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B2DDB21DC4
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 06:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD0913D504;
	Wed,  4 Sep 2024 06:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRoLNiOV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07E04AEE6;
	Wed,  4 Sep 2024 06:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725431681; cv=none; b=k6w/QVa7gssaY8Qx6mNTTnNgHlGY/OCP9pGncVJJVSLTHS0medtXQRPjDQWLpdYLswxnkVHgQdEo8EJauROSP0D1wLlLq/FAE0GEXJjTSrDiFy/kzSLgQuQzcRASklXmdvB24hVaSpm0sX7ey8ghmzI6QPspntTwj93Ny37bWCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725431681; c=relaxed/simple;
	bh=59IuPyYeHUT6I4DfEN8S5tmVreRkgQpuZU3P0+eeQaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLY2f2wAcAyJ6LZvdtMQFQT2mRX3/WOQwpUyZvp6JNxM6sAEkBx9Mmp4E22vOMQsbQI6YpoI3uI0TeDpLOqUS0hEd8pDkt9qsVm9EbOgFaPjTugo0jpAyvIpHFjqlkVQgvoxw/oG4P/GZetxKRS7HxcX6/QRRMIA4CEd8wvDJok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRoLNiOV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DD1C4CEC2;
	Wed,  4 Sep 2024 06:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725431680;
	bh=59IuPyYeHUT6I4DfEN8S5tmVreRkgQpuZU3P0+eeQaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRoLNiOV5XhECZrIKF5orhVO4gvPvZSaogdOy3gesWN4Ftg0AghOKFnFa4aPKfMLA
	 rkSFgTHoYTTSySDAmZUA6UKnISgHjBjwoytgDeWg65YtB4/pcqH+JfxcUVlM4Q3Fjg
	 zQ265OZKFajFBuWq17kNDkA4uKkNsFcGa2xUP8NyUIhXlkYr6i2HRaV474e51lhSL+
	 jBKh5RDJ2ibtczJe1Ni3mQ7SxoLgCQka4NX9Q92NQ7wDIxdRLuJ61OiuEEokvCN/ZC
	 Vr8fEDHTNg6rp3JaRHgMF2YQolbZSjRWOK86ruUEgtyD3C/qw/ibm94uIYzXBcRyr9
	 gSvjrgfhKMG7g==
Date: Wed, 4 Sep 2024 08:34:36 +0200
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
Subject: Re: [PATCH v2 16/21] dt-bindings: spi: document support for SA8255p
Message-ID: <sdxhnqvdbcpmbp3l7hcnsrducpa5zrgbmkykwfluhrthqhznxi@6i4xiqrre3qg>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-17-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903220240.2594102-17-quic_nkela@quicinc.com>

On Tue, Sep 03, 2024 at 03:02:35PM -0700, Nikunj Kela wrote:
> Add compatible representing spi support on SA8255p.
> 
> Clocks and interconnects are being configured in firmware VM
> on SA8255p platform, therefore making them optional.
> 

Please use standard email subjects, so with the PATCH keyword in the
title.  helps here to create proper versioned patches.
Another useful tool is b4. Skipping the PATCH keyword makes filtering of
emails more difficult thus making the review process less convenient.


> CC: Praveen Talari <quic_ptalari@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  .../bindings/spi/qcom,spi-geni-qcom.yaml      | 60 +++++++++++++++++--
>  1 file changed, 56 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
> index 2e20ca313ec1..75b52c0a7440 100644
> --- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
> @@ -25,10 +25,45 @@ description:
>  
>  allOf:
>    - $ref: /schemas/spi/spi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sa8255p-geni-spi

Not much improved. All my previous (v1) and other patch (i2c) comments
apply.

> +    then:
> +      required:
> +        - power-domains
> +        - power-domain-names
> +
> +      properties:
> +        power-domains:
> +          minItems: 2
> +
> +    else:
> +      required:
> +        - clocks
> +        - clock-names
> +
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +
> +        interconnects:
> +          minItems: 2
> +          maxItems: 3
> +
> +        interconnect-names:
> +          minItems: 2
> +          items:
> +            - const: qup-core
> +            - const: qup-config
> +            - const: qup-memory
>  
>  properties:
>    compatible:
> -    const: qcom,geni-spi
> +    enum:
> +      - qcom,geni-spi
> +      - qcom,sa8255p-geni-spi

You have entire commit msg to explain why this device's programming
model is not compatible with existing generic compatible which must
cover all variants (because it is crazy generic).

Best regards,
Krzysztof


