Return-Path: <linux-i2c+bounces-7430-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A6C9A0D9E
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 17:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9313028159B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 15:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4598920E011;
	Wed, 16 Oct 2024 15:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgZRHaya"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8911EB27;
	Wed, 16 Oct 2024 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729091170; cv=none; b=KCRw94iJT79O1rO+Dhv0wLzod8jWo/wicAm/StE9Sjvzg/CjRbcGdpbhohhsqFlzQBc9Qbl+O1xblN21F16hfdhyGkk3AKE8m3wFj2zGA6/Vl+4c3SAfEGhBsM/dMCtdK9y0Cc01ewTXi4XUOkxfxTieFASF+LfnvxefMsfnqTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729091170; c=relaxed/simple;
	bh=EXkQTy+esDkHCy1HoIdQHjQpp+JpP3wE0dYye/s4/Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwMOwuFubzr5DGsPu15DpuliUgmACWwHTiWHTk2V3233x4/Gul126yTqVimGXZdnCuG4vtCD7gIJoDcshhBrJXuG2M6vcbTqaUHvNl354ZTbyYawv/fe6ONKDVWoDy7SMDgcYv0VcFJhSvRaD0Yx5b9YIv8Fia7tv7ZYkLCcXWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgZRHaya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BE4C4CEC5;
	Wed, 16 Oct 2024 15:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729091169;
	bh=EXkQTy+esDkHCy1HoIdQHjQpp+JpP3wE0dYye/s4/Yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgZRHayaM+JGLjWE2uwLdCnxLb0IuXMIcOv0PxCYNb9zcxlce5A7OsX3LfYIJDvqn
	 WpnjbBu19txBaOA7MlWwCn3uG6MBIN2uquksFcQXJzpGA83AmObrUxAKjok8nYfUh5
	 c0YHbG5h2R+dyNzdmkoFUSSP8M9jvDE6MdJzJAWzGSOJWVLcsJjjBoje9vcKN7mDeM
	 Z0y1gG03/NjWiSmsu7/Mrck0ESs4Vzs70hX9E09n8hegY2Y1gsNtItSS9kef2+bICB
	 HfPafuM/2TWUZfjuuKT+iUr6IDVsfwyXGAJDVw6vFk2oUBENBDu40getSvQRJ7wRo0
	 78/yYvzAgH7hw==
Date: Wed, 16 Oct 2024 17:06:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v1 5/5] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-6-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015120750.21217-6-quic_jseerapu@quicinc.com>

Hi Jyothi,

...

> @@ -523,26 +576,49 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	enum dma_transfer_direction dma_dirn;
>  	struct dma_async_tx_descriptor *desc;
>  	int ret;
> +	struct gpi_multi_xfer *gi2c_gpi_xfer;
> +	dma_cookie_t cookie;
>  
>  	peripheral = config->peripheral_config;
> -
> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
> -	if (!dma_buf)
> +	gi2c_gpi_xfer = &peripheral->multi_xfer;
> +	gi2c_gpi_xfer->msg_idx_cnt = cur_msg_idx;
> +	dma_buf = gi2c_gpi_xfer->dma_buf[gi2c_gpi_xfer->buf_idx];
> +	addr = gi2c_gpi_xfer->dma_addr[gi2c_gpi_xfer->buf_idx];
> +
> +	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[gi2c_gpi_xfer->msg_idx_cnt], 1);
> +	if (!dma_buf) {
> +		gi2c->err = -ENOMEM;
>  		return -ENOMEM;
> +	}
>  
>  	if (op == I2C_WRITE)
>  		map_dirn = DMA_TO_DEVICE;
>  	else
>  		map_dirn = DMA_FROM_DEVICE;
>  
> -	addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, map_dirn);
> +	addr = dma_map_single(gi2c->se.dev->parent,
> +			      dma_buf, msgs[gi2c_gpi_xfer->msg_idx_cnt].len,

You could save msgs[gi2c_gpi_xfer->msg_idx_cnt] in a separate
variable to avoid this extra indexing.

> +			      map_dirn);
>  	if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
> -		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
> +		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[gi2c_gpi_xfer->msg_idx_cnt],
> +					 false);
> +		gi2c->err = -ENOMEM;
>  		return -ENOMEM;
>  	}
>  
> +	if (gi2c->is_tx_multi_xfer) {
> +		if (((gi2c_gpi_xfer->msg_idx_cnt + 1) % NUM_MSGS_PER_IRQ))
> +			peripheral->flags |= QCOM_GPI_BLOCK_EVENT_IRQ;
> +		else
> +			peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
> +
> +		/* BEI bit to be cleared for last TRE */
> +		if (gi2c_gpi_xfer->msg_idx_cnt == gi2c->num_msgs - 1)
> +			peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
> +	}
> +
>  	/* set the length as message for rx txn */
> -	peripheral->rx_len = msg->len;
> +	peripheral->rx_len = msgs[gi2c_gpi_xfer->msg_idx_cnt].len;
>  	peripheral->op = op;
>  
>  	ret = dmaengine_slave_config(dma_chan, config);
> @@ -560,25 +636,56 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	else
>  		dma_dirn = DMA_DEV_TO_MEM;
>  
> -	desc = dmaengine_prep_slave_single(dma_chan, addr, msg->len, dma_dirn, flags);
> +	desc = dmaengine_prep_slave_single(dma_chan, addr,
> +					   msgs[gi2c_gpi_xfer->msg_idx_cnt].len,
> +					   dma_dirn, flags);
>  	if (!desc) {
>  		dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
> -		ret = -EIO;
> +		gi2c->err = -EIO;
>  		goto err_config;
>  	}
>  
>  	desc->callback_result = i2c_gpi_cb_result;
>  	desc->callback_param = gi2c;
>  
> -	dmaengine_submit(desc);
> -	*buf = dma_buf;
> -	*dma_addr_p = addr;
> +	if (!((msgs[cur_msg_idx].flags & I2C_M_RD) && op == I2C_WRITE)) {
> +		gi2c_gpi_xfer->msg_idx_cnt++;
> +		gi2c_gpi_xfer->buf_idx = (cur_msg_idx + 1) % QCOM_GPI_MAX_NUM_MSGS;
> +	}
> +	cookie = dmaengine_submit(desc);
> +	if (dma_submit_error(cookie)) {
> +		dev_err(gi2c->se.dev,
> +			"%s: dmaengine_submit failed (%d)\n", __func__, cookie);
> +		return -EINVAL;

goto err_config?

> +	}
>  
> +	if (gi2c->is_tx_multi_xfer) {
> +		dma_async_issue_pending(gi2c->tx_c);
> +		if ((cur_msg_idx == (gi2c->num_msgs - 1)) ||
> +		    (gi2c_gpi_xfer->msg_idx_cnt >=
> +		     QCOM_GPI_MAX_NUM_MSGS + gi2c_gpi_xfer->freed_msg_cnt)) {
> +			ret = gpi_multi_desc_process(gi2c->se.dev, gi2c_gpi_xfer,
> +						     gi2c->num_msgs, XFER_TIMEOUT,
> +						     &gi2c->done);
> +			if (ret) {
> +				dev_dbg(gi2c->se.dev,
> +					"I2C multi write msg transfer timeout: %d\n",
> +					ret);

if you are returning an error, then print an error.

> +				gi2c->err = -ETIMEDOUT;

gi2c->err = ret?

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
> +			 msgs[cur_msg_idx].len, map_dirn);
> +	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[cur_msg_idx], false);
>  	return ret;

I would have one more label here:

   out:
	gi2c->err = ret;

	return ret;

in order to avoid always assigning twice

>  }
>  
> @@ -590,6 +697,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  	unsigned long time_left;
>  	dma_addr_t tx_addr, rx_addr;
>  	void *tx_buf = NULL, *rx_buf = NULL;
> +	struct gpi_multi_xfer *tx_multi_xfer;
>  	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>  
>  	config.peripheral_config = &peripheral;
> @@ -603,6 +711,39 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  	peripheral.set_config = 1;
>  	peripheral.multi_msg = false;
>  
> +	gi2c->gpi_config = &peripheral;
> +	gi2c->num_msgs = num;
> +	gi2c->is_tx_multi_xfer = false;
> +	gi2c->tx_irq_cnt = 0;
> +
> +	tx_multi_xfer = &peripheral.multi_xfer;
> +	tx_multi_xfer->msg_idx_cnt = 0;
> +	tx_multi_xfer->buf_idx = 0;
> +	tx_multi_xfer->unmap_msg_cnt = 0;
> +	tx_multi_xfer->freed_msg_cnt = 0;
> +	tx_multi_xfer->irq_msg_cnt = 0;
> +	tx_multi_xfer->irq_cnt = 0;

you can initialize tx_multi_xfer to "{ };" to avoid all these
" = 0"

> +
> +	/*
> +	 * If number of write messages are four and higher then
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
> @@ -613,14 +754,16 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  			peripheral.stretch = 1;
>  
>  		peripheral.addr = msgs[i].addr;
> +		if (i > 0 && (!(msgs[i].flags & I2C_M_RD)))
> +			peripheral.multi_msg = false;
>  
> -		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> +		ret =  geni_i2c_gpi(gi2c, msgs, i, &config,

what is the point of passing 'i' if you always refer to msgs[i]
in geni_i2c_gpi()?

>  				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
>  		if (ret)
>  			goto err;
>  
>  		if (msgs[i].flags & I2C_M_RD) {
> -			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> +			ret =  geni_i2c_gpi(gi2c, msgs, i, &config,
>  					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
>  			if (ret)
>  				goto err;
> @@ -628,18 +771,28 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
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
> +		} else {
> +			if (gi2c->tx_irq_cnt != tx_multi_xfer->irq_cnt) {

   else if (...) {
   	...
   }

Andi

