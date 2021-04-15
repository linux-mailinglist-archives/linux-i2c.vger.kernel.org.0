Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E7336029B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 08:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhDOGqE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 02:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhDOGqE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Apr 2021 02:46:04 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4AFEC061756
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 23:45:41 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id s14so6696720pjl.5
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 23:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ISz3TyCn2/uIV44d4r1X/5cuqYAQkTLj0NPgFtRUo2I=;
        b=ZkNXqgXt17/0WJ4uQEF9j6e/5EMQTJWO4jWtpcFp26A0tT3EGv9X7opfYTgaLaA7kN
         GJo6U3f0Id4pHUfxCIEXDZQP9NxPYLneOAYwpovFXcIw+UHB3CUIPAlaFgQvRrsoze4N
         ccHbzbI0j2UaRVNnRvCrTmbeD40PEy2ObsDc1shrBjwtRnh/FUIt994nEOcHAbNpb24H
         /c/2k2xvA4c7eg2hLT7ltJbJyeOpM+Hk0rRwk4Bcoek5J7x+OYH7nWDK6CuiqbckOU3p
         vBKsiufpBAHBwBdj9QsrdaYeX3QvoifBnoAY+dLWoVW+bUCn5aAFsi2E/CBvg9cq9ABq
         aaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ISz3TyCn2/uIV44d4r1X/5cuqYAQkTLj0NPgFtRUo2I=;
        b=fx/AL2t5r/84q/AvHmIWh7F+mR43j3YYERSYFt6acOfJ1gaQ0EJgXOWxKYU/4irF9/
         kEOfe1G9DvhmDqm/h4sXGQIkk50uoew1/BsPPKFv7pQUxR93FbVhMkcIC4e6vFtgWZhM
         iKzz6ZwSHK5S0eQfQLZxVDpDjC/PHZUzvl3MklDV6u6jUBVmdz5az3XA6Hw0IAe2AJRc
         bheLvqYqGueuYMTLYufmNn6BrV4jIowFl4imyjx7sZ1Jh03VWHAdrPh6IuUcQPa/TCiC
         znSl48p+G/6NKApYS1672UXRw5joJ2C3MXSrneazomLJZ45mUhcLlTN6n8PYfmOQkdgA
         c0VA==
X-Gm-Message-State: AOAM532FrcVyY05RF8pVqzLOVgjqqn4Pn64KRNy4GB0OPvYaIOcF309B
        ksLCbe38PnfeLSqEVGOksAiQaw==
X-Google-Smtp-Source: ABdhPJxkskB8P0tKMWapxuD4NGGfvFGy45KJl/a5vd6yWCCWrv6b9XsNU0j5YzeODTXO0B57rwGdkw==
X-Received: by 2002:a17:90a:5910:: with SMTP id k16mr2266235pji.207.1618469141190;
        Wed, 14 Apr 2021 23:45:41 -0700 (PDT)
Received: from localhost ([136.185.154.93])
        by smtp.gmail.com with ESMTPSA id p3sm1184591pfq.136.2021.04.14.23.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 23:45:40 -0700 (PDT)
Date:   Thu, 15 Apr 2021 12:15:38 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210415064538.a4vf7egk6l3u6zfz@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323072704.rgoelmq62fl2wjjf@vireshk-i7>
 <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
 <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23-03-21, 10:27, Arnd Bergmann wrote:
> I usually recommend the use of __maybe_unused for the suspend/resume
> callbacks for drivers that use SIMPLE_DEV_PM_OPS() or similar helpers
> that hide the exact conditions under which the functions get called.
> 
> In this driver, there is an explicit #ifdef in the reference to the
> functions, so
> it would make sense to use the same #ifdef around the definition.

Jie,

I was talking about this comment when I said I was expecting a new
version. I think you still need to make this change.

-- 
viresh
