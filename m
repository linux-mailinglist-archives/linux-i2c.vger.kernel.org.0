Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08F624BA732
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Feb 2022 18:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243749AbiBQRd5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Feb 2022 12:33:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243746AbiBQRd5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Feb 2022 12:33:57 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09871732EB
        for <linux-i2c@vger.kernel.org>; Thu, 17 Feb 2022 09:33:41 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id p15so374788oip.3
        for <linux-i2c@vger.kernel.org>; Thu, 17 Feb 2022 09:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cHjzJ4tu0iwWERzLvjnOhK3bm3Iy4LFFoOV9TvsEMeo=;
        b=nrmepXRcU1iuIEYOOb/8DbGk26nvYN+q39+L6353I7F1sNluHZiARO+PnrTMRyzkKC
         3trnT3Kwex55q3fhQe/HiF2jHqC+2xqPpXyFFkVLlApay/uCAux1lEuNF2L3S32+d5m5
         LE5Ss4YYW2KCQPK4AgPTNe9Yuf8D+LNzyg3omuayIGLgbsm47fi5wl+DDTJOAf8HPF83
         FxCYviAThgU93iw8jyYf617FeOuVbBdKuE406v+E2OJiABXa75S5sNqVD6g0dkjD9bXP
         BQaQdNiQJqtXAEVeksTq0VK/QqHZfVJi4mtyv9EHVXZ+GAdLs00BHqytZgu2uXhIWyOw
         leDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cHjzJ4tu0iwWERzLvjnOhK3bm3Iy4LFFoOV9TvsEMeo=;
        b=EJ5lgV/WbPh+oeLtugqptnX+UPnKUvtaITQOqX5FUMHs4k3TE0kCJnoloi6yUR2lnO
         blHDF1dqrmT1GNNLqFGr4C55UYiciwiB0dwWkgmilJ+Wi+11EfsgIWRfP/1g3UGkMwin
         9BpAL0ZDqG/Ph33LxDLUSViBT7G+5ejGiM4ThV3iKmPT9pZBwgb0timuU3PifqHLaH4q
         14usfP9MWVTGJ5jJ+64MJEpFq+qlgHvDajL8/lMptTwso+JozAv7tUlra6cuUmW2ZWwU
         H5kjM1kFNRCNzplj/TOGWXhn1jeSyo/GLhovq7B/pNz5BHrs/RKjhtHRh2UluauA61CZ
         6ztw==
X-Gm-Message-State: AOAM530iAoi9/eWEyVibCaXGSg9gZkVf4DIyireM0YPMAFK6/ZCDZLW+
        zNIzFwietTNWEDNc+X9CdjwcLA==
X-Google-Smtp-Source: ABdhPJx4+RwrrWNNQzsWdj2ES3Ot+nHFgEONSR6Dy57JbnogPDlZoiTE2j/fuilrFVHCHUlDAHRIvA==
X-Received: by 2002:aca:5a86:0:b0:2ce:6ee7:2caa with SMTP id o128-20020aca5a86000000b002ce6ee72caamr3158348oib.216.1645119220870;
        Thu, 17 Feb 2022 09:33:40 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id 128sm163526oor.15.2022.02.17.09.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 09:33:40 -0800 (PST)
Date:   Thu, 17 Feb 2022 09:35:47 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: [PATCH v5] i2c: qcom-geni: Add support for GPI DMA
Message-ID: <Yg6Hc2pT8DFKS2dT@ripper>
References: <20220131120403.2481995-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131120403.2481995-1-vkoul@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon 31 Jan 04:04 PST 2022, Vinod Koul wrote:

> QUP Serial engines supports data transfers thru FIFO mode, SE DMA mode and
> lastly GPI DMA mode. Former two are already supported and this adds supports the
> last mode.
> 
> In GPI DMA mode, the firmware is issued commands by driver to perform DMA
> and setup the serial port.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
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
>  drivers/i2c/busses/i2c-qcom-geni.c | 300 ++++++++++++++++++++++++++---
>  1 file changed, 273 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 6d635a7c104c..696253d178a6 100644
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
> @@ -456,12 +464,199 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	return gi2c->err;
>  }
>  
> +static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
> +{
> +	struct geni_i2c_dev *gi2c = cb;
> +
> +	if (result->result != DMA_TRANS_NOERROR) {
> +		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);

Iiuc the API the expectation is that if we get !NOERROR we shouldn't
expect to get NOERROR after that.

If so we're just returning here and leaving geni_i2c_gpi_xfer() to just
timeout in a HZ or so. Given that xfer happens under the adaptor lock,
how about carrying an error in geni_i2c_dev and complete(&done) here as
well?

> +		return;
> +	}
> +
> +	if (result->residue)
> +		dev_dbg(gi2c->se.dev, "DMA xfer has pending: %d\n", result->residue);
> +
> +	complete(&gi2c->done);
> +}
> +
[..]
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
> +			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config, &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
> +			if (ret)
> +				goto err;
> +		}
> +
> +		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config, &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
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
> +	return 0;
> +
> +err:
> +	dmaengine_terminate_sync(gi2c->rx_c);
> +	dmaengine_terminate_sync(gi2c->tx_c);
> +	geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> +	return ret;
> +}
[..]
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
> +	gi2c->tx_c = NULL;

You're not accessing tx_c or rx_c again when returning an error here. So
I don't think there's a reason to clear them.

> +err_tx:
> +	gi2c->rx_c = NULL;
> +	return ret;
> +}
> +
[..]
>  static int geni_i2c_remove(struct platform_device *pdev)
>  {
>  	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
>  
> +	release_gpi_dma(gi2c);

Your i2c devices aren't torn down until i2c_del_adapter(), so you might
still end up trying to use the two channels here, after releasing them.

In other words, I think you should reorder these.

Regards,
Bjorn
