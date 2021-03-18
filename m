Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6721934082C
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 15:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCROxL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 10:53:11 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:45855 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbhCROxB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Mar 2021 10:53:01 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mq2rM-1m04bJ1vSE-00nBDX; Thu, 18 Mar 2021 15:52:59 +0100
Received: by mail-ot1-f48.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso5433828otq.3;
        Thu, 18 Mar 2021 07:52:59 -0700 (PDT)
X-Gm-Message-State: AOAM531HbNfmnq5vAvA7q78ifwUFH/gJA+BFQuxSvclZwSEntC340J6K
        qOGijfYkxNBdwNU6UcqOfzAe9p2ydjEdsJhFqjg=
X-Google-Smtp-Source: ABdhPJw7Eug2yd9ucu2dKZlBIqyoyljV2ZH8YZeMrPCW0lZjBwbRWIkmu8XcOw0kOzzkDzHjb1kP6HgcXNEyY4KVhCY=
X-Received: by 2002:a05:6830:14c1:: with SMTP id t1mr7894612otq.305.1616079178056;
 Thu, 18 Mar 2021 07:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <c193b92d8d22ba439bb1b260d26d4b76f57d4840.1615889867.git.jie.deng@intel.com>
 <20210316074409.2afwsaeqxuwvj7bd@vireshk-i7> <0dfff1ac-50bb-b5bc-72ea-880fd52ed60d@metux.net>
In-Reply-To: <0dfff1ac-50bb-b5bc-72ea-880fd52ed60d@metux.net>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 18 Mar 2021 15:52:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3f9bKdOOMgrA9TfeObyEd+eeg8JcTVT8AyS1+s=X2AjQ@mail.gmail.com>
Message-ID: <CAK8P3a3f9bKdOOMgrA9TfeObyEd+eeg8JcTVT8AyS1+s=X2AjQ@mail.gmail.com>
Subject: Re: [PATCH v8] i2c: virtio: add a virtio i2c frontend driver
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Deng <jie.deng@intel.com>,
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
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:TM47QfXkzV/u9lf8AsYQUq4wdOsnNc7RRaPHIqMtC515cOaRb9i
 XMO9RebAJooP4D3kava4yxzf9rSprx1EHvk2xUM6XQxhPqpZO3QjJO5QjD53c6EXPK0W+2J
 vGe9gyy66HBbfx0vLHsque9Y/WnXB2V3GXZmyPqjsuGhiHrJvV81z/9RYRyWyBATuisssOJ
 Ft6ruV+GVmcuVVu7OeDRA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b5kOYfQE5AU=:XkLS+KRh7WuI5Iu7S+55bs
 +l/MXVyDZElm0C4Hlp2mzHbvGWJ11tGF7XANrv6YLxQmidi1Y/9kSYCuLZlKeflX7Ryo/vhmn
 stw+5NdrKQgw/YNGRGh+279MXKPl04mPybOA15oIPPzI0JkzJ7wImUlreYpXnotzIMu7vM0qT
 1/Ja8LLEJB+KMPWt3Tea3MmJ7BQoa3BhJJvEbAGh+698KHqh8kCSBTluOIkwpCLTRr/b4PnOB
 qdX4XDzH1klANFcZLxT5FwVoic8Dld6VBNiHnmdW6BbJyfI/P0ebRa+sBar8GBNHgB3xbwMs5
 y27T4cgCScfSKbv/jzlBQcVIu/bKea2s9zEurZiPCy0kme875XtOgkIvaVITxj2JMXBuV+D0X
 zX6F7Z9iZGj3V9n/UOm52lkwZFF2RB18sGcPBamwy9FtdXphgR3c1iMHnCcl5lZNDg4RDdvWc
 jGsN2F/HM+dM+HPb0gLa6mUFJnWTxxqeTGs0hw6ZsCfdVPOM2gzVmMgyAb3Zaknxme4aGeDkR
 xNuQ730BKYLT8a6cKoM12BvqItldefp4tR6oMKw09whnLNYDUywNgYSMNizVknRsQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 18, 2021 at 3:42 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 16.03.21 08:44, Viresh Kumar wrote:
>
> > FWIW, this limits this driver to support a single device ever. We
> > can't bind multiple devices to this driver now. Yeah, perhaps we will
> > never be required to do so, but who knows.
>
> Actually, I believe multiple devices really should be possible.
>
> The major benefit of virtio-i2c is either bridging certan real bus'es
> into a confined workload, or creating virtual hw testbeds w/o having to
> write a complete emulation (in this case, for dozens of different i2c
> controllers) - and having multiple i2c interfaces in one machine isn't
> exactly rare.

Allowing multiple virtio-i2c controllers in one system, and multiple i2c
devices attached to each controller is clearly something that has to work.

I don't actually see a limitation though. Viresh, what is the problem
you see for having multiple controllers?

         Arnd
