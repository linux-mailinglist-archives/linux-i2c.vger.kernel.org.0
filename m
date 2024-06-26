Return-Path: <linux-i2c+bounces-4354-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0188A9176DB
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 05:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EC5FB21F16
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 03:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225B473450;
	Wed, 26 Jun 2024 03:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnWUG+7v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69822AD39;
	Wed, 26 Jun 2024 03:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719373006; cv=none; b=n8//1bb7ywSw3CCsLtl/F1km1seZBGITSrJ2E0OVg7nL3WpoiMdF0BP33+LrRnH6OceinI3jMav9TuIB50+gTt/VSNg0/UBk1Ko2gFb2OL0jGvd1HfqyWxPBo7ATz/m1TZWUmrO+y6jW9sqiVCrFT6CL3cxer2jl910MB8kH8IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719373006; c=relaxed/simple;
	bh=Xe8TNf7d1vs0pD5qG46NvcUmG1EC+DhVUbm5EpXaVTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEhLRrDBhr8wo/umbZfNxNfZ99nyAXb0m9eoYE6Lc/pSB+AFhBpMD5vIp0G9Uw3VanmFykHSBOkY1PAQKfK+OYC//Wtb0j8Bae2PzzY8DfYsAlOpLNbtYHuK3IgZsAzFsjdEQDyY6XkY0g5XQ5+uhLYXD9wHFljHZrg3ECQK3VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnWUG+7v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3CBC32781;
	Wed, 26 Jun 2024 03:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719373006;
	bh=Xe8TNf7d1vs0pD5qG46NvcUmG1EC+DhVUbm5EpXaVTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FnWUG+7vFI5v6wyU9ue+37h/DvknNmndX0WkqYUuudK9moC+UyZhdLnkTVVTyU6OI
	 lEgwMAm8O9oQX6+aHbSy7DJybDCYkp/OfvcXMAZETdFAAHtJJb5/Mq8MQ77EmJEWVi
	 PzFEwPVUmB2j+nsnAdKCgaY604O9RqhUb6UNOL+/pW1BJFaGi3hVJpMrza6r4G9E+t
	 +bIpuTAF+gCtnxeJktP5TwGNd8saG7IZpRhL0RuHkIQchOGRzmHsewqpM48fy3XXWq
	 prmeZqdFCRnVLxuA1gaXS4idwAIpgzWjiX67BzhUv4f4Bh5BipS+wZJqPO23N4+7TX
	 WZeFtgYptCU8A==
Date: Tue, 25 Jun 2024 22:36:43 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Andi Shyti <andi.shyti@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm8550
 compatible
Message-ID: <glda7ssote475kihs5c2wuff6k4slklzjb532uxiatxi5mdlfr@aiywubn3kert>
References: <20240612215835.1149199-1-vladimir.zapolskiy@linaro.org>
 <20240612215835.1149199-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612215835.1149199-2-vladimir.zapolskiy@linaro.org>

On Thu, Jun 13, 2024 at 12:58:32AM GMT, Vladimir Zapolskiy wrote:
> Add sm8550 compatible consistent with CAMSS CCI interfaces, the list of
> clocks is reduced by removing "slow_ahb_src" clock, which is derived
> from "cpas_ahb" clock.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Andi, could you please take the two binding patches from this series
(patch 1 and 2) through your tree, so that I can take the dts changes
through the Qualcomm DeviceTree tree?

Regards,
Bjorn

> ---
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index daf4e71b8e7f..e5c4b20446b6 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -31,6 +31,7 @@ properties:
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
>                - qcom,sm8450-cci
> +              - qcom,sm8550-cci
>            - const: qcom,msm8996-cci # CCI v2
>  
>    "#address-cells":
> @@ -195,6 +196,23 @@ allOf:
>              - const: cpas_ahb
>              - const: cci
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8550-cci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: camnoc_axi
> +            - const: cpas_ahb
> +            - const: cci
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.33.0
> 

