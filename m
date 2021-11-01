Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14747441A3F
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 11:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhKAKzR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 06:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhKAKzQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 06:55:16 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D77DC061714;
        Mon,  1 Nov 2021 03:52:43 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id g10so62675722edj.1;
        Mon, 01 Nov 2021 03:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xM03mkRpggkTdZBr8UHuQHIGfbxgVsel1Sg/TRzxvtE=;
        b=OZVLQZBX6ycC+zd0WtmLcwS3iND3IUVSTOplKx3dfLUSP33lBUk0BJN+Bd2b/lS9XA
         XL9wMRP/MFAvoTceTUp6DayMgE23mo8B3DSROyEgnqhgK7ADbDUd2s9U9Tnxvwwn6nLk
         P0kanU8tb324IRUHAFdzmDyk6uYmq/HSzUmBv2nPvHAXag2m65of9jQiEqMlU6mLvILr
         +bDpSr0eTghrLo/ZKE3dCwhHg0KILpk5fzj19UyqOytvHmXTHDo9iRVk2kcF80jU4Q3c
         r8ZoQXHY67nem4LwX/MCriFgj+B6AasSVsIJebl5w1/sy01T+i10ygbdo5QHjPU6Jux3
         L2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xM03mkRpggkTdZBr8UHuQHIGfbxgVsel1Sg/TRzxvtE=;
        b=cICmw0QYlhpiyeCeZxJnzJgmbLZpRuuIeZBbNAjSwiRaFJy7ePVtNTxzSHDg6Cb5y0
         NMWNCQw0HhxLyX8o7a/wehF0prx8NGz0XxRO6IHp2YxC1wbzRjZh1VO32Ogd1Hauh6aQ
         +6E9jr20fMe+yRYG75trs2r7q7dg1huU548x9UyhsJSrwzeI1X4M2J140NBEt9Ly3gvI
         OcJP6MAU7Ux+I3TYP0UzM3uweDxqMTDqw/B/eYDHrCdCAIm4mAXefunAQdEJWBFHNfaw
         00Pr51obXZ8au5x80U3Ly6WPcFtXLgmhzyBEL8KPHVkDel4zUka7YWWc6yl7RAczrj3E
         OZ3g==
X-Gm-Message-State: AOAM531DxYJwvdpECQeTu/65VkZh2ze95N7Zoh7LPgqB36cEOP9hPSmL
        RTr+J84RpDAZ8ApCmKTPGmVaOyWG+Catw0vR4OA=
X-Google-Smtp-Source: ABdhPJyzOXykBJj/liwHHibR54egDFxo9mlJ7EqGDjocjbC5Uv7ONfzq4opnjhTRXSOWOqmCGlAvGVhNoWXfrRmh1IU=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr35568410ejc.69.1635763962122;
 Mon, 01 Nov 2021 03:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-9-hdegoede@redhat.com>
 <CAHp75VeLAW6ZBQYidnD7PDYfAH3A2bq+oMJTru-9OW_t-XS26g@mail.gmail.com>
 <8804fa29-d0d9-14a9-e48e-268113a79d07@redhat.com> <CAHp75VcdZV7NLEgQnEbsG951Mo2s_eRwfijgjSConXGF2SaSGA@mail.gmail.com>
 <CAHp75Vd6CNkys7E3P_hKAoZ29hA2dpFEqzFWxrSkS8GbC_ivGw@mail.gmail.com> <d36e8cd5-3421-e057-1148-3b8a7769d696@redhat.com>
In-Reply-To: <d36e8cd5-3421-e057-1148-3b8a7769d696@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Nov 2021 12:51:52 +0200
Message-ID: <CAHp75VckN1uK+Z6wMF=XGLROA1wn0TO3wXGaeEdnSgAxdsoFmw@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] platform/x86: int3472: Add get_sensor_adev_and_name()
 helper
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

On Mon, Nov 1, 2021 at 12:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/1/21 11:46, Andy Shevchenko wrote:
> > On Mon, Nov 1, 2021 at 12:44 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:

...

> > Hmm... But then in the original code and with this proposal the
> > acpi_dev_put() seems a bit strange to me.
> > If we are fine (no error code returned) why would the caller (note
> > _er_) go different paths?
>
> We always need to get the dev to get the name, but some callers are
> only interested in the name, so they pass NULL for sensor_adev_ret,
> this helps to keep the code calling this clean, which is the whole
> idea of having a helper for this.

OK.

(Not that I'm very happy with this, but... the function needs a
comment about this alternative behaviour, I forgot if it already has,
though)

-- 
With Best Regards,
Andy Shevchenko
