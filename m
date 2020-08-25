Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF997251CEC
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 18:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgHYQHm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 12:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgHYQHi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Aug 2020 12:07:38 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0952C061574
        for <linux-i2c@vger.kernel.org>; Tue, 25 Aug 2020 09:07:37 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id dp2so12004623ejc.4
        for <linux-i2c@vger.kernel.org>; Tue, 25 Aug 2020 09:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CMRjHqV8BEZ/nvufHkug3NIOgWnjh1WHK1BRLJsFqao=;
        b=qFRSRGYuBNvD2qkQiRfwZtOktVNNNfX0oiBEHFrLyBJAahU2G18G3asnYks9pbKoQn
         lbWr2t+H7fR78sa/i+nVasHV3WAZZGsalJKXHcupjSlSJ6RfxcyFrBGvBnITva4TY1BL
         nohdP7gCNntLn7NxM5e+rgd0WtImCeQFhZEcRbH+5ZZF3TgvfwdSZIbkIaoAezbkvAnx
         jpxG0xi1YZkhJVjwhRvRl+rcz6kcttNEOkNjgspYDgqXQEj4O/PkrCSEpROkOEiDjDIF
         ZalZHw8hIqFzp2/3r7YCb8P0yfzreuQLWJYDY+pta0CeNacDg+U2FSnuJbGK4EKsynfU
         OKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CMRjHqV8BEZ/nvufHkug3NIOgWnjh1WHK1BRLJsFqao=;
        b=kvOb6Z+SNmPGKxvUIesW5CJ263sKsC5MdPdEQXJVwSFlXQBN22kYCRGcBhPVLZcnuS
         aIZksasy9ZrLDJpsniDIwhuiL9P57V+9o/jdS+nPcBV47R4x52PcvdLFgCU9rAAOJEcx
         //7Vyi87Qntxa/bo9m6BEQMm3/ol3H96g9N/DFekAMeLYj2WP/YT4vWAiL4G27bLDJ/i
         6VF/W6CpuniTyGNQtbZ7Iuj8o5pOd9/vRnosopVj/Hq/UANa8MLjRsQ91ekBo1/xK1P9
         ES+8QpSyan4VP8759+/DMPbcsFmoFcJok0UzUAE9Z+9cyjfJxwJ0wd89W5OBxoq+/Pel
         PThw==
X-Gm-Message-State: AOAM530tchxqncSBF2Lr9EbT0tgWRV705V/fSbp/RVZoGQvRI8IGDXNQ
        fIovd3l7xufz742TE14R55hijoLrWHYKNKK9sCZCH8qW5cU=
X-Google-Smtp-Source: ABdhPJzv0oqKW7r1RufUvIscWiQ7kF6cAj1X4dBvnck1TtKwyV2ehPkueKur7QIIbWVJExp5cwsUYMoGrPnc6DCTQwo=
X-Received: by 2002:a17:906:4d10:: with SMTP id r16mr11063675eju.420.1598371656680;
 Tue, 25 Aug 2020 09:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200825092037.7ded996d@endymion>
In-Reply-To: <20200825092037.7ded996d@endymion>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 25 Aug 2020 18:07:25 +0200
Message-ID: <CAMpxmJUVZCZhU3YqSinaz4WwW-ZnHm49fWe7HMM2Xk==4diFEg@mail.gmail.com>
Subject: Re: [PATCH v2] eeprom: at24: Tidy at24_read()
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 25, 2020 at 9:20 AM Jean Delvare <jdelvare@suse.de> wrote:
>
> The elegant code in at24_read() has the drawback that we now need
> to make a copy of all parameters to pass them to the post-processing
> callback function if there is one. Rewrite the loop in such a way that
> the parameters are not modified, so saving them is no longer needed.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> This has the drawback of creating an asymetry with at24_write(), so
> I'm not 100% if we want to apply this. If anyone has a better idea,
> please let me know.
>
> Changes since v1:
>  * Turn the "while" loop into a "for" loop to make the code neater.
>    Suggested by Bartosz.
>
>  drivers/misc/eeprom/at24.c |   14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>
> --- linux-5.7.orig/drivers/misc/eeprom/at24.c   2020-08-24 19:25:52.967519228 +0200
> +++ linux-5.7/drivers/misc/eeprom/at24.c        2020-08-25 08:25:23.033990857 +0200
> @@ -422,10 +422,7 @@ static int at24_read(void *priv, unsigne
>         struct at24_data *at24;
>         struct device *dev;
>         char *buf = val;
> -       int ret;
> -       unsigned int orig_off = off;
> -       char *orig_buf = buf;
> -       size_t orig_count = count;
> +       int i, ret;
>
>         at24 = priv;
>         dev = at24_base_client_dev(at24);
> @@ -448,16 +445,13 @@ static int at24_read(void *priv, unsigne
>          */
>         mutex_lock(&at24->lock);
>
> -       while (count) {
> -               ret = at24_regmap_read(at24, buf, off, count);
> +       for (i = 0; count; i += ret, count -= ret) {
> +               ret = at24_regmap_read(at24, buf + i, off + i, count);
>                 if (ret < 0) {
>                         mutex_unlock(&at24->lock);
>                         pm_runtime_put(dev);
>                         return ret;
>                 }
> -               buf += ret;
> -               off += ret;
> -               count -= ret;
>         }
>
>         mutex_unlock(&at24->lock);
> @@ -465,7 +459,7 @@ static int at24_read(void *priv, unsigne
>         pm_runtime_put(dev);
>
>         if (unlikely(at24->read_post))
> -               at24->read_post(orig_off, orig_buf, orig_count);
> +               at24->read_post(off, buf, i);
>
>         return 0;
>  }
>
>
> --
> Jean Delvare
> SUSE L3 Support

Patch queued for v5.10.

Thanks!
Bartosz
