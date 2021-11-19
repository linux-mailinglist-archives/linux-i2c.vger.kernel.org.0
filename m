Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94945457124
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Nov 2021 15:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236193AbhKSOwN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Nov 2021 09:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236183AbhKSOv6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Nov 2021 09:51:58 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F089C061574;
        Fri, 19 Nov 2021 06:48:56 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id r25so6819905edq.7;
        Fri, 19 Nov 2021 06:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gLcPnEMAwn4t7y2It8oukzLDDUn4wXSHmhDRC10RgYM=;
        b=ReFLHuCsLSa3RFvmafruRHyEDa+24KgoUn+zoWLzX/eFaciYyQ18TlV5aTFsqW74Vw
         Y8cws5QpsPLc7Llvd2wTb53johfDd2D1cUOndTkORzQLOEJqZ3Z4IagFMUvPnzidqc2V
         kbOsj2V8I+/SB3a3JoIrYsdKpsR+6pYgjrocfGdv8cyE4Xu4jhxg4zCiwRaUGqKnHIcw
         2dIGpGcOPo6tZwXEe9UBtlA4N7cpC7E+TN52xTXzVVQvu/KbERUQBW/lOD2NhrzA1J/u
         ZpDERNKi3lBRvefPf2/OPBwpHrtCzfWLQXyERoWJQQt5Uw8+xPsNUrYnPUkhKsNDB3Ck
         FG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gLcPnEMAwn4t7y2It8oukzLDDUn4wXSHmhDRC10RgYM=;
        b=rNf0JHLHIk4hVfeq4ZlkHFkMaQmy2xIVb7NRrktcBsiuYWznsmb1FnWI2HOP3cg5n9
         TYARSvoSxjSqimYgF+uOMJJU35KpfTKnVHQOv9yZgNfgnytO/2nZ9cwOCF/AnRW7K1Am
         h8GpaA/c5z9dPE0ICx4PQDzWUq2VHmxF6GXkXh5IzxU6tEp51OKp2o+EdWoeQIqSTvk9
         BbcSjDNQ69iCLD4Z+q0CANRC6LBQpQjo5lvsTDF1NRQJE+IPlsNA2KL79effhfFMl/z3
         rr59PGK3fPjVJBaGJ2P/QAteI9bR8VP5ftocpsgKBYYsLTPkC4FKbwTnEWo1rXU9fs3F
         YTjQ==
X-Gm-Message-State: AOAM531kHYSVFWxUu7nIAQg0cLP+MwQDQEi7M+Q+gyfBWap6FVEOxX/a
        0S8a04q2fQTor7o6ovg9osFFw0SQvzLCWUEML12ADD0Kzz0=
X-Google-Smtp-Source: ABdhPJz/LT7khmndaJh6E/cCCG+ln1v78jV4U/c8af892ac//k86Y0EQaIRpS4DpsrDA8ornzvTTsvXSwXQvAI9pdsc=
X-Received: by 2002:a17:906:489b:: with SMTP id v27mr8270031ejq.567.1637333334906;
 Fri, 19 Nov 2021 06:48:54 -0800 (PST)
MIME-Version: 1.0
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 Nov 2021 16:48:15 +0200
Message-ID: <CAHp75Vfi5gw4jnJg2bmubKMB_H8s09PfNWVVZWwewuCnW5_+hg@mail.gmail.com>
Subject: Re: [PATCH] i2c: tegra: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 19, 2021 at 3:37 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Add support for ACPI based device registration so that the driver
> can be also enabled through ACPI table.

the ACPI

...

> +       if (has_acpi_companion(i2c_dev->dev)) {

You are checkin for the companion and using a handle, why not check
for a handle explicitly?

> +               acpi_evaluate_object(ACPI_HANDLE(i2c_dev->dev), "_RST",
> +                                    NULL, NULL);
> +       } else {
> +               err = reset_control_reset(i2c_dev->rst);
> +               WARN_ON_ONCE(err);
> +       }

...

> +       if (i2c_dev->nclocks == 0)
> +               return;

Why? Make clocks optional.

...

> -       i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
> -       if (IS_ERR(i2c_dev->rst)) {

> -               dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
> -                             "failed to get reset control\n");
> -               return PTR_ERR(i2c_dev->rst);

Besides the fact this should be as simple as

return dev_err_probe(...)

> -       }

> +       if (!has_acpi_companion(&pdev->dev)) {

...why do you do this?

> +               i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
> +               if (IS_ERR(i2c_dev->rst)) {
> +                       dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
> +                                     "failed to get reset control\n");
> +                       return PTR_ERR(i2c_dev->rst);
> +               }

...

> +static const struct acpi_device_id tegra_i2c_acpi_match[] = {
> +       {.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
> +       {.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
> +       {.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},

> +       { },

No comma for the terminator entry.

> +};

-- 
With Best Regards,
Andy Shevchenko
