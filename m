Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C05C54D0AB
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jun 2022 20:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357934AbiFOSIp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 14:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357824AbiFOSIZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 14:08:25 -0400
X-Greylist: delayed 392 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Jun 2022 11:08:20 PDT
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41C22CDDF;
        Wed, 15 Jun 2022 11:08:20 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4LNY612pVczB6;
        Wed, 15 Jun 2022 20:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1655316105; bh=Qlj8vZLxK6jMlUOlp+k6Y3l54kWTL/nElyfzEw7brv8=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=VvFyJEA/pCKMQ4hK9Fktm+97n7S48+Diqj/v6IpTq00nWkdEOw6mfdyKnlecsJD6j
         jYzFD8s3vVEUihEuGVsw4fqrNGF9KaYemSmRRLFK2ztQsUM6q0IRiO6se0QeBLPYBJ
         q4c01+aztUsDRFBUa/RBMZxf0mOPddVbIix9X3E7iqa/oO7s1DV2s9Bg5Qb0jFsDUU
         dqJfRfnkrPczbTdavLgGS+EV2XIQGaEO7AH459cels2qnfovIdtPVWKDCupYDiC6uu
         gCx/xZvAiIDjL58PNXgWAoG2zHj+vbuRRlRrXcntbT4s1L1rlIsdM9+SlE5VstLMuW
         c2qkRaYfcSQNA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.6 at mail
Date:   Wed, 15 Jun 2022 20:01:41 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: core: fix potential use-after-free on adapter
 removal
Message-ID: <YqoehVjd5qgEYSen@qmqm.qmqm.pl>
References: <a9dc272e4e06db661125b7b4c330821b532afc4d.1642209079.git.mirq-linux@rere.qmqm.pl>
 <YqjlZuFGl0dAUZyd@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqjlZuFGl0dAUZyd@shikoro>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 14, 2022 at 09:45:42PM +0200, Wolfram Sang wrote:
> Hi Micha³,
> 
> I finally had a look at your patch...
> 
> > put_device(&adap->dev) might free the memory pointed to by `adap`,
> > so we shouldn't read adap->owner after that.
> > 
> > Fix by saving module pointer before calling put_device().
> 
> ... and found a different approach for this problem from 2019:
> 
> http://patchwork.ozlabs.org/project/linux-i2c/patch/1577439272-10362-1-git-send-email-vulab@iscas.ac.cn/
> 
> I think this is also proper. I found other subsystems in the kernel
> first putting the module, then the device. Do you see problems with the
> above patch?
> 
> Thanks for looking into the issue!

Hi!

I looked briefly at the kobject machinery and it seems to ignore module
dependencies. So while both approaches might work, I'd usually reverse
the order the init code is using: in this case module_get+device_get,
so on release: device_put+module_put. I don't know what keeps the kernel
from unloading the module after module_put() and before the function
returns, but I assume that would blow up for both patches.

Best Regards
Micha³ Miros³aw

> > 
> > Signed-off-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>
> > ---
> >  drivers/i2c/i2c-core-base.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 2c59dd748a49..5d694f8ce9ef 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -2464,11 +2464,14 @@ EXPORT_SYMBOL(i2c_get_adapter);
> >  
> >  void i2c_put_adapter(struct i2c_adapter *adap)
> >  {
> > +	struct module *owner;
> > +
> >  	if (!adap)
> >  		return;
> >  
> > +	owner = adap->owner;
> >  	put_device(&adap->dev);
> > -	module_put(adap->owner);
> > +	module_put(owner);
> >  }
> >  EXPORT_SYMBOL(i2c_put_adapter);
> >  
> > -- 
> > 2.30.2
> > 



-- 
Micha³ Miros³aw
