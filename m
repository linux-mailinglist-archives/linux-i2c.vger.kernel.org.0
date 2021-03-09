Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1580E332744
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Mar 2021 14:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbhCINfY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 08:35:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhCINfD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Mar 2021 08:35:03 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED3AC06174A
        for <linux-i2c@vger.kernel.org>; Tue,  9 Mar 2021 05:35:03 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id n132so13921495iod.0
        for <linux-i2c@vger.kernel.org>; Tue, 09 Mar 2021 05:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ck/z2PY7/UU/12vnfcPHwdLBuV3dty8tKqz5xSr6NUI=;
        b=FvbITe/rw5UXY8n2Lh+pG4r07ytXqmmOcTREfFBp01LINATnkkXntHCLudSH5T3Zya
         IFCjDgAKS0cB6X36Q1MFdu8Tsv48vx3CatnzrI1690gOoba3wSEeRzbt169NnaLo9JaF
         +NRC/RrkZGprF2QN8v2JzGhUSQVdo6skIS5R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ck/z2PY7/UU/12vnfcPHwdLBuV3dty8tKqz5xSr6NUI=;
        b=lzLg3wTteT440IhfrzMaxX5Bhy86r2luZo23pbY6XdjI2BKGdMkcs3VbVT0DRPA5Vf
         C+4+KyZtGCZnbeHXeciA03hUI8IwHyytQAOIRe8Lsbn+WlFBtMsi4swPbse2COVV0I2L
         cCPimHLxOHZ8zXdGHfVTGIx/RvosW1X7j/vipPiFbbwgikWenxu06AInjL7pwXa8IcSD
         d2mZ2TQ7j82VvwbRfeutZFytC96x6JYPqd+7mgbno2FHsNRSEfmLEM4Kn0iZ50fqA98h
         /X1fIhTV9GFb4VWZGaUc6IQIwYDdlAtaYKl+4H+bdwgnzyUB/oIAckvYVpZUFZxOPIwa
         HRDQ==
X-Gm-Message-State: AOAM5308ruEe7EgPAHvYwZ3XyhzGuJLMaAwiDnRdEJ0BIg2ABa2UhrHf
        GFAn7Yn//dltdWuJ+aAAYd9FokMIwSwyunjTdLjrgh585WNktg==
X-Google-Smtp-Source: ABdhPJwoQjXmYHuZH34QTV1eLRGy43Jol14I26e2wLS/nTH/45wMweeWOOE2mEMr7+tdkvvp21gXyu25ZcW8C7AYcNE=
X-Received: by 2002:a5e:d61a:: with SMTP id w26mr23172366iom.40.1615296902992;
 Tue, 09 Mar 2021 05:35:02 -0800 (PST)
MIME-Version: 1.0
References: <20210308043607.957156-1-hsinyi@chromium.org> <20210308043607.957156-3-hsinyi@chromium.org>
 <20210308171644.GE4656@sirena.org.uk>
In-Reply-To: <20210308171644.GE4656@sirena.org.uk>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Tue, 9 Mar 2021 21:34:37 +0800
Message-ID: <CAJMQK-jZnQ1pt435Dz=xAbuU=wJcMJkSFSnTtuARTW_rGwRCFg@mail.gmail.com>
Subject: Re: [PATCH v16 2/2] i2c: core: support bus regulator controlling in adapter
To:     Mark Brown <broonie@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 9, 2021 at 1:17 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Mar 08, 2021 at 12:36:07PM +0800, Hsin-Yi Wang wrote:
>
> > +     adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
> > +     if (IS_ERR(adap->bus_regulator)) {
> > +             res = PTR_ERR(adap->bus_regulator);
> > +             goto out_reg;
> > +     }
>
> Idiomatically supplies should be named as they are by the chip datasheet
> rather than just a generic name like this, and I'm guessing that systems
> that have supplies like this will often already have something
> requesting the supply (eg, it's quite common for consumer drivers to do
> this) under that name.  I can see this being a useful thing to factor
> out into the core but it seems like it'd be better to have it enabled by
> having the controllers (or devices) pass a supply name (or possibly
> requested regulator) to the core rather than by just hard coding a name
> in the core so bindings look as expected.
>

I'll move the regulator request into device instead of core in the
next version. Thanks.

> I do also wonder if it's better to put the feature on the clients rather
> than the controller, I don't think it makes much difference though.
