Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31BF33ACD6
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Mar 2021 08:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbhCOHxp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 15 Mar 2021 03:53:45 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:37923 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbhCOHxN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Mar 2021 03:53:13 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mvbr4-1lbro93JZO-00siaq; Mon, 15 Mar 2021 08:53:12 +0100
Received: by mail-oi1-f174.google.com with SMTP id w125so5050159oib.13;
        Mon, 15 Mar 2021 00:53:11 -0700 (PDT)
X-Gm-Message-State: AOAM530/2VFTefL83eMeQLAF/SnE550b1pFCIsUwSt5YmGobx27vjkUX
        CIcmi4dYjOgFkYr4soN4pxaL95MqwN8Y1LtIRS4=
X-Google-Smtp-Source: ABdhPJxqDGNRsuLazrikYSqY8ylkAVcvSJoIRj7d/B6mgsATUAgDvUWymXPVOUo2C8fqtGFewM/hJKdAajbaWjVXu4k=
X-Received: by 2002:a05:6808:313:: with SMTP id i19mr8744619oie.67.1615794790530;
 Mon, 15 Mar 2021 00:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <cd3b0c9138824b0a5fad9d3bc872d8836e829946.1615554673.git.jie.deng@intel.com>
 <CAK8P3a0zQG3pH91emqAUsaRx4AZeuOEvSrPzXP9w_XhjU6w3ng@mail.gmail.com>
 <8070f03d-8233-636b-5ea9-395e723f7a2c@intel.com> <503b88c9-1e82-a3a3-0536-d710ddc834a5@redhat.com>
 <e388b344-a815-aed3-c076-3651b18c39d1@intel.com>
In-Reply-To: <e388b344-a815-aed3-c076-3651b18c39d1@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 15 Mar 2021 08:52:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0LjcSs7gvU-jRdZJCFrfxQcSUWqL_fgH_71VjC027M0w@mail.gmail.com>
Message-ID: <CAK8P3a0LjcSs7gvU-jRdZJCFrfxQcSUWqL_fgH_71VjC027M0w@mail.gmail.com>
Subject: Re: [PATCH v7] i2c: virtio: add a virtio i2c frontend driver
To:     Jie Deng <jie.deng@intel.com>
Cc:     Jason Wang <jasowang@redhat.com>,
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
X-Provags-ID: V03:K1:BIrgCmy1rfldfXWXyj/vcSm89E881KI0NZP+gwg1MTy0coAWtpG
 1C8788xpaJIQgzNiUU5ZAj6dfbGu40kLTyL445zFnRxWzkiBy+2zr5Rz9G5Jb9IjPagLBeC
 AuG7WlXMpUfKUUorcYJyW92SIj3NsWZupCGlK3H9Qc570ytncUvAmESBk0O72hbCtrjyuor
 UlPDZ7/MJEM7GPUUPRICA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mby2l7qk0+I=:XRr1Iqx/nCwYXRbp73WoPo
 i5piTO0vEvlWJhm0qRngxbr0Of3CgnNUzdtHkBAIjcYEq0Au6BZ17uroMtHIy+5Ac+yvJrTyk
 bC16ClVAkkMNlDBDLHy5SVFCD85JcSHsSOWglYj0VvAp4DXdJh09D4Hi3IAKhBmI/q7tM31dB
 ZrVav8msmWKJ3VPa18qSn9KzNEKkF3crOnGjjGQaQ60D/99LSiqO+t1aHfCpsh07CdjdpZV5N
 2eZxKAj+cff1Nwk2ORgf6GYmnMJgC3ssBeEwdlOOZL0vqyaxs6IBnq4/sG5qkJKu7JLqUYJk9
 ueLQL0TDHdJFV2kUuH8cO70aYHeVy6Ay74OdNW/6VAEaHx/bH+/3cqbp3JGVii9Cf5/C8zUGp
 0bob8mV9ED1nBDqEvv9UBsqiqOAFw1nDXlRgV1I38imrug6GDjEKBKMtqMG/t
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 15, 2021 at 6:54 AM Jie Deng <jie.deng@intel.com> wrote:
> On 2021/3/15 11:13, Jason Wang wrote:
> > On 2021/3/15 9:14 上午, Jie Deng wrote:
> >> On 2021/3/12 16:58, Arnd Bergmann wrote:
> >
> Then do you think it is necessary to mark the virtio bufs with
> ____cacheline_aligned ?

I think so, yes.

> I haven't seen any virtio interface being marked yet. If this is a
> problem, I believe it should  be common for all virtio devices, right ?

Yes, but it's not a problem if the buffers are allocated separately
because kmalloc provinces a cachelinen aligned buffer on architectures
that need it.

It's only a problem here because there is a single allocation for three
objects that have different ownership states during the DMA (device
owned to-device, cpu-owned, device owned to-cpu).

       Arnd
