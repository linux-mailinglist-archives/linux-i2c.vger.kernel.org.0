Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E91438BC97
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 04:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhEUCoo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 22:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbhEUCom (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 22:44:42 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCEDEC061574;
        Thu, 20 May 2021 19:43:18 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id a7so5396942qvf.11;
        Thu, 20 May 2021 19:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ri3eYuWT7L+zZwKbNsPuCTbBOkIewFHwKjlwnXef214=;
        b=c4jF2cNeItNfmRR4lGIMPTE++qZBL7sJ9VGjGZeefXTpuFfGFos+6n3rSVKssWKLwg
         72EX/0gzLENCO6YtjZtB0AWQGcdMOQd/asoMACXIZQynZBsRXOqDJ77xJJe8kjM/CZx6
         pQl4J84XzIN1q+IjhnsnWuXWw2reM/pg+Pb3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ri3eYuWT7L+zZwKbNsPuCTbBOkIewFHwKjlwnXef214=;
        b=hzgTzkT6DUhUnaD6dpguNOxT1v04nshKrCIVRu1u2T4gQ20jnS9WjsRMNJX+g7dKEe
         NINNutf+kUssrM9Vg3lZ0tnZXB9OsRyMhX8/ed5L34O1xvbqi6tQ6rSLUCdgAO0OGX1d
         bGck82lECDucbGpbtFZDlWA4oGcyZembN7enzENUMB8iYo8YDfmZ5Y0SQ7l1qEMOEKxZ
         f8ZNN+pfKUoTvhyplfQYrWG4pHmZfIAROf/rfGrUp+8Ik0X32rVan26UDhJm31jqrwJU
         U9pLOumqiMPLsq2bx9L2YPBA+40sddbBuYjnwLCXU1prDhA5Dp5TeNoiUDk6hoEfs7ED
         L8XQ==
X-Gm-Message-State: AOAM532xN8k/SUjfEX/5+3AahlnYXeJ8J1xchBvD1fO3Ln0F6QEjmUHJ
        +7iSN1qr1rrBIZUrGSo72f0ZNHgAd+NwrX6ZSos=
X-Google-Smtp-Source: ABdhPJx0PePfwy8UUauDOX3x2o9mQhIfTFfv1e0JuFf7mc8aXj6h1jcDNLXGmDnwW78ovwiscPFSmxWexbU1fQ5DNsM=
X-Received: by 2002:a0c:d80b:: with SMTP id h11mr9630257qvj.10.1621564997782;
 Thu, 20 May 2021 19:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210506205419.26294-1-zev@bewilderbeest.net> <CAFd5g46TEFLWdBN80RxGwZfoyD-70C0pP59mhrynvD5ODd2wrg@mail.gmail.com>
In-Reply-To: <CAFd5g46TEFLWdBN80RxGwZfoyD-70C0pP59mhrynvD5ODd2wrg@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 21 May 2021 02:43:05 +0000
Message-ID: <CACPK8XfYJjuBHSA=8gojb7YiPc9AeH5sMd08amx_=GgjEKe_eg@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: aspeed: disable additional device addresses on ast2[56]xx
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     Zev Weiss <zev@bewilderbeest.net>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 7 May 2021 at 19:57, Brendan Higgins <brendanhiggins@google.com> wrote:
>
> On Thu, May 6, 2021 at 1:54 PM Zev Weiss <zev@bewilderbeest.net> wrote:
> >
> > The ast25xx and ast26xx have, respectively, two and three configurable
> > slave device addresses to the ast24xx's one.  We only support using
> > one at a time, but the others may come up in an indeterminate state
> > depending on hardware/bootloader behavior, so we need to make sure we
> > disable them so as to avoid ending up with phantom devices on the bus.
> >
> > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>
> Looks great! No concerns from me.
>
> Nevertheless, I am not in a position to test this at this time. Joel,
> or Andrew could one of you (or someone else on the mailing list) test
> this?

I tried testing this by connecting I2C1 and I2C2 (schematic numbering)
on the AST2600A2 EVB. I got it working, but only when I read a single
byte. There's more about that below, but it's a different issue
unrelated to this patch.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Joel Stanley <joel@jms.id.au>

--
On to the bug I saw:

When reading one byte, it works:

root@ast2600a2:~# dd status=none
if=/sys/bus/i2c/devices/i2c-2/2-0064/eeprom  count=1 bs=1| hexdump -C
00000000  48                                                |H|

If I try to read more than one byte:

root@ast2600a2:~# dd status=none
if=/sys/bus/i2c/devices/i2c-2/2-0064/eeprom  count=1 bs=2 | hexdump -C
[ 1568.320096] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1568.328385] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1568.339106] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1568.347423] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1568.358112] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1568.366430] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
dd: error reading '/sys/bus/i2c/devices/i2c-2/2-0064/eeprom':
Connection timed out


If I then go back to reading one byte, I get the error the first time
but the data does come out:

root@ast2600a2:~# dd status=none
if=/sys/bus/i2c/devices/i2c-2/2-0064/eeprom  count=1 bs=1 | hexdump -C
[ 1593.306360] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1593.315191] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
00000000  48                                                |H|
00000001

Subsequent reads work as expected.

With further debugging turned on, this is the log of doing a two byte read:

[ 1781.027360] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.027552] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xec0b0000
[ 1781.027751] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.027906] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000001, cmd 0xea250000
[ 1781.028069] aspeed-i2c-bus 1e78a180.i2c-bus: received error
interrupt: 0x00000008
[ 1781.029683] aspeed-i2c-bus 1e78a180.i2c-bus: SDA hung (state
a050000), attempting recovery
[ 1781.029760] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xd2b10004
[ 1781.029773] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1781.038729] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000020, cmd 0x0a050000
[ 1781.038761] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1781.046932] aspeed-i2c-bus 1e78a100.i2c-bus: received error
interrupt: 0x00000020
[ 1781.047022] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.047195] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xec0b0000
[ 1781.047404] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.047556] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000001, cmd 0xea250000
[ 1781.047756] aspeed-i2c-bus 1e78a180.i2c-bus: received error
interrupt: 0x00000008
[ 1781.049367] aspeed-i2c-bus 1e78a180.i2c-bus: SDA hung (state
a050000), attempting recovery
[ 1781.049421] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xd2b10004
[ 1781.049435] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1781.058322] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000020, cmd 0x0a050000
[ 1781.058351] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1781.066522] aspeed-i2c-bus 1e78a100.i2c-bus: received error
interrupt: 0x00000020
[ 1781.066609] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.066789] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xec0b0000
[ 1781.066998] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.067148] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000001, cmd 0xea250000
[ 1781.067313] aspeed-i2c-bus 1e78a180.i2c-bus: received error
interrupt: 0x00000008
[ 1781.068968] aspeed-i2c-bus 1e78a180.i2c-bus: SDA hung (state
a050000), attempting recovery
[ 1781.069083] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xd2b10004
[ 1781.069100] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1781.077903] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000020, cmd 0x0a050000
[ 1781.077934] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1781.086106] aspeed-i2c-bus 1e78a100.i2c-bus: received error
interrupt: 0x00000020
[ 1781.086186] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.086371] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xec0b0000
[ 1781.086579] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1781.086730] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000001, cmd 0xea250000
[ 1781.086897] aspeed-i2c-bus 1e78a180.i2c-bus: received error
interrupt: 0x00000008

This is the result of the first single byte read after the error state:

[ 1710.150555] aspeed-i2c-bus 1e78a180.i2c-bus: SDA hung (state
a050000), attempting recovery
[ 1710.150627] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xd2350004
[ 1710.150646] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1710.159468] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000020, cmd 0x0a050000
[ 1710.159500] aspeed-i2c-bus 1e78a100.i2c-bus: Expected ACK after
processed read.
[ 1710.167681] aspeed-i2c-bus 1e78a100.i2c-bus: received error
interrupt: 0x00000020
[ 1710.167793] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1710.167971] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000004, cmd 0xec0b0000
[ 1710.168178] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000084, cmd 0xec0b0000
[ 1710.168335] aspeed-i2c-bus 1e78a100.i2c-bus: slave irq status
0x00000002, cmd 0x0a070000

This is unrelated to your change, but should be investigated by anyone
looking at slave support on the ast2600.

Lets go ahead with merging this change.


>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
