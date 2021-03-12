Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 388EC338718
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Mar 2021 09:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbhCLILU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Mar 2021 03:11:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbhCLILM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Mar 2021 03:11:12 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31CEEC061761
        for <linux-i2c@vger.kernel.org>; Fri, 12 Mar 2021 00:11:12 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so10399620pjc.2
        for <linux-i2c@vger.kernel.org>; Fri, 12 Mar 2021 00:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=D+kNVVrx+YHYefDSqVEomo1kF/7kaGYLcmPWF3F4RS8=;
        b=Ed5d9eAEViO2Ayt4QX13Rk53teVGxckyZuUWt7/xxEv3RvWLU/a1ie5G39XVbEXWyW
         LB9YYGcd4JRrZYXKNTSRWMTTtUoR99POd0vbXd4BfO3CrBzxGg9VSTyOAcP33cfUXyEi
         nQKP505ObgH2Be4L0M31mZi6nB9vbA+ZnDrZ+/M7H++KXTtMP2MfBGRYhsPzp4cY4K4m
         406TfdLEYODqOUQfl9al9vTZ7UnzK2+3UbylJ8ejfwyIMV7oDihabMmNB7M7CWgsXZnX
         8RShrOkalhPDgGcBW5mMwiQQad0e5VIyRQWFIyJTza6rBR9hT+uYEfk51iVTdDXnxry5
         0B4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D+kNVVrx+YHYefDSqVEomo1kF/7kaGYLcmPWF3F4RS8=;
        b=bbL4hESPEB6b+OIieV9kYCusZf/Wzx8wtiaZyxKOnIhd/uJ/BHy+XFmT5hTboRO1Ar
         4XiFWXqxOvuVdFwDJaNjtGBmVT56GsCOsjQR4CEbvqVMw3MNgF0yYaORnQiRDFL+oVvp
         g3iXYU83h+YsQW79KtRTaafpQYWg39lXn19eb4sSp8bij69CDtcmoiQGf/MgVmCw4sj+
         Oq+LBC8hiGjc9i747qtdWJ5H3yGLl5Z0nc26MIyqnEsLEP9WvFsOEjrbVd+hzW1tpBwa
         g8j5bA9KpLizus1I5NXuF5dLIHu4/ICPo3CgPbKTogFwmLtreJyURYpH/ANhMALe7Mkn
         yHXQ==
X-Gm-Message-State: AOAM532Qd+k7osSFk0frA43JQDsj9Y4IvA8OwqR+c+17ejI7D0LRVMr9
        f8zwf6qHLw+kawCwQgaQTXsCwA==
X-Google-Smtp-Source: ABdhPJwVlJG0NFkmTfDGmbpb9BOteI/+WDXSdepKmX4EKNZbCBhfgQNdNeIMlZ+q6xI1pnEex+nxhA==
X-Received: by 2002:a17:902:b60d:b029:e6:7a9:7f4 with SMTP id b13-20020a170902b60db02900e607a907f4mr12393786pls.3.1615536671444;
        Fri, 12 Mar 2021 00:11:11 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id q184sm4456920pfc.78.2021.03.12.00.11.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Mar 2021 00:11:10 -0800 (PST)
Date:   Fri, 12 Mar 2021 13:41:08 +0530
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
        pbonzini@redhat.com
Subject: Re: [PATCH v7] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210312081108.fvqrvb75byurt3lo@vireshk-i7>
References: <cd3b0c9138824b0a5fad9d3bc872d8836e829946.1615554673.git.jie.deng@intel.com>
 <20210312061012.slmfnhxe6y5kgrnv@vireshk-i7>
 <a97c64ea-773a-133b-c37c-cd02493e0230@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a97c64ea-773a-133b-c37c-cd02493e0230@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12-03-21, 15:51, Jie Deng wrote:
> 
> On 2021/3/12 14:10, Viresh Kumar wrote:
> > I saw your email about wrong version being sent, I already wrote some
> > reviews. Sending them anyway for FWIW :)
> > 
> > On 12-03-21, 21:33, Jie Deng wrote:
> > > +struct virtio_i2c {
> > > +	struct virtio_device *vdev;
> > > +	struct completion completion;
> > > +	struct i2c_adapter adap;
> > > +	struct mutex lock;
> > As I said in the previous version (Yes, we were both waiting for
> > Wolfram to answer that), this lock shouldn't be required at all.
> > 
> > And since none of us have a use-case at hand where we will have a
> > problem without this lock, we should really skip it. We can always
> > come back and add it if we find an issue somewhere. Until then, better
> > to keep it simple.

> The problem is you can't guarantee that adap->algo->master_xfer
> is only called from i2c_transfer. Any function who holds the adapter can
> call
> adap->algo->master_xfer directly.

See my last reply here, (almost) no one in the mainline kernel call it
directly. And perhaps you can consider the caller broken in that case
and so there is no need of an extra lock, unless you have a case that
is broken.

https://lore.kernel.org/lkml/20210305072903.wtw645rukmqr5hx5@vireshk-i7/

> I prefer to avoid potential issues rather
> than
> find a issue then fix.

This is a very hypothetical issue IMHO as the kernel code doesn't have
such a user. There is no need of locks here, else the i2c core won't
have handled it by itself.

> > 
> > > +
> > > +static struct i2c_adapter virtio_adapter = {
> > > +	.owner = THIS_MODULE,
> > > +	.name = "Virtio I2C Adapter",
> > > +	.class = I2C_CLASS_DEPRECATED,
> > What happened to this discussion ?
> > 
> > https://lore.kernel.org/lkml/20210305072903.wtw645rukmqr5hx5@vireshk-i7/
> 
> My understanding is that new driver sets this to warn users that the adapter
> doesn't support classes anymore.

I think the warning is relevant for old drivers who used to support
classes and not for new ones.

> I'm not sure if Wolfram can explain it more clear for you.

Okay, lemme dig in a bit then.

$ git grep -l i2c_add_adapter drivers/i2c/busses/ | wc -l
77

$ git grep -l I2C_CLASS_DEPRECATED drivers/i2c/busses/
drivers/i2c/busses/i2c-at91-core.c
drivers/i2c/busses/i2c-bcm2835.c
drivers/i2c/busses/i2c-davinci.c
drivers/i2c/busses/i2c-designware-platdrv.c
drivers/i2c/busses/i2c-mv64xxx.c
drivers/i2c/busses/i2c-nomadik.c
drivers/i2c/busses/i2c-ocores.c
drivers/i2c/busses/i2c-omap.c
drivers/i2c/busses/i2c-rcar.c
drivers/i2c/busses/i2c-s3c2410.c
drivers/i2c/busses/i2c-tegra.c
drivers/i2c/busses/i2c-virtio.c
drivers/i2c/busses/i2c-xiic.c

i.e. only 13 of 77 drivers are using this flag.

The latest addition among these drivers is i2c-bcm2835.c and it was
added back in 2013 and the flag was added to it in 2014:

commit 37888f71e2c9 ("i2c: i2c-bcm2835: deprecate class based instantiation")

FWIW, I also checked all the new drivers added since kernel release
v4.0 and none of them set this flag.

-- 
viresh
