Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5DC032E2F1
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Mar 2021 08:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbhCEH3J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Mar 2021 02:29:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbhCEH3I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Mar 2021 02:29:08 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE71C061574
        for <linux-i2c@vger.kernel.org>; Thu,  4 Mar 2021 23:29:07 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id z5so970885plg.3
        for <linux-i2c@vger.kernel.org>; Thu, 04 Mar 2021 23:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RJoz/8xuDCJn1f9evq2zlHAytdLjrLobtmu0nkHCwbg=;
        b=TBHbltnZBZc++36r9UEUY16jIwGw4e0u7Qr7AX4CBDuXojJjSaVhRBrLcwVeEnvuYM
         vZ4zoMdGgT1vein2UTjG0jydvKjd3fIQsap/SyQQLoLD7k1h4CmvnW9kO1ZpWYaLi1u1
         Lz7D+hatp82zsVmRvdqo2MF2Cz0l99jMGOZTmVBolpFHT5zTrK2jQdyeHeQ9kwR6K6We
         vt4/qr5fOZvydmKOavm/fA+t+eVXHE3iohAiYtSHr28O98nYrSD9VxOlp0WwzIp+EXdc
         EEDbjxPHpXl5HoSvB5hPTpTW7+1ZKfEjI+om33Eu0K/bRcZqMRSrWHBFYuUZc5CCIYJ6
         LyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RJoz/8xuDCJn1f9evq2zlHAytdLjrLobtmu0nkHCwbg=;
        b=D+PKUvs2h2giR/slPnmV+rxJPY4HCD78PoeIrjr2pABUoWj1fsz4HZMj3YN9JQxCQS
         qGVWwEjoGMVXdWSu199pJ8AQIL980F8Q63tvWkpaFVsGm00OM6UxBA7uyCMMyAHG4dGP
         wCCFzn88M84BccBDbedGjETNzBjnsaJx3bsPjMxM9r75R5gKQrpmUj7GOE6fVv9UXJFf
         SInc1SWcK29xx/Zey9wC5WlzPYWVPWxAvqZDJyyHHwmf7RfOYQL5eeohed4eG/Ov56MT
         6XQZ3E/qtB+PGaNci9YvCUTfDutKfww8XS0eTYvLwkpJJdDRhzIntyLXHGO4wD7j7SzQ
         3CBQ==
X-Gm-Message-State: AOAM533DBGAXscCFhHKsBdIwrdOXOs2tEksp5zF+HmZPvfztmeZxYobx
        CkxGcTZjkVLBL5dZ3xEaiwZChA==
X-Google-Smtp-Source: ABdhPJxxVS/BKMTQ9yyg/c/FmK2TvdRibGSYf/HjxTK0BDLpIPbJa1fInXZbCLziPAKufN0GFhxoZw==
X-Received: by 2002:a17:902:ed0c:b029:e5:d0a4:9793 with SMTP id b12-20020a170902ed0cb02900e5d0a49793mr7580316pld.10.1614929346694;
        Thu, 04 Mar 2021 23:29:06 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id q15sm1403567pfk.181.2021.03.04.23.29.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 23:29:05 -0800 (PST)
Date:   Fri, 5 Mar 2021 12:59:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v6] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210305072903.wtw645rukmqr5hx5@vireshk-i7>
References: <9a2086f37c0a62069b67c39a3f75941b78a0039c.1614749417.git.jie.deng@intel.com>
 <20210304060638.7qes424vvdmptz5c@vireshk-i7>
 <f3f4aaf8-521c-3e9e-4757-97f2e33e44f6@intel.com>
 <20210305030916.trb35i53rzwf6kyn@vireshk-i7>
 <669d3c4e-d69b-1e0d-6625-ce7d0832c108@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <669d3c4e-d69b-1e0d-6625-ce7d0832c108@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05-03-21, 15:00, Jie Deng wrote:
> On 2021/3/5 11:09, Viresh Kumar wrote:
> > On 05-03-21, 09:46, Jie Deng wrote:
> > > On 2021/3/4 14:06, Viresh Kumar wrote:
> > > > > +	mutex_lock(&vi->i2c_lock);
> > > > I have never worked with i2c stuff earlier, but I don't think you need a lock
> > > > here. The transactions seem to be serialized by the i2c-core by itself (look at
> > > > i2c_transfer() in i2c-core-base.c), though there is another exported version
> > > > __i2c_transfer() but the comment over it says the callers must take adapter lock
> > > > before calling it.
> > > Lock is needed since no "lock_ops" is registered in this i2c_adapter.
> > drivers/i2c/i2c-core-base.c:
> > 
> > static int i2c_register_adapter(struct i2c_adapter *adap)
> > {
> >          ...
> > 
> >          if (!adap->lock_ops)
> >                  adap->lock_ops = &i2c_adapter_lock_ops;
> > 
> >          ...
> > }
> > 
> > This should take care of it ?
> 
> 
> The problem is that you can't guarantee that adap->algo->master_xfer is only
> called
> from i2c_transfer. Any function who holds the adapter can call
> adap->algo->master_xfer
> directly. So I think it is safer to have a lock in virtio_i2c_xfer.

So I tried to look for such callers in the kernel.

$ git grep -l "\<master_xfer(" 
Documentation/i2c/dev-interface.rst
drivers/gpu/drm/gma500/intel_gmbus.c
drivers/gpu/drm/gma500/psb_intel_sdvo.c
drivers/gpu/drm/i915/display/intel_gmbus.c
drivers/gpu/drm/i915/display/intel_sdvo.c
drivers/i2c/busses/i2c-iop3xx.c
drivers/i2c/i2c-core-base.c
drivers/media/usb/dvb-usb/dw2102.c
drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
drivers/mfd/88pm860x-i2c.c
include/uapi/linux/i2c.h

Out of these only one caller is not registering the adapter itself.

drivers/mfd/88pm860x-i2c.c

I was expecting everyone to call the generic functions provided by the i2c core,
not sure why this ended up calling the master_xfer stuff directly.

So this should be general practice to go via i2c core I believe, unless I am
missing something here.

Wolfram, can you please clarify if locking is required here or not ?

> > > > > +static struct i2c_adapter virtio_adapter = {
> > > > > +	.owner = THIS_MODULE,
> > > > > +	.name = "Virtio I2C Adapter",
> > > > > +	.class = I2C_CLASS_DEPRECATED,
> > > > Why are we using something that is deprecated here ?
> > > Warn users that the adapter doesn't support classes anymore.
> > So this is the right thing to do? Or this is what we expect from new drivers?
> > Sorry, I am just new to this stuff and so...
> 
> 
> https://patchwork.ozlabs.org/project/linux-i2c/patch/20170729121143.3980-1-wsa@the-dreams.de/

Frankly this confused me even further :)

The earlier comment in the code said:
        "/* Warn users that adapter will stop using classes */"

so this looks more for existing drivers..

Then the commit message says this:

        "Hopefully making clear that it is not needed for new drivers."

and comment says:

        "/* Warn users that the adapter doesn't support classes anymore */"

Reading this it looks this is only required for existing adapters so they can
warn userspace and shouldn't be required for new drivers.

Am I reading it incorrectly ?

-- 
viresh
