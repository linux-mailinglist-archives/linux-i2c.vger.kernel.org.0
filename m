Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C8439A14B
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 14:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbhFCMom (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 08:44:42 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3140 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhFCMol (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Jun 2021 08:44:41 -0400
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Fwlgd0vpPz6S1Rt;
        Thu,  3 Jun 2021 20:33:49 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 14:42:55 +0200
Received: from localhost (10.52.124.195) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 3 Jun 2021
 13:42:54 +0100
Date:   Thu, 3 Jun 2021 13:42:53 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Jonathan Cameron <jic23@kernel.org>, <linux-iio@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Tom Rix <trix@redhat.com>,
        Sean Nyekjaer <sean@geanix.com>
Subject: Re: [PATCH] i2c: core: Add stub for i2c_verify_client() if
 !CONFIG_I2C
Message-ID: <20210603134253.000012a8@Huawei.com>
In-Reply-To: <YLjDT1sxNm9ehjey@shikoro>
References: <20210526174436.2208277-1-jic23@kernel.org>
        <YK//xmqZCZRT1VVD@kunai>
        <20210603122436.00003539@Huawei.com>
        <YLjDT1sxNm9ehjey@shikoro>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.124.195]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 3 Jun 2021 13:55:59 +0200
Wolfram Sang <wsa@kernel.org> wrote:

> Hi Jonathan
> 
> > Ok, so that is there because my assumption was that mostly like I'd take
> > this patch through IIO, in which case it's directly valid and necessary
> > for backport information purposes.  I'm guessing this one is unlikely to
> > cause merge conflicts given how localized it is...  
> 
> I see. Makes sense.
> 
> > You would do an immutable branch that I can pull into IIO. I'd really like
> > to avoid rebasing the IIO tree unless absolutely necessary as people are
> > working on top if it.  
> 
> Sure, let's avoid rebasing.
> 
> > Doesn't work.  There is a high chance the original patch will get ported
> > back to earlier kernels and there is no reference to let anyone know they
> > also need this one to avoid potential build issues on the stable kernel.
> > 
> > So, if you want to take this through I2C, the path forwards would be.
> > 1) You take this one through I2C
> > 2) I apply the original fix (which #ifdefs the relevant code out in the
> >    driver).
> > 3) Once (1) is in mainline next cycle, I can revert (2) on the basis
> >    it is no longer necessary.
> > 
> > I'm fine with doing it this way as it avoids any cross dependencies.  
> 
> The other solution is that you make an immutable branch for me? IIUC,
> this would be easiest? It would work for me.

Sure, I'll do that once we've agreed a v2

> 
> > > > +#if IS_ENABLED(CONFIG_I2C)    
> > > 
> > > Hmm, can't we move this into an already existing IS_ENABLED block?  
> > 
> > There aren't any similar #if / #else blocks for CONFIG_I2C in i2c.h
> > so it seemed neater to just add one around this individual element
> > and not destroy the general organization of the file.  
> 
> Could be argued. I'd still prefer to add it at line 480 (5.13-rc3) with
> the #else branch added if you don't mind.

Sure, I'll move it.

Jonathan

> 
> Thanks and kind regards,
> 
>    Wolfram
> 
> 

