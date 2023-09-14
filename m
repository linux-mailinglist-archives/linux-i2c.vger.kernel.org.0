Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C651379FFA4
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 11:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237094AbjINJIl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 05:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237110AbjINJI1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 05:08:27 -0400
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481A32D64;
        Thu, 14 Sep 2023 02:07:59 -0700 (PDT)
Received: from local
        by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
         (Exim 4.96)
        (envelope-from <daniel@makrotopia.org>)
        id 1qgiKE-0006O5-1c;
        Thu, 14 Sep 2023 09:07:50 +0000
Date:   Thu, 14 Sep 2023 10:07:36 +0100
From:   Daniel Golle <daniel@makrotopia.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Qii Wang <qii.wang@mediatek.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        =?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: Re: [PATCH] i2c: mt65xx: allow optional pmic clock
Message-ID: <ZQLNWHKlIZNd7x4l@makrotopia.org>
References: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
 <0fd097fd-9fdb-9001-cddb-7a396fde28bb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fd097fd-9fdb-9001-cddb-7a396fde28bb@collabora.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 13, 2023 at 04:00:53PM +0200, AngeloGioacchino Del Regno wrote:
> Il 27/08/23 04:13, Daniel Golle ha scritto:
> > Using the I2C host controller on the MT7981 SoC requires 4 clocks to
> > be enabled. One of them, the pmic clk, is only enabled in case
> > 'mediatek,have-pmic' is also set which has other consequences which
> > are not desired in this case.
> > 
> > Allow defining a pmic clk even in case the 'mediatek,have-pmic' propterty
> > is not present and the bus is not used to connect to a pmic, but may
> > still require to enable the pmic clock.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >   drivers/i2c/busses/i2c-mt65xx.c | 12 ++++++++----
> >   1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > index 1a9b5a068ef1b..a8b5719c33729 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -1442,15 +1442,19 @@ static int mtk_i2c_probe(struct platform_device *pdev)
> >   	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk))
> >   		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk);
> > +	i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get_optional(&pdev->dev, "pmic");
> > +	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
> > +		dev_err(&pdev->dev, "cannot get pmic clock\n");
> > +		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);
> > +	}
> > +
> >   	if (i2c->have_pmic) {
> 
> ...but you're not changing speed_clk if !i2c->have_pmic, I'm not sure that
> this will work correctly. Perhaps you wanted to also set speed_clk if the
> clock is present?

No, if I wanted that I could have used the existing 'mediatek,have-pmic'
property -- however, all needed e.g. on MT7981 is to make sure the
clock is enabled, but still use I2C_MT65XX_CLK_MAIN as speed_clk.

> 
> if (IS_ERR...) {
> 	error handling
> } else if (clk is present)
> 	speed_clk = I2C_MT65XX_CLK_PMIC;
> 
> if (have_pmic && !clk_is_present)
> 	error
> 
> Regards,
> Angelo
> 
> > -		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get(&pdev->dev, "pmic");
> > -		if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
> > +		if (!i2c->clocks[I2C_MT65XX_CLK_PMIC].clk) {
> >   			dev_err(&pdev->dev, "cannot get pmic clock\n");
> > -			return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);
> > +			return -ENODEV;
> >   		}
> >   		speed_clk = I2C_MT65XX_CLK_PMIC;
> >   	} else {
> > -		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = NULL;
> >   		speed_clk = I2C_MT65XX_CLK_MAIN;
> >   	}
> 
> 
