Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9746348C772
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 16:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243806AbiALPm5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 10:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242234AbiALPm4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jan 2022 10:42:56 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A194C06173F;
        Wed, 12 Jan 2022 07:42:56 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id u21so11596431edd.5;
        Wed, 12 Jan 2022 07:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pk9G/dsg1PMyd6CzhEC9GX6NcblEd21mpPVthjg3MLs=;
        b=Vxd19zFFtTEat1uiYtqlhQV7EaP6I8hVYcJnMd6D1rH51e/Ti5Y4O+/H7dyC5bVm3Y
         MtlzMck/g1LqI0dQZegrpQlgtSf08vQ2FBlUpESv19pTYWvUKqFJHD7yO/0yCTABBBGC
         jf8jFuLUdZZmKQImTUg3P4iNXLynJkrf5KX3c2Pf6kmRYNVIkcXIcsozCRWziaG7A4xW
         A7uPseDeLHARbb1byJRfcOncgnDCo8c5VEyFfel+Id6d0/ioSlmQaZdff3FNGKTnyTsi
         JlSrzrJCOjlTeaxwQYsQhogf0cdhJdvy1/wczXL2A6OmSygHaE8267RTt7YVNqLioB3p
         dKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pk9G/dsg1PMyd6CzhEC9GX6NcblEd21mpPVthjg3MLs=;
        b=n5F/0MkReA/e84uudtaEKs01Iqwb9R0rARrcm0yA8SB1MpmL+Ek+QgD8tmm4wLnTCt
         9mzLFVeZy3You3+A5q74Gq6BbRoBxzSXMxfCRBau2414yad+2MlYY890JkPhZzafAdHR
         qgBk9g2SFUdc+W7QuFbobrWo96C3HStGwA8Mkp8OE60usUc46jjBE9O61/cTmw3HtpAl
         0Qb3Z8A3GGVzJdqnApfq4aISRxnfX5QwkkmywoNqwT6Fl5ueJMj45SEzLiNr3sXJVvoy
         0gS4wAcxKtRHueLbckty1DCvXjqxxB0KKnZ42WctdUJeqO3Ug1w0+6iWY7WCjd9RsALd
         acuw==
X-Gm-Message-State: AOAM531h4Fs4uqM8xIYI7IuV9EGgDbH/jznE0U6LZUNEG6OzuNrVPoQP
        FkHQy5mw5VC5Opoju9lIf9+WVosJBS9Xg3w8zDY=
X-Google-Smtp-Source: ABdhPJxKMGIxMdkdnYrPXoFEYoZXbMBp/Rzeh6pyOJszu097bd5j2k2qv6ZQGDXeWxHMQCHfzfb6AoGzHs0MIIZgIVo=
X-Received: by 2002:a17:907:97cd:: with SMTP id js13mr222895ejc.497.1642002174794;
 Wed, 12 Jan 2022 07:42:54 -0800 (PST)
MIME-Version: 1.0
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com> <1641996862-26960-4-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1641996862-26960-4-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 12 Jan 2022 17:41:08 +0200
Message-ID: <CAHp75Vd=gxF9jFMvRw3qM9rfsxxCsO8qYXKVheuhjOV7ypU9og@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: smbus: Use device_*() functions instead of of_*()
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
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

On Wed, Jan 12, 2022 at 4:15 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Change of_*() functions to device_*() for firmware agnostic usage.
> This allows to have smbus_alert interrupt without any changes

the smbus_alert

> in the controller drivers using ACPI table.

the ACPI

...

This change reveals potential issue:

> -               irq = of_irq_get_byname(adapter->dev.of_node, "smbus_alert");
> +               irq = device_irq_get_byname(adapter->dev.parent, "smbus_alert");

>                 if (irq <= 0)

I guess this '= 0' part should be fixed first.

>                         return irq;

-- 
With Best Regards,
Andy Shevchenko
