Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747CD3621D0
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Apr 2021 16:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243088AbhDPOKN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Apr 2021 10:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243265AbhDPOKF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Apr 2021 10:10:05 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32AEC061756
        for <linux-i2c@vger.kernel.org>; Fri, 16 Apr 2021 07:09:39 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id x8so25106816ybx.2
        for <linux-i2c@vger.kernel.org>; Fri, 16 Apr 2021 07:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+iDAodRRpEUhtkqTZXwhK3yiesnssmbfnpzAO0fQBaQ=;
        b=uQnXtdLxem4ikmdqZ3Sd178lh0PBi6OUJIlybbB1Ie5/18gwUWnyxBhpRpH6dsApt6
         HgrKJn2BSo4sflN3QC1oawT22dcpsQXEonF48AcXTCo3T7YP0nEK5+WDv5oht6teVOwz
         AiygdTYr/z/sfrxidG+UPLWcKK2sIVIJG0FOIlGo/Vk9ZzHwapDhyuh6DzaFInl5xfKH
         igFcFGX/vkuTVhINzKQ5Ry5A/neEO0evmj2KjKwapLWh4OxXRKMvv9yBKqPWN9f7fHR+
         4yFm57+/w47MwLYuHhQ/w9rf3WZlE8y2I4orMG6klYCzxRmT8QZ5mgZ5BLBexnforcOu
         yjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+iDAodRRpEUhtkqTZXwhK3yiesnssmbfnpzAO0fQBaQ=;
        b=PhDN+Fc1v5FsoUaXuvsMwaAJtuy6wB5zBoFTW30zTYZA5tGLbM5u6EzATMvw7g9lgb
         OHexXGqSl63H5eFAMTc7Ca+8Tyv/DerWKmQEbrC9N/8TdXarP4dBBb/NmtOxVm3TiNRu
         Zxg04hrbDLamyns87o2q0vmDKvDZKCOGnSGvOCEU1Oetyg5Fco5Uw4EmpKqfQSJFHk0M
         y1ii1vMjAl+ueP+JyDjdOLKKYyPVHOLmsliNAjXDvBf5izVDr3Q8FKlWWljGZGJd2No9
         WRvwY/n8nf3VZptWOI+kYb4Ly1e3VaMUlYFm2EBUlGU3wdBnX+Nkllx613T2FAPmfK8y
         3Jzg==
X-Gm-Message-State: AOAM531C+pp/74f6J6NFlsl89m7FcpujixN8Uvey7Oq5pLyo9DI6HVp1
        ch9DzZU2jrRX4Vf9VwMQN3KknlRVvIJ/k41tMfC6sg==
X-Google-Smtp-Source: ABdhPJxirPkkW4ar8JP1azi15sakWVGJn4HrEQDx209hIbNv5M1svItYhPj+O3FrREbRjomo94vZ2Z3HsLbFndBeixg=
X-Received: by 2002:a25:1905:: with SMTP id 5mr11994893ybz.302.1618582179030;
 Fri, 16 Apr 2021 07:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210414172916.2689361-1-hsinyi@chromium.org> <20210414172916.2689361-5-hsinyi@chromium.org>
In-Reply-To: <20210414172916.2689361-5-hsinyi@chromium.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 16 Apr 2021 16:09:28 +0200
Message-ID: <CAMpxmJUGxUPYC9NEnJDHYq7Nu=akP5GTpU0ts9htf1vELhK15Q@mail.gmail.com>
Subject: Re: [PATCH v19 4/6] misc: eeprom: at24: check suspend status before
 disable regulator
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Qii Wang <qii.wang@mediatek.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 14, 2021 at 7:29 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> cd5676db0574 ("misc: eeprom: at24: support pm_runtime control") disables
> regulator in runtime suspend. If runtime suspend is called before
> regulator disable, it will results in regulator unbalanced disabling.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Please add the Fixes tag.

> ---
>  drivers/misc/eeprom/at24.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 926408b41270..7a6f01ace78a 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -763,7 +763,8 @@ static int at24_probe(struct i2c_client *client)
>         at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
>         if (IS_ERR(at24->nvmem)) {
>                 pm_runtime_disable(dev);
> -               regulator_disable(at24->vcc_reg);
> +               if (!pm_runtime_status_suspended(dev))
> +                       regulator_disable(at24->vcc_reg);
>                 return PTR_ERR(at24->nvmem);
>         }
>
> @@ -774,7 +775,8 @@ static int at24_probe(struct i2c_client *client)
>         err = at24_read(at24, 0, &test_byte, 1);
>         if (err) {
>                 pm_runtime_disable(dev);
> -               regulator_disable(at24->vcc_reg);
> +               if (!pm_runtime_status_suspended(dev))
> +                       regulator_disable(at24->vcc_reg);
>                 return -ENODEV;
>         }
>
> --
> 2.31.1.295.g9ea45b61b8-goog
>

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
