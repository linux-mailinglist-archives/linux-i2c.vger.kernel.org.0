Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01CA924AA64
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Aug 2020 01:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgHSX6L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Aug 2020 19:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgHSX6K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Aug 2020 19:58:10 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFADC061757
        for <linux-i2c@vger.kernel.org>; Wed, 19 Aug 2020 16:58:10 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id h22so57032otq.11
        for <linux-i2c@vger.kernel.org>; Wed, 19 Aug 2020 16:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HBJV03LOXaGcOegOJ/JCBUMuybvb5TUefMHX8PE7z6A=;
        b=aci/LSFGQgUPcCSfOKZL3DW2nYCnDXwIALC8F921Fe+gzX+ZR1PBmrNNGYGqorsbla
         lTo+8YqHFOva98JpQ7BFUnZo5uWM0OhbSp5MJm2FTSmvpSf4zHPQUPFOjXqMVtqsYvAL
         dpHprIuollInT8PWBUYhPJsFj2eN7FXAp2yV33OXzIU1UQUQaFvm0sDlVc8gnC+NeX24
         xMXbrxAUQeG0mptIYWkyxLxMH3BVRTRkZpBfJMFvOmTPDQwEiD2yIIZhqAGco3aNHL47
         Oidpz4l1QStvN44Cewskch7AXN6riI+zw0wCWEtIDIWOIazk3IbYH0r5niRreOVa0Ywb
         PeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HBJV03LOXaGcOegOJ/JCBUMuybvb5TUefMHX8PE7z6A=;
        b=MYlm5kyfxULvHIIJLt7rqpEmUXvI54Q/9vk7tsS4Cq0+t1tf38wiP4qENbKzN0aD1Z
         M66OJEU/ibv+mhtj/mWT6iXyd8Jshapnj+orcoB1RFiz0fUS7zHuD4fTEI3OKOcyEscY
         fMHs1w4OFctYH+5tcoLBGLX41ndQZcJgATr/GiAxh9FrWoDDmny10SL9rO83iRjI98/3
         mv2gmQrNwV/bc61cu9KID7wl5h06qLcNv3odrU3pQUAvJFiCZ+NQKcM0UnTNynXES2qa
         6AEGJZxGKHLQqJAE7r9dd0trklF74BcYChu+DKji3tRQv+nD6+CkiGFgAHgpJMcKzmUJ
         G9rg==
X-Gm-Message-State: AOAM5336zrGkIQ6aSx94DXhVSODly1DHSP/LbaAJE2nkwyYETro1VOqZ
        01xFXh4DyV4gNEH4ELwdoPZqtE2Ay9UVoMc3xQK83UDrUaOYOFaC
X-Google-Smtp-Source: ABdhPJwOzDZrI/50beq4HcxWBQ5GUiLbKpbudeJWzFAP8iyRvR2TYSYdJvOt1XPxK9loaBOPdhF2rrTcSIEaeky0uJk=
X-Received: by 2002:a05:6830:11ca:: with SMTP id v10mr303672otq.44.1597881489532;
 Wed, 19 Aug 2020 16:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200814210154.14402-1-mab@mab-labs.com> <20200818013410.GG2294711@lunn.ch>
 <CALkjhPo9rvaM4_uOPFxZ3PjkfOqpC01O==o-gz9aNAxqkRWcNQ@mail.gmail.com> <20200819021402.GC2347062@lunn.ch>
In-Reply-To: <20200819021402.GC2347062@lunn.ch>
From:   Mohammed Billoo <mab@mab-labs.com>
Date:   Wed, 19 Aug 2020 19:57:58 -0400
Message-ID: <CALkjhPqg+krJBzds74xS2Pvtd0cgiq_iQAktShNRXPwAm9Mwiw@mail.gmail.com>
Subject: Re: [PATCH] i2c: ocores: Allow endian-specific grlib accessors
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Apologies for belaboring this point, but doesn't your logic mean that
the code for selecting the "standard" (i.e. non-grlib) accessors is
wrong? Putting my broken HW aside, if a device tree doesn't specify
big_endian, assuming that the default is big_endian, then won't these
lines of code, which are in the mainline driver:

bool be = pdata ? pdata->big_endian :
             of_device_is_big_endian(pdev->dev.of_node);
.
.
.
case 2:
            i2c->setreg = be ? oc_setreg_16be : oc_setreg_16;
            i2c->getreg = be ? oc_getreg_16be : oc_getreg_16;
            break;

then use the little endian (i.e. oc_setreg_16) accessors? If so,
shouldn't the use of big_endian in this driver be replaced with
little_endian, and the corresponding code updated?

On Tue, Aug 18, 2020 at 10:14 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Aug 18, 2020 at 06:14:31PM -0400, Mohammed Billoo wrote:
> > Andrew,
> >
> > Thanks for your comments. Does it make sense to replace the big_endian
> > bool with a small_endian bool? The code to choose the appropriate
> > non-grlib accessors assumes that big_endian will be specified, either
> > in a device tree blob or via platform_data:
> >
> > if (!i2c->setreg || !i2c->getreg) {
> >         bool be = pdata ? pdata->big_endian :
> >                 of_device_is_big_endian(pdev->dev.of_node);
> > .
> > .
> > .
> > case 2:
> >         i2c->setreg = be ? oc_setreg_16be : oc_setreg_16;
> >
> > And so if endianess isn't specified (assuming the default is big
> > endian), it will actually default to small endian.
>
> You have to assume there is no indication of endianness in device tree
> by default. For your broken hardware you will indicate little endian
> in device tree. If you want, you could add support for DT indicating
> big endian, but it is not required.
>
>        Andrew



-- 
Mohammed A Billoo
Founder
MAB Labs, LLC
www.mab-labs.com
201-338-2022
