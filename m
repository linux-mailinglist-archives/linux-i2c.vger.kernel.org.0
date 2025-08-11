Return-Path: <linux-i2c+bounces-12245-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C94ECB215DB
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 21:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B4E514E11DB
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 19:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C760127F724;
	Mon, 11 Aug 2025 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFzQUh13"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740D818C322;
	Mon, 11 Aug 2025 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754941603; cv=none; b=n/ilHvUyyzkIQGhJ5BU9KxL1CaNXCjjr5XbpVpMernhs6Yu2NCyuGHgRi4Y1WU+sFb2zG4/IwHEWDX3/v8DVNqgg+BQFn39r6vvJy/ep+5FXZwKXFSHIFNLyG6/4wZBYhHT+/pgQPAInZo9DEwpmZ1eRf6njrkpf4YcMjfF7dgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754941603; c=relaxed/simple;
	bh=SEX5Ef6FK0Ar1fnIWup7X2r4T+UMrNydQ7Xq2GpSBw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9MV/QzZs9NfLCu+9j4kuuWzWkn6/dL6FvJEi3Sry4ciqW1gwPIN9Qkd8fJH2bnUinhI1jtgMd6Zptd3GblL4saO057qvhXTKla1OlSG6kwLEoc12Bwo18Bt+D4XwSmgEFWwGiXcipqhj7QQdTzjc9A6R+E0V0Wr/T4k92xCdKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFzQUh13; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A9EC4CEED;
	Mon, 11 Aug 2025 19:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754941601;
	bh=SEX5Ef6FK0Ar1fnIWup7X2r4T+UMrNydQ7Xq2GpSBw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WFzQUh13EBr+CSMgNfQw7Rks8jEH3RQj2CR4PZasUwTB71zAPIrY4Ay75/wUv5Szx
	 Oav29a5x6zO/eCm6oD8YqVHxNTzoMx1lathS+YLE/jzHoIHOXomaf+IGcGHD6KSfrN
	 JV58vf5+qQLWDwhkfrmlXBsFA1uEdNDFLZBOiGMHc0BtBZ+u5NYSmwBhu1PTAsCgvJ
	 GSFnuzNwAFlInsg15v++CxYn/GoZRDczzi5K7m114KmImsAHHu4WBPUH7tTsDaF0K8
	 39vYsadKv70I9RRc2upBnt8H1rhU6FMQxHuRUAVDZZZQJKjVYHZ77Tx+xwZEXp0Y1a
	 T2qgNRVtah7Lw==
Date: Mon, 11 Aug 2025 14:46:39 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andi.shyti@kernel.org
Cc: rfoss@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, konradybcio@kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: qcom-cci: Document QCM2290
 compatible
Message-ID: <4bldj7jjsi4o2wz4wij2ggog4no2nndavk4r7frvd6fv5fjtfn@4unsvlv2mdl7>
References: <20250519094745.32511-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519094745.32511-1-loic.poulain@oss.qualcomm.com>

On Mon, May 19, 2025 at 11:47:44AM +0200, Loic Poulain wrote:
> The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
> It requires only two clocks.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Andi, can you please pick this binding, so I can pick the dts change?

Regards,
Bjorn

> ---
>  v2: Reorder commits and Fix binding testing syntax
>  v3: Add clocks minItems for msm8974 as top-level minItems changed
>  v4: change AHB clock name from camss_top_ahb to ahb
>  v5: No change; Resent with missing recipients
> 
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 73144473b9b2..83b13370ff6c 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
>  
>        - items:
>            - enum:
> +              - qcom,qcm2290-cci
>                - qcom,sc7280-cci
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
> @@ -44,11 +45,11 @@ properties:
>      const: 0
>  
>    clocks:
> -    minItems: 3
> +    minItems: 2
>      maxItems: 6
>  
>    clock-names:
> -    minItems: 3
> +    minItems: 2
>      maxItems: 6
>  
>    interrupts:
> @@ -113,6 +114,7 @@ allOf:
>      then:
>        properties:
>          clocks:
> +          minItems: 3
>            maxItems: 3
>          clock-names:
>            items:
> @@ -120,6 +122,22 @@ allOf:
>              - const: cci_ahb
>              - const: cci
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcm2290-cci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: ahb
> +            - const: cci
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.34.1
> 

