Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 241BD4BD554
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Feb 2022 06:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245752AbiBUFRG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Feb 2022 00:17:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244500AbiBUFRG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Feb 2022 00:17:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2D634BA8;
        Sun, 20 Feb 2022 21:16:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BD816611D4;
        Mon, 21 Feb 2022 05:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFA0C340E9;
        Mon, 21 Feb 2022 05:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645420603;
        bh=SW1dBgNi5KyTKJJIBmxSzjFwKKW5fAv0Xq8lF9JTfuk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jHUQ3WOsJXijKktfUipFVnrf10E+w5avLSJ+YawcKqdZ9Qh3UskC9Rf40dSQe56tC
         2rrFWMJD8jlNecx4LLgUsRWCN8YuHnJaxl0hY81GNYE+4f6morqBqqHBPiBxkCVYOn
         yuR1GMSV1b+Ev9WLWzrZkD/gVYbRlMw2S4AJ0cFve5ZlUf4iGgjzk+yPwJCoMngyi+
         eZEthjYEiRXcKlHG5TQjQtLtQ0VSqVxpjaJXzr5nHz2ccybKMdZFa2f8CtIwOEq4dp
         wP5OeN9t0ADcqCutliU08B5i5RPLd+ax80f906DB3baAept+KmUhB4UvKwPLhyRMMR
         4egHW/qF3IYJQ==
Date:   Mon, 21 Feb 2022 10:46:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        jorcrous@amazon.com, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v6] i2c: qcom-geni: Add support for GPI DMA
Message-ID: <YhMgNjChoY+V/LaY@matsya>
References: <20220218185506.946510-1-vkoul@kernel.org>
 <Yg/ueBiOAgBOI8BX@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yg/ueBiOAgBOI8BX@ripper>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18-02-22, 11:07, Bjorn Andersson wrote:
> On Fri 18 Feb 10:55 PST 2022, Vinod Koul wrote:
> 
> > QUP Serial engines supports data transfers thru FIFO mode, SE DMA mode
> > and lastly GPI DMA mode. Former two are already supported and this adds
> > supports for the last mode.
> > 
> > In GPI DMA mode, the firmware is issued commands by driver to perform
> > DMA and setup the serial port.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> > 
> > Changes since v5:
> >  - Fix comments by Bjorn, Dmitry and Jordan
> 
> Thanks, but it's useful to know what those things where. Please list the
> actual changes.

My bad or rather lazy to post late in night, here it is for record:
 - Fix the order of remove
 - make sure completion is called when status is !NOERROR
 - dont reset dma channel on exit
 - Make sure to return num on scucess for i2c xfer for both fifo and gpi
   mode

> 
> > 
> > Changes since v4:
> >  - Fix buildbot warn
> >  - Fix flase warn reported by Alexey
> >  - Fix feedback from Bjorn and cleanup the probe code and add more details
> >    in changelog
> > 
> > Changes since v3:
> >  - remove separate tx and rx function for gsi dma and make a common one
> >  - remove global structs and use local variables instead
> > 
> > 
> >  drivers/i2c/busses/i2c-qcom-geni.c | 303 ++++++++++++++++++++++++++---
> >  1 file changed, 275 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > index 6d635a7c104c..e03544ba827c 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -3,7 +3,9 @@
> >  
> >  #include <linux/acpi.h>
> >  #include <linux/clk.h>
> > +#include <linux/dmaengine.h>
> >  #include <linux/dma-mapping.h>
> > +#include <linux/dma/qcom-gpi-dma.h>
> >  #include <linux/err.h>
> >  #include <linux/i2c.h>
> >  #include <linux/interrupt.h>
> > @@ -48,6 +50,9 @@
> >  #define LOW_COUNTER_SHFT	10
> >  #define CYCLE_COUNTER_MSK	GENMASK(9, 0)
> >  
> > +#define I2C_PACK_TX		BIT(0)
> > +#define I2C_PACK_RX		BIT(1)
> > +
> >  enum geni_i2c_err_code {
> >  	GP_IRQ0,
> >  	NACK,
> > @@ -89,6 +94,9 @@ struct geni_i2c_dev {
> >  	void *dma_buf;
> >  	size_t xfer_len;
> >  	dma_addr_t dma_addr;
> > +	struct dma_chan *tx_c;
> > +	struct dma_chan *rx_c;
> > +	bool gpi_mode;
> >  };
> >  
> >  struct geni_i2c_err_log {
> > @@ -456,12 +464,202 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> >  	return gi2c->err;
> >  }
> >  
> > +static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
> > +{
> > +	struct geni_i2c_dev *gi2c = cb;
> > +
> > +	if (result->result != DMA_TRANS_NOERROR) {
> > +		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
> > +		goto err_trans;
> 
> Maybe I'm just missing it, but aren't you completing done now to avoid
> the timeout, which causes the xfer to return success?
> 
> Note that, as I mentioned in previous review, we're under the adaptor
> lock, so I don't think you need any additional locking to pass a value
> back to xfer().

Yes we should pass the err value, will add that up in gi2c to pass
around...

> 
> > +	}
> > +
> > +	if (result->residue)
> 
> You can avoid the goto, and make it clear from the overall structure that
> only one (or none) of these paths will be taken.
> 
> 	if (NOERROR) {
> 
> 	} else if (result->residue) {
> 
> 	}

Sure

-- 
~Vinod
