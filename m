Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68CF032B18F
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241637AbhCCBMR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:12:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1576029AbhCBEXQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Mar 2021 23:23:16 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0620C06178B
        for <linux-i2c@vger.kernel.org>; Mon,  1 Mar 2021 20:22:36 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id g20so11282207plo.2
        for <linux-i2c@vger.kernel.org>; Mon, 01 Mar 2021 20:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9W7+TO0f4l1oeUZ2kxdZaL80iPIivjtmW4SAISVlUwA=;
        b=pvd3mHzSbnat8rwuvGgMx1Rkbj4wzxvmwHI4vUb0EYlh0QNx/7rnLyICtbujHxiRXS
         zCw0Z01u0JSeBsmvfbWev/7w8RZiLnMN9IPzACgVJoSe4sCpXUQDSfOLmwBivzhrYOUE
         Aal60p8XyKOPaDwmN0Ny2ZHvb8WV6CbkiYNqEruxgK/jZmxv20sULGEmOWg0MFKOOoa3
         lfgqqwvEOCtuC1AhdQGhCjnnJ3Atesb9aFVlJLwUo3lgB7xBNhVYvpOP7BrXk4Rwp1FM
         Uv1F881GHNs2J8l9xWf76rOjxsw5DajCt6XTYyzhQwDYXi1VN82iqcKVFwhP8RYn/vXq
         urNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9W7+TO0f4l1oeUZ2kxdZaL80iPIivjtmW4SAISVlUwA=;
        b=CraJSlv1shKMxam3cG7qYGhgSvrYLj3X/RdaYPXdWSTBLK+oqtiK9XH9hHwvQcx7OJ
         ZwhaASvbg+582+XCJvpPbBRR/1Iblhg5ytKl/iAyZwSZaS5u9aDnlFta/AgegXTq6t5D
         YY3naci5rrD8iZVzLlpIC6p85aN5WLx/M/LeiWCwKtqHPhyn9b+wAL1LznfSIuQ/UvJI
         y7K14VmHjaU764Jf3lWg7n8ZvUT7JP4IFhGnyz/219oOQgqPdJBFiiVed4QBH6PS8YFQ
         KcBbiGxB4k8CS8wC3HBhQR02W4UE4rSkI3IkWAtljTjKaKICCNS8Fx2/tCYGvw9d6i7T
         OjFg==
X-Gm-Message-State: AOAM532jr1iy29LErVAvqoBkvv+SSLVhQD+eI4/gbOJFTmHsPf1dOFNs
        zrbiwGofqxKO+ilYWL4MQKxv3w==
X-Google-Smtp-Source: ABdhPJyZQye8/p8AFQW3rKIzTTeuQIZN7/Zd6nKoDo+1wr9cYQjkRIetQscutexPV8YfTNyk1lj1vg==
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr2360894pjr.234.1614658956110;
        Mon, 01 Mar 2021 20:22:36 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id b1sm20415638pfp.145.2021.03.01.20.22.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 20:22:35 -0800 (PST)
Date:   Tue, 2 Mar 2021 09:52:33 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
        yu1.wang@intel.com, shuo.a.liu@intel.com
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210302042233.7ppagwjk3rah3uh3@vireshk-i7>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <CAK8P3a1ZXbodV07TTErnQunCLWOBnzRiVdLCxBD743fn-6FbXg@mail.gmail.com>
 <20210302040114.rg6bb32g2bsivsgf@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302040114.rg6bb32g2bsivsgf@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02-03-21, 09:31, Viresh Kumar wrote:
> On 01-03-21, 16:19, Arnd Bergmann wrote:
> > On Mon, Mar 1, 2021 at 7:41 AM Jie Deng <jie.deng@intel.com> wrote:
> > 
> > > --- /dev/null
> > > +++ b/include/uapi/linux/virtio_i2c.h
> > > @@ -0,0 +1,56 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
> > > +/*
> > > + * Definitions for virtio I2C Adpter
> > > + *
> > > + * Copyright (c) 2021 Intel Corporation. All rights reserved.
> > > + */
> > > +
> > > +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
> > > +#define _UAPI_LINUX_VIRTIO_I2C_H
> > 
> > Why is this a uapi header? Can't this all be moved into the driver
> > itself?
> > 
> > > +/**
> > > + * struct virtio_i2c_req - the virtio I2C request structure
> > > + * @out_hdr: the OUT header of the virtio I2C message
> > > + * @write_buf: contains one I2C segment being written to the device
> > > + * @read_buf: contains one I2C segment being read from the device
> > > + * @in_hdr: the IN header of the virtio I2C message
> > > + */
> > > +struct virtio_i2c_req {
> > > +       struct virtio_i2c_out_hdr out_hdr;
> > > +       u8 *write_buf;
> > > +       u8 *read_buf;
> > > +       struct virtio_i2c_in_hdr in_hdr;
> > > +};
> > 
> > In particular, this structure looks like it is only ever usable between
> > the transfer functions in the driver itself, it is shared with neither
> > user space nor the virtio host side.
> 
> Why is it so ? Won't you expect hypervisors or userspace apps to use
> these ?

This comment applies only for the first two structures as the third
one is never exchanged over virtio.

-- 
viresh
