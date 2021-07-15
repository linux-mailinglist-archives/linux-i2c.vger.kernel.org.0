Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9B63C961C
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jul 2021 05:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbhGODGY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jul 2021 23:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbhGODGY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jul 2021 23:06:24 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFBDC061762
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jul 2021 20:03:31 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a6so6502157ljq.3
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jul 2021 20:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RYi1IyWrC6TuRygKynXKx82+IBLap68KkX0wmFXBOkI=;
        b=fPgdJBwqBnYQWiYd11LvyqHQtqUg5/9lZMIisCur2LqH+wrbPrb9p+wFI6xx7YdYJS
         Zyodjwg+cvnrnoCDxqgrKvbXFwm0GydR0FqhsRyxPaZB2yy17AJfsKZtvbS5WayU829b
         DjW/QpTuFE35GDQfTVHNZBWp5+5xBCNEPY3XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RYi1IyWrC6TuRygKynXKx82+IBLap68KkX0wmFXBOkI=;
        b=PNqk2o+x0aKD/QXUWyzuASwlvwLDHZp6N6KiTksr6aiSrZRXgr1JuQaGi/LvNEsT4x
         eIpUSz8B+9R/wIhwZ2JQOb75ZOBHglr4wd6sLwZzML/1R3kFkxvKIOMwcjStjVxEsh6R
         IVMkj9AVOWVFPzi/5QZtZjwCggG2ZyZTIuOEMFhs4/ionm0/frVzh/KJ/twLcCfsMTmA
         2MKiCEcqoPbu8oczORseAYbsPmxZQtiPnQDcQY9pRvZAzx7oDNzPtFQIjbEdLsbT7hVS
         rbi+N/9Ngm5K86hCdRuM6dRlfDD0vRZMZHh27FaAHJ/BAcjk6y5O4/pqd2MjNg7p1msw
         KMYg==
X-Gm-Message-State: AOAM53072tpF4eBFpC375JDLVt9Jc6MyIcbQwSEUwtvQ/xXlG2dbF5jv
        b2Xc2C8hBLgif40loNtsxbBStnyiBUmy69g26xOrKA==
X-Google-Smtp-Source: ABdhPJzQk7yOOJgOlV+e8lb/HTrDPbR3LKAVSGY0Jd+8uj7pVvf9Q2SmmBlLZPXG7O+C0Le3DWUNEbjtrttH5wZspC0=
X-Received: by 2002:a05:651c:2115:: with SMTP id a21mr1224483ljq.185.1626318210041;
 Wed, 14 Jul 2021 20:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 15 Jul 2021 11:03:19 +0800
Message-ID: <CAGXv+5FKvz7zwi1k=TZ3YTJJ+facezqN_oigRFEeR26OrejRnw@mail.gmail.com>
Subject: Re: [PATCH 0/8] Due to changes in hardware design, add patch to
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     wsa@the-dreams.de, Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        srv_heupstream <srv_heupstream@mediatek.com>,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        qiangming.xia@mediatek.com, ot_daolong.zhu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, Jul 15, 2021 at 10:37 AM Kewei Xu <kewei.xu@mediatek.com> wrote:
>
> 1. In order to facilitate the review, the two series of patches submitted
>    before have been integrated together.

I'm not sure that really helps. We'll see.

> 2. Resubmit a patch to fixing the incorrect register value.

Fixes can be submitted separately, or at the very least, put at the very
front of the series.

> 3. Add modify bus speed calculation formula patch

When resubmitting patch series, please add appropriate versioning and
changelogs. This will help maintainers understand that this is a new
version of the series, and what has changed. This includes times when
the original patches weren't changed, but additional patches were added.

Please also keep the original series subject, which IIRC was about adding
support for MT8195 I2C. The subject you now used should be part of the
cover letter.

If you combine different patch series, you should use the highest version
number + 1.


Regards
ChenYu

>
> Kewei Xu (8):
>   dt-bindings: i2c: update bindings for MT8195 SoC
>   i2c: mediatek: Dump i2c/dma register when a timeout occurs
>   i2c: mediatek: fixing the incorrect register offset
>   i2c: mediatek: Reset the handshake signal between i2c and dma
>   i2c: mediatek: Add OFFSET_EXT_CONF setting back
>   dt-bindings: i2c: add attribute default-timing-adjust
>   i2c: mediatek: Isolate speed setting via dts for special devices
>   i2c: mediatek: modify bus speed calculation formula
>
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt         |   3 +
>  drivers/i2c/busses/i2c-mt65xx.c                    | 229 +++++++++++++++++++--
>  2 files changed, 217 insertions(+), 15 deletions(-)
>
> --
> 1.9.1
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
