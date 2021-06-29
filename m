Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7B9F3B6D43
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 06:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhF2EMu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 00:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhF2EMq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Jun 2021 00:12:46 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411A8C061574
        for <linux-i2c@vger.kernel.org>; Mon, 28 Jun 2021 21:10:20 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id q192so16094941pfc.7
        for <linux-i2c@vger.kernel.org>; Mon, 28 Jun 2021 21:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HbCIMJbXR00eV4jPyvQKtQotReipOTL/gg7Z8DJ8llQ=;
        b=KevEF2v/WbbhBrvu98MkRX2tgsJuIqO1/X0aBDBYmv8nqgbtIXE/gSpKRIi16iOJuf
         SOIak/iEwfohjS2dbJc932HfBoabsNbUOByEpKmvS4q3pznuX1/v43kcZ/dCWeccQH5l
         cXC+GHjt0NZflDe1/EU02kA/laewf6bVJF6ty7mwv6rTa5YRUKDDnv3qLCVUIg9Ysu3Y
         RD/xmgFsTwE+04voR7i+0aiZGct5b7daYDZC/x5qSVrsCOtplbOGBhLcNJcwdn04JHe6
         xkjPCY04gld9AMc7SGJpO0iwZUpUl1pm+0ptTRGPldkg5cirW2lP+Gyhkrp0ZpUo+59q
         hPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HbCIMJbXR00eV4jPyvQKtQotReipOTL/gg7Z8DJ8llQ=;
        b=rhtYp9CDT6iusHrFMYLRQ9bFFQ66aoWmGDZphkdxHkVQ8jbBNiY9cnjwZa/YJfQHea
         qYsvbTy2rLOnJ01u06t9HGftvFDZbvzW66l4dsK9ATc/Q5tbxAAMDddqdsSNoRraR83v
         A7+SXNWd04LQdeM6utdHBmoJ95jKEImUNb8ol//D2szmtayY8AHEhWO4aWJDj46YZ7m+
         OX+PnpgYFYIGEUfFRpEM+Lcla8CB3BX8+60tiPJ86W0agAGiwuAx2JF9kvtNCp3eHosB
         gZ0b4/bWyaZInQBblWSJV2cdfrbJr4V+XayEWIeSkS6PvvnMnPRRYfKe5/qo2kvP4LoB
         Roow==
X-Gm-Message-State: AOAM532owEUvLmu/Ni1Hu9WnefD+a/y8SQxOrTv8L0Cwm0CcQ1f3ewXx
        Jt3B38DwH4oJpBxiGZfkZGY6zw==
X-Google-Smtp-Source: ABdhPJx3CFYgS7XBI0CTsMRECG2jABxyuESu9uV4cFATrGVq+dZFzWsPOGAEWkZup9hNd5IWwipNPA==
X-Received: by 2002:a63:d811:: with SMTP id b17mr4522914pgh.286.1624939819758;
        Mon, 28 Jun 2021 21:10:19 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id y3sm16469487pga.72.2021.06.28.21.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 21:10:19 -0700 (PDT)
Date:   Tue, 29 Jun 2021 09:40:17 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
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
Message-ID: <20210629041017.dsvzldikvsaade37@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNmK0MP5ffQpiipt@ninjato>
 <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
 <YNmVg3ZhshshlbSx@ninjato>
 <CAK8P3a3Z-9MbsH6ZkXENZ-vt8+W5aP3t+EBcEGRmh2Cgr89R8Q@mail.gmail.com>
 <YNmg2IEpUlArZXPK@ninjato>
 <CAK8P3a3vD0CpuJW=3w3nq0h9HECCiOigNWK-SvXq=m1zZpqvjA@mail.gmail.com>
 <YNnjh3xxyaZZSo9N@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNnjh3xxyaZZSo9N@ninjato>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I will be replying here instead of replying to each and every msg :)

On 28-06-21, 16:58, Wolfram Sang wrote:
> 
> > You can fine Viresh's vhost-user implementation at
> > https://lore.kernel.org/qemu-devel/cover.1617278395.git.viresh.kumar@linaro.org/t/#m3b5044bad9769b170f505e63bd081eb27cef8db2
> 
> It looks OK so far; yet, it is not complete. But it might be bearable
> in the end.

While we are at it, this has been replaced by a Rust counterpart [1]
(as that makes it hypervisor agnostic, which is the goal of my work
here) and I need someone with I2C knowledge to help review it. It
should be okay even if you don't understand Rust a lot, just review
this file[2] which is where most of i2c specific stuff lies.

> > As you say, it does get a bit clumsy, but I think there is also a good argument
> > to be made that the clumsiness is based on the host Linux user interface
> > more than the on the requirements of the physical interface,
> > and that should not have to be reflected in the virtio specification.
> 
> Makes sense to me.
> 
> > Right, this one has come up before as well: the preliminary result
> > was to assume that this probably won't be needed, but would be easy
> > enough to add later if necessary.
> 
> If adding support incrementally works for such an interface, this makes
> sense as well.

Yes, we don't support few of SMBUS transaction (the block ones) as you
specified.

> So, where are we?

The virtio specification is already merged and here is the latest
version [3].

> As I understand, this v10 does not support I2C transactions (or
> I2C_RDWR as you said).

I am not sure why you say I2C_RDWR isn't supported. The spec and Linux
driver (+ my Rust/qemu backend), they all support I2C_RDWR as well as
SMBUS. To clarify on an earlier point, every virtio transfer may
contain one or more struct i2c_msg instances, all processed together
(as expected).

If you see virtio_i2c_send_reqs() in this patch, you will see that it
converts a stream of i2c_req messages to their virtio counterparts and
send them together, consider it a single transaction.

> But you want to support all clients. So, this doesn't match, or?

-- 
viresh

[1] https://github.com/rust-vmm/vhost-device/pull/1
[2] https://github.com/rust-vmm/vhost-device/blob/5aa22c92faac84ab07b6b15a214513556e8b1d01/src/i2c/src/i2c.rs
[3] https://github.com/oasis-tcs/virtio-spec/blob/master/virtio-i2c.tex
