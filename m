Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD35745591D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 11:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245664AbhKRKhE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 05:37:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245641AbhKRKg5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 05:36:57 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA0EC061570;
        Thu, 18 Nov 2021 02:33:54 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id y13so24691206edd.13;
        Thu, 18 Nov 2021 02:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sZ2+SkN/OTi1aedHX+w4qcv7bpQUocYUpa+mahwYIHM=;
        b=Z4R10QyvykSlYvy1lyDunnScu7/t3hL91PrpcCDmch9FZnUYGY7vrFARzHrzLedbKi
         FtY/3yE86K1UxkLzMcIWEJJmEo+fDzgGOspctyyI6fN0h4j+JxeXAjxSJYG0nL4uhb8w
         4niy3UvZFxeYEDUA4ttdguHn2gjipvR2Hgb9rqyDMuNacp/jciISwzzgR6MFGRkrW3Tn
         BCky5U++T+9K6iJDN2sFswprCMJ3ov24Inv+atT0u2sQ6foFJ41J/+7K0gxJiEhzgy4K
         Cg7VA3vaUsqNh8wNr0gfnNu+wHTHIhTx0Et+aGIoEwVMlrmqVcineGTi5I+naQdUQNsX
         Wk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sZ2+SkN/OTi1aedHX+w4qcv7bpQUocYUpa+mahwYIHM=;
        b=xxLAAt0WWIP0B3t8E3ELk21wg8FyLljffGTbAoxXszHzSqWxVW+743kDkvIp68L/H4
         PC7RGCkgiIh4mS6UGUST/mQCxlQq8wwvL+J2BGSkry5hfu8aiT1ESdexFdyg8aaTcQwO
         bV5L9qmy2EHE1oY31srknAebpdL1ScryH4fi6p+vSee+HXWzdkhbt0yCGE2uLIPxfIm4
         LSMwaQnqbEtIFQ0no3ThCaFZ1MhrQHAqtHh8Fz0e1jtWxpZz3hV/MBOQsfewpq1o2qSe
         QyTAG0jpVRkv5sSlFVAj0RnjNHj3vIVlZsnkeTpyZS2kM5QEGwZirtvsxxweYFQ4Wx6+
         kE1g==
X-Gm-Message-State: AOAM533IqyOSypBZtlGs46w05xSMNH/G00/vFs33bLZcZZ1lO0BFqwwX
        rvyMFQpyn9JIoLCVztk3JwheeUUA+16DXBPb3jGlrZcEowc=
X-Google-Smtp-Source: ABdhPJwtjRqdTbHnUyAtyD6G4Pkngw2yHZvkaa6mePlhi+srzRadNq+Z7uEuAbWMAZK2WqSNXwiLLyMjx/oKMzf2aVo=
X-Received: by 2002:a17:907:60d0:: with SMTP id hv16mr31117348ejc.425.1637231632726;
 Thu, 18 Nov 2021 02:33:52 -0800 (PST)
MIME-Version: 1.0
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com> <304efdfe-db6e-051e-b61d-e73a8dfa1c53@axentia.se>
In-Reply-To: <304efdfe-db6e-051e-b61d-e73a8dfa1c53@axentia.se>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Nov 2021 12:33:16 +0200
Message-ID: <CAHp75VcF1TZ5hH42-D+0sRkYkN-A1r797LdHGMT93UO4Sp3wLQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] i2c: mux: gpio: Replace custom acpi_get_local_address()
To:     Peter Rosin <peda@axentia.se>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Evan Green <evgreen@chromium.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Cc: Rafael

On Thu, Nov 18, 2021 at 12:24 PM Peter Rosin <peda@axentia.se> wrote:
> On 2021-11-15 16:41, Andy Shevchenko wrote:

...

> > -     *adr =3D adr64;
> > -     if (*adr !=3D adr64) {
> > -             dev_err(dev, "Address out of range\n");
> > -             return -ERANGE;
> > -     }
>
> In the conversion, I read it as if we lose this overflow check.

It depends from which angle you look at this. We relaxed requirements.

> Why is that
> not a problem?

The idea behind the acpi_get_local_address() is to provide a unified
way between DT and ACPI for the same value. In either case we take
only a 32-bit value. We might nevertheless add that check to the API.
Rafael, what do you think?

P.S. Just realized that in ACPI the higher part of the address may be
used as flags by some interfaces (SoundWire is one of them), this is
not applicable to I=C2=B2C muxes right now, but who knows... So I prefer a
relaxed version and, if necessary, documentation should be
amended/updated.


--=20
With Best Regards,
Andy Shevchenko
