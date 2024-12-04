Return-Path: <linux-i2c+bounces-8340-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFDD9E47EC
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 23:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAE3D284AAE
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 22:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87FE1F5422;
	Wed,  4 Dec 2024 22:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fB4WuRcM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C3C1A8F7E
	for <linux-i2c@vger.kernel.org>; Wed,  4 Dec 2024 22:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733351781; cv=none; b=SvCpEd6TW2AFmpOyWq5VLhpytho30d8uM514pyGFACvxsA1GjQ4j/dMqGN0JmqhfNHjHN9gqGtSyJ25gB/sKsqxHWUWKXP53DezgL5akVdqpL1Aa5CSuuqiuNNbjHpbI2f0VrG1wSwXASjQtLAbIC8NjXiNpRnOnUhDHcL/e4+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733351781; c=relaxed/simple;
	bh=8nyNe6nBOf2Dk/jqULA7hpqv08Qyov1aCsfLJP+e0ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ci7MZxzko3ZpGWZidKlAzc/DEXFZQdBs8zqY3J8NYNdFKb8Wx5NSfoM/lAFFqJ2IiAB3PWctKvFx0CtH0a3pvhsA3SXhhMRNso9xsj/fweoeLdGiJQ8KiPluGxHNfpksF+mFuWCbd6KmLjlbK8oBK3kJK+XaL9Q16+W+WEf6AxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fB4WuRcM; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53de8ecb39bso443411e87.2
        for <linux-i2c@vger.kernel.org>; Wed, 04 Dec 2024 14:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733351778; x=1733956578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+mmQIbMpMz7O0AOKTkxfl8dFrxJ33xOJobw0OfEwbNw=;
        b=fB4WuRcM3FIp3T0F7f5PzJzFKbU/bMYUYGPDay+g8J48QH0dCklAeeNTvHN3ZmW/Yd
         9C0xzANYRgGvyyjJxKgQzKq1mRnbNWxpkFdrKB/XVHomB0HhOZwlVfQnbgCrkgB3JFEJ
         JFgH0auMNwDgnydg/bUUCSk6vRZk07hwwJuYtnXfwkDqdQFMRB0O+5dfXToOQbH0DKxJ
         9qkDmYVDfxCj7Q0jrdONvImyT3Q6YJ/9Hi8R2DLDDWXhQBjbTkmZOz1S1/k7/gI7P7ek
         O7EkwK42zF/uvdRPRGogcgaflKYKCJ+qv1hj2asg5NwIITHtI2+Va7d6K/APbo0YKG6A
         cEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733351778; x=1733956578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mmQIbMpMz7O0AOKTkxfl8dFrxJ33xOJobw0OfEwbNw=;
        b=NNimz5lPL9LbtgxbT2qnE76UxeVE103+BSEmbHHqHz8QkNBAxYoMjjpeFcpxJyCW5F
         cLnMC734NzpPxzJVEPxj/V+Vs5q19vIhYggvKPUzLPcQA1YLozkcHze4Gx17ZFIWzZJM
         Ulv3VaYgU9FIEXCUForVGOyufc/6K7/GMCEZH27e3lExVAYTbkiGLf0tIB0JPZPerEl5
         Kszm3yemBddQMCG9exI4gnGdV/zGxXYq+r89q9NGbWh4l5m5TMJ/+rVYS/zwxQL7te0H
         4ru1loJ21M0QBe8feRCR09gR0JFnlShPDPAfeDSRnmhsVoDKr5K26RsV+l+j4V5kGRDh
         4sOg==
X-Forwarded-Encrypted: i=1; AJvYcCX6kA7S9HTfRGROcDqPnRASZZXxJoOqMnFW5i8YuJ5l21XRLsMXm347GXVA9XumlM2U7pCbyR13U6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaQjuKlJr3hcV7d13/RRP2nozOyPKnwB96KAVXJoK6b2X+iBeB
	vf3iRxSUK+Rm+eEi427rLHo5BEJ2uvr/YkhxGXPt881SN5Ypk6Otn97m/qlS8Ag=
X-Gm-Gg: ASbGncs9o8fQ54vVlcm+cgAtKUIyutn9NeogVnZ9Pwa5OcI04OfqhJ+oMH4J8yTxfnP
	eQdnpTg5Yt9QK4UvpraiHBWZOhK3s0RsyEpFG+uWCvOWhUUZJtciuab+s7UfqMdAo3f98LWc7zx
	vofMcpJa7xyzkudFEPjpng96y03oPfTpvCGlS4nZR3hBbvPPvlWOYisHqRnBwC9goMDtLeuoFZY
	Hv9pQk5yVWKdmuuXJb6i6ch8lx2p0M0JkuR1VqEm9yBJ1KK9pKjsf88QdxvtnUdoJftO6SvpRKw
	Ja/D6/rQX3pL22AViYr10ui3rFDIkw==
X-Google-Smtp-Source: AGHT+IGuGoCD3puMElK86ZdB02YG7dUQkM6ohz8Me4tads6hOhrBog3l0JNlc1YxUZmWAvJj211T6g==
X-Received: by 2002:a05:6512:220d:b0:53d:d3c1:9fc4 with SMTP id 2adb3069b0e04-53e12a31944mr5017238e87.41.1733351778075;
        Wed, 04 Dec 2024 14:36:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ca47esm21650e87.264.2024.12.04.14.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 14:36:16 -0800 (PST)
Date: Thu, 5 Dec 2024 00:36:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	=quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v1 1/7] dt-bindings: i2c: qcom,i2c-geni: Document DT
 properties for QUP firmware loading
Message-ID: <garuc5au5464xpmj3exlull4o2763xrkqubplde56xmyfhfhmn@cpd4bbt4dfyr>
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <20241204150326.1470749-2-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204150326.1470749-2-quic_vdadhani@quicinc.com>

On Wed, Dec 04, 2024 at 08:33:20PM +0530, Viken Dadhaniya wrote:
> Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
> support SE(Serial Engine) firmware loading from the protocol driver and to
> select the data transfer mode, either GPI DMA (Generic Packet Interface)
> or non-GPI mode (PIO/CPU DMA).
> 
> I2C controller can operate in one of two modes based on the
> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..a26f34fce1bb 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -66,6 +66,15 @@ properties:
>    required-opps:
>      maxItems: 1
>  
> +  qcom,load-firmware:
> +    type: boolean
> +    description: Optional property to load SE (serial engine) Firmware from protocol driver.
> +
> +  qcom,xfer-mode:
> +    description: Value 1,2 and 3 represents FIFO, CPU DMA and GSI DMA mode respectively.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3]
> +
>  required:
>    - compatible
>    - interrupts
> @@ -142,5 +151,7 @@ examples:
>          interconnect-names = "qup-core", "qup-config", "qup-memory";
>          power-domains = <&rpmhpd SC7180_CX>;
>          required-opps = <&rpmhpd_opp_low_svs>;
> +        qcom,load-firmware;

please use instead:
firmware-name = "qcom/sc7180/qupv3.elf"

> +        qcom,xfer-mode = <1>;
>      };
>  ...
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

