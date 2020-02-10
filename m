Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7124B157277
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2020 11:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbgBJKFD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Feb 2020 05:05:03 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:43387 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgBJKFD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Feb 2020 05:05:03 -0500
Received: by mail-qk1-f193.google.com with SMTP id p7so926822qkh.10
        for <linux-i2c@vger.kernel.org>; Mon, 10 Feb 2020 02:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3god/b/yvIlvZvunyDH+WBGg0Kw3FYonev0EbEFIPz0=;
        b=hNIk5M8YPli8l4qIA/CU1yDP+M6/l0XPmtMvaMwJGz7vjXTIVHvD435kPx8fUTgC+k
         g4rYF1LRVdRDdbpwwLlmRZR21eTSRPuso6Qr6AUG0VG+xlqKo1GZxOD16kvbZZ8H7xAk
         t7nqFCH7EdENGulohyjfxu16Qn6CGcjBbPxvwkKLjs+vPubwvCLfOdgy5KrQx9XT2sJ1
         2IJEIc/Fh/B1AUm4BuM+qRE99yV/IJlnRb4svzm+W0foajuufrB0fK1ZtgOzyauU9HRU
         6iBt25QqxMUvBkKZlzGdTqdweqsCLaFcqFF6tecTK5+17cOa2opJl9kYFxTNLHHok8qi
         VDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3god/b/yvIlvZvunyDH+WBGg0Kw3FYonev0EbEFIPz0=;
        b=MoiaGJJ0D5FcidlYzKEcw6iLp1qsBmLja98kTvawcnK+D9ma5ADg4XclRn60JusFBS
         QvBj5vdI+tyBjBBVy03R/NnvvZBXxwBZpWbvV69NaYp/IcIMP0u7ISfDy8Pj0wMxy3OG
         W8XZsrfsrXsm7vqoK8rfsKui5t/DyIEH518cCSX+GIEsynx2wi+/uWHEAGog6v0pYBLY
         h3HOgyrefKfn/JTybmrCsejwzAZR+37EacwuLz8UD12s40ABQuxyM3dZZTsWCPJZvCsE
         HXzzIiLSh3Dsd6G5J1a8oo061gGLwzafgFolffgzJ9i5Jc1zzfccKj7ph/hnxQ5Igl6d
         w6wA==
X-Gm-Message-State: APjAAAVLjT4dKwCOKmoQmDTmX36ulJJxjMgLI85qTFLAL1x7ZHv7qG9R
        +wJimSpN7oERXc5Sj3hR9CBqqzjyM2Kck5EZh1iSvz/L
X-Google-Smtp-Source: APXvYqyQryVPCguLwjUuUHNgfdavO1+lnE6Mj4YnkxbZoG9CaHMHWDOiLk63k6dtjOyRHcTh01DwkAR14J8GtcKjYW8=
X-Received: by 2002:a37:6fc4:: with SMTP id k187mr540519qkc.21.1581329102849;
 Mon, 10 Feb 2020 02:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20200127103541.6975-1-o.rempel@pengutronix.de>
In-Reply-To: <20200127103541.6975-1-o.rempel@pengutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 10 Feb 2020 11:04:52 +0100
Message-ID: <CAMpxmJU1U15_HxZfjdzTUfpTjOyhgybD=vPPJ6fXVV8Jy1dEmA@mail.gmail.com>
Subject: Re: [PATCH V1] eeprom: at24: add TPF0001 ACPI ID for 24c1024 device
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Markus Pietrek <mpie@msc-ge.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pon., 27 sty 2020 o 11:35 Oleksij Rempel <o.rempel@pengutronix.de> napisa=
=C5=82(a):
>
> From: Markus Pietrek <mpie@msc-ge.com>
>
> This ID is used at leas on some variants of MSC C6B-SLH board.
>
> Signed-off-by: Markus Pietrek <mpie@msc-ge.com>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  drivers/misc/eeprom/at24.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 2cccd82a3106..1c8e2ff96d9d 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -228,6 +228,7 @@ MODULE_DEVICE_TABLE(of, at24_of_match);
>
>  static const struct acpi_device_id at24_acpi_ids[] =3D {
>         { "INT3499",    (kernel_ulong_t)&at24_data_INT3499 },
> +       { "TPF0001",    (kernel_ulong_t)&at24_data_24c1024 },
>         { /* END OF LIST */ }
>  };
>  MODULE_DEVICE_TABLE(acpi, at24_acpi_ids);
> --
> 2.25.0
>

Patch applied.

Bartosz
