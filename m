Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99587534F7D
	for <lists+linux-i2c@lfdr.de>; Thu, 26 May 2022 14:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237470AbiEZMmx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 May 2022 08:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235409AbiEZMmw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 May 2022 08:42:52 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239B56E8ED
        for <linux-i2c@vger.kernel.org>; Thu, 26 May 2022 05:42:47 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id cs3-20020a17090af50300b001e0808b5838so1637728pjb.1
        for <linux-i2c@vger.kernel.org>; Thu, 26 May 2022 05:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jdjGxx7PRekSNzvSccskiFkZs4U5abVvScuD8Z3XzKg=;
        b=Iz1P49Jvu7F3411ROfQcozZqUkFOaQgRNHvjm19nwifaFwsMmfKP2J8QgLd+3E5r9I
         BTXK+F6GrjZgT+tSWho24f7d4O1cM1o3ssHia+5i9qgBOe9Q7jFWbXYPEQkPSYtyDIr+
         Skd1qV8Uj8D/9rHuZRyV1ZoseJIBLHItfpe5eykGXtxOzIaaJ/hKietgS2t3EQzR9Gl/
         DXwBWeqLOEtBS02ycWWJIUJqMGsneyRfT0x5rXJdN1NPKhUPQbtWZJyWN8vRACRZqMC0
         NZjXm769TCcyszRpSa0YRoET88SHeYC3SCdt9H25Ewj6QGZ8TVMqMa0ooXBU1vqckPKz
         YCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jdjGxx7PRekSNzvSccskiFkZs4U5abVvScuD8Z3XzKg=;
        b=gDmXJXVOw8b7u/mrsbw5QtVi/myxmM7X5LnQ82g2Jyw86VIIWfKYT02oME5arA0/LQ
         Yy2K6X2oP8salBnJPzonMybLw4dlcDHf5lICxLnN6ppU+dmqLAbm8GLcKKwE8S0ebRmd
         x01YVonep3PQYO2nXsib2K80lx8djGfou2WfgyIibqZaKkKW3J3kiDc49vn1sJImCUsO
         Bd1s1jo6fALYZJMwrtQ0WgA2ewM96cQa0NBaouv0DPCR9g8fq61GiEDwmAlvcE9osGlG
         vh0R7lBK1I3p5DMr7kTlujWDa6SkblJ645DVC8wiNLP/KKiPjjTuRKh4R/6ooTrIHwXQ
         GQ3w==
X-Gm-Message-State: AOAM531t7kEN4OUlUE7PcsUqEKm2oVGgp8KMMIEmrTLoGjWGpRyZDpZd
        8JdMXOaYlH521o974wuGvwAbyn6uA8AArgeCHlx1Tw==
X-Google-Smtp-Source: ABdhPJwSlTKFfEDVZSH4bg6IXzpCeeQ8TDu75ALcCSHTgNKCO3gjRaw+18HZchkUJ4JSXlp3cX5qFz11VXRag++xkQM=
X-Received: by 2002:a17:903:1cd:b0:163:6697:e6e with SMTP id
 e13-20020a17090301cd00b0016366970e6emr6141774plh.21.1653568966611; Thu, 26
 May 2022 05:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220522162802.208275-1-luca@z3ntu.xyz> <20220522162802.208275-9-luca@z3ntu.xyz>
In-Reply-To: <20220522162802.208275-9-luca@z3ntu.xyz>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 May 2022 14:42:35 +0200
Message-ID: <CAG3jFyuVG9H3P2yUEJRUo9c4xLzax1tTeJYLUpoPOwHdYZ-xNw@mail.gmail.com>
Subject: Re: [RFC PATCH 08/14] media: camss: Add 8x74 resources
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
> Add structs with 8x74 resources. The number of CSIPHY, CSID
> and VFE hardware modules is the same as 8x96 but the support
> is otherwise different.
>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 161 ++++++++++++++++++++++
>  1 file changed, 161 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 79ad82e233cb..5a69ce48c792 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -126,6 +126,154 @@ static const struct resources vfe_res_8x16[] =3D {
>         }
>  };
>
> +static const struct resources csiphy_res_8974[] =3D {
> +       /* CSIPHY0 */
> +       {
> +               .regulators =3D { NULL },
> +               .clock =3D { "top_ahb", "ispif_ahb", "csiphy0_timer" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 100000000, 200000000 } },
> +               .reg =3D { "csiphy0", "csiphy0_clk_mux" },
> +               .interrupt =3D { "csiphy0" }
> +       },
> +
> +       /* CSIPHY1 */
> +       {
> +               .regulators =3D { NULL },
> +               .clock =3D { "top_ahb", "ispif_ahb", "csiphy1_timer" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 100000000, 200000000 } },
> +               .reg =3D { "csiphy1", "csiphy1_clk_mux" },
> +               .interrupt =3D { "csiphy1" }
> +       },
> +
> +       /* CSIPHY2 */
> +       {
> +               .regulators =3D { NULL },
> +               .clock =3D { "top_ahb", "ispif_ahb", "csiphy2_timer" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 100000000, 200000000 } },
> +               .reg =3D { "csiphy2", "csiphy2_clk_mux" },
> +               .interrupt =3D { "csiphy2" }
> +       }
> +};
> +
> +static const struct resources csid_res_8974[] =3D {
> +       /* CSID0 */
> +       {
> +               .regulators =3D { "vdda" },
> +               .clock =3D { "top_ahb", "ispif_ahb", "csi0_ahb",
> +                          "csi0", "csi0_phy", "csi0_pix", "csi0_rdi" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 100000000, 200000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "csid0" },
> +               .interrupt =3D { "csid0" }
> +       },
> +
> +       /* CSID1 */
> +       {
> +               .regulators =3D { "vdda" },
> +               .clock =3D { "top_ahb", "ispif_ahb", "csi1_ahb",
> +                          "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 100000000, 200000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "csid1" },
> +               .interrupt =3D { "csid1" }
> +       },
> +
> +       /* CSID2 */
> +       {
> +               .regulators =3D { "vdda" },
> +               .clock =3D { "top_ahb", "ispif_ahb", "csi2_ahb",
> +                          "csi2", "csi2_phy", "csi2_pix", "csi2_rdi" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 100000000, 200000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "csid2" },
> +               .interrupt =3D { "csid2" }
> +       },
> +
> +       /* CSID3 */
> +       {
> +               .regulators =3D { "vdda" },
> +               .clock =3D { "top_ahb", "ispif_ahb", "csi3_ahb",
> +                          "csi3", "csi3_phy", "csi3_pix", "csi3_rdi" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 100000000, 200000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "csid3" },
> +               .interrupt =3D { "csid3" }
> +       }
> +};
> +
> +static const struct resources_ispif ispif_res_8974 =3D {
> +       /* ISPIF */
> +       .clock =3D { "top_ahb", "ispif_ahb",
> +                  "csi0", "csi0_pix", "csi0_rdi",
> +                  "csi1", "csi1_pix", "csi1_rdi",
> +                  "csi2", "csi2_pix", "csi2_rdi",
> +                  "csi3", "csi3_pix", "csi3_rdi" },
> +       .clock_for_reset =3D { "vfe0", "csi_vfe0",
> +                  "vfe1", "csi_vfe1" },
> +       .reg =3D { "ispif", "csi_clk_mux" },
> +       .interrupt =3D "ispif"
> +
> +};
> +
> +static const struct resources vfe_res_8974[] =3D {
> +       /* VFE0 */
> +       {
> +               .regulators =3D { NULL },
> +               .clock =3D { "top_ahb", "vfe0", "csi_vfe0",
> +                          "iface", "bus" },
> +               .clock_rate =3D { { 0 },
> +                               { 50000000, 80000000, 100000000, 16000000=
0,
> +                                 177780000, 200000000, 266670000, 320000=
000,
> +                                 400000000, 400000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "vfe0" },
> +               .interrupt =3D { "vfe0" }
> +       },
> +       /* VFE1 */
> +       {
> +               .regulators =3D { NULL },
> +               .clock =3D { "top_ahb", "vfe1", "csi_vfe1",
> +                          "iface", "bus" },
> +               .clock_rate =3D { { 0 },
> +                               { 50000000, 80000000, 100000000, 16000000=
0,
> +                                 177780000, 200000000, 266670000, 320000=
000,
> +                                 400000000, 400000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "vfe1" },
> +               .interrupt =3D { "vfe1" }
> +       }
> +};
> +
>  static const struct resources csiphy_res_8x96[] =3D {
>         /* CSIPHY0 */
>         {
> @@ -1132,6 +1280,11 @@ static int camss_init_subdevices(struct camss *cam=
ss)
>                 csid_res =3D csid_res_8x16;
>                 ispif_res =3D &ispif_res_8x16;
>                 vfe_res =3D vfe_res_8x16;
> +       } else if (camss->version =3D=3D CAMSS_8x74) {
> +               csiphy_res =3D csiphy_res_8974;
> +               csid_res =3D csid_res_8974;
> +               ispif_res =3D &ispif_res_8974;
> +               vfe_res =3D vfe_res_8974;
>         } else if (camss->version =3D=3D CAMSS_8x96) {
>                 csiphy_res =3D csiphy_res_8x96;
>                 csid_res =3D csid_res_8x96;
> @@ -1542,6 +1695,12 @@ static int camss_probe(struct platform_device *pde=
v)
>                 camss->csiphy_num =3D 2;
>                 camss->csid_num =3D 2;
>                 camss->vfe_num =3D 1;
> +       } else if (of_device_is_compatible(dev->of_node,
> +                                          "qcom,msm8974-camss")) {
> +               camss->version =3D CAMSS_8x74;
> +               camss->csiphy_num =3D 3;
> +               camss->csid_num =3D 4;
> +               camss->vfe_num =3D 2;
>         } else if (of_device_is_compatible(dev->of_node,
>                                            "qcom,msm8996-camss")) {
>                 camss->version =3D CAMSS_8x96;
> @@ -1586,6 +1745,7 @@ static int camss_probe(struct platform_device *pdev=
)
>         }
>
>         if (camss->version =3D=3D CAMSS_8x16 ||
> +           camss->version =3D=3D CAMSS_8x74 ||
>             camss->version =3D=3D CAMSS_8x96) {
>                 camss->ispif =3D devm_kcalloc(dev, 1, sizeof(*camss->ispi=
f), GFP_KERNEL);
>                 if (!camss->ispif) {
> @@ -1735,6 +1895,7 @@ static int camss_remove(struct platform_device *pde=
v)
>
>  static const struct of_device_id camss_dt_match[] =3D {
>         { .compatible =3D "qcom,msm8916-camss" },
> +       { .compatible =3D "qcom,msm8974-camss" },
>         { .compatible =3D "qcom,msm8996-camss" },
>         { .compatible =3D "qcom,sdm660-camss" },
>         { .compatible =3D "qcom,sdm845-camss" },
> --
> 2.36.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
