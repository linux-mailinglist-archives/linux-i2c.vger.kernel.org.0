Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E44B48B1E0
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jan 2022 17:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242909AbiAKQSt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 11:18:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240277AbiAKQSs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jan 2022 11:18:48 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5AEC06173F;
        Tue, 11 Jan 2022 08:18:48 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id c71so57751099edf.6;
        Tue, 11 Jan 2022 08:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tPPpInGY7TAAKztaLRD1dh/MnSuVCfFHVpP83e0vftI=;
        b=aFIB2cxig0LLlyPhlT7Jvyfb7FwdE4l3XGMHY+1SVxjIc8OTke7K4UcknrNqi+4uXC
         ramodig305m2f07d6vODRohnPohO/KTRqq5Pg0zIEVlOdu91Wdyt35GLR5Kmc3Brz6dr
         AUNh4+Kabg4rmDzbvdPl4lI+lSM41/dE8i4JJwYXeEtaNwC3MMixTHO7xyzeyoB4b31g
         PVW1691/PdGgRZVF5VmEIl4lBjAmkNUqG/3vZ9/B40dtoBeYN1sUbsV6CDzBZYUosQLm
         Me2PvoUy5glmNanQ47yimTjg1WO3Q8+18ZqHGq8fUp4N5nKagSwvInfqlD+Yqt7yvvbS
         1jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tPPpInGY7TAAKztaLRD1dh/MnSuVCfFHVpP83e0vftI=;
        b=yHakatNCocd4THnbkyI2tMgkpW+q5PueVfwCRDJ2UvTPNH7Tjf5KZWv8UHWRJe/1vy
         W5ztzTM+uQcqCga57WSi0ZYXVAgULepbd2H+2SpauFz2PSVpO/YNSNmOGjQ8TWFETyiz
         MZ+NftznnCTlTMMvBgamUZQ6CPDT+WhJ+BXrB4jpxO+ZE01Lgj3y6OXnNCm4s6rkJ71e
         XiMVxRn1UphoGgv676LCEkJw69nJHk8GEcXxoV8VAaExmGUxouULte11txliUHA1KKnR
         SeRJhFFAeiHYqsXkkUH830xlmleoXgmApttpT1wnpvhOpCh3Xb65BjRyO9CvN4RCi9MO
         dmEw==
X-Gm-Message-State: AOAM5309ZkUHpm4h2//8gJr6cgqJ3Kr83GA+C6DwAji5ABYuhN4jSqwN
        N6oPGEqcMbFep+YVUwIPz7rtuD6j85rS3oZ3ntw=
X-Google-Smtp-Source: ABdhPJx0e5XJ4dABvufzpa4e3kS7OLx9s7hSMzO2zrIR8K65YW+b3wr/Z7fNd6fLE4t0//aXakB3hwSKAk/8pcd2H9Q=
X-Received: by 2002:a17:907:6e0b:: with SMTP id sd11mr4404413ejc.132.1641917927144;
 Tue, 11 Jan 2022 08:18:47 -0800 (PST)
MIME-Version: 1.0
References: <20210715221828.244536-1-Terry.Bowman@amd.com> <20210907183720.6e0be6b6@endymion>
 <20211105170550.746443b9@endymion> <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
 <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com> <ebee1239-4ed4-8c68-54e0-f684cea71e93@roeck-us.net>
 <YdoG+en5Z/MaS/wu@ninjato> <CAHp75VfC2XsF2j=obXu7RLNZkKSsZ20eOH2-UMA9AoMAemKa9Q@mail.gmail.com>
 <Yd16cw0AaYcf7eSf@kunai> <811d6ec7-7eac-dfd3-5927-4adcc2251fab@amd.com>
 <CAHp75Vfv9kgxu5u1YfjEuRmwj=jSybmZ92bpt30jB8MX4LFHaQ@mail.gmail.com>
 <CAHp75Vf3G1ftL6VrCchCTC7UbEyWD65wdjRjYOwxY9ONxZ=DCQ@mail.gmail.com> <74eb7c8f-7072-495a-fc26-b60bf0a1f51a@amd.com>
In-Reply-To: <74eb7c8f-7072-495a-fc26-b60bf0a1f51a@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 11 Jan 2022 18:17:00 +0200
Message-ID: <CAHp75Vee4yeGLz-ErS-fVmv2c5mxC7nLVzqTnPnOP8guN4TGCQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 11, 2022 at 5:50 PM Terry Bowman <Terry.Bowman@amd.com> wrote:
> On 1/11/22 8:54 AM, Andy Shevchenko wrote:
> > On Tue, Jan 11, 2022 at 4:53 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >> On Tue, Jan 11, 2022 at 4:13 PM Terry Bowman <Terry.Bowman@amd.com> wr=
ote:
> >>> The cd6h/cd7h port I/O can be disabled on recent AMD processors and t=
hese
> >>> changes replace the cd6h/cd7h port I/O accesses with with MMIO access=
es.
> >>> I can provide more details or answer questions.
> >>
> >> AFAIU the issue the list of questions looks like this (correct me, if
> >> I'm wrong):
> >> - some chips switched from I/O to MMIO
> >> - the bus driver has shared resources with another (TCO) driver
> >>
> Correct
>
> >> Now, technically what you are trying is to find a way to keep the
> >> original functionality on old machines and support new ones without
> >> much trouble.
> >>
> >> From what I see, the silver bullet may be the switch to regmap as we
> >> have done in I2C DesignWare driver implementation.
> >>
> >> Yes, it's a much more invasive solution, but at the same time it's
> >> much cleaner from my p.o.v. And you may easily split it to logical
> >> parts (prepare drivers, switch to regmap, add a new functionality).
> >>
> >> I might be missing something and above not gonna work, please tell me
> >> what I miss in that case.

> > On top of that I'm wondering why slow I/O is used? Do we have anything
> > that really needs that or is it simply a cargo-cult?
>
> The efch SMBUS & WDT previously only supported a port I/O interface
> (until recently) and thus dictated the HW access method.

I believe you didn't get my question. Sorry for that. Elaboration below.

The code is using in*_p() and out*_p() accessors (pay attention to the _p p=
art).

My question is about that.

> Wolfram pointed out some AMD laptops suffer from slow trackpad [1] and
> this is part of the fix.
>
> [1] https://lore.kernel.org/r/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkz=
zCiYJ-XQ@mail.gmail.com

I see, but still it never worked, correct?

> >>> On 1/11/22 6:39 AM, Wolfram Sang wrote:
> >>>>
> >>>>> I have briefly read the discussion by the link you provided above i=
n
> >>>>> this thread. I'm not sure I understand the issue and if Intel hardw=
are
> >>>>> is affected. Is there any summary of the problem?
> >>>>
> >>>> I guess the original patch description should explain it. You can fi=
nd
> >>>> it here:
> >>>>
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fp=
atchwork.ozlabs.org%2Fproject%2Flinux-i2c%2Fpatch%2F20210715221828.244536-1=
-Terry.Bowman%40amd.com%2F&amp;data=3D04%7C01%7CTerry.Bowman%40amd.com%7C89=
e551e0ebe94607beaf08d9d51288f9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7=
C637775097863907004%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DgvJ0FC9MVacQunc8uMJ6=
oJEw0pGcisu9muQkE8u4rxY%3D&amp;reserved=3D0
> >>>>
> >>>> If this is not sufficient, hopefully Terry can provide more informat=
ion?
> >



--=20
With Best Regards,
Andy Shevchenko
