Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856D5443084
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 15:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhKBOh5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 10:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhKBOhz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Nov 2021 10:37:55 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83560C0613F5;
        Tue,  2 Nov 2021 07:35:20 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id w15so76792713edc.9;
        Tue, 02 Nov 2021 07:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=65sYvvqiPacKnyXGm00uOfZmsdN1H152QZb/K+6oTrA=;
        b=JxLBTKIVNZHK0eYuQS+2xQbio8EFWVSsF86el4ZeRBHIxp4C+xMek7kd13w+RHprtp
         BUr6gFI4Vd7RVLKLTkAdpctZSALuqID7yhubn31jBEo/wGXnTxwHFvGgb5i4tXyM44Ee
         eMuMErWiXd+lLV4bh96VAYwFml+Qjt1p1vDuv5nvc4C96SKi161F3rM8FIZVUGE//s0i
         BLwF+OO8ZOIzlyS7sPYrylrrQKNDcbv8boMgC6JrTdWxM8/0I6RP3FvRt/eSc2c6djHg
         ZW1mqeU1TH+QAxauUw/3Jv37PxViBGQ8hzcIpuWT7DOpoVx8iwLliYA8im2G00scJf3i
         dBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=65sYvvqiPacKnyXGm00uOfZmsdN1H152QZb/K+6oTrA=;
        b=w9WksMXQ69VBCIl/ePBEdHusuh0tpUoLSsMRPQVUZgzkThSOtvCIhdilpIPQKg+YZs
         GuWeFZF3F012u0eAwer5ydliXuZ7UoRjQ5J3KCencmJvnk5zQ/3Vr0fRN2YxoFulg/WL
         /MBFwkBWmjwy3OO/kGI2EqDDba3rUTHCjnZDxFwPb6etYilFOme0FFLquBch3DDjDUBS
         YtYhkdJ2a3R0zppzu28NVAQz0sje5sjpW1/upl+lJqw9sTFk1D+SOB33A2RXBikoHyC3
         C/roUKgdFEdvBpy2aE2N5QNUhmxDPPWCtMglaasXzTFF5RABOXq3Bwo5ieC85PvPPhQP
         SHvg==
X-Gm-Message-State: AOAM530mHExfyJrE6KZuf6NPWOGOTK7Jt7jPq+IWUR3Bh4xFal/6ceEo
        nzunRVd6gIfc88uzY9DrzndOu6onUaLF4Gu3Kgk=
X-Google-Smtp-Source: ABdhPJxbNeuBL+SSNH+3/S3iAwFmMxZhFeZFkV/g7SdZI4XCi+BAFf24eDiSTLXHPzQiLIjNziN/KABxFr0PzlrMtTE=
X-Received: by 2002:a05:6402:207c:: with SMTP id bd28mr41368359edb.240.1635863711126;
 Tue, 02 Nov 2021 07:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211102094907.31271-1-hdegoede@redhat.com> <20211102094907.31271-11-hdegoede@redhat.com>
In-Reply-To: <20211102094907.31271-11-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 16:34:21 +0200
Message-ID: <CAHp75Vd-xY43H8jPOUqJp55Rq3Wuhsdzctfhqq300S0vAKTzpw@mail.gmail.com>
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

On Tue, Nov 2, 2021 at 11:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Pass tps68470_regulator_platform_data to the tps68470-regulator
> MFD-cell, specifying the voltages of the various regulators and
> tying the regulators to the sensor supplies so that sensors which use
> the TPS68470 can find their regulators.
>
> Since the voltages and supply connections are board-specific, this
> introduces a DMI matches int3472_tps68470_board_data struct which
> contains the necessary per-board info.
>
> This per-board info also includes GPIO lookup information for the
> sensor IO lines which may be connected to the tps68470 GPIOs.

...

> +               board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
> +               if (!board_data) {
> +                       dev_err(&client->dev, "No board-data found for this laptop/tablet model\n");
> +                       return -ENODEV;

It's fine to use dev_err_probe() for known error codes.

> +               }

...

> +               cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;

Do we need casting?

...

> +#include <linux/dmi.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/platform_data/tps68470.h>
> +#include <linux/regulator/machine.h>

string.h  for strcmp() ?
kernel.h for ARRAY_SIZE() ?

-- 
With Best Regards,
Andy Shevchenko
