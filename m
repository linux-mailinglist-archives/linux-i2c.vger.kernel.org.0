Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 523B06E07F3
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 09:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjDMHkd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 13 Apr 2023 03:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjDMHkb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 03:40:31 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8690183E5;
        Thu, 13 Apr 2023 00:40:29 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7F47080F0;
        Thu, 13 Apr 2023 07:40:28 +0000 (UTC)
Date:   Thu, 13 Apr 2023 10:40:27 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Vignesh R <vigneshr@ti.com>, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Improve error reporting for problems during
 .remove()
Message-ID: <20230413074027.GC36234@atomide.com>
References: <20230403054837.6lxyzznzntvw2drg@pengutronix.de>
 <20230403060404.GX7501@atomide.com>
 <ZC5qUU4JLI9Negyi@sai>
 <20230406082354.jwchbl5ir6p4gjw7@pengutronix.de>
 <20230413051222.GA9837@atomide.com>
 <20230413062440.yixne5wqed4zrva4@pengutronix.de>
 <20230413063915.GA36234@atomide.com>
 <20230413070745.mpcqpqokqspzavca@pengutronix.de>
 <20230413071124.GB36234@atomide.com>
 <20230413073716.usr2r7kzw52z5n5l@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20230413073716.usr2r7kzw52z5n5l@pengutronix.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

* Uwe Kleine-König <u.kleine-koenig@pengutronix.de> [230413 07:37]:
> Hello Tony,
> 
> On Thu, Apr 13, 2023 at 10:11:24AM +0300, Tony Lindgren wrote:
> > * Uwe Kleine-König <u.kleine-koenig@pengutronix.de> [230413 07:07]:
> > > On Thu, Apr 13, 2023 at 09:39:15AM +0300, Tony Lindgren wrote:
> > > > Oh OK. Care to clarify a bit why we are not allowed to return errors
> > > > on remove though? Are we getting rid of the return value for remove?
> > > > Sorry if I'm not following the cunning plan here :)
> > > 
> > > Yes, that's the plan. If you look at the caller of the remove functions
> > > (before 5c5a7680e67ba6fbbb5f4d79fa41485450c1985c):
> > > 
> > > static void platform_remove(struct device *_dev)
> > > {
> > >         struct platform_driver *drv = to_platform_driver(_dev->driver);
> > >         struct platform_device *dev = to_platform_device(_dev);
> > > 
> > >         if (drv->remove) {
> > >                 int ret = drv->remove(dev);
> > > 
> > >                 if (ret)
> > >                         dev_warn(_dev, "remove callback returned a non-zero value. This will be ignored.\n");
> > >         }
> > >         dev_pm_domain_detach(_dev, true);
> > > }
> > > 
> > > you see it's pointless to return an error value. But the prototype
> > > seduces driver authors to do it yielding to error that can easily
> > > prevented if .remove returns void. See also
> > > 5c5a7680e67ba6fbbb5f4d79fa41485450c1985c for some background and details
> > > of the quest.
> > 
> > OK thanks. So maybe check the pm_runtime_get_sync() and on error do
> > pm_runtime_put_noidle(), or pm_runtime_resume_and_get(). Both ways
> > are fine for me, maybe you already figured it out.
> 
> Is this an Ack for my patch?

Yes looking at it again:

Reviewed-by: Tony Lindgren <tony@atomide.com>

Thanks,

Tony
