Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23D623F284
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 20:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgHGSI5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 14:08:57 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35153 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgHGSI5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Aug 2020 14:08:57 -0400
Received: by mail-ot1-f66.google.com with SMTP id 93so2305148otx.2;
        Fri, 07 Aug 2020 11:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vlBLt0wVavmDZ5RFEsE+vCh0JS01F9HZx3Rc707e4Kw=;
        b=d6mJgNWfX5o6T2N9E2ZV11Oc/wjLapES/dMSdzTwqWAZe5G/4i/3Sjr9cJgb81Brz+
         RTCDoutlMnVUZnsTwuBqnoGrIpVmfHPEXiuKRg6BU5alzfZhJhJxsZx/GU+l3NYkxNiC
         ZHG7t2q2DVz53gDqCe60YieNwRlwM4Exar4s0tYfP1mCmxwVhO/kHqd4jsvXykNPk7lY
         m+/kY/8GmTleUO28VfZF7AicHeOR64SWr0RHgHzjfd4NzzeEI5iI/oDRhBUb1+gsNTAB
         SapBNigx6t2H9+lcFRCPJeoI8PDuwlnxqvSV5oPVYNYBq85z629H6+40U2FCylhZvsbu
         1mzw==
X-Gm-Message-State: AOAM531x9kiWXbz/SIy3S3Vo1Vi0sO7K+IbCxlUwl+OlWFW1oSP2qVTe
        6b6ASJzv07u5XAg03uCcndtJzQ7DaO32lR2ZPvs=
X-Google-Smtp-Source: ABdhPJwS6Rs7JJC7qd1+eUP1wOhP9sPrOMJCwJ8G7Tro9YiSK2Elieu727o27cU/trsCY95ziwt2Qftnp7gkk1L3qkg=
X-Received: by 2002:a05:6830:1e5c:: with SMTP id e28mr12255651otj.118.1596823735863;
 Fri, 07 Aug 2020 11:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200807093529.5343-1-puwen@hygon.cn>
In-Reply-To: <20200807093529.5343-1-puwen@hygon.cn>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Fri, 7 Aug 2020 20:08:44 +0200
Message-ID: <CAJZ5v0hJoJr5+GSZfoYXmTtH_TrY17P_xRABZg1YFnQ+WUaqmg@mail.gmail.com>
Subject: Re: [PATCH RESEND] i2c: designware: Add device HID for Hygon I2C controller
To:     Pu Wen <puwen@hygon.cn>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 7, 2020 at 11:37 AM Pu Wen <puwen@hygon.cn> wrote:
>
> Add device HID HYGO0010 to match the Hygon ACPI Vendor ID (HYGO) that
> was registered in http://www.uefi.org/acpi_id_list, and the I2C
> controller on Hygon paltform will use the HID.
>
> Signed-off-by: Pu Wen <puwen@hygon.cn>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Wolfram Sang <wsa@kernel.org>
> ---
>  drivers/acpi/acpi_apd.c                     | 1 +
>  drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
> index ba2612e9a0eb..f24f6d3f1fa5 100644
> --- a/drivers/acpi/acpi_apd.c
> +++ b/drivers/acpi/acpi_apd.c
> @@ -240,6 +240,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
>         { "AMDI0020", APD_ADDR(cz_uart_desc) },
>         { "AMD0030", },
>         { "AMD0040", APD_ADDR(st_misc_desc)},
> +       { "HYGO0010", APD_ADDR(wt_i2c_desc) },
>  #endif
>  #ifdef CONFIG_ARM64
>         { "APMC0D0F", APD_ADDR(xgene_i2c_desc) },
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index a71bc58fc03c..0dfeb2d11603 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -55,6 +55,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
>         { "HISI02A1", 0 },
>         { "HISI02A2", 0 },
>         { "HISI02A3", 0 },
> +       { "HYGO0010", ACCESS_INTR_MASK },
>         { }
>  };
>  MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
> --

Applied as 5.9-rc1 material, thanks!
