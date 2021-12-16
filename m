Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F03E477D44
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 21:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241219AbhLPUTe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 15:19:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241282AbhLPUTd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Dec 2021 15:19:33 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FDAEC06173E;
        Thu, 16 Dec 2021 12:19:33 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id e3so92239270edu.4;
        Thu, 16 Dec 2021 12:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=72vtUg8lpD9RmmoMvh+ZH1I3XqbPfTU1qYPquUy7V7s=;
        b=gUE44e4FrDWAyGq5iIqAX6DcfeBlUxL6cVhanO8XzP04xxyEYbZF4PPGzTeq9jktDD
         2jb4gf3O1Lalx6Knx1ZVKQ7wbYHjJ49OtfTLmaieQIngKmtmAAC7srcaeaPHz8d2IxUS
         QgVP8MwVwfQ5Xi8lz3cDbQp4CDFFAQ5bzwihbOkJICofkOAuoD3+5jzH6Ng37g4isotN
         0fxSiyygj2dLsJZx8y238rNVVJz3wswQp5KMqt0MTQshXYPWBVw9e7rkVarCE8WNCpoG
         z3BbW2BCWap6vmNI1VV64fdWytHivFOcW2JaSmV3vDM8ru9TjpPOUAPvxFP6/RRyOJFh
         GzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=72vtUg8lpD9RmmoMvh+ZH1I3XqbPfTU1qYPquUy7V7s=;
        b=TmLVZloqtDPe5vaMP7fOQi4LgT5JUXhgLM60VRADFVDNC0JKDf6uPczYxUzl8jilZA
         4D6+qcPQy+hmSMSZhYX/SeuYuDF5Fz6ko41J9oBrWVJtMzk9jMsxP035xTgGZdXnGRU6
         orgb637FQkILRSnX04hcwCORlpLqXD7qrveY4LM/ze2hUW3J4QCxRLIkhPf7HhYZK7N7
         GwrAaZfBvn93Px2p6QHxmjBIspZ768/Vo10F7rv0GzMcJlRBpfrdWlymsnNsYw63Wvv7
         1vsc5ZCh4J8nKaK0ZrVchdMbmcilmlIhCbnjRy148xvBJ3O38zx310YKWbMLzqj2/Gcx
         H4vA==
X-Gm-Message-State: AOAM533aP6DyYZH0h1N7CIVx6+x3l9z1VGgYDRzmWWODvX76WsR/Y+4M
        HLaojNPwKmbjbZKQnsI6aKNQR0L7ULTGP7Vn6TbfAiI6VaaTTzX98c4=
X-Google-Smtp-Source: ABdhPJzle6kPZJq6DVHDycIk891CMZBBF39xWduDs+8JvG3epYSRRZ/PQ2+wkVGsp6ZOvLoElqu94t5I+gFeaZ9FmX4=
X-Received: by 2002:a17:906:30da:: with SMTP id b26mr17533409ejb.497.1639685971950;
 Thu, 16 Dec 2021 12:19:31 -0800 (PST)
MIME-Version: 1.0
References: <1639660402-31207-1-git-send-email-akhilrajeev@nvidia.com>
 <1639660402-31207-3-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75VcvrM0qLQE-04UZEkxbAvkE-MNSN7RGC7mPxj+1hoUyTw@mail.gmail.com> <BN9PR12MB52732B801C0D15BBBA71B8DDC0779@BN9PR12MB5273.namprd12.prod.outlook.com>
In-Reply-To: <BN9PR12MB52732B801C0D15BBBA71B8DDC0779@BN9PR12MB5273.namprd12.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 16 Dec 2021 22:18:54 +0200
Message-ID: <CAHp75VfQpgWhKXM=1oRg8d_ntZvxkSArQv=6eaq7tyU6-KvJjg@mail.gmail.com>
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
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 16, 2021 at 6:08 PM Akhil R <akhilrajeev@nvidia.com> wrote:
> > On Thu, Dec 16, 2021 at 3:14 PM Akhil R <akhilrajeev@nvidia.com> wrote:

...

> > > -       irq = of_property_match_string(adapter->dev.of_node, "interrupt-
> > names",
> > > -                                      "smbus_alert");
> > > +       irq = device_property_match_string(adapter->dev.parent, "interrupt-
> > names",
> > > +                                          "smbus_alert");
> >
> > Hmm... Adapter device node is not the same as the node for its parent.
> > Do you have some code that propagates of_node from parent to child?
> Adapter device does not have an of_node unless the adapter driver
> sets it, I guess. I see all the adapter drivers add the of_node and
> parent for adapter. Also, there are many places in i2c-core-base and
> i2c-core-acpi where adapter->dev.parent is referred to as the adapter
> driver device.
>
> Basically, adapter->dev.parent and adapter->dev.of_node would
> ultimately refer to the same device (or the of_node of that device),
> as far as I understand.
> >
> > I.o.w. I would expect to see
> >
> >        irq = device_property_match_string(&adapter->dev, "interrupt-names",
> >
> > here.
> It would then require adding the fw_node as well from the adapter driver.
> I felt it made more sense to refer adapter->dev.parent here as most of the
> (or rather all of the) adapter drivers already sets it.

Is this
https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-core-base.c#L1047
what you are looking for?

...

> > >         if (irq == -EINVAL || irq == -ENODATA)
> > >                 return 0;
> > >         else if (irq < 0)
> >
> > TBH the entire code smells. "Interesting" way of getting an optional named
> > interrupt.
> I felt it useful to have it this way as it would remain agnostic to device tree and
> the ACPI. We would not have to add redundant codes in adapter drivers that
> are using ACPI table.
>
> Named interrupts for the ACPI as well, I feel would be a useful addition that can
> prove to be of value more than this change; I believe.

Me too. My comment was about current state of affairs, and not to your change.

-- 
With Best Regards,
Andy Shevchenko
