Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4177427286
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 22:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243192AbhJHUtp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 16:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243172AbhJHUtp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 16:49:45 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8739C061755
        for <linux-i2c@vger.kernel.org>; Fri,  8 Oct 2021 13:47:49 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id ls14-20020a17090b350e00b001a00e2251c8so8663391pjb.4
        for <linux-i2c@vger.kernel.org>; Fri, 08 Oct 2021 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t4CIiQ2IZifzfO1S6EOd33trwTzZFffSiflj15uAAVE=;
        b=YpMxZY3n9gbkNSH+7be2/NK2ysrVgRJ8X8FMlaJg168WjJa8hpTuGZPN8JEBqtGdhW
         jjAfsQoPR3v8K7A3ONibX8xI4xsU7Cg/CUe8QhkTGyeDldsKoVuOTQAfDU4rCzQjv5Na
         jXnqNU892IDOQzHQifmM7xQVZkY6/EngaHOK2N2rCgsZrJjVaEkfi/VyVO6DCDYhTQwY
         dNm9TcxNk9h5QI49D79AqEXvnKURtxTqxwkmBRQsONF5keSVCBRCt5bRBiK/kMbxYmud
         Pw19qkeVImsYGAyFkiAQHB9qchmdWGLOSvN9JP/6yqxLkpIDQ3uAVV5YENuXpJ6OIIYy
         c0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t4CIiQ2IZifzfO1S6EOd33trwTzZFffSiflj15uAAVE=;
        b=fmxWvxN6++fmEIHyRiTxr8XIFWHflXJ2OB7v0Nf7/NarqNWPEWHXsLVDfCcxHJiiIc
         v2hGrlz8gneGZ4bL7IzZfNAp1Bdtz9KHp0wZPc0nrSznuR7UczWvm4CdtOviUJ4kAx3o
         5u4JtxkltaiMTuWjNf5SWbBfEuOEfOqNHzmIyKcSZyDYmE52x2YwzgRCF6ocn5y/SHuA
         ILttEJDJfmRTdD/qfY9FTULG2nmT2IcJ/MFIuRaucbp5oT7+TOItRACHEdumb/ZdIQx/
         m5RA1JvYLCPohsWQPjXlg6J0nhAR3EZFIBkcwus1edLuBmgKkdNPJva9OBWw4QuntHE6
         unAg==
X-Gm-Message-State: AOAM532Itp5IamarR8lcUx93YtlE07UvQ8iZRI1iQVNwzQyRMT1FD7W7
        Ds1fK+hOtTgoDz1E4pVqbtkMeS29vn7XR1SAyDFTpA==
X-Google-Smtp-Source: ABdhPJypmgQv4T/Wc0DMrpjvau3LVuaOQpfECvvN1A8H1c3ueU3qLgzA0GwZV2Gz0N76bWvLD1vh8OO8lH4cQgfdsaU=
X-Received: by 2002:a17:90a:ec17:: with SMTP id l23mr2487525pjy.184.1633726069175;
 Fri, 08 Oct 2021 13:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <87mtnylaam.fsf@mpe.ellerman.id.au> <B2915AF7-A603-43CC-9ED4-9F8A869CBCC5@xenosoft.de>
In-Reply-To: <B2915AF7-A603-43CC-9ED4-9F8A869CBCC5@xenosoft.de>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 8 Oct 2021 13:47:37 -0700
Message-ID: <CAOesGMgnx6P=J--bygw=vcL1b4mQbdACBX+Mwc7BtmEmMtP7KA@mail.gmail.com>
Subject: Re: Add Apple M1 support to PASemi i2c driver
To:     Christian Zigotzky <chzigotzky@xenosoft.de>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Christian,

Self-service available on lore:
https://lore.kernel.org/all/20211008163532.75569-1-sven@svenpeter.dev/

There are links on there to download a whole thread as an mbox if needed.


-Olof

On Fri, Oct 8, 2021 at 1:20 PM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> Hi Michael,
>
> Do you have a mbox link for the v2 changes?
>
> I would like to test them on my AmigaOne X1000.
>
> Thanks,
> Christian
>
> On 27. Sep 2021, at 09:58, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> =EF=BB=BFChristian, the whole series is downloadable as a single mbox her=
e:
>
> https://patchwork.ozlabs.org/series/264134/mbox/
>
> Save that to a file and apply with `git am`.
>
> eg:
>
> $ wget -O mbox https://patchwork.ozlabs.org/series/264134/mbox/
> $ git am mbox
>
> It applies cleanly on v5.15-rc3.
>
> cheers
