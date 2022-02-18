Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3D94BC014
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 20:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236246AbiBRTFu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 14:05:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236183AbiBRTFt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 14:05:49 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EBC42EC8
        for <linux-i2c@vger.kernel.org>; Fri, 18 Feb 2022 11:05:31 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id u17-20020a056830231100b005ad13358af9so2568362ote.11
        for <linux-i2c@vger.kernel.org>; Fri, 18 Feb 2022 11:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fZAxYypDZb6ACUYFc7t5naencpzIL4taF+H04a8iHWs=;
        b=fjBAphNmsxEkABJxW52lV3SYkg1Iaz/oGVeV30gYaJ14inM8Q6Jy5QTBZWcvgBud27
         HoNP5acv7K/+BeabFgx7fz7fsO7djA6LLTcxL0xuPjlRgwdLjRuMV2YLS11wg7cbe+Za
         Qi6HsYsgdIKx1a80Ik5e0LShEpPcNEJmTWjXkHetcLtvGQ/BpEvxUMUd8uQutC8HvDfV
         1ewcYSbVzoSb7wym3w2LLvbEEGqQ0k/0NgT2F+vCpfq4xnllKc065lY+c9CH+CGF9ae4
         UWg9Rrzc/gERyUbAQGlZygmW9MrPSL/qqCOlyH4DkvTmejgUy0SCSoLWMB8+vf89ZIfI
         4moA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fZAxYypDZb6ACUYFc7t5naencpzIL4taF+H04a8iHWs=;
        b=Y3WPRgTYJyGOGm2BKPPaZKQI1JnSXMeSDDMF5BF86WDcQty6CKukikygm2rPapBgvf
         dn8Q0XuYUFMt5Lovn3LOwAz8rYkiaW8sOYOrivyk13rO99zXhnTwtZ2HSfy0iKwV64On
         GOK60Pp/NH4oxi2SweTO70w5JdT9YillF6TWPUQCPwlWL2MOX8KIK5Q5sIQe5L3wedKl
         0uIUzb3U8gZdvxI2vyglnkkOSlIRoMUb9LxHopMeMBqW/guTygPWYDQpstThgHUK/WE6
         oitxx3jUZ7e0Vm0QjrCRMUMv3z2PclV1jwkp8Di2P9tTHG5VCBLYIiBzcHKBuEMFxCi6
         ktkw==
X-Gm-Message-State: AOAM532a/W2JRDwRl2kZJ31zoDLo0hOiJwOhVAOA8xiAaA5AFAy+2QlL
        ARSYrn6J00nNviNv8WYf8O85QA==
X-Google-Smtp-Source: ABdhPJxGYDmmdgmXWEgHagjK1Rp8VRrGd6bMRJY7snNJQ3qCmNQFepi13kADuU4uGC2sKtgiiSu75Q==
X-Received: by 2002:a9d:2c8:0:b0:59e:bea0:a9f4 with SMTP id 66-20020a9d02c8000000b0059ebea0a9f4mr2939557otl.221.1645211130867;
        Fri, 18 Feb 2022 11:05:30 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id d20sm1992569otu.61.2022.02.18.11.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 11:05:30 -0800 (PST)
Date:   Fri, 18 Feb 2022 11:07:36 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        jorcrous@amazon.com, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v6] i2c: qcom-geni: Add support for GPI DMA
Message-ID: <Yg/ueBiOAgBOI8BX@ripper>
References: <20220218185506.946510-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218185506.946510-1-vkoul@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri 18 Feb 10:55 PST 2022, Vinod Koul wrote:

> QUP Serial engines supports data transfers thru FIFO mode, SE DMA mode
> and lastly GPI DMA mode. Former two are already supported and this adds
> supports for the last mode.
> 
> In GPI DMA mode, the firmware is issued commands by driver to perform
> DMA and setup the serial port.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> 
> Changes since v5:
>  - Fix comments by Bjorn, Dmitry and Jordan

Thanks, but it's useful to know what those things where. Please list the
actual changes.

> 
> Changes since v4:
>  - Fix buildbot warn
>  - Fix flase warn reported by Alexey
>  - Fix feedback from Bjorn and cleanup the probe code and add more details
>    in changelog
> 
> Changes since v3:
>  - remove separate tx and rx function for gsi dma and make a common one
>  - remove global structs and use local variables instead
> 
> 
>  drivers/i2c/busses/i2c-qcom-geni.c | 303 ++++++++++++++++++++++++++---
>  1 file changed, 275 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 6d635a7c104c..e03544ba827c 100644
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
> @@ -48,6 +50,9 @@
>  #define LOW_COUNTER_SHFT	10
>  #define CYCLE_COUNTER_MSK	GENMASK(9, 0)
>  
> +#define I2C_PACK_TX		BIT(0)
> +#define I2C_PACK_RX		BIT(1)
> +
>  enum geni_i2c_err_code {
>  	GP_IRQ0,
>  	NACK,
> @@ -89,6 +94,9 @@ struct geni_i2c_dev {
>  	void *dma_buf;
>  	size_t xfer_len;
>  	dma_addr_t dma_addr;
> +	struct dma_chan *tx_c;
> +	struct dma_chan *rx_c;
> +	bool gpi_mode;
>  };
>  
>  struct geni_i2c_err_log {
> @@ -456,12 +464,202 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	return gi2c->err;
>  }
>  
> +static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
> +{
> +	struct geni_i2c_dev *gi2c = cb;
> +
> +	if (result->result != DMA_TRANS_NOERROR) {
> +		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
> +		goto err_trans;

Maybe I'm just missing it, but aren't you completing done now to avoid
the timeout, which causes the xfer to return success?

Note that, as I mentioned in previous review, we're under the adaptor
lock, so I don't think you need any additional locking to pass a value
back to xfer().

> +	}
> +
> +	if (result->residue)

You can avoid the goto, and make it clear from the overall structure that
only one (or none) of these paths will be taken.

	if (NOERROR) {

	} else if (result->residue) {

	}

Regards,
Bjorn

> +		dev_dbg(gi2c->se.dev, "DMA xfer has pending: %d\n", result->residue);
> +
> +err_trans:
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
> +	void *dma_buf;
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
> +	/* set the length as message for rx txn */
> +	peripheral->rx_len = msg->len;
> +	peripheral->op = op;
> +
> +	ret = dmaengine_slave_config(dma_chan, config);
> +	if (ret) {
> +		dev_err(gi2c->se.dev, "dma config error: %d for op:%d\n", ret, op);
> +		goto err_config;
> +	}
> +
> +	peripheral->set_config = 0;
> +	peripheral->multi_msg = true;
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
> +	desc->callback_result = i2c_gpi_cb_result;
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
> +static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], int num)
> +{
> +	struct dma_slave_config config = {};
> +	struct gpi_i2c_config peripheral = {};
> +	int i, ret = 0, timeout;
> +	dma_addr_t tx_addr, rx_addr;
> +	void *tx_buf = NULL, *rx_buf = NULL;
> +	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
> +
> +	config.peripheral_config = &peripheral;
> +	config.peripheral_size = sizeof(peripheral);
> +
> +	peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
> +	peripheral.cycle_count = itr->t_cycle_cnt;
> +	peripheral.high_count = itr->t_high_cnt;
> +	peripheral.low_count = itr->t_low_cnt;
> +	peripheral.clk_div = itr->clk_div;
> +	peripheral.set_config = 1;
> +	peripheral.multi_msg = false;
> +
> +	for (i = 0; i < num; i++) {
> +		gi2c->cur = &msgs[i];
> +		dev_dbg(gi2c->se.dev, "msg[%d].len:%d\n", i, gi2c->cur->len);
> +
> +		peripheral.stretch = 0;
> +		if (i < num - 1)
> +			peripheral.stretch = 1;
> +
> +		peripheral.addr = msgs[i].addr;
> +
> +		if (msgs[i].flags & I2C_M_RD) {
> +			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> +					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
> +			if (ret)
> +				goto err;
> +		}
> +
> +		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> +				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> +		if (ret)
> +			goto err;
> +
> +		if (msgs[i].flags & I2C_M_RD)
> +			dma_async_issue_pending(gi2c->rx_c);
> +		dma_async_issue_pending(gi2c->tx_c);
> +
> +		timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +		if (!timeout) {
> +			dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
> +				gi2c->cur->flags, gi2c->cur->addr);
> +			ret = gi2c->err = -ETIMEDOUT;
> +			goto err;
> +		}
> +
> +		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> +	}
> +
> +	return num;
> +
> +err:
> +	dmaengine_terminate_sync(gi2c->rx_c);
> +	dmaengine_terminate_sync(gi2c->tx_c);
> +	geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> +	return ret;
> +}
> +
> +static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
> +			      struct i2c_msg msgs[], int num)
> +{
> +	int i, ret = 0;
> +
> +	for (i = 0; i < num; i++) {
> +		u32 m_param = i < (num - 1) ? STOP_STRETCH : 0;
> +
> +		m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
> +
> +		gi2c->cur = &msgs[i];
> +		if (msgs[i].flags & I2C_M_RD)
> +			ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], m_param);
> +		else
> +			ret = geni_i2c_tx_one_msg(gi2c, &msgs[i], m_param);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return num;
> +}
> +
>  static int geni_i2c_xfer(struct i2c_adapter *adap,
>  			 struct i2c_msg msgs[],
>  			 int num)
>  {
>  	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
> -	int i, ret;
> +	int ret;
>  
>  	gi2c->err = 0;
>  	reinit_completion(&gi2c->done);
> @@ -475,28 +673,17 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  	}
>  
>  	qcom_geni_i2c_conf(gi2c);
> -	for (i = 0; i < num; i++) {
> -		u32 m_param = i < (num - 1) ? STOP_STRETCH : 0;
> -
> -		m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
> -
> -		gi2c->cur = &msgs[i];
> -		if (msgs[i].flags & I2C_M_RD)
> -			ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], m_param);
> -		else
> -			ret = geni_i2c_tx_one_msg(gi2c, &msgs[i], m_param);
>  
> -		if (ret)
> -			break;
> -	}
> -	if (ret == 0)
> -		ret = num;
> +	if (gi2c->gpi_mode)
> +		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
> +	else
> +		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>  
>  	pm_runtime_mark_last_busy(gi2c->se.dev);
>  	pm_runtime_put_autosuspend(gi2c->se.dev);
>  	gi2c->cur = NULL;
>  	gi2c->err = 0;
> -	return ret;
> +	return num;
>  }
>  
>  static u32 geni_i2c_func(struct i2c_adapter *adap)
> @@ -517,11 +704,50 @@ static const struct acpi_device_id geni_i2c_acpi_match[] = {
>  MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
>  #endif
>  
> +static void release_gpi_dma(struct geni_i2c_dev *gi2c)
> +{
> +	if (gi2c->rx_c)
> +		dma_release_channel(gi2c->rx_c);
> +
> +	if (gi2c->tx_c)
> +		dma_release_channel(gi2c->tx_c);
> +}
> +
> +static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
> +{
> +	int ret;
> +
> +	geni_se_select_mode(&gi2c->se, GENI_GPI_DMA);
> +	gi2c->tx_c = dma_request_chan(gi2c->se.dev, "tx");
> +	if (IS_ERR(gi2c->tx_c)) {
> +		ret = dev_err_probe(gi2c->se.dev, PTR_ERR(gi2c->tx_c),
> +				    "Failed to get tx DMA ch\n");
> +		if (ret < 0)
> +			goto err_tx;
> +	}
> +
> +	gi2c->rx_c = dma_request_chan(gi2c->se.dev, "rx");
> +	if (IS_ERR(gi2c->rx_c)) {
> +		ret = dev_err_probe(gi2c->se.dev, PTR_ERR(gi2c->rx_c),
> +				    "Failed to get rx DMA ch\n");
> +		if (ret < 0)
> +			goto err_rx;
> +	}
> +
> +	dev_dbg(gi2c->se.dev, "Grabbed GPI dma channels\n");
> +	return 0;
> +
> +err_rx:
> +	dma_release_channel(gi2c->tx_c);
> +err_tx:
> +	return ret;
> +}
> +
>  static int geni_i2c_probe(struct platform_device *pdev)
>  {
>  	struct geni_i2c_dev *gi2c;
>  	struct resource *res;
> -	u32 proto, tx_depth;
> +	u32 proto, tx_depth, fifo_disable;
>  	int ret;
>  	struct device *dev = &pdev->dev;
>  
> @@ -601,27 +827,43 @@ static int geni_i2c_probe(struct platform_device *pdev)
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
> +	if (fifo_disable) {
> +		/* FIFO is disabled, so we can only use GPI DMA */
> +		gi2c->gpi_mode = true;
> +		ret = setup_gpi_dma(gi2c);
> +		if (ret) {
> +			dev_err(dev, "Failed to setup GPI DMA mode:%d ret\n", ret);
> +			return ret;
> +		}
> +
> +		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
> +	} else {
> +		gi2c->gpi_mode = false;
> +		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
> +		gi2c->tx_wm = tx_depth - 1;
> +		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
> +		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
> +				       PACKING_BYTES_PW, true, true, true);
> +
> +		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
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
> @@ -633,12 +875,16 @@ static int geni_i2c_probe(struct platform_device *pdev)
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
>  }
>  
>  static int geni_i2c_remove(struct platform_device *pdev)
> @@ -646,6 +892,7 @@ static int geni_i2c_remove(struct platform_device *pdev)
>  	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
>  
>  	i2c_del_adapter(&gi2c->adap);
> +	release_gpi_dma(gi2c);
>  	pm_runtime_disable(gi2c->se.dev);
>  	return 0;
>  }
> -- 
> 2.31.1
> 
