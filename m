Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42FE441A7E
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 12:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbhKALO7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 07:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbhKALO6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 07:14:58 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40BE2C061714;
        Mon,  1 Nov 2021 04:12:25 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 5so62117178edw.7;
        Mon, 01 Nov 2021 04:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e/ndeUdloTh5m16qLTmNIXQLVVP3NuiAY5SQEn45NJs=;
        b=KoLYJwuSR+BEdOEmgwZcfQ3vtQmrATV3wWRolFR1NYwMo1ZDE/GKzeISLXxILeNqQG
         V5+LmVHypX/XDxgOe0vOyUUUX/ZETvqwDIrzCc9p2rYWI21wfkk6Wq10z8gXJzFqCuhL
         dimlOz6rgDDxQrPsNByXEytlJh8IRvdFKYKAtKefNkTR8w7Fst0uoZklwV76EgF8+Pfe
         VEN4P+NK8kbnmZWN72RBlmAUoC2+1CFrviH+ia4kJYLqt3LoFrlcxEC8jmVykMGievye
         VFTnodxSJs5r6iE3UibpfHleOWUJgNLmtXTsNlmiusfPgFCgjThjAj+0HpJoBJ8Ug2j/
         mDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e/ndeUdloTh5m16qLTmNIXQLVVP3NuiAY5SQEn45NJs=;
        b=zEBBY9kp5NZc6ihx0jirZKomm8Bt4gFIzerlZ9hRbWrcgf9H5z8MFA7GgPIb+mr48g
         zxGq3435mQ5HpGueY6ATkz8a3ok+ht1WsibgkoBLpR2bzNOkhjkXYbqOLsleovaT8foZ
         rbipZ2G2jPiWPEhU5RbLTyw6dPow210ZgkoMqmPrST2H4uOj8GhL4NirUQ82lqrddi1J
         NBpa/CnoPoVKKSDXhpIlqExxjaSqmjFFEFLrizRC5okx0yhM9bbu9bUa9CXojfSmyzqA
         8fcHXy16CHL23R0ZEkOlVNkIzoVdGDH3lsoD1ZXjHpJUM37c8MzrHTltjioeELP4/v4l
         +jxA==
X-Gm-Message-State: AOAM532y9skHjeR85J4f3AodGns0WtjpkHg4u5QjEeFzYDQK5E3x2wPW
        3AhABYsPLmAeHvdZG9G3XbwFX9NaaAzTsri8aWpTgV28xd8=
X-Google-Smtp-Source: ABdhPJyrc30AQqdRLKr/BXV3DijFsqtCdCNhx9Ovfyd7dJ2Yh9ZNzzWrH6eogusJKDwvCt0KPqPWkG4zkuPEvBLrZjM=
X-Received: by 2002:a05:6402:1801:: with SMTP id g1mr13385760edy.107.1635765143813;
 Mon, 01 Nov 2021 04:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-6-hdegoede@redhat.com>
 <CAHp75VdfwA_3QK2Fo1S34rRZWHCMNzzHug4AKsRfOrKu4CU_YA@mail.gmail.com>
 <ff8c8418-8e73-f949-3734-c0e2e109f554@redhat.com> <CAHp75VfUq+DZk_u5Wsyr5nnibbe+WrYDyhvCU22=4Pog06DgHg@mail.gmail.com>
 <4aec04d1-0964-e4c3-2c92-f9cef395494a@redhat.com>
In-Reply-To: <4aec04d1-0964-e4c3-2c92-f9cef395494a@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Nov 2021 13:11:33 +0200
Message-ID: <CAHp75Vf1oZN=HD6apAeJ15tZMuAqJ2y6nKzZdj+8Tz9DHyK09g@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] clk: Introduce clk-tps68470 driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 1, 2021 at 1:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/1/21 11:42, Andy Shevchenko wrote:
> > On Mon, Nov 1, 2021 at 12:27 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> > While at it, recently I have learned about util_macros.h. Any use of it here?
> > Or amending it there and re-using it here?
>
> That only works on straight integer/long/float arrays, not
> on arrays of structs where we are looking for a specific member of
> the struct to be closest. And reworking that to also work on
> structs is really (really really) out of scope for this patch-set.

Consider above as just heads up: a new header (helpers) is in the town.

-- 
With Best Regards,
Andy Shevchenko
