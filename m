Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3290A30723A
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbhA1JFg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:05:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhA1JFe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Jan 2021 04:05:34 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50004C061573
        for <linux-i2c@vger.kernel.org>; Thu, 28 Jan 2021 01:04:54 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id gx5so6602710ejb.7
        for <linux-i2c@vger.kernel.org>; Thu, 28 Jan 2021 01:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZSpbOwM3PgqgMsQHXF6oksjxPNWs7WTnaxH8AahkgyY=;
        b=D51Vy1KvVoIMcajJ2UgisCcNbDzngPmQBW1XkS+CxR/ySYWIPbYW1RzPePmClZ0rm8
         4jtlg1iGU8IZscGGV2HOPzSfIb0bLTaMsaa2i8ROQOm1HXuSyx6x/nLUUM8sIPMXDRzg
         dOtzFvslT+YOtQ1SgH89MXANMzeA2vblDh/l2ivSWB8Y2MxAulprUb0khur0kY6U1vW0
         ckUNh2kicVJPoDFgaOG0hp+Pg0jAVZr8oU8eDuuBe/4p1PfCk/iot7mKwOp13rzV39Tp
         tcpVcprtjvNpUdIji8XuEM1++l8sg2YxiWYp8djScYLFatv0SEECHJiFtCY4buOxWILa
         ltYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZSpbOwM3PgqgMsQHXF6oksjxPNWs7WTnaxH8AahkgyY=;
        b=J/q5HYeOfq+0zbxqQzAbVlRs5NUtNy8n6Dt8jqwvEOCD2wrZIL9wLQBirQjdfnaZAn
         FMg3geMhXHCkvH7tfZLJaAeUcHhUp2eIdRwRPKwT4AGP8N36PqBpWi1LteZf/+g4gJrL
         3K43XS+a5yhldwV6C9f3z/m9BGX+IXioaiVYxUC6UEzjObj2jfvmvogRgUx4dd5irhdz
         KLLWEte4PSVwYrj6eRnXaB1PU1o2yy7INeNVQH4yXGD0UQZnnDMyUj8YYqlCtJD4bDuU
         Ev4U/JjKXmziC78pNu9qQFluJ7XDt581PKItOg02JrkDSYvzkVeuHYBv/Xx4YPfMn9Ig
         scpw==
X-Gm-Message-State: AOAM5307PtpB4yULYRFVocFJbbsYDgAM6D5osM1qIRLPYafZWIfelLTL
        vt266+TgFJRUsD1JuCp307odKoiybJeAlnZsvtUdvg==
X-Google-Smtp-Source: ABdhPJxn+F9siFCKA5qHn1XUbiijC3To5DMNOqSqTrHG6AgWP7g5X6a8uIwQjLffe8r4cgy/FDblbX0palKas1Y06Wg=
X-Received: by 2002:a17:906:3146:: with SMTP id e6mr9701086eje.363.1611824693112;
 Thu, 28 Jan 2021 01:04:53 -0800 (PST)
MIME-Version: 1.0
References: <20210128081030.2345998-1-hsiufangho@google.com>
In-Reply-To: <20210128081030.2345998-1-hsiufangho@google.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 28 Jan 2021 10:04:42 +0100
Message-ID: <CAMpxmJWMMMNYj-U3WXGBa2GOO1xLze44ABnxnBo6-owgUwWwog@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: Add permission to write_timeout
To:     Jenny Ho <hsiufangho@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 28, 2021 at 9:10 AM Jenny Ho <hsiufangho@google.com> wrote:
>
> Need to change timeout time for different use
> cases to prevent I2C error cases. Open the api
> and allow Read/Write permission to write_timeout
>
> Signed-off-by: Jenny Ho <hsiufangho@google.com>
> ---
>  drivers/misc/eeprom/at24.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 926408b41270..39caead4058c 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -117,7 +117,7 @@ MODULE_PARM_DESC(at24_io_limit, "Maximum bytes per I/O (default 128)");
>   * it's important to recover from write timeouts.
>   */
>  static unsigned int at24_write_timeout = 25;
> -module_param_named(write_timeout, at24_write_timeout, uint, 0);
> +module_param_named(write_timeout, at24_write_timeout, uint, 0600);
>  MODULE_PARM_DESC(at24_write_timeout, "Time (in ms) to try writes (default 25)");
>
>  struct at24_chip_data {
> --
> 2.30.0.280.ga3ce27912f-goog
>

IMO this should be a per-chip device property and not a global module
param. Any chance you could maybe try and extend the driver with a new
property for that?

Bart
