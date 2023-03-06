Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A49B6AB9D5
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 10:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjCFJ16 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Mar 2023 04:27:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjCFJ15 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Mar 2023 04:27:57 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B011FF4
        for <linux-i2c@vger.kernel.org>; Mon,  6 Mar 2023 01:27:55 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id o6so8456950vsq.10
        for <linux-i2c@vger.kernel.org>; Mon, 06 Mar 2023 01:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678094874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u23YGdtz08BtcxfyGtNAoD9JB3zMPixrGi2haHM+DPQ=;
        b=O9WxhgaLFAaJgKfc9TwZLUBn2suBND7ZVszQ62VdCM9WMop+yAYsY5z8TaX+OVPxK6
         9EnOBMOllcOfJsN+APm3f+fhNzBSuhBIRtUrRpllolb8tDi6N3cYdkVHn6nq6ya0X84X
         g3iAM76zr5Ehv+A9SLpCB+snOTrNs1dO84FUbc2BFyOL88PVHz9hk4imkd8LPRALga++
         zCswG3CH2xRnUq2Il5w6RtwFYBy/PsQzqUAViEcfAixTbfH+FmdmvxyEwVMoSwmrqTJt
         NHP8hPlsQAeWfiDeNeFZgd0HY3FxPZmQ18l5D+hxrABh7frT+dA4EUtVmYh08WJnaXRO
         oeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678094874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u23YGdtz08BtcxfyGtNAoD9JB3zMPixrGi2haHM+DPQ=;
        b=N9W+gcyzjq1Yx7J73sVOq2afijIa2DSN6kUGxRFN79AqjkyblMlnpB4tOj+tAEVyW4
         kFOU3441y+oYoaAw22NScyN66ue0XtO/7pyzKrRsl4GAAl3QmAxt9B+U1n7U9JkF+c1c
         gliqlKbFliOnl4mp083RefwRyB04uiYKN1DFKSUuXVxc+OMqSxXLrlvxG0WLPdl6h7vn
         /PxBXgdLwe/L5Y/ASoZX/oYxwEfZVS0vFm5wWgUEdw6kr3T7GgutzMbK4K7/iORkG0GN
         yAkiSSkqku+CYSTV7zvjPEWnO3F3DWMl+FKUHD9Tuc8b2wyeJ/P7a9H+4WizNuVu+r/b
         OILQ==
X-Gm-Message-State: AO0yUKV0b6EIXhsWn2J/ebrrOAjYZ3aHKTuk6iMjAkyTSuyQLYH5uUq1
        TnjyGqizzTOxuz0wiuBf2fZQk+2/LbRHZ0zgGi85cjuAos8Wscg0D/k=
X-Google-Smtp-Source: AK7set9nV4Thuk0m6NGIRlR+kPaMTUIh7loOPqYPe95SB7yEHfXOmLn+JdlcC2Vl0p4+97hrzlagMIdGIgtkhqHyjak=
X-Received: by 2002:a67:e089:0:b0:411:f6d4:1be9 with SMTP id
 f9-20020a67e089000000b00411f6d41be9mr6647774vsl.5.1678094874626; Mon, 06 Mar
 2023 01:27:54 -0800 (PST)
MIME-Version: 1.0
References: <20230306024523.248216-1-dzm91@hust.edu.cn>
In-Reply-To: <20230306024523.248216-1-dzm91@hust.edu.cn>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 10:27:43 +0100
Message-ID: <CAMRc=MdWn_XKZZp9cC056xi8O=ghrZnuX-GAWasWukzDjnM3ow@mail.gmail.com>
Subject: Re: [PATCH] drivers: i2c: remove dead code in davinci_i2c_probe
To:     Dongliang Mu <dzm91@hust.edu.cn>
Cc:     Sekhar Nori <nsekhar@ti.com>, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 6, 2023 at 3:48=E2=80=AFAM Dongliang Mu <dzm91@hust.edu.cn> wro=
te:
>
> From the comment of platform_get_irq, it only returns non-zero IRQ
> number and negative error number, other than zero.
>
> Fix this by removing the if condition.
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>  drivers/i2c/busses/i2c-davinci.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-da=
vinci.c
> index c836cf884185..9750310f2c96 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -764,11 +764,8 @@ static int davinci_i2c_probe(struct platform_device =
*pdev)
>         int r, irq;
>
>         irq =3D platform_get_irq(pdev, 0);
> -       if (irq <=3D 0) {
> -               if (!irq)
> -                       irq =3D -ENXIO;
> +       if (irq < 0)
>                 return dev_err_probe(&pdev->dev, irq, "can't get irq reso=
urce\n");
> -       }
>
>         dev =3D devm_kzalloc(&pdev->dev, sizeof(struct davinci_i2c_dev),
>                         GFP_KERNEL);
> --
> 2.39.2
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
