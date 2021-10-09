Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B4D4277B0
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Oct 2021 08:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbhJIGOE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Oct 2021 02:14:04 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:10708 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232554AbhJIGOE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Oct 2021 02:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633759847;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=JVWe11piAfJAdJymevoTxJyW/bmqebDGO4Tn3HRu4b4=;
    b=Q0RJ3AaLtlsUYxULnfHfBH9qDpEuvo7yTdNE0iYvtrjgog/pvh4+8+3tEqCOHBcBaa
    hESf15Um2Ws0E3aXKjhDvFaVu5v4k3VLf/njeI0Qhd9b1/HOlYoJ1s1mTwY3hkXG822A
    7hVFryIvLIAbrOvYRp0EK/HhQkm0xI3Zi/FOJ7JEKoymWd1WIDYMn0SfENkAeStOFMcI
    zPiwK8z2VMP3FUh5TX0BLeMcCC2Wle8dudSP7XJTD/AOw7YYzTFfO9jnpdeE4c2Gy1ww
    TL4FHG/tH7lcWdJKdruYBQ01xnUU3FGOqwhrCFsqElmZ1TXbMNM+fnjAtD7yRn3c33Lt
    NEgg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaM9fNtIXuaJFHrSAKNftmKoHNgA/QJNkOVJjQPPQ=="
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id I00cdex996Ak4d2
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sat, 9 Oct 2021 08:10:46 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Add Apple M1 support to PASemi i2c driver
Date:   Sat, 9 Oct 2021 08:10:45 +0200
Message-Id: <F5C910BA-665C-4744-BAAE-9B3ED80974A0@xenosoft.de>
References: <CAOesGMgnx6P=J--bygw=vcL1b4mQbdACBX+Mwc7BtmEmMtP7KA@mail.gmail.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Darren Stevens <darren@stevens-zone.net>,
        Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>,
        Hector Martin <marcan@marcan.st>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>, mohamed.mediouni@caramail.com,
        Matthew Leaman <matthew@a-eon.biz>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "R.T.Dickinson" <rtd@a-eon.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Stan Skowronek <stan@corellium.com>
In-Reply-To: <CAOesGMgnx6P=J--bygw=vcL1b4mQbdACBX+Mwc7BtmEmMtP7KA@mail.gmail.com>
To:     Olof Johansson <olof@lixom.net>
X-Mailer: iPhone Mail (19A348)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Olof,

Thank you for the hint.

I think I have found them.

Link: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D26610=
4

Mbox: https://patchwork.ozlabs.org/series/266104/mbox/

$ wget -O mbox https://patchwork.ozlabs.org/series/266104/mbox/
$ git am mbox

Thanks,
Christian

On 8. Oct 2021, at 22:47, Olof Johansson <olof@lixom.net> wrote:

=EF=BB=BFChristian,

Self-service available on lore:
https://lore.kernel.org/all/20211008163532.75569-1-sven@svenpeter.dev/

There are links on there to download a whole thread as an mbox if needed.


-Olof

On Fri, Oct 8, 2021 at 1:20 PM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:

Hi Michael,

Do you have a mbox link for the v2 changes?

I would like to test them on my AmigaOne X1000.

Thanks,
Christian

On 27. Sep 2021, at 09:58, Michael Ellerman <mpe@ellerman.id.au> wrote:

=EF=BB=BFChristian, the whole series is downloadable as a single mbox here:

https://patchwork.ozlabs.org/series/264134/mbox/

Save that to a file and apply with `git am`.

eg:

$ wget -O mbox https://patchwork.ozlabs.org/series/264134/mbox/
$ git am mbox

It applies cleanly on v5.15-rc3.

cheers=

