Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50CA8419019
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Sep 2021 09:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbhI0Hl1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Sep 2021 03:41:27 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:59063 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbhI0Hl0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Sep 2021 03:41:26 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M2fHt-1mYLD237XD-004G11; Mon, 27 Sep 2021 09:39:47 +0200
Received: by mail-wr1-f41.google.com with SMTP id x20so4935312wrg.10;
        Mon, 27 Sep 2021 00:39:47 -0700 (PDT)
X-Gm-Message-State: AOAM530ZPw2Gm3uTeKMOr6lYU4sUvf/qK641Wgntlgw2jd4iumBuqL2v
        axFgJFhlPRK8b25DJslT5/w1RaP5oKLUaL1/y+g=
X-Google-Smtp-Source: ABdhPJytwg2Jscle8D6U7FjXeASR49u7ckmZRsHWvpWZ7dVMwzcRYybH1hTRxtWvWXS2xPhWFtHNHK/cOuV06y8U5RI=
X-Received: by 2002:adf:f481:: with SMTP id l1mr26255175wro.411.1632728387404;
 Mon, 27 Sep 2021 00:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210926095847.38261-1-sven@svenpeter.dev> <20210926095847.38261-3-sven@svenpeter.dev>
In-Reply-To: <20210926095847.38261-3-sven@svenpeter.dev>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 27 Sep 2021 09:39:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2_6rcQa8TCgw=6uH26UfjShrVVu-zfLf2=pi6Z8cGOPg@mail.gmail.com>
Message-ID: <CAK8P3a2_6rcQa8TCgw=6uH26UfjShrVVu-zfLf2=pi6Z8cGOPg@mail.gmail.com>
Subject: Re: [PATCH 02/10] i2c: pasemi: Use io{read,write}32
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:T7p1J/1gB9Ic7E3sfD9ruZZkCnSPI8KkU/E35WvgjvauMw5SpLu
 2IdmKc4b860GWnsILXMwg0WFK4Q1lAPsz11y8StDLKe0yh7rJvEgzgVnJV3G37Zpjmam9Xf
 Jn7B71Sww5mFMaT9dxwQQvaiRipK56FNDqZ8n5StSZo7oWTJVd8upIRRmVn/93C5rCsoYVI
 3IkmNmGyChs2jZHT9sbrQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Pjdh4uzTX5g=:bevCXAHoUI70a0BpBWqf5/
 MUEqJ1Cmg43/F5977LofeJffSnkOBpTgFwP14pgfzEV+JObgpBf4Zksu7Nz4vE2jUSMArfRqT
 WocMtLH8Dy5A3gMnZ1O+6KWK9q9CASajHitjmCEqzBobWBlpRtUb3WGSYnQXdAWgU2ZhEamWv
 KwBctQd4KZ7IjSCCN6mr3lnboPwUyOfa12lnPmiGqHOt5M/FyLfY0QQF7ObnMV6qpKexZIio8
 rwiGKFFoMBYeAMWUNCM2zd6gYIvb7KYNstDGE56wpx6Bxy0CIwzR+I9vfUtFtNll8D210Gyf3
 u+4mvuzo+f9GhTptAljR4SG6GcGEgsS6WrU5EPdSp6Q4bjPhVpQyvDsyxfDAwdWCi7iYnt/9f
 MPyZ8u4csslxQhqwQdF/QLW7l6hVHID+66OkVx+90wmLVJE2zZkP391mcC9ZISHIdEQqnjwVO
 J3EK3EhrbHqX8X8eVyTiyyn+ozQ7JnvBswg/6127Jv9JJAJjchGq16BFZkMZg2U1HzP+5JL8k
 f7aWOax8jN8LaHxOcypIihHpwPJYobam50XnHEwACMiKd+JX9w4Eu2SaxUxWI9tZly9JdNfYA
 xvjIhrxve0dpMtnaTzyPENL7Sxdhpix4f2mYRknWas2A+w87HevxeJrEsWaw6CJDU/dKnINvk
 pOqc+5ue2BThRIcY5zrUTBupKeBPJ45ay7HQqZUkVOKcNFAd1UAwqxpyulM73Dwfu1uFGyFUq
 xys8THosaHvFYlUSVd6j9c/nkKlJVwecWY9aC/wI6V94P2nifp3swq83/pca3q3TtVpWg3kXr
 /lpbONZAhWBZBzzR5Uiqj/5DxYePYYNAfzsj8qxCxeRR0LV9z+rxx/3lml8Q9+yy42yoQmYx0
 ZVoV1E3igiknSkq9XhDw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 26, 2021 at 12:00 PM Sven Peter <sven@svenpeter.dev> wrote:
>
> In preparation for splitting this driver up into a platform_driver
> and a pci_driver, replace outl/inl usage with ioport_map and
> ioread32/iowrite32.
>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
>
> +       smbus->ioaddr = ioport_map(smbus->base, smbus->size);
> +       if (!smbus->ioaddr) {
> +               error = -EBUSY;
> +               goto out_release_region;
> +       }

While this works, I would suggest using the more regular pci_iomap()
or pcim_iomap() helper to turn the port number into an __iomem token.

        Arnd
