Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705CF1D1DB0
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 20:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732817AbgEMSkf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 14:40:35 -0400
Received: from condef-02.nifty.com ([202.248.20.67]:60096 "EHLO
        condef-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733166AbgEMSke (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 May 2020 14:40:34 -0400
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-02.nifty.com with ESMTP id 04DIYWnV007931
        for <linux-i2c@vger.kernel.org>; Thu, 14 May 2020 03:34:32 +0900
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 04DIYGB0031239;
        Thu, 14 May 2020 03:34:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 04DIYGB0031239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589394857;
        bh=uh/q3wIRj9D8mxhaGFf/csD4DWxBwEldh2d8P3QOpDc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fyRcbsMFf1M7mdA4tFQjP+koPuQItQ25H+cdo6ubIlK2uAt0wzDDgJa7X7K4LE0kL
         cj+9Fge+HUxMVFrJYzU7kudHhz1FSvoib9Q2ytzxwn9cOrDfFyshFiSli34D/VuC8O
         WI/buLPkk7f3KfMvx7h6c1MOmaEcz8XpP7x6TIpRFFrHPd7r9B0Eetare9kF84PW9t
         5evbp4P6EW/M9PzWdzlxdNHSiifaBuhGKgUFkrnznJ1fyc4bE8NRZhE+8LoCzMQpli
         fEt+BYHvor0gKqLpQXZQ583abc6MyDtMO0Al77YXNQypRR9rdrwEGCGG6RTLMn28/B
         Pf+/82dd9liHw==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id g2so416265vsb.4;
        Wed, 13 May 2020 11:34:16 -0700 (PDT)
X-Gm-Message-State: AOAM532H1/cSgN7gIp2kb78WToxVrSOpFKAPbSmYQZjkc1vB6spwnFQB
        QE5CKzQUDhHxHRc3jZb/Zygx5kiu27tdGnCgjFU=
X-Google-Smtp-Source: ABdhPJx2LhA4VLe3aAig9eJCUqnx6r4fHUdJTEZD5bqYhVguYjAawiUKadpaXQb0nksqoxptptfCP5k+6e+L2J24WdA=
X-Received: by 2002:a67:6e07:: with SMTP id j7mr374699vsc.181.1589394855436;
 Wed, 13 May 2020 11:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200422141836.1964676-1-yamada.masahiro@socionext.com> <20200511191400.GA27107@bogus>
In-Reply-To: <20200511191400.GA27107@bogus>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 14 May 2020 03:33:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQjnvh=8A6nz3Kb3xLQ=6Gz6=oVGNfPbCmCazAwt5wTwQ@mail.gmail.com>
Message-ID: <CAK7LNAQjnvh=8A6nz3Kb3xLQ=6Gz6=oVGNfPbCmCazAwt5wTwQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: at24: add microchip,24lc[0-9]+ to the
 compatible pattern
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,


On Tue, May 12, 2020 at 4:14 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 22 Apr 2020 23:18:36 +0900, Masahiro Yamada wrote:
> > arch/arm/boot/dts/uniphier-ref-daughter.dtsi has
> >
> >   compatible = "microchip,24lc128", "atmel,24c128";
> >
> > and 'make ARCH=arm dtbs_check' warns this:
> >
> >   eeprom@50: compatible: ['microchip,24lc128', 'atmel,24c128'] is not valid under any of the given schemas (Possible causes of the failure)
> >
> > Microchip 24LC128 is the device used on this board, and I see it in
> > https://www.microchip.com/wwwproducts/en/24LC128
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  Documentation/devicetree/bindings/eeprom/at24.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
> Applied, thanks!


If it is not too late, can you correct the patch subject?



See the applied commit in linux-next.



Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed Apr 22 23:18:36 2020 +0900

    dt-bindings: at24: add microchip, 24lc[0-9]+ to the compatible pattern




Please notice a space after 'microchip,'



And this is the patch I submitted:

https://lore.kernel.org/patchwork/patch/1229480/


No space after 'microchip,'




This is a patchwork bug.
It automatically inserts a space after a comma.
Patchwork adds various unpleasant modification,
and breaks the commit subject and log.

I reported this bug to patchwork ML, but
still not fixed...



-- 
Best Regards
Masahiro Yamada
