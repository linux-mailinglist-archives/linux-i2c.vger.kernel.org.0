Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69701C08D5
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2019 17:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbfI0Pom (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Sep 2019 11:44:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:42636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727207AbfI0Pol (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 27 Sep 2019 11:44:41 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E20D32146E;
        Fri, 27 Sep 2019 15:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569599081;
        bh=JvAibICL3mYnhHG6USFakLaq5pSAL+F0LFmV8Pd88Vs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qr3k3NSCnvKmuzwCoUSSAj7EJuLfUyurlmvfcyLU6OmHhYUlheh5vMc6YiV/QGg9e
         QyTenOtE5UHvDnKAoosmj/bRnVgUXK0z43Nfp/tYoYd9KWunj5KHvzOKFvjwHJWLio
         GOTaZHrOfzx4Fu3kH/36XrtiI60LH1DF2kAOli3o=
Received: by mail-qk1-f174.google.com with SMTP id x134so2358905qkb.0;
        Fri, 27 Sep 2019 08:44:40 -0700 (PDT)
X-Gm-Message-State: APjAAAUqnWd0uSw8Zkr0/4noE5DI0J0IJqNKysQIKT21cxVtZC+YVygp
        w99r8SSi+rVKG49uYlUSvPxFQbHCkDtyXU3L3Q==
X-Google-Smtp-Source: APXvYqy1MGJjHwELZ4Bw99jjQEhMXDlYRvnNqs1LnykFuiSzNrCL1BzMpOm8ays235L+R3270SmaXQZtAd7SSGPY3F4=
X-Received: by 2002:a37:682:: with SMTP id 124mr5220879qkg.393.1569599080064;
 Fri, 27 Sep 2019 08:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190927134220.8734-1-robh@kernel.org> <CAMRc=MctTVh99vE+dfd25ienWEjtMNwrM200f1im--fx9ALo7Q@mail.gmail.com>
In-Reply-To: <CAMRc=MctTVh99vE+dfd25ienWEjtMNwrM200f1im--fx9ALo7Q@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 27 Sep 2019 10:44:29 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+R9wdB521dQtwMiWXEJEB5tGEDYi_efDqZL6xzF9YduA@mail.gmail.com>
Message-ID: <CAL_Jsq+R9wdB521dQtwMiWXEJEB5tGEDYi_efDqZL6xzF9YduA@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: at24: convert the binding document to yaml
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Peter Rosin <peda@axentia.se>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 27, 2019 at 10:06 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> pt., 27 wrz 2019 o 15:42 Rob Herring <robh@kernel.org> napisa=C5=82(a):
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Convert the binding document for at24 EEPROMs from txt to yaml. The
> > compatible property uses a regex pattern to address all the possible
> > combinations of "vendor,model" strings.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > [robh: rework compatible schema, fix missing allOf for $ref, fix errors=
 in example]
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > v4:
> > - Add a $nodename definition
> >
> > - Turns out the compatible schema is too complex for generating a 'sele=
ct'
> > schema and only a small subset where getting validated. So we need a
> > custom 'select' schema. This in turn fixes the issue with the nxp,se97b
> > binding.
>
> Thanks again!
>
> >
> > Now we get a different set of errors checking Arm dts files (omitting
> > a bunch of node name ones):
> >
>
> > arch/arm/boot/dts/at91-dvk_som60.dt.yaml: eeprom@57: compatible: ['gian=
tec,gt24c32a', 'atmel,24c32'] is not valid under any of the given schemas
>
> This is because nobody bothered adding 'giantec,gt24c32a' to previous
> .txt bindings. I'll add this in a follow-up patch.
>
> > arch/arm/boot/dts/am3874-iceboard.dt.yaml: at24cs01@5f: compatible: ['a=
tmel,24cs01'] is not valid under any of the given schemas
> > arch/arm/boot/dts/am3874-iceboard.dt.yaml: at24cs08@5c: compatible: ['a=
tmel,24cs08'] is not valid under any of the given schemas
> >
>
> These look fine at first glance, I'm not sure what the problem here
> is. I'll take a look at these as soon as I can.

Ah, that's my mistake. I guess there's only no 24cs00 variant.

Rob
