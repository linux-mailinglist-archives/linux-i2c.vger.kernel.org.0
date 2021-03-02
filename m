Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480A132B16D
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238718AbhCCBLM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238411AbhCBELp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Mar 2021 23:11:45 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E29FC061756
        for <linux-i2c@vger.kernel.org>; Mon,  1 Mar 2021 20:01:18 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id n10so12986564pgl.10
        for <linux-i2c@vger.kernel.org>; Mon, 01 Mar 2021 20:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fFBpOaqnIYwYnvUE7iGG9eoxcoU1KoADt/9w4iLg1yw=;
        b=q0OEep7CBUYxMngfrjMfv3HZu1xA48/HR3WYDg8qoU56rfayFbakMoW82KYFzgKiKF
         VgHLKajrxipKwAGxsfOn2tcuvEY8sR8HfPh+6P1FYTj3AEgzbvUIoor9ftbErqzATWYr
         xFDJno2Q0y9X4K3L3vcm4y+X5ekiPoux6piKGtXBCnhSTBIb72yCypB5bhP1CeBXkBR4
         twotd69qrl7DT1eum1/QK9XD8i0rKweAd5TP7ktTNAtcRD3/ZOqpAB8+sY50IZPGkobt
         GfN1auFf741DxgpuvNjEWBCO/KsejxjnrqbOo8qnqU3LlFezhBttzLbe+jQ+3Pv9rWlI
         8YNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fFBpOaqnIYwYnvUE7iGG9eoxcoU1KoADt/9w4iLg1yw=;
        b=PjcF/lfKStOqmNCPANrM4tNs9Y92rl/Qw/dzIDvvxKdu98hBZ1ASyn0het881EB1cj
         FPOp0kplz52IJquHnW/uyNIiazLrgC33xo59XX0E33yA+JvBuSAKwylaVCi4R0p44ozP
         BI0yhXJLdkM/SSzM6Zk1YgO5zY2O/BLkQ18RreLLkssXgWTkMR6xMqaG9fPpIyRtUdAM
         /CWlhIKK2e/2/AVpXRjE0AWhfqZVJVjH4gF8vYFMjswFyB2x8thAq1tTEI/BivP0bynM
         Sfl5UMRhgdkNW9pD+70HOSQIHYqkkJIfkxVom9VOnqrciB3UovoYyQeuzYvWj6jXF2+V
         8dKw==
X-Gm-Message-State: AOAM533yjlFvwyenKOxk7vrBjCeSKEZg1ONPnb8cSDbdf1zwyISBXc3T
        PJd0Lm9SjjyQl0amYDNtajGNwA==
X-Google-Smtp-Source: ABdhPJwbjaFWc0Ydncg0uXfe9DLT4ZT7DoinOOCZ+jmQSnlLVm/5KAgdBGUCxAUDY6noeHfJpmIz+Q==
X-Received: by 2002:a62:4e92:0:b029:1ee:251d:50a1 with SMTP id c140-20020a624e920000b02901ee251d50a1mr1492865pfb.53.1614657677648;
        Mon, 01 Mar 2021 20:01:17 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id c29sm17523742pgb.58.2021.03.01.20.01.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 20:01:16 -0800 (PST)
Date:   Tue, 2 Mar 2021 09:31:14 +0530
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
Message-ID: <20210302040114.rg6bb32g2bsivsgf@vireshk-i7>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <CAK8P3a1ZXbodV07TTErnQunCLWOBnzRiVdLCxBD743fn-6FbXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1ZXbodV07TTErnQunCLWOBnzRiVdLCxBD743fn-6FbXg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01-03-21, 16:19, Arnd Bergmann wrote:
> On Mon, Mar 1, 2021 at 7:41 AM Jie Deng <jie.deng@intel.com> wrote:
> 
> > --- /dev/null
> > +++ b/include/uapi/linux/virtio_i2c.h
> > @@ -0,0 +1,56 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
> > +/*
> > + * Definitions for virtio I2C Adpter
> > + *
> > + * Copyright (c) 2021 Intel Corporation. All rights reserved.
> > + */
> > +
> > +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
> > +#define _UAPI_LINUX_VIRTIO_I2C_H
> 
> Why is this a uapi header? Can't this all be moved into the driver
> itself?
> 
> > +/**
> > + * struct virtio_i2c_req - the virtio I2C request structure
> > + * @out_hdr: the OUT header of the virtio I2C message
> > + * @write_buf: contains one I2C segment being written to the device
> > + * @read_buf: contains one I2C segment being read from the device
> > + * @in_hdr: the IN header of the virtio I2C message
> > + */
> > +struct virtio_i2c_req {
> > +       struct virtio_i2c_out_hdr out_hdr;
> > +       u8 *write_buf;
> > +       u8 *read_buf;
> > +       struct virtio_i2c_in_hdr in_hdr;
> > +};
> 
> In particular, this structure looks like it is only ever usable between
> the transfer functions in the driver itself, it is shared with neither
> user space nor the virtio host side.

Why is it so ? Won't you expect hypervisors or userspace apps to use
these ?

-- 
viresh
