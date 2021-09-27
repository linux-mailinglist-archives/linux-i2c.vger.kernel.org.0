Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617EB41901F
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Sep 2021 09:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233226AbhI0HoN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Sep 2021 03:44:13 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:56307 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233223AbhI0HoN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Sep 2021 03:44:13 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MavF5-1n6a4P17hD-00cS5e; Mon, 27 Sep 2021 09:42:34 +0200
Received: by mail-wr1-f42.google.com with SMTP id d6so49487611wrc.11;
        Mon, 27 Sep 2021 00:42:34 -0700 (PDT)
X-Gm-Message-State: AOAM533ZicwIhU5WtzgjhPHcHOI1TFX71SC+iCyAddaN+N0uoMrWeNCG
        20rKS8Y0t7Kbw//f0TGHiPzzuYaqOvmo4rCqZys=
X-Google-Smtp-Source: ABdhPJyAwJs1fMl5WROWadibQbf9i4s452vEEuGBlKBwwPRVMz4Z4aFhReOWFzEvxiKPsQdFWNyIVMvgFQmk0bW7ncQ=
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr25501837wru.336.1632728553884;
 Mon, 27 Sep 2021 00:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210926095847.38261-1-sven@svenpeter.dev>
In-Reply-To: <20210926095847.38261-1-sven@svenpeter.dev>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 27 Sep 2021 09:42:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Lt2QXk+aWLtXUXjjNhKJwNns6d9r=Yh5_aWETuvZTpQ@mail.gmail.com>
Message-ID: <CAK8P3a3Lt2QXk+aWLtXUXjjNhKJwNns6d9r=Yh5_aWETuvZTpQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] Add Apple M1 support to PASemi i2c driver
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
X-Provags-ID: V03:K1:bbDys2bnyLP0F2yE86hVNqxzMvK0gatX+jp0BgTXILxAYhz5rOr
 CBSuFDkMYHP5zmvO+Mmk+tVOLt8baO97TGHu36gRnhgAtSaza4o381uGqyPz3yEaRaglA7q
 FvdBIUiYdns4DgZli94UeqnfShGdB213+Aah/RqPktAyeGumw3lktgn/pUxr+trB/T2+HYx
 hIrbSii+w0Sy567w8Atyg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fEqGRCn6Tbo=:npIMg/pMRKx1NlmYEa9meK
 +CTezP6u9ecmtFvdKIs1ekrIvfXj+RvEO+u7P+93bpNLb2Ns0GKT7k+C+KlhQGvCWcHSs73/z
 LjB4QeHXLHlIx0HkvJObz356W5q8Nc5j88QePDxozkPEyfGDhWm/3AG5UnI8V3rJFHTzpXmDw
 xMTQuI/QvLlVLX2ZjwTc4nxoSYDvFLKTnNynm95gld2ejHOSrKEtES9eXxjiMjUV0DO+RX4pK
 A2xhEfIZDzTrdRrbNL6wZkLf1xu24uxFSohF6apLVYWRgD6pKZNQfB2Nhol1mloI5SHbyh5Q8
 m5Pv8X4Klbmuy5CgmKBaOq+IMrlErL1yWDk7P4edronfMQoX92jSKwt49aFxzejcJE7RRGe3j
 XZ7B8b73NtEyE7SmmrTJsZ10QSoEuC5l+fog9lq65Mf1FHwtWcywGxH7aa41Fat9o4mvAWXT3
 EIsWsAUPMrrYpqXW3pCX70d6ZCUH1kXmu0vXhsUN0+UQBmtPlHm+kgZU4DlpBtuexARxiUTPo
 lu/mHh0lwRitCQ0r8NftOt7IekFlJgtsY5fg37yorZrlE/6GmHaNUv/iPYYOJpkhPex3Gq9pe
 cSxa35uBZAoTux4padWOrOl5QVsGdRPd2rriIFdkAQaXvyMvDtahLX/VLxd73s5lh3Tw8kuF/
 WxYKlwGpQEpBwFl7oD8z1Tt7HYNlVV379ZYjlAuQE8jU5u2dz8GCbwFFQBhG3pcL0iDK5qY8b
 owjbHoRFb8Qsk0fJbXdl/As3X+KpRqNHfmKnqTve3U5hDkWj37Gk3H3FDrCRzJe90fQvFURD3
 i5u7U7NulNymeR3JQ9nCo+gHuczPoibLV/qCcm/VTXMM7I4QqcKATxqPSJSSIigsg+LjsNffL
 CvYXxzPmkVyDU/pEgS6Q==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 26, 2021 at 12:00 PM Sven Peter <sven@svenpeter.dev> wrote:
>
> This series adds support for the I2C controller found on Apple Silicon Macs
> which has quite a bit of history:
>
> Apple bought P.A. Semi in 2008 and it looks like a part of its legacy continues
> to live on in the M1. This controller has actually been used since at least the
> iPhone 4S and hasn't changed much since then.
> Essentially, there are only a few differences that matter:
>
>         - The controller no longer is a PCI device
>         - Starting at some iPhone an additional bit in one register
>           must be set in order to start transmissions.
>         - The reference clock and hence the clock dividers are different
>
> In order to add support for a platform device I first replaced PCI-specific
> bits and split out the PCI driver to its own file. Then I added support
> to make the clock divider configurable and converted the driver to use
> managed device resources to make it a bit simpler.
>
> The Apple and PASemi driver will never be compiled in the same kernel
> since the Apple one will run on arm64 while the original PASemi driver
> will only be useful on powerpc.
> I've thus followed the octeon (mips)/thunderx(arm64) approach to do the
> split: I created a -core.c file which contains the shared logic and just
> compile that one for both the PASemi and the new Apple driver.

This looks all very good to me, I had one very minor comment.

Whole series

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
