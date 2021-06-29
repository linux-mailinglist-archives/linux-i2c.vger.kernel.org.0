Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8103B6FBA
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 10:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhF2Iyn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 04:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232508AbhF2Iyn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Jun 2021 04:54:43 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598DBC061760
        for <linux-i2c@vger.kernel.org>; Tue, 29 Jun 2021 01:52:16 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id a7so7159125pga.1
        for <linux-i2c@vger.kernel.org>; Tue, 29 Jun 2021 01:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VRDj6e+Lqnmeo3ZhydynJ+H5q+l8CnwAokRbOJM0nwc=;
        b=yVj+8Vh6JwKM1tH895sPcIlFKTgBt2qxInbHnxNMFWHV4he+OcXXLT/d2niuW/CEmt
         g9LYtuNyCBURRSH+gir2EOQsBc8Ms36tLjuJT6K3xh6IRdMyFSb/vFjLOmVfb+R1YLAR
         QlMG1UZ5m5WdsAhU4IQSZqywzzDbpO5q2umuw49EBwIfpxKkE7DFiYuzw1Y2Er+mWb8m
         uBtbkndiJ5HLBNFuecdEr6zQjvDbpCIzp9zK1jA91S0u2/HB63MQ9nqK9+RzGrxrXtem
         r+8542jeuxhdX+4v6UJSi0UBXrv6FsGVqiWxulZBWrrF/rPR6NkSMZGIlzG4PaEhALZR
         V28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VRDj6e+Lqnmeo3ZhydynJ+H5q+l8CnwAokRbOJM0nwc=;
        b=aQAiMamEi2pJ8mTKesKwmYVQPOOvJPHQDF3ohTEptaMN5smBs/nPREZgjqunPFGgjp
         z76Vld1EkwazRCIVkzNAxnJWadCitEP0ZvXuQ9zHgS6bByXnK90efcDyG1hBtrTio8QT
         z4IwFTXDvtS+OaUrIPTX2fnD/Cl+WKKkIM7r0fXG1IbhPHzC4RWVhisJOV1BaHVaF8ht
         ks3gBSHlcuuqooJNMuXB4V0cvaSwzdjERvDcdk4IHdBD+0+6SCIBg746is4M5Ay7dKa6
         8JygrwdjNemtHGVasNusE/0SnPtcxKnng8ki8GULV6b9DajjGgAJ3OV9OoFodm57vDBu
         awyw==
X-Gm-Message-State: AOAM532gO9PZWYowY2ApLbtsvv1lCDZMc425aucOw3dKVytPa/fK9t7e
        7NOe6IHUT6ZPgfms8s2Niy8uaw==
X-Google-Smtp-Source: ABdhPJxw2YQgANmJKSXb0azrt7CyxbCAGSM9vVRfeCOACPl0w7wdr4dlRe4f8Q2/+LafbzEvYR8owQ==
X-Received: by 2002:a05:6a00:d0:b029:30a:4c82:181 with SMTP id e16-20020a056a0000d0b029030a4c820181mr16562171pfj.27.1624956735846;
        Tue, 29 Jun 2021 01:52:15 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id t8sm17547212pjs.12.2021.06.29.01.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 01:52:15 -0700 (PDT)
Date:   Tue, 29 Jun 2021 14:22:13 +0530
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
Message-ID: <20210629085213.7a7eqcgkmtk5y7nh@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNmK0MP5ffQpiipt@ninjato>
 <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
 <YNmVg3ZhshshlbSx@ninjato>
 <CAK8P3a3Z-9MbsH6ZkXENZ-vt8+W5aP3t+EBcEGRmh2Cgr89R8Q@mail.gmail.com>
 <YNmg2IEpUlArZXPK@ninjato>
 <CAK8P3a3vD0CpuJW=3w3nq0h9HECCiOigNWK-SvXq=m1zZpqvjA@mail.gmail.com>
 <YNnjh3xxyaZZSo9N@ninjato>
 <20210629041017.dsvzldikvsaade37@vireshk-i7>
 <YNrZVho/98qgJS9N@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNrZVho/98qgJS9N@kunai>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29-06-21, 10:27, Wolfram Sang wrote:
> > While we are at it, this has been replaced by a Rust counterpart [1]
> > (as that makes it hypervisor agnostic, which is the goal of my work
> > here) and I need someone with I2C knowledge to help review it. It
> > should be okay even if you don't understand Rust a lot, just review
> > this file[2] which is where most of i2c specific stuff lies.
> 
> Can't promise I can do this before my holidays, but I will try.

Thanks.

> > I am not sure why you say I2C_RDWR isn't supported. The spec and Linux
> 
> This is how I interpreted Arnd's response. I said mulitple times that I
> might be missing something so I double check.
> 
> > SMBUS. To clarify on an earlier point, every virtio transfer may
> > contain one or more struct i2c_msg instances, all processed together
> > (as expected).
> 
> That was the information missing for me so far becasue...
> 
> > If you see virtio_i2c_send_reqs() in this patch, you will see that it
> > converts a stream of i2c_req messages to their virtio counterparts and
> > send them together, consider it a single transaction.
> 
> ... when I checked virtio_i2c_send_reqs(), I also saw
> virtqueue_add_sgs() but I had no idea if this will end up as REP_START
> on the physical bus or not. But it definately should.

Just think of virtqueue_add_sgs() as something that setups the
structures for transfer. The actual stuff at the other end (host)
happens only after virtqueue_kick() is called at the guest (this
notifies the host that data is present now), in response the backend
running at host will re-create the struct i2c_msg and issue:

    struct i2c_rdwr_ioctl_data data;
    data.nmsgs = count;
    data.msgs = msgs;

    return ioctl(adapter->fd, I2C_RDWR, &data);

So we will end up recreating the exact situation as when
virtio_i2c_xfer() is called.

-- 
viresh
