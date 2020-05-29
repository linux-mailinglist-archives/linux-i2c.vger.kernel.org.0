Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C67011E8708
	for <lists+linux-i2c@lfdr.de>; Fri, 29 May 2020 20:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgE2S63 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 14:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgE2S62 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 May 2020 14:58:28 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B48AC03E969;
        Fri, 29 May 2020 11:58:28 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e4so534177ljn.4;
        Fri, 29 May 2020 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Cu18taknHbe/FbD9yOGPOycvyvQ+EsO0Ye+2x5fPqno=;
        b=FVPKo3yGU/mqVlof1F0Z4UeYJc9h5xv7/3XxCkDtBAAKy6ndK3q+aMFXbt9ZgXKo+a
         RjWfLlgoHohemD0C+CcKo4DZF1SN+Hd87TNBq/Pzk5LACsVyZvjFmy7Z+0CE0/KSaRVd
         VtTEzv/an3wNcUdmNGjjT7Xr0whgTHsGns7eu9m7BN9ixJM5RTezvL5BlUsaToD2bivY
         koARdORhLmLdVBhjYa2TSPy4O94JBRajg0V+KiuubXrEl3zUK7GvYqfO9bSKl4E8mpJq
         NMdVIsio7ddwg1yhS73Rgt9gnRDG40Nr6o1/d8HodgZ8dHd86pIxeS4+5x7K9oxa48iM
         gLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cu18taknHbe/FbD9yOGPOycvyvQ+EsO0Ye+2x5fPqno=;
        b=SDPgCHwIRpVOsLiDAvx3sETuZ7p6P6C3EgLbMjWLCyoynebZ9N3+TRqyVmcyiVYbc0
         /kOeQWrWm7jGHA/vrHEBkiL1lcmA7peIYqj2YMT/BuOJhfBLOvRLwiVrBb24wa8ly9xX
         FQIrZzyWYLB2mE4FDmiNpwJvloMp25mS6ytxxktjePDIu45AIq2Fx0LS30+UuUOabgx0
         bh1QVsuyHxZmhtOmQQrFeIHQO+xx77VjdCSj+9uS3GLVUSuU9k6kpJ7t/WwctjsEaGvB
         FQgzByaRVgDVRngwBxxWRJItSaW5bkAYUgC6lKPN9KqSqv9/Bdn84d9rFALUiDMiHwp4
         0PfA==
X-Gm-Message-State: AOAM530E8wdQXzas+2vjgQ8R9dLYA8Rddy83Og1fiOf3Z9EgYFnIZkmE
        aSbRowZPKG+KxP3ptPJ99EM=
X-Google-Smtp-Source: ABdhPJwOPjYAcHWCc0NuNTt+necJgZaSRwtcOXXAuB93AaP9HMLV/49dJxDvmDNMLS9f08cR0TweJw==
X-Received: by 2002:a2e:8956:: with SMTP id b22mr5129992ljk.16.1590778706764;
        Fri, 29 May 2020 11:58:26 -0700 (PDT)
Received: from mobilestation ([95.79.222.123])
        by smtp.gmail.com with ESMTPSA id q4sm2425667lfm.93.2020.05.29.11.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 11:58:26 -0700 (PDT)
Date:   Fri, 29 May 2020 21:58:24 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Rob Herring <robh@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/11] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
Message-ID: <20200529185824.o2vcpxe4f63aw465@mobilestation>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-3-Sergey.Semin@baikalelectronics.ru>
 <20200527153351.rmzguymz7lm6gvsx@mobilestation>
 <20200529181338.GA2676189@bogus>
 <20200529182256.3bp4uvvrvz3ddlrq@mobilestation>
 <20200529184201.GX1634618@smile.fi.intel.com>
 <20200529184534.wyyv5i7hcto5y3d3@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529184534.wyyv5i7hcto5y3d3@mobilestation>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 29, 2020 at 09:45:37PM +0300, Serge Semin wrote:
> On Fri, May 29, 2020 at 09:42:01PM +0300, Andy Shevchenko wrote:
> > On Fri, May 29, 2020 at 09:22:56PM +0300, Serge Semin wrote:
> > > On Fri, May 29, 2020 at 12:13:38PM -0600, Rob Herring wrote:
> > > > On Wed, May 27, 2020 at 06:33:51PM +0300, Serge Semin wrote:
> > 
> > > > you're sending 
> > > > new versions too fast. Give people time to review.
> > > 
> > > Yeah, you did. Sorry for sending the new versions very fast. Normally I prefer
> > > to keep up with comments so to past a particular maintainer review as fast as
> > > possible without long delays. In my experience the longer you wait, the lesser
> > > maintainers remember about your patchset, the harder for one to continue the
> > > next versions review.
> > 
> 

> > Documentation/process/submitting-patches.rst:
> > 
> > "Wait for a minimum of one week before resubmitting or pinging reviewers -
> > possibly longer during busy times like merge windows."
> 
> Good to know what I already know.) How much do you personally wait before
> resubmitting? In my experience reviewing your DW APB GPIO patches, no longer
> than a few hours.

Moreover the statement you cited is about the patches, which doesn't get any
attention from the maintainers/reviewers for quite some time. In this case I
normally resubmit the patches no sooner than a week. I was talking about the
situation when you get the review comments, which need to be addressed.

-Sergey

> 
> -Sergey
> 
> > 
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> > 
