Return-Path: <linux-i2c+bounces-15207-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09185D2E06C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 09:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 069D130A650B
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 08:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9763D3019B2;
	Fri, 16 Jan 2026 08:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXCcI5WM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE192FFF9C;
	Fri, 16 Jan 2026 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768552099; cv=none; b=L7Vj9oU/90cdbc5tbY8xQe3MVn613VcqhMH01fEgjo+jRZZwgx2zPzlVJxhEuwO/3uW8HgRgiJlG5gfDy5MKeF3uifRsLygMMT2fzEubOV4NXRXVLYWr2O9k9a8YIcrY9u6QLjgGPU4OsdL7nLdFai31yJY3gVAPzp9DJiSLZQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768552099; c=relaxed/simple;
	bh=nYv5A7M2Uly0VFTiKqPRXMw+9d7IYZ3TOjRkq75m5F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPTLdG2qjMHggLHfutWw73/REFtuHIGhPYXM2gN9t+pscCesHhEH/nDevHc4qL6DeSQNt/7twBBbbdYU/sDvsK+kkwBpLkxr/FGikCkX+g5rHUOgVgfjgGy+fQ6QWb6g568BhJf+GZX3wV6+AUkR7R4h9NduyWjsMZQqCCIHmX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXCcI5WM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26957C19421;
	Fri, 16 Jan 2026 08:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768552098;
	bh=nYv5A7M2Uly0VFTiKqPRXMw+9d7IYZ3TOjRkq75m5F4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXCcI5WMomZGKd4w/V6CWonoZbqSfNmJOZh+3s4xc+/2T0zvEkdEQVpDcqHmlpwG3
	 Wi8NwamaSQE5oKtUMdmHwGv2KYB5SQSRArCO0g3N173jrq0+F29JyI3K2CXqaWsGL4
	 yf6cNkD46RQE+Kp70A05DFFSYBL6gBOGxYUIa/3CQBRgLcHFz7G88zowL0v3v+6uL+
	 4bdWHRSjLw+Mm9cKhofaBlIm11TJeJGQWj1rFTsRJxfsYr7S9Rl++fAAhUHUwXYkXA
	 O5si3HEs+rqQnWO9tTu2ltdtrNPpKC4ZXeqceQTcmIiIKKUDlK79rYJObyELCuv3RN
	 qtHljKX16JWSg==
Date: Fri, 16 Jan 2026 09:28:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Message-ID: <20260116-malachite-spaniel-of-refinement-af22ae@quoll>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com>

On Thu, Jan 15, 2026 at 06:12:38PM +0800, Wenmeng Liu wrote:
> Add the sm6150 CCI device string compatible.
> 
> SM6150 include three clock:
> bus: Bus clock responsible for data transfer.
> iface: Interface clock responsible for register read and write.
> cci: Clock for CCI core operations.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..3472670fdc908ef8f3b3afc68ff437c0435b69a7 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -33,6 +33,7 @@ properties:
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
>                - qcom,sdm845-cci
> +              - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
>                - qcom,sm8450-cci
> @@ -263,6 +264,23 @@ allOf:
>              - const: cpas_ahb
>              - const: cci
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm6150-cci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: bus
> +            - const: iface
> +            - const: cci

So basically the same as camnoc_axi+cpas_ahb+cci, so just put it into
existing enum with qcom,sm8550-cci.

I asked for this at v1.
https://lore.kernel.org/all/43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org/


Best regards,
Krzysztof


