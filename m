Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B27D793657
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 09:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbjIFHeg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 03:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjIFHef (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 03:34:35 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56FCCE4A;
        Wed,  6 Sep 2023 00:34:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B087C433C7;
        Wed,  6 Sep 2023 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693985662;
        bh=+swRvv2lehuhjAGwQEHNRgZmXzxQDs3Mww6wyEFX1ko=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=TnIq9tlI+R2kFmb9qVFc9iQ6VnMHiiOJ57ahHFarRn6vJFWxSf6YtGjTnkDOAn36b
         tbimm6fFnd7fpXF/WqRxwPbpxN3uX8+jXnjdTMSyIxoDQSVD/w3bIRRGIvwdvUTXFI
         GLxHy0vdmll0w66ISdrspv4BtKJ0DNIH3L87K6DaPKRemlFhGqA5AzQHhdPM1VJvlO
         jNIyVFilTjbz1U+p3ifiWOOb3VL9I4pI0S7sWMiXGjpvLeapZfr61vXoIbEvS2SpyQ
         x/E9po6FClwYRs8B76a7vh4XKL+b7HPjwpds0tSjfhZYcbEuiS4gBVemwPl3Og5vZ5
         GsJNOLv/HlSFg==
Date:   Wed, 6 Sep 2023 09:34:17 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: rcar: add FastMode+ support
Message-ID: <20230906073417.y2xpj6o2g5r7p5nu@zenone.zhora.eu>
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-4-wsa+renesas@sang-engineering.com>
 <20230905213710.3dv5h6zvwu4tpnby@zenone.zhora.eu>
 <ZPgl4eLYTyDFXiyC@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPgl4eLYTyDFXiyC@shikoro>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> > > @@ -217,7 +228,17 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
> > >  	rcar_i2c_write(priv, ICMCR, MDBS);
> > >  	rcar_i2c_write(priv, ICMSR, 0);
> > >  	/* start clock */
> > > -	rcar_i2c_write(priv, ICCCR, priv->icccr);
> > > +	if (priv->flags & ID_P_FMPLUS) {
> > > +		rcar_i2c_write(priv, ICCCR, 0);
> > > +		rcar_i2c_write(priv, ICMPR, priv->clock_val);
> > > +		rcar_i2c_write(priv, ICHPR, 3 * priv->clock_val);
> > > +		rcar_i2c_write(priv, ICLPR, 3 * priv->clock_val);
> > > +		rcar_i2c_write(priv, ICCCR2, FMPE | CDFD | HLSE | SME);
> > > +	} else {
> > > +		rcar_i2c_write(priv, ICCCR, priv->clock_val);
> > > +		if (priv->devtype >= I2C_RCAR_GEN3)
> > > +			rcar_i2c_write(priv, ICCCR2, 0);
> > 
> > is this last bit part of the FM+ enabling or is it part of the
> > GEN4 support?
> 
> It is "disabling FM+" for lower speeds. Since we never used ICCCR2
> before FM+, we need to make sure it is cleared properly.

OK... I'm missing some hardware details here :)

> > > +		for (scgd = 0; scgd < 0x40; scgd++) {
> > > +			scl = ick / (20 + (scgd * 8) + round);
> > > +			if (scl <= t.bus_freq_hz)
> > > +				break;
> > > +		}
> > > +
> > > +		if (scgd == 0x40) {
> > 
> > would be nice to give a meaning to this 0x40 constant... either
> > having it in a define or a comment, at least.
> 
> This code existed before and was just moved into an if-body. It will be
> updated in another series following this one.

OK, thanks!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
