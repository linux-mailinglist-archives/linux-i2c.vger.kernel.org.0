Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB4E3B5AD6
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jun 2021 11:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbhF1JGm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Jun 2021 05:06:42 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:53691 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232466AbhF1JGj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Jun 2021 05:06:39 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mr8vG-1lUWvC25NW-00oIvG; Mon, 28 Jun 2021 11:04:12 +0200
Received: by mail-wr1-f52.google.com with SMTP id d11so20363690wrm.0;
        Mon, 28 Jun 2021 02:04:12 -0700 (PDT)
X-Gm-Message-State: AOAM532nngXd4SqZi5Pdm1ycas4L7lK0xVq2/g0U3xnQj3SL78Ptoe9y
        8ZbgEM+OMIgsXiXKVn9nP1/tPQQbF5GclEuGN08=
X-Google-Smtp-Source: ABdhPJyRl7QSXH5sB8nExkanlgljChSQUCIUP+JWsaWbuQfEbjisBPDii/DpjNvzI3LCvLAYvpEUSYGhq9xCpMZ1Phw=
X-Received: by 2002:adf:e107:: with SMTP id t7mr25246408wrz.165.1624871051873;
 Mon, 28 Jun 2021 02:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNmK0MP5ffQpiipt@ninjato>
In-Reply-To: <YNmK0MP5ffQpiipt@ninjato>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 28 Jun 2021 11:01:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
Message-ID: <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Wolfram Sang <wsa@kernel.org>, Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, Arnd Bergmann <arnd@arndb.de>,
        kblaiech@mellanox.com, jarkko.nikula@linux.intel.com,
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
X-Provags-ID: V03:K1:G+QIDcHqDNDPoQP79t/Wawoy5stDHoFoWqtxd2cTAhgtfoRy1wd
 YKU1PaYIKtLnyKcUqdf5sGAeI9zDpTJdsj0PiI1kf618Sq4czeCf6lxjhXxGMm4VQ9fmvbb
 ZJUcVeE6TodE6xI6CEyOl+xXgf0y8VzMUFkzQPNzCv8lGqySI4oS979f1YSD7Y3qiQ66Chk
 RN9WiFJfDQSDXG0tt30xQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JOUq9riS6IQ=:MzZgunBCeXCn+fHdLkpRfi
 ovg+rLECVAFtVplUD1GjjPs19ixFQi1eJRO19W+YAz3o7vkPZ4uWX15qtxH8YmW27qTKm+DsT
 Vkn3+Sl6GwYjjft4P/3ef2oN8wkCz84c0sifha2sTKqpFC3pzYS2y+dWXOizZy63sqy7dUxdn
 shepeUsn7+SvpvAA7X2P6zYAW7WEGQdHQJecusD61EualmI+KYgWNsZJSk2q4teOl2A7Gs7tc
 WpFnO9PhsjJNnBxaKOA85MRg/TasbeLYzG+t2iQ1urlMBJqQpzAiaQE5EFsDmXircvlXjbVSn
 v/ZciI7ltpZpNw49gSUgCBnttPRJa+pcYV5yzeUYQLlZo+ktjjmGrUDzF5+jDHVsrA1VigD3B
 Wq40TGt9ySP6USHVeVWXaeJMvhrfZCDEtmLxMnjHYLthfUgofA/28jXzRbMDTu89WpzvY2kf8
 j86F8GK5ocN74olSjfuBYM3JN1UGZ/NATTlv/iF7vi1a8demBcU6Pt1JxpDs7aMv7aCiRTIOL
 9Fm4ConDE639clhMIqzFMbzhxqyZnRFRypxx8zIkAMSGVwSY4DYKkPt7yQM1/nkjBa/dqyVT8
 30lqFEoLwZ5X/iFw2OuUm0d0gH6IxOmiSIfg+vD8j3gKjT+WAE/gm1mZqDfdf5PL6uL8Mb/hP
 z0TY=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 28, 2021 at 10:39 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> sorry for the long delay. I am not familiar with VFIO, so I had to dive
> into the topic a little first. I am still not seeing through it
> completely, so I have very high-level questions first.

You probably know this already, but just in case for clarification
these are two different things:

VFIO: kernel feature to make raw (usually PCI) devices available
           to user space drivers and virtual machines from a kernel
           running on bare metal.

virtio: transport protocol for implementing arbitrary paravirtualized
          drivers in (usually) a virtual machine guest without giving the
          guest access to hardware registers.

Both can be used for letting a KVM guest talk to the outside world,
but usually you have one or the other, not both.

> > The device specification can be found on
> > https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
>
> I think we need to start here:
>
> ===
>
> If ``length of \field{read_buf}''=0 and ``length of \field{write_buf}''>0,
> the request is called write request.
>
> If ``length of \field{read_buf}''>0 and ``length of \field{write_buf}''=0,
> the request is called read request.
>
> If ``length of \field{read_buf}''>0 and ``length of \field{write_buf}''>0,
> the request is called write-read request. It means an I2C write segment followed
> by a read segment. Usually, the write segment provides the number of an I2C
> controlled device register to be read.
>
> ===
>
> I2C transactions can have an arbitrary number of messages which can
> arbitrarily be read or write. As I understand the above, only one read,
> write or read-write transaction is supported. If that is the case, it
> would be not very much I2C but more SMBus. If my assumptions are true,
> we first need to decide if you want to go the I2C way or SMBus subset.

This has come up in previous reviews already. I think it comes down
to the requirement that the virtio i2c protocol should allow passthrough
access to any client devices connected to a physical i2c bus on the host,
and this should ideally be independent of whether the host driver
exposes I2C_RDWR or I2C_SMBUS ioctl interface, or both.

This can be done either by having both interface types in the transport,
or picking one of the two, and translating to the host interface type
in software.

As far as I understand me (please clarify), implementing only the smbus
subset would mean that we cannot communicate with all client devices,
while implementing both would add more complexity than the lower-level
protocol.

> ===
>
> The case when ``length of \field{write_buf}''=0, and at the same time,
> ``length of \field{read_buf}''=0 doesn't make any sense.
>
> ===
>
> Oh, it does. That's a legal transfer, both in SMBus and I2C. It is used
> to e.g. discover devices. I think it should be supported, even though
> not all bus master drivers on the host can support it. Is it possible?
>
> Also, as I read it, a whole bus is para-virtualized to the guest, or?
> Wouldn't it be better to allow just specific devices on a bus? Again, I
> am kinda new to this, so I may have overlooked things.

Do you mean just allowing a single device per bus (as opposed to
having multiple devices as on a real bus), or just allowing
a particular set of client devices that can be identified using
virtio specific configuration (as opposed to relying on device
tree or similar for probing). Both of these are valid questions that
have been discussed before, but that could be revisited.

          Arnd
