Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0042E9737
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Jan 2021 15:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbhADOZk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Jan 2021 09:25:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbhADOZk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Jan 2021 09:25:40 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966D5C061793
        for <linux-i2c@vger.kernel.org>; Mon,  4 Jan 2021 06:24:59 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id jx16so36964458ejb.10
        for <linux-i2c@vger.kernel.org>; Mon, 04 Jan 2021 06:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4scUl+v1YCwqYmVFgc2jCG9+0jKzLGv9/Z+7azrVSwo=;
        b=OxccHzdQ6u6qzbh6bnVx7QmVNm6exXTbdiF1dcALyxUqhOiPHdzBCRkptNKVmRMfww
         DsU+s7XsoDjtfyviLxtyaTGI1nR2uhmmTqBt6VpZPxjCSecNLJ0TQxluJAQgY8RcYDRg
         mlFsQrA6WOnXi3Us/j9UD+4W7DsoT7R36aFQfXXwJbkIW3fXSlWEjpdWaSoRUg4bGZKn
         hRQDBvlyPwc5ihYlkeOth2snjjgsUq/XDxnoNMAGU4aizR8CLw7twDzYicuCyjDd/WfP
         ZNGRWCwdmN5GQuGWo9eNaKDxASPw35JJ+dWopkq5nnXSB0hFV7gZ5XCKGeBT1KlxYTOf
         zPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4scUl+v1YCwqYmVFgc2jCG9+0jKzLGv9/Z+7azrVSwo=;
        b=dz3YRfucIRtUMkoTaqobdAkduu0Dqlj3drOpJ5dN3vM06NKcUMdGNgxknD/b2ZJQXR
         Zm1MFpWZMB+epx77iSEaAETL08FHpCqDn6EH3irwQK9Qu+L2bkOAmbAX3wGIoVucEiWx
         Wexvq9cogyWpdI5WOnBbMPBND9Haca2lXflfYf0e3bef8oBFLiU4uR+7O+NL2qyFv7gn
         TivPq98UFTDNPTXYTfV8fW2Bpal+jDplfJ0N9ULwoyW0ThzuHKB3pyNHfnq12r1NDqzX
         2GC+RbTGDlUUvD8tafK0iFsuLZIYeAYoxPB9fHkvQU7Bh2Mn50MTAbDJhbXmPn/mxtSx
         PIkA==
X-Gm-Message-State: AOAM530bfI+vUecs1qUMOYGjrhAY4RJTvblgXFU0yL9qE7Fcl6f4TGGM
        S4u7Mp+x382W/KBleKaEuHtKAZqWZOaxpsHjg31UFQ==
X-Google-Smtp-Source: ABdhPJzioyMsB10+vLhwAQq20lTzns1T/xeSxZ2nxgtRBwL2/NZe2Pr982OHigNu3SwcBnsqGPSLAW9hL5N2bLHXXO4=
X-Received: by 2002:a17:906:3146:: with SMTP id e6mr52348053eje.363.1609770298370;
 Mon, 04 Jan 2021 06:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20201228200618.58716-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201228200618.58716-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Jan 2021 15:24:47 +0100
Message-ID: <CAMpxmJUM-6p_V5c6y+7kzhx92V1qEYC5xNS_PNDLcQYTOzHA2A@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpiolib: Follow usual pattern for
 gpiod_remove_lookup_table() call
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 28, 2020 at 9:06 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The usual pattern for the remove calls, like gpiod_remove_lookup_table(),
> is to be NULL-aware, i.o.w. become a no-op whenever parameter is NULL.
> Update gpiod_remove_lookup_table() call to follow this pattern.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index b02cc2abd3b6..611d6ea82d75 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -3460,6 +3460,10 @@ EXPORT_SYMBOL_GPL(gpiod_add_lookup_table);
>   */
>  void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
>  {
> +       /* Nothing to remove */
> +       if (!table)
> +               return;
> +
>         mutex_lock(&gpio_lookup_lock);
>
>         list_del(&table->list);
> --
> 2.29.2
>

Applied, thanks!

Bart
