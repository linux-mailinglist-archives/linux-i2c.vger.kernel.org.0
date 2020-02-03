Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE881504DA
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2020 12:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbgBCLE5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Feb 2020 06:04:57 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38583 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbgBCLE4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Feb 2020 06:04:56 -0500
Received: by mail-ot1-f68.google.com with SMTP id z9so13211204oth.5;
        Mon, 03 Feb 2020 03:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=39ey6dAvb7XEBXTbA1g4KlU1WTF7xT5pdjYUkxwmTMU=;
        b=J2lTEKU3fkx4Keh+2hfhaG+6pzAmp7ZRaN8oE8BKHjUt+TMaWFyJRyN5z29XYO38XU
         cv+1r6rbo2GW/ghF+o+eGF9+VGorr2s4Ipc9BsxgyaH7iVUxoFYmH7xr9Nok/RCA+3tG
         lgc4vGrdw8mMVGruyuRf+/81MM2d3v9EQjTTz08ed01CKBq5COT6ujNbLFXLMSpT3YfU
         xvXuJSYebA7LK/MSZmG3NDGerb1H6ZmuXMGC3VIt6LOb6feQQ70rOqSeH+tCOnAJpkOe
         EFvAhfjguzzONYgDKovU8ooPg6IDBvh43TXFsquEpfmttiFMb3RaCS7GC555zDZzxsxz
         W6rg==
X-Gm-Message-State: APjAAAX7muTCi10cnTT3z1fuZhuY/RKYjO46Lv1aw8M0KVXoUFOlbNYR
        MZmz1k96Me6UCtPmWf95Ls014BXYgPAuL1T92jY=
X-Google-Smtp-Source: APXvYqwiD1gMIppQtu9gB4G8UbdXVz2d8mTCHH7J5oQ6OMEMxQVhqrXC8gY9DjZgRWIukbhAWVTGH7dwjt5uq8xZFAU=
X-Received: by 2002:a05:6830:4b9:: with SMTP id l25mr17528161otd.266.1580727894844;
 Mon, 03 Feb 2020 03:04:54 -0800 (PST)
MIME-Version: 1.0
References: <1580693767-5185-1-git-send-email-guohanjun@huawei.com>
In-Reply-To: <1580693767-5185-1-git-send-email-guohanjun@huawei.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 3 Feb 2020 12:04:43 +0100
Message-ID: <CAJZ5v0jBbhyueE4LGp5NWKz_o2edY1EDuhaomVuSj=CmdjU_yg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ACPI / APD: Add clock frequency for Hisilicon
 Hip08-Lite I2C controller
To:     Hanjun Guo <guohanjun@huawei.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>,
        Sheng Feng <fengsheng5@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 3, 2020 at 2:41 AM Hanjun Guo <guohanjun@huawei.com> wrote:
>
> I2C clock frequency of Designware ip for Hisilicon Hip08 Lite
> is 125M, use a new ACPI HID to enable it.
>
> Tested-by: Sheng Feng <fengsheng5@huawei.com>
> Signed-off-by: Hanjun Guo <guohanjun@huawei.com>
> ---
>
> v2:
>  - Reverse the order of the two patches suggested by Andy;
>
>  drivers/acpi/acpi_apd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
> index 71511ae..ba2612e 100644
> --- a/drivers/acpi/acpi_apd.c
> +++ b/drivers/acpi/acpi_apd.c
> @@ -161,6 +161,11 @@ static int st_misc_setup(struct apd_private_data *pdata)
>         .fixed_clk_rate = 250000000,
>  };
>
> +static const struct apd_device_desc hip08_lite_i2c_desc = {
> +       .setup = acpi_apd_setup,
> +       .fixed_clk_rate = 125000000,
> +};
> +
>  static const struct apd_device_desc thunderx2_i2c_desc = {
>         .setup = acpi_apd_setup,
>         .fixed_clk_rate = 125000000,
> @@ -243,6 +248,7 @@ static int acpi_apd_create_device(struct acpi_device *adev,
>         { "CAV9007",  APD_ADDR(thunderx2_i2c_desc) },
>         { "HISI02A1", APD_ADDR(hip07_i2c_desc) },
>         { "HISI02A2", APD_ADDR(hip08_i2c_desc) },
> +       { "HISI02A3", APD_ADDR(hip08_lite_i2c_desc) },
>         { "HISI0173", APD_ADDR(hip08_spi_desc) },
>         { "NXP0001", APD_ADDR(nxp_i2c_desc) },
>  #endif
> --

Both patches in the series applied as 5.6 material, thanks!
