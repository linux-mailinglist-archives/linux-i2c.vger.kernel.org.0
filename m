Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0643442FFC
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 15:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhKBOQW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 10:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhKBOQW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Nov 2021 10:16:22 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D805C061714;
        Tue,  2 Nov 2021 07:13:47 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id m14so23419557edd.0;
        Tue, 02 Nov 2021 07:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+j8hsXOY8XFBcUQY09d3Bm6u2Cd3NbaccVLoECv3HYE=;
        b=Tdf1K3H+Lg7s+DMqBUPbp1Zj4RDwqdxJ5f9UrW88BlRUYlgBYic1r7/n7I13XZNDBU
         oG5MV/LgkcrxjTcxXakGCMiekxd9Xs7A8uQyu6Zq5gkIAyFJyUVtqhjDvIBm0ML77BZx
         SXq829uwldsaG4eMoTAK8Crrhzm2EkP6TsmBkUDwg2/pHv0aLXJXh9z3brShcJwYF/D5
         DijQxGvU1JDSkzbIxedUwKVc+Qm/OQO2bLj74ptbpKXHkcTfPEFOdtliboFWtJCxPZkw
         cH/KR6rcdAAbql0GwZz/RxdfBGSWaRjJ3bad2XkBiCIrZlVJ+2tukjBswD2rsr2IdD7i
         roWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+j8hsXOY8XFBcUQY09d3Bm6u2Cd3NbaccVLoECv3HYE=;
        b=emZMSV1Iln4zjpD/elp9Ewo0lQHX0YUV0lkDofhK6DU9oAbgFf1vZZcVGloSIZggrg
         SQu3v6Dm1QWYszhgIaX/cK/qSZo6fy+X8Mw5z26jLIl45l2XWIXSR87pK+XaizjekXDB
         lFsBsqqFPklZ8yNLYPXtneR7Mree9u6lX9YoVLUc6OARoLjlWh67NAB6un/Dnqwj7uYp
         ICDpVFIY+5UpBMoCKe2qHrzHeen2iLALPGmtRr7ZXkI39DH2obKIZOIS4RVCVMPN84NA
         47zGhaSidqKeSPNqkP6RNAATjcluDDkqUKJBU4/caSoZW87XoHGrIt4uTZ7DN8efLoY/
         l3/w==
X-Gm-Message-State: AOAM531QnNbRIYOn2IE/+bolNcddt46rMvWTo4A1A8J1mRZISrJH3Vga
        gwMO+b2XLme9q0EFgEPhbsxlQqoyIIwJwt76Q8w=
X-Google-Smtp-Source: ABdhPJyKcI23macxqNFIt9wwe+SVKY0dzoujCECZBAvK1EiUAl8fA0zKRHCqPQRXJB+c9kWKLTkoHkxrArinkXDo700=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr45648690ejc.69.1635862424213;
 Tue, 02 Nov 2021 07:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211102094907.31271-1-hdegoede@redhat.com> <20211102094907.31271-8-hdegoede@redhat.com>
In-Reply-To: <20211102094907.31271-8-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 16:12:54 +0200
Message-ID: <CAHp75VfUUfJPRkwgSFCddv-Dm5PRNQkpKvAaATAtkCUvConhGg@mail.gmail.com>
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
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note git rename detection is failing for the new common.c but this is
> just the old intel_skl_int3472_common.c with the driver registering
> bits removed.

-M accepts a parameter (in percents) to set the threshold. Default is
something like ~70 (?). You may play with it and see when it starts
detecting the rename.

-- 
With Best Regards,
Andy Shevchenko
