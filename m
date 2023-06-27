Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC4AE73FCE4
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jun 2023 15:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjF0Nd3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jun 2023 09:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjF0Nd2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jun 2023 09:33:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705BB2D53;
        Tue, 27 Jun 2023 06:33:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 02FE5611A1;
        Tue, 27 Jun 2023 13:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EABC433C0;
        Tue, 27 Jun 2023 13:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687872806;
        bh=hU/bbFYDxlazJtaG0Aky+dV6lWTbtVrya1pQRCRiTcs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lRCpUOcgDLM5IsK6PYe4oGTEfki9RNeEaJeti5s+B+D2DmBrQJG24uumr+Qu+xnq9
         NK6l4xpK09ScsXXxHQcm90Lqhi3L42FzaduuBHdCCOQ+haTaZcJP0wjd7ZjTiXBhsm
         Ybk9lkD8iWS9I3dH7WNi5wSyCSIVDzIcoqLgdfBeKBc2Kc/cJ5jO4XMF7BEAjIXqmq
         AIFPUm90kBWNf2B9XwWoZcHaSDC0rxHoAWpuyTa5LUCM7mNXRNbeFkcAjRNuinVUuR
         GMHVF+CmP8uEM7h1VoHpPQQro3bzpyAoKg9EpHhP6SpOVdTygQwFQ9oPXHr5mpcsOm
         B9uKvsSZic8CA==
Date:   Tue, 27 Jun 2023 15:33:22 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: sun6i-p2wi: Fix an error message in probe()
Message-ID: <20230627133322.szotkthwsfwgkdby@intel.intel>
References: <98afbc28-3366-459e-bd01-f77cf1a67fe9@moroto.mountain>
 <20230627115920.c4ms65vgrbiyekc6@intel.intel>
 <7c6db53c-427d-4ba5-80b7-a069ab9322a0@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c6db53c-427d-4ba5-80b7-a069ab9322a0@kadam.mountain>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dan,

On Tue, Jun 27, 2023 at 03:08:53PM +0300, Dan Carpenter wrote:
> On Tue, Jun 27, 2023 at 01:59:20PM +0200, Andi Shyti wrote:
> > Hi Dan,
> > 
> > On Tue, Jun 27, 2023 at 10:12:36AM +0300, Dan Carpenter wrote:
> > > The "ret" variable is uninitialized.  It was the "p2wi->rstc" variable
> > > that was intended.  We can also use the %pe string format to print the
> > > error code name instead of just the number.
> > > 
> > > Fixes: 75ff8a340a81 ("i2c: sun6i-p2wi: Use devm_clk_get_enabled()")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/i2c/busses/i2c-sun6i-p2wi.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> > > index ad8270cdbd3e..fa6020dced59 100644
> > > --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> > > +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> > > @@ -250,7 +250,8 @@ static int p2wi_probe(struct platform_device *pdev)
> > >  
> > >  	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
> > >  	if (IS_ERR(p2wi->rstc)) {
> > > -		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
> > > +		dev_err(dev, "failed to retrieve reset controller: %pe\n",
> > > +			p2wi->rstc);
> > 
> > Yes, good catch! Thanks! But I think we want to print the error
> > value here, so I think it should be:
> > 
> > -		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
> > +		dev_err(dev, "failed to retrieve reset controller: %d\n",
> > +			PTR_ERR(p2wi->rstc));
> > 
> 
> The %pe which I changed it to is a cool new thing that prints:
> 
> 	failed to retrieve reset controller: -EINVAL\n

oh... that's right! Sorry, I didn't know about it! Then,
definitely:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

> We should create a similar %e printk format that works for ints instead
> of error pointers.  But instead of that you have people who cast error
> codes to pointers just to get the %pe functionality.  And other people
> who make suggestions (this is the catagory that I'm in) but are too lazy
> to do the actual work.

Ahaha... that's right! It's indeed a nice feature to have. Let me
see if I manage to scratch a few hours out of my time.

Andi
