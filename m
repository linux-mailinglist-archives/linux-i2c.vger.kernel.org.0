Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45364105C24
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2019 22:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfKUVkz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 16:40:55 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:36407 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfKUVkz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Nov 2019 16:40:55 -0500
Received: by mail-yw1-f65.google.com with SMTP id y64so1811139ywe.3
        for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2019 13:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tR7zPw0NRIBlEH7Gx7mSFzrrOGPQV8KzgffSPPviA7M=;
        b=Ld86EQA0R1hOJ6sKkuqoxblruwPy6VQjEUfD9LsILZ/pXkITFpjk7hCHa700buT9cT
         6I2WbMMtkwKDhmBRAF+koqT7jbdgXSTQjf33HLc365fgiMxqIzYS9lZ6gF0YGGyVDXkM
         wtjGPR9rIxnop4U3/iUAJAD9pe+2bRgKhHtAec4TeN59H1xdF2CtBzUpyJy9A41EVors
         sJO9jb3P6EeposVy4HDBXOGuybyTMF8OAs+osCjgksDatqKqnfUiensm1MSyDEFIlsub
         BmQcZdGcJno+6dvnyqxWHQMBSe829VLEO3Uc7pmGUBxKBAyw5g9WqsRZiD2m62MyKqom
         rMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tR7zPw0NRIBlEH7Gx7mSFzrrOGPQV8KzgffSPPviA7M=;
        b=n4cgoVbi4ev4lPwcZEwuSge7Ve8NyMnrNl6hXXZ/3kRtZCI/FYKOcHwsYPMW5IamqO
         VCZScsBLE2I+k60V+BtpIRpTJbspv83cbRKKAyGcvZGclnH1R+n2n/E/7uAUcIAJPSmh
         HsDGTtvTxhrYfCTY0Zwxpa/5F7vkcm6nswrSfNNjnEtl9sgFzQuSVAc7Vr/VAKlxoqO8
         wqPZb3g7+f/ALAdnWuB9qH2Qg3/oYS7UXbuBN1VoOeyMC678XEAQrrLVf9obuAmj+myw
         WVOs0aXIa0/nNyMYf8oWQCyiFpwMhRgT7Z2HwXGpXbyCKSpSUofE7aUObsxbmd7BvnI4
         N1uA==
X-Gm-Message-State: APjAAAW/mwHxrwUJ5w8rjUKUdoUI8YepbEAE7DIiNw8A66Kk2Y077k/R
        R/wV5ujUY1yU5skOsjOQwV/N/nr7wt8rJlV66eGt4A==
X-Google-Smtp-Source: APXvYqzkC4Cnw8HBuYgSsOFwu4Nz2GYwMnfpI/naBWvx4a/s+O82jMYRsWmhKrCcrtthofEB98iwmxCg/jwbjLLLES4=
X-Received: by 2002:a81:3c91:: with SMTP id j139mr6737132ywa.371.1574372453557;
 Thu, 21 Nov 2019 13:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20191121211053.48861-1-rrangel@chromium.org> <20191121140830.4.Iddc7dd74f893297cb932e9825d413e7890633b3d@changeid>
In-Reply-To: <20191121140830.4.Iddc7dd74f893297cb932e9825d413e7890633b3d@changeid>
From:   Guenter Roeck <groeck@google.com>
Date:   Thu, 21 Nov 2019 13:40:42 -0800
Message-ID: <CABXOdTeotUnO_7k9UycJ0vJEKV8pdZOjRrepDv5WVo5RmOLnEA@mail.gmail.com>
Subject: Re: [PATCH 4/4] platform/chrome: i2c: i2c-cros-ec-tunnel: Convert i2c
 tunnel to MFD Cell
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Wolfram Sang <wsa@the-dreams.de>, Akshu.Agrawal@amd.com,
        Guenter Roeck <groeck@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 21, 2019 at 1:11 PM Raul E Rangel <rrangel@chromium.org> wrote:
>
> If the i2c-cros-ec-tunnel driver is compiled into the kernel, it is
> possible that i2c-cros-ec-tunnel could be probed before cros_ec_XXX
> has finished initializing and setting the drvdata. This would cause a
> NULL pointer panic.
>
> Converting this driver over to an MFD solves the problem and aligns with
> where the cros_ec is going.
>

I thought the mfd maintainer objects to the use of the mfd API outside
drivers/mfd. Did that change recently ?

Guenter

> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> ---
> You can now see the device node lives under the mfd device.
>
> $ find /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/ -iname firmware_node -exec ls -l '{}' \;
> /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/firmware_node -> ../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00
> /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/i2c-9/firmware_node -> ../../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00
> /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/i2c-9/i2c-10EC5682:00/firmware_node -> ../../../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00/10EC5682:00
>
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 36 +++++++++----------------
>  drivers/mfd/cros_ec_dev.c               | 19 +++++++++++++
>  2 files changed, 32 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> index 5d91e33eb600..2e3217678fa3 100644
> --- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> +++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> @@ -6,6 +6,7 @@
>  #include <linux/acpi.h>
>  #include <linux/module.h>
>  #include <linux/i2c.h>
> +#include <linux/mfd/cros_ec.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
> @@ -27,7 +28,6 @@
>  struct ec_i2c_device {
>         struct device *dev;
>         struct i2c_adapter adap;
> -       struct cros_ec_device *ec;
>
>         u16 remote_bus;
>
> @@ -176,6 +176,7 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
>  {
>         struct ec_i2c_device *bus = adap->algo_data;
>         struct device *dev = bus->dev;
> +       struct cros_ec_dev *ec = dev_get_drvdata(dev->parent);
>         const u16 bus_num = bus->remote_bus;
>         int request_len;
>         int response_len;
> @@ -183,6 +184,16 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
>         int result;
>         struct cros_ec_command *msg;
>
> +       if (!ec) {
> +               dev_err(dev, "%s: ec is missing!\n", __func__);
> +               return -EINVAL;
> +       }
> +
> +       if (!ec->ec_dev) {
> +               dev_err(dev, "%s: ec->ec_dev is missing!\n", __func__);
> +               return -EINVAL;
> +       }
> +
>         request_len = ec_i2c_count_message(i2c_msgs, num);
>         if (request_len < 0) {
>                 dev_warn(dev, "Error constructing message %d\n", request_len);
> @@ -212,7 +223,7 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
>         msg->outsize = request_len;
>         msg->insize = response_len;
>
> -       result = cros_ec_cmd_xfer_status(bus->ec, msg);
> +       result = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
>         if (result < 0) {
>                 dev_err(dev, "Error transferring EC i2c message %d\n", result);
>                 goto exit;
> @@ -241,17 +252,11 @@ static const struct i2c_algorithm ec_i2c_algorithm = {
>
>  static int ec_i2c_probe(struct platform_device *pdev)
>  {
> -       struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
>         struct device *dev = &pdev->dev;
>         struct ec_i2c_device *bus = NULL;
>         u32 remote_bus;
>         int err;
>
> -       if (!ec->cmd_xfer) {
> -               dev_err(dev, "Missing sendrecv\n");
> -               return -EINVAL;
> -       }
> -
>         bus = devm_kzalloc(dev, sizeof(*bus), GFP_KERNEL);
>         if (bus == NULL)
>                 return -ENOMEM;
> @@ -263,7 +268,6 @@ static int ec_i2c_probe(struct platform_device *pdev)
>         }
>         bus->remote_bus = remote_bus;
>
> -       bus->ec = ec;
>         bus->dev = dev;
>
>         bus->adap.owner = THIS_MODULE;
> @@ -292,25 +296,11 @@ static int ec_i2c_remove(struct platform_device *dev)
>         return 0;
>  }
>
> -static const struct of_device_id cros_ec_i2c_of_match[] = {
> -       { .compatible = "google,cros-ec-i2c-tunnel" },
> -       {},
> -};
> -MODULE_DEVICE_TABLE(of, cros_ec_i2c_of_match);
> -
> -static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] = {
> -       { "GOOG0012", 0 },
> -       { }
> -};
> -MODULE_DEVICE_TABLE(acpi, cros_ec_i2c_tunnel_acpi_id);
> -
>  static struct platform_driver ec_i2c_tunnel_driver = {
>         .probe = ec_i2c_probe,
>         .remove = ec_i2c_remove,
>         .driver = {
>                 .name = "cros-ec-i2c-tunnel",
> -               .acpi_match_table = ACPI_PTR(cros_ec_i2c_tunnel_acpi_id),
> -               .of_match_table = of_match_ptr(cros_ec_i2c_of_match),
>         },
>  };
>
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 1efdba18f20b..61b20e061f75 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -113,6 +113,18 @@ static const struct mfd_cell cros_ec_vbc_cells[] = {
>         { .name = "cros-ec-vbc", }
>  };
>
> +static struct mfd_cell_acpi_match cros_ec_i2c_tunnel_acpi_match = {
> +       .pnpid = "GOOG0012"
> +};
> +
> +static struct mfd_cell cros_ec_fw_cells[] = {
> +       {
> +               .name = "cros-ec-i2c-tunnel",
> +               .acpi_match = &cros_ec_i2c_tunnel_acpi_match,
> +               .of_compatible = "google,cros-ec-i2c-tunnel"
> +       },
> +};
> +
>  int cros_ec_check_features(struct cros_ec_dev *ec, int feature)
>  {
>         struct cros_ec_command *msg;
> @@ -485,6 +497,13 @@ static int ec_device_probe(struct platform_device *pdev)
>                          "failed to add cros-ec platform devices: %d\n",
>                          retval);
>
> +       retval = mfd_add_hotplug_devices(ec->dev, cros_ec_fw_cells,
> +                                        ARRAY_SIZE(cros_ec_fw_cells));
> +       if (retval)
> +               dev_warn(ec->dev,
> +                        "failed to add cros-ec fw platform devices: %d\n",
> +                        retval);
> +
>         /* Check whether this EC instance has a VBC NVRAM */
>         node = ec->ec_dev->dev->of_node;
>         if (of_property_read_bool(node, "google,has-vbc-nvram")) {
> --
> 2.24.0.432.g9d3f5f5b63-goog
>
