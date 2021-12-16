Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768AA47753B
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 16:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235073AbhLPPBV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 10:01:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhLPPBV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Dec 2021 10:01:21 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CB5C061574;
        Thu, 16 Dec 2021 07:01:20 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id z5so88676990edd.3;
        Thu, 16 Dec 2021 07:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9zj1pfsGNIVw4QzFbgPaYaMCLDHK2SPvXFEllDH8Wrk=;
        b=gxniatxv2cejxITlqQ0p4l2KDDXvkNLHmK0a7hEp5FHaqs+t7PX2OMCZ8zLOp5MyZC
         oqB7FGtopXz0zW5LwIhoTGmh0HR/bf+DEBVXlHAB3NR25PyAZpNWCxRGHXxyxxkKgS/E
         HRpsLTkDea0EdJKRUyuyYWNDafCPvK53SzbLQQ6if0nGO5jknVFHU6ggR9346+Gp3SaQ
         ZGlQVKjlo6cqks7QCLGxw3ASGTrNWREChQAXVN82JGvqnjaaDXl0RtO196xXeiq3izqM
         XVob9dTWuAhqMa3hwWrpNSSD6BN8WMmiCAY1vw/Poh59mDFW56UD034cLLnn21OcE6XM
         STzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9zj1pfsGNIVw4QzFbgPaYaMCLDHK2SPvXFEllDH8Wrk=;
        b=3phGbL37m6lVwDjmdGqOT1XROeW4rK0ta/68k4rKS7FBzPyIH+a+VzIDuIZwkl53kv
         GwGa4iINEt+O7Cri/UeEyQ3r6e8583tBZlssygpo5b1PbR0Hk7bFXPmddjPK2DhewWxr
         gYc2XEo39frwUzLT3LQrkJEniXtBFDsHXhuBVZ9ZsK5/TBWuWqRhIV9c7VoMgtEe+Ry7
         3EVum2IwarhHjbpNLAX258GyAwacVo92bh9H+zCkP4R0AwHC3RQoSqYN+gULiVJHkI2N
         gmS3rhzdQwtPpJKPwDsYe5HO0fhZmjzqYtCrA3qhD3ZTnyiMMgBCkl7IGqlKOrYDQIzU
         vOzQ==
X-Gm-Message-State: AOAM5332VtzOBkRaxBga33REC7itLWU20E7Z4Ur87tQEZSZGIRhgWwrW
        GgYCORvl3NWrixBmwNHXFsLnR0RkuMSzezpSePQ=
X-Google-Smtp-Source: ABdhPJyQATRoSClS0GBPB5Utozlk9jX6Ai7xTg7PRs2485NEJpUMVlVa7oVsKEk6kXHQwomnvUcGvvMrzx5gfikZlmw=
X-Received: by 2002:aa7:cd75:: with SMTP id ca21mr4288962edb.242.1639666873565;
 Thu, 16 Dec 2021 07:01:13 -0800 (PST)
MIME-Version: 1.0
References: <1639660402-31207-1-git-send-email-akhilrajeev@nvidia.com> <1639660402-31207-3-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1639660402-31207-3-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 16 Dec 2021 16:59:44 +0200
Message-ID: <CAHp75VcvrM0qLQE-04UZEkxbAvkE-MNSN7RGC7mPxj+1hoUyTw@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: smbus: Use device_ functions instead of of_
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 16, 2021 at 3:14 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Change of_ functions to device_ for firmware agnostic usage.

of_*()
device_*()

> This allows to have smbus_alert interrupt without any changes
> in the controller drivers using ACPI table.

...

> -       irq = of_property_match_string(adapter->dev.of_node, "interrupt-names",
> -                                      "smbus_alert");
> +       irq = device_property_match_string(adapter->dev.parent, "interrupt-names",
> +                                          "smbus_alert");

Hmm... Adapter device node is not the same as the node for its parent.
Do you have some code that propagates of_node from parent to child?

I.o.w. I would expect to see

       irq = device_property_match_string(&adapter->dev, "interrupt-names",

here.

>         if (irq == -EINVAL || irq == -ENODATA)
>                 return 0;
>         else if (irq < 0)

TBH the entire code smells. "Interesting" way of getting an optional
named interrupt.

-- 
With Best Regards,
Andy Shevchenko
