Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A738248659
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Aug 2020 15:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgHRNrG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Aug 2020 09:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgHRNqs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Aug 2020 09:46:48 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C03C061389
        for <linux-i2c@vger.kernel.org>; Tue, 18 Aug 2020 06:46:48 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id x12so15132811qtp.1
        for <linux-i2c@vger.kernel.org>; Tue, 18 Aug 2020 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OYeE+N2Xf0Kp13mu6hwKwgfeNAIWcHeQ/RYWvue5k3o=;
        b=j2mdxlZr6SCVKleswmFxfkN8/U6AJmyzUZnv2foYTvEvtX5tOkceIkMPTmfWiB/381
         CjSV1dgxYM91EG3Rk4efTQSb4lM3Xa9mlPn9Ck+QD+WRyfiv64eVUT1WutAPUVf/RQjq
         jLeO2wkRt7wUFCUMVpRDi6qIKPjAnMVWttxeFUvpiy3M2kCKu+IVFCYCjwu5XvCGPZhR
         sZd0NlkHkatO324p7hsZRXxOe9vn113jC6oTrlmeOZ2eQsP18ANrO4bmQbhajfM65i2E
         yrVAOOgmkXipEB08ggadRl8Z6FzHlt/97iLK56u92ARNxB7C5LkDYF5EyHll0CvA7hPG
         V/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OYeE+N2Xf0Kp13mu6hwKwgfeNAIWcHeQ/RYWvue5k3o=;
        b=DOEBtv/pMnzgMizi4DPGqt5Pa6y8BBWxV+L/7hhtIeaKenFbCwxYqYW59QM6lNGNek
         jtOJTUOVOzRfyIZvhkZ49rb74jiLyoWjZMtOhAWz7Oaa16jPG9Vo6eGnDgvTJ1pbT48U
         orkBhJoLclvpyFiDm/vH8RcxM33zWfcjwj8cj/BCCM+DhTWeUxdAx4wFq3fptMSsBh1Z
         ymuwBnk/brEBsp8Yhb8T/+Vy39d7mS3oqPQIdcVVsRlhFVDCrAo6JtYEIPP9yOL0LRak
         xb00n+LtYchJJaQ8tWU82djCnvRQP10JCQsJvjBNZMvrRNH1JUOxWPtOoEOCUoJIGJFN
         JrJQ==
X-Gm-Message-State: AOAM530ahgVVyC5+xqhJS1m8qxTojw/+tlCtqeixOd/v9HcnoInWwXRh
        HjrPNjD59xDjT5KMfpR7k69pDeMPxzGn2XQYmD1X3+8Eg8D9jA==
X-Google-Smtp-Source: ABdhPJw5adUQ4NU/o+dtw4pXGmfqkWoJ6/cyT1GvViuytvrDBY+C8UpRHdp3xh8oL8XKu2B6woDmivl7p9E33sFlpF8=
X-Received: by 2002:aed:21da:: with SMTP id m26mr18234134qtc.197.1597758407628;
 Tue, 18 Aug 2020 06:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200807150005.48c8c89b@endymion> <20200807161906.6d119d2e@endymion>
In-Reply-To: <20200807161906.6d119d2e@endymion>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 18 Aug 2020 15:46:36 +0200
Message-ID: <CAMpxmJUiOjP5oGijw+QQOFj3uQG0fRGPCAFtcUv_=PxTmy4+4Q@mail.gmail.com>
Subject: Re: [PATCH 2/2 RFC] eeprom: at24: Tidy at24_read()
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 7, 2020 at 4:19 PM Jean Delvare <jdelvare@suse.de> wrote:
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
>  drivers/misc/eeprom/at24.c |   13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> --- linux-5.7.orig/drivers/misc/eeprom/at24.c   2020-08-07 14:23:39.882191500 +0200
> +++ linux-5.7/drivers/misc/eeprom/at24.c        2020-08-07 14:28:39.039360687 +0200
> @@ -423,10 +423,7 @@ static int at24_read(void *priv, unsigne
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
> @@ -449,15 +446,15 @@ static int at24_read(void *priv, unsigne
>          */
>         mutex_lock(&at24->lock);
>
> +       i = 0;

Hi Jean,

I think doing:

    for (i = 0; count; i += ret, count -= ret)

would be even more elegant, don't you think?

Bartosz

>         while (count) {
> -               ret = at24_regmap_read(at24, buf, off, count);
> +               ret = at24_regmap_read(at24, buf + i, off + i, count);
>                 if (ret < 0) {
>                         mutex_unlock(&at24->lock);
>                         pm_runtime_put(dev);
>                         return ret;
>                 }
> -               buf += ret;
> -               off += ret;
> +               i += ret;
>                 count -= ret;
>         }
>
> @@ -466,7 +463,7 @@ static int at24_read(void *priv, unsigne
>         pm_runtime_put(dev);
>
>         if (unlikely(at24->read_post))
> -               at24->read_post(orig_off, orig_buf, orig_count);
> +               at24->read_post(off, buf, i);
>
>         return 0;
>  }
>
> --
> Jean Delvare
> SUSE L3 Support
