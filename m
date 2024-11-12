Return-Path: <linux-i2c+bounces-7938-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD19C4DC4
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 05:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BF0BB22525
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 04:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493A0208239;
	Tue, 12 Nov 2024 04:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0w0p1JH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F9341C79;
	Tue, 12 Nov 2024 04:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731386035; cv=none; b=OSS5KYSZ3AKZEO2FS5dzsgcGMfw9MyoNZsP2zQemRuivLkULDprXQbjRUPmToQjq5VhxJI2jEhFAuTgU9IlITryTxSMezYiv7Og884wselQ7BzGN4Vh6sQhxDukrtGExNWZhFWkxzRNiH6fxUjxaMuzKU7T9DEqjFSiFYPqdgDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731386035; c=relaxed/simple;
	bh=1wSD+O/xu2pWXbq3lZLLIALSc/7bm3caBy1zV8NgrLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uH2EX4eBBJj5K9edXnDr2oMQEyLYE6cX0lCDWe2bpwvRIFfujXUUqmnV+Aonpf7Ze6qWduf2+W0yWxKeBGLb0kWI0gA+SdfMbCl5+PSAkfZMWjXjuyAurEv3Iu+F0GV1tgeEefwAi/k2zYpO8uBT0TohdWPGMUdwCO5UzH9rowQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0w0p1JH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F366C4CECD;
	Tue, 12 Nov 2024 04:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731386034;
	bh=1wSD+O/xu2pWXbq3lZLLIALSc/7bm3caBy1zV8NgrLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0w0p1JH1YdusCRBXaAc/VRVwp0F9Ustkoh79Rgzem6zwYsdyflIc06wLl5aq4yyb
	 F6HCoVVXa9kyIhhT7NB8MuJSdXX2oRSKFHrYgv8eu5fKbk24uaIaMNZn93BmFsNCMl
	 qcdYma65hrsjvCvtNg+pkH6S47zvEpbblF1Nli/RN9VhgzWpVQ9BdL8QbXfVJsCybk
	 BEby/kkaGi4Q5KG1a+TcNKZVLLbN/H2IzyaCC0x9TeLq7t9Pw4Z5EIH1E10hTwR3WE
	 zpFAaAFrPb5VFWEaD3m7hrUe6nNS7yPm0VCz81Wd+n/aMP84+9SdHEkansEkGfD4v3
	 SbGlPKPV0b3tQ==
Date: Mon, 11 Nov 2024 22:33:51 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v2 RESEND 3/3] i2c: i2c-qcom-geni: Add Block event
 interrupt support
Message-ID: <54iirnbdmcvbg2zpkajuwqjdb6mxlehpvtnq2hmxd4beuh4ish@mbuttdzzvebv>
References: <20241111140244.13474-1-quic_jseerapu@quicinc.com>
 <20241111140244.13474-4-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111140244.13474-4-quic_jseerapu@quicinc.com>

On Mon, Nov 11, 2024 at 07:32:44PM +0530, Jyothi Kumar Seerapu wrote:
> The I2C driver gets an interrupt upon transfer completion.
> For multiple messages in a single transfer, N interrupts will be
> received for N messages, leading to significant software interrupt
> latency. To mitigate this latency, utilize Block Event Interrupt (BEI)

Please rewrite this to the tone that the reader doesn't know what Block
Event Interrupt is, or that it exists.

> only when an interrupt is necessary. This means large transfers can be
> split into multiple chunks of 8 messages internally, without expecting
> interrupts for the first 7 message completions, only the last one will
> trigger an interrupt indicating 8 messages completed.
> 
> By implementing BEI, multi-message transfers can be divided into
> chunks of 8 messages, improving overall transfer time.

You already wrote this in the paragraph above.


Where is this number 8 coming from btw?

> This optimization reduces transfer time from 168 ms to 48 ms for a
> series of 200 I2C write messages in a single transfer, with a
> clock frequency support of 100 kHz.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v1 -> v2:
>    - Moved gi2c_gpi_xfer->msg_idx_cnt to separate local variable.
>    - Updated goto labels for error scenarios in geni_i2c_gpi function
>    - memset tx_multi_xfer to 0.
>    - Removed passing current msg index to geni_i2c_gpi.
>    - Fixed kernel test robot reported compilation issues.    
> 
>  drivers/i2c/busses/i2c-qcom-geni.c | 203 +++++++++++++++++++++++++----
>  1 file changed, 178 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 7a22e1f46e60..04a7d926dadc 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -100,6 +100,10 @@ struct geni_i2c_dev {
>  	struct dma_chan *rx_c;
>  	bool gpi_mode;
>  	bool abort_done;
> +	bool is_tx_multi_xfer;
> +	u32 num_msgs;
> +	u32 tx_irq_cnt;
> +	struct gpi_i2c_config *gpi_config;
>  };
>  
>  struct geni_i2c_desc {
> @@ -500,6 +504,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
>  {
>  	struct geni_i2c_dev *gi2c = cb;
> +	struct gpi_multi_xfer *tx_multi_xfer;
>  
>  	if (result->result != DMA_TRANS_NOERROR) {
>  		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
> @@ -508,7 +513,21 @@ static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
>  		dev_dbg(gi2c->se.dev, "DMA xfer has pending: %d\n", result->residue);
>  	}
>  
> -	complete(&gi2c->done);
> +	if (gi2c->is_tx_multi_xfer) {

Wouldn't it be cleaner to treat the !is_tx_multi_xfer case as a
multi-xfer of length 1?

> +		tx_multi_xfer = &gi2c->gpi_config->multi_xfer;
> +
> +		/*
> +		 * Send Completion for last message or multiple of NUM_MSGS_PER_IRQ.
> +		 */
> +		if ((tx_multi_xfer->irq_msg_cnt == gi2c->num_msgs - 1) ||
> +		    (!((tx_multi_xfer->irq_msg_cnt + 1) % NUM_MSGS_PER_IRQ))) {
> +			tx_multi_xfer->irq_cnt++;
> +			complete(&gi2c->done);

Why? You're removing the wait_for_completion_timeout() from
geni_i2c_gpi_xfer() when is_tx_multi_xfer is set.

> +		}
> +		tx_multi_xfer->irq_msg_cnt++;
> +	} else {
> +		complete(&gi2c->done);
> +	}
>  }
>  
>  static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> @@ -526,7 +545,42 @@ static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	}
>  }
>  
> -static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> +/**
> + * gpi_i2c_multi_desc_unmap() - unmaps the buffers post multi message TX transfers
> + * @dev: pointer to the corresponding dev node
> + * @gi2c: i2c dev handle
> + * @msgs: i2c messages array
> + * @peripheral: pointer to the gpi_i2c_config
> + */
> +static void gpi_i2c_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
> +				     struct gpi_i2c_config *peripheral)
> +{
> +	u32 msg_xfer_cnt, wr_idx = 0;
> +	struct gpi_multi_xfer *tx_multi_xfer = &peripheral->multi_xfer;
> +
> +	/*
> +	 * In error case, need to unmap all messages based on the msg_idx_cnt.
> +	 * Non-error case unmap all the processed messages.

What is the benefit of this optimization, compared to keeping things
simple and just unmap all buffers at the end of geni_i2c_gpi_xfer()?

> +	 */
> +	if (gi2c->err)
> +		msg_xfer_cnt = tx_multi_xfer->msg_idx_cnt;
> +	else
> +		msg_xfer_cnt = tx_multi_xfer->irq_cnt * NUM_MSGS_PER_IRQ;
> +
> +	/* Unmap the processed DMA buffers based on the received interrupt count */
> +	for (; tx_multi_xfer->unmap_msg_cnt < msg_xfer_cnt; tx_multi_xfer->unmap_msg_cnt++) {
> +		if (tx_multi_xfer->unmap_msg_cnt == gi2c->num_msgs)
> +			break;
> +		wr_idx = tx_multi_xfer->unmap_msg_cnt % QCOM_GPI_MAX_NUM_MSGS;
> +		geni_i2c_gpi_unmap(gi2c, &msgs[tx_multi_xfer->unmap_msg_cnt],
> +				   tx_multi_xfer->dma_buf[wr_idx],
> +				   tx_multi_xfer->dma_addr[wr_idx],
> +				   NULL, (dma_addr_t)NULL);
> +		tx_multi_xfer->freed_msg_cnt++;
> +	}
> +}
> +
> +static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>  			struct dma_slave_config *config, dma_addr_t *dma_addr_p,
>  			void **buf, unsigned int op, struct dma_chan *dma_chan)
>  {
> @@ -538,26 +592,48 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	enum dma_transfer_direction dma_dirn;
>  	struct dma_async_tx_descriptor *desc;
>  	int ret;
> +	struct gpi_multi_xfer *gi2c_gpi_xfer;
> +	dma_cookie_t cookie;
> +	u32 msg_idx;
>  
>  	peripheral = config->peripheral_config;
> -
> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
> -	if (!dma_buf)
> -		return -ENOMEM;
> +	gi2c_gpi_xfer = &peripheral->multi_xfer;
> +	dma_buf = gi2c_gpi_xfer->dma_buf[gi2c_gpi_xfer->buf_idx];
> +	addr = gi2c_gpi_xfer->dma_addr[gi2c_gpi_xfer->buf_idx];
> +	msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
> +
> +	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
> +	if (!dma_buf) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
>  
>  	if (op == I2C_WRITE)
>  		map_dirn = DMA_TO_DEVICE;
>  	else
>  		map_dirn = DMA_FROM_DEVICE;
>  
> -	addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, map_dirn);
> +	addr = dma_map_single(gi2c->se.dev->parent, dma_buf,
> +			      msgs[msg_idx].len, map_dirn);
>  	if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
> -		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
> -		return -ENOMEM;
> +		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	if (gi2c->is_tx_multi_xfer) {
> +		if (((msg_idx + 1) % NUM_MSGS_PER_IRQ))
> +			peripheral->flags |= QCOM_GPI_BLOCK_EVENT_IRQ;
> +		else
> +			peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
> +
> +		/* BEI bit to be cleared for last TRE */
> +		if (msg_idx == gi2c->num_msgs - 1)
> +			peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
>  	}
>  
>  	/* set the length as message for rx txn */
> -	peripheral->rx_len = msg->len;
> +	peripheral->rx_len = msgs[msg_idx].len;
>  	peripheral->op = op;
>  
>  	ret = dmaengine_slave_config(dma_chan, config);
> @@ -575,7 +651,8 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	else
>  		dma_dirn = DMA_DEV_TO_MEM;
>  
> -	desc = dmaengine_prep_slave_single(dma_chan, addr, msg->len, dma_dirn, flags);
> +	desc = dmaengine_prep_slave_single(dma_chan, addr, msgs[msg_idx].len,
> +					   dma_dirn, flags);
>  	if (!desc) {
>  		dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
>  		ret = -EIO;
> @@ -585,15 +662,48 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	desc->callback_result = i2c_gpi_cb_result;
>  	desc->callback_param = gi2c;
>  
> -	dmaengine_submit(desc);
> -	*buf = dma_buf;
> -	*dma_addr_p = addr;
> +	if (!((msgs[msg_idx].flags & I2C_M_RD) && op == I2C_WRITE)) {
> +		gi2c_gpi_xfer->msg_idx_cnt++;
> +		gi2c_gpi_xfer->buf_idx = (msg_idx + 1) % QCOM_GPI_MAX_NUM_MSGS;
> +	}
> +	cookie = dmaengine_submit(desc);
> +	if (dma_submit_error(cookie)) {
> +		dev_err(gi2c->se.dev,
> +			"%s: dmaengine_submit failed (%d)\n", __func__, cookie);
> +		ret = -EINVAL;
> +		goto err_config;
> +	}
>  
> +	if (gi2c->is_tx_multi_xfer) {
> +		dma_async_issue_pending(gi2c->tx_c);
> +		if ((msg_idx == (gi2c->num_msgs - 1)) ||
> +		    (gi2c_gpi_xfer->msg_idx_cnt >=
> +		     QCOM_GPI_MAX_NUM_MSGS + gi2c_gpi_xfer->freed_msg_cnt)) {
> +			ret = gpi_multi_desc_process(gi2c->se.dev, gi2c_gpi_xfer,

A function call straight into the GPI driver? I'm not entirely familiar
with the details of the dmaengine API, but this doesn't look correct.

> +						     gi2c->num_msgs, XFER_TIMEOUT,
> +						     &gi2c->done);
> +			if (ret) {
> +				dev_err(gi2c->se.dev,
> +					"I2C multi write msg transfer timeout: %d\n",
> +					ret);
> +				gi2c->err = ret;
> +				goto err_config;
> +			}
> +		}
> +	} else {
> +		/* Non multi descriptor message transfer */
> +		*buf = dma_buf;
> +		*dma_addr_p = addr;
> +	}
>  	return 0;
>  
>  err_config:
> -	dma_unmap_single(gi2c->se.dev->parent, addr, msg->len, map_dirn);
> -	i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
> +	dma_unmap_single(gi2c->se.dev->parent, addr,
> +			 msgs[msg_idx].len, map_dirn);
> +	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
> +
> +out:
> +	gi2c->err = ret;
>  	return ret;
>  }
>  
> @@ -605,6 +715,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  	unsigned long time_left;
>  	dma_addr_t tx_addr, rx_addr;
>  	void *tx_buf = NULL, *rx_buf = NULL;
> +	struct gpi_multi_xfer *tx_multi_xfer;
>  	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>  
>  	config.peripheral_config = &peripheral;
> @@ -618,6 +729,34 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  	peripheral.set_config = 1;
>  	peripheral.multi_msg = false;
>  
> +	gi2c->gpi_config = &peripheral;
> +	gi2c->num_msgs = num;
> +	gi2c->is_tx_multi_xfer = false;
> +	gi2c->tx_irq_cnt = 0;
> +
> +	tx_multi_xfer = &peripheral.multi_xfer;
> +	memset(tx_multi_xfer, 0, sizeof(struct gpi_multi_xfer));
> +
> +	/*
> +	 * If number of write messages are four and higher then

Why four?

> +	 * configure hardware for multi descriptor transfers with BEI.
> +	 */
> +	if (num >= MIN_NUM_OF_MSGS_MULTI_DESC) {
> +		gi2c->is_tx_multi_xfer = true;
> +		for (i = 0; i < num; i++) {
> +			if (msgs[i].flags & I2C_M_RD) {
> +				/*
> +				 * Multi descriptor transfer with BEI
> +				 * support is enabled for write transfers.
> +				 * Add BEI optimization support for read
> +				 * transfers later.

Prefix this comment with "TODO:"

> +				 */
> +				gi2c->is_tx_multi_xfer = false;
> +				break;
> +			}
> +		}
> +	}
> +
>  	for (i = 0; i < num; i++) {
>  		gi2c->cur = &msgs[i];
>  		gi2c->err = 0;
> @@ -628,14 +767,16 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  			peripheral.stretch = 1;
>  
>  		peripheral.addr = msgs[i].addr;
> +		if (i > 0 && (!(msgs[i].flags & I2C_M_RD)))
> +			peripheral.multi_msg = false;
>  
> -		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> +		ret =  geni_i2c_gpi(gi2c, msgs, &config,
>  				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
>  		if (ret)
>  			goto err;
>  
>  		if (msgs[i].flags & I2C_M_RD) {
> -			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> +			ret =  geni_i2c_gpi(gi2c, msgs, &config,
>  					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
>  			if (ret)
>  				goto err;
> @@ -643,18 +784,26 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  			dma_async_issue_pending(gi2c->rx_c);
>  		}
>  
> -		dma_async_issue_pending(gi2c->tx_c);
> -
> -		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> -		if (!time_left)
> -			gi2c->err = -ETIMEDOUT;
> +		if (!gi2c->is_tx_multi_xfer) {
> +			dma_async_issue_pending(gi2c->tx_c);
> +			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);

By making this conditional on !is_tx_multi_xfer transfers, what makes
the loop wait for the transfer to complete before you below unmap the
buffers?

> +			if (!time_left) {
> +				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
> +				gi2c->err = -ETIMEDOUT;
> +			}
> +		}
>  
>  		if (gi2c->err) {
>  			ret = gi2c->err;
>  			goto err;
>  		}
>  
> -		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> +		if (!gi2c->is_tx_multi_xfer) {
> +			geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> +		} else if (gi2c->tx_irq_cnt != tx_multi_xfer->irq_cnt) {
> +			gi2c->tx_irq_cnt = tx_multi_xfer->irq_cnt;
> +			gpi_i2c_multi_desc_unmap(gi2c, msgs, &peripheral);
> +		}
>  	}
>  
>  	return num;
> @@ -663,7 +812,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  	dev_err(gi2c->se.dev, "GPI transfer failed: %d\n", ret);
>  	dmaengine_terminate_sync(gi2c->rx_c);
>  	dmaengine_terminate_sync(gi2c->tx_c);
> -	geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> +	if (gi2c->is_tx_multi_xfer)
> +		gpi_i2c_multi_desc_unmap(gi2c, msgs, &peripheral);
> +	else
> +		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> +

As above, it would be nice if multi-xfer was just a special case with a
single buffer; rather than inflating the cyclomatic complexity.

Regards,
Bjorn

>  	return ret;
>  }
>  
> -- 
> 2.17.1
> 
> 

