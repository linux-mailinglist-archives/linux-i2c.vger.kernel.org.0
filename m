Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BF566DCB1
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 12:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236617AbjAQLkz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 06:40:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236850AbjAQLkc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 06:40:32 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4933028C
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 03:40:27 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-4c24993965eso411747987b3.12
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 03:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1MAIkHrjYDmctZsK2XMilntX5BLh0ntnlds10JM8Kqk=;
        b=Vk3LkUqJE/dfyGPezHTsWkWjaKYRkaJxHz4QDB4rSZwndLqSEjreRR2Jn4jUdEkQDU
         qH/zzr79LTh7+caSTrYVTOcyCMYrb6/J+1Z3+PblEjsTqHZhwJnPJBP8aPksa4AiMUgA
         S/hwJfx8Gy1pG6OFCwLBHUKK1uRfOoFog4pGoQIi2UkKeEjGTkDUskbl0blRSDfG8kQB
         mtKwtxgDiTO4DO6vqimOL89NM7M06UK7RjdNMJupUDv87fpc52Z6IjdxmK7b48MJneN0
         kWcfNZ7R87AYM0ywgW266Y0Y8vBqW3lkIdhvcVf00mcUN7w8SGDfTi+H5ToxUu2HrsE0
         jYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MAIkHrjYDmctZsK2XMilntX5BLh0ntnlds10JM8Kqk=;
        b=l0UyCfhmxCtJFZ6lbUUv+8CcNHnuJxWFQgQwgTDwCtyR2+bScwOvcdop0VgMMySh2K
         nOVjoa4a5q7cWjhEN5QHswJkMi+myfGOSH7WHTRqA2FPCto7u+dC23KzAzfZO8nNztzC
         Nx7haW9J0FHUPPtNtRliikM/9x3XeMQwV1KluZVjTSH1ETjfKfn0AKp+jMXDYYxKRdzc
         IMjDLowTrqRZtmkZimZeBEWjsOSTBbjb57OCLTG3M7FAV36bhQpP7uKcHaTb9FBunkvC
         j6Pp2s3Alr30MfidCxmKgn+p8+VGeisWDTVFiWJoYP9pGwcsdC6sAMgviZ2YqJklyhg+
         fggA==
X-Gm-Message-State: AFqh2kom2iTPG1dj18FKqbeHfX62MpCLaAhwZPYUdHjHKwETy9hxRfxW
        eHdvmgUvaBwv0MXJEIx2Zf3Ix7nbgUngm02ACgMUug==
X-Google-Smtp-Source: AMrXdXseYk3L2GnPEh1gM0Jq/lHPuhOFw3F6VCswOOAoYtppdiOgDYLT1C2zOxnWhKhxZwwh/rCiy+ytiq1SWIr2yZY=
X-Received: by 2002:a0d:f282:0:b0:4ed:c96d:1b89 with SMTP id
 b124-20020a0df282000000b004edc96d1b89mr423452ywf.130.1673955627100; Tue, 17
 Jan 2023 03:40:27 -0800 (PST)
MIME-Version: 1.0
References: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com> <20230117094425.19004-4-Delphine_CC_Chiu@Wiwynn.com>
In-Reply-To: <20230117094425.19004-4-Delphine_CC_Chiu@Wiwynn.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Jan 2023 12:40:14 +0100
Message-ID: <CACRpkdY2ohNNJnnFUZscVg1ETEZBOCby7p-B-uCrrGwvLcQZ7Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] misc: Add meta cld driver
To:     Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc:     patrick@stwcx.xyz, Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        garnermic@fb.com, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Delphine,

thanks for your patch!

On Tue, Jan 17, 2023 at 10:46 AM Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:

> Add support for meta control-logic-device driver. The CLD manages the
> server system power squence and other state such as host-power-state,
> uart-selection and presense-slots. The baseboard management controller
> (BMC) can access the CLD through I2C.
>
> The version 1 of CLD driver is supported. The registers number, name
> and mode of CLD can be defined in dts file for version 1. The driver
> exports the filesystem following the dts setting.
>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> Tested-by: Bonnie Lo <Bonnie_Lo@Wiwynn.com>

Why should this driver be in drivers/misc and not drivers/mfd?
MFS has support code for spawning child devices for the LED
you are also creating for example, so please use that.

> +#include <linux/sysfs.h>
(...)
> +#include <linux/kthread.h>
(...)

> +static ssize_t cld_register_read(struct file *flip, struct kobject *kobj,
> +                                struct bin_attribute *attr, char *buf,
> +                                loff_t pos, size_t count)
> +{
(...)
> +       snprintf(buf, sizeof(value), "%d\n", value);
(...)
> +static ssize_t cld_register_write(struct file *flip, struct kobject *kobj,
> +                                 struct bin_attribute *attr, char *buf,
> +                                 loff_t pos, size_t count)
> +{
> +       ret = kstrtoul(buf, 0, &val);
(...)

Writing and reading some random regmap registers is something
that the regmap debugfs already can do.

> +static int cld_bin_register(struct cld_register_info info,
> +                           struct cld_client *cld)
> +{

And this is for reading and writing binary blobs.

It looks like something that should be using the firmware
API.

If the purpose of the driver is to open a hole from userspace
down to the hardware, as Greg says why not just use
userspace I2C then?

It seems a bit dangerous to relay whatever the ASIC is doing
to userspace though.

Are you sure you can't use any of the existing kernel functionality
for doing what these userspace "hole" is doing?

There is drivers/power etc for power control and I bet it can
be extended if need be.

Yours,
Linus Walleij
