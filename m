Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD5854CF79
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jun 2022 19:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243374AbiFORMP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 13:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355712AbiFORMD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 13:12:03 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C8150450
        for <linux-i2c@vger.kernel.org>; Wed, 15 Jun 2022 10:12:01 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id z14so7803187pgh.0
        for <linux-i2c@vger.kernel.org>; Wed, 15 Jun 2022 10:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3AyomL7Oc+DdUYdK158JFYS4POGAertrwHcZhI495qU=;
        b=RaryPI0ZtjtKjxfcUL/BY2bKh6PbgJEUZfevFWvhuw0gKFSweI6+ekz1KnHX++ofzz
         5lS36xmH1bEd3gfPv1owuiy3SfJqg8r9ePZ/AEmWwzUJ3gDPdM/oI4moUoe7n98TlSOM
         FcPpuG17WcgLz5I1tQgFCLyMQr+2xpL93VFf7H6ynbM8R7uNMikDh4PyzBkvfbeJIXxD
         GNjSpPppaEGtvDyI1to4njrRQmdHLZXmWbFanQ+9r6KHFW/SDCPVLpVMGsAMEg2zy298
         beiA1ZrY5n2Njt7OABc/Eyo22CBSFtpDXcJ2a+dxKzEuWtwcsNc1p7htSXhJukYpcLYu
         VWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3AyomL7Oc+DdUYdK158JFYS4POGAertrwHcZhI495qU=;
        b=THfLfF40OKRI9yG2e592dwx5Kn18WmXaNJE0z83sksPRAnlknsUZx+oLrjEwSH26QT
         9v3kiJbVihIXJbCaVPnq+x9OW7/iCCv6SB8NvnGjK/ZPyfjdIXxK3w6eAdGtCS7Pbc1Y
         Ogo8W6bNYZI28rNJ5thj8BvogPXa6ldPFDSQvhap/MNOIb3UKQyG/flhKCzgWVjd6m14
         bG2ufapEtffPCiHSBVMzlwO9Dwoz1chI9cHyT3y0jd4Ym6jUGWzgnpcBJSuwTwpGm0kB
         YOaknanwXoaB5f7s4e62U7qJOe+/ZErTwp3EEzztYHCSmJ7flsDO0kIEzSXMleD9+QxY
         /qyw==
X-Gm-Message-State: AJIora/TYd7/8nlXXs00sq8Q2lNKtKfYroeQsibXqxb4HJDLjcNh4XP2
        AoJXI56Xfu6xm3ZMnUi0+VH4Jt5KIBoVBXAfuqYqwQ==
X-Google-Smtp-Source: AGRyM1uA1LIViXu2DRXGg9esMg5JyGVlSdhSVJDitquFoXIzMZ+OJ2WuNj0EVeUj2Boh9KSivtt8Vaspthfz2HrD6vM=
X-Received: by 2002:a62:7c14:0:b0:51b:9d03:a4c7 with SMTP id
 x20-20020a627c14000000b0051b9d03a4c7mr387767pfc.74.1655313121181; Wed, 15 Jun
 2022 10:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220522162802.208275-1-luca@z3ntu.xyz> <20220522162802.208275-11-luca@z3ntu.xyz>
In-Reply-To: <20220522162802.208275-11-luca@z3ntu.xyz>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 15 Jun 2022 19:11:25 +0200
Message-ID: <CAMZdPi82+xW2yoKQrg61Mj_-kLCBbp=VDQNDDccQpv5=i_V6Vw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/14] i2c: qcom-cci: add msm8974 compatible
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 22 May 2022 at 18:28, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> From: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
>
> MSM8974 CCI is the same as MSM8916 except it has two masters.
>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
> To note, the cci_v1_5_data variable name is just a bit arbitrary and
> isn't meant to reflect IP version "1.5". I'd be happy to change the
> variable name to something else.
>
>  drivers/i2c/busses/i2c-qcom-cci.c | 35 +++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 5c7cc862f08f..a68f17eb9dd0 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -725,6 +725,40 @@ static const struct cci_data cci_v1_data =3D {
>         },
>  };
>
> +static const struct cci_data cci_v1_5_data =3D {
> +       .num_masters =3D 2,
> +       .queue_size =3D { 64, 16 },
> +       .quirks =3D {
> +               .max_write_len =3D 10,
> +               .max_read_len =3D 12,
> +       },
> +       .cci_clk_rate =3D  19200000,
> +       .params[I2C_MODE_STANDARD] =3D {
> +               .thigh =3D 78,
> +               .tlow =3D 114,
> +               .tsu_sto =3D 28,
> +               .tsu_sta =3D 28,
> +               .thd_dat =3D 10,
> +               .thd_sta =3D 77,
> +               .tbuf =3D 118,
> +               .scl_stretch_en =3D 0,
> +               .trdhld =3D 6,
> +               .tsp =3D 1
> +       },
> +       .params[I2C_MODE_FAST] =3D {
> +               .thigh =3D 20,
> +               .tlow =3D 28,
> +               .tsu_sto =3D 21,
> +               .tsu_sta =3D 21,
> +               .thd_dat =3D 13,
> +               .thd_sta =3D 18,
> +               .tbuf =3D 32,
> +               .scl_stretch_en =3D 0,
> +               .trdhld =3D 6,
> +               .tsp =3D 3
> +       },
> +};
> +
>  static const struct cci_data cci_v2_data =3D {
>         .num_masters =3D 2,
>         .queue_size =3D { 64, 16 },
> @@ -773,6 +807,7 @@ static const struct cci_data cci_v2_data =3D {
>
>  static const struct of_device_id cci_dt_match[] =3D {
>         { .compatible =3D "qcom,msm8916-cci", .data =3D &cci_v1_data},
> +       { .compatible =3D "qcom,msm8974-cci", .data =3D &cci_v1_5_data},
>         { .compatible =3D "qcom,msm8996-cci", .data =3D &cci_v2_data},
>         { .compatible =3D "qcom,sdm845-cci", .data =3D &cci_v2_data},
>         { .compatible =3D "qcom,sm8250-cci", .data =3D &cci_v2_data},
> --
> 2.36.0
>
