Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E022E00E8
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Dec 2020 20:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgLUTYC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Dec 2020 14:24:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgLUTYC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Dec 2020 14:24:02 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CAAC0613D3;
        Mon, 21 Dec 2020 11:23:21 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id hk16so6995684pjb.4;
        Mon, 21 Dec 2020 11:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OJNB6duLuQr1jHZTJGFdXQVfxxzUTpmZhuWoY6RlUlI=;
        b=HTZ50NsytxDPe/Vv4JBcv10crvZA15PEiLHf3ct7DSoch8n7qQOnt4PBUY16j+Pm+N
         6qsapl4I2kkTUhlD1eIucYc0l39o5BWhNnnhZ/fwornhX00KkxwFRKFDiuLln0DWGOQW
         gXqbhIc2yw21XXOR1OZ74cbz1kBislNzQ+ZfRK6Nk9Cz4cjTvfo+MI7l7rHAxIxb+3nR
         sYbDhqOyZXTeD3SJgp4aMijP3BAPwoIdFyJjIT5vDIHCH1h4Vxsk+kAkNxEOBj78Ql+p
         EOLULZJosN6NqwziSEWtC3ynmHldbk6UivpjO6IVr2ZDdkyMcqNwaF6k9W2ogtwkcRgG
         gcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OJNB6duLuQr1jHZTJGFdXQVfxxzUTpmZhuWoY6RlUlI=;
        b=pfAMPKWoIh739XZV7i/NB5sU6fG44lrta0VNJ3OOcitGAcfvuNK2fUhCBGbG6ISAwd
         Hm74dkkanYhWIjo3lzUFlHB95zyz4T3RB2elLL/FiJoaOgnEzHScB3Fo/rGG2dJ9fkH5
         zcVI+VGgnDadx5kJR7p5j3VL+OAtIoXQVdFud+o1dRe1PNGAI0cAPdyRqDQ2QCFHqVNa
         HtatFMOCoHQsT3dHXi0NvGtUsLP4QGFn5j3uf0g41R/sSfVQwANBX3RJxeJwmL3HTSMN
         Il9FZAax0lGLqPEdFVw1v6Y+o5U+MHxfhVM8krhGbnUf6fRD+GdzNEtv+xuXe9IKkjVA
         Vztw==
X-Gm-Message-State: AOAM532zA6IhYK793BpE+uRMKIuXv64VTZ/JR3C4GPokmFhCH86wvHk/
        /UMvxPuZg7Nyum6AGmNU0XPHeatk4XGkiWi13+E=
X-Google-Smtp-Source: ABdhPJwW5keF5naHjsXoSXEPRp0yapfGhnjKi8Z1eWaLDMIT0UU9Jt6HSRmfYurz716TfYAkGbGYVvcW5vwCMjUuYZ0=
X-Received: by 2002:a17:90a:1050:: with SMTP id y16mr18839828pjd.181.1608578601361;
 Mon, 21 Dec 2020 11:23:21 -0800 (PST)
MIME-Version: 1.0
References: <20201221191300.244648-1-hdegoede@redhat.com>
In-Reply-To: <20201221191300.244648-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 21 Dec 2020 21:24:09 +0200
Message-ID: <CAHp75VcEb-qfOQ3_gXOEBj0_gmke7=Y4FUZHin0Y7YfovdVD5Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: Do not print duplicate error when failing to
 register an i2c-client from ACPI
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 21, 2020 at 9:13 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> i2c_new_client_device() already prints an error when it fails. Some
> ACPI tables contain 2 ACPI devices describing the same i2c-client,
> leading to errors like this:
>
> [    1.620847] i2c i2c-4: Failed to register i2c client MAGN0001:00 at 0x1d (-16)
> [    1.620870] i2c i2c-4: failed to add I2C device MAGN0001:00 from ACPI
>
> There is nothing we can do about the first -EBUSY error being logged,
> but the second error does not really add any new information, so lets
> drop it.

Makes sense to me,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/i2c/i2c-core-acpi.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index 37c510d9347a..8ceaa88dd78f 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -225,12 +225,8 @@ static void i2c_acpi_register_device(struct i2c_adapter *adapter,
>         adev->power.flags.ignore_parent = true;
>         acpi_device_set_enumerated(adev);
>
> -       if (IS_ERR(i2c_new_client_device(adapter, info))) {
> +       if (IS_ERR(i2c_new_client_device(adapter, info)))
>                 adev->power.flags.ignore_parent = false;
> -               dev_err(&adapter->dev,
> -                       "failed to add I2C device %s from ACPI\n",
> -                       dev_name(&adev->dev));
> -       }
>  }
>
>  static acpi_status i2c_acpi_add_device(acpi_handle handle, u32 level,
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
