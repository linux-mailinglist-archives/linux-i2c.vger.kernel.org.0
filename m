Return-Path: <linux-i2c+bounces-10810-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7C5AABBF1
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 09:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DBB01BC849F
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 07:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCEC253955;
	Tue,  6 May 2025 07:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qy1kyuLd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CB8230BC8;
	Tue,  6 May 2025 07:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746515124; cv=none; b=MU/gr6pfYWf6G/0AWYszHYYXifXuzdCZjKxeNQTfvd8N3gmMMUE+GKBtwqZNIM141f+/4/rOY+QgO8y6y9mgPPUE7S/J04a4SPfEjxl0TTl+lU9gbqj9PWPR0zEAny3QnvSQpdIRToIa/JmFeXV75KWonOZMCH05nuk95W04Kuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746515124; c=relaxed/simple;
	bh=tfHqe1+/LVxt7tapSLkZl712evbljUfVYhNvFheJdPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PalSw1VBCX3HiG6Qf8ByfGq/hKwq2GoWO1GSsqp0WcGf9LxHTHjMMmiwEcCT/ZCT7tTEag8WIUjc+OJ2uK65eSWabaDScYvVjA8C4fWtS3nzXhzZ0vfbO7C3mRxBCHEo8vxwOEL2nPopVhXC7VHM2FKPVEn5v+4Z0GOyrko+uZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qy1kyuLd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E69C4CEE4;
	Tue,  6 May 2025 07:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746515124;
	bh=tfHqe1+/LVxt7tapSLkZl712evbljUfVYhNvFheJdPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qy1kyuLdabK04PJp8dn95pC+Um02H/yfH5OLfzJdq2lD2RsxSBWqVM4+NxdtSx4wF
	 TCxJkADf2V2LxE9IgRgRwAc4VptcFd/Efga850l0cIDjXzMJj1aR343q4L1LdC7aFp
	 EQlmSK6YdAZ3wLWxL1BucVkPljH+nvxUKp3MHELn7yeSLgbGhvLI8Fe5VgdzEEPXGC
	 quYD3DKjRTbXHd5ONpQsGOY1bRX4sLekbTvd8OKQ3BE7Qnnr1wI/67l4OWfCbG8IOr
	 LCV9OlvK/FCYvruGpT6MBmAYg2U6y0s2qst2bV4PVZ+pB1AzdePOLWKW0MY0dSjvMd
	 YO0qkT3oUIPSw==
Date: Tue, 6 May 2025 09:05:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v4 1/5] dt-bindings: qcom: se-common: Add QUP
 Peripheral-specific properties for I2C, SPI, and SERIAL bus
Message-ID: <20250506-positive-viper-of-prowess-3d1f6e@kuoka>
References: <20250503111029.3583807-1-quic_vdadhani@quicinc.com>
 <20250503111029.3583807-2-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250503111029.3583807-2-quic_vdadhani@quicinc.com>

On Sat, May 03, 2025 at 04:40:25PM GMT, Viken Dadhaniya wrote:
> Introduce a new YAML schema for QUP-supported peripherals. Define common
> properties used across QUP-supported peripherals.
> 
> Add property `qcom,enable-gsi-dma` to configure the Serial Engine (SE) for
> QCOM GPI DMA mode.
> 
> Reference the common schema YAML in the GENI I2C, SPI, and SERIAL YAML
> files.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


