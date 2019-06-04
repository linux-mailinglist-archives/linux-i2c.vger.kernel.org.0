Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2AEC34AA4
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 16:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbfFDOnB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 10:43:01 -0400
Received: from mxs2.seznam.cz ([77.75.76.125]:40509 "EHLO mxs2.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727413AbfFDOnB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jun 2019 10:43:01 -0400
Received: from email.seznam.cz
        by email-smtpc15b.ng.seznam.cz (email-smtpc15b.ng.seznam.cz [10.23.14.195])
        id 50b0405f64beb56c52b770c6;
        Tue, 04 Jun 2019 16:42:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=emailprofi.seznam.cz; s=beta; t=1559659377;
        bh=1vP8m4FFwuK+upJJmFr4lO874QqXKvLf3jfnj7UFpu8=;
        h=Received:Received:X-Gm-Message-State:X-Google-Smtp-Source:
         X-Received:MIME-Version:References:In-Reply-To:From:Date:
         X-Gmail-Original-Message-ID:Message-ID:Subject:To:Cc:Content-Type;
        b=GvI793uPkkaqljHmqSs3bbyW/F3jkTkqG9FFVVxJT1ye6YKsSPwFl/l1/EBrFXpF7
         IemGxELovrkM8RPOnSzlwM4PkNDyG+464rPlTqNW0GWpFVi9B6S6GoGhtu3EDUX+0b
         CAiuV1F5Zjz4uB0fwd4YuSqWPQTQCvfjv+ltQ7Mc=
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
        by email-relay24.ng.seznam.cz (Seznam SMTPD 1.3.104) with ESMTP;
        Tue, 04 Jun 2019 16:42:55 +0200 (CEST)  
Received: by mail-lj1-f179.google.com with SMTP id v29so8671952ljv.0;
        Tue, 04 Jun 2019 07:42:55 -0700 (PDT)
X-Gm-Message-State: APjAAAVJ3FvKjSwsVj+xNA++ux5+i8mCJkdGKu4qt/GbxV6qIJBiVJSq
        /ZNynw82pg6L4Bk91S0aEVvmr1TU3O9m9Lz8PCI=
X-Google-Smtp-Source: APXvYqyLLyPXpH+YTbZFALL7KAloU36/jPkNJ1KzuIWYUHB+Mh12gZx5k/4ObTDy1e1n0k270GhuPozl4Gz2VLsNGVM=
X-Received: by 2002:a2e:1312:: with SMTP id 18mr15593867ljt.79.1559659374603;
 Tue, 04 Jun 2019 07:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190604113407.8948-1-sr@denx.de> <20190604113407.8948-2-sr@denx.de>
 <CAEEQaa9D0cWFNa_MtiGQ5hD4Z+0vG5ftV6etEr-dRMAW2AA1yQ@mail.gmail.com> <0b60c94f-4a06-90f8-cdb7-1cbef090bd3a@denx.de>
In-Reply-To: <0b60c94f-4a06-90f8-cdb7-1cbef090bd3a@denx.de>
From:   Jan Breuer <jan.breuer@jaybee.cz>
Date:   Tue, 4 Jun 2019 16:42:43 +0200
X-Gmail-Original-Message-ID: <CAEEQaa-VvoJRNM7QSKJf7eNvKDAPN9OK9NWOkPr3bvnsh31+KQ@mail.gmail.com>
Message-ID: <CAEEQaa-VvoJRNM7QSKJf7eNvKDAPN9OK9NWOkPr3bvnsh31+KQ@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver
To:     Stefan Roese <sr@denx.de>
Cc:     Jan Breuer <jan.breuer@jaybee.cz>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stefan,

On 04.06.19 16:03, Stefan Roese wrote:
>
> Hi Jan,
>
> On 04.06.19 15:00, Jan Breuer wrote:
> > Hi Stefan,
> >
> >> +#define MT76XX_I2C_INPUT_CLOCK 40000000
> >
> > This is peripheral clock and should be reachable by devm_clk_get() and
> > later clk_get_rate() should give value similar to
> > MT76XX_I2C_INPUT_CLOCK.
>
> Unfortunately not (yet) in mainline Linux.

Ou, I didn't notice.

> > I don't have currently recent enough kernel to test it or prove it,
> > but I see this in openwrt I2C driver for this platform
> > https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/patches-4.14/0045-i2c-add-mt7621-driver.patch
>
> Yes, its available in the OpenWRT v4.14 tree, but not in mainline
> Linux (AFAICT).
>
> I might try to make some time to add this clock driver for these
> SoC's. But I would prefer to use the hardcoded define in this
> driver for now, to not block its usage in mainline any longer.

So it definitely makes sense to hardcode it for now.

Best regards,
Jan Breuer
