Return-Path: <linux-i2c+bounces-7418-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D8C9A0058
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 06:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 272911C224F9
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 04:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370D3189B9F;
	Wed, 16 Oct 2024 04:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spKCuFxq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2E721E3BA;
	Wed, 16 Oct 2024 04:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729054500; cv=none; b=R/U1RA+RSOM/hjg+ugWdK8rCiZqACf3vhB8AqvLeBrPJkpdnh1NfHVa8BPDUYpoKzs0NJ+tPMKQ5TvZDVetkb/wIJDpqxp204Fjm6M9ccoUCo+lhiEIe5vZnfZvbSfRipQX8oc6KmlGA3N5hXkhTPg7PqOORkxvPbQLZJFUkxgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729054500; c=relaxed/simple;
	bh=ZAbZqueFOhysiBh+zQ8zwnfD/RNSp46lSmK1+1nFQxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2nKnZ0ZW7kgTf9iPjmYb02Zbg6gH8Scq0L1RUEhuMBUZaDMqX00HFpSUMzimhM1aI+CchiNT+YmHlJiZ8DJADbx/A8ukstmP+AlP7PwMys4gnG3QXGGszYhLHkz6pvWSOaluFQkKLPyK13rwDrC7yRj7eQsnNTRyXyBnUA4+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spKCuFxq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F35C4CEC5;
	Wed, 16 Oct 2024 04:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729054498;
	bh=ZAbZqueFOhysiBh+zQ8zwnfD/RNSp46lSmK1+1nFQxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spKCuFxqFYLLRQaxwItjw18wjF6ni0fsOJovIA8hgE4lrkgpkYgjzKY0wjP/EGaDI
	 jijnGKTjmD+iHWPVwoq9gaoAPwZgjxXL68dYv5XWsGOOM+k8nbmNR2z/OBymU47+pV
	 FoMpooWFZ8WadAoq4BHTPMz2KQvGET8A+3V0MPjN8cxeiLpfJUy62PGmBgo9WUyV9g
	 Ykfp6rp2RraUcyHXpNN5P4rqEIRuAu6GKrVFfOZ0btOGa1h0PMW3/3bvb7AQX1xtm7
	 N3gqVNPp/BcJnazGbHRJIsQMPSXfH8QL26VuvrnaX07u8fP/Hd7GgAMiczDfD1/AY0
	 dTPItXhMLpQ6Q==
Date: Wed, 16 Oct 2024 10:24:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Message-ID: <Zw9HHRyvfd66Qn4a@vaman>
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

On 15-10-24, 17:37, Jyothi Kumar Seerapu wrote:
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

This is a firmware /software property, why should this be in hardware
description?

-- 
~Vinod

