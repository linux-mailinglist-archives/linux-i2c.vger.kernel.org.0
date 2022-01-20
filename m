Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644A2494BFF
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 11:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242130AbiATKor (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 05:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233816AbiATKoq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 05:44:46 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8400CC061574;
        Thu, 20 Jan 2022 02:44:46 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id m4so26689010edb.10;
        Thu, 20 Jan 2022 02:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EAldbO0fY6c4Z69F0zgy5Tqy+hJZ7FajNYzfcG8lzu8=;
        b=lwbSqh4SLeikP8AenBAz+mJgucOMFhn6+qi40XJf/wKYVo2zz5ZAGvwqwdxvEojzAI
         JgGkDlMK2QWP3O7fS6JLFVaM0QANG9+1PWJpwn1qDddLR6nbUUSzkVgpp54aL6uqsXgT
         nKJiiLtDKSTFsVaTdLH4ggrsAdzlfvEMhgS+euHv6FuknqniCl9JaTPwwnHBBNVMJtzO
         ls6mDoNdCFQefk9og1DtSfY5FF6RQaYeY4TNw1S9BeTTer6+QvdoX3qcyMziU/+zyMs9
         03qv9y4jIaCOpa0luwW12ltRwgncoale+jJfOIgz0ePs1J86ShFDttgm7KaRLJPiH7LS
         Dc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EAldbO0fY6c4Z69F0zgy5Tqy+hJZ7FajNYzfcG8lzu8=;
        b=W9rtgQtnXq1S6WScgFko0mwYDAUlIr1p0AITQnpZ26r78LaGAz+QV5MI/THv+e+x1t
         9gk7CLwOc30Q+CLsJO7kLn916b6tMFgaSOUbGAOBSBmlkOZc5M2V4wQy5nC/06nnJBfd
         30h3SmRBQZAt15zCI6zkXRxAh4muyDvQutqCmgAcTJK6nKskSDnu04Qs+N2YEIQFm7p/
         B0gC1tewb+DOt5KE7ELw/H4DNoPA/jpvmEEWXPMeaLM5KqwQVxV9xzhIvV4J2fEj3fjY
         I63gvIHQ78ugrvpyVRMwZ7T7GDBsMoqjiFB2H3TkNhEbsJ1yexsKp1Lu6nZeitGon8SL
         tQBw==
X-Gm-Message-State: AOAM531vBI/M5nL4skWWICKIJlkjmdfQDKDyLA3Y+4OeAg9TChrlK0kL
        bH6p9bryYjCm/Jo3taJ5PAqZC6yowvjVr+/3IU0=
X-Google-Smtp-Source: ABdhPJzI915PPwkfPJEnAuUAqB1eSmCNb6jxmD2FIagRHCy+t6lJFz807DF7d7pczoMfl+Hj+9jS8/Fr5ibapsuYB8A=
X-Received: by 2002:a05:6402:35d3:: with SMTP id z19mr20301107edc.29.1642675485050;
 Thu, 20 Jan 2022 02:44:45 -0800 (PST)
MIME-Version: 1.0
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
 <1641996862-26960-4-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75Vd=gxF9jFMvRw3qM9rfsxxCsO8qYXKVheuhjOV7ypU9og@mail.gmail.com>
 <DM5PR12MB18509C555A8A6F5891F0CC28C05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
 <CAHp75VfVJo=8FPX_Pw15X5B3awFXpuEq+=LryxB6M4Ub-YJ7uA@mail.gmail.com> <DM5PR12MB185098D36F665AC5702D47DDC05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB185098D36F665AC5702D47DDC05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Jan 2022 12:43:02 +0200
Message-ID: <CAHp75VfVt0b+rBTfvTTj4-M11DrM2EGdqb4NNNTq0ApvR+gpDg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: smbus: Use device_*() functions instead of of_*()
To:     Akhil R <akhilrajeev@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 20, 2022 at 12:29 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> > ...
> >
> > > > This change reveals potential issue:
> > > >
> > > > > -               irq = of_irq_get_byname(adapter->dev.of_node, "smbus_alert");
> > > > > +               irq = device_irq_get_byname(adapter->dev.parent,
> > "smbus_alert");
> > > >
> > > > >                 if (irq <= 0)
> > > >
> > > > I guess this '= 0' part should be fixed first.
> > >
> > > '0' is a failure as per the documentation of of_irq_get_byname() as well as
> > > of_irq_get(). The case is different for acpi_irq_get(), but it is handled in
> > > fwnode_irq_get(). If I understood it right, a return value of '0' should be
> > > considered a failure here.
> >
> > Depends. I have no idea what the original code does here. But
> > returning an error or 0 from this function seems confusing to me.
> >
> The description in of_irq_get*() says -
> /* Return: Linux IRQ number on success, or 0 on the IRQ mapping failure, or
>  * -EPROBE_DEFER if the IRQ domain is not yet created, or error code in case
>  * of any other failure.
>  */
> As I see from the code of fwnode_irq_get(), which is used in this case, returns
> either the return value of of_irq_get() or error code from acpi_irq_get() when
> it fails, or res.start if it didn't fail. I guess, any of these would not be 0 unless
> there is an error.

of_irq_get*() seems inconsistent...

Uwe, what do you think?

-- 
With Best Regards,
Andy Shevchenko
