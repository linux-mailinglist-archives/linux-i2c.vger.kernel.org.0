Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D392427297
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 22:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242932AbhJHUvO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 16:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbhJHUvO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 16:51:14 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D249C061570
        for <linux-i2c@vger.kernel.org>; Fri,  8 Oct 2021 13:49:18 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id ls14-20020a17090b350e00b001a00e2251c8so8665580pjb.4
        for <linux-i2c@vger.kernel.org>; Fri, 08 Oct 2021 13:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a9TiIjRscGsypMhkU3F5Luwnaj1KEJJFH5jSCl+q5Ag=;
        b=5aYWkO1/pER1U5USV1nEzyfxkbQO2mlcDkvrtX6sMaZlASzY45T8jVHT1yvAxYPWEB
         EwS3cXT17cKvL/uUwqyF5aUu0nfLax8wNDE7eBZ1rXm/Z87sWBH2V0kjJG4aw5PDVdku
         sywmFFwo7yQ2Eej3VeweCP5KSbkvcmYtqVKxeRp2tW5oAEsBnQPvQn/5th4E+7rEAjaJ
         RZBbWZ1DuY+xf3V5rQiwoftIG2wSM0u4ay+xVYcPNg1KcFEbh2rIDAX3NpgdCVqtxD4V
         HclRMV4uqx91lL3UL88OlDgphWkDFbWhPzQiRA5PeyDWYAlQH8Zu1AxxfW7BWLe0oO6R
         pLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a9TiIjRscGsypMhkU3F5Luwnaj1KEJJFH5jSCl+q5Ag=;
        b=Q3/r6ateKj1KqBOJOLkX6EBfXQZrexPVSZHuZI2f0WVKZYtEOSHM8hRomw/3frvdlX
         /mk4RFDNQHPOlmaHogTLSYPhN3TLPH9sp+g4dopR76vV+oQO4rZBX4d1posVB0rFsYWS
         nZf/RPpwGOdp+DxDXPgmu6SD5joOteFuN0SEkMCW0YmjVYXAvq1MFmFZ+W4IZWq+odyh
         djIBzFQicVMI3rlXE4QtOk3dGGybBJsPFVkxugWAFdtzqmfZjUAaJ81rwJB/kUXGoaie
         c9PURKXbWXGpU6Sl/BhA4iPcYnECC9oZKTVj7aCM6Q01V7AyVPmHwROhGK5PJM6v5XcS
         CjqA==
X-Gm-Message-State: AOAM532JnGbLs3rAdBF00EVzRv/0Fwh5Tu5d09IaC16lWSr/7NJqJeQb
        2jReDCldqomcLauwProyDON87rVjzdMnKTLsL2Kjew==
X-Google-Smtp-Source: ABdhPJxMnEH2xoi24RNEnru2y/0LaOJW4Sqmk5pa8/ErFS/VB9m9afA2AKxUjRr9u00R1TH2nvvEVqnmYTqcMO6JgUs=
X-Received: by 2002:a17:90a:7301:: with SMTP id m1mr14090869pjk.34.1633726157928;
 Fri, 08 Oct 2021 13:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211008163532.75569-1-sven@svenpeter.dev>
In-Reply-To: <20211008163532.75569-1-sven@svenpeter.dev>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 8 Oct 2021 13:49:06 -0700
Message-ID: <CAOesGMgm-8c9ADbFSGRascCEE+ADEsK0v04tVCdd+wC_=GieCw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Fri, Oct 8, 2021 at 9:36 AM Sven Peter <sven@svenpeter.dev> wrote:
>
> Hi,
>
> v1: https://lore.kernel.org/linux-i2c/20210926095847.38261-1-sven@svenpeter.dev/
>
> Changes for v2:
>  - Added reviewed-by/acks
>  - Switched from ioport_map to pci_iomap as suggested by Arnd Bergmann
>  - Renamed i2c-pasemi-apple.c to i2c-pasemi-platform.c as suggested by
>    Wolfram Sang
>  - Replaced the ioport number in the adapter name with dev_name to be
>    able to identify separate busses in e.g. i2cdetect.
>
> I still don't have access to any old PASemi hardware but the changes from
> v1 are pretty small and I expect them to still work. Would still be nice
> if someone with access to such hardware could give this a quick test.
>
>
> And for those who didn't see v1 the (almost) unchanged original cover letter:
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

Series:

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
