Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B66441E0F
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 17:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232645AbhKAQYT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 12:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbhKAQYS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 12:24:18 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8ED2C061764
        for <linux-i2c@vger.kernel.org>; Mon,  1 Nov 2021 09:21:44 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id o10-20020a9d718a000000b00554a0fe7ba0so20159923otj.11
        for <linux-i2c@vger.kernel.org>; Mon, 01 Nov 2021 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oUPjP6D0sfRPoLF5d5ZTd6oPCL4eoFnxuF4yHDLSakM=;
        b=fu9n1rZ61r9cWhvVlgZiNwGVUwIqUOKH4yWpWdNIgMclnQpIS+QCQxeG7TGClmcUsP
         zHuMw1T0M+2zc9CyrL1rduCeufuQc8jsE9zk3LR6YpmSMYM9YHD9hOkbNVOk0ufNxtHd
         zB5JErcqSf03/JXKdQ3Q44Q78iN9gUG5zDzdIBlnLFLU94IszdZhnCbCtV3TrY6fPGxM
         cfUck/fYIi9uM2yCutCwpX4r1grKer2TAp+nb2sQ1pPr215+KMoqBbcWLZt/fi4pqMmm
         N0zfDHfo+KDvbtM11qnZONQFAz8OjJQAC/N0yNJcPZDf/Szp9Z5D32zlBviJAR1NuiMm
         jC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oUPjP6D0sfRPoLF5d5ZTd6oPCL4eoFnxuF4yHDLSakM=;
        b=z7aJWzQlWa2wRNa8RDfli+/CwXIs+omeyjecugsuJYE1hFsRZJWZyXsVQYj4rkLHmO
         WDEjQ0OpEKt3uyYlX+/97MBiFHw2JG/RStoccHa/ukUdCuAN77Rd6hk9N+2SJ89Nr1/6
         U4qa9rySw8jpoVCl6XvKeLU5aEewqpeSHuG/qdgBBsj/smiHrPM9rhyJuhiVv5l+0uk0
         wyQtIRC+wouWjvRb4vPhsDcZpTz5Mpb43e6hXbd5Q99oszsNtuexXyJWK+77a/Q/x3YL
         R+9E8iQmEGzOjd56YQtvL3Ye3i6r3TbW87FL2ryGGcbkVDXi0/N0jXCNj2uLiievszUI
         CY+A==
X-Gm-Message-State: AOAM532tTKxhE8qKgvsxhLXPh8Tzy4jHghNZl3b1l3iLGbeKqkd0SEzq
        TaJPHWQlOsKPeJ5/WwRjisKLXfiv9CIWHTLB
X-Google-Smtp-Source: ABdhPJzXe7uS4UarwlTKLbPX1tdJbvkzwNG3Za845JfZ0ojY/rfDR0e2KTyfjnHfD/Gmy921YyrpWQ==
X-Received: by 2002:a05:6830:1299:: with SMTP id z25mr6999208otp.175.1635783703986;
        Mon, 01 Nov 2021 09:21:43 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w12sm4058852oop.19.2021.11.01.09.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 09:21:43 -0700 (PDT)
Date:   Mon, 1 Nov 2021 09:23:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: qcom-geni: Add support for GPI DMA
Message-ID: <YYAUfy2ary7ZJfK+@ripper>
References: <20211019060158.1482722-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019060158.1482722-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon 18 Oct 23:01 PDT 2021, Vinod Koul wrote:

> This adds capability to use GSI DMA for I2C transfers

How about expanding this a little bit? Mention that the driver already
support using the serial engine's own DMA mode and that the patch
extends this to use the wrapper's GSI DMA controller - and what benefit
that brings.

Don't assume that readers of this commit message has read the message in
the wrapper, GPI driver or SPI patches.

> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes since v3:
>  - remove separate tx and rx function for gsi dma and make a common one
>  - remove global structs and use local variables instead
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 6d635a7c104c..b783d85559f5 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -3,7 +3,9 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/clk.h>
> +#include <linux/dmaengine.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/dma/qcom-gpi-dma.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> @@ -48,6 +50,8 @@
>  #define LOW_COUNTER_SHFT	10
>  #define CYCLE_COUNTER_MSK	GENMASK(9, 0)
>  
> +#define I2C_PACK_EN		(BIT(0) | BIT(1))

How about I2C_PACK_TX and I2C_PACK_RX to document the two bits? Also
this seems to be better placed in qcom-gpi-dma.h, next to struct
qpi_i2c_config.

> +
>  enum geni_i2c_err_code {
>  	GP_IRQ0,
>  	NACK,
> @@ -72,6 +76,11 @@ enum geni_i2c_err_code {
>  #define XFER_TIMEOUT		HZ
>  #define RST_TIMEOUT		HZ
>  
> +enum i2c_se_mode {
> +	I2C_FIFO_SE_DMA,
> +	I2C_GPI_DMA,

These names are rather generic and if they only denote fifo/se-dma vs
gpi, perhaps a "bool gpi_mode" would be cleaner?

> +};
> +
>  struct geni_i2c_dev {
>  	struct geni_se se;
>  	u32 tx_wm;
> @@ -89,6 +98,10 @@ struct geni_i2c_dev {
>  	void *dma_buf;
>  	size_t xfer_len;
>  	dma_addr_t dma_addr;
> +	struct dma_chan *tx_c;
> +	struct dma_chan *rx_c;
> +	bool cfg_sent;

This is only used in gpi mode, so it would be nice to clarify this by
naming it "gpi_cfg_sent".

> +	enum i2c_se_mode se_mode;
>  };
>  
>  struct geni_i2c_err_log {
> @@ -456,6 +469,171 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	return gi2c->err;
>  }
>  
> +static void i2c_gsi_cb_result(void *cb, const struct dmaengine_result *result)
> +{
> +	struct geni_i2c_dev *gi2c = cb;
> +
> +	if (result->result != DMA_TRANS_NOERROR) {
> +		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
> +		return;
> +	}
> +
> +	if (result->residue)
> +		dev_dbg(gi2c->se.dev, "DMA xfer has pending: %d\n", result->residue);
> +
> +	complete(&gi2c->done);
> +}
> +
> +static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> +			       void *tx_buf, dma_addr_t tx_addr,
> +			       void *rx_buf, dma_addr_t rx_addr)
> +{
> +	if (tx_buf) {
> +		dma_unmap_single(gi2c->se.dev->parent, tx_addr, msg->len, DMA_TO_DEVICE);
> +		i2c_put_dma_safe_msg_buf(tx_buf, msg, false);
> +	}
> +
> +	if (rx_buf) {
> +		dma_unmap_single(gi2c->se.dev->parent, rx_addr, msg->len, DMA_FROM_DEVICE);
> +		i2c_put_dma_safe_msg_buf(rx_buf, msg, false);
> +	}
> +}
> +
> +static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> +			   struct dma_slave_config *config, dma_addr_t *dma_addr_p,
> +			   void **buf, unsigned int op, struct dma_chan *dma_chan)
> +{
> +	struct gpi_i2c_config *peripheral;
> +	unsigned int flags;
> +	void *dma_buf = &buf;
> +	dma_addr_t addr;
> +	enum dma_data_direction map_dirn;
> +	enum dma_transfer_direction dma_dirn;
> +	struct dma_async_tx_descriptor *desc;
> +	int ret;
> +
> +	peripheral = config->peripheral_config;
> +
> +	dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
> +	if (!dma_buf)
> +		return -ENOMEM;
> +
> +	if (op == I2C_WRITE)
> +		map_dirn = DMA_TO_DEVICE;
> +	else
> +		map_dirn = DMA_FROM_DEVICE;
> +
> +	addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, map_dirn);
> +	if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
> +		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
> +		return -ENOMEM;
> +	}
> +
> +	peripheral->rx_len = msg->len;

Why is this member named rx_len when it might contain the length of the
tx transaction? Is the name or usage incorrect?

> +	peripheral->op = op;
> +
> +	ret = dmaengine_slave_config(dma_chan, config);
> +	if (ret) {
> +		dev_err(gi2c->se.dev, "dma config error: %d for op:%d\n", ret, op);
> +		goto err_config;
> +	}
> +
> +	peripheral->set_config =  false;
> +	peripheral->multi_msg = true;

I think the split of updates to "peripheral" between geni_i2c_gpi() and
geni_i2c_gsi_xfer() makes the two parts harder to reason about.


Kept in the other function this would simply be "commit the config,
set up the buffers and the dmaengine".

That said, I do recognize the slight duplication that needs to happen
wrt set_config and multi_msg in the case of I2C_READ...


And set_config and multi_msg are u8, so please use 0 and 1.

> +	flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
> +
> +	if (op == I2C_WRITE)
> +		dma_dirn = DMA_MEM_TO_DEV;
> +	else
> +		dma_dirn = DMA_DEV_TO_MEM;
> +
> +	desc = dmaengine_prep_slave_single(dma_chan, addr, msg->len, dma_dirn, flags);
> +	if (!desc) {
> +		dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
> +		ret = -EIO;
> +		goto err_config;
> +	}
> +
> +	desc->callback_result = i2c_gsi_cb_result;
> +	desc->callback_param = gi2c;
> +
> +	dmaengine_submit(desc);
> +	*dma_addr_p = addr;
> +
> +	return 0;
> +
> +err_config:
> +	dma_unmap_single(gi2c->se.dev->parent, addr, msg->len, map_dirn);
> +	i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
> +	return ret;
> +}
> +
> +static int geni_i2c_gsi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], int num)
> +{
> +	struct dma_slave_config config = {};
> +	struct gpi_i2c_config peripheral = {};
> +	int i, ret = 0, timeout, stretch;
> +	dma_addr_t tx_addr, rx_addr;
> +	void *tx_buf = NULL, *rx_buf = NULL;
> +
> +	config.peripheral_config = &peripheral;
> +	config.peripheral_size = sizeof(peripheral);
> +
> +	if (!gi2c->cfg_sent) {

For non-GPI mode we do this for every transaction, but you do it once
per controller. Is this information retained over a power collapse?

Should cfg_sent be reset in the suspend path?

> +		const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
> +
> +		gi2c->cfg_sent = true;
> +		peripheral.pack_enable = I2C_PACK_EN;
> +		peripheral.cycle_count = itr->t_cycle_cnt;
> +		peripheral.high_count = itr->t_high_cnt;
> +		peripheral.low_count = itr->t_low_cnt;
> +		peripheral.clk_div = itr->clk_div;
> +		peripheral.set_config =  true;

set_config is a u8, so perhaps better to just say 1 here?

> +	}
> +	peripheral.multi_msg = false;
> +
> +	for (i = 0; i < num; i++) {
> +		gi2c->cur = &msgs[i];
> +		dev_dbg(gi2c->se.dev, "msg[%d].len:%d\n", i, gi2c->cur->len);
> +
> +		stretch = (i < (num - 1));

No need for the parenthesis here, nor for a local variable.

Given that peripheral.stretch is zero initialized I think it would be
even clearer to just use a explicit if stmt.

> +		peripheral.addr = msgs[i].addr;
> +		peripheral.stretch = stretch;
> +

		if (i < num - 1)
			peripheral.stretch = 1;

> +		if (msgs[i].flags & I2C_M_RD) {
> +			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config, &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
> +			if (ret)
> +				goto err;
> +		}
> +
> +		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config, &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);

I have a feeling that I asked this previously, but I can find the
conversation at this point.

If the client does:

struct i2c_msg msg[2] = {
	{
		.addr = 42,
		.len = 1,
		.buf = &some_register,
	},
	{
		.addr = 42,
		.flags = I2C_M_RD,
		.len = 2,
		.buf = &buf,
	},
};
i2c_transfer(geni, msg, 2);


The first iteration through this loop would copy 1 byte of some_register
into tx_buf and kick off a transaction. Once the reply comes the second
iteration will allocate a 2 byte rx_buf and 2 bytes of tx_buf.

Why do we need a tx_buf and tx transfer of the same length as the
amount of data we intend to read?


If this is some magical requirement of the hardware, I think this
warrants a comment.

> +		if (ret)
> +			goto err;
> +
> +		if (msgs[i].flags & I2C_M_RD)
> +			dma_async_issue_pending(gi2c->rx_c);
> +		dma_async_issue_pending(gi2c->tx_c);
> +
> +		timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);

Why are you waiting for done of each message? Can't you queue up all the
transfer requests and let the DMA engine tell you when they are all
done?

If not, then why is this function "replacing" geni_i2c_xfer() and not
geni_i2c_[rt]x_one_msg()?

> +		if (!timeout) {
> +			dev_err(gi2c->se.dev, "I2C timeout gsi flags:%d addr:0x%x\n",
> +				gi2c->cur->flags, gi2c->cur->addr);
> +			gi2c->err = -ETIMEDOUT;

I think you mean ret = -ETIMEDOUT here?

> +			goto err;
> +		}
> +
> +		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> +	}
> +
> +	return 0;
> +
> +err:
> +	dmaengine_terminate_sync(gi2c->rx_c);
> +	dmaengine_terminate_sync(gi2c->tx_c);
> +	geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> +	return ret;
> +}
> +
>  static int geni_i2c_xfer(struct i2c_adapter *adap,
>  			 struct i2c_msg msgs[],
>  			 int num)
> @@ -475,6 +653,12 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  	}
>  
>  	qcom_geni_i2c_conf(gi2c);
> +
> +	if (gi2c->se_mode == I2C_GPI_DMA) {
> +		ret = geni_i2c_gsi_xfer(gi2c, msgs, num);
> +		goto geni_i2c_txn_ret;

I don't think this is a good use of a goto.

If you need to keep the dma transfers doing one message at a time, then
I think you should move this "override" into the loop and have a
geni_i2c_gpi_one_msg() function.


If it's possible to queue up the entire msgs at once I think you should
break out the loop below to a separate function, so that you can simply
do:

if (gpi_mode)
  ret = do_gpi();
else
  ret = do_fifo();

In this case you could replace the break in the loop below and just
return ret; and end the function with return num instead of the ret == 0
check...

> +	}
> +
>  	for (i = 0; i < num; i++) {
>  		u32 m_param = i < (num - 1) ? STOP_STRETCH : 0;
>  
> @@ -489,6 +673,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  		if (ret)
>  			break;
>  	}
> +geni_i2c_txn_ret:
>  	if (ret == 0)
>  		ret = num;
>  
> @@ -517,11 +702,49 @@ static const struct acpi_device_id geni_i2c_acpi_match[] = {
>  MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
>  #endif
>  
> +static void release_gpi_dma(struct geni_i2c_dev *gi2c)
> +{
> +	if (gi2c->rx_c) {
> +		dma_release_channel(gi2c->rx_c);
> +		gi2c->rx_c = NULL;

What purpose does this assignment have?

> +	}
> +	if (gi2c->tx_c) {
> +		dma_release_channel(gi2c->tx_c);
> +		gi2c->tx_c = NULL;
> +	}
> +}
> +
> +static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
> +{
> +	int ret;
> +
> +	geni_se_select_mode(&gi2c->se, GENI_GPI_DMA);
> +	gi2c->tx_c = dma_request_chan(gi2c->se.dev, "tx");
> +	ret = dev_err_probe(gi2c->se.dev, IS_ERR(gi2c->tx_c), "Failed to get tx DMA ch\n");

Invoking dev_err_probe(, 0, ); will still result in a dev_dbg() so I
don't think you should do this outside a conditional.

> +	if (ret < 0)
> +		goto err_tx;
> +
> +	gi2c->rx_c = dma_request_chan(gi2c->se.dev, "rx");
> +	ret = dev_err_probe(gi2c->se.dev, IS_ERR(gi2c->rx_c), "Failed to get rx DMA ch\n");
> +	if (ret < 0)
> +		goto err_rx;
> +
> +	dev_dbg(gi2c->se.dev, "Grabbed GPI dma channels\n");
> +	return 0;
> +
> +err_rx:
> +	dma_release_channel(gi2c->tx_c);

Is there a reason why there's no devm_dma_request_chan()?

> +	gi2c->tx_c = NULL;

Afaict the only reason for clearing these is so that you can check for
NULL in release_gpi_dma(). Seems this need would go away if you had a
devm helper for dma_request_chan().

That said, release_gpi_dma() is called either:

1) on probe failure, in which case I think you should make sure to
properly handle the IS_ERR() case and not call release_gpi_dma().

2) on release, in which case I think you should either have left probe
with valid pointers or you're not in the GPI case and it would have been
better if you didn't touch the members in gi2c. I.e. use local variables
here.

> +err_tx:
> +	gi2c->rx_c = NULL;
> +	return ret;
> +}
> +
>  static int geni_i2c_probe(struct platform_device *pdev)
>  {
>  	struct geni_i2c_dev *gi2c;
>  	struct resource *res;
> -	u32 proto, tx_depth;
> +	u32 proto, tx_depth, fifo_disable;

Given that you mask before the assignment fifo_disable could be bool
instead.

>  	int ret;
>  	struct device *dev = &pdev->dev;
>  
> @@ -601,27 +824,52 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  	proto = geni_se_read_proto(&gi2c->se);
> -	tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
>  	if (proto != GENI_SE_I2C) {
>  		dev_err(dev, "Invalid proto %d\n", proto);
>  		geni_se_resources_off(&gi2c->se);
>  		return -ENXIO;
>  	}
> -	gi2c->tx_wm = tx_depth - 1;
> -	geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
> -	geni_se_config_packing(&gi2c->se, BITS_PER_BYTE, PACKING_BYTES_PW,
> -							true, true, true);
> +
> +	fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
> +
> +	switch (fifo_disable) {

The use of a switch statement here looks fishy, but the suspicion made
me stare at this long enough to figure out what you're actually doing
(fallback to FIFO_SE_DMA if setup_gpi_dma() fails).

Wouldn't it be cleaner to write this:

if (fifo_disable && !setup_gpio_dma(gi2c)) {
	se_mode = I2C_GPI_DMA;
	...;
} else {
	se_mode = I2C_FIFO_SE_DMA;
	...
}


That said, I don't see that you (or my proposal) account for
EPROBE_DEFER being returned from dma_request_chan()..

> +	case 1:
> +		ret = setup_gpi_dma(gi2c);
> +		if (!ret) { /* success case */
> +			gi2c->se_mode = I2C_GPI_DMA;
> +			geni_se_select_mode(&gi2c->se, GENI_GPI_DMA);

Isn't this done in setup_gpi_dma() as well?

> +			dev_dbg(dev, "Using GPI DMA mode for I2C\n");
> +			break;
> +		}
> +		/*
> +		 * in case of failure to get dma channel, we can till do the
> +		 * FIFO mode, so fallthrough

Can we really do FIFO if FIFO_IF_DISABLE?

> +		 */
> +		dev_warn(dev, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");
> +		fallthrough;
> +
> +	case 0:
> +		gi2c->se_mode = I2C_FIFO_SE_DMA;
> +		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
> +		gi2c->tx_wm = tx_depth - 1;
> +		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
> +		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
> +				       PACKING_BYTES_PW, true, true, true);
> +
> +		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
> +
> +		break;
> +	}
> +
>  	ret = geni_se_resources_off(&gi2c->se);
>  	if (ret) {
>  		dev_err(dev, "Error turning off resources %d\n", ret);
> -		return ret;
> +		goto err_dma;
>  	}
>  
>  	ret = geni_icc_disable(&gi2c->se);
>  	if (ret)
> -		return ret;
> -
> -	dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
> +		goto err_dma;
>  
>  	gi2c->suspended = 1;
>  	pm_runtime_set_suspended(gi2c->se.dev);
> @@ -633,18 +881,23 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	if (ret) {
>  		dev_err(dev, "Error adding i2c adapter %d\n", ret);
>  		pm_runtime_disable(gi2c->se.dev);
> -		return ret;
> +		goto err_dma;
>  	}
>  
>  	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
>  
>  	return 0;
> +
> +err_dma:
> +	release_gpi_dma(gi2c);
> +	return ret;

A devres dma_request_chan() seems like a really nice thing?

Regards,
Bjorn

>  }
>  
>  static int geni_i2c_remove(struct platform_device *pdev)
>  {
>  	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
>  
> +	release_gpi_dma(gi2c);
>  	i2c_del_adapter(&gi2c->adap);
>  	pm_runtime_disable(gi2c->se.dev);
>  	return 0;
> -- 
> 2.31.1
> 
