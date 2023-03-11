Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B88536B5DA1
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Mar 2023 17:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbjCKQFf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Mar 2023 11:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjCKQFe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Mar 2023 11:05:34 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C735BB2
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 08:05:33 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-536bbef1c5eso158530747b3.9
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 08:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678550733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K54OHgmN8fzCR8nXYTAA10aWWoOdsi0wXP2XNLDX9vc=;
        b=h34LVM3UqmqUgwxpTXBJ/4CwnImSFFUMozqSylfyzNzIg8rEUFi/BCA/5SfPAhPXSK
         zVyg4dkH/np2nYMcxgt34KGbvvU69/pstFffIbpXSdjTuqr7mHRcatJl8wcG+ChH9+dA
         A5V6TTYkNmvyKGoj+SnE4wGxe2nzztZ+0cYdHj/So+YjENl4RPexyIQNksQlU5AqWmJ0
         wlqIaTJA+4pIrmihYkk+CWZVx2geZVmmUhYo5eOPcvWV+YR6xqVFHKFMSoocJOLnX6CR
         WwHQ52y8meSmlDKg6ykn0PXkeSs5FMhUOArFwyfH5cPvgTYIVyDHckPo68ZLvtp94miA
         EPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678550733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K54OHgmN8fzCR8nXYTAA10aWWoOdsi0wXP2XNLDX9vc=;
        b=R0GXI7rrC5x4hzXcpfOgw0YawxynNxCOxVaI+7JbGBlfsRXZlwgHu2cVz9dCOvssWB
         qi3H+LEp/gRMavUL+YVg1tHSf5xcrWfjlajUKDDPkHuphk+T3AcJzKopEo3+RweEyRkM
         n6c1+tQ+rmVrG1JXDVq/NufJ1AGKhsLGYIEWH9ydtGYIvexgkoQlr+vbOg/QZOvutcmH
         k2kiYCR3y9WIh8xJpil6Q4vvsgEtNzzkJqxKpqAGCv9iqnbtSFfvsVtpFyqf5c4ywwPB
         JU+35b6vnEAXOCB42be8urcNF9HY3wUt7Gj/DEMxImCk9nWOvCimXJeRBTd9fclFsoY7
         lV5g==
X-Gm-Message-State: AO0yUKXoLte5rIUOehC81fOuvU2p/mo85VEGuoFAEKFKwpmxmq+NZ6Ke
        xYLP0tZybfvs6Q6xAuWmPtZYH2/tlfjt5iQs6ZU7yw==
X-Google-Smtp-Source: AK7set9ic8NaN+kdm7NG2bG/3UThQQCFa78uyAWSZO+HX+TKv1qILKSdYFavvGkzUkH3l060xAj5J+UbUwRtinZAjtU=
X-Received: by 2002:a81:400c:0:b0:540:62be:42b with SMTP id
 l12-20020a81400c000000b0054062be042bmr2285636ywn.6.1678550732657; Sat, 11 Mar
 2023 08:05:32 -0800 (PST)
MIME-Version: 1.0
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org> <20230311111658.251951-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111658.251951-2-krzysztof.kozlowski@linaro.org>
From:   Guenter Roeck <groeck@google.com>
Date:   Sat, 11 Mar 2023 08:05:21 -0800
Message-ID: <CABXOdTePJ_gcBYcJ7fE2pX5E71oBmq41KzxiMmVJ_GcDRi7MGw@mail.gmail.com>
Subject: Re: [PATCH 2/5] i2c: owl: drop of_match_ptr for ID table
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
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
>
>   drivers/i2c/busses/i2c-owl.c:510:34: error: =E2=80=98owl_i2c_of_match=
=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/i2c/busses/i2c-owl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> index 98882fe4e965..99ddd8894964 100644
> --- a/drivers/i2c/busses/i2c-owl.c
> +++ b/drivers/i2c/busses/i2c-owl.c
> @@ -519,7 +519,7 @@ static struct platform_driver owl_i2c_driver =3D {
>         .probe          =3D owl_i2c_probe,
>         .driver         =3D {
>                 .name   =3D "owl-i2c",
> -               .of_match_table =3D of_match_ptr(owl_i2c_of_match),
> +               .of_match_table =3D owl_i2c_of_match,
>                 .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>         },
>  };
> --
> 2.34.1
>
