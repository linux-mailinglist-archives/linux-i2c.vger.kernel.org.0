Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB416A96E7
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 13:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjCCMAQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 07:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjCCMAP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 07:00:15 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C2018ABF
        for <linux-i2c@vger.kernel.org>; Fri,  3 Mar 2023 04:00:13 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id bg11so1577513oib.5
        for <linux-i2c@vger.kernel.org>; Fri, 03 Mar 2023 04:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1677844813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nL802DEo8Vlj8yoMgQ/ErBx26N3r9TcbStYj6srrkE=;
        b=PHWLqjRg0nhXfP4Er/6XPTd0g+OMA/yEQAfVHrl+Zb8ZDfBt3C+IBcHwjMwU33E2r2
         LbV5mufvs1vw1r/uNKTW3R+UqKbGXyKxySX3tt3sgaUW16pMbAKRawse60rz1dmcgypL
         zwTo1/PaWdvTe8m41aSW7fwzWSW6uU50WF/AJjkDr6EWCHITZSq+0KyX129vlq9aCFUr
         Zc9744UZFHDMaO7s51dRJ67BSeMEjTq6yIWh0FBZqB8/sS+z/4keFXjYFQfE1/Dn/w0E
         l0RsPH5eLSO0SvXfjiv++OixLtpAdHsFLxwByTs4Z4aKzMEHydVmr7qyLk9vEd5D5T3+
         k/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677844813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nL802DEo8Vlj8yoMgQ/ErBx26N3r9TcbStYj6srrkE=;
        b=ruFrOtq6YJNerEYdKbS/XKaXPMWgx9LWP4oeOm5DPQqgNeP/du9WLMhxSzM3ybngRL
         cNZH1WAdw6I51utpXVc2qHXFbHJVDeabi1CY0Mlg7Dwcv3CRsj0B37BwfmuFVK4lwgAt
         gqwz3SGvaH6GlupfeTRraQYLg7cTruHOV/xwIv2U4VGkc7FmAnAaFFzywF2mf2Afixze
         64Js4DGkjKVu7/u40iVHlmZO4gUzgacpkLsLOiQWfZeAoQnuz4jCixu2xcLP26LXgSuf
         tR9Tx7rqcr98Ca8kfYDHL9aedInpyMkRzgSr1oaCAoKQjkRdu/p9aUNOhTCccns3xSZr
         Fm5w==
X-Gm-Message-State: AO0yUKW82NYKk+y2DIqIzRlY3496hmvSYobS9TXm869WjmU/7UhwbyL8
        19Pp7+kFZ6X70WzZyMMkpo8S3JfAEheo8ERBmsX2ZulK+uEcow==
X-Google-Smtp-Source: AK7set9rSLagXYcQ1dDs85sy097wF1UMooi/Ls1MtAokFSFWKEklD/Q4NLf5UCk5w2ApF3WJypbs7252d4ofBUCofdE=
X-Received: by 2002:aca:230d:0:b0:383:d3ae:2ef4 with SMTP id
 e13-20020aca230d000000b00383d3ae2ef4mr431443oie.8.1677844813085; Fri, 03 Mar
 2023 04:00:13 -0800 (PST)
MIME-Version: 1.0
References: <20230302194235.1724-1-mario.limonciello@amd.com> <20230302194235.1724-9-mario.limonciello@amd.com>
In-Reply-To: <20230302194235.1724-9-mario.limonciello@amd.com>
From:   Grzegorz Bernacki <gjb@semihalf.com>
Date:   Fri, 3 Mar 2023 13:00:02 +0100
Message-ID: <CAA2Cew5YyufrBZqAA4A5R=1vf_dn=c3ftwziTjzFSm8S5LJZGg@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] i2c: designware: Add doorbell support for Skyrim
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Rijo-john.Thomas@amd.com, Thomas.Lendacky@amd.com,
        herbert@gondor.apana.org.au,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mario,

I am not sure if adding a new ACPI ID is a good idea. Actually we are
talking about the same devices. The only difference is in the
communication protocol between PSP and CPU. This could be easily
detected at runtime by checking cpu id. There is no need to introduce
a new id and create dependency on the FW version.

thanks,
greg

czw., 2 mar 2023 o 20:43 Mario Limonciello <mario.limonciello@amd.com>
napisa=C5=82(a):
>
> Skyrim doesn't use the platform feature mailbox for communication
> for I2C arbitration, it relies upon ringing a doorbell.
>
> Add a new ACPI ID to use for Skyrim and when that ID is detected
> use the doorbell instead.
>
> Link: https://lore.kernel.org/linux-i2c/20220916131854.687371-3-jsd@semih=
alf.com/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2:
>  * New patch
> Note: This ACPI ID hasn't currently been reserved, but as Skyrim runs cor=
eboot
> it should be easy enough to modify the BIOS and test it out.
> If this approach works and has general agreement it can be reserved.
> ---
>  drivers/i2c/busses/i2c-designware-amdpsp.c  | 29 ++++++++++++++-------
>  drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
>  2 files changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/bus=
ses/i2c-designware-amdpsp.c
> index 105584abcf8f..e1a4d3002c80 100644
> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -73,34 +73,44 @@ static int psp_send_check_i2c_req(struct psp_i2c_req =
*req)
>         return check_i2c_req_sts(req);
>  }
>
> -static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
> +static int psp_send_i2c_req_amdi0019(enum psp_i2c_req_type i2c_req_type)
>  {
>         struct psp_i2c_req *req;
> -       unsigned long start;
>         int status, ret;
>
>         /* Allocate command-response buffer */
>         req =3D kzalloc(sizeof(*req), GFP_KERNEL);
>         if (!req)
>                 return -ENOMEM;
> -
>         req->hdr.payload_size =3D sizeof(*req);
>         req->type =3D i2c_req_type;
> -
> -       start =3D jiffies;
>         ret =3D read_poll_timeout(psp_send_check_i2c_req, status,
>                                 (status !=3D -EBUSY),
>                                 PSP_I2C_REQ_RETRY_DELAY_US,
>                                 PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY=
_DELAY_US,
>                                 0, req);
> -       if (ret) {
> +       kfree(req);
> +
> +       if (ret)
>                 dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C=
 bus\n",
>                         (i2c_req_type =3D=3D PSP_I2C_REQ_ACQUIRE) ?
>                         "release" : "acquire");
> -               goto cleanup;
> -       }
>
> -       ret =3D status;
> +       return ret ? ret : status;
> +}
> +
> +static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
> +{
> +       const char *hid =3D acpi_device_hid(ACPI_COMPANION(psp_i2c_dev));
> +       unsigned long start =3D jiffies;
> +       int ret;
> +
> +       /* Use doorbell for Skyrim and mailbox for Cezanne */
> +       if (!strcmp(hid, "AMDI0020"))
> +               ret =3D psp_ring_platform_doorbell(i2c_req_type);
> +       else
> +               ret =3D psp_send_i2c_req_amdi0019(i2c_req_type);
> +
>         if (ret) {
>                 dev_err(psp_i2c_dev, "PSP communication error\n");
>                 goto cleanup;
> @@ -115,7 +125,6 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c=
_req_type)
>                 psp_i2c_mbox_fail =3D true;
>         }
>
> -       kfree(req);
>         return ret;
>  }
>
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/bu=
sses/i2c-designware-platdrv.c
> index 89ad88c54754..5ca71bda9ac2 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -51,6 +51,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] =
=3D {
>         { "AMD0010", ACCESS_INTR_MASK },
>         { "AMDI0010", ACCESS_INTR_MASK },
>         { "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
> +       { "AMDI0020", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
>         { "AMDI0510", 0 },
>         { "APMC0D0F", 0 },
>         { "HISI02A1", 0 },
> --
> 2.34.1
>
