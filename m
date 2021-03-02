Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD4A32B288
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242152AbhCCBPa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:15:30 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:58633 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1838561AbhCBK4x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Mar 2021 05:56:53 -0500
Received: from mail-wm1-f47.google.com ([209.85.128.47]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MWzbr-1lJap01VGb-00XIbh; Tue, 02 Mar 2021 11:54:19 +0100
Received: by mail-wm1-f47.google.com with SMTP id n4so2210381wmq.3;
        Tue, 02 Mar 2021 02:54:19 -0800 (PST)
X-Gm-Message-State: AOAM531PfHCGTnwKqf4Xca8S6I4j7fUd6pXrkwopqJwyO5GPhRUNGCUP
        rQnofa//7fuFoxNYTzaPk53TbSs7qqcyjCaznWE=
X-Google-Smtp-Source: ABdhPJwSy1Zm9Mymlo1hNSTEvNea2JqPihM0NDsdqQ4z0ab+tRCjmNhlJs5SPzaIvZ02aT2eYQCACTgNAzu/Id76t/U=
X-Received: by 2002:a05:600c:4f11:: with SMTP id l17mr3405660wmq.38.1614682458937;
 Tue, 02 Mar 2021 02:54:18 -0800 (PST)
MIME-Version: 1.0
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <CAK8P3a1ZXbodV07TTErnQunCLWOBnzRiVdLCxBD743fn-6FbXg@mail.gmail.com>
 <56fdef9a-b373-32f2-6dac-e687caa813c8@intel.com> <YD4KovxeoNG/c8QC@stefanha-x1.localdomain>
In-Reply-To: <YD4KovxeoNG/c8QC@stefanha-x1.localdomain>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 2 Mar 2021 11:54:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a23L-Y0vzJTb5w1MkumaYAJQ6Owiq6RZ2XE=i8gBMTUZw@mail.gmail.com>
Message-ID: <CAK8P3a23L-Y0vzJTb5w1MkumaYAJQ6Owiq6RZ2XE=i8gBMTUZw@mail.gmail.com>
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
To:     Stefan Hajnoczi <stefanha@redhat.com>
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
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:gF0XgA0E5NC4LDXr21/b567gTU0xy0MQFYkHv+4rdqtRDoDZiBb
 bI9+BvBZDafPfhbcySdS7YnBoPEkq31Fkfo5z6OnVOnrzncPdsrhBoWlmokCMRLtJULXy7U
 5+m4xnWEk3w7SmQ+/dV6XH0AEz7GtXYBpDnWq3E1ct1ItUYDxCcBJPDBzNNC99fDTbeMdKD
 a+C2FYpG8ygzJ+R9ZPOMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vjcPgti2woE=:JBOJcGWnz+Uvvppff19JPY
 eMN1rU3e0Xhd67jckah4dd3wl/kTrzR3Co+OsU7o8DHAX9Ps81aRewDkGLfmDe5qMUNVEhF/x
 Xb9naahW/uSxUo7ze/6x1I0NsTM08wBYrwsNSHi+AnmY4UMSgoAf8rPLFuuFJLsfZjpPUOSNz
 VO0dhjXlnPGMZQN8dA/P3cuxxuPqpb4Cg/Z7Ax9ajm0+2XiV9kMRv2riOL34bTEWVvLCx+Eyw
 Erj3K7e17ZsGJlARuk+ZqQpioITVziD4n747e03IeiVZaiQmyMUugWY8tpOXyrNFecx/Bk6np
 2zmdvJ7JT93U///nWSq4n/00XQeo3lWXjb2z/qT5hX1V9ueTcF3gWlOiVSTgt4euiQfkRL34o
 5mf8mO2JF1McAJjdnQibudjdiJvNQgDV9ZkumRUQGGcdGZll+gW7+EX6U8WQVBB/n+hA7ZXOf
 PZ8PtF/T02zo/RpIVhSoKYCX1ovX0YKGWxD5SzoQdUb3TG8hi/KZ6yTxUQAAYpRW6wabap7fZ
 mmZG/1YOOZzBx2oWOXTs7bYfpRb5+m3vR9u01ZVJbq4zbhIowCs0eaWqvCzhQY97g==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 2, 2021 at 10:51 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> On Tue, Mar 02, 2021 at 10:42:06AM +0800, Jie Deng wrote:
> > > > +/*
> > > > + * Definitions for virtio I2C Adpter
> > > > + *
> > > > + * Copyright (c) 2021 Intel Corporation. All rights reserved.
> > > > + */
> > > > +
> > > > +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
> > > > +#define _UAPI_LINUX_VIRTIO_I2C_H
> > > Why is this a uapi header? Can't this all be moved into the driver
> > > itself?
>
> Linux VIRTIO drivers provide a uapi header with structs and constants
> that describe the device interface. This allows other software like
> QEMU, other operating systems, etc to reuse these headers instead of
> redefining everything.
>
> These files should contain:
> 1. Device-specific feature bits (VIRTIO_<device>_F_<feature>)
> 2. VIRTIO Configuration Space layout (struct virtio_<device>_config)
> 3. Virtqueue request layout (struct virtio_<device>_<req/resp>)
>
> For examples, see <linux/virtio_net.h> and <linux/virtio_blk.h>.

Ok, makes sense. So it's not strictly uapi but just helpful for
virtio applications to reference these. I suppose it is slightly harder
when building qemu on other operating systems though, how does
it get these headers on BSD or Windows?

       Arnd
