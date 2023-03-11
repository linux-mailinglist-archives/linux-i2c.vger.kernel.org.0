Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD4746B5DEF
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Mar 2023 17:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjCKQfD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Mar 2023 11:35:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjCKQfC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Mar 2023 11:35:02 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69E56B970
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 08:35:01 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-540cb2fb5b9so55069067b3.3
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 08:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678552501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp9g8mvtcyPVfWU1c35OlobShpJvkPzR3H9bu0L9qxs=;
        b=pr0lMA2mOjrGpYKtk0QVF0tgFeqsi82LWxDkBLfPrvP6SzaFt8uRCUwVlEGVXt55Pr
         1LakAV5xZAA78BvaPzikSS3KxYsHahyc6ze80pSxeB0/399ArWjoxIhafnZA16imP8gz
         m6EpAPvbM6L06sONkdYvql4X4jRbWL9LYlwqEehMYRC5PR4Ezzc1Hd6E1UPOG0OlUZGX
         qjRs4XyDzd1PghVTUoOBMtSTg+n2zV8rTmOB8T0p8lcvYvlUsGTXXdfyY6R9E1SAjeNX
         Xu4Rg7B5iRhQ8orZmaA1RemdeqsQdHWR6fBji85TlIPP1bY1xc4LJJvcHnjA1VGPVK/1
         xHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678552501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wp9g8mvtcyPVfWU1c35OlobShpJvkPzR3H9bu0L9qxs=;
        b=MCfcwA3eG1UsT5cUfLGwGUEJDkpaeTd1sD4dbjeQ0KgFVbuO41JjhcaCvftBkUECHU
         blNyaqi8h/SiJVhU29oZhr9MnVoIHhuAr2SegdQOEFsXrIifMv+JvlfGfq6Xdt31/U+/
         OG4oFWMlD6pNZycP8nukSfzw/IapjoauRNE/NKjfsTWDaQ/AwzbtZSVzsVaq8RtPivIs
         fTlECw+tK8gQOGn9j1sbcxKTPk1tn2N134FwwDfnZL96YxbS/GKUhMXHpKcZ+95RaS24
         6ABBT6r2kc9Ub1bApk2MAOIo18ORHPgD9gGvOhjdaMSwaN3U77BP7gKsfHhNbyb3lcRW
         ii+A==
X-Gm-Message-State: AO0yUKW/4IZBsq99bImzYwlSXrmBzqB3lpywNm6pCVIWl2uC20Ix/v31
        +1NGj5SWp3anmeLY9SItITV3cucN3p478piHMyT6ag==
X-Google-Smtp-Source: AK7set8DBNZWeU/lrlXBCIe5G4NDpGfK/C+Ec/pjM7HxB3XDcENfIe9cQNMXEKvMvuR3hSrHQKhqUXC0oY/5I7TPspg=
X-Received: by 2002:a81:b142:0:b0:541:6975:2340 with SMTP id
 p63-20020a81b142000000b0054169752340mr1503406ywh.6.1678552500949; Sat, 11 Mar
 2023 08:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org> <20230311111658.251951-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111658.251951-3-krzysztof.kozlowski@linaro.org>
From:   Guenter Roeck <groeck@google.com>
Date:   Sat, 11 Mar 2023 08:34:49 -0800
Message-ID: <CABXOdTfGcByJaoXG5ifOdOCRWhemendQwG42RObZpc13v-BF6A@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: xiic: hide OF related data for COMPILE_TEST
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-i2c@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Mar 11, 2023 at 3:17=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
>
>   drivers/i2c/busses/i2c-xiic.c:1202:39: error: =E2=80=98xiic_2_00=E2=80=
=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/i2c/busses/i2c-xiic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.=
c
> index dbb792fc197e..806b447055fb 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1199,11 +1199,11 @@ static const struct i2c_adapter xiic_adapter =3D =
{
>         .algo =3D &xiic_algorithm,
>  };
>
> +#if defined(CONFIG_OF)
>  static const struct xiic_version_data xiic_2_00 =3D {
>         .quirks =3D DYNAMIC_MODE_READ_BROKEN_BIT,
>  };
>
> -#if defined(CONFIG_OF)
>  static const struct of_device_id xiic_of_match[] =3D {
>         { .compatible =3D "xlnx,xps-iic-2.00.a", .data =3D &xiic_2_00 },
>         { .compatible =3D "xlnx,axi-iic-2.1", },
> --
> 2.34.1
>
