Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A542C45E104
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 20:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243204AbhKYTeq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 14:34:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351803AbhKYTcq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Nov 2021 14:32:46 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDEFC061759;
        Thu, 25 Nov 2021 11:29:34 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id y13so29463547edd.13;
        Thu, 25 Nov 2021 11:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+QdSnn9hnDbXHilVPEzYaOF00rC6aTmARJsrJsKk/HA=;
        b=eZYdfa3q9HtFJRaW20SwlL7XA8WQ7r8jlBGVqh9TyKPBpv/nzIIQJ1cuusxBBozWUp
         SmRZuuOksbeR9Ls1NpzezJ370EtRbOBpS3Ct/g+9c5X3nrrFfrbYZPjn+2cdCDkvrKWu
         Syfgv5XE2Z851DPSLlO0SXfAZ7RcV3EeuawAvCDT+hY6nkmfboeK5w4IHrl9/cDJ73va
         uXtUsQZIq0M4138F61KBzWewxcAsGrbhmCYYPkhWuDoMzmrEE7fympSIBETcwojM7rWH
         dl4WCZb0PFuuETHN9RlD3tdpk0F6EE75DHgzpve6zHolLrfHTPaGkzEMAA+ND0mMkrrQ
         BIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+QdSnn9hnDbXHilVPEzYaOF00rC6aTmARJsrJsKk/HA=;
        b=6bgkqjqzkftARJMMlxgaYP8lyF/PrmfP087r+/QDIJTd18EqYtBiiocMJh0yoM/HgQ
         ugVLkrqtTyAKe1cRUjEgHOYo6ZWa15XOhlt+gYErk9j1y9sHrectZX7WgAWpluIFxI/S
         nNZ/eoJnOnkXCn2zyHnUnvT2PBDerGFo9cKhYNewR/++MJnGlOhbRUkCbJTCiG/SO5vr
         NIXNZeQucNFDE5OwJn1i+6FPAzHGSzU9YSiEs9IhtEmpeLFjVUfNh/6DJmYa1kghq0Av
         dFFqN/dr4cd3EIldl1MbaeK0G/trNui7+Be1N6G8Gs5FfZvGvzChQdfhODc09oFAUj0j
         Oh5A==
X-Gm-Message-State: AOAM5325o18HcT2BoK48JDJ86ks3FMFuVHMt4YxD7wFxOduASExMGVPc
        uVLgAwrqQJqEJI51eC2O1cbK5Y2ap12dovxuaD0=
X-Google-Smtp-Source: ABdhPJxia6v+ggx0h/6ClA1/sHMg1Q/7ZU1xWeQZA6EVhTerXcEGn294ZgigAx875QVPOK7l2krbLRnAJ036HXO5fPk=
X-Received: by 2002:a17:906:489b:: with SMTP id v27mr33672901ejq.567.1637868572711;
 Thu, 25 Nov 2021 11:29:32 -0800 (PST)
MIME-Version: 1.0
References: <1637859224-5179-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1637859224-5179-1-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Nov 2021 21:28:56 +0200
Message-ID: <CAHp75VfPPpTNCaM+GhcqZS53ts-20GBzm+4OWLAjND=z79pgxg@mail.gmail.com>
Subject: Re: [PATCH v4] i2c: tegra: Add the ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linaro-mm-sig@lists.linaro.org,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 25, 2021 at 6:54 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Add support for the ACPI based device registration so that the driver
> can be also enabled through ACPI table.
>
> This does not include the ACPI support for Tegra VI and DVC I2C.

Thanks for an update, my comments below.

...

> -       err = reset_control_reset(i2c_dev->rst);
> +       if (handle)

> +               err = acpi_evaluate_object(handle, "_RST", NULL, NULL);

Does it compile for CONFIG_ACPI=n case?

> +       else
> +               err = reset_control_reset(i2c_dev->rst);

If not, you will need something like this instead:

#ifdef CONFIG_ACPI
               err = acpi_evaluate_object(ACPI_HANDLE(...), "_RST", NULL, NULL);
#else
               err = reset_control_reset(i2c_dev->rst);
#endif

...

> +       err = device_property_read_u32(i2c_dev->dev, "clock-frequency",
> +                                      &i2c_dev->bus_clk_rate);
>         if (err)
>                 i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;

Actually you need to switch to use i2c_timings data structure and
corresponding methods.
This change will be incorporated there. I.o.w. do it as a prerequisite
to this patch.

...

> +       if (ACPI_HANDLE(i2c_dev->dev))
> +               return 0;

With above mentioned ifdeffery this may be converted back to
has_acpi_companion() which is slightly better in this case.

> +       if (ACPI_HANDLE(i2c_dev->dev))
> +               return 0;

Ditto.

P.S> Sorry if I missed something in the previous reviews.

-- 
With Best Regards,
Andy Shevchenko
