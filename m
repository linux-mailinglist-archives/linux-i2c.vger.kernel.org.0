Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFD8443021
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 15:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhKBOUA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 10:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhKBOT7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Nov 2021 10:19:59 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5DB4C061714;
        Tue,  2 Nov 2021 07:17:23 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id g14so14362068edz.2;
        Tue, 02 Nov 2021 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T8+WyOM8FuIvYF68qhKwIM74Y8tYUe6j13mhT+Zvc5U=;
        b=X4VEXPrppNXjUsTVE0BGKzoth4gTvq2SLUBZ4Xt8Fy97Hnb75KR/CVdyb+A0Z/mYXg
         4WgF9NghBbT0EbKvgmlQspSFqUPZJu1Qy48nXhLfA6oR5zIFN3WWymGarNvVckUQ3g3t
         jEyZxWqPYx1oOTXvWcdwjNbPCXMM3hv0ftk4NS7XacZ01rIEvPLnhcyE85kFSngPZz5A
         QyaoWPiaRQ03zz8T36nMvcNGLSIhm0AYwM6Jz28rXmUkKBLXpxx7sJhgAq3j2MsbIJdn
         FdiCO0U0SI139gRReiCHoglAyBcDtItj6Jf3xpElXcDr4+Fk+2od4ojhF1FUpAS1hNkw
         K6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T8+WyOM8FuIvYF68qhKwIM74Y8tYUe6j13mhT+Zvc5U=;
        b=i2sQ/C1Ff0uqgPIebg1c0KHMEuGczftg/9tilz18H6pMirvLfElGVFQDCSys8g0FHH
         GvRVm91GNp2hQ2g5+Mk7Ix548JNGXHcSO746kjzBVTS/x1ngNUbHzMxAuErkVpZhXwH2
         WOPNvR8OnFxseM4kRy+yBzQPqoa14rEIYc/mChjep1jxdE2pM6ZXhJU3Ag3b6qoTNUjg
         9FCDWpZMrrUQvud440tZM5nkLT021+ey3gkw8IsQLqoijaO+oopJ2CJ7XirYiVB+b+vL
         AznmAWs84I7yAwH6DWfFgbwl92svy5Jd6H24VGkbSIziS/aMpsPH5s7Ck0kGaSYfADzm
         8eNg==
X-Gm-Message-State: AOAM531mydLEa12dtFzkF7ejHry3WhjRW42pdFXV48gbQxx9PJv+Lyli
        HdMqMG6GRW6cmxpO9ZMMkI3gHEMSvL3H2qAX2HSg8bJu17c=
X-Google-Smtp-Source: ABdhPJw99guFYRrhnUbbHcV2PzcXvkxqZ16jyF+3YDoMLfXSZmSv4HOcjNXybfZBQ5mHxzv1r7y9Tj9EUGxC3ZxC3XQ=
X-Received: by 2002:a50:9ee3:: with SMTP id a90mr45859284edf.224.1635862638354;
 Tue, 02 Nov 2021 07:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211102094907.31271-1-hdegoede@redhat.com> <20211102094907.31271-8-hdegoede@redhat.com>
In-Reply-To: <20211102094907.31271-8-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 16:16:28 +0200
Message-ID: <CAHp75VePSv8b=oTJXJCL_go9Lody+8JQJyMC6exO-Zw8cPk9og@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] platform/x86: int3472: Split into 2 drivers
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

On Tue, Nov 2, 2021 at 11:49 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The intel_skl_int3472.ko module contains 2 separate drivers,
> the int3472_discrete platform driver and the int3472_tps68470
> I2C-driver.
>
> These 2 drivers contain very little shared code, only
> skl_int3472_get_acpi_buffer() and skl_int3472_fill_cldb() are
> shared.
>
> Split the module into 2 drivers, linking the little shared code
> directly into both.
>
> This will allow us to add soft-module dependencies for the
> tps68470 clk, gpio and regulator drivers to the new
> intel_skl_int3472_tps68470.ko to help with probe ordering issues
> without causing these modules to get loaded on boards which only
> use the int3472_discrete platform driver.
>
> While at it also rename the .c and .h files to remove the
> cumbersome intel_skl_int3472_ prefix.

...

> +union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev, char *id)
> +{
> +       struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +       acpi_handle handle = adev->handle;
> +       union acpi_object *obj;
> +       acpi_status status;
> +
> +       status = acpi_evaluate_object(handle, id, NULL, &buffer);
> +       if (ACPI_FAILURE(status))
> +               return ERR_PTR(-ENODEV);
> +
> +       obj = buffer.pointer;
> +       if (!obj)
> +               return ERR_PTR(-ENODEV);
> +
> +       if (obj->type != ACPI_TYPE_BUFFER) {
> +               acpi_handle_err(handle, "%s object is not an ACPI buffer\n", id);

> +               kfree(obj);

I'm wondering if we should use more of the ACPI_FREE() calls as
opposed to ACPI_ALLOCATE_BUFFER. Ditto for all such cases.

> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       return obj;
> +}

-- 
With Best Regards,
Andy Shevchenko
