Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2EB49BAAA
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 18:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355553AbiAYRxx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 12:53:53 -0500
Received: from mail-yb1-f182.google.com ([209.85.219.182]:45884 "EHLO
        mail-yb1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346936AbiAYRxm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 12:53:42 -0500
Received: by mail-yb1-f182.google.com with SMTP id h14so63923263ybe.12;
        Tue, 25 Jan 2022 09:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ESd77Xjv8MULwN2sVsXIepn2DozliSsyhZzc4OEAn5Y=;
        b=Vypuex+C8p4R5p+3YKXwb8gf9Dr6G0V/5fHFGM1nvbzq1xWF5Uh6iIs9yK68+eyOF3
         /wv8CybudL2TOYNqTbQRoIK1Y2vh7yvjFH9o7LkiDaCNUHcPyMLuJV0sjrVl0cfnSfsS
         +5fsPtVSKQeylQp9uoqW6/AzB5Pv8ONItrbofi08g4LcdCx9BA/HTeG+4Fn2QZAavCQk
         78+P73S29OIMTns+tHB7mwxHW7AHjgP3wUPBABfBL2JWX983MtT0yGZ1ZR7MwsFyYYOq
         PTaI1FEyWWTJSkf4FAG2DFS613cqujYIvRym3FGHLP7CPthoh2zk3/c+bRD6bF5Ozc8W
         hILQ==
X-Gm-Message-State: AOAM531LV5gHtaN69pRzCZC0rgX7nMghMbh2tvasUJzjxnTjGACQ8r9R
        vPiBqYoJlSjHtrmITOuH9MstKVd6NXl1O6ky3mg=
X-Google-Smtp-Source: ABdhPJw+fZA+ABzpvnyGB5SeD53YCf+9JGrRh1dC9imogsYshEbzHroZVd66d41wgactfWyqDhegwH8IfU6+3GWu4r0=
X-Received: by 2002:a25:1e0b:: with SMTP id e11mr30127312ybe.272.1643133207177;
 Tue, 25 Jan 2022 09:53:27 -0800 (PST)
MIME-Version: 1.0
References: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75Ve-zYz27baJ9SV3wcyKS5iMnxFO61gGE2LXQPU_hTt+qw@mail.gmail.com>
 <CAJZ5v0guL4nk21gvvs2K9Ak6sjhDSzMvDQZJvmnq6Frsj3+7yA@mail.gmail.com> <Ye8UTQlHphVtAYUW@shikoro>
In-Reply-To: <Ye8UTQlHphVtAYUW@shikoro>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 25 Jan 2022 18:53:16 +0100
Message-ID: <CAJZ5v0gzfJYG40UdJUncd=b1E=YfLKyUZafEDC0Ej=7OA6867w@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Enable named interrupt smbus-alert for ACPI
To:     Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Akhil R <akhilrajeev@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 24, 2022 at 10:04 PM Wolfram Sang <wsa@kernel.org> wrote:
>
>
> > It looks good to me.
> >
> > If no one else has concerns regarding it, I'll queue it up for 5.18.
>
> I'd prefer this to go via I2C because it touches the I2C core. And SMBus
> alert is I2C material anyway :)

OK, so I've just sent an ACK for the first patch and you can go ahead.

Thanks!
