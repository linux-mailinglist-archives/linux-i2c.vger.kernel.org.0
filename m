Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34D2C2F1C21
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 18:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389211AbhAKRUG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 12:20:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389185AbhAKRUF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jan 2021 12:20:05 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568E2C0617A2
        for <linux-i2c@vger.kernel.org>; Mon, 11 Jan 2021 09:19:25 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id j12so376321ota.7
        for <linux-i2c@vger.kernel.org>; Mon, 11 Jan 2021 09:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kEkrJHdIgszAme3/6bC88Q6gVdEc3j7OhEwsn2AZosc=;
        b=CAVT7faNyrFdwaP+9HQkCHkY2mMLvePqcULBtwLGa3sqzhzlm42A7FMcAZ/sXJZmd1
         QrBdVFcLJPw3+QPRJZEmhj0bFwvtSFLAn5c6kqnBdh/iE/3f9QueFq0PokGQcMF8KEdK
         0JwVkj7jREa18qxF5Sa//JUJIpVCTQ4BsS34YRREgi1s4D7eqFO/6ip0PbBW1B+KMvTA
         QmaaLukVM/Sz/ebidy2WX29dcncGcS8TtsreRFOLC5WcimAJlfI/s8E+aqxPor1Fa0Wo
         87IY+vZHzPRWwivvayq0gb74bxbhewH5cA758gZE1vT+V+P9FT710pVkbL11vO0xdb+t
         Xpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kEkrJHdIgszAme3/6bC88Q6gVdEc3j7OhEwsn2AZosc=;
        b=CCB+KDjaZkE8rfNMcksd7r/ko6SkkySXYEw7VwAfOcDK5nHKiW3V1xMl9wDqTRFSCI
         vzimebFeiMywpHF5ZBtBZJZPuuEUCkv/XVBiKYQ297EJbkzere5oSec1uocNZEfwZO85
         iwMDS7pt58h0Fu2FBhLQ213Qi+uoeI0spSejg+6AEFPV8bzphwqd220QuhARHHNzwAat
         TxIHy3JLhpkjlINA+o/6FiMpr+1CYNNejUEzo6L+1ivS3memzMYrELJW5p4mVMX7qTiO
         tnx1XaR0sqA9ppVwrqTF02oXFUw9kKi6YvkFIHW0gzKiO6SneTribdjpcwikJGfl2/rV
         iWfw==
X-Gm-Message-State: AOAM530MUcSNADEwwdpSqkEm/2Avlxan/9LagyRrBfiG03mccdoVh9dL
        4A7TS8E4K8vFCqJNhyfMlVwssQ==
X-Google-Smtp-Source: ABdhPJwJfRNF0QxGdYbA4e/asd9M4IvShtdrWyOH/05V1wj3piOZpKPy9PaTBIbNcvfgrPveVU4qFA==
X-Received: by 2002:a9d:46b:: with SMTP id 98mr147438otc.200.1610385564352;
        Mon, 11 Jan 2021 09:19:24 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u85sm67590oif.57.2021.01.11.09.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 09:19:23 -0800 (PST)
Date:   Mon, 11 Jan 2021 11:19:21 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] spi: spi-geni-qcom: Add support for GPI dma
Message-ID: <X/yImclFEZkwkspU@builder.lan>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-5-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111151651.1616813-5-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon 11 Jan 09:16 CST 2021, Vinod Koul wrote:

> We can use GPI DMA for devices where it is enabled by firmware. Add
> support for this mode
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/spi/spi-geni-qcom.c | 395 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 384 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 512e925d5ea4..5bb0e2192734 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -2,6 +2,8 @@
>  // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
>  
>  #include <linux/clk.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/log2.h>
> @@ -10,6 +12,7 @@
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/qcom-geni-se.h>
> +#include <linux/dma/qcom-gpi-dma.h>
>  #include <linux/spi/spi.h>
>  #include <linux/spinlock.h>
>  
> @@ -63,6 +66,35 @@
>  #define TIMESTAMP_AFTER		BIT(3)
>  #define POST_CMD_DELAY		BIT(4)
>  
> +#define GSI_LOOPBACK_EN		(BIT(0))
> +#define GSI_CS_TOGGLE		(BIT(3))
> +#define GSI_CPHA		(BIT(4))
> +#define GSI_CPOL		(BIT(5))
> +
> +#define MAX_TX_SG		(3)
> +#define NUM_SPI_XFER		(8)
> +#define SPI_XFER_TIMEOUT_MS	(250)
> +
> +struct gsi_desc_cb {
> +	struct spi_geni_master *mas;
> +	struct spi_transfer *xfer;
> +};
> +
> +struct spi_geni_gsi {
> +	dma_cookie_t tx_cookie;
> +	dma_cookie_t rx_cookie;
> +	struct dma_async_tx_descriptor *tx_desc;
> +	struct dma_async_tx_descriptor *rx_desc;
> +	struct gsi_desc_cb desc_cb;
> +};
> +
> +enum spi_m_cmd_opcode {
> +	CMD_NONE,
> +	CMD_XFER,
> +	CMD_CS,
> +	CMD_CANCEL,
> +};
> +
>  struct spi_geni_master {
>  	struct geni_se se;
>  	struct device *dev;
> @@ -79,10 +111,21 @@ struct spi_geni_master {
>  	struct completion cs_done;
>  	struct completion cancel_done;
>  	struct completion abort_done;
> +	struct completion xfer_done;
>  	unsigned int oversampling;
>  	spinlock_t lock;
>  	int irq;
>  	bool cs_flag;
> +	struct spi_geni_gsi *gsi;
> +	struct dma_chan *tx;
> +	struct dma_chan *rx;
> +	struct completion tx_cb;
> +	struct completion rx_cb;
> +	bool qn_err;
> +	int cur_xfer_mode;
> +	int num_tx_eot;
> +	int num_rx_eot;
> +	int num_xfers;
>  };
>  
>  static int get_spi_clk_cfg(unsigned int speed_hz,
> @@ -274,31 +317,269 @@ static int setup_fifo_params(struct spi_device *spi_slv,
>  	return geni_spi_set_clock_and_bw(mas, spi_slv->max_speed_hz);
>  }
>  
> +static int get_xfer_mode(struct spi_master *spi)
> +{
> +	struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +	struct geni_se *se = &mas->se;
> +	int mode = GENI_SE_FIFO;

No need to initialize mode, it's overwritten in all code paths.

> +	int fifo_disable;
> +	bool dma_chan_valid;
> +
> +	fifo_disable = readl(se->base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
> +	dma_chan_valid = !(IS_ERR_OR_NULL(mas->tx) || IS_ERR_OR_NULL(mas->rx));
> +
> +	/*
> +	 * If FIFO Interface is disabled and there are no DMA channels then we
> +	 * can't do this transfer.
> +	 * If FIFO interface is disabled, we can do GSI only,
> +	 * else pick FIFO mode.
> +	 */
> +	if (fifo_disable && !dma_chan_valid) {
> +		dev_err(mas->dev, "Fifo and dma mode disabled!! can't xfer\n");
> +		mode = -EINVAL;
> +	} else if (fifo_disable) {
> +		mode = GENI_GPI_DMA;
> +	} else {
> +		mode = GENI_SE_FIFO;
> +	}
> +
> +	return mode;

Maybe make this tail:

	if (!dma_chan_valid && fifo_disable)
		return -EINVAL;

	return fifo_disable ? GENI_GPI_DMA : GENI_SE_FIFO;

At least to me that's more obvious.

> +}
> +
> +static void
> +spi_gsi_callback_result(void *cb, const struct dmaengine_result *result, bool tx)
> +{
> +	struct gsi_desc_cb *gsi = cb;
> +
> +	if (result->result != DMA_TRANS_NOERROR) {
> +		dev_err(gsi->mas->dev, "%s: DMA %s txn failed\n", __func__, tx ? "tx" : "rx");

"GSI DMA %s failed\n" is just as unique, without the need for __func__.

> +		return;
> +	}
> +
> +	if (!result->residue) {
> +		dev_dbg(gsi->mas->dev, "%s\n", __func__);

You have @tx, so how about including that to make the debug print
slightly more useful?

> +		if (tx)
> +			complete(&gsi->mas->tx_cb);
> +		else
> +			complete(&gsi->mas->rx_cb);
> +	} else {
> +		dev_err(gsi->mas->dev, "DMA xfer has pending: %d\n", result->residue);
> +	}
> +}
> +
> +static void
> +spi_gsi_rx_callback_result(void *cb, const struct dmaengine_result *result)
> +{
> +	spi_gsi_callback_result(cb, result, false);
> +}
> +
> +static void
> +spi_gsi_tx_callback_result(void *cb, const struct dmaengine_result *result)
> +{
> +	spi_gsi_callback_result(cb, result, true);
> +}
> +
> +static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_master *mas,
> +			  struct spi_device *spi_slv, struct spi_master *spi)
> +{
> +	int ret = 0;
> +	unsigned long flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
> +	struct spi_geni_gsi *gsi;
> +	struct dma_slave_config config;
> +	struct gpi_spi_config peripheral;
> +
> +	memset(&config, 0, sizeof(config));

Assign {} during the declaration and you don't need to start with a
memset.

> +	memset(&peripheral, 0, sizeof(peripheral));
> +	config.peripheral_config = &peripheral;
> +	config.peripheral_size = sizeof(peripheral);
> +
> +	if (xfer->bits_per_word != mas->cur_bits_per_word ||
> +	    xfer->speed_hz != mas->cur_speed_hz) {
> +		mas->cur_bits_per_word = xfer->bits_per_word;
> +		mas->cur_speed_hz = xfer->speed_hz;
> +		peripheral.set_config = true;
> +	}
> +
> +	if (!(mas->cur_bits_per_word % MIN_WORD_LEN)) {
> +		peripheral.rx_len = ((xfer->len << 3) / mas->cur_bits_per_word);
> +	} else {
> +		int bytes_per_word = (mas->cur_bits_per_word / BITS_PER_BYTE) + 1;
> +
> +		peripheral.rx_len = (xfer->len / bytes_per_word);
> +	}
> +
> +	if (xfer->tx_buf && xfer->rx_buf) {
> +		peripheral.cmd = SPI_DUPLEX;
> +	} else if (xfer->tx_buf) {
> +		peripheral.cmd = SPI_TX;
> +		peripheral.rx_len = 0;
> +	} else if (xfer->rx_buf) {
> +		peripheral.cmd = SPI_RX;
> +	}
> +
> +	peripheral.cs = spi_slv->chip_select;
> +
> +	if (spi_slv->mode & SPI_LOOP)
> +		peripheral.loopback_en = true;
> +	if (spi_slv->mode & SPI_CPOL)
> +		peripheral.clock_pol_high = true;
> +	if (spi_slv->mode & SPI_CPHA)
> +		peripheral.data_pol_high = true;
> +	peripheral.pack_en = true;
> +	peripheral.word_len = xfer->bits_per_word - MIN_WORD_LEN;
> +	ret = get_spi_clk_cfg(mas->cur_speed_hz, mas,
> +			      &peripheral.clk_src, &peripheral.clk_div);
> +	if (ret) {
> +		dev_err(mas->dev, "%s:Err setting clks:%d\n", __func__, ret);

Please avoid the __func__.

> +		return ret;
> +	}
> +
> +	if (!xfer->cs_change) {
> +		if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
> +			peripheral.fragmentation = FRAGMENTATION;
> +	}
> +
> +	gsi = &mas->gsi[mas->num_xfers];
> +	gsi->desc_cb.mas = mas;
> +	gsi->desc_cb.xfer = xfer;
> +	if (peripheral.cmd & SPI_RX) {
> +		dmaengine_slave_config(mas->rx, &config);
> +		gsi->rx_desc = dmaengine_prep_slave_single(mas->rx, xfer->rx_dma,
> +							   xfer->len, DMA_DEV_TO_MEM, flags);
> +		if (IS_ERR_OR_NULL(gsi->rx_desc)) {

Is this API really returning IS_ERR() or NULL on failure?

Looking at the GPI driver it seems to exclusively return NULL on failure
(for things that in most other subsystems would be -EINVAL).

> +			dev_err(mas->dev, "Err setting up rx desc\n");
> +			return -EIO;
> +		}
> +		gsi->rx_desc->callback_result = spi_gsi_rx_callback_result;
> +		gsi->rx_desc->callback_param = &gsi->desc_cb;
> +		mas->num_rx_eot++;
> +	}
> +
> +	if (peripheral.cmd & SPI_TX_ONLY)
> +		mas->num_tx_eot++;
> +
> +	dmaengine_slave_config(mas->tx, &config);
> +	gsi->tx_desc = dmaengine_prep_slave_single(mas->tx, xfer->tx_dma,
> +						   xfer->len, DMA_MEM_TO_DEV, flags);
> +
> +	if (IS_ERR_OR_NULL(gsi->tx_desc)) {

Is there anything that will clean up rx_desc when this happens?

> +		dev_err(mas->dev, "Err setting up tx desc\n");
> +		return -EIO;
> +	}
> +	gsi->tx_desc->callback_result = spi_gsi_tx_callback_result;
> +	gsi->tx_desc->callback_param = &gsi->desc_cb;
> +	if (peripheral.cmd & SPI_RX)
> +		gsi->rx_cookie = dmaengine_submit(gsi->rx_desc);
> +	gsi->tx_cookie = dmaengine_submit(gsi->tx_desc);
> +	if (peripheral.cmd & SPI_RX)
> +		dma_async_issue_pending(mas->rx);
> +	dma_async_issue_pending(mas->tx);
> +	mas->num_xfers++;
> +	return ret;

ret can only be 0 here.

> +}
> +
> +static int spi_geni_map_buf(struct spi_geni_master *mas, struct spi_message *msg)
> +{
> +	struct spi_transfer *xfer;
> +	struct device *gsi_dev = mas->dev->parent;
> +
> +	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
> +		if (xfer->rx_buf) {
> +			xfer->rx_dma = dma_map_single(gsi_dev, xfer->rx_buf,
> +						      xfer->len, DMA_FROM_DEVICE);
> +			if (dma_mapping_error(mas->dev, xfer->rx_dma)) {
> +				dev_err(mas->dev, "Err mapping buf\n");

You need to unmap rx_dma/tx_dma for all previous entries in
&msg->transfers.

> +				return -ENOMEM;
> +			}
> +		}
> +
> +		if (xfer->tx_buf) {
> +			xfer->tx_dma = dma_map_single(gsi_dev, (void *)xfer->tx_buf,
> +						      xfer->len, DMA_TO_DEVICE);
> +			if (dma_mapping_error(gsi_dev, xfer->tx_dma)) {
> +				dev_err(mas->dev, "Err mapping buf\n");
> +				dma_unmap_single(gsi_dev, xfer->rx_dma, xfer->len, DMA_FROM_DEVICE);

This should only be done if xfer->rx_buf != NULL, right?

> +				return -ENOMEM;
> +			}
> +		}
> +	};
> +
> +	return 0;
> +}
> +
> +static void spi_geni_unmap_buf(struct spi_geni_master *mas, struct spi_message *msg)
> +{
> +	struct spi_transfer *xfer;
> +	struct device *gsi_dev = mas->dev;
> +
> +	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
> +		if (xfer->rx_buf)
> +			dma_unmap_single(gsi_dev, xfer->rx_dma, xfer->len, DMA_FROM_DEVICE);
> +		if (xfer->tx_buf)
> +			dma_unmap_single(gsi_dev, xfer->tx_dma, xfer->len, DMA_TO_DEVICE);
> +	};
> +}
> +
>  static int spi_geni_prepare_message(struct spi_master *spi,
>  					struct spi_message *spi_msg)
>  {
>  	int ret;
>  	struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +	struct geni_se *se = &mas->se;
> +
> +	mas->cur_xfer_mode = get_xfer_mode(spi);
> +
> +	if (mas->cur_xfer_mode == GENI_SE_FIFO) {
> +		geni_se_select_mode(se, GENI_SE_FIFO);
> +		reinit_completion(&mas->xfer_done);
> +		ret = setup_fifo_params(spi_msg->spi, spi);
> +		if (ret)
> +			dev_err(mas->dev, "Couldn't select mode %d\n", ret);

Afaict all error paths of setup_fifo_params() will have printed an error
message when we get here.

So

	switch (mas->cur_xfer_mode) {
	case GENI_SE_FIFO:
		...
		return setup_fifo_params();
	case GENI_GPI_DMA:
		...
		return spi_geni_map_buf();
	}

	return -EINVAL;

Seems cleaner to me.

> +
> +	} else if (mas->cur_xfer_mode == GENI_GPI_DMA) {
> +		mas->num_tx_eot = 0;
> +		mas->num_rx_eot = 0;
> +		mas->num_xfers = 0;
> +		reinit_completion(&mas->tx_cb);
> +		reinit_completion(&mas->rx_cb);
> +		memset(mas->gsi, 0, (sizeof(struct spi_geni_gsi) * NUM_SPI_XFER));
> +		geni_se_select_mode(se, GENI_GPI_DMA);
> +		ret = spi_geni_map_buf(mas, spi_msg);
> +
> +	} else {
> +		dev_err(mas->dev, "%s: Couldn't select mode %d", __func__, mas->cur_xfer_mode);
> +		ret = -EINVAL;
> +	}
>  
> -	ret = setup_fifo_params(spi_msg->spi, spi);
> -	if (ret)
> -		dev_err(mas->dev, "Couldn't select mode %d\n", ret);
>  	return ret;
>  }
>  
> +static int spi_geni_unprepare_message(struct spi_master *spi_mas, struct spi_message *spi_msg)
> +{
> +	struct spi_geni_master *mas = spi_master_get_devdata(spi_mas);
> +
> +	mas->cur_speed_hz = 0;
> +	mas->cur_bits_per_word = 0;
> +	if (mas->cur_xfer_mode == GENI_GPI_DMA)
> +		spi_geni_unmap_buf(mas, spi_msg);
> +	return 0;
> +}
> +
>  static int spi_geni_init(struct spi_geni_master *mas)
>  {
>  	struct geni_se *se = &mas->se;
>  	unsigned int proto, major, minor, ver;
>  	u32 spi_tx_cfg;
> +	size_t gsi_sz;
> +	int ret = 0;
>  
>  	pm_runtime_get_sync(mas->dev);
>  
>  	proto = geni_se_read_proto(se);
>  	if (proto != GENI_SE_SPI) {
>  		dev_err(mas->dev, "Invalid proto %d\n", proto);
> -		pm_runtime_put(mas->dev);
> -		return -ENXIO;
> +		ret = -ENXIO;
> +		goto out_pm;
>  	}
>  	mas->tx_fifo_depth = geni_se_get_tx_fifo_depth(se);
>  
> @@ -328,8 +609,34 @@ static int spi_geni_init(struct spi_geni_master *mas)
>  	spi_tx_cfg &= ~CS_TOGGLE;
>  	writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
>  
> +	mas->tx = dma_request_slave_channel(mas->dev, "tx");
> +	if (IS_ERR_OR_NULL(mas->tx)) {
> +		dev_err(mas->dev, "Failed to get tx DMA ch %ld", PTR_ERR(mas->tx));

I first wrote a rant about breaking backwards compatibility, but then at
last realized that this hunk doesn't actually modify "ret", so all this
error handling - and error printing - might still result in a successful
exit.

I also don't think it's accurate to have all errors treated the same
way, e.g. EPROBE_DEFER shouldn't be treated the same way as "no dma
property specified".

> +		ret = PTR_ERR(mas->tx);
> +		goto out_pm;
> +	} else {
> +		mas->rx = dma_request_slave_channel(mas->dev, "rx");
> +		if (IS_ERR_OR_NULL(mas->rx)) {
> +			dev_err(mas->dev, "Failed to get rx DMA ch %ld", PTR_ERR(mas->rx));
> +			dma_release_channel(mas->tx);
> +			ret = PTR_ERR(mas->rx);

Per the use of IS_ERR_OR_NULL() ret might become 0 here.

> +			goto out_pm;
> +		}
> +
> +		gsi_sz = sizeof(struct spi_geni_gsi) * NUM_SPI_XFER;
> +		mas->gsi = devm_kzalloc(mas->dev, gsi_sz, GFP_KERNEL);
> +		if (IS_ERR_OR_NULL(mas->gsi)) {

We got both rx and tx, but then this allocation failed, is that reason
for returning success without dma operational? (I'm not sure what the
right thing to do).

But checking for allocation failure isn't done with IS_ERR().

> +			dma_release_channel(mas->tx);

If you spin this hunk off into its own function then you can use the
idiomatic goto cleanup scheme and not have to repeat yourself here.

> +			dma_release_channel(mas->rx);
> +			mas->tx = NULL;
> +			mas->rx = NULL;
> +			goto out_pm;
> +		}
> +	}
> +
> +out_pm:
>  	pm_runtime_put(mas->dev);
> -	return 0;
> +	return ret;
>  }
>  
>  static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
> @@ -420,6 +727,7 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
>  {
>  	u32 m_cmd = 0;
>  	u32 len;
> +	u32 m_param = 0;
>  	struct geni_se *se = &mas->se;
>  	int ret;
>  
> @@ -457,6 +765,11 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
>  		len = xfer->len / (mas->cur_bits_per_word / BITS_PER_BYTE + 1);
>  	len &= TRANS_LEN_MSK;
>  
> +	if (!xfer->cs_change) {
> +		if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
> +			m_param |= FRAGMENTATION;
> +	}
> +
>  	mas->cur_xfer = xfer;
>  	if (xfer->tx_buf) {
>  		m_cmd |= SPI_TX_ONLY;
> @@ -475,7 +788,7 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
>  	 * interrupt could come in at any time now.
>  	 */
>  	spin_lock_irq(&mas->lock);
> -	geni_se_setup_m_cmd(se, m_cmd, FRAGMENTATION);
> +	geni_se_setup_m_cmd(se, m_cmd, m_param);
>  
>  	/*
>  	 * TX_WATERMARK_REG should be set after SPI configuration and
> @@ -494,13 +807,52 @@ static int spi_geni_transfer_one(struct spi_master *spi,
>  				struct spi_transfer *xfer)
>  {
>  	struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +	unsigned long timeout, jiffies;
> +	int ret = 0i, i;

0i? Is that a sign of you using vim?

>  
>  	/* Terminate and return success for 0 byte length transfer */
>  	if (!xfer->len)
> -		return 0;
> +		return ret;
> +
> +	if (mas->cur_xfer_mode == GENI_SE_FIFO) {
> +		setup_fifo_xfer(xfer, mas, slv->mode, spi);
> +	} else {
> +		setup_gsi_xfer(xfer, mas, slv, spi);
> +		if (mas->num_xfers >= NUM_SPI_XFER ||
> +		    (list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))) {
> +			for (i = 0 ; i < mas->num_tx_eot; i++) {
> +				jiffies = msecs_to_jiffies(SPI_XFER_TIMEOUT_MS);
> +				timeout = wait_for_completion_timeout(&mas->tx_cb, jiffies);
> +				if (timeout <= 0) {
> +					dev_err(mas->dev, "Tx[%d] timeout%lu\n", i, timeout);
> +					ret = -ETIMEDOUT;
> +					goto err_gsi_geni_transfer_one;
> +				}
> +				spi_finalize_current_transfer(spi);
> +			}
> +			for (i = 0 ; i < mas->num_rx_eot; i++) {
> +				jiffies = msecs_to_jiffies(SPI_XFER_TIMEOUT_MS);
> +				timeout = wait_for_completion_timeout(&mas->tx_cb, jiffies);
> +				if (timeout <= 0) {
> +					dev_err(mas->dev, "Rx[%d] timeout%lu\n", i, timeout);
> +					ret = -ETIMEDOUT;
> +					goto err_gsi_geni_transfer_one;
> +				}
> +				spi_finalize_current_transfer(spi);
> +			}
> +			if (mas->qn_err) {
> +				ret = -EIO;
> +				mas->qn_err = false;
> +				goto err_gsi_geni_transfer_one;
> +			}
> +		}
> +	}
>  
> -	setup_fifo_xfer(xfer, mas, slv->mode, spi);
> -	return 1;
> +	return ret;

All assignments to "ret" are followed by a goto
err_gsi_geni_transfer_one, so the only time you actually get here is
with ret has been untouched...in which case it's now 0, rather than the
1 it was previously.

> +
> +err_gsi_geni_transfer_one:
> +	dmaengine_terminate_all(mas->tx);
> +	return ret;
>  }
>  
>  static irqreturn_t geni_spi_isr(int irq, void *data)
> @@ -595,6 +947,15 @@ static int spi_geni_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>  
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> +	if (ret) {
> +		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +		if (ret) {
> +			dev_err(&pdev->dev, "could not set DMA mask\n");
> +			return ret;
> +		}
> +	}
> +
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> @@ -632,15 +993,18 @@ static int spi_geni_probe(struct platform_device *pdev)
>  	spi->num_chipselect = 4;
>  	spi->max_speed_hz = 50000000;
>  	spi->prepare_message = spi_geni_prepare_message;
> +	spi->unprepare_message = spi_geni_unprepare_message;
>  	spi->transfer_one = spi_geni_transfer_one;
>  	spi->auto_runtime_pm = true;
>  	spi->handle_err = handle_fifo_timeout;
> -	spi->set_cs = spi_geni_set_cs;
>  	spi->use_gpio_descriptors = true;
>  
>  	init_completion(&mas->cs_done);
>  	init_completion(&mas->cancel_done);
>  	init_completion(&mas->abort_done);
> +	init_completion(&mas->xfer_done);
> +	init_completion(&mas->tx_cb);
> +	init_completion(&mas->rx_cb);
>  	spin_lock_init(&mas->lock);
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);
> @@ -661,6 +1025,15 @@ static int spi_geni_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto spi_geni_probe_runtime_disable;
>  
> +	/*
> +	 * query the mode supported and set_cs for fifo mode only
> +	 * for dma (gsi) mode, the gsi will set cs based on params passed in
> +	 * TRE
> +	 */

Is there no SE_DMA mode for SPI? (I know it's not implemented right now)
If we get there this would be cur_xfer_mode != GENI_GPI_DMA?

Regards,
Bjorn

> +	mas->cur_xfer_mode = get_xfer_mode(spi);
> +	if (mas->cur_xfer_mode == GENI_SE_FIFO)
> +		spi->set_cs = spi_geni_set_cs;
> +
>  	ret = request_irq(mas->irq, geni_spi_isr, 0, dev_name(dev), spi);
>  	if (ret)
>  		goto spi_geni_probe_runtime_disable;
> -- 
> 2.26.2
> 
