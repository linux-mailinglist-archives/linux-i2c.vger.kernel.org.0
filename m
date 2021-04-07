Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BD535653D
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 09:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236731AbhDGHbe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 03:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233299AbhDGHbc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Apr 2021 03:31:32 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F8EC06174A
        for <linux-i2c@vger.kernel.org>; Wed,  7 Apr 2021 00:31:23 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id x17so18340259iog.2
        for <linux-i2c@vger.kernel.org>; Wed, 07 Apr 2021 00:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vo0QZz25bVs/2wmsHRn68V68W2L/UX3nLq5t9B4qTO4=;
        b=CJAEOD5aeMlKoM1hzsZ82mfcFqX0wXQLRiDLPpVwA8eL6sw1FhbiTSZeDa5ZQTGHG7
         LQkMYNnxW++y+rUKTMoFljoeCAt+uadx9x1TFj7rxa4HNYWdAmPMCF/HrZHmYwStkzTQ
         YwAAALsXptK9Yhkho8mWNf8m17qt2IDCX001A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vo0QZz25bVs/2wmsHRn68V68W2L/UX3nLq5t9B4qTO4=;
        b=Fo38xZrMYQjFer7DM5nf37AuQjZoFydlHlQOtp3SuVMfsmVsjbV1uovCDEjpdGd6gy
         6vWiRJdL1s/3MeJRAp5v9nzNLaWgcAW4qsCyhTy9DsBnMPLGddFabVBNX1eDKxR0AvXi
         d5v+5ZWIaEkp2jEvQzLtDz849JgwCTjnLixqjIZalypLZaE4OWOg+aSHPjZFkSfpWQv7
         NwzB3cZ1MNDNzRIe0oJV8qUywN5wSuA/XFU1z5Q6Q2/MscfQIvbmajWcrUjQbeK7J9/R
         XdrgBNSfimRp+EPzRjBZl9dK4ouCZcYFcN2ctWbY+cCgVuW9fU7sDoXX6fxhTOPIzOhL
         l88w==
X-Gm-Message-State: AOAM532vGeAj3D/Gso4AL9dBY5ASkG6wciAUO19FE3ihdevKX7uGPweO
        tJMOC4/0ux3ptu31HepOsufOHnP1aaPdjsgWw4a8H7n1fTnZag==
X-Google-Smtp-Source: ABdhPJz+T5nPKW6gbNnL+LY7rqVL5oNR3VGj+Ica36EvSu5VCzeBQypy3KADhZS8Ye27TvIjvcdTakDpI+xV315kTKY=
X-Received: by 2002:a05:6638:43:: with SMTP id a3mr2064309jap.102.1617780682970;
 Wed, 07 Apr 2021 00:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210308043607.957156-1-hsinyi@chromium.org> <20210308043607.957156-3-hsinyi@chromium.org>
 <20210308171644.GE4656@sirena.org.uk> <CAJMQK-jZnQ1pt435Dz=xAbuU=wJcMJkSFSnTtuARTW_rGwRCFg@mail.gmail.com>
In-Reply-To: <CAJMQK-jZnQ1pt435Dz=xAbuU=wJcMJkSFSnTtuARTW_rGwRCFg@mail.gmail.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Wed, 7 Apr 2021 15:30:57 +0800
Message-ID: <CAJMQK-jqrBdfROr_XZakQb4v+jB31hvLejcSBZjPo=TYqKar1w@mail.gmail.com>
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

On Tue, Mar 9, 2021 at 9:34 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Tue, Mar 9, 2021 at 1:17 AM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Mon, Mar 08, 2021 at 12:36:07PM +0800, Hsin-Yi Wang wrote:
> >
> > > +     adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
> > > +     if (IS_ERR(adap->bus_regulator)) {
> > > +             res = PTR_ERR(adap->bus_regulator);
> > > +             goto out_reg;
> > > +     }
> >
> > Idiomatically supplies should be named as they are by the chip datasheet
> > rather than just a generic name like this, and I'm guessing that systems
> > that have supplies like this will often already have something
> > requesting the supply (eg, it's quite common for consumer drivers to do
> > this) under that name.  I can see this being a useful thing to factor
> > out into the core but it seems like it'd be better to have it enabled by
> > having the controllers (or devices) pass a supply name (or possibly
> > requested regulator) to the core rather than by just hard coding a name
> > in the core so bindings look as expected.
> >
>
> I'll move the regulator request into device instead of core in the
> next version. Thanks.
>
Hi Mark,

v17 is sent here:
https://patchwork.kernel.org/project/linux-mediatek/cover/20210309133131.1585838-1-hsinyi@chromium.org/

Thanks.

> > I do also wonder if it's better to put the feature on the clients rather
> > than the controller, I don't think it makes much difference though.
