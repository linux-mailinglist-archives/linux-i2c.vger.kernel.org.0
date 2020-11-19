Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31D72B9618
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Nov 2020 16:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgKSPYy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Nov 2020 10:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728018AbgKSPYy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Nov 2020 10:24:54 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB71BC0613D4;
        Thu, 19 Nov 2020 07:24:53 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id b63so4789918pfg.12;
        Thu, 19 Nov 2020 07:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rKGDvwwf0BJyiVgQU7KDz2JZW6ZWNxeRA71HGxrlgOk=;
        b=J/YCGZvtwlX/8XtYEmysFnKDvjpTRHkzdA9UPpf6ZIS+l5g8K/pF1ED7LmloVVi7fk
         G3kThb1661IT5QXdx5MS1h5fAsOUkTVQENCAzMchCk/rdVnlVVO6rkour8GUG4Eah2Rt
         ItInq+Fncz3f2G6BTN2cFW9/ZHi6nBra6y+UZkABzYLtcJZowzNDKUHsT/EPzUM5obWH
         VzzMFxH+qgrqz8MTwlOflibya14AYn5riuyiwGqtET+qiYGUpea9npZwvaWeX3fAPFJY
         s0htUe6ht37nAH1ElBZXXatYoUTErd85Y4mf/nIKORJgJ343CWb0jXjGhoFlDDAiYEnF
         HIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rKGDvwwf0BJyiVgQU7KDz2JZW6ZWNxeRA71HGxrlgOk=;
        b=avvWIKpK/LDCMRacXd+cqWMuMZmUtd1aqPEfHAOp2HMxyAkCWGdPrCJlwt3ltvb6BO
         4rh8PrJqJkn7sJo5YEUIhdkFqbpjVBAlsKbq2ye811mYTNpSj9VIauAW38U3rq8Xnq5T
         mW8RQaY2XKcjwo+8Gh3fFb7aCuLw6s8xnmiVcEeMAT8sOscHss1bv4DPeZ0U8di4gsht
         IPiVwVLUhJOcXqtjzS+lh39TYplhiFuAFMnxMsKuYW3a2tylEZJudViDqqZCHwSvzGLV
         I1fq0rEwekIuhi69xKjVxq90hlaRzVs+VVt6iMmW/S9aQU3rWUA8PkJ/teCZ6n+62knc
         mvLQ==
X-Gm-Message-State: AOAM533/K9O9EyLS/uqRgNYgOIfQlV2yHFTAGlEtqHtjoLFjILZeAGED
        HUF7sz8gUdyoOZLn+1436IY0/+3wZw6sbNMZSZo=
X-Google-Smtp-Source: ABdhPJxqG/ieC3mvkvSTZcfaj7z1cqJDpHXN5/j873Xrx9Ga3FWV2TtW5+HAMHSR5worVSvdSuA3xelbBzzNvBE4/88=
X-Received: by 2002:a63:1514:: with SMTP id v20mr13609620pgl.203.1605799493298;
 Thu, 19 Nov 2020 07:24:53 -0800 (PST)
MIME-Version: 1.0
References: <20201118234025.376412-1-evgreen@chromium.org> <20201118153951.RESEND.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
In-Reply-To: <20201118153951.RESEND.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Nov 2020 17:25:41 +0200
Message-ID: <CAHp75VdtwyCj7emc7Bk87q7kMQA0sSX81-aK-fMq4qTfTF-c_g@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 2/2] i2c: i2c-mux-gpio: Enable this driver in
 ACPI land
To:     Evan Green <evgreen@chromium.org>
Cc:     Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 19, 2020 at 1:40 AM Evan Green <evgreen@chromium.org> wrote:
>
> Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
> property translates directly to a fwnode_property_*() call. The child
> reg property translates naturally into _ADR in ACPI.
>
> The i2c-parent binding is a relic from the days when the bindings
> dictated that all direct children of an I2C controller had to be I2C
> devices. These days that's no longer required. The i2c-mux can sit as a
> direct child of its parent controller, which is where it makes the most
> sense from a hardware description perspective. For the ACPI
> implementation we'll assume that's always how the i2c-mux-gpio is
> instantiated.

...

> +#ifdef CONFIG_ACPI
> +
> +static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> +                                    struct fwnode_handle *fwdev,
> +                                    unsigned int *adr)
> +
> +{
> +       unsigned long long adr64;
> +       acpi_status status;
> +
> +       status = acpi_evaluate_integer(ACPI_HANDLE_FWNODE(fwdev),
> +                                      METHOD_NAME__ADR,
> +                                      NULL, &adr64);
> +
> +       if (!ACPI_SUCCESS(status)) {
> +               dev_err(dev, "Cannot get address\n");
> +               return -EINVAL;
> +       }
> +
> +       *adr = adr64;
> +       if (*adr != adr64) {
> +               dev_err(dev, "Address out of range\n");
> +               return -ERANGE;
> +       }
> +
> +       return 0;
> +}
> +
> +#else
> +
> +static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> +                                    struct fwnode_handle *fwdev,
> +                                    unsigned int *adr)
> +{
> +       return -EINVAL;
> +}
> +
> +#endif

I'm wondering if you may use acpi_find_child_device() here.
Or is it a complementary function?

...

> +       device_for_each_child_node(dev, child) {
> +               if (is_of_node(child)) {
> +                       fwnode_property_read_u32(child, "reg", values + i);
> +
> +               } else if (is_acpi_node(child)) {
> +                       rc = i2c_mux_gpio_get_acpi_adr(dev, child, values + i);
> +                       if (rc)
> +                               return rc;
> +               }
> +
>                 i++;
>         }

And for this I already told in two different threads with similar code
that perhaps we need common helper that will check reg followed by
_ADR.

-- 
With Best Regards,
Andy Shevchenko
