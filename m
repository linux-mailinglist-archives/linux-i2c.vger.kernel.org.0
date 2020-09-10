Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF30C2648DB
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 17:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730980AbgIJPgl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 11:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731358AbgIJPgP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Sep 2020 11:36:15 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F46C061343
        for <linux-i2c@vger.kernel.org>; Thu, 10 Sep 2020 08:35:51 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id z23so9311390ejr.13
        for <linux-i2c@vger.kernel.org>; Thu, 10 Sep 2020 08:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BXTkxBrQX1Fi6aDdkjMID82XurVAmc4lBQFLUMsq2gk=;
        b=RC+ZT7BvjK4qq6hzJuqwm9x4XRFN9jn8PQza2KtLx6+jWuCwMd7udqz44TwyD9yVSO
         kPrQAbKYUZIW9n3CsPJYJzGDD+7AVpScWFtUiMCyzA3UVRNehD1IWKW+vNJ24OpzdCWP
         jKxHfR2U05e6Y9vHrg3q2/z03OYSlUnBbcCWoMS5lh7EXBEtTxFVljeHIlQjoWg/pnwp
         B43hyi7EbRftVn0jkpXIuQIktY1+nYHJTrGca5Q/s1iQphnAihtcIXwt/S4bXrzQjB/w
         +gjawcC6zPhW8xHCzMDcYomenWpV06AjP3EY1pL5GzwesGsA9RlXJyovLGuY2SA9IiN7
         dO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BXTkxBrQX1Fi6aDdkjMID82XurVAmc4lBQFLUMsq2gk=;
        b=R78fcWYNsd3A3pQtKiTigTPxrMKVsnDBE/4oArsrg86hHvrcw9NOxzvKwSjdAhcnd0
         vOXT6c2dl+STJF7ZIGqW5YnH6y1B85tUJwvuFbgm1/p787w/rEvKKoiEFYOzeYMFl6vF
         cnwzpWRVcENt37tg4kTW99dnDFzB8du9jBtViX2OSvd0n6xnOVIrTcMrWA+6pVKMCK/L
         E6mm/uvmBRLjOl3fIa5sGQ2847infJ53RpVLwzNh8opbK5G3PSdl9PEHC2r1RDOIu6lZ
         4sdAto449my0ERytSyLicFeO2jtBR8DSqbDmtLSFVjBN5XtjwqCoXc11yg+WCN3aLpOa
         Hc3A==
X-Gm-Message-State: AOAM530KE7DLwO3y9HvtlyW0HiIrFbRzyneMqty0A5jYcLBpIKblWo8W
        +EQyhIqvpw/yd3ZwXWw/GbfhfEtUYCKNZoLyIg4AVg==
X-Google-Smtp-Source: ABdhPJx7Mv8T/HQTpG7Qvas8LgnYGmAQQFvExnKZdjcXfZJH7JQDNYWAh9qsaxWtv/Kp4041pJErzuu/1P5IeK2hr9I=
X-Received: by 2002:a17:906:11d2:: with SMTP id o18mr9182631eja.420.1599752150402;
 Thu, 10 Sep 2020 08:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200910134239.192030-1-jonathanh@nvidia.com> <20200910134239.192030-2-jonathanh@nvidia.com>
In-Reply-To: <20200910134239.192030-2-jonathanh@nvidia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 10 Sep 2020 17:35:39 +0200
Message-ID: <CAMpxmJXbhrmJJn4f3zk4=Y2tCwLzpFc+c6NbxcqVe8eaLSRvtw@mail.gmail.com>
Subject: Re: [PATCH 1/5] misc: eeprom: at24: Initialise AT24 NVMEM ID field
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 10, 2020 at 3:43 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>
> The AT24 EEPROM driver does not initialise the 'id' field of the
> nvmem_config structure and because the entire structure is not
> initialised, it ends up with a random value. This causes the NVMEM
> driver to append the device 'devid' value to name of the NVMEM
> device. Although this is not a problem per-se, for I2C devices such as
> the AT24, that already have a device unique name, there does not seem
> much value in appending an additional 0 to the I2C name. For example,
> appending a 0 to an I2C device name such as 1-0050 does not seem
> necessary and maybe even a bit confusing. Therefore, fix this by
> setting the NVMEM config.id to NVMEM_DEVID_NONE for AT24 EEPROMs.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/misc/eeprom/at24.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index e9df1ca251df..3f7a3bb6a36c 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -715,6 +715,7 @@ static int at24_probe(struct i2c_client *client)
>
>         nvmem_config.name = dev_name(dev);
>         nvmem_config.dev = dev;
> +       nvmem_config.id = NVMEM_DEVID_NONE;
>         nvmem_config.read_only = !writable;
>         nvmem_config.root_only = !(flags & AT24_FLAG_IRUGO);
>         nvmem_config.owner = THIS_MODULE;
> --
> 2.25.1
>

This patch is correct and thanks for catching it. I vaguely recall
wondering at some point why the appended 0 in the nvmem name for at24.
Unfortunately this change would affect how the device is visible in
user-space in /sys/bus/nvmem/devices/ and this could break existing
users. Also: there are many in-kernel users that would need to be
updated. I'm afraid we'll need some sort of backward compatibility.

Bartosz
