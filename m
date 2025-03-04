Return-Path: <linux-i2c+bounces-9710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD620A4D5EE
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 09:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14DEA17190F
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 08:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511591FBCA4;
	Tue,  4 Mar 2025 08:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPZqw6dW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8C21FBC87;
	Tue,  4 Mar 2025 08:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741076006; cv=none; b=i4C/102JKE3Hwb/8xU7ylrLI8RUitq9MMwuZvOvrh/O6+wDBO+45+GMn0vXQceXJBlQwEtSmbQK07+UnzzK2TzTxBq0Nl+gXdfHZDTeEUqOePPXBJHirU3Hhth6i2rnUCp9JoFnaC1bZggFJCCue0BycyP3QhPqb4/W83vzDHzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741076006; c=relaxed/simple;
	bh=ek0Sn+fSeBGsAZY/qpJiMpbcTAzkN5F7cgE1XkViU4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8p1yvfcqx+mTQ99vmiZXajU8tAZ++WMddCrlXWVtyP6PutZutJPIj2n1kD0Yi1RgVqID0Q1Te7PCCVP+p8uR6V8kjPpHF4LDcB0N7WR9cf9QsIuSN5xfwLzi7LH8Txj5JR4fC8uzsG6Tg2DpLFrkPOpAC+3gj8AjNxLmShXdoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPZqw6dW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837E3C4CEE5;
	Tue,  4 Mar 2025 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741076005;
	bh=ek0Sn+fSeBGsAZY/qpJiMpbcTAzkN5F7cgE1XkViU4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aPZqw6dWC3VoMpkCC7ZYf5BCtS2zfgeSDJOVH6Fh1IiY3qPXaIbbfd84fxfI1whF/
	 yT+084X5CWzYFzTIYTO0hrUCEt9jPNb7//Ivd/0sLl18zP+4G0D/8KNzV7NOFfImAa
	 QXcw90v5w2lSynjkDAs4xncqByPDnteWsSDXEhfu9d/IUjeCzZYgeiHzQGXEyrFGUH
	 Fmdv3p+8YDIjXQXtCHJZn+VtmE9/MdAJGslg4t5ftOMtRKGxnalbO7XsbAJsQ8yiQS
	 bDToVeDhSYvL+BHlNxayn2jwD1nk7l17M0r0+t9SEqjG0KuPmp5aaQjNGSqNZIWOsk
	 udSCM9Kol6Leg==
Date: Tue, 4 Mar 2025 09:13:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v3 4/9] spi: dt-bindings: document qcom,gsi-dma-allowed
Message-ID: <20250304-pumpkin-dinosaur-of-glory-9e1dac@krzk-bin>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-5-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303124349.3474185-5-quic_vdadhani@quicinc.com>

On Mon, Mar 03, 2025 at 06:13:44PM +0530, Viken Dadhaniya wrote:
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
> 

Missing dependency explanation.

> - Drop the 'qcom,xfer-mode' property and add the 'qcom,gsi-dma-allowed' property.
> - Add a reference for the QUP peripheral shared YAML.
> - Update commit log.
> 
> v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-4-quic_vdadhani@quicinc.com/
> 
> v1 -> v2:
> 
> - Drop 'qcom,load-firmware' property and add 'firmware-name' property in
>   qup common driver.
> - Update commit log.
> 
> v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-3-quic_vdadhani@quicinc.com/
> ---
> ---
>  Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
> index 2e20ca313ec1..012cb7aecb3d 100644
> --- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
> @@ -25,6 +25,7 @@ description:
>  
>  allOf:
>    - $ref: /schemas/spi/spi-controller.yaml#
> +  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
>  
>  properties:
>    compatible:
> @@ -63,6 +64,8 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  qcom,gsi-dma-allowed: true

Other comments also apply here probably.

Best regards,
Krzysztof


