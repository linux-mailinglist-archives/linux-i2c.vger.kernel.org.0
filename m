Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EAFF333743
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 09:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhCJI2J convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 10 Mar 2021 03:28:09 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:50139 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbhCJI17 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Mar 2021 03:27:59 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MgeXk-1lwIPx1h88-00h510; Wed, 10 Mar 2021 09:27:57 +0100
Received: by mail-oi1-f182.google.com with SMTP id v192so10653875oia.5;
        Wed, 10 Mar 2021 00:27:57 -0800 (PST)
X-Gm-Message-State: AOAM5337ZYo7aHRu62aa9eXCXgLuKcU/kda7KYqYD+4GcjBCwWBxOVg2
        s3PhQkJnPH9eTamxBbdKKdU/JTAcXJDa8W60kmo=
X-Google-Smtp-Source: ABdhPJxUhp0PQlwZhuWBNMm9oBfXDiwFXSQirR9+uVR5kqr2lW3VW2x9+3+VkueduIybWF/5lKAChdCwsc7m15dMWKc=
X-Received: by 2002:aca:bf44:: with SMTP id p65mr1571024oif.11.1615364876081;
 Wed, 10 Mar 2021 00:27:56 -0800 (PST)
MIME-Version: 1.0
References: <9a2086f37c0a62069b67c39a3f75941b78a0039c.1614749417.git.jie.deng@intel.com>
 <43b0842b-8b0f-1979-ed07-d6124e3a6b79@redhat.com> <db9350b3-b847-8f54-546f-9a0bdec425d4@intel.com>
 <a3d4ce55-db25-5f96-ff44-5b76edfe9e08@redhat.com>
In-Reply-To: <a3d4ce55-db25-5f96-ff44-5b76edfe9e08@redhat.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 10 Mar 2021 09:27:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a04u9Xv15K06zrsOtzZF18+1wDpJbBHUU3wYwU--Hdz5A@mail.gmail.com>
Message-ID: <CAK8P3a04u9Xv15K06zrsOtzZF18+1wDpJbBHUU3wYwU--Hdz5A@mail.gmail.com>
Subject: Re: [PATCH v6] i2c: virtio: add a virtio i2c frontend driver
To:     Jason Wang <jasowang@redhat.com>
Cc:     Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
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
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:uNkXJ57CqaHfrf67v16xUK7HDRzqrdDYjE2JrZreTApXfNu7N44
 FVna6gI24gg59qkwPFoV4prAGD8EyjPObh4Fw9f8NQOFL2AkdKNgPhgoSU10SrWXkENTSDd
 ka1X7dE8zHlPZiGcctRtzG+A7foEWr64ht8qoM74VKm46I2hQ+ndZufi5EOl4HXJwdOTuSB
 FlEloR8eK+eO1HaTTVHAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EHMUgJkB05Y=:d/1IC4jQHAhhSfSX60Xj6W
 gQtU7dagvkLxpJ49/NreYoeDnMPtLTDIJ/FoirVs/I4K2whFrelGq/v1r8VO8L8kN/wlauI57
 X2BHg7FyPAbTKsEAbZD2CmIh6NrdOD6UhpvYFGlZoD4DGYi2e/TFElJgS52OIlwJimhr0SXD4
 sf6d9qKXtgk4T+prV23K0YVKCrg0rZzxStKTung9icOqHN4unxXiR1iuEF8X5b0D/jQduQhEf
 oVd95q9HmdtHAgADkBU6TyMBt1Tx9ptSIBp9iNtrHLxZxDcHOWiBm//w6WQowJrQ9UXIW/mqh
 T8KEAy9Xs4B/QKYDW0t1RBitP40nqRc1SR1zuv6W5aonlwKogPm6hYfsK2ZW/btHZX5Hk1dxL
 LB0r87OOBgpKDIwEH8u5TC4sfmjpeIZ2hoV30IqcNBBxItbFZMINK8nPHNSVH
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 10, 2021 at 4:59 AM Jason Wang <jasowang@redhat.com> wrote:
> On 2021/3/10 10:22 上午, Jie Deng wrote:
> > On 2021/3/4 17:15, Jason Wang wrote:
> >>
> >>
> >>> +        }
> >>> +
> >>> +        if (msgs[i].flags & I2C_M_RD)
> >>> +            memcpy(msgs[i].buf, req->buf, msgs[i].len);
> >>
> >>
> >> Sorry if I had asked this before but any rason not to use msg[i].buf
> >> directly?
> >>
> >>
> > The msg[i].buf is passed by the I2C core. I just noticed that these
> > bufs are not
> > always allocated by kmalloc. They may come from the stack, which may
> > cause
> > the check "sg_init_one -> sg_set_buf -> virt_addr_valid"  to fail.
> > Therefore the
> > msg[i].buf is not suitable for direct use here.
>
> Right, stack is virtually mapped.

Maybe there is (or should be) a way to let the i2c core code handle
the bounce buffering in this case. This is surely not a problem that
is unique to this driver, and I'm sure it has come up many times in
the past.

I see that there is a i2c_get_dma_safe_msg_buf() helper for this
purpose, but it has to be called by the driver rather than the core,
so the driver still needs to keep track of each address when it
sends multiple i2c_msg at once, but maybe it can all be done
inside the sg_table instead of yet another structure.

At least this one avoids copying data that is marked with the
I2C_M_DMA_SAFE flag.

       Arnd
