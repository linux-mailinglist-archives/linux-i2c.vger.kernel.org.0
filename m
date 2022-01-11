Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1ED648AFED
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jan 2022 15:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241978AbiAKOy4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 09:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238388AbiAKOy4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jan 2022 09:54:56 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 861D4C06173F;
        Tue, 11 Jan 2022 06:54:55 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id w16so68184831edc.11;
        Tue, 11 Jan 2022 06:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DsftVpiiLy5tn1or+I629aO5vhZlItB0FnzbHU6s5Q0=;
        b=eM9LIcZLimoyOydSpONy6t/WruyrxrqgmL7viDRM1w15wJqysOw55I5BIjgm4Ni8qk
         nkBXmTmoPsjG/UylKiR4ECDXBQjXBmr707yD1yjJwocD3dBgOUFwKswef7vbkMoqdOZ1
         ++XOQBRnuQL6h8HaGKrAaxW4ctvDzKvRm/Pu9tq3gHfH8mKaX4NCHx77ldPuvk3m1k+G
         Vy98B7dfqGn1kaxyDxyqVIOOIQzaWnpeEsrRZVnsU4NoZYwjbY1xqJYYce9rwTpgq8MM
         8AG/6SuhBNxXXKbodkiTwCd9DP/R8yjbEyBlk9zKFZOB7LavW5QzCSq4qHALU+9mf67U
         kchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DsftVpiiLy5tn1or+I629aO5vhZlItB0FnzbHU6s5Q0=;
        b=jnVeXwGpPyMP1Lt3Ih7OURDQG+XbQfP/sSvUKtbkF4Vy4zkiZnH85Iom2qQ3vwDJyb
         WiL5Xb077qanSfGFFZrPggr4U6BRrvjSdeHTzNRyZ1R3rmH95UG2TXLwc3Jpn7mDMP3M
         lyzIulgoMbiuTb7K2JZP1nBCWhj2U5iHbTbntHXo9pVpJE909n6Qs55zF4zRrgc8Bukd
         dJavc2n6E1B9UKCT/BqI1J4d3+RjjErLnX3XLTORsPxiUnfOFpIBm2GoZKfa+ztiHpVU
         a8Cqokti3Ku3vR/zxdsuJ8pWV1yCI1FMISnoZHTB96C9WA218KwO1Y1SNjSZIPtmiZUG
         p+ZQ==
X-Gm-Message-State: AOAM533zEqU76fAJbH8gG+06M8/kP22xMbmHDhwt1sFe/XcIchjlgBmo
        IOAqHHsRfV60iLWP8dqrStqPojihw6SCuozd1IM=
X-Google-Smtp-Source: ABdhPJxUgg2DqpJHXp3IrGxMRYBeBJ2bTDpJn9FVkLngZeH3qNP/6woBL0LmHA6ij1o5OVEwHwGXB8eUAJinQ6VWrrQ=
X-Received: by 2002:a17:907:968c:: with SMTP id hd12mr3886426ejc.639.1641912894091;
 Tue, 11 Jan 2022 06:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20210715221828.244536-1-Terry.Bowman@amd.com> <20210907183720.6e0be6b6@endymion>
 <20211105170550.746443b9@endymion> <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
 <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com> <ebee1239-4ed4-8c68-54e0-f684cea71e93@roeck-us.net>
 <YdoG+en5Z/MaS/wu@ninjato> <CAHp75VfC2XsF2j=obXu7RLNZkKSsZ20eOH2-UMA9AoMAemKa9Q@mail.gmail.com>
 <Yd16cw0AaYcf7eSf@kunai> <811d6ec7-7eac-dfd3-5927-4adcc2251fab@amd.com>
In-Reply-To: <811d6ec7-7eac-dfd3-5927-4adcc2251fab@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 11 Jan 2022 16:53:06 +0200
Message-ID: <CAHp75Vfv9kgxu5u1YfjEuRmwj=jSybmZ92bpt30jB8MX4LFHaQ@mail.gmail.com>
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

On Tue, Jan 11, 2022 at 4:13 PM Terry Bowman <Terry.Bowman@amd.com> wrote:
> The cd6h/cd7h port I/O can be disabled on recent AMD processors and these
> changes replace the cd6h/cd7h port I/O accesses with with MMIO accesses.
> I can provide more details or answer questions.

AFAIU the issue the list of questions looks like this (correct me, if
I'm wrong):
- some chips switched from I/O to MMIO
- the bus driver has shared resources with another (TCO) driver

Now, technically what you are trying is to find a way to keep the
original functionality on old machines and support new ones without
much trouble.

From what I see, the silver bullet may be the switch to regmap as we
have done in I2C DesignWare driver implementation.

Yes, it's a much more invasive solution, but at the same time it's
much cleaner from my p.o.v. And you may easily split it to logical
parts (prepare drivers, switch to regmap, add a new functionality).

I might be missing something and above not gonna work, please tell me
what I miss in that case.

> On 1/11/22 6:39 AM, Wolfram Sang wrote:
> >
> >> I have briefly read the discussion by the link you provided above in
> >> this thread. I'm not sure I understand the issue and if Intel hardware
> >> is affected. Is there any summary of the problem?
> >
> > I guess the original patch description should explain it. You can find
> > it here:
> >
> > http://patchwork.ozlabs.org/project/linux-i2c/patch/20210715221828.244536-1-Terry.Bowman@amd.com/
> >
> > If this is not sufficient, hopefully Terry can provide more information?


-- 
With Best Regards,
Andy Shevchenko
