Return-Path: <linux-i2c+bounces-9711-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E38A4D5FA
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 09:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF4E03A866B
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 08:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A201FAC5F;
	Tue,  4 Mar 2025 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PA7ium0z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9681F8EEC;
	Tue,  4 Mar 2025 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741076039; cv=none; b=tMDM8Jl67D4Xgr2w5ivpu+qCwqnbGXmxolgWBbq4D5ISRRTP6wmiIbszjcOl9R/lCqk/5fys0i8T9K9MbPKvFckGAFwPdy6BMlflc5e1bH/Yn2nmvZh+0Ed92Z2aWJf5EC/BWFqzW2aKfJwbxSvOdLgX2SU44chYsVDyPHnq7qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741076039; c=relaxed/simple;
	bh=al4fZv5yaLd+BfLt505bdsaxCFcf6n0xYTVtxlFXfWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbeS/PBPJrciMxHwLO8GtlJYLUmM+fQ/rXo/CvHj8EEyorbjP1IdMVIszEnQFulwyauXXuCXegyoM3sO7dVZIMfNjMe7TWsAdNlT6/yd2VlfqQhEcaDOX+LtaN8kl7txD+gZmHn9/Rsof64zeg4G+pmGKugjkvk0ZodRVJ+ncho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PA7ium0z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335FEC4CEE5;
	Tue,  4 Mar 2025 08:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741076039;
	bh=al4fZv5yaLd+BfLt505bdsaxCFcf6n0xYTVtxlFXfWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PA7ium0zE9Zy/g8AQQQwAmJ5sHrxfCknraCJ+tCJi+0aalGuEkQACIQAcI9V9Q54x
	 AxCmTzJz9o71hJ8lSTve2ySo3oE/sTriQDrdDIhTst444H9rQRf+Y/WkbGOdKvg3K2
	 8/WWIPYAu431z+YCAUaBMib6jxLzu2JUE61K6FXFG6q70ayG5uEMuNcok9vYtg/hzA
	 QO4iG9XdXMtmnwz43ipaAlK2+pdHDX73OavhgRxqc1aIDj9CK0UzHCw1RiiLs48v14
	 CwQi0rvDnbAX89Mr+S+036TydCHJzAbR8zfiEwM42U/PYe5y7H9+BikMdqeLOnZX9R
	 MrWCyGgi9RRaQ==
Date: Tue, 4 Mar 2025 09:13:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v3 5/9] dt-bindings: serial: document qcom,gsi-dma-allowed
Message-ID: <20250304-messy-cherubic-sheep-d77fde@krzk-bin>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-6-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303124349.3474185-6-quic_vdadhani@quicinc.com>

On Mon, Mar 03, 2025 at 06:13:45PM +0530, Viken Dadhaniya wrote:
> Data transfer mode is fixed by TrustZone (TZ), which currently restricts
> developers from modifying the transfer mode from the APPS side.
> 
> Document the 'qcom,gsi-dma-allowed' property to select the data transfer
> mode to GPI DMA (Generic Packet Interface). If not set, FIFO mode
> (PIO/CPU DMA) will be selected by default.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
> v2 -> v3:

Missing dependency.

> 
> - Drop the 'qcom,xfer-mode' property and add the 'qcom,gsi-dma-allowed' property.
> - Add a reference for the QUP peripheral shared YAML.
> - Update commit log.
> 
> v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-5-quic_vdadhani@quicinc.com/
> 
> v1 -> v2:
> 
> - Drop 'qcom,load-firmware' property and add 'firmware-name' property in
>   qup common driver.
> - Update commit log.
> 
> v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-4-quic_vdadhani@quicinc.com/
> ---
> ---
>  .../devicetree/bindings/serial/qcom,serial-geni-qcom.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
> index dd33794b3534..254fab9f2341 100644
> --- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
> @@ -12,6 +12,7 @@ maintainers:
>  
>  allOf:
>    - $ref: /schemas/serial/serial.yaml#
> +  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
>  
>  properties:
>    compatible:
> @@ -53,6 +54,8 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  qcom,gsi-dma-allowed: true

And this also should be investigated, just like for I2C and SPI.

Best regards,
Krzysztof


