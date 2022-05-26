Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C5E534F74
	for <lists+linux-i2c@lfdr.de>; Thu, 26 May 2022 14:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236488AbiEZMlR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 May 2022 08:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347302AbiEZMlD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 May 2022 08:41:03 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395C29D4CF
        for <linux-i2c@vger.kernel.org>; Thu, 26 May 2022 05:41:00 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id o9-20020a17090a0a0900b001df3fc52ea7so4324561pjo.3
        for <linux-i2c@vger.kernel.org>; Thu, 26 May 2022 05:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1Rj1FYBiOvZLhBZCkRxGB9isSInLDH4Eii5EQ0dZppM=;
        b=YZPVPzqOw96zZveL7AOUNsY1sG+cTXdDluJDV13rwdILIi9W5IIMMZQ4JEwh8Upqj6
         4MmHtKVZkYVuvTh/lAd+eybNMJnwgkn0zhvH+AV72IXN5agIMH/Gr46BxY34z4+LwPFU
         FMan1xtIpwAzS13DruwpmZn/JHzF4dEijaYzr1i0zVXYAoVXbLUrl5N1dmkUXvkqo5Bo
         zZNYfUIt8qoG3rh7HsSOZ87nIhABitYpatTFipEqtTljc5LWIhE6Um31wB2w/ElPeNVE
         WBxTP02t8a+JQEJ0fYxsIrVylMGX6AC3/RjaE0+0QFqIoIbJSB2G2ttgIUmGXplaNE5B
         74dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1Rj1FYBiOvZLhBZCkRxGB9isSInLDH4Eii5EQ0dZppM=;
        b=SLG6pI/gYaUc3VcZE0rFGJBKBqr/CGblkfSRiwWoqAbIBBx6CR+Ri2YEWWYNYjm7kX
         1gHqa05VesJFWI8jj7iIrTQW7YKfuxMgagLKKBB1obb4wUifMwbH/O+dzrjxw9coWxOO
         pdU7JoNb3eudqPHOFw/W76iu9v7uLaippvd7xfJdq3xCRKVKwwji8dL2dQ/LVbOWP01L
         a4uNhkIEHYOiWwA/480Tkzw+7pQU5lqOVP3hRo87WXfnAadUt551z32EPJFocZY5IctE
         wZnodEsHBZ7k9NAU0Xl5BqVF5TdQH2dtf06JD9iwO1WXTX2bifhFZNFeNL/mnb90d8UL
         GiGg==
X-Gm-Message-State: AOAM533rLH6HJuKoFkotqrIRzBjVvaOmhyqv2CwdCnygzQuuGWLhI16S
        xqtS7Wv6LCYRtqcFtKYmXANRGFdAGq14jnj/F+Qjkg==
X-Google-Smtp-Source: ABdhPJyGQgT/BgWH1jsAbLqPk5ImtjgKyHKNaAQiFZB75mBBs8krUR0vq3nyaEkmEgd+MbH8+MRQdqS81o5QPOt+zNY=
X-Received: by 2002:a17:90b:380f:b0:1e0:aa6:9e24 with SMTP id
 mq15-20020a17090b380f00b001e00aa69e24mr2459758pjb.232.1653568859590; Thu, 26
 May 2022 05:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220522162802.208275-1-luca@z3ntu.xyz> <20220522162802.208275-8-luca@z3ntu.xyz>
In-Reply-To: <20220522162802.208275-8-luca@z3ntu.xyz>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 May 2022 14:40:48 +0200
Message-ID: <CAG3jFytdtw-LBpkgWo2EC1a4rJy-n7WOeYWo3NCOv6-mVOJmAg@mail.gmail.com>
Subject: Re: [RFC PATCH 07/14] media: camss: csiphy: Add support for 8x74
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
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
> CSIPHY hardware modules in 8x74 and 8x16 are similar.
>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 75fcfc627400..a0122705a874 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -557,7 +557,8 @@ int msm_csiphy_subdev_init(struct camss *camss,
>         csiphy->id =3D id;
>         csiphy->cfg.combo_mode =3D 0;
>
> -       if (camss->version =3D=3D CAMSS_8x16) {
> +       if (camss->version =3D=3D CAMSS_8x16 ||
> +                  camss->version =3D=3D CAMSS_8x74) {

CHECK: Alignment should match open parenthesis
#27: FILE: drivers/media/platform/qcom/camss/camss-csiphy.c:561:
+    if (camss->version =3D=3D CAMSS_8x16 ||
+           camss->version =3D=3D CAMSS_8x74) {


>                 csiphy->ops =3D &csiphy_ops_2ph_1_0;
>                 csiphy->formats =3D csiphy_formats_8x16;
>                 csiphy->nformats =3D ARRAY_SIZE(csiphy_formats_8x16);
> @@ -582,6 +583,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
>                 return PTR_ERR(csiphy->base);
>
>         if (camss->version =3D=3D CAMSS_8x16 ||
> +           camss->version =3D=3D CAMSS_8x74 ||
>             camss->version =3D=3D CAMSS_8x96) {
>                 csiphy->base_clk_mux =3D
>                         devm_platform_ioremap_resource_byname(pdev, res->=
reg[1]);
> --
> 2.36.0
>

With that fixed:
Reviewed-by: Robert Foss <robert.foss@linaro.org>
