Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67ECF3B5BC5
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jun 2021 11:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhF1J4N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Jun 2021 05:56:13 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:54597 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232559AbhF1J4N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Jun 2021 05:56:13 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MdNoW-1lOTD03vNY-00ZP8M; Mon, 28 Jun 2021 11:53:46 +0200
Received: by mail-wr1-f53.google.com with SMTP id l8so11707761wry.13;
        Mon, 28 Jun 2021 02:53:46 -0700 (PDT)
X-Gm-Message-State: AOAM531aInD1ElZ7fMCU/v00dcJZfUNDdND0o++Z3MGV3uAglJRw3KR3
        dmjIlXMcAac4vH8ud6ZqJCiG8R1GvXLwiKeDh0U=
X-Google-Smtp-Source: ABdhPJwktqDothMpLIRlMDpocHDcEWckQcB5id0jYduIugUmev01PMKggW/MtSAVvvpDnvAX/XZRRryNLFIoMAA6eyE=
X-Received: by 2002:adf:fd8e:: with SMTP id d14mr5557535wrr.361.1624874026628;
 Mon, 28 Jun 2021 02:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNmK0MP5ffQpiipt@ninjato> <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
 <YNmVg3ZhshshlbSx@ninjato>
In-Reply-To: <YNmVg3ZhshshlbSx@ninjato>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 28 Jun 2021 11:51:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Z-9MbsH6ZkXENZ-vt8+W5aP3t+EBcEGRmh2Cgr89R8Q@mail.gmail.com>
Message-ID: <CAK8P3a3Z-9MbsH6ZkXENZ-vt8+W5aP3t+EBcEGRmh2Cgr89R8Q@mail.gmail.com>
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
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
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Y8z4xoFpyM0sk5GQ51VxNLLPLGnt0N0Fg2luYTjT2N3rN8+a5qL
 jvatuSez44m42R2izw9uMu7BCU1OoSQisW+OGVUCQilTYk2w9z4TM0MPq/ownVymNu+FOmj
 8Uc8QYB7oKjbuTwq6O2EjU9q4R/EVvGU14yOSR7EIcU+VdbW/vCjhAFi5Bg+Y5EKrKWJ9FT
 wp9hPjWZ3SJDMnSLtogew==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OXcKbYj3TRk=:tr6gdzv1gVn+aSM4a4RAhb
 s2ha5JevF/RAkytiMDCn7jy9JR7w+mtTYAYUvKpMk+kAxBE+e4lKNuthbFWkJHg+1thkz+bG7
 hLyqOyGpqwj2S5wAfKaKQytvAb+Gghyi2H57UV+8Xa2+axZ2nEfxCf7ehe8a70hGmOIURUhaW
 62PoxCtxd+YQjyPvhBltxSH1LM9aXnkqxp96dcNYGjVXJP3Yh90M/mWxuAz7+5qFETt0dawTn
 0NLSlBpfFpCMWoqmRlJxY/uBqy6hjxiZjcnpTNaj81VhGbQFLulLAzNhksLbsKuPHJxVfLcRU
 eZQ61h78vmsUMirBx5OBMzuoVEOSWdJVFqNJVZSMFhyM6wBtGtASwjvJYzq5Yonu8s3yFJRCN
 DutiP4vJLVTcyuhyxU3cycwgPM8RHbHDAC5VSwXnZ7bMAuIKx/B9RaN2Cme58C5tvd/2KAPH1
 VZKhUbEa09orQfUcK6qB3zQUIxBgfLDpfLgw5gPVHdD8e5MEo/HjZ6x2AteZbtNjzRM8inR0g
 vJ9QKDKWKL47x+YVzMfaV8ZIu3qXKctvgkK4qy7rCqnlzjSorMP9CFtNwkb0O2pn+CbgIpwTK
 Dopax9HFt3zG9HQTRZbL8NLQDI/x58RNqQklogYhl5J+seVBS24J4Pt2UpO3jiDf+dTXPXapG
 u/gk=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 28, 2021 at 11:25 AM Wolfram Sang <wsa@kernel.org> wrote:
> > As far as I understand me (please clarify), implementing only the smbus
> > subset would mean that we cannot communicate with all client devices,
> > while implementing both would add more complexity than the lower-level
> > protocol.
>
> Correct. You need to pick I2C if you want to support all devices. SMBus
> will give you only a lot of devices.

Ok, that's what I thought. There is one corner case that I've struggled
with though: Suppose the host has an SMBus-only driver, and the
proposed driver exposes this as an I2C device to the guest, which
makes it available to guest user space (or a guest kernel driver)
using the emulated smbus command set. Is it always possible for
the host user space to turn the I2C transaction back into the
expected SMBus transaction on the host?

> > > Also, as I read it, a whole bus is para-virtualized to the guest, or?
> > > Wouldn't it be better to allow just specific devices on a bus? Again, I
> > > am kinda new to this, so I may have overlooked things.
> >
> > Do you mean just allowing a single device per bus (as opposed to
> > having multiple devices as on a real bus), or just allowing
> > a particular set of client devices that can be identified using
> > virtio specific configuration (as opposed to relying on device
> > tree or similar for probing). Both of these are valid questions that
> > have been discussed before, but that could be revisited.
>
> I am just thinking that a physical bus on the host may have devices that
> should be shared with the guest while other devices on the same bus
> should not be shared (PMIC!). I'd think this is a minimal requirement
> for security. I also wonder if it is possible to have a paravirtualized
> bus in the guest which has multiple devices from the host sitting on
> different physical busses there. But that may be the cherry on the top.

This is certainly possible, but is independent of the implementation of
the guest driver. It's up to the host to provision the devices that
are actually passed down to the guest, and this could in theory
be any combination of emulated devices with devices connected to
any of the host's physical buses. The host may also decide to remap
the addresses of the devices during passthrough.

       Arnd
