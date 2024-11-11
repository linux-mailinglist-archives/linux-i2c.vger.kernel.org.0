Return-Path: <linux-i2c+bounces-7932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F01B9C4940
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 23:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE1E9B29240
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 22:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDEE1BD9EB;
	Mon, 11 Nov 2024 22:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBBm2a0P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D6F1BD4E2;
	Mon, 11 Nov 2024 22:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731364574; cv=none; b=hPV6NRp0Y/V9sC6Em1qaHxrJD326n6X0orKW0k2oAeXW3UWQb8deFbu8F0B/q5Cd9/Zo5HapF0MfKlGiu2hplYYwAiW2smuDlB16NBj28f/D7VuI11GfaqL6vUDRvtG50VBzq9g+ugoAXD8TfOCHFjLss2gy+2K9f059ayS5Nwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731364574; c=relaxed/simple;
	bh=VTKOlFWEU9rOqd7gZBhNAomP4MX1h4GCfami6fw8+/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzuAiLRoDmAo6SG8weyNO/m+geziKTjTQM4e2zR/36ziEOTh18Vyjjizz8XJ9UVBU8zyTLAfpc6jYs0jZABz9BWKuATF6odGCrzFqzMrT02OHdL9jT82p2eS694zWKDdIuvucFyWpZcdI35xo2hNl4Vuoqn76zI7ftE7+VqP8oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBBm2a0P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496E2C4CECF;
	Mon, 11 Nov 2024 22:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731364573;
	bh=VTKOlFWEU9rOqd7gZBhNAomP4MX1h4GCfami6fw8+/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nBBm2a0Pr5NIWYOXXdCLtj4EMDDSCHlucluq1dxm1h+bLuHxsdJd7zYrkj9ZyXfCH
	 0A4lnLn8RKNJf8Q549CVDQxiXLaPQ9r+BVSRAFxbScVTg7VKlMECAT1SoAgWn746Hx
	 V35WXqXKezaqHYOYSrjZlRNAUikqmN5VKzUa1clVDQpGJaelcp6Hoiu6EKWFWAbOni
	 aZtZCYLmnLLyWNyuAP/0EDLTYCnFhwGf6IfxFo2rwC2Hu+yVXxb3AkQI8aUBCvVAZI
	 MF6a8idmqoVdNa68SD3gzhwgZvBB0iWRcjYjjJYqhXYOt/oy0Nvcm+fErtxdMWD8xA
	 VrXKt6UU1U8Mw==
Date: Mon, 11 Nov 2024 23:36:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com, 
	quic_vtanuku@quicinc.com
Subject: Re: [PATCH v2 RESEND 1/3] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <cewuxwkn75cfnopvzidwmwp6rq7wjyewdjmiohx5jsntke5dym@oc5tgzp7km2t>
References: <20241111140244.13474-1-quic_jseerapu@quicinc.com>
 <20241111140244.13474-2-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111140244.13474-2-quic_jseerapu@quicinc.com>

Ping, Vinod :-)

Andi

On Mon, Nov 11, 2024 at 07:32:42PM +0530, Jyothi Kumar Seerapu wrote:
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results
> in receiving N interrupts for N messages, which can introduce
> significant software interrupt latency. To mitigate this latency,
> utilize Block Event Interrupt (BEI) only when an interrupt is necessary.
> When using BEI, consider splitting a single multi-message transfer into
> chunks of 8. This approach can enhance overall transfer time and
> efficiency.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v1 -> v2: 
>    - Changed dma_addr type from array of pointers to array.
>    - To support BEI functionality with the TRE size of 64 defined in GPI driver,
>      updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 8.
>  
>  drivers/dma/qcom/gpi.c           | 49 ++++++++++++++++++++++++++++++++
>  include/linux/dma/qcom-gpi-dma.h | 37 ++++++++++++++++++++++++
>  2 files changed, 86 insertions(+)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 52a7c8f2498f..a98de3178764 100644
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
> @@ -2098,6 +2101,52 @@ static int gpi_find_avail_gpii(struct gpi_dev *gpi_dev, u32 seid)
>  	return -EIO;
>  }
>  
> +/**
> + * gpi_multi_desc_process() - Process received transfers from GSI HW
> + * @dev: pointer to the corresponding dev node
> + * @multi_xfer: pointer to the gpi_multi_xfer
> + * @num_xfers: total number of transfers
> + * @transfer_timeout_msecs: transfer timeout value
> + * @transfer_comp: completion object of the transfer
> + *
> + * This function is used to process the received transfers based on the
> + * completion events
> + *
> + * Return: On success returns 0, otherwise return error code
> + */
> +int gpi_multi_desc_process(struct device *dev, struct gpi_multi_xfer *multi_xfer,
> +			   u32 num_xfers, u32 transfer_timeout_msecs,
> +			   struct completion *transfer_comp)
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
> +	 * of 64 and for the last transfer. If the hardware is fast and
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
> +EXPORT_SYMBOL_GPL(gpi_multi_desc_process);
> +
>  /* gpi_of_dma_xlate: open client requested channel */
>  static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
>  					 struct of_dma *of_dma)
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 6680dd1a43c6..1341ff0db808 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h
> @@ -15,6 +15,12 @@ enum spi_transfer_cmd {
>  	SPI_DUPLEX,
>  };
>  
> +#define QCOM_GPI_BLOCK_EVENT_IRQ	BIT(0)
> +
> +#define QCOM_GPI_MAX_NUM_MSGS		16
> +#define NUM_MSGS_PER_IRQ		8
> +#define MIN_NUM_OF_MSGS_MULTI_DESC	4
> +
>  /**
>   * struct gpi_spi_config - spi config for peripheral
>   *
> @@ -51,6 +57,29 @@ enum i2c_op {
>  	I2C_READ,
>  };
>  
> +/**
> + * struct gpi_multi_xfer - Used for multi transfer support
> + *
> + * @msg_idx_cnt: message index for the transfer
> + * @buf_idx: dma buffer index
> + * @unmap_msg_cnt: unampped transfer index
> + * @freed_msg_cnt: freed transfer index
> + * @irq_cnt: received interrupt count
> + * @irq_msg_cnt: transfer message count for the received irqs
> + * @dma_buf: virtual address of the buffer
> + * @dma_addr: dma address of the buffer
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
> +
>  /**
>   * struct gpi_i2c_config - i2c config for peripheral
>   *
> @@ -65,6 +94,8 @@ enum i2c_op {
>   * @rx_len: receive length for buffer
>   * @op: i2c cmd
>   * @muli-msg: is part of multi i2c r-w msgs
> + * @flags: true for block event interrupt support
> + * @multi_xfer: indicates transfer has multi messages
>   */
>  struct gpi_i2c_config {
>  	u8 set_config;
> @@ -78,6 +109,12 @@ struct gpi_i2c_config {
>  	u32 rx_len;
>  	enum i2c_op op;
>  	bool multi_msg;
> +	u8 flags;
> +	struct gpi_multi_xfer multi_xfer;
>  };
>  
> +int gpi_multi_desc_process(struct device *dev, struct gpi_multi_xfer *multi_xfer,
> +			   u32 num_xfers, u32 tranfer_timeout_msecs,
> +			   struct completion *transfer_comp);
> +
>  #endif /* QCOM_GPI_DMA_H */
> -- 
> 2.17.1
> 

