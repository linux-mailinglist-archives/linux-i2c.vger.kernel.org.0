Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB14725F4A9
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 10:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgIGIL1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 04:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbgIGILN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 04:11:13 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612A6C061573;
        Mon,  7 Sep 2020 01:11:12 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 31so7655952pgy.13;
        Mon, 07 Sep 2020 01:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vzc+Ve94tqVOyavHE937TTCNAw3aMiGnomApaCg9IK0=;
        b=uU60CYHYyWwQ+Y94TdC3dYbvbtWH6ln2wiTglbCatcBtIwuYa5c+7Yyfuhqt+By2aW
         yXcxleGrBLQiIpuMiIbLZHtHWrlbaWBU14aPbiRWf+Yh59+oZjZ58mdTr9DIh0LMVlMZ
         7poj4D1sDdG7OsfZKSrjYZV5KjcS4NIRzVDNKCgjgoUvvNVo0OeZBTROm1a1ZQZ3smFF
         tOFwmZGfmn+OVilSGJvquNEgm5f9T77lU05WWNMOqu2T8Qk8eqCZyFcA9LL1PELZonyt
         XUhvkDWwyY33cFqTc2ef50DnwkypYnWlJLkHhjuODJcXHv7Q7/oC0qGjyQauREvpmdFj
         IKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vzc+Ve94tqVOyavHE937TTCNAw3aMiGnomApaCg9IK0=;
        b=bLOOMpRYdmvQ1yNkStVxaDtULdDVsgfO5SpLU85pcdvFcUJI8hQywbMdOTBa/w0L1V
         ACsGYhUQ5N3SLJDSPKNLpmyE60uyCcO906WF+eIxD3HlIsWfx3pzLYFeulRgORvESg2N
         XG2gbbq6ePDS/2AJ1VMrTzmcKrIIZjJhbYO/U9jx3PjdgbJ/mIsbsJilNZD2QGVtT0sH
         zTRPH4ainzFhf8MxOWwHNo7W7T1cWPa3BSHQbuOSUUIoejBdoA1FaXSJG9vTkyrOFU5G
         FJGqd62JcXT3+/ANkPUgE2SEXjh2E8GNSa3+sdOa2PNGQannppZgZgd1N+GL5fngR9N5
         2Zsg==
X-Gm-Message-State: AOAM532CUCNiqWyWAehddsbrrp5jVH2n7692m2JVo2Mt3unTDmgmA6uO
        geJTLmFCbfALO7UJKwhki1GXVL0T1AmzWi/nFpg=
X-Google-Smtp-Source: ABdhPJxNRkgS1zU0aqXnER0O5BVfgdwen8wDhVwqSPf9js+Uw/DnB7AlvFex+0BuuzMHjlIcWSbD/9bksHzmRja/5vk=
X-Received: by 2002:aa7:988d:: with SMTP id r13mr15580501pfl.93.1599466271848;
 Mon, 07 Sep 2020 01:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200906185039.22700-1-digetx@gmail.com> <20200906185039.22700-7-digetx@gmail.com>
In-Reply-To: <20200906185039.22700-7-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Sep 2020 11:10:54 +0300
Message-ID: <CAHp75VevXe3c2LGF3jZyDfvPpRAz+-GQKvXEO4OKvuur=RgXCQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/36] i2c: tegra: Runtime PM always available on Tegra
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 6, 2020 at 9:51 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The runtime PM is guaranteed to be always available on Tegra after commit
> 40b2bb1b132a ("ARM: tegra: enforce PM requirement"). Hence let's remove
> all the RPM-availability checking and handling from the code.

> +       ret = pm_runtime_get_sync(i2c_dev->dev);
> +       if (ret < 0) {
> +               dev_err(dev, "runtime resume failed\n");
> +               goto disable_rpm;

As in the original code here is a refcount leak.
Should call pm_runtime_put_noidle(). (Possible to use goto put_rpm;
but in that case the code a bit confusing to the reader)

>         }

>  put_rpm:
> +       pm_runtime_put_sync(&pdev->dev);
>
>  disable_rpm:

-- 
With Best Regards,
Andy Shevchenko
