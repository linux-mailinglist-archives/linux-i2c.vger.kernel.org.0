Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBBD4394E6
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 13:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhJYLgb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 07:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhJYLg3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 07:36:29 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E13C061745;
        Mon, 25 Oct 2021 04:34:06 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id u13so17885745edy.10;
        Mon, 25 Oct 2021 04:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kY7AJIUIoYcee8SKIHfJwvrAvOFYsxcqzYnektF/Cco=;
        b=QhGcn6WISmFJFiD2wlx2MqBOoZCQZz+hWFA3r2TCK5CHWNXRuG/GmYRULPrnaeSgyS
         zv07ylCbNl2PvKm/rc/y3T6+NQahaBjLMc0FTcC9ru9gGOrlh6nIimEOCv3MajlM2mxo
         UsqTD5IuRNg4v7V4zstk4Ev7dlONuRgZQOoczQTfCfiT7lsjY5EAMDq1hPKCQwl7KgEQ
         SeMV1tJjiMfwmI2+A2/uUNBqwusLa1zuJW+i1jW+3hzNgMlNLYG6q4FOPsihNE+fSx16
         vp3dDVXR6NTg64q6E+CXqaVW/ygf2rGYCFzlzps1B4TFB72m2TLDEyceSQ/4kiprRFIs
         J6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kY7AJIUIoYcee8SKIHfJwvrAvOFYsxcqzYnektF/Cco=;
        b=OTU7f8amd2gg9n95/pLarOUpdk5S2Uc9yUjQEoZes7TxpTSzoBik10W0bnHxCL5lZl
         cGg7bPTZksUIPI/URLe1s7O7uJtauEQh1C9EkII1nd1B2d9VlHXq3KnqhGi4BccrqtCI
         gkpMfiDIJqGN5WPCbGEbPQB+XBAFIU8a+dzC2Keq2ifEAA+8BFqIMWbMPPHu129TRN1f
         +mVvJcA4dkLiDr3GQeeokXXRNx4+VGDzvbgcl3t47BTi16hslji8C+Dt4RIlVj6dNsx7
         ad+oB9M8USGQTviXmlt4oI5Tl3YZf0C4TLEuSmPPVGTsnMtd4xePqPWnLQstQoAPH0f9
         TwYA==
X-Gm-Message-State: AOAM531suIVTP0oSAvr6Ex+5MHEDuZETAlsl0/QgufpqXAcpo59yKkg1
        vAeZ94YbZjnxT2PUa8+TZkGd/paRi38bncaZOqo=
X-Google-Smtp-Source: ABdhPJxAAvMgFzd/ND100uA3KkZo10KPgb9tMWB0oCBNF80MtzYpU8G5/rs15bT7JqjR5a7fYvIQde4tQUT9Ec1rixg=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr22038755ejc.69.1635161645522;
 Mon, 25 Oct 2021 04:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-10-hdegoede@redhat.com>
In-Reply-To: <20211025094119.82967-10-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Oct 2021 14:33:11 +0300
Message-ID: <CAHp75Vee7Np9mOUKMBtu1Ueb7WjcqdH1zLMr4+CdAn7iyTg6rw@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] platform/x86: int3472: Pass tps68470_clk_platform_data
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

On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Pass tps68470_clk_platform_data to the tps68470-clk MFD-cell,
> so that sensors which use the TPS68470 can find their clock.

...

> +               cells = kcalloc(3, sizeof(*cells), GFP_KERNEL);

(1)

> +               if (!cells)
> +                       return -ENOMEM;

...

> +               ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE, cells, 3,

(2)

>                                            NULL, 0, NULL);

Can we provide a definition for magic in (1) and (2)?

-- 
With Best Regards,
Andy Shevchenko
