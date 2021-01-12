Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754432F2800
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 06:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389051AbhALFvJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 00:51:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:47174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728515AbhALFvJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 00:51:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13696222B3;
        Tue, 12 Jan 2021 05:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610430627;
        bh=ztDxWQPKwcCAo9T8qbVZ/zqnzxTIbqjLfHP8mgNU1ls=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e7ANCMi2NcHw6kEp9tl3U+BMxdK7pU7+eDkPxjxy+1Ylzr2xJoQgPZLozpwhgjZs+
         95vNJhwbKk1oBRb1gG/h+B0ZZVXalT/q3oEuJmOGrdbr8VUb0FU4jN0vvr9ZCxe/PK
         JDcAeqPRYoY9BuvaziYHsMwcO9LbugXTb7JSaIM4dB23ZHOOgt8CMoHAqe/e6o5nOL
         v04fnMnvAEgmsymXfBeWCsDTl3LwzAJxqVOmjgizXUuTS4mhEK5jWUcVtGTqj4pkz6
         uRztgKYWKxpGetmF15gQznKjQqXhgOHmiEP+quWFgQCaJQnzsDqyCRt9x1U0GnV7RU
         TGftFfcEnJjsQ==
Date:   Tue, 12 Jan 2021 11:20:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] i2c: qcom-geni: Add support for GPI DMA
Message-ID: <20210112055022.GH2771@vkoul-mobl>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-6-vkoul@kernel.org>
 <X/yVeXjQduGYpJjY@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/yVeXjQduGYpJjY@builder.lan>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11-01-21, 12:14, Bjorn Andersson wrote:
> On Mon 11 Jan 09:16 CST 2021, Vinod Koul wrote:
> 
> > This adds capability to use GSI DMA for I2C transfers
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/i2c/busses/i2c-qcom-geni.c | 246 ++++++++++++++++++++++++++++-
> >  1 file changed, 244 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > index 046d241183c5..6978480fb4d1 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -12,7 +12,9 @@
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/dmaengine.h>
> >  #include <linux/qcom-geni-se.h>
> > +#include <linux/dma/qcom-gpi-dma.h>
> >  #include <linux/spinlock.h>
> >  
> >  #define SE_I2C_TX_TRANS_LEN		0x26c
> > @@ -48,6 +50,8 @@
> >  #define LOW_COUNTER_SHFT	10
> >  #define CYCLE_COUNTER_MSK	GENMASK(9, 0)
> >  
> > +#define I2C_PACK_EN		(BIT(0) | BIT(1))
> > +
> >  enum geni_i2c_err_code {
> >  	GP_IRQ0,
> >  	NACK,
> > @@ -72,6 +76,12 @@ enum geni_i2c_err_code {
> >  #define XFER_TIMEOUT		HZ
> >  #define RST_TIMEOUT		HZ
> >  
> > +enum i2c_se_mode {
> > +	UNINITIALIZED,
> > +	FIFO_SE_DMA,
> > +	GSI_ONLY,
> > +};
> > +
> >  struct geni_i2c_dev {
> >  	struct geni_se se;
> >  	u32 tx_wm;
> > @@ -86,6 +96,17 @@ struct geni_i2c_dev {
> >  	u32 clk_freq_out;
> >  	const struct geni_i2c_clk_fld *clk_fld;
> >  	int suspended;
> > +	struct dma_chan *tx_c;
> > +	struct dma_chan *rx_c;
> > +	dma_cookie_t rx_cookie, tx_cookie;
> > +	dma_addr_t tx_ph;
> > +	dma_addr_t rx_ph;
> > +	int cfg_sent;
> 
> bool?

ok

> 
> > +	struct dma_async_tx_descriptor *tx_desc;
> > +	struct dma_async_tx_descriptor *rx_desc;
> > +	enum i2c_se_mode se_mode;
> 
> bool gsi_only;

I think fifo_mode would be more apt... since we check for other modes in
the code

> 
> > +	bool cmd_done;
> 
> Unused?

heh, will remove..

> > +	bool is_shared;
> 
> Used but meaningless?

Will drop

> 
> >  };
> >  
> >  struct geni_i2c_err_log {
> > @@ -429,6 +450,183 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> >  	return gi2c->err;
> >  }
> >  
> > +static void i2c_gsi_cb_result(void *cb, const struct dmaengine_result *result)
> > +{
> > +	struct geni_i2c_dev *gi2c = cb;
> > +
> > +	if (result->result != DMA_TRANS_NOERROR) {
> > +		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
> > +		return;
> > +	}
> > +
> > +	if (result->residue)
> > +		dev_dbg(gi2c->se.dev, "DMA xfer has pending: %d\n", result->residue);
> > +
> > +	complete(&gi2c->done);
> > +}
> > +
> > +static int geni_i2c_gsi_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
> > +			     int num)
> > +{
> > +	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
> > +	struct dma_slave_config config;
> > +	struct gpi_i2c_config peripheral;
> > +	int i, ret = 0, timeout = 0;
> > +
> > +	memset(&config, 0, sizeof(config));
> 
> Assign {} to config during declaration.

ok

> 
> > +	memset(&peripheral, 0, sizeof(peripheral));
> > +	config.peripheral_config = &peripheral;
> > +	config.peripheral_size = sizeof(peripheral);
> > +
> > +	if (!gi2c->tx_c) {
> > +		gi2c->tx_c = dma_request_slave_channel(gi2c->se.dev, "tx");
> 
> So object is reused for all future transfers as well?
> Seems reasonable, but it should be released on driver removal?
> 
> Could it be requested at probe time instead?

yes it can be done, i would move it..

> 
> > +		if (!gi2c->tx_c) {
> > +			dev_err(gi2c->se.dev, "tx dma_request_slave_channel fail\n");
> > +			ret = -EIO;
> > +			goto geni_i2c_gsi_xfer_out;
> > +		}
> > +	}
> > +
> > +	if (!gi2c->rx_c) {
> > +		gi2c->rx_c = dma_request_slave_channel(gi2c->se.dev, "rx");
> > +		if (!gi2c->rx_c) {
> > +			dev_err(gi2c->se.dev, "rx dma_request_slave_channel fail\n");
> > +			ret = -EIO;
> > +			goto geni_i2c_gsi_xfer_out;
> > +		}
> > +	}
> > +
> > +	if (!gi2c->cfg_sent) {
> > +		const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
> > +
> > +		peripheral.pack_enable = I2C_PACK_EN;
> > +		peripheral.cycle_count = itr->t_cycle_cnt;
> > +		peripheral.high_count = itr->t_high_cnt;
> > +		peripheral.low_count = itr->t_low_cnt;
> > +		peripheral.clk_div = itr->clk_div;
> > +		gi2c->cfg_sent = true;
> 
> Is this a bool or an int?

Now would be a bool :)

> 
> > +		peripheral.set_config =  true;
> 
> I find this somewhat ugly, you will always
> dmaengine_slave_config(&config), but in the case of cfg_sent this will
> point to an all-zero peripheral and hence will have set_config = false,
> which will cause the skipping of setting up a configuration TRE.
> 
> I would prefer that the value of peripheral.set_config related to
> cfg_sent in a more explicit fashion.

Sure, i think I can use a single value to do this, will update this

> 
> > +	}
> > +
> > +	peripheral.multi_msg = false;
> > +	for (i = 0; i < num; i++) {
> > +		struct device *rx_dev = gi2c->se.wrapper->dev;
> > +		struct device *tx_dev = gi2c->se.wrapper->dev;
> > +		int stretch = (i < (num - 1));
> > +		u8 *dma_buf = NULL;
> 
> No need to initialize this, first use is an assignment.

ok

> 
> > +		unsigned int flags;
> > +
> > +		gi2c->cur = &msgs[i];
> > +
> > +		peripheral.addr = msgs[i].addr;
> > +		peripheral.stretch = stretch;
> > +		if (msgs[i].flags & I2C_M_RD)
> > +			peripheral.op = I2C_READ;
> > +		else
> > +			peripheral.op = I2C_WRITE;
> > +
> > +		dma_buf = i2c_get_dma_safe_msg_buf(&msgs[i], 1);
> > +		if (!dma_buf) {
> > +			ret = -ENOMEM;
> > +			goto geni_i2c_gsi_xfer_out;
> > +		}
> > +
> > +		if (msgs[i].flags & I2C_M_RD) {
> > +			gi2c->rx_ph = dma_map_single(rx_dev, dma_buf,
> > +						     msgs[i].len, DMA_FROM_DEVICE);
> > +			if (dma_mapping_error(rx_dev, gi2c->rx_ph)) {
> > +				dev_err(gi2c->se.dev, "dma_map_single for rx failed :%d\n", ret);
> > +				i2c_put_dma_safe_msg_buf(dma_buf, &msgs[i], false);
> > +				goto geni_i2c_gsi_xfer_out;
> > +			}
> > +
> > +			peripheral.op = I2C_READ;
> > +			peripheral.stretch = stretch;
> > +			ret = dmaengine_slave_config(gi2c->rx_c, &config);
> > +			if (ret) {
> > +				dev_err(gi2c->se.dev, "rx dma config error:%d\n", ret);
> > +				goto geni_i2c_gsi_xfer_out;
> 
> Need to unmap rx_ph?

yes will update

> 
> > +			}
> > +			peripheral.set_config =  false;
> > +			peripheral.multi_msg = true;
> > +			peripheral.rx_len = msgs[i].len;
> > +
> > +			flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
> > +			gi2c->rx_desc = dmaengine_prep_slave_single(gi2c->rx_c, gi2c->rx_ph,
> > +								    msgs[i].len,
> > +								    DMA_DEV_TO_MEM, flags);
> 
> Is the rx_desc freed by the dmaengine core when
> dma_async_issue_pending() finishes it's job?

Yes

> If so, why do you need to keep this pointer in gi2c? Wouldn't a local
> variable suffice?

Yes local should suffice, will update

> 
> > +			if (!gi2c->rx_desc) {
> > +				dev_err(gi2c->se.dev, "prep_slave_sg for rx failed\n");
> > +				gi2c->err = -EIO;
> > +				goto geni_i2c_err_prep_sg;
> > +			}
> > +
> > +			gi2c->rx_desc->callback_result = i2c_gsi_cb_result;
> > +			gi2c->rx_desc->callback_param = gi2c;
> > +
> > +			/* Issue RX */
> > +			gi2c->rx_cookie = dmaengine_submit(gi2c->rx_desc);
> > +			dma_async_issue_pending(gi2c->rx_c);
> > +		}
> > +
> > +		dev_dbg(gi2c->se.dev, "msg[%d].len:%d W\n", i, gi2c->cur->len);
> > +		gi2c->tx_ph = dma_map_single(tx_dev, dma_buf, msgs[i].len, DMA_TO_DEVICE);
> 
> Maybe I've forgotten something important about I2C, but why do we always
> TX (even if it's a RX transfer)?

I think we need to send the device address for i2c, so even if we want
to do RX, that will always involve a TX txn as well

> 
> > +		if (dma_mapping_error(tx_dev, gi2c->tx_ph)) {
> > +			dev_err(gi2c->se.dev, "dma_map_single for tx failed :%d\n", ret);
> > +			i2c_put_dma_safe_msg_buf(dma_buf, &msgs[i], false);
> 
> Need to unmap rx_ph?
> 
> > +			goto geni_i2c_gsi_xfer_out;
> > +		}
> > +
> > +		peripheral.stretch = stretch;
> > +		peripheral.op = I2C_WRITE;
> > +		ret = dmaengine_slave_config(gi2c->tx_c, &config);
> > +		if (ret) {
> > +			dev_err(gi2c->se.dev, "tx dma config error:%d\n", ret);
> 
> Need to unmap rx_ph and tx_ph?

Yeah looks like I missed unrolling, will check and update all these

> 
> > +			goto geni_i2c_gsi_xfer_out;
> > +		}
> > +		peripheral.set_config =  false;
> > +		peripheral.multi_msg = true;
> > +		gi2c->tx_desc = dmaengine_prep_slave_single(gi2c->tx_c, gi2c->tx_ph, msgs[i].len,
> > +							    DMA_MEM_TO_DEV,
> > +							    (DMA_PREP_INTERRUPT |  DMA_CTRL_ACK));
> > +		if (!gi2c->tx_desc) {
> > +			dev_err(gi2c->se.dev, "prep_slave_sg for tx failed\n");
> > +			gi2c->err = -ENOMEM;
> > +			goto geni_i2c_err_prep_sg;
> > +		}
> > +		gi2c->tx_desc->callback_result = i2c_gsi_cb_result;
> > +		gi2c->tx_desc->callback_param = gi2c;
> > +
> > +		/* Issue TX */
> > +		gi2c->tx_cookie = dmaengine_submit(gi2c->tx_desc);
> > +		dma_async_issue_pending(gi2c->tx_c);
> > +
> > +		timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> > +		if (!timeout) {
> > +			dev_err(gi2c->se.dev, "I2C timeout gsi flags:%d addr:0x%x\n",
> > +				gi2c->cur->flags, gi2c->cur->addr);
> > +			gi2c->err = -ETIMEDOUT;
> > +		}
> > +geni_i2c_err_prep_sg:
> 
> Perhaps you can break the body of this loop out to a separate function
> and thereby avoid the goto within the block?
> 
> > +		if (gi2c->err) {
> > +			dmaengine_terminate_all(gi2c->tx_c);
> > +			gi2c->cfg_sent = 0;
> 
> Is this a bool or an int?
> 
> > +		}
> > +		if (msgs[i].flags & I2C_M_RD)
> > +			dma_unmap_single(rx_dev, gi2c->rx_ph, msgs[i].len, DMA_FROM_DEVICE);
> 
> You unconditionally map tx_ph, but you only unmap it on ~I2C_M_RD. This
> fits better with my expectation, but would mean that the whole tx block
> above should be in an else.
> 
> > +		else
> > +			dma_unmap_single(tx_dev, gi2c->tx_ph, msgs[i].len, DMA_TO_DEVICE);
> > +		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[i], !gi2c->err);
> > +		if (gi2c->err)
> > +			goto geni_i2c_gsi_xfer_out;
> 
> This goto is just a "break" in disguise.
> 
> > +	}
> > +
> > +geni_i2c_gsi_xfer_out:
> > +	if (!ret && gi2c->err)
> > +		ret = gi2c->err;
> > +	return ret;
> > +}
> > +
> >  static int geni_i2c_xfer(struct i2c_adapter *adap,
> >  			 struct i2c_msg msgs[],
> >  			 int num)
> > @@ -448,6 +646,15 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
> >  	}
> >  
> >  	qcom_geni_i2c_conf(gi2c);
> > +
> > +	if (gi2c->se_mode == GSI_ONLY) {
> > +		ret = geni_i2c_gsi_xfer(adap, msgs, num);
> > +		goto geni_i2c_txn_ret;
> 
> Rather than goto skip_non_gsi_code; I think you should move the non-gsi
> part of this function into a separate fifo function and make this

Okay let me take a relook at this whole blob and refactor it..

> 
> if (GSI_ONLY)
> 	ret = geni_i2c_gsi_xfer();
> else
> 	ret = geni_i2c_fifo_xfer();
> 
> > +	} else {
> > +		/* Don't set shared flag in non-GSI mode */
> > +		gi2c->is_shared = false;
> 
> I don't see this flag being looked at elsewhere.
> 
> > +	}
> > +
> >  	for (i = 0; i < num; i++) {
> >  		u32 m_param = i < (num - 1) ? STOP_STRETCH : 0;
> >  
> > @@ -462,6 +669,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
> >  		if (ret)
> >  			break;
> >  	}
> > +geni_i2c_txn_ret:
> >  	if (ret == 0)
> >  		ret = num;
> >  
> > @@ -628,7 +836,8 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
> >  	int ret;
> >  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
> >  
> > -	disable_irq(gi2c->irq);
> > +	if (gi2c->se_mode == FIFO_SE_DMA)
> > +		disable_irq(gi2c->irq);
> >  	ret = geni_se_resources_off(&gi2c->se);
> >  	if (ret) {
> >  		enable_irq(gi2c->irq);
> > @@ -653,8 +862,41 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
> >  	ret = geni_se_resources_on(&gi2c->se);
> >  	if (ret)
> >  		return ret;
> > +	if (gi2c->se_mode == UNINITIALIZED) {
> > +		int proto = geni_se_read_proto(&gi2c->se);
> > +		u32 se_mode;
> 
> Please declare your variables at the top of the function.
> 
> > +
> > +		if (unlikely(proto != GENI_SE_I2C)) {
> 
> If this was the case at probe time the driver would never have probed,
> why has it changed?
> 
> This is not a fastpath, so skip the unlikely()
> 
> > +			dev_err(gi2c->se.dev, "Invalid proto %d\n", proto);
> > +			geni_se_resources_off(&gi2c->se);
> > +			return -ENXIO;
> > +		}
> > +
> > +		se_mode = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) &
> > +				FIFO_IF_DISABLE;
> 
> se_mode would better be called "fifo_disabled" or perhaps logically
> suited "gsi_only"?

O think fifo_mode or just mode might be apt

> 
> Please skip the _relaxed

yes

> 
> > +		if (se_mode) {
> > +			gi2c->se_mode = GSI_ONLY;
> > +			geni_se_select_mode(&gi2c->se, GENI_GPI_DMA);
> > +			dev_dbg(gi2c->se.dev, "i2c GSI mode\n");
> > +		} else {
> > +			int gi2c_tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
> 
> This variable has an unnecessarily long name.

will shorten

> 
> > +
> > +			gi2c->se_mode = FIFO_SE_DMA;
> > +			gi2c->tx_wm = gi2c_tx_depth - 1;
> > +			geni_se_init(&gi2c->se, gi2c->tx_wm, gi2c_tx_depth);
> > +			geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
> > +					       PACKING_BYTES_PW, true, true, true);
> > +			qcom_geni_i2c_conf(gi2c);
> > +			dev_dbg(gi2c->se.dev,
> > +				"i2c fifo/se-dma mode. fifo depth:%d\n", gi2c_tx_depth);
> > +		}
> > +		dev_dbg(gi2c->se.dev, "i2c-%d: %s\n",
> > +			gi2c->adap.nr, dev_name(gi2c->se.dev));
> 
> dev_dbg() already provides dev_name. What information does this debug
> print actually try to communicate?

not much am afraid, will update

-- 
~Vinod
