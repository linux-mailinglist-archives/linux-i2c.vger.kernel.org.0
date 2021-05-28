Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848433946EA
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 20:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhE1SVW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 14:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbhE1SVW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 May 2021 14:21:22 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B98C061574
        for <linux-i2c@vger.kernel.org>; Fri, 28 May 2021 11:19:47 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id g17so4105558wrs.13
        for <linux-i2c@vger.kernel.org>; Fri, 28 May 2021 11:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ibiOPwXVSNiDA2q8g1XsrEb/Qyx2/91e4LXWDgt2JOA=;
        b=ChuJBqU5R3Vbu1cHDnKvzeXBMvasZUoLM4+yh0IuGsGax/Qv8oAe/OCt0SmBxb3sca
         QXhC50ji2n6U6vhn9IByrncKhSgO61zn9dsok/mNcOXlOFNHg0K9xM6UGhh2aK3+Au/k
         cZ17G5NwDjZwHn+YF7ofGV3Qt4wFz0MP9wW/QT7zyi+JqF9mO73buMWAHocVGW0JuX75
         dFGZSzkDMgZSBTHiJT7qc4CoUMrWGlIxLq5rd7KXQcQDZ6R58JTzROYODRuz3spIo/Z8
         IVuTwPga71KXtsluZ0dOcqaSvRVOpQmdOIFwMylTQ12jA6Bud3tQ9/+L6qEzSgDjn/Ze
         r8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ibiOPwXVSNiDA2q8g1XsrEb/Qyx2/91e4LXWDgt2JOA=;
        b=VdVp4nZgnB09jpusuYDJddonSUH1trrRZP4qQ6w/gWZLIR5dmRMZaf7WY8WH8W0pdE
         npEXNZA5r5uHy1fxN0MkifVFIN296a5FPpCbQg/aTSjAUnQMoNZR/7HwyuGAao2AidOC
         5RFmJLf4/4U3c1/hvxHjvph08Hs5y3rZwRBpakgNdPYN1Qjjprfkrbm9wo3GxEt6HbR/
         aU63H7lOeVOxmEeiG/TGjyuNSGQmKOQERszhYmqFvC+Y7paI78vGa/ph5I4vq/Y0YFTg
         6/gsd+i+bEDN1gQicTl9snthznksPsgkX+AnclHlyZ8V7jeUGfoAMN4G8NYfD5HXWJyS
         syBw==
X-Gm-Message-State: AOAM531lgsIziq/fkC0CTcnGGjvSVidTMlYLHns5YlsKDudjtAVP067K
        j7Lh4gKjixqLdlxTnfF5Jyg/OA==
X-Google-Smtp-Source: ABdhPJwc+FGSY/pN4NbMwuv7ZHYLYYTmY+qp0S3VC4hjLiHpduHRLcRu2CdRtneQk972g2IoEp4alw==
X-Received: by 2002:adf:fb87:: with SMTP id a7mr10206687wrr.58.1622225985859;
        Fri, 28 May 2021 11:19:45 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id j18sm6783692wmq.27.2021.05.28.11.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 11:19:45 -0700 (PDT)
Date:   Fri, 28 May 2021 19:19:43 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: adjust to removing i2c designware platform
 data
Message-ID: <20210528181943.GR543307@dell>
References: <20210419061809.15045-1-lukas.bulwahn@gmail.com>
 <CAHp75Vfv0FQGXrmpDveOf-cBahoDK3uSPHjPU2RNh6mhFxN7vQ@mail.gmail.com>
 <YLD/ZQiX5VhpWJg7@smile.fi.intel.com>
 <YLECsC9y8ici47Ln@kunai>
 <YLEmJVbVwQaMk+dq@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YLEmJVbVwQaMk+dq@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 28 May 2021, Andy Shevchenko wrote:

> On Fri, May 28, 2021 at 04:48:16PM +0200, Wolfram Sang wrote:
> > 
> > > > > Remove the file entry to this removed file as well.
> > > > 
> > > > Oops, I was under the impression I grepped all occurrences, but I have not.
> > > > 
> > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > 
> > > > Thanks for the catch!
> > > 
> > > Wolfram, isn't it forgotten somehow?
> > 
> > I can pick it. I refrained from doing so because Lukas explicitly asked
> > Lee to pick it.
> 
> Ah, I see. AFAIR Lee doesn't update his branch frequently, so it might be that
> he already applied that but it's not visible to Linux Next.

I'm not sure whether to find this funny or be offended.

Let's go with funny!

AFAICT, this patch does not enter my area of responsibility.

Please take it via I2C.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
