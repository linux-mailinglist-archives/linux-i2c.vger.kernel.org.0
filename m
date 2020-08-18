Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A820324909D
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Aug 2020 00:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgHRWOo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Aug 2020 18:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgHRWOn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Aug 2020 18:14:43 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549B5C061389
        for <linux-i2c@vger.kernel.org>; Tue, 18 Aug 2020 15:14:43 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id k4so19331919oik.2
        for <linux-i2c@vger.kernel.org>; Tue, 18 Aug 2020 15:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ew/2ix0zlCSRd4+QNWJ7odCiHhFmcLiKbq/J3s+FnOU=;
        b=LF7kt8UZhNneF9izqyTToWElSqFSjWZCk1qqNxQ1+kb+FMFt3dUJxoAA1EEgx8a5ny
         x0Jil2lhnROTdL5FeCrIghKn+rxom8IeisY2XvsYyA3RQ8it3HAOZHo5NePdJIYc6vTg
         Qn1Ym7vzUtZRHKTKNRFtskpLzyR4A2RockSVwKtmf7z90BrmyEZ7eg405yevPTIQKTZh
         vF+Ejh20v/5zSoHNLXgUiiGMR4r/hSBKcWbhNeU4szsAMvy3d8wrH2KvXuoEZIukkPJp
         SZXIw0nV61Fjz6mUV6s/f1yGx9SeSZGezOR4UODn0RARoDsXFUKaRvItQLPkwq4s0MWA
         0Spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ew/2ix0zlCSRd4+QNWJ7odCiHhFmcLiKbq/J3s+FnOU=;
        b=P6F+wz/tyL8fqb4bngXL4RSTgivoAVO1tIgr98CkjQwGgpv9y5uzArpZ2qk2dDjJW7
         ZInMtLHAvcgs2ErUwGCX84wyBhPHiqAkEOb79VePd9tSYpDyGXMw/AXn9LOsYXXTcMWn
         kDiruinthaLMvdot+zK1zzMx5kb0MuQP4lvYlz6/cR5bTD82BJq/tGns8XhjbQZhA6KH
         nUYT3xpCF52RhuDUlBQXxrTmmF0HNR0rbgu2pzHcYA315CxDNBr+Xn90ZMvqf//VKc2j
         2pzfgiM/b4WytXQITr663/bcvIcI0PfQbe6/M9t74PnK6Oj17+v0kQonfJdeg4fiaanI
         2SUQ==
X-Gm-Message-State: AOAM5315YixR/Jr60z0KLNuttqSIif1v1sXNEMBpEy7+g9+5noWOArij
        Cjd1Ug5Ge/rWPo9hSEtyjVJ7dQl7/7AjGDBcEKJJ51DMdP+yf+Tr
X-Google-Smtp-Source: ABdhPJxqf+N3FS67Jpp84zKPZZRFpSidxxd/GRyTaxd73PwxNjqBQT1QXkibCnxIe/azeeWuhIjCb1OEUx2PhXQMX0k=
X-Received: by 2002:aca:e144:: with SMTP id y65mr1449313oig.101.1597788882264;
 Tue, 18 Aug 2020 15:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200814210154.14402-1-mab@mab-labs.com> <20200818013410.GG2294711@lunn.ch>
In-Reply-To: <20200818013410.GG2294711@lunn.ch>
From:   Mohammed Billoo <mab@mab-labs.com>
Date:   Tue, 18 Aug 2020 18:14:31 -0400
Message-ID: <CALkjhPo9rvaM4_uOPFxZ3PjkfOqpC01O==o-gz9aNAxqkRWcNQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: ocores: Allow endian-specific grlib accessors
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Andrew,

Thanks for your comments. Does it make sense to replace the big_endian
bool with a small_endian bool? The code to choose the appropriate
non-grlib accessors assumes that big_endian will be specified, either
in a device tree blob or via platform_data:

if (!i2c->setreg || !i2c->getreg) {
        bool be = pdata ? pdata->big_endian :
                of_device_is_big_endian(pdev->dev.of_node);
.
.
.
case 2:
        i2c->setreg = be ? oc_setreg_16be : oc_setreg_16;

And so if endianess isn't specified (assuming the default is big
endian), it will actually default to small endian.

Thanks



On Mon, Aug 17, 2020 at 9:34 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Aug 14, 2020 at 05:01:54PM -0400, Mohammed Billoo wrote:
> > Due to inconsistent/broken HW, SW may need to set the appropriate
> > endianess of the grlib accessors (instead of defaulting to big endian).
>
> I think you have this wrong.
>
> > -static u8 oc_getreg_grlib(struct ocores_i2c *i2c, int reg)
> > +static u8 oc_getreg_grlib_be(struct ocores_i2c *i2c, int reg)
> >  {
> >       u32 rd;
> >       int rreg = reg;
> > @@ -506,7 +507,21 @@ static u8 oc_getreg_grlib(struct ocores_i2c *i2c, int reg)
> >               return (u8)rd;
> >  }
>
> So the existing code is big endian.
>
>
> > -static void oc_setreg_grlib(struct ocores_i2c *i2c, int reg, u8 value)
> > +static u8 oc_getreg_grlib_le(struct ocores_i2c *i2c, int reg)
> > +{
> > +     u32 rd;
> > +     int rreg = reg;
> > +
> > +     if (reg != OCI2C_PRELOW)
> > +             rreg--;
> > +     rd = ioread32(i2c->base + (rreg << i2c->reg_shift));
> > +     if (reg == OCI2C_PREHIGH)
> > +             return (u8)(rd >> 8);
> > +     else
> > +             return (u8)rd;
> > +}
>
> You are adding little endian accesses.
>
> > @@ -592,8 +626,17 @@ static int ocores_i2c_of_probe(struct platform_device *pdev,
> >       match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
> >       if (match && (long)match->data == TYPE_GRLIB) {
> >               dev_dbg(&pdev->dev, "GRLIB variant of i2c-ocores\n");
> > -             i2c->setreg = oc_setreg_grlib;
> > -             i2c->getreg = oc_getreg_grlib;
> > +             /*
> > +              * This is a workaround for inconsistent/broken HW,
> > +              * where SW has to set the appropriate endianess
> > +              */
> > +             if (of_device_is_big_endian(pdev->dev.of_node)) {
> > +                     i2c->setreg = oc_setreg_grlib_be;
> > +                     i2c->getreg = oc_getreg_grlib_be;
> > +             } else {
> > +                     i2c->setreg = oc_setreg_grlib_le;
> > +                     i2c->getreg = oc_getreg_grlib_le;
> > +             }
>
> Existing device tree blobs won't indicate an endianess. They assume
> big endian is the default. But you are changing that, they now need to
> indicate they are big endian. And they won't, so you will break them.
>
> For you specific platform, you need to indicate in device tree it
> needs little endian, by adding a property.
>
> Please also document the property you add in i2c-ocores.txt.
>
>       Andrew



-- 
Mohammed A Billoo
Founder
MAB Labs, LLC
www.mab-labs.com
201-338-2022
