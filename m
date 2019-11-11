Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E40F78A0
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 17:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfKKQUF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 11:20:05 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46093 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbfKKQUF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Nov 2019 11:20:05 -0500
Received: by mail-ed1-f65.google.com with SMTP id x11so12338963eds.13
        for <linux-i2c@vger.kernel.org>; Mon, 11 Nov 2019 08:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Viwlbj65nn8ReJJEw6TxEivw66vJa2K9DgN6wFoU/mc=;
        b=T8mQfy3o88S9x/rjMBJZpXojbwQWJ1vmdC6bMJXLDd2MMVtkgJaPFbygqiOQx5HDGh
         h/WGoCbh5AbAby6bOoKq4twLvdYTks8rs14AsTlYBHBn8oNTL9ZwjPNTDcmLk68iraVV
         mOQO9GL59RXqC2bjR0JkTmoB5vpyfhLZS+PpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Viwlbj65nn8ReJJEw6TxEivw66vJa2K9DgN6wFoU/mc=;
        b=hbx2RoR9IZ1bIPBrfXaStrKxkJVeVddntq+M1EL9V5BdvG9kDXN0F9UBmh1UfH5XhD
         BwuxH9vb66x1NV4jH09Vc55XPY1tkjASRFszdAPb4SUzRY8yIlHa6zaNSV2moRNBB4Ok
         JOrB1MmNGnv+ScuwJ8Ak5UNjyDu5N3W2edAQnDql3WPu1lf+IooQs7e9nmaMqaM8JoLj
         ra/FLVBcezfg60yDTzcDSzCicAfzexE8eg7tBFU4qjwEF0FQTGszBYwP6JhGTi7NShCo
         mB/e/83vRovnE/CNiMFMLLBxOKweSMVIbnI4/yFMlKhoyb7dJU/B+OQ9qdLp8muw7eMf
         aRAA==
X-Gm-Message-State: APjAAAXQlB8SsAqVEAlZgBmlbPN+ksstkMtOp6MN2JFxspifnMoU8+Cs
        Q8rCuSrc2up31EIqL/pzssUL41+dBi4=
X-Google-Smtp-Source: APXvYqxMThhudSxLV0yem7KrKXXd1nUBDysbrwYwtGDr9/CZ/m4IG3uWHj36Tea9CCawTl5rSt8UhQ==
X-Received: by 2002:a05:6402:1a50:: with SMTP id bf16mr27131615edb.116.1573489202901;
        Mon, 11 Nov 2019 08:20:02 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a9sm609781edu.43.2019.11.11.08.20.01
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2019 08:20:02 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id n1so15251211wra.10
        for <linux-i2c@vger.kernel.org>; Mon, 11 Nov 2019 08:20:01 -0800 (PST)
X-Received: by 2002:adf:f20d:: with SMTP id p13mr20546287wro.325.1573489201369;
 Mon, 11 Nov 2019 08:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20191111161431.26293-1-akshu.agrawal@amd.com>
In-Reply-To: <20191111161431.26293-1-akshu.agrawal@amd.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Mon, 11 Nov 2019 09:19:50 -0700
X-Gmail-Original-Message-ID: <CAHQZ30DKWqGj+iC+vebgrZTU31icBMAzN2jW+fdKpwL9eeg4oQ@mail.gmail.com>
Message-ID: <CAHQZ30DKWqGj+iC+vebgrZTU31icBMAzN2jW+fdKpwL9eeg4oQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-cros-ec-tunnel: Make the device acpi compatible
To:     Akshu Agrawal <akshu.agrawal@amd.com>
Cc:     cychiang@chromium.org, Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 11, 2019 at 9:15 AM Akshu Agrawal <akshu.agrawal@amd.com> wrote:
>
> Add ACPI entry and use device_property_read to get fw value
> which is common to both dtsi and acpi.
>
> Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
> ---
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> index c551aa96a2e3..958161c71985 100644
> --- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> +++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> @@ -3,6 +3,7 @@
>  //
>  // Copyright (C) 2013 Google, Inc.
>
> +#include <linux/acpi.h>
>  #include <linux/module.h>
>  #include <linux/i2c.h>
>  #include <linux/platform_data/cros_ec_commands.h>
> @@ -240,7 +241,6 @@ static const struct i2c_algorithm ec_i2c_algorithm = {
>
>  static int ec_i2c_probe(struct platform_device *pdev)
>  {
> -       struct device_node *np = pdev->dev.of_node;
>         struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
>         struct device *dev = &pdev->dev;
>         struct ec_i2c_device *bus = NULL;
> @@ -256,7 +256,7 @@ static int ec_i2c_probe(struct platform_device *pdev)
>         if (bus == NULL)
>                 return -ENOMEM;
>
> -       err = of_property_read_u32(np, "google,remote-bus", &remote_bus);
> +       err = device_property_read_u32(dev, "google,remote-bus", &remote_bus);
>         if (err) {
>                 dev_err(dev, "Couldn't read remote-bus property\n");
>                 return err;
> @@ -271,7 +271,7 @@ static int ec_i2c_probe(struct platform_device *pdev)
>         bus->adap.algo = &ec_i2c_algorithm;
>         bus->adap.algo_data = bus;
>         bus->adap.dev.parent = &pdev->dev;
> -       bus->adap.dev.of_node = np;
> +       bus->adap.dev.of_node = pdev->dev.of_node;
>         bus->adap.retries = I2C_MAX_RETRIES;
>
>         err = i2c_add_adapter(&bus->adap);
> @@ -291,19 +291,24 @@ static int ec_i2c_remove(struct platform_device *dev)
>         return 0;
>  }
>
> -#ifdef CONFIG_OF
>  static const struct of_device_id cros_ec_i2c_of_match[] = {
>         { .compatible = "google,cros-ec-i2c-tunnel" },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, cros_ec_i2c_of_match);
> -#endif
> +
> +static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] = {
> +       { "GOOG001A", 0 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, cros_ec_i2c_tunnel_acpi_id);
>
>  static struct platform_driver ec_i2c_tunnel_driver = {
>         .probe = ec_i2c_probe,
>         .remove = ec_i2c_remove,
>         .driver = {
>                 .name = "cros-ec-i2c-tunnel",
> +               .acpi_match_table = ACPI_PTR(cros_ec_i2c_tunnel_acpi_id),
>                 .of_match_table = of_match_ptr(cros_ec_i2c_of_match),
>         },
>  };
> --
> 2.17.1
>

Acked-by: Raul E Rangel <rrangel@chromium.org>
