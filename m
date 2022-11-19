Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12968630CD3
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 08:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiKSHAs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 02:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiKSHAr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 02:00:47 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE35286FC1;
        Fri, 18 Nov 2022 23:00:46 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id jn7so4551764plb.13;
        Fri, 18 Nov 2022 23:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRAOmB00k/DF2MsO6e47n76D2kqQ2kdAKBcmpCqoE/A=;
        b=ItHJ0hF5INKVX1wbyfxzd6eZsrbkVtn9MdvDO00uLjHHAy6eHZVNpr8FqzhkewcCPI
         d59lwl5WJ4F9q4q7fGdgToswmbaX2E+ABxJtCCEqds4V3VnMSc61Q5OksLvl/fw2DGJ2
         d1+H1lOt9jtyRNKogekkcSUwximJrtllZyz0HDkUDKy3UteGz/pcxM8oUpQtUjaHyIfB
         oox18B6XDh9nnt6MTBcdErHzcvxDNFx7NFg9VVniHVLNLk73YN83fhzU04bbCVOR7sPL
         StDPaKoTA1RzsgD6aJ3xGsGFjwP9xIeuP2TUFdG5pmwW6F4fOScdlvUWh2l5anDJI9g5
         qNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRAOmB00k/DF2MsO6e47n76D2kqQ2kdAKBcmpCqoE/A=;
        b=8LhhTcHCBDDthCSUmfv+zes5QCzyvSU79fIYeL1zg7z6HXCLrnUpzFFJODW2ksnXzB
         GnaN6degAom7XCeqIRrZtV7fAc+cNtPasQtc66CIUWwoBJ8Cw58fI4OASh7eouojsvJU
         qC7oKoa7yfoJmc6K7W+LHUR175c/Sg31UuNBJKM5n8UhDQg7vMJycQ7mTjwjf2IwmTBZ
         J8CI8s1zEWw/CTKUOK1TPIufAgkfLHWG97A9C1EM4sPQVu2UeZ9ByzsZFVtulUlO8rGe
         7TaKfN7zoPQ/Fb9rBaGHAnrSNgpzgNbsU0wwCGpuUc1XO7/BcIchFyXqZId5rrH/7H5g
         5RIA==
X-Gm-Message-State: ANoB5pkQZq3D3zoxeAUzilfTpIf5D/fvHZsj4wbPAA2FsQRrXnx4n/aY
        kYFQQet2v4iNK7ynyVXp2nQRC9dqTbYhbw392lQ=
X-Google-Smtp-Source: AA0mqf74+P394tK/lKQ1jhKFS1h29vSidwP1M8qGvlToHowCnmZe/ElYjmabO9KLj99rcxucZs1/RdsKF5HX6Emgzlc=
X-Received: by 2002:a17:90a:fa46:b0:200:1df3:a7a9 with SMTP id
 dt6-20020a17090afa4600b002001df3a7a9mr16855744pjb.202.1668841246325; Fri, 18
 Nov 2022 23:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-359-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-359-uwe@kleine-koenig.org>
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
Date:   Sat, 19 Nov 2022 08:00:34 +0100
Message-ID: <CAGfqbt6HG88psov6CE2PqNn1YOdrc=TfYXHw8BgqrLbUc1MJRA@mail.gmail.com>
Subject: Re: [PATCH 358/606] media: i2c/ov6650: Convert to i2c's .probe_new()
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dnia pi=C4=85tek, 18 listopada 2022 23:41:32 CET Uwe Kleine-K=C3=B6nig pisz=
e:
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so i=
t
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

LGTM

Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>


> ---
>  drivers/media/i2c/ov6650.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index 18f041e985b7..4c0ea2ae671b 100644
> --- a/drivers/media/i2c/ov6650.c
> +++ b/drivers/media/i2c/ov6650.c
> @@ -1025,8 +1025,7 @@ static const struct v4l2_subdev_internal_ops ov6650=
_internal_ops =3D {
>  /*
>   * i2c_driver function
>   */
> -static int ov6650_probe(struct i2c_client *client,
> -                     const struct i2c_device_id *did)
> +static int ov6650_probe(struct i2c_client *client)
>  {
>       struct ov6650 *priv;
>       int ret;
> @@ -1114,7 +1113,7 @@ static struct i2c_driver ov6650_i2c_driver =3D {
>       .driver =3D {
>               .name =3D "ov6650",
>       },
> -     .probe    =3D ov6650_probe,
> +     .probe_new =3D ov6650_probe,
>       .remove   =3D ov6650_remove,
>       .id_table =3D ov6650_id,
>  };
>
