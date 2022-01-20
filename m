Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A2F494B6F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 11:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234793AbiATKNi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 05:13:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbiATKNg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 05:13:36 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FEEDC061574;
        Thu, 20 Jan 2022 02:13:36 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id cx27so26627992edb.1;
        Thu, 20 Jan 2022 02:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cgZVphH15pXcRU+IK9WGFI43RQ+fr6aARtumaWFhszI=;
        b=DnNny+5D9ETYIyv7o4p3JByOBnal59A4pTpYg+7FdW1Mr0v0mdHjQXCfNWOS7ziy1G
         tte3/qx6cQaGbQIJYzjMgpFrcCQMTqVFZeENgN4V3jqPKJmFW6FLK6PwxabouW6o4FFF
         iIdLw3YE4saO3iJkerHxQjRqLsXMwn5rE1+hFJz5GCv+Cy8jcEftWJlPVnOKegz91dGY
         x3ZIJ+F77UEEAS+hYNKoI2ascGZ0MbYM3ENN0aCwIU1LVuYHRw/RqfVkvT2kZcM3EUn5
         Mo6PF0yY6IEWn37G6EqSKy3nkYCvHhxQ+Nu/ffMxJESvx3ejmlBkQpIlF1eO27ktukI+
         dn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cgZVphH15pXcRU+IK9WGFI43RQ+fr6aARtumaWFhszI=;
        b=lKDQwHKzQDzlzwv2M2eowQPA2PLBnEx9Kv+z+froVG5HdruLLpKGLxO3iruAWJd2If
         J5ETrL0nO31cTYMmu8nX9w45YmcaqZTBf1KD5nMMCMUtSU56Kgm7BNVpl9Ad8pBEY/CX
         +X6b+qPR7hLtOFrnriQ5PRboqFqnBwmMUFOYNkaZY4Qby/iz7FHvQSBCrXwZBKAjtr7x
         w2kaNefoBYplsZs8jjEl1shE+PNMjdKmflQuSjZeOUICry2VuXR7AlSG7GPziQCNCqEV
         xN2fglBET2oJyM/3V92CNOUN6ICKN9lGPDrmAJbMH+VHbMr081dlzH80EtVjGcyA98fD
         Z8Fw==
X-Gm-Message-State: AOAM5337wysjjcLfMGrTON5wRh3CCzGZ+VjoE17Oqu9LebGj5KJcHfka
        S+YX1mag/uTFz/FmimKpJFsWXYUvPu5t1xUyht8=
X-Google-Smtp-Source: ABdhPJwpVA0Vd30IkQB9a3fHfrNlS/bjJ/mF8g/DCFHxii+iXYJ/UkvRC9VoRU4sGtO7LezNeI8xxeShF75XdVEsZc0=
X-Received: by 2002:aa7:cf0e:: with SMTP id a14mr2409448edy.296.1642673614921;
 Thu, 20 Jan 2022 02:13:34 -0800 (PST)
MIME-Version: 1.0
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
 <1641996862-26960-4-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75Vd=gxF9jFMvRw3qM9rfsxxCsO8qYXKVheuhjOV7ypU9og@mail.gmail.com> <DM5PR12MB18509C555A8A6F5891F0CC28C05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB18509C555A8A6F5891F0CC28C05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Jan 2022 12:12:58 +0200
Message-ID: <CAHp75VfVJo=8FPX_Pw15X5B3awFXpuEq+=LryxB6M4Ub-YJ7uA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: smbus: Use device_*() functions instead of of_*()
To:     Akhil R <akhilrajeev@nvidia.com>
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

On Thu, Jan 20, 2022 at 11:48 AM Akhil R <akhilrajeev@nvidia.com> wrote:
> > On Wed, Jan 12, 2022 at 4:15 PM Akhil R <akhilrajeev@nvidia.com> wrote:

...

> > This change reveals potential issue:
> >
> > > -               irq = of_irq_get_byname(adapter->dev.of_node, "smbus_alert");
> > > +               irq = device_irq_get_byname(adapter->dev.parent, "smbus_alert");
> >
> > >                 if (irq <= 0)
> >
> > I guess this '= 0' part should be fixed first.
>
> '0' is a failure as per the documentation of of_irq_get_byname() as well as
> of_irq_get(). The case is different for acpi_irq_get(), but it is handled in
> fwnode_irq_get(). If I understood it right, a return value of '0' should be
> considered a failure here.

Depends. I have no idea what the original code does here. But
returning an error or 0 from this function seems confusing to me.


-- 
With Best Regards,
Andy Shevchenko
