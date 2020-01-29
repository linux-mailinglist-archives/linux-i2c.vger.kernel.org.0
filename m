Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8313D14C920
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 11:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgA2K6B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 05:58:01 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:32992 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgA2K6B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jan 2020 05:58:01 -0500
Received: by mail-qv1-f66.google.com with SMTP id z3so7791793qvn.0
        for <linux-i2c@vger.kernel.org>; Wed, 29 Jan 2020 02:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yKxyrAqGl7a1R1/QWH220u/1bHE8u+OV8pB8+E2QnoU=;
        b=ZAUxhz2q84lWZNe6eqKXYuhQ2pZLEJLlWMxIVzuqpzo1K6iNl6ACmX0USKBVw7SVxd
         nFFAlW6Pj9k/0p8NpA1qFYsEw9jln84XRktiXsfnOkXdnYIHMjCb0Bn7FtpWrjtBKu0L
         2iX8KEegZC0odj/pBTThDpYffWA+MDPaExdWnhwKya74njWpwsz8AlP7B5k8cT1T9JHA
         IrHs9Zj06oLxul4hddgSmeBaVp4ohkUn9XNnB1i7BB5act+fKRO1QkYneT6AXaFxrCSC
         9RuR/X0Ye+uYu2yeFllIYArbhLR/I5HvnuePPMCTSfpW03dT4RKhKGXQDnPkm3hHws/+
         nRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yKxyrAqGl7a1R1/QWH220u/1bHE8u+OV8pB8+E2QnoU=;
        b=KfAhq2EGqXe7dTnvvBNF7dMl0AWIsE0wm+XyNGx1u3tAKqSi4vW05r3JRg7sj4pXT1
         bnxL1ojpWF6CToVL7pTteJvZJ190Ajrku61pXd+QjMxKPLbpZpmzvDfNpSnFwNJ0RaHg
         sjCQQjFoRXsGQ+xnoV14lRIFSa6SqTscIf60k1TIjWlOyWuo25S6JSo/FtzAc/SR+zn3
         ca/pSQ9Ov21nVQV8OCwp2xdbp9ix867rJwJYDzrnVHqYIHYhHbxIVj+cUIokLRQancyr
         xUSlqoMAFlTW76TPQlDAyuvbQ++GPpe/Sl78zbxPvW4I9tlcogSy3xCAYTBqixQhiKK2
         mmMA==
X-Gm-Message-State: APjAAAXTAtM6Z3piiR88BShriGK9y3LW+29BpEMgTUU/VsU/uVqKDIPr
        PED3uuajcQe7Cp3Q59N8dEp5PC//ehP/026zZzydJw==
X-Google-Smtp-Source: APXvYqxfaDAmsIuN1bvsnJEHcFFsZdR29dZd8O6D8f6FJk3JFeFujCb48q3cbymyjef5xyaYHGCPdYxE9FQsmG8jOjY=
X-Received: by 2002:ad4:446b:: with SMTP id s11mr27014935qvt.148.1580295480158;
 Wed, 29 Jan 2020 02:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20200127103541.6975-1-o.rempel@pengutronix.de>
In-Reply-To: <20200127103541.6975-1-o.rempel@pengutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 29 Jan 2020 11:57:49 +0100
Message-ID: <CAMpxmJVa4aWt+dyCEsNyTzppbCO2zs6mAESWLD773AVUDPG-cg@mail.gmail.com>
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

Looks good, I'll queue it for v5.7 after the merge window.

Bartosz
