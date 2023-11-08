Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C21A7E527C
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 10:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234723AbjKHJPT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 04:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbjKHJPS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 04:15:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA639F
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 01:15:16 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93DCC433C8;
        Wed,  8 Nov 2023 09:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699434916;
        bh=5z46JzewW4JkuVFeJhCJrEHmfqrF1plBD2meGxNQQlg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iewxRfF2KkrvDWnu+TtzNtv1b56xpZlW0KhcCLsLJNqQvObgko+Z4rCm/oMrexy8I
         TmtI7UGlyhPRdJw9jox4rPXeLdXOW4MvnuqKyvq+Tcyxy/VQZIF6iJFncQ8eyMSRNz
         reeia9fQGa2OmFDUThM6sCmitldpJ3st3kkRzFRrc7sBtGCJ/WRRYQ8HglYAnni15g
         m9ARQr6aiKmOUKv7lAoPm/PCN3QmDoiv/PS4pGHHYseWgVV621RP/buocVwtWjB55d
         GPbr91U5KBBnIV/C+8jBQpvJw/r4fv97I12Z8qKazABlh7ejjjOUiAgOx4hS0dzp6g
         9i1qI3+jWs/QA==
Date:   Wed, 8 Nov 2023 10:15:13 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/1] i2c: lpi2c: use clk notifier for rate changes
Message-ID: <20231108091513.6ddwhu6o6lbvvmag@zenone.zhora.eu>
References: <20231107141201.623482-1-alexander.stein@ew.tq-group.com>
 <20231107212049.csimqzzvim5uecpa@zenone.zhora.eu>
 <22082032.EfDdHjke4D@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22082032.EfDdHjke4D@steina-w>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alexander,

On Wed, Nov 08, 2023 at 07:46:12AM +0100, Alexander Stein wrote:
> Am Dienstag, 7. November 2023, 22:20:49 CET schrieb Andi Shyti:
> > is it my mail client not working or is is your patch that has
> > gone through something terribly bad?
> 
> I can't see anything obviously wrong. Can you elaborate?

If you see your part in my reply down here you see that some
parts are missing. Perhaps there is a bug in lei that has missed
the top part of your patch because in lore I see that, indeed,
there is nothing wrong with your mail.

Andi

> Thanks
> Alexander
> 
> > Andi
> > 
> > On Tue, Nov 07, 2023 at 03:12:01PM +0100, Alexander Stein wrote:
> > > * CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
> > > 
> > >  static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
> > >  {
> > > 
> > > @@ -207,7 +224,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct
> > > *lpi2c_imx)> 
> > >  	lpi2c_imx_set_mode(lpi2c_imx);
> > > 
> > > -	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
> > > +	clk_rate = atomic_read(&lpi2c_imx->rate_per);
> > > 
> > >  	if (!clk_rate)
> > >  	
> > >  		return -EINVAL;
> > > 
> > > @@ -590,6 +607,27 @@ static int lpi2c_imx_probe(struct platform_device
> > > *pdev)> 
> > >  	if (ret)
> > >  	
> > >  		return ret;
> > > 
> > > +	lpi2c_imx->clk_change_nb.notifier_call = lpi2c_imx_clk_change_cb;
> > > +	ret = devm_clk_notifier_register(&pdev->dev, lpi2c_imx->clks[0].clk,
> > > +					 &lpi2c_imx->clk_change_nb);
> > > +	if (ret)
> > > +		return dev_err_probe(&pdev->dev, ret,
> > > +				     "can't register peripheral clock 
> notifier\n");
> > > +	/*
> > > +	 * Lock the clock rate to avoid rate change between clk_get_rate() 
> and
> > > +	 * atomic_set()
> > > +	 */
> > > +	ret = clk_rate_exclusive_get(lpi2c_imx->clks[0].clk);
> > > +	if (ret)
> > > +		return dev_err_probe(&pdev->dev, ret,
> > > +				     "can't lock I2C peripheral clock 
> rate\n");
> > > +
> > > +	atomic_set(&lpi2c_imx->rate_per, clk_get_rate(lpi2c_imx-
> >clks[0].clk));
> > > +	clk_rate_exclusive_put(lpi2c_imx->clks[0].clk);
> > > +	if (!atomic_read(&lpi2c_imx->rate_per))
> > > +		return dev_err_probe(&pdev->dev, -EINVAL,
> > > +				     "can't get I2C peripheral clock 
> rate\n");
> > > +
> > > 
> > >  	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
> > >  	pm_runtime_use_autosuspend(&pdev->dev);
> > >  	pm_runtime_get_noresume(&pdev->dev);
> 
> 
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
> 
> 
