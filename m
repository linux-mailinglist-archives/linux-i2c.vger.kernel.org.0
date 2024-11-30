Return-Path: <linux-i2c+bounces-8276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 466539DEEFA
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Nov 2024 05:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C9652815BF
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Nov 2024 04:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E6513BAE2;
	Sat, 30 Nov 2024 04:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cT781H+d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6351798F;
	Sat, 30 Nov 2024 04:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732941948; cv=none; b=uJZYrP7IumbggvOIPdxgJq83PzSF5y3RePzlrt4vYXYk+Op+iAHmOCwmmgeadaNNh6vMHIwc9u45mDRWL/rUOh4Rd4M60Ni1K+C1ZLVTKpyvxVx8+mu8u8AIZ+lUnPqFMLwcmA3gYKabgfAAz0DIBDAnD/hm+ztYPXEOdqx4tC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732941948; c=relaxed/simple;
	bh=buFC7QWTIP8S4n9Bn7J8DHZ6cCnpP8huZHS8Hy77UoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACndIDT/GwzzCSnVe4IGpGRYz7IxMfKODTTa7FNstBgluzxpm2sZxkspUX1mFmiaM228l/8eoxlVXw6WHkmIobpXuk/l9/2h7OCbnJ9bua5thJnXKzSYVy6wUjxYnXGvCX8bFlboIf2RbwBIJTOmR6yDEi9r5XvBQVwU7ZCV1xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cT781H+d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E93C4CECC;
	Sat, 30 Nov 2024 04:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732941947;
	bh=buFC7QWTIP8S4n9Bn7J8DHZ6cCnpP8huZHS8Hy77UoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cT781H+dfprlBRwuk+c3G8/Nd3+YDMQFT5iEfNw8Pxgcz71KR+AjpoL3uPq9s+z8U
	 6sXYDfb5fW9cc2YEpdBNdJuoTYvFoS7LVJOSyhRWawrbB0E+HBcmGl78re7rtot34M
	 UVDfGX+6K9VTwK2WC/Qlk7Gzh9EyOx7XBzc2knJ+BkRMJ2W7mBt4HKUtEPhVBtvmOo
	 0ffYG+SY9RyxBy/mvujUsJIgfkYfE/goKAgjMNmmBy68TK9hcFPGbUOvodpyhAf1Y1
	 zQFm7Fj8L2PhftIaTZJL5gm7uPKZmr2pdP38tuOVoRig+acbcxjTABRatCixQBEs+o
	 2PLeNkEm/Zwvw==
Date: Fri, 29 Nov 2024 22:45:43 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andi.shyti@kernel.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, conor+dt@kernel.org, agross@kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org, 
	Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org, 
	krzk+dt@kernel.org, robh@kernel.org, quic_vdadhani@quicinc.com
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
Message-ID: <5gy5gldcybby53irzyu6lejbwb6wcorb2k4qpd4j7yrijemehu@wmj3tgvxvhdy>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-2-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129144357.2008465-2-quic_msavaliy@quicinc.com>

On Fri, Nov 29, 2024 at 08:13:54PM +0530, Mukesh Kumar Savaliya wrote:
> Adds qcom,shared-se flag usage. Use this flag when I2C serial controller
> needs to be shared in multiprocessor system(APPS,Modem,ADSP) environment.
> 

Per https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
your commit message should start with a description of your problem.
"Add" isn't the right word to start a problem description with.

> SE(Serial Engine HW controller acting as protocol master controller) is an
> I2C controller. Basically a programmable SERDES(serializer/deserializer)

"Basically"?

> coupled with data DMA entity, capable in handling a bus protocol, and data
> moves to/from system memory.
> 
> Two clients from different processors can share an I2C controller for same
> slave device OR their owned slave devices. Assume I2C Slave EEPROM device
> connected with I2C controller. Each client from ADSP SS and APPS Linux SS
> can perform i2c transactions.
> 

The DeviceTree binding describes properties used to describe the
hardware; your commit message describes what a SE is and that it can
exist can exist in a configuration with multiple client etc etc.

> Transfer gets serialized by Lock TRE + DMA xfer + Unlock TRE at HW level.
> 

This isn't what this patch implements. It defines a property which when
specified means to the OS that any DMA transfers should be performed
using TRE lock/unlock operations.

> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..88682a333399 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -60,6 +60,14 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  qcom,shared-se:
> +    description: True if I2C controller is shared between two or more system processors.

This attempts to describe the property.

> +        SE(Serial Engine HW controller working as protocol master controller) is an
> +        I2C controller. Basically, a programmable SERDES(serializer/deserializer)
> +        coupled with data DMA entity, capable in handling a bus protocol, and data
> +        moves to/from system memory.

But this is basically just 4 lines of text expanding the acronym "se",
but while it might give some insight into what this binding (the whole
binding) is about, I'm afraid it doesn't add value to the understanding
of the property...

Regards,
Bjorn

> +    type: boolean
> +
>    reg:
>      maxItems: 1
>  
> -- 
> 2.25.1
> 

