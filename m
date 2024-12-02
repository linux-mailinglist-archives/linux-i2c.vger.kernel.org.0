Return-Path: <linux-i2c+bounces-8282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 807EB9DFB06
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 08:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40F73281BD8
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 07:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028DE1F9404;
	Mon,  2 Dec 2024 07:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdbvT6SZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1971E231E;
	Mon,  2 Dec 2024 07:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733124075; cv=none; b=URb/zg86fc+gTegyUTDHZx63GI9jYWrMUfR02NwNHQx5c3U2B8Bf1uX2zedj53DhZzWi6Fw9WRVXnBT0q6Hfk5cfuSd1WTSrQ4fq2IHj/gdSUuypwddXtm0eJi+qMXK1z5JPD/GyqRgxpdwhl08kBiB3oFI/ZA2f1cGOSrS86Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733124075; c=relaxed/simple;
	bh=3worsxoX+CvvLyHiN4PGIKhbZ26gkfIZ3nKAMmmYUfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJ6CkaM+Z1umGtGZCDtVDbTDgOFT+ctLomA/qtEL3R35l9awwxjUY+9hJj5mEnUTuAtcgLroBOZvbapA9/SR5jk1iW4F7ZJr16wDDjbZYc34qVk5gHYX+dsxxPOtZPKxeRqftg+D3fdpzN5Ox2mHEwGcZLdvIArJU+uUmM68Kzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdbvT6SZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D1FC4CED2;
	Mon,  2 Dec 2024 07:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733124074;
	bh=3worsxoX+CvvLyHiN4PGIKhbZ26gkfIZ3nKAMmmYUfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OdbvT6SZG+Q78WUGTrFPdOe5s8L97MLTUkH/GLNEnmtVGTTyPsYHslSKSxRaFjZS9
	 s1pK7FuWvxjwBrs/yxoPJiwZqCf8bQA2TjqIzpVFNaVazH+yHCmGgiTOGEQsSqZdHg
	 0h7/BCRiZpaPAKDqAD6qDzw6blN6lIYA7zuVsdNprtwxWqx6qacbZocvK6Grp1vnAK
	 1TCGfIKtX8/9AEjkEV/zJ4ftWFovQe2PLM9aKT+Ii6gS5kyDCLlRa2GZf0/RIeR08l
	 DBWz6tuMG8lc1Q2cT9HRuq6EWKIgRhJF7O2Sq4Ew6phaSXitw36NofPchF2Ip3iIyv
	 3FYJe8bfF49QA==
Date: Mon, 2 Dec 2024 12:51:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com,
	quic_vtanuku@quicinc.com
Subject: Re: [PATCH v3 1/3] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <Z01f5sfeiSwThu02@vaman>
References: <20241121130134.29408-1-quic_jseerapu@quicinc.com>
 <20241121130134.29408-2-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121130134.29408-2-quic_jseerapu@quicinc.com>

On 21-11-24, 18:31, Jyothi Kumar Seerapu wrote:
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results in
> N interrupts for N messages, leading to significant software
> interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
> Enabling BEI instructs the GSI hardware to prevent interrupt generation
> and BEI is disabled when an interrupt is necessary.
> 
> When using BEI, consider splitting a single multi-message transfer into
> chunks of 8 internally. Interrupts are not expected for the first 7 message
> completions, only the last message triggers an interrupt,indicating
> the completion of 8 messages.
> 
> This BEI mechanism enhances overall transfer efficiency.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v2-> v3:
>    - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
>    - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>    - Added documentation for newly added changes in "qcom-gpi-dma.h" file
>    - Updated commit description. 
> 
> v1 -> v2:
>    - Changed dma_addr type from array of pointers to array.
>    - To support BEI functionality with the TRE size of 64 defined in GPI driver,
>      updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.
>  
>  drivers/dma/qcom/gpi.c           | 48 ++++++++++++++++++++
>  include/linux/dma/qcom-gpi-dma.h | 76 ++++++++++++++++++++++++++++++++
>  2 files changed, 124 insertions(+)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 52a7c8f2498f..5442b65b1638 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1693,6 +1693,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>  
>  		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>  		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
> +
> +		if (i2c->flags & QCOM_GPI_BLOCK_EVENT_IRQ)
> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>  	}
>  
>  	for (i = 0; i < tre_idx; i++)
> @@ -2098,6 +2101,51 @@ static int gpi_find_avail_gpii(struct gpi_dev *gpi_dev, u32 seid)
>  	return -EIO;
>  }
>  
> +/**
> + * gpi_multi_xfer_timeout_handler() - Handle multi message transfer timeout
> + * @dev: pointer to the corresponding dev node
> + * @multi_xfer: pointer to the gpi_multi_xfer
> + * @num_xfers: total number of transfers
> + * @transfer_timeout_msecs: transfer timeout value
> + * @transfer_comp: completion object of the transfer
> + *
> + * This function is used to wait for the processed transfers based on
> + * the interrupts generated upon transfer completion.
> + * Return: On success returns 0, otherwise return error code (-ETIMEDOUT)
> + */
> +int gpi_multi_xfer_timeout_handler(struct device *dev, struct gpi_multi_xfer *multi_xfer,
> +				   u32 num_xfers, u32 transfer_timeout_msecs,
> +				   struct completion *transfer_comp)
> +{
> +	int i;
> +	u32 max_irq_cnt, time_left;
> +
> +	max_irq_cnt = num_xfers / NUM_MSGS_PER_IRQ;
> +	if (num_xfers % NUM_MSGS_PER_IRQ)
> +		max_irq_cnt++;
> +
> +	/*
> +	 * Wait for the interrupts of the processed transfers in multiple
> +	 * of 8 and for the last transfer. If the hardware is fast and
> +	 * already processed all the transfers then no need to wait.
> +	 */
> +	for (i = 0; i < max_irq_cnt; i++) {
> +		reinit_completion(transfer_comp);
> +		if (max_irq_cnt != multi_xfer->irq_cnt) {
> +			time_left = wait_for_completion_timeout(transfer_comp,
> +								transfer_timeout_msecs);
> +			if (!time_left) {
> +				dev_err(dev, "%s: Transfer timeout\n", __func__);
> +				return -ETIMEDOUT;
> +			}
> +		}
> +		if (num_xfers > multi_xfer->msg_idx_cnt)
> +			return 0;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gpi_multi_xfer_timeout_handler);
> +
>  /* gpi_of_dma_xlate: open client requested channel */
>  static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
>  					 struct of_dma *of_dma)
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 6680dd1a43c6..f001a8ac1887 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h
> @@ -15,6 +15,38 @@ enum spi_transfer_cmd {
>  	SPI_DUPLEX,
>  };
>  
> +/**
> + * define QCOM_GPI_BLOCK_EVENT_IRQ - Block event interrupt support
> + *
> + * This is used to enable/disable the Block event interrupt mechanism.
> + */
> +#define QCOM_GPI_BLOCK_EVENT_IRQ	BIT(0)
> +
> +/**
> + * define QCOM_GPI_MAX_NUM_MSGS	- maximum number of messages support
> + *
> + * This indicates maximum number of messages can allocate and
> + * submit to hardware. To handle more messages beyond this,
> + * need to unmap the processed messages.
> + */
> +#define QCOM_GPI_MAX_NUM_MSGS		16
> +
> +/**
> + * define NUM_MSGS_PER_IRQ - interrupt per messages completion
> + *
> + * This indicates that trigger an interrupt, after the completion of 8 messages.
> + */
> +#define NUM_MSGS_PER_IRQ		8
> +
> +/**
> + * define MIN_NUM_OF_MSGS_MULTI_DESC - \
> + *	minimum number of messages to support Block evenet interrupt
> + *
> + * This indicates minimum number of messages in a trenafer required to
> + * process it using block event interrupt mechanism.
> + */
> +#define MIN_NUM_OF_MSGS_MULTI_DESC	2
> +
>  /**
>   * struct gpi_spi_config - spi config for peripheral
>   *
> @@ -51,6 +83,29 @@ enum i2c_op {
>  	I2C_READ,
>  };

why should these be exposed to user? 

>  
> +/**
> + * struct gpi_multi_xfer - Used for multi transfer support
> + *
> + * @msg_idx_cnt: message index for the transfer
> + * @buf_idx: dma buffer index
> + * @unmap_msg_cnt: unmapped transfer index
> + * @freed_msg_cnt: freed transfer index
> + * @irq_cnt: received interrupt count
> + * @irq_msg_cnt: transfer message count for the received irqs
> + * @dma_buf: virtual addresses of the buffers
> + * @dma_addr: dma addresses of the buffers
> + */
> +struct gpi_multi_xfer {
> +	u32 msg_idx_cnt;
> +	u32 buf_idx;
> +	u32 unmap_msg_cnt;
> +	u32 freed_msg_cnt;
> +	u32 irq_cnt;
> +	u32 irq_msg_cnt;
> +	void *dma_buf[QCOM_GPI_MAX_NUM_MSGS];
> +	dma_addr_t dma_addr[QCOM_GPI_MAX_NUM_MSGS];
> +};

DMAengine API can do multiple transfers and we already have flags for
interrupts, pls use that instead of usual behaviour of defining custom
interfaces to handle everything. That is not recommended


> +
>  /**
>   * struct gpi_i2c_config - i2c config for peripheral
>   *
> @@ -65,6 +120,8 @@ enum i2c_op {
>   * @rx_len: receive length for buffer
>   * @op: i2c cmd
>   * @muli-msg: is part of multi i2c r-w msgs
> + * @flags: true for block event interrupt support
> + * @multi_xfer: indicates transfer has multi messages
>   */
>  struct gpi_i2c_config {
>  	u8 set_config;
> @@ -78,6 +135,25 @@ struct gpi_i2c_config {
>  	u32 rx_len;
>  	enum i2c_op op;
>  	bool multi_msg;
> +	u8 flags;
> +	struct gpi_multi_xfer multi_xfer;
>  };
>  
> +/**
> + * gpi_multi_timeout_handler() - Handle multi message transfer timeout
> + * @dev: pointer to the corresponding dev node
> + * @multi_xfer: pointer to the gpi_multi_xfer
> + * @num_xfers: total number of transfers
> + * @transfer_timeout_msecs: transfer timeout value
> + * @transfer_comp: completion object of the transfer
> + *
> + * This function is used to wait for the processed transfers based on
> + * the interrupts generated upon transfer completion.
> + *
> + * Return: On success returns 0, otherwise return error code (-ETIMEDOUT)
> + */
> +int gpi_multi_xfer_timeout_handler(struct device *dev, struct gpi_multi_xfer *multi_xfer,
> +			   u32 num_xfers, u32 tranfer_timeout_msecs,
> +			   struct completion *transfer_comp);

Why should a handler be here?

-- 
~Vinod

