Return-Path: <linux-i2c+bounces-7368-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0D299D685
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 20:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DCE61C24581
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 18:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2701C3024;
	Mon, 14 Oct 2024 18:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fluyp9CN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C96231C95;
	Mon, 14 Oct 2024 18:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728930721; cv=none; b=JHQfqxjkIBY08ju5G7HVn8c6i6FOSgnqx1FRiKGBDSu1ZjRsaE5L9aOCV15QIYARWjfrVpEOdkbERANc1/K+OwSkCuY15uomZ5meogZio+fWf91MTqd9vYZYJrCkaMYSPiQbe8QIYwwYX3g5nG7xGysBoBqcLSDD4DOlS29yaiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728930721; c=relaxed/simple;
	bh=RG4/nDT46kycXXQKtFYWQNbSP+F0U/tnpGLCt1EZXhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRXJ4T99hk1lm1fg6D3TnoVHtjupGUguaXJbRfYHtsSOWXNn8CWMldJaL27tiI0s/rOtLSd65+NgcRe3SAv4Bz2kSX3fSZsIcCo4cxl2uuSfbjDkgEzwVLnL7vWB7oFvr4iWw8SwsmRR0Y4kmc+6ExZA1aa/BektsTPIxO/O3aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fluyp9CN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D02C4CEC3;
	Mon, 14 Oct 2024 18:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728930720;
	bh=RG4/nDT46kycXXQKtFYWQNbSP+F0U/tnpGLCt1EZXhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fluyp9CNWo9lkTUnVwuUWcKwKSsWc0do/2EMgp7oEH14PzVufeX9YLuwv8fCBi/yv
	 2+AqjFB6phy9haKvIbR4W9q9Bt4z7AaJe0OQXiHJVWmS7vuPy7ADz8IvBks+6u8RDh
	 9qtKk1xdmedY7uHuA8sDAlvCPGR1ZFPWtB3bkv3O3wJyle3bOkiyN/NLeOkPuATZ28
	 bgMxU+hExBbp7EZHpmzeWuwaFRsk8zMNI3f6rkDUJ78+ztSFUEo9iXagIpe+csX3cA
	 5Nu9vZFyEXsGFwt5PLjvkTwQf8DeG5l1CouxBmDvO3W9yxmbeXkzC73P+gFaemxO3P
	 /x1b3n77ZWToQ==
Date: Tue, 15 Oct 2024 00:01:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
	linux@treblig.org, dan.carpenter@linaro.org, Frank.Li@nxp.com,
	konradybcio@kernel.org, bryan.odonoghue@linaro.org,
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 2/4] dma: gpi: Add Lock and Unlock TRE support to
 access SE exclusively
Message-ID: <Zw1jm+cVpwz0xhGp@vaman>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-3-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927063108.2773304-3-quic_msavaliy@quicinc.com>

On 27-09-24, 12:01, Mukesh Kumar Savaliya wrote:
> GSI DMA provides specific TREs namely Lock and Unlock TRE, which
> provides mutual exclusive access to SE from any of the subsystem
> (E.g. Apps, TZ, ADSP etc). Lock prevents other subsystems from
> concurrently performing DMA transfers and avoids disturbance to
> data path. Basically for shared SE usecase, lock the SE for
> particular subsystem, complete the transfer, unlock the SE.

it is dmaengine: xxx so please update that

> 
> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
> TRE for the last transfer.
> 
> Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
> 
> TRE = Transfer Ring Element, refers to the queued descriptor.
> SE = Serial Engine
> SS = Subsystems (Apps processor, TZ, ADSP, Modem)
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  drivers/dma/qcom/gpi.c           | 37 +++++++++++++++++++++++++++++++-
>  include/linux/dma/qcom-gpi-dma.h |  6 ++++++
>  2 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 52a7c8f2498f..120d91234442 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2020, Linaro Limited
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -65,6 +66,14 @@
>  /* DMA TRE */
>  #define TRE_DMA_LEN		GENMASK(23, 0)
>  
> +/* Lock TRE */
> +#define TRE_I2C_LOCK		BIT(0)
> +#define TRE_MINOR_TYPE		GENMASK(19, 16)
> +#define TRE_MAJOR_TYPE		GENMASK(23, 20)
> +
> +/* Unlock TRE */
> +#define TRE_I2C_UNLOCK		BIT(8)
> +
>  /* Register offsets from gpi-top */
>  #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)	(0x20000 + (0x4000 * (n)) + (0x80 * (k)))
>  #define GPII_n_CH_k_CNTXT_0_EL_SIZE	GENMASK(31, 24)
> @@ -516,7 +525,7 @@ struct gpii {
>  	bool ieob_set;
>  };
>  
> -#define MAX_TRE 3
> +#define MAX_TRE 5
>  
>  struct gpi_desc {
>  	struct virt_dma_desc vd;
> @@ -1637,6 +1646,19 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>  	struct gpi_tre *tre;
>  	unsigned int i;
>  
> +	/* create lock tre for first tranfser */
> +	if (i2c->shared_se && i2c->first_msg) {
> +		tre = &desc->tre[tre_idx];
> +		tre_idx++;
> +
> +		tre->dword[0] = 0;
> +		tre->dword[1] = 0;
> +		tre->dword[2] = 0;
> +		tre->dword[3] = u32_encode_bits(1, TRE_I2C_LOCK);
> +		tre->dword[3] |= u32_encode_bits(0, TRE_MINOR_TYPE);
> +		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
> +	}
> +
>  	/* first create config tre if applicable */
>  	if (i2c->set_config) {
>  		tre = &desc->tre[tre_idx];
> @@ -1695,6 +1717,19 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>  		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
>  	}
>  
> +	/* Unlock tre for last transfer */
> +	if (i2c->shared_se && i2c->last_msg && i2c->op != I2C_READ) {
> +		tre = &desc->tre[tre_idx];
> +		tre_idx++;
> +
> +		tre->dword[0] = 0;
> +		tre->dword[1] = 0;
> +		tre->dword[2] = 0;
> +		tre->dword[3] = u32_encode_bits(1, TRE_I2C_UNLOCK);
> +		tre->dword[3] |= u32_encode_bits(1, TRE_MINOR_TYPE);
> +		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
> +	}
> +
>  	for (i = 0; i < tre_idx; i++)
>  		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
>  			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 6680dd1a43c6..8589c711afae 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h
> @@ -65,6 +65,9 @@ enum i2c_op {
>   * @rx_len: receive length for buffer
>   * @op: i2c cmd
>   * @muli-msg: is part of multi i2c r-w msgs
> + * @shared_se: bus is shared between subsystems
> + * @bool first_msg: use it for tracking multimessage xfer
> + * @bool last_msg: use it for tracking multimessage xfer
>   */
>  struct gpi_i2c_config {
>  	u8 set_config;
> @@ -78,6 +81,9 @@ struct gpi_i2c_config {
>  	u32 rx_len;
>  	enum i2c_op op;
>  	bool multi_msg;
> +	bool shared_se;
> +	bool first_msg;
> +	bool last_msg;

Looking at the usage in following patches, why cant this be handled
internally as part of prep call?


>  };
>  
>  #endif /* QCOM_GPI_DMA_H */
> -- 
> 2.25.1

-- 
~Vinod

