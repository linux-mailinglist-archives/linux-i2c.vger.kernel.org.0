Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA0F399FBB
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 13:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFCL0Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 07:26:24 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3138 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhFCL0Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Jun 2021 07:26:24 -0400
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FwjsQ0W5sz6J9TD;
        Thu,  3 Jun 2021 19:12:10 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 13:24:37 +0200
Received: from localhost (10.52.126.9) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 3 Jun 2021
 12:24:37 +0100
Date:   Thu, 3 Jun 2021 12:24:36 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Jonathan Cameron <jic23@kernel.org>, <linux-iio@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Tom Rix <trix@redhat.com>,
        Sean Nyekjaer <sean@geanix.com>
Subject: Re: [PATCH] i2c: core: Add stub for i2c_verify_client() if
 !CONFIG_I2C
Message-ID: <20210603122436.00003539@Huawei.com>
In-Reply-To: <YK//xmqZCZRT1VVD@kunai>
References: <20210526174436.2208277-1-jic23@kernel.org>
        <YK//xmqZCZRT1VVD@kunai>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.126.9]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 27 May 2021 22:23:34 +0200
Wolfram Sang <wsa@kernel.org> wrote:

> Hi Jonathan,
> 
> > Fixes: 68068fad0e1c ("iio: accel: fxls8962af: fix errata bug E3 - I2C burst reads")
> > Cc: Sean Nyekjaer <sean@geanix.com>
> > Cc: Wolfram Sang <wsa@kernel.org>
> > ---
> > 
> > Note the broken patch is only in the IIO/togreg branch at the moment.  
> 
> Then the fixes tag should be removed. It is only for upstream commits.

Ok, so that is there because my assumption was that mostly like I'd take
this patch through IIO, in which case it's directly valid and necessary
for backport information purposes.  I'm guessing this one is unlikely to
cause merge conflicts given how localized it is...

You would do an immutable branch that I can pull into IIO. I'd really like
to avoid rebasing the IIO tree unless absolutely necessary as people are
working on top if it.
 
> It means we will have a merge dependency the next cycle, so I will send
> my pull request early.

Doesn't work.  There is a high chance the original patch will get ported
back to earlier kernels and there is no reference to let anyone know they
also need this one to avoid potential build issues on the stable kernel.

So, if you want to take this through I2C, the path forwards would be.
1) You take this one through I2C
2) I apply the original fix (which #ifdefs the relevant code out in the
   driver).
3) Once (1) is in mainline next cycle, I can revert (2) on the basis
   it is no longer necessary.

I'm fine with doing it this way as it avoids any cross dependencies.

> 
> > 
> >  include/linux/i2c.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index e8f2ac8c9c3d..aa52738b9c46 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -343,7 +343,14 @@ struct i2c_client {
> >  };
> >  #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
> >  
> > +#if IS_ENABLED(CONFIG_I2C)  
> 
> Hmm, can't we move this into an already existing IS_ENABLED block?

There aren't any similar #if / #else blocks for CONFIG_I2C in i2c.h
so it seemed neater to just add one around this individual element
and not destroy the general organization of the file.

Jonathan



> 
> 

