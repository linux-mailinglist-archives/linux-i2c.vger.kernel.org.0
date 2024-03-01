Return-Path: <linux-i2c+bounces-2103-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E43386E5B7
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 17:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52B381C21F6F
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 16:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B49F3FDB;
	Fri,  1 Mar 2024 16:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJdJE3Fs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA707EB;
	Fri,  1 Mar 2024 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709311026; cv=none; b=kB3UIAdj8YcHIoPgoGNgNYhlXijp/36RVg1pr5xnC9GP8ckUysYOm96L5GJnOMAnj3v/bMpPKNYItepdai2tTvwf1nCg5WV3KxsafmAam+84P1+3wkUfaRhkCPwqh47AkT7DrRseFItP3HLED4PJeQL0WosiWbFwBR/l0sSMlEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709311026; c=relaxed/simple;
	bh=YlB/1TADMHsJkjzqG5nG4eUPWUlBvjkZYPN5z1m3rC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CR3GoF7U8OTF5RmoYQBBc/pVUEHfTVBFRHxpHWPXXw4Ohhzo1xLCDaC5Alu1z6CNmeQQVFBACbuHQ0QH41d3BvUeoESNAbKkebeDqz/M3vaOqT0Va4+8CRbaQ25AnlfTKcCGrXTQjVOyZ7GMZNG1+WwMCrYugh54igoa98TvVM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJdJE3Fs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59273C433C7;
	Fri,  1 Mar 2024 16:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709311025;
	bh=YlB/1TADMHsJkjzqG5nG4eUPWUlBvjkZYPN5z1m3rC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJdJE3FseOxlaXwcnkmnhcxFhYSmXhh3a4PKkO0x3svQq4ubILuvj6lT9XNQVeXat
	 VfZdNrvvODRXe/Gq3TlWfZNfQCfmfvqEUB1L9u/Lqo67A8qjpmlX3X0VbIBF+RfQ/I
	 46DgffTbwm0qmHQjcVXemrqCeQSQXW6jVTypnoapScbGbe3Quo3KmV3mXl05T37qO2
	 CEYNewTbKVFa0/EOR1Aky+W/pijx0UybedgaHR3+XEL9fBRY0cJC0Vaw0ZGCKd17LA
	 D7scz4dYJZVwlk6n25sR5jsc9xjhor/XE009h4LQnn7pP2HbxEFd4Wi6uBTVvLgwdi
	 A5QKhSRMtZH4A==
Date: Fri, 1 Mar 2024 10:37:02 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, bjorn.andersson@linaro.org, vkoul@kernel.org, 
	andi.shyti@kernel.org, wsa@kernel.org, linux-arm-msm@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	quic_vdadhani@quicinc.com
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <fuggv2kghhxijcljavzsus5uagjiknj5mrzwmqbxbhkyov5t75@smpxbhpdz7cv>
References: <20240301112638.990045-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301112638.990045-1-quic_msavaliy@quicinc.com>

On Fri, Mar 01, 2024 at 04:56:38PM +0530, Mukesh Kumar Savaliya wrote:
> we are seeing protocol errors like NACK as transfer failure but
> ideally it should report exact error like NACK, BUS_PROTO or ARB_LOST.
> 
> Hence we are adding such error support in GSI mode and reporting it
> accordingly by adding respective error logs.
> 
> geni_i2c_gpi_xfer() needed to allocate heap based memory instead of
> stack memory to handle and store the geni_i2c_dev handle.
> 
> Copy event status from GSI driver to the i2c device status and parse
> error when callback comes from gsi driver to the i2c driver. In the
> gpi.c, we need to store callback param into i2c config data structure
> so that inside the i2c driver, we can check what exactly the error is
> and parse it accordingly.
> 
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  drivers/dma/qcom/gpi.c             | 12 +++++++-
>  drivers/i2c/busses/i2c-qcom-geni.c | 46 +++++++++++++++++++-----------
>  include/linux/dma/qcom-gpi-dma.h   |  4 +++
>  3 files changed, 44 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 1c93864e0e4d..6d718916fba4 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1076,7 +1076,17 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
>  	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
>  
>  	dma_cookie_complete(&vd->tx);
> -	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
> +	if (gchan->protocol == QCOM_GPI_I2C) {
> +		struct dmaengine_desc_callback cb;
> +		struct gpi_i2c_config *i2c;
> +
> +		dmaengine_desc_get_callback(&vd->tx, &cb);
> +		i2c = cb.callback_param;
> +		i2c->status = compl_event->status;

What would the DMA maintainer say about extending struct
dmaengine_tx_result with some protocol-specific status field?

> +		dmaengine_desc_callback_invoke(&cb, &result);
> +	} else {
> +		dmaengine_desc_get_callback_invoke(&vd->tx, &result);
> +	}
>  
>  gpi_free_desc:
>  	spin_lock_irqsave(&gchan->vc.lock, flags);
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index da94df466e83..5092d10e8f47 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -484,9 +484,16 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  
>  static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
>  {
> -	struct geni_i2c_dev *gi2c = cb;
> -
> -	if (result->result != DMA_TRANS_NOERROR) {
> +	struct gpi_i2c_config *i2c = cb;
> +	struct geni_i2c_dev *gi2c = i2c->gi2c;
> +
> +	if (i2c->status & (BIT(NACK) << 5)) {

Wouldn't it be cleaner to:

status = FIELD_GET(SOME_MASK, i2c->status);
if (status == BIT(NACK)) {
...

Or can multiple of these be set? Still would like to see you extract the
field instead of having the shift in every single conditional.

> +		geni_i2c_err(gi2c, NACK);
> +	} else if (i2c->status & (BIT(BUS_PROTO) << 5)) {
> +		geni_i2c_err(gi2c, BUS_PROTO);
> +	} else if (i2c->status & (BIT(ARB_LOST) << 5)) {
> +		geni_i2c_err(gi2c, ARB_LOST);
> +	} else if (result->result != DMA_TRANS_NOERROR) {
>  		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
>  		gi2c->err = -EIO;
>  	} else if (result->residue) {
> @@ -568,7 +575,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	}
>  
>  	desc->callback_result = i2c_gpi_cb_result;
> -	desc->callback_param = gi2c;
> +	desc->callback_param = peripheral;
>  
>  	dmaengine_submit(desc);
>  	*buf = dma_buf;
> @@ -585,33 +592,38 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], int num)
>  {
>  	struct dma_slave_config config = {};
> -	struct gpi_i2c_config peripheral = {};
> +	struct gpi_i2c_config *peripheral;
>  	int i, ret = 0, timeout;
>  	dma_addr_t tx_addr, rx_addr;
>  	void *tx_buf = NULL, *rx_buf = NULL;
>  	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>  
> -	config.peripheral_config = &peripheral;
> -	config.peripheral_size = sizeof(peripheral);
> +	peripheral = devm_kzalloc(gi2c->se.dev, sizeof(*peripheral), GFP_KERNEL);

This will be allocated for every transfer, and only freed when you
remove the geni bus driver, i.e. this is in practice a memory leak.


But do you really need to move this to the heap? If I understand the DMA
api, the callback will not be invoked after you exit this function, so
it should be fine to have it on the stack.

> +	if (!peripheral)
> +		return -ENOMEM;
> +
> +	config.peripheral_config = peripheral;
> +	config.peripheral_size = sizeof(struct gpi_i2c_config);
>  
> -	peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
> -	peripheral.cycle_count = itr->t_cycle_cnt;
> -	peripheral.high_count = itr->t_high_cnt;
> -	peripheral.low_count = itr->t_low_cnt;
> -	peripheral.clk_div = itr->clk_div;
> -	peripheral.set_config = 1;
> -	peripheral.multi_msg = false;
> +	peripheral->gi2c = gi2c;
> +	peripheral->pack_enable = I2C_PACK_TX | I2C_PACK_RX;
> +	peripheral->cycle_count = itr->t_cycle_cnt;
> +	peripheral->high_count = itr->t_high_cnt;
> +	peripheral->low_count = itr->t_low_cnt;
> +	peripheral->clk_div = itr->clk_div;
> +	peripheral->set_config = 1;
> +	peripheral->multi_msg = false;
>  
>  	for (i = 0; i < num; i++) {
>  		gi2c->cur = &msgs[i];
>  		gi2c->err = 0;
>  		dev_dbg(gi2c->se.dev, "msg[%d].len:%d\n", i, gi2c->cur->len);
>  
> -		peripheral.stretch = 0;
> +		peripheral->stretch = 0;
>  		if (i < num - 1)
> -			peripheral.stretch = 1;
> +			peripheral->stretch = 1;
>  
> -		peripheral.addr = msgs[i].addr;
> +		peripheral->addr = msgs[i].addr;
>  
>  		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>  				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 6680dd1a43c6..af264f769344 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h
> @@ -64,6 +64,8 @@ enum i2c_op {
>   * @set_config: set peripheral config
>   * @rx_len: receive length for buffer
>   * @op: i2c cmd
> + * @status: stores gpi event status based on interrupt
> + * @gi2c: pointer to i2c device handle

The order doesn't match the struct below.

>   * @muli-msg: is part of multi i2c r-w msgs
>   */
>  struct gpi_i2c_config {
> @@ -78,6 +80,8 @@ struct gpi_i2c_config {
>  	u32 rx_len;
>  	enum i2c_op op;
>  	bool multi_msg;
> +	u32 status;
> +	struct geni_i2c_dev *gi2c;

These two entries doesn't have anything to do with the "gpi i2c config",
just as the remainder of the properties has nothing to do with the "dma
callback".

Please split them off into their own structure.

Regards,
Bjorn

>  };
>  
>  #endif /* QCOM_GPI_DMA_H */
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
> 

