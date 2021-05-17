Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3A8386C93
	for <lists+linux-i2c@lfdr.de>; Mon, 17 May 2021 23:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245510AbhEQVtZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 May 2021 17:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbhEQVtX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 May 2021 17:49:23 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998EFC061573;
        Mon, 17 May 2021 14:48:06 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t4so3923036plc.6;
        Mon, 17 May 2021 14:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JMkvV6BdFFXMjoCPNmiDQhek94rpMVEncluqG5MRowE=;
        b=odxstFZqYrucY4FAfwODmpJzT6jRu7CDGlVwp/MPxyAZ5p9mR28hLz1AkSgOslTZeH
         EIDdzCusL/6HN6ufV+7hRqOUVJ33NqiOFxdJNrVI/7sRKrD4q0nalj3luYUxyM4Q5uxm
         ZDugFjJPLXqNtbvB39cv3zngXvS9ERO4hylEjckcNaovm1kD8GuMQsNVRaOWRVnXx5fX
         zqJgd6EM3XSGhHt60if0R4V/1ed5kazBt1Icnb3dGk6d/tmS1dM1ZSlXx1v0LFprjblB
         DFwBVIUHdqP2N4bekTtJjXd8PkealEG31X2Lsh3wAx74Z7tAwi7gCIT1RL8YVytRlGS/
         6oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JMkvV6BdFFXMjoCPNmiDQhek94rpMVEncluqG5MRowE=;
        b=eucsUs/s3y5lLuc7tn27WclB/joGVHWRqXCkfMZQNU7eKDivZ9YHK2Z2IjiuwZC7Rb
         68X9gdZK5f3JCrm9RE8uK4lWY2zqjqEQjHyEs92BgVELkByxArJvc6Ace+Ip8CCov9VC
         A7eqodnA+FFZz5VYkdK56nabkc4vR8FgICA5y0T+rQJT2dAQIx7oUDtRnb6O93Eijbuu
         Fe8aNX2pBZNaIwj83Zt5Vj70KwHBt+2JIMZi3+FTJ2nkgPNYFOxo25YWA2efaCOWEIiG
         F0K5//k8MsRS9T10Y0IClMCxBqn3olu518RYMRHpoSBGmfY5LXyIslxS74s59FLyqse+
         Ihhw==
X-Gm-Message-State: AOAM530BgE1f9pQf6OFd8uc70Nw76CVVYPltsNxMRfCubjqS/glQAFcc
        6aTEFqA2QEs8IJ5a5TfqpO+l0HW6IomteKXjyoA=
X-Google-Smtp-Source: ABdhPJzVb2Ly6gYRoFRDwWBuQTVhXViFr9CR8JTQUS5JsuSaXSK84r6AwxbxCyo6EbuMLLARNKHhdo+ukDZYWYSa8L0=
X-Received: by 2002:a17:902:264:b029:eb:3d3a:a09c with SMTP id
 91-20020a1709020264b02900eb3d3aa09cmr622880plc.0.1621288086211; Mon, 17 May
 2021 14:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210222130735.1313443-1-djrscally@gmail.com> <20210222130735.1313443-6-djrscally@gmail.com>
 <CAHp75Vd2Dc2Poq7VNRXRT-0VjkYdEFY2WKpz8fWpAQViQRO4jA@mail.gmail.com> <0241df24-11cb-fd3b-12a5-f98dea55fac5@gmail.com>
In-Reply-To: <0241df24-11cb-fd3b-12a5-f98dea55fac5@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 18 May 2021 00:47:50 +0300
Message-ID: <CAHp75VdQ-BYs2MhKA0g+e5No6qP1-BpPBv5L9091yX9c51ZxKw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] platform/x86: Add intel_skl_int3472 driver
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        kieran.bingham+renesas@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        =?UTF-8?Q?Fabian_W=C3=BCthrich?= <me@fabwu.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 18, 2021 at 12:43 AM Daniel Scally <djrscally@gmail.com> wrote:
>
> Hi Andy
>
> On 22/02/2021 14:58, Andy Shevchenko wrote
> >> +#include <linux/clk-provider.h>
> >
> > This is definitely not for *.h. (Not all C files needed this)
> >
> >> +#include <linux/gpio/machine.h>
> >
> > Ditto.
> >
> >> +#include <linux/regulator/driver.h>
> >> +#include <linux/regulator/machine.h>
> >
> > Ditto.
>
> Bit more delayed than I wanted to be, but I'm just finishing off the v4
> of this. For these includes, I'm using the actual structs from them
> rather than pointers, so removing these would mean moving the definition
> of struct int3472_discrete_device into one of the source files; you're
> happy with that?

Either way, please send a v4 and we start over from a fresh view.

Thanks!

-- 
With Best Regards,
Andy Shevchenko
