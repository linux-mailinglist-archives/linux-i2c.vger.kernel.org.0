Return-Path: <linux-i2c+bounces-7401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8916699EE8C
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 16:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 302111F2504C
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 14:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0954C1AF0DF;
	Tue, 15 Oct 2024 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9Tie2A9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40B437160;
	Tue, 15 Oct 2024 14:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729000872; cv=none; b=WUKsVDJYKO+/qf4U+LjMBMkBNPQqEhfvQaHWwBQMfN2pH3dk8cjJS06JMp1csndFGIvVyzyae4igSOzye65tEPH/wQCNZuFBfTqhsFLc8T2R48y/+EXwjDjk4fL3phVcJx4PvlwW4OU7sFVE+o13seuzRrdKvnlNZTdNdQfIN68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729000872; c=relaxed/simple;
	bh=Hpil3qyQcxL9gsLtmpPaNlPIYSn4ilHSo8PamVfpP08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBHloO/r/dA0pyxVu0LpmdXj+SK2qAEppxyS9FqdSfkRSoDDSZZIwXj1QnDpLLoks0D3+akUwJIrCyqgq++EBRBDuRBdALzGYAegTdo+Hlja5Eu7Z7bxaXx+qgM8i40/DFSjCIIBs2W/ceF6EsUbPnhgio9zNxPhxDdxKt/CBbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9Tie2A9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FACC4CEC6;
	Tue, 15 Oct 2024 14:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729000872;
	bh=Hpil3qyQcxL9gsLtmpPaNlPIYSn4ilHSo8PamVfpP08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9Tie2A9vA28PhwfDTXNKAcPnNGLrT3HXxaEyaWy2os+EaFKTTanPL5kiJ4APiYGR
	 tWaHsYJdBf8ACz5Vk+gnHz161+dD+aTlYk6EZeUslnvgUk5CZHWZIMn9memCtOKOPL
	 DksBb6zZw00dbCJMqFIEOVbY18wxPYUn/oCxY6DCar20yBEVGqx2MXIV7J8LyIkQdY
	 sIGxramwOtYWD195TWOJsrQ/80wkInxupx3sBvWTm1g7y1PwUT+Tq8NZ9ocUQ2HL+e
	 qCywX612tyM1dK2+7Q+UFVaQXDLWI/F2oa1PPJUX6ql+9v+uEODDOAYA4V82Hlwmou
	 IBBdcDHmtv2GA==
Date: Tue, 15 Oct 2024 09:01:08 -0500
From: Rob Herring <robh@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com,
	quic_vtanuku@quicinc.com
Subject: Re: [PATCH v1 1/5] dt-bindings: dmaengine: qcom: gpi: Add additional
 arg to dma-cell property
Message-ID: <20241015140108.GA620512-robh@kernel.org>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-2-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015120750.21217-2-quic_jseerapu@quicinc.com>

On Tue, Oct 15, 2024 at 05:37:46PM +0530, Jyothi Kumar Seerapu wrote:
> When high performance with multiple i2c messages in a single transfer
> is required, employ Block Event Interrupt (BEI) to trigger interrupts
> after specific messages transfer and the last message transfer,
> thereby reducing interrupts.
> 
> For each i2c message transfer, a series of Transfer Request Elements(TREs)
> must be programmed, including config tre for frequency configuration,
> go tre for holding i2c address and dma tre for holding dma buffer address,
> length as per the hardware programming guide. For transfer using BEI,
> multiple I2C messages may necessitate the preparation of config, go,
> and tx DMA TREs. However, a channel TRE size of 64 is often insufficient,
> potentially leading to failures due to inadequate memory space.
> 
> Add additional argument to dma-cell property for channel TRE size.

No such property 'dma-cell'

> With this, adjust the channel TRE size via the device tree.
> The default size is 64, but clients can modify this value based on
> their specific requirements.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index 4df4e61895d2..002495921643 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -54,14 +54,16 @@ properties:
>      maxItems: 13
>  
>    "#dma-cells":
> -    const: 3
> +    minItems: 3
> +    maxItems: 4
>      description: >
>        DMA clients must use the format described in dma.txt, giving a phandle
> -      to the DMA controller plus the following 3 integer cells:
> +      to the DMA controller plus the following 4 integer cells:
>        - channel: if set to 0xffffffff, any available channel will be allocated
>          for the client. Otherwise, the exact channel specified will be used.
>        - seid: serial id of the client as defined in the SoC documentation.
>        - client: type of the client as defined in dt-bindings/dma/qcom-gpi.h
> +      - channel-tre-size: size of the channel TRE (transfer ring element)
>  
>    iommus:
>      maxItems: 1
> -- 
> 2.17.1
> 

