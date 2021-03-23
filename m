Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A0D345ACD
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 10:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbhCWJ2d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 05:28:33 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:41319 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhCWJ2Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 05:28:16 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N2Dgk-1loNuL0uw2-013gLX; Tue, 23 Mar 2021 10:28:15 +0100
Received: by mail-oi1-f169.google.com with SMTP id a8so16311506oic.11;
        Tue, 23 Mar 2021 02:28:14 -0700 (PDT)
X-Gm-Message-State: AOAM531iG1ViPnbVS7RiBltK2uo+l/PFsb+4X0LYI/SxC3tS4WVd2ONu
        xBJd+0r3yhdPx5soIjHZ3Ly78aOj3bEp7ZGT0S8=
X-Google-Smtp-Source: ABdhPJyawnqd0rPTfMgWQN81x6KOuu3+lmy+fOx7JqHwDIybakw6kdseTvKueo+vyCC0bOoWLnxxhWHxrRhczxkY/TI=
X-Received: by 2002:a05:6808:313:: with SMTP id i19mr2540633oie.67.1616491693900;
 Tue, 23 Mar 2021 02:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323072704.rgoelmq62fl2wjjf@vireshk-i7> <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
In-Reply-To: <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 23 Mar 2021 10:27:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
Message-ID: <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Jie Deng <jie.deng@intel.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
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
X-Provags-ID: V03:K1:egATLUyzieXtsrQfMRCVYWUZnzImYh/1ascOeVfWMjzEYrrABAz
 PBWEz0qgkSx6ZEOakggslgdFDLNVhWqAhqLaeIltLrN/06onNAEWkReDeOsLVi22oaEgj6a
 ZLmy7dwFWkBWATcd3zt1rgiZLNma2nq6wQ3nQIgBN3xQERBiz+P9aronyKYTmQtIJFMEWtd
 S/XhU9dZmv3A/Q6+TwQjQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TxVTvq3CAGE=:zJysHmGoXxhKAWDtPfQu8j
 e2DElHex85CLE+l/3c69zXnl6P80O0hwt1a5VgwY2EM06Ri1tq5dWhUujeqEBqTNqhSCOTk5f
 6YMg8KhL48OXMItSWEDOA4kavo88cMu7OfbkXN/Jk0TfuN7PzJsovOQ2sihKWYxUiZclvSD5A
 WLuHAguiAH0Qkz1eJG137CkxsCSgUym8D0+qDnLPGHOCvMfYf/7VdsKOInYGHUY9GntLpe8rd
 YEjRvPMQyyfiXkjCcQ2NSP1Jaxli4dm11yotmtn4thNbOz0TNRHsSLZYzTFQsvRfZ90su5OBx
 tlE3lhZ8GoYXmivqYOyAuQD/VL7nu4ayzAu5nn2DwUvs/BpZh0k8uQoTQ9mszCYu7p7zzPiLM
 ChaDrJCL3Li9RF412jAGMry2vp5sV/7CuhpBdwKvwxc0F9UvPvWRpevawvIxppNvc8EZwRG6D
 IMxIdlBEw59uUHInujOFY/uiDvKGnxXKcVflVBSwuDgRwC+MByb9d7npZb2G9FrbnG0qeWGu/
 i56r82WN8ixsh2Ww+J0bnYS/AoC/nVCPd7jlVlXoabsz4x6DGpCzCLW2/I4yr4wNw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 23, 2021 at 9:33 AM Jie Deng <jie.deng@intel.com> wrote:
>
> On 2021/3/23 15:27, Viresh Kumar wrote:
>
> > On 23-03-21, 22:19, Jie Deng wrote:
> >> +static int __maybe_unused virtio_i2c_freeze(struct virtio_device *vdev)
> >> +{
> >> +    virtio_i2c_del_vqs(vdev);
> >> +    return 0;
> >> +}
> >> +
> >> +static int __maybe_unused virtio_i2c_restore(struct virtio_device *vdev)
> >> +{
> >> +    return virtio_i2c_setup_vqs(vdev->priv);
> >> +}
> > Sorry for not looking at this earlier, but shouldn't we enclose the above two
> > within #ifdef CONFIG_PM_SLEEP instead and drop the __maybe_unused ?
>
>
> I remembered I was suggested to use "__maybe_unused" instead of "#ifdef".
>
> You may check this https://lore.kernel.org/patchwork/patch/732981/
>
> The reason may be something like that.

I usually recommend the use of __maybe_unused for the suspend/resume
callbacks for drivers that use SIMPLE_DEV_PM_OPS() or similar helpers
that hide the exact conditions under which the functions get called.

In this driver, there is an explicit #ifdef in the reference to the
functions, so
it would make sense to use the same #ifdef around the definition.

A better question to ask is whether you could use the helpers instead,
and drop the other #ifdef.

       Arnd
