Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57EA54BB25F
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 07:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbiBRGeN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 01:34:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiBRGeA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 01:34:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D360A369D7;
        Thu, 17 Feb 2022 22:33:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 020EAB82537;
        Fri, 18 Feb 2022 06:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF86AC340EC;
        Fri, 18 Feb 2022 06:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645166020;
        bh=oQK3hn8aIgAl4tYz+ZxnTVfrY4IVhUqyJJf7MAjs6rg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WrLbA6+NkvFz3cXjrHpU9UPR+Oqb0OvTNd5Wip3xvgwDS4CsMCWIQJPM5xX/BYwtn
         WA/Bquj+XlOa96Rd6lDPFE2GFs35/Tza5wNk48smSNr4I+xPlB7vCKxsvm4XO8L794
         GF+q0yfoSq9cueq4RZlrTbk3G8moWVqW4bI8Y+0aQbTT0WSjoyWaQMLgXa8l5WCLTx
         YpN+iaVMsF5eBIqNHvEe9c9Got1aA3YvrXCKFlRbBw32bdWOuuZEpwlp733OALEA3X
         WrEVX2/jdtDTpacFun+dD9Vxw6eLHRqQEYd6o/gpu/aeXqbIah3LkzIZHGcRqo0wKM
         nmOhsEnkrgEkA==
Date:   Fri, 18 Feb 2022 12:03:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: [PATCH v5] i2c: qcom-geni: Add support for GPI DMA
Message-ID: <Yg89wEi9I4LpcPus@matsya>
References: <20220131120403.2481995-1-vkoul@kernel.org>
 <Yg6Hc2pT8DFKS2dT@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yg6Hc2pT8DFKS2dT@ripper>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17-02-22, 09:35, Bjorn Andersson wrote:

> > +static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
> > +{
> > +	struct geni_i2c_dev *gi2c = cb;
> > +
> > +	if (result->result != DMA_TRANS_NOERROR) {
> > +		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
> 
> Iiuc the API the expectation is that if we get !NOERROR we shouldn't
> expect to get NOERROR after that.
>
> If so we're just returning here and leaving geni_i2c_gpi_xfer() to just
> timeout in a HZ or so. Given that xfer happens under the adaptor lock,
> how about carrying an error in geni_i2c_dev and complete(&done) here as
> well?

Yes we should call complete for errors too, will add that

> > +static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
> > +{
> > +	int ret;
> > +
> > +	geni_se_select_mode(&gi2c->se, GENI_GPI_DMA);
> > +	gi2c->tx_c = dma_request_chan(gi2c->se.dev, "tx");
> > +	if (IS_ERR(gi2c->tx_c)) {
> > +		ret = dev_err_probe(gi2c->se.dev, PTR_ERR(gi2c->tx_c),
> > +				    "Failed to get tx DMA ch\n");
> > +		if (ret < 0)
> > +			goto err_tx;
> > +	}
> > +
> > +	gi2c->rx_c = dma_request_chan(gi2c->se.dev, "rx");
> > +	if (IS_ERR(gi2c->rx_c)) {
> > +		ret = dev_err_probe(gi2c->se.dev, PTR_ERR(gi2c->rx_c),
> > +				    "Failed to get rx DMA ch\n");
> > +		if (ret < 0)
> > +			goto err_rx;
> > +	}
> > +
> > +	dev_dbg(gi2c->se.dev, "Grabbed GPI dma channels\n");
> > +	return 0;
> > +
> > +err_rx:
> > +	dma_release_channel(gi2c->tx_c);
> > +	gi2c->tx_c = NULL;
> 
> You're not accessing tx_c or rx_c again when returning an error here. So
> I don't think there's a reason to clear them.

Will drop that

> >  static int geni_i2c_remove(struct platform_device *pdev)
> >  {
> >  	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
> >  
> > +	release_gpi_dma(gi2c);
> 
> Your i2c devices aren't torn down until i2c_del_adapter(), so you might
> still end up trying to use the two channels here, after releasing them.
> 
> In other words, I think you should reorder these.

Agreed it should be other way round!

Thanks
-- 
~Vinod
