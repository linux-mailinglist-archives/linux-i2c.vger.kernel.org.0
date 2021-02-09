Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5BA13155D6
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 19:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbhBISYe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 13:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233226AbhBISV5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Feb 2021 13:21:57 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3B4C06178B
        for <linux-i2c@vger.kernel.org>; Tue,  9 Feb 2021 10:21:16 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id jj19so33342357ejc.4
        for <linux-i2c@vger.kernel.org>; Tue, 09 Feb 2021 10:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7cdkDnURV9uneBG3FZf4huY2uy2h38N8kqyzGlj6AtI=;
        b=zYwZZ4NjNSfAiSwsBYVuFR9u8PsuFfwnsy/wdZFz8ssGxdan5DbrHrhRiV8KzLf6tO
         rNCef+GlVPADxaWfKmY5x7TEuhWk4comNp0sfHsOFQcrmU1MAhJuxD7R9vUmC4rfVyrt
         ENnQ4xCFZnc99McojJkekPBldx66IiSH0WgOHnVd0yudSSNz8DFcbftNnqV+EXyssyq7
         Sjxvaya1p3W00HTeGXy2VY0t1Ok2C4M2pfkHR+q012fvgk8EA/hn6zoZniiXOc17j3Uq
         EC1hcay5GJz34KKl1JM4Hi2xObTc7DOFxKgC5FfoleFg0ml5pPWRGpbjAOXV1mbH+++C
         QkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7cdkDnURV9uneBG3FZf4huY2uy2h38N8kqyzGlj6AtI=;
        b=rcxn7BOHiIZbVoado/MDMp4VmosV2qabvF0kSI7cAp/of1CZDg/DjvgQhSeYhbmMaa
         2F1jV2ZxNqYcN988qxmMeJruOOlGamIqwYguO5/1d9FZ34JN3INe6ZGPdiUqH+OtpQYC
         DxraKQp9QS6yF32dy/65CZcdcOsdrsEU/lB3j4VolYokOskqlSGeVxPvxhHfFABnpAEW
         302X7rFWRLSpvNspDb8bdX7gYuDzYpCj5JLSdQkddObIE6mT1VjXS6eBf9/shvB4J5yP
         hEgUAS9MkSYfw8dX9tvydKM/KR5BiUx9wCjHf+OZ5aKqwbPJ9GVJ6y8IMgPkRTY6oyFl
         iBjQ==
X-Gm-Message-State: AOAM531f1gFdW6BLB7MnCkUpIZQuhYwiG/jUAxhK5z8z8uQm91irdvSR
        mfP7+jGzQJZjDeHIdC66+ajUbsgYH9oIKGcWQoZISQ==
X-Google-Smtp-Source: ABdhPJzfO6VJFRZMDFakluIwxGzSS3vgzvTNq1ZZNEEpzZEUvu1Ol2fCOByPa461RddADA9Vpjd5NXJawuBAuX+BuQE=
X-Received: by 2002:a17:906:4707:: with SMTP id y7mr23481756ejq.445.1612894875564;
 Tue, 09 Feb 2021 10:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20210128111343.2295888-1-geert+renesas@glider.be>
 <20210128113353.GN963@ninjato> <CAMuHMdW--A2bwe==+A35_sLAS2OkXzi2hY0Ky_dwL0n8irHMZw@mail.gmail.com>
 <CAMpxmJXcbTnCbseAap=F0QO2Er6ANGSfgPMuoufaD2qQyUbpRA@mail.gmail.com> <CAMuHMdU3g3TaWTu6XvKTUU9cdj6Dnbjcgy4zSRhshzeAhH30GA@mail.gmail.com>
In-Reply-To: <CAMuHMdU3g3TaWTu6XvKTUU9cdj6Dnbjcgy4zSRhshzeAhH30GA@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 9 Feb 2021 19:21:04 +0100
Message-ID: <CAMpxmJUQQgDoYAqCq23LwyoATjHgTZPYcPb-ruwQECdArf5GxA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: eeprom: at24: Document ROHM BR24G01
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 9, 2021 at 3:16 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Fri, Feb 5, 2021 at 11:33 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Thu, Jan 28, 2021 at 12:59 PM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Thu, Jan 28, 2021 at 12:33 PM Wolfram Sang
> > > <wsa+renesas@sang-engineering.com> wrote:
> > > > On Thu, Jan 28, 2021 at 12:13:43PM +0100, Geert Uytterhoeven wrote:
> > > > > Document the compatible value for the ROHM Semiconductor BR24G01 I2C bus
> > > > > EEPROM.
> > > >
> > > > What is the difference between those two? Could one also be the fallback
> > > > of the other (just in the highly unlikely case we need "generic" Rohm
> > > > handling somewhen)?
> > >
> > > Good question.  The datasheets look similar.
> > > Parametric search on rohm.com says the G-series differs in using
> > > "Cu wire bonding".
> >
> > I'm fine with the current form as it's simpler than using two
> > fallbacks. Do you want to submit another version anyway or can I pick
> > it up?
>
> If you're happy with it, then I'm happy, too ;-)
> Thanks!
>

Applied, thanks!

Bartosz
