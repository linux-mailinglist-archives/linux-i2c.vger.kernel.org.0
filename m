Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B680848AFF8
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jan 2022 15:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240349AbiAKO4Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 09:56:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238388AbiAKO4X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jan 2022 09:56:23 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B55CC06173F;
        Tue, 11 Jan 2022 06:56:23 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id z22so23185668edd.12;
        Tue, 11 Jan 2022 06:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iXoxzIB0Q30uSSCy8ea/hQfPQ11tgFsxBDq8iurj7Jw=;
        b=HTkZPzbMmT7xlSc5LgUoFT1m36lYdJj1qMOZswFGBIKCukxGyNHUFUKcLk4OqWVOwL
         UcpGscjs5oXkeA+rr07jnTMpCO8McUsIVOaBIKV8RmCXMUaIxIzN8xCRk5sauuuvCcaQ
         JjGzH/roSSvLAFGHBxId/daiDGdzbt1EeYZn7QmIWMRr0IX8TY7+fvLEJIysMr3wXh7a
         q9+lABEd1UAeXDlLAw9BVJZ9Qi1IWgaX1depYVJyZdwZN7Kt3K4ThlFhcXXIvPHXIt9o
         8mr3jODfaf4Q152jq0V8al3MzbW0DJjeFzAjtt7lNGto0P/FZ1O1SxoD5566d7TfTKiv
         49pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iXoxzIB0Q30uSSCy8ea/hQfPQ11tgFsxBDq8iurj7Jw=;
        b=c4lhRLtGX02QOsxcwL5/QkrHmRwacG3ZB2Gw9HpCqqf7FidIawXVCSW4cI5OLC3LzC
         cagEpYltdm5CMdXGxr+1ldM9pcO3N0/9k5LidD0rcP1B93OrWQD7+ewj+pYbmxKZgSh6
         UYHPMAOGfxrbSrE1AvAxUZRgVdDYwT0wf9CuCUo3x+KzrK19ymN1MgkqCAmfXj9c376J
         yKMWPmkOpR7uwWGJeM39o3xYvJoKSK1NGO7EIssFp86n5DoQ8QMTXCqAGudI3YF9gMpE
         oPvu1qP0TbVcQBlpXJs3rPW1kh8V5JNHv/iPYFL7QDypJRLk5dZw6k2wAyG7Qaa/7Suq
         lhYw==
X-Gm-Message-State: AOAM53206G3aVXRG4+bMVreNpqE0gAfU58mR9jUukaVNmg2MGafBe4EO
        WtxMC3lOmxwAxyL6mzk6dscIFXzPJbfS6XW/B9+F7axUuks=
X-Google-Smtp-Source: ABdhPJy7OHUoQutneJThCYc1kpdVXsRdRJj+w2tWrxSkQXXlEPL26qm3bDk8Bg9TXqlCFEg5Mlqc8OIyyMr3Syehdo8=
X-Received: by 2002:a17:906:3ed0:: with SMTP id d16mr3931238ejj.636.1641912982092;
 Tue, 11 Jan 2022 06:56:22 -0800 (PST)
MIME-Version: 1.0
References: <20210715221828.244536-1-Terry.Bowman@amd.com> <20210907183720.6e0be6b6@endymion>
 <20211105170550.746443b9@endymion> <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
 <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com> <ebee1239-4ed4-8c68-54e0-f684cea71e93@roeck-us.net>
 <YdoG+en5Z/MaS/wu@ninjato> <CAHp75VfC2XsF2j=obXu7RLNZkKSsZ20eOH2-UMA9AoMAemKa9Q@mail.gmail.com>
 <Yd16cw0AaYcf7eSf@kunai> <811d6ec7-7eac-dfd3-5927-4adcc2251fab@amd.com> <CAHp75Vfv9kgxu5u1YfjEuRmwj=jSybmZ92bpt30jB8MX4LFHaQ@mail.gmail.com>
In-Reply-To: <CAHp75Vfv9kgxu5u1YfjEuRmwj=jSybmZ92bpt30jB8MX4LFHaQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 11 Jan 2022 16:54:35 +0200
Message-ID: <CAHp75Vf3G1ftL6VrCchCTC7UbEyWD65wdjRjYOwxY9ONxZ=DCQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Robert Richter <rrichter@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 11, 2022 at 4:53 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Jan 11, 2022 at 4:13 PM Terry Bowman <Terry.Bowman@amd.com> wrote:
> > The cd6h/cd7h port I/O can be disabled on recent AMD processors and these
> > changes replace the cd6h/cd7h port I/O accesses with with MMIO accesses.
> > I can provide more details or answer questions.
>
> AFAIU the issue the list of questions looks like this (correct me, if
> I'm wrong):
> - some chips switched from I/O to MMIO
> - the bus driver has shared resources with another (TCO) driver
>
> Now, technically what you are trying is to find a way to keep the
> original functionality on old machines and support new ones without
> much trouble.
>
> From what I see, the silver bullet may be the switch to regmap as we
> have done in I2C DesignWare driver implementation.
>
> Yes, it's a much more invasive solution, but at the same time it's
> much cleaner from my p.o.v. And you may easily split it to logical
> parts (prepare drivers, switch to regmap, add a new functionality).
>
> I might be missing something and above not gonna work, please tell me
> what I miss in that case.

On top of that I'm wondering why slow I/O is used? Do we have anything
that really needs that or is it simply a cargo-cult?

> > On 1/11/22 6:39 AM, Wolfram Sang wrote:
> > >
> > >> I have briefly read the discussion by the link you provided above in
> > >> this thread. I'm not sure I understand the issue and if Intel hardware
> > >> is affected. Is there any summary of the problem?
> > >
> > > I guess the original patch description should explain it. You can find
> > > it here:
> > >
> > > http://patchwork.ozlabs.org/project/linux-i2c/patch/20210715221828.244536-1-Terry.Bowman@amd.com/
> > >
> > > If this is not sufficient, hopefully Terry can provide more information?

-- 
With Best Regards,
Andy Shevchenko
