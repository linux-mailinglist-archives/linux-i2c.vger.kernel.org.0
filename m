Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149C73B5D67
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jun 2021 13:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbhF1Lzz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Jun 2021 07:55:55 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:47311 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232624AbhF1Lzw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Jun 2021 07:55:52 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mz9hF-1l2pcd13qt-00wF9x; Mon, 28 Jun 2021 13:53:24 +0200
Received: by mail-wr1-f42.google.com with SMTP id u8so7633457wrq.8;
        Mon, 28 Jun 2021 04:53:24 -0700 (PDT)
X-Gm-Message-State: AOAM5337nIPre6DkoebwL0XVS2DUUp5feFqEre95wciyOd8v9mMO4bVN
        fjh4Om6mgCJinbOGPTH2FkyMDelYYzNZ7ZjBRYk=
X-Google-Smtp-Source: ABdhPJzgeeV1Oni80yiuTi9OxHyN5NYhrhIio7ch03ZD5B7a0G2ZxN8TSW57aRgI9A+sZfsbv891q4dL2gyadq0w/UQ=
X-Received: by 2002:adf:e107:: with SMTP id t7mr26147077wrz.165.1624881203891;
 Mon, 28 Jun 2021 04:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNmK0MP5ffQpiipt@ninjato> <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
 <YNmVg3ZhshshlbSx@ninjato> <CAK8P3a3Z-9MbsH6ZkXENZ-vt8+W5aP3t+EBcEGRmh2Cgr89R8Q@mail.gmail.com>
 <YNmg2IEpUlArZXPK@ninjato>
In-Reply-To: <YNmg2IEpUlArZXPK@ninjato>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 28 Jun 2021 13:50:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3vD0CpuJW=3w3nq0h9HECCiOigNWK-SvXq=m1zZpqvjA@mail.gmail.com>
Message-ID: <CAK8P3a3vD0CpuJW=3w3nq0h9HECCiOigNWK-SvXq=m1zZpqvjA@mail.gmail.com>
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
X-Provags-ID: V03:K1:gGi3h1CRILr1ecBD6YdtnUVxZDVOdsWKttG3fVwPzk89d4YD7Qf
 qIJtUlWlDHPs5iaVEEsqhavkFhhzyNrxaVeOX+SdBJO3mAvw+EZqRhqWkae/RZq9l2xE0p4
 MhNUluf3gAp9azfKnANYPhic5DJxpq0E/hwnasFz2Qfqmeml6OdYBf4RaOfFYdu2Euqy6ZP
 BmCHL2XfcDPjWN5ZfHsGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3QO04RmNmPA=:PZDqGGRW72Kl8+rxL9P3xR
 gsXPRmNFWBFXJx3vjkApxQVZl1Ec/OKBTGupe6P4xg1aBOneaeLjlNd9TedKaqgTDhUo+n/ll
 s42iLbZhY5/iQZ9O9rLlR0o1NLjohT8FoXZAukbcJ4YomMIOal4JRc8pQ/5K740M9b5sO7elB
 WffmmofttM9tIoSTAlsYBn1zPmNi4kjFOo3HrWqaLVbOo+34mkKAWIIWWHJOBQc2mkTX6xB89
 Le58Hz8Sy+w4/qnQ44rCvyPKX0hXVKyqeZuL/RRjE2ES56PdKhXCKIqFFkkvgdcgxxqvTXHqp
 0HN/dZnjntbvfuBMlH1JAmucxyLEveRs/xUdNfQ0YCvP+hW7tGipDTuqXX+3E9RHO7XqBL4Pv
 Jv0Ca0b4yCdaIM0C3r5FwiIooSjicnLB5/0imbJrVAfN4RV73QMIUmmdJeyCvJjlSMqDaaNpY
 gleQQDzB9d5W+xMLUtWGwYzpcxiEdihNYyd7tMNSNTZ3Aw0F0Kxf/CpPeL4R0nK8gguabfwWl
 ouk36WU2cO1ffDpfKT1y/PoJ6OPYs/DNFegtRX1X0ds93vC05eFLyBBW2yCJ2f6Jvmu9XTlmy
 m7tLBTeR/NAAgmrMncHRsjG9Lr945A1CaZF6CSfsJrz7J5rHn5vzEkGbe6W3PX/DPpvPQupHL
 XFZA=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 28, 2021 at 12:13 PM Wolfram Sang <wsa@kernel.org> wrote:
>
>
> > Ok, that's what I thought. There is one corner case that I've struggled
> > with though: Suppose the host has an SMBus-only driver, and the
> > proposed driver exposes this as an I2C device to the guest, which
> > makes it available to guest user space (or a guest kernel driver)
> > using the emulated smbus command set. Is it always possible for
> > the host user space to turn the I2C transaction back into the
> > expected SMBus transaction on the host?
>
> If an SMBus commands gets converted to I2C messages, it can be converted
> back to an SMBus command. I don't see anything preventing that right
> now. However, the mapping-back code does look a bit clumsy, now that I
> envision it. Maybe it is better, after all, to support I2C_SMBUS
> directly and pass SMBus transactions as is. It should be a tad more
> effiecient, too.

You can fine Viresh's vhost-user implementation at
https://lore.kernel.org/qemu-devel/cover.1617278395.git.viresh.kumar@linaro.org/t/#m3b5044bad9769b170f505e63bd081eb27cef8db2

As you say, it does get a bit clumsy, but I think there is also a good argument
to be made that the clumsiness is based on the host Linux user interface
more than the on the requirements of the physical interface,
and that should not have to be reflected in the virtio specification.

> Speaking of it, I recall another gory detail: SMBus has transfers named
> "read block data" and "block process call". These also need special
> support from I2C host controllers before they can be emulated because
> the length of the read needs to be adjusted in flight. These commands
> are rare and not hard to implement. However, it makes exposing what is
> supported a little more difficult.

Right, this one has come up before as well: the preliminary result
was to assume that this probably won't be needed, but would be easy
enough to add later if necessary.

       Arnd
