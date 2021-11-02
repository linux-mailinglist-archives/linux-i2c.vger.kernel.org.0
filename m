Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B91443213
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 16:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234644AbhKBPzz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 11:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234642AbhKBPzy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Nov 2021 11:55:54 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 531FDC061714;
        Tue,  2 Nov 2021 08:53:19 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id g14so15346532edz.2;
        Tue, 02 Nov 2021 08:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uh3V+KhWN7/HDkvhbVf6laOL4Ct4HKkj535+ZUd6sTc=;
        b=mljJuPk2s95J1Zu/X2yPZDdeX9Tf7AHTEqZnBDycdLY58ImXaeR/qCwS/yHo/ygp0E
         RJym9wVijZxG5saxzNG0JyJ8gLTZ+dTaAz7P00YLje3/Bs/H1KQprhFV6hGbWx7oL2dF
         BAD/6VP1Gvg2rZNZqWifEKMjNYV5/GmhwwUK8pKpMX/8GSMjhTIqexDbTk4ZsSxk7SCN
         XyTXy4gm/8KLLwipx5eOiFBhN1eDI5/KyGFLQAOHh5abx1wrsRuuh3qxqR0eldbXT9Gk
         L2oTZNC4gw/F+adHjZPGZqN1TgQTWAbRqOebK++aRc9XMQUAztT3+iPOC+qz641ayfM4
         rOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uh3V+KhWN7/HDkvhbVf6laOL4Ct4HKkj535+ZUd6sTc=;
        b=OK2eOGhS17AWr5hEBZTm8mBJzKAhkYqhc7c3F/6z6caO6Ymo9TqVBp1UShfRZfKEJj
         qYJG5yCG2eIjKVjp8Day9sU7mZg90VYwXmVhlXO2OqNX1WTPwJB3/EWMbYzSppb8+bwV
         dSIPvXOpr94pTRDqxZ921YyAGytEs6xXFcblVWZzh9Ho4vrnOrcky7007+Uo5VFrZEUC
         BXD5t5J9GqJ67BfMxpHyyvM7EAYgEF+3f/lVjyiTBnsXGHHfkVtttUamQzeDMohDWXs8
         JK5tu1EAe7ZmQkMjg87hLkHm/mmGEpnjVmyBvvEvtvDtbxvK2yrW+bZqk77tZVDLtn6v
         cmOA==
X-Gm-Message-State: AOAM531NZZzvNOsKl0AADAEmRjmODye7JpOYi4kBTNSAUFYCsE3Ub2iH
        Ftlpc0Ns2SesAPN6zmf5bTkNYVXDiLUtYlfEIMc=
X-Google-Smtp-Source: ABdhPJyTjVXWUex3kx74jUkyZZy1Lgyk60TiagscYsQU7F+1Bp3htGq7r9PeARDpBYraFJPo86RpwCEz5AO3nHAjN0c=
X-Received: by 2002:a17:906:9f21:: with SMTP id fy33mr46127665ejc.567.1635868395452;
 Tue, 02 Nov 2021 08:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211102094907.31271-1-hdegoede@redhat.com> <20211102094907.31271-11-hdegoede@redhat.com>
 <CAHp75Vd-xY43H8jPOUqJp55Rq3Wuhsdzctfhqq300S0vAKTzpw@mail.gmail.com> <1f4377bb-2902-05e9-95c7-ad924477b543@redhat.com>
In-Reply-To: <1f4377bb-2902-05e9-95c7-ad924477b543@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 17:52:26 +0200
Message-ID: <CAHp75VfJZYiVvE0uQ6ahOJo9wxh0EwjgkeN81vas89pNMDv3GQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] platform/x86: int3472: Pass tps68470_regulator_platform_data
 to the tps68470-regulator MFD-cell
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

On Tue, Nov 2, 2021 at 4:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/2/21 15:34, Andy Shevchenko wrote:
> > On Tue, Nov 2, 2021 at 11:50 AM Hans de Goede <hdegoede@redhat.com> wrote:

...

> >> +               board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
> >> +               if (!board_data) {
> >> +                       dev_err(&client->dev, "No board-data found for this laptop/tablet model\n");
> >> +                       return -ENODEV;
> >
> > It's fine to use dev_err_probe() for known error codes.
> >
> >> +               }
> >
> > ...
> >
> >> +               cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
> >
> > Do we need casting?
>
> Yes, the cast casts away a "const", the const is correct
> since the data only ever gets read by the regulator driver,
> but platform_data pointers are normally not const, so it
> is either the cast, or loose the const on the definition
> of the struct to which board_data->tps68470_regulator_pdata
> points...
>
> So not good choice here really, only chosing between bad
> options and I picked the lets do the cast "least worse"
> option (at least to me). I'm open to changing this.

Hmm... Okay, I was under the impression that MFD is using const for
that field...

-- 
With Best Regards,
Andy Shevchenko
