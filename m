Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9215257F83
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 19:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgHaRVx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 13:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgHaRVw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 13:21:52 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C90C061573
        for <linux-i2c@vger.kernel.org>; Mon, 31 Aug 2020 10:21:51 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id w1so2567655edr.3
        for <linux-i2c@vger.kernel.org>; Mon, 31 Aug 2020 10:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nU/5oe5+A3cUKVWl9Yx/iTqCnlQo0CnopBUHSvATE9w=;
        b=I9QG+YiLABt6ZlLm2Kf6dV+Z9Pz+ScDSNBEDf6zvxQnBmEMqsmG/vWcctjRlO9SDm8
         4bPnrQMFFDImHaWitXR4KtXte7QA7C8R7a1C5I4df2o5en+8A4LXYEBDRwJB/ceFXIzg
         +vAEman2dOd0j0r2O0PiLsSmpa2AJI3fN3mM7HK0rmBIIITTGe9OnUgU22JVy3J0EZLC
         wzeJNhese/gVsAO0jtlpdbcoGcauWjrmBFVCqTqvbjpIII6S3ZFyPQTjeE9ERlCm8A8w
         ZcKYHMPdZqle5o3RPDEwcWFztLNZxfDYdkGPGwPmJhtILqpRhN41+zTF14eEq080fzWH
         PDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nU/5oe5+A3cUKVWl9Yx/iTqCnlQo0CnopBUHSvATE9w=;
        b=rPwViNz1Vai6bn5s+DHrwl9Bz5XxxqN8l3jY2QSvmJmz5SyzGNq0T2RJFoDWbuFe1m
         RJRIQngRzsnAE3jQbNz1fUrTwWDDlYjWLr9+nogOmlo8P/qSRjGTKq1wzWHkr7gJcY86
         vBA16rto4k89N5r0IQ7mZqAEeWnSRl57i7kZ7y6pnxwq54ihDKvOOCODqmlXhIVK0Zrl
         oCllGhDAw3hFRSJ6jKOhWJCciXG5Pxh5loxQMutDZZGmTNJI21NB34a+E2IEfcwV45Qv
         mljGCP6vcHKBDktydzgAfpZibMKMKsOxnMVRosU3kHqnvLfO2OJS2+JZAJ1RIPCIrjqO
         UsEQ==
X-Gm-Message-State: AOAM5333e74fZWCmG/yb2FjiGQ17BIG9W0pP65PuTkubqlUHtP/fM9aH
        6G0ZICJ2AbaeKyo+HAgq2MP+dmJr+dyM9fqJy14S1w==
X-Google-Smtp-Source: ABdhPJyX9yFVGmSMpHH76zqQdkJMcCohiLE14tE/uN0FouPWzRdrlDf+mwZe03bax4NaYw/f0J/0DBYIHITNAazWlBQ=
X-Received: by 2002:a05:6402:10d7:: with SMTP id p23mr2026227edu.388.1598894510043;
 Mon, 31 Aug 2020 10:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200831015539.26811-1-vadym.kochan@plvision.eu> <20200831015539.26811-4-vadym.kochan@plvision.eu>
In-Reply-To: <20200831015539.26811-4-vadym.kochan@plvision.eu>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 31 Aug 2020 19:21:39 +0200
Message-ID: <CAMpxmJXzGPXwMYg6e+eCYck+nXnNqxSEBOwm5G-vmLYQA7cDpg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] misc: eeprom: at24: register nvmem only after
 eeprom is ready to use
To:     Vadym Kochan <vadym.kochan@plvision.eu>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 31, 2020 at 3:56 AM Vadym Kochan <vadym.kochan@plvision.eu> wrote:
>
> During nvmem_register() the nvmem core sends notifications when:
>
>     - cell added
>     - nvmem added
>
> and during these notifications some callback func may access the nvmem
> device, which will fail in case of at24 eeprom because regulator and pm
> are enabled after nvmem_register().
>
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> ---
> v3:
>     1) at24 driver enables regulator and pm state machine after nvmem
>        registration which does not allow to use it on handing NVMEM_PRE_ADD event.
>
>  drivers/misc/eeprom/at24.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 2591c21b2b5d..26a23abc053d 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -692,10 +692,6 @@ static int at24_probe(struct i2c_client *client)
>         nvmem_config.word_size = 1;
>         nvmem_config.size = byte_len;
>
> -       at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
> -       if (IS_ERR(at24->nvmem))
> -               return PTR_ERR(at24->nvmem);
> -
>         i2c_set_clientdata(client, at24);
>
>         err = regulator_enable(at24->vcc_reg);
> @@ -708,6 +704,13 @@ static int at24_probe(struct i2c_client *client)
>         pm_runtime_set_active(dev);
>         pm_runtime_enable(dev);
>
> +       at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
> +       if (IS_ERR(at24->nvmem)) {
> +               pm_runtime_disable(dev);
> +               regulator_disable(at24->vcc_reg);
> +               return PTR_ERR(at24->nvmem);
> +       }
> +
>         /*
>          * Perform a one-byte test read to verify that the
>          * chip is functional.
> --
> 2.17.1
>

Good catch! Thanks for the patch. Can I queue it for fixes
independently from the earlier patches in this series?

Bart
