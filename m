Return-Path: <linux-i2c+bounces-9706-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF17A4D5D2
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 09:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1755A170C14
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 08:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251481F9F51;
	Tue,  4 Mar 2025 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYWgQcQi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CF2335BA;
	Tue,  4 Mar 2025 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075811; cv=none; b=YRPO1dBuDroFBGaJHdPHjZx7vUdpIuHLwaVtSs/qCLJA104NLB9bzKIrDyTFkw135x9eKQFy+i17mQcU80P2EBt9MXqfk7UOUSRE/ODw7raHB711U9FCtFlJX00q5Z1/XNmmXNOo9ZNWBaetWkwDuuBdqrWe/fWN1fkeEGnnWMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075811; c=relaxed/simple;
	bh=YPn0JtAXOQ3y6ei1gM3bLUqxFFlf9lDzToaVKIuhXuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePk5e92gTQrnhvYvrdRGpEEP161b3kRsrOxUzTP4SFmuZX23K7usXgNptRqj67WAsoryY+JANDGv5cHjXmbWlnzryEAdTS+s0xnmKmxi3JS7d07pnVwUwwsvSQuMq2+q4shEp9WLowqRBhqPGKQ49KZy8o7Um/e2BNDdmt1YlVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYWgQcQi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59084C4CEE5;
	Tue,  4 Mar 2025 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741075810;
	bh=YPn0JtAXOQ3y6ei1gM3bLUqxFFlf9lDzToaVKIuhXuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OYWgQcQimkmwOa+mFI3kD7YZpFuXBubf+hBuLhiIOk8c5pIVTBddeqJjoziXHnHXp
	 HnAyvGzF/aF88L6+4CfGtnz5B1U+TMN6su+HE+Bn7KsjOG8KvG7y5VZ3Ma5FgLJyFn
	 tdfWZAx9aIiNVE2o7FT4PA/Fc2uBPPhKTPcNxwsHUPLRXyL5gWw2DAajaYlJxdq0qI
	 PqZmL20teJRClNMnlrfMhxq0LfcUCIBkKNkWYFkvqMQUcU32GDw3lNHFQMgy13Qgf7
	 tHzXRAoUKAzGYa96SV6gyJE/XtYcaSUVSoJS189Spai8nelUL0SjSuJT6i8jCO8NOw
	 R7PL6oPSb8yQA==
Date: Tue, 4 Mar 2025 09:10:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v3 2/9] dt-bindings: qcom: se-common: Add QUP
 Peripheral-specific properties for I2C, SPI, and SERIAL bus
Message-ID: <20250304-crafty-beaver-of-teaching-b58efb@krzk-bin>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-3-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303124349.3474185-3-quic_vdadhani@quicinc.com>

On Mon, Mar 03, 2025 at 06:13:42PM +0530, Viken Dadhaniya wrote:
> Introduce a new YAML schema for QUP-supported peripherals. Define common
> properties used across QUP-supported peripherals.
> 
> Add property `qcom,gsi-dma-allowed` to configure the Serial Engine (SE) for
> QCOM GPI DMA mode.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>  .../soc/qcom/qcom,se-common-props.yaml        | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)

You miss here any user of this.

>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,se-common-props.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,se-common-props.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,se-common-props.yaml
> new file mode 100644
> index 000000000000..a111e51bb1c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,se-common-props.yaml
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,se-common-props.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: QUP Peripheral-specific properties for I2C, SPI and SERIAL bus.

Drop full stop. Titles never have them.

> +
> +description:
> +  The Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP) is
> +  a programmable module that supports a wide range of serial interfaces
> +  such as UART, SPI, I2C, I3C, etc. This defines the common properties used
> +  across QUP-supported peripherals.
> +
> +maintainers:
> +  - Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> +  - Viken Dadhaniya <quic_vdadhani@quicinc.com>
> +
> +properties:
> +  qcom,gsi-dma-allowed:

Based on description: qcom,enable-gsi-dma
(or description is not accurate)

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Configure the Serial Engine (SE) to transfer data in QCOM GPI DMA mode.
> +      By default, FIFO mode (PIO/CPU DMA) will be selected.

Best regards,
Krzysztof


