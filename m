Return-Path: <linux-i2c+bounces-9173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD263A1B496
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 12:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A4E93A3438
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 11:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7455D21A420;
	Fri, 24 Jan 2025 11:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U7FmWY+L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B771CEEB6
	for <linux-i2c@vger.kernel.org>; Fri, 24 Jan 2025 11:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737717488; cv=none; b=WGoHBHc0v/eouK/cZk7b6biqjQCJfaj3LLmVZ4XNjVOb70XzPW/fLOn+EbFJuTr2EBvCjfp8mhe8lMEWUWgtb0aeSY/mtZSQS0tKmICTvJmTLH8ANVKSVluTFy074p6ondLBYUynmyWPxqvUnHhC2by6vyfVTT3l4P4RFiKrTG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737717488; c=relaxed/simple;
	bh=T77o10XTx9CxIgLZenUyPw8caNMGGg9q3IEtg0qKC1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjqUy++xu+j1E/rwFYAhLwOzP6pIZnE8Fqjx90F/afUhRJln2mJTO320zwHu3NXA82503wgEkR7ueTPArStsXlbGzWT46Jb3M0ie4UKYwwpr1OAgBHbbt3tcWcYtz8XwC5CNb633/BJgSIvqx1TlWJS/TFlxnidU+NiKR0Rfr/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U7FmWY+L; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5439b0dd4bfso1560785e87.0
        for <linux-i2c@vger.kernel.org>; Fri, 24 Jan 2025 03:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737717484; x=1738322284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T0llOVDAU4gsmmjbiErKgwKuDgcLmaYcrMGcHc3GCiQ=;
        b=U7FmWY+LEqln8D9bLw0ileicGt18EuqnljDOQAYwV12tf8kCltWIzteOl6xL07XocY
         uCHjo7uDE17te39xLhcveBaFL+ccG3OG8v+ILwssoA7//x0OwUNmTkBpW+xW0bcVSc/V
         bm5kIZ0A/FKwjzu/6aPg9vIyI1Raes4vG/mAAIEH0/0CP/Xqrr4OTViS/FhdpJeVeplx
         L2SMfPvRVfrba2akLmz4UZ35N8il7pC0AmecCuOLnsqsPWPrU3jUplP2PADRP1YuaNsI
         DWtChRkOIu/AvxnhbJo0pdkh6an1ln+0RY9StPiSs5pxM2L1TkIXk9hUBnEvooir0FxY
         Y2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737717484; x=1738322284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0llOVDAU4gsmmjbiErKgwKuDgcLmaYcrMGcHc3GCiQ=;
        b=J+6C+q26dv4ZC4RDd6bogzrjEjTtPFb7Y6fRsvpf85siMm0H1A6dHHU3+VmqBIdb+r
         S9Oq0oZV2zKRhcOpJLCi1h2/Lje8zowEjyE1yDX4dGyGakKwX+Z/1xn2PZZck2+wwMoa
         uaKpIfnLkf8TLIMwWKE4uQC8ja+sOA5j49NSpMJTCdbuLn83PhblAONFoyLQsbL/zC7Q
         hdq6740jTugeYIzZrw30vKoIHBlsFLk07GGPjM6Dz7tLvPcSv/HMX5v8A37PhftpNpXq
         E5UTIg7LtLTCtTOgIWu+U5K546coEi3yYyAoTwvdiyoxYiroQREEI8avDPxJSFIf961C
         n/LA==
X-Forwarded-Encrypted: i=1; AJvYcCVJLvnVl0wHjJ/d2e9Co0em6n0p9sachuJJFCCQ0N0qvRE+m8NMRcHD7A1ZGingqQJs5wmjnOa1DtA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5UVxPi26AHBpFtot4SLm0NvlQG2RYGyG+LCCAyFEJgO+57/46
	Z8Ukpk003eZJT1N7Ki/tXCy+AkCuZ0wxhoTRVIDiD6d6yfPt99OnMb/hJPeF0w8=
X-Gm-Gg: ASbGncuXb8w3FxNl14zk643pV522z/csd0npztTgG/M7uAglN17scaNRtZcjPrGFKQw
	QyGzSo9OL95CRhu9Ycke+bC9H/peRLO/FCwAM8cUWSTH7NMR6y8Rybouz3Q9w4FJHpx+ANQ95Cp
	BLnPAixdpdqw8zzCv8RJqOTeIJKse39zOgfxu9PP7utn1J7wwO4leMQbgOFDe2yNp1vbjE46vvK
	cR5/ln/A7BBPKVPDYhGxCPwTpuqgWZcb+L9a1fMGaq1dpVGC5bfZ1ch9Jpclz8ln7KdGkbcBpAf
	qRZaraMjngzKyJjXLgMco74PvED6nYrzGlsmWUsly1gdKYEKo8dOYeOZHRn2
X-Google-Smtp-Source: AGHT+IEvnA4WjUqgAID/Sz4S55WqtF4SuOXbwQGAlWGJct+SYEIXS3XgIZ7BKsiqifM+MoW/qS4z4g==
X-Received: by 2002:ac2:4e0e:0:b0:53e:2f9d:6a73 with SMTP id 2adb3069b0e04-5439c1c60e7mr11960921e87.0.1737717484311;
        Fri, 24 Jan 2025 03:18:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c836845fsm257580e87.141.2025.01.24.03.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:18:03 -0800 (PST)
Date: Fri, 24 Jan 2025 13:18:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v2 2/8] dt-bindings: i2c: qcom,i2c-geni: Add support for
 selecting data transfer mode
Message-ID: <r4zfoaub3dwkirdbsolbl56xxa7ax5eusb2256c7ezlyl2s3vh@hit4g5cpzijw>
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-3-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124105309.295769-3-quic_vdadhani@quicinc.com>

On Fri, Jan 24, 2025 at 04:23:03PM +0530, Viken Dadhaniya wrote:
> Data transfer mode is fixed by TrustZone (TZ), which currently restricts
> developers from modifying the transfer mode from the APPS side.
> 
> Document the 'qcom,xfer-mode' properties to select the data transfer mode,
> either GPI DMA (Generic Packet Interface) or non-GPI mode (PIO/CPU DMA).
> 
> I2C controller can operate in one of two modes based on the
> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.

Is it possible to load the firmware after it being loaded by TZ? Is it
possible to change the mode at runtime too?

> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
> 
> v1 -> v2:
> 
> - Drop 'qcom,load-firmware' property and add 'firmware-name' property in
>   qup common driver.
> - Update commit log.
> 
> v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-2-quic_vdadhani@quicinc.com/
> ---
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml        | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..68e4bf0c84d1 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -66,6 +66,12 @@ properties:
>    required-opps:
>      maxItems: 1
>  
> +  qcom,xfer-mode:
> +    description: Set the value to 1 for non-GPI (FIFO/CPU DMA) mode and 3 for GPI DMA mode.
> +      The default mode is FIFO.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 3]
> +
>  required:
>    - compatible
>    - interrupts
> @@ -142,5 +148,6 @@ examples:
>          interconnect-names = "qup-core", "qup-config", "qup-memory";
>          power-domains = <&rpmhpd SC7180_CX>;
>          required-opps = <&rpmhpd_opp_low_svs>;
> +        qcom,xfer-mode = <1>;

What does <1> mean? Please provide corresponding defines.

>      };
>  ...
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

