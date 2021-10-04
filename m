Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E964209F8
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Oct 2021 13:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbhJDLWa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 07:22:30 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:56497 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232278AbhJDLWa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Oct 2021 07:22:30 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M9FX5-1mTnWZ1N39-006OM4; Mon, 04 Oct 2021 13:20:40 +0200
Received: by mail-wr1-f41.google.com with SMTP id o20so12139824wro.3;
        Mon, 04 Oct 2021 04:20:40 -0700 (PDT)
X-Gm-Message-State: AOAM532Jd4Po+Bvnbqm4GkigEP2bVjOHyYxoCozDi8gcdjWRMXNBSZ7q
        ewRxpQw07K7OwvM/eoxjkeDpHp+bo43WhY5CnAk=
X-Google-Smtp-Source: ABdhPJwhFhZN1/rLzElq8LxHI+vYWGkiTfpWXOOqhx7kKzXCSyCUhYRu/5RoeP1GLfBuA250yguyI6fH/b4xP7cPZqg=
X-Received: by 2002:adf:f481:: with SMTP id l1mr13368134wro.411.1633346439970;
 Mon, 04 Oct 2021 04:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
 <1B71F6A3-6467-46EF-858F-82E93D54365D@xenosoft.de> <YVrPf4yVFm184LEG@shikoro>
In-Reply-To: <YVrPf4yVFm184LEG@shikoro>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 4 Oct 2021 13:20:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2760x4OYbNBuFCv32Tgt7K3MdJna4qXvPchdKhV8-8vQ@mail.gmail.com>
Message-ID: <CAK8P3a2760x4OYbNBuFCv32Tgt7K3MdJna4qXvPchdKhV8-8vQ@mail.gmail.com>
Subject: Re: Add Apple M1 support to PASemi i2c driver
To:     Wolfram Sang <wsa@kernel.org>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Sven Peter <sven@svenpeter.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Darren Stevens <darren@stevens-zone.net>,
        Matthew Leaman <matthew@a-eon.biz>,
        "R.T.Dickinson" <rtd@a-eon.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:yEGDJdAsg9cAEfqhEAR9pAQVPWRaBH/v0c5qXjHJCtGYJfPwKj1
 Q0FuzH2gcjxVhrSESt8aZyVZZSC8BkDZzWcdFduEBEnM7D1CfKwIabP1DoJ2CDc0XYHDBiS
 dw0vQRAiqxWKEeREgTZMB5K8uke7sce23zpI7vcC2mkuybtwhln5g3mAjzTsdigz5nJ8Kx3
 HYCeQAJCdh2AOPBAap4Bg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DBVNx+O0+SE=:J2teYZ1JJoZ/JJiKj8TtBm
 wO+XbNXpmoXA2sAYAeQD3mFkS20jgeOIEGSKAAFxvDcOizs4t2YQEnOMGIKvn9923cBWcaGul
 TMXJyfAHSN4IywcZ1sn8gd+qgWwoEiFKG1eCBabnNWuqRT/ULak2Lus43aeeEWns352C/f5TH
 YWOEh6hP5dmsEGOH4f4ylgEBY9tfjv5f5PMRbduI5Y7DMvbwgPBOq2jyEa9o2fgKdgEDyXe0G
 qCO2kS0VgIqyzuYrCwAbC+vLrec4fvGHKlewZLvcaANPWhqDN3RrmTdaBQMReHmAPY/HbBupy
 pLRP4AXXE8m+wYWtG03sC9lTFUgEKH0LWxeX02xxRXKkjpwsdU9jDYgN1xtNksdCq5w54TMHU
 h2DIWILMKwMRbFsu4moy8xjgqs6uRpB4IYPuDdGtcFR2963GnUagQ/sTtVdMw8ofhLM1S2OUG
 OYkWzGIzXIHxTR7UBf/2I+2CB2QRk21DQXA0RdMM7HkU8o8RV9SIfet7E94CthVE28D7vpSol
 Unb1dPJTY22hXbMAtWzAtIKAZdfWAL8fFPZcIOu2+7XEczWAdJ8EFEhbYguKzkYho+ayifJPn
 cD8Ni5gN3fnrWCWpplALQe0+ukwwTaCj98+IZfMJ4qwn6zl/RQsSKqskZHJ6CoIAXlpJDBTUm
 Z4YXdqIUgbreafEJXBc47TWud7O+S382sKNA73HZVhNHARHMuMaf3BcTbZgp/+3sCP+WoVacf
 QVA3nSTP8x17ZF4Zr42yuZ+WSUA6fdTLSKfQmw3yGrWrHVqBTWRVOzUv1gUCTYe4Z40WZxOiS
 lD1sJxuX3ai/OrnZJNweZD2oedcioekysWxxZbjBATX/9+LazQgZroRi5DLRevNGycSUEWt1s
 c8taZp2rOcT+BB72758A==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 4, 2021 at 11:55 AM Wolfram Sang <wsa@kernel.org> wrote:
>
>
> > i2c-8 i2c             PA Semi SMBus adapter at 0x(____ptrval____)     I2C adapter
> > i2c-9 i2c             PA Semi SMBus adapter at 0x(____ptrval____)     I2C adapter
> > i2c-10        i2c             PA Semi SMBus adapter at 0x(____ptrval____)     I2C adapter
>
> As Sven correctly switched from %lx to %p, this is intended behaviour.
> Run 'i2cdetect' as root to see the values again.

I think the address could just get removed here, as this is clearly not helpful.
port number, which is somewhat useful for identifying the device, now
it's either the pointless string, or the virtual address that the
device is mapped
to, which is not helpful either and potentially leaks information about kernel
internal structures.

       Arnd
