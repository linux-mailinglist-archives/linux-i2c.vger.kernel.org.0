Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 869026B5DF1
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Mar 2023 17:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbjCKQfp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Mar 2023 11:35:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjCKQfo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Mar 2023 11:35:44 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069CD29E3B
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 08:35:44 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-536c2a1cc07so159849247b3.5
        for <linux-i2c@vger.kernel.org>; Sat, 11 Mar 2023 08:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678552543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSYGBwvERR9paAWVm+BPfUaOdOyyaRsYjyfcyhXtVw0=;
        b=UAQ71mkDnVkAMX0dBUZr9na7yjE4UcUPxg0d4QW9+TED0PGTdhVGRYzEOewrz4OOEA
         VZW95uFOQsbTG7SCyL1y5/XjlKCkwxuoSglzm5bgqGtQdoAyBwCwhkFAK62n9uP4NUqX
         5NXsW75RXvaDplRaP73qW5BIVFkYFPl2iKS9Msg4T2Kc7E85yFAsDC/o9m8oRylQFtVT
         rieInkzI+bi92+xxSiHSVVDuTfY72Ir/LAqQza7lLPRG8X9YLCnpd98cj36uhSC5kBxV
         bRLb63mcK+uo33HUtFca6zrhBdTTSD+/EtDXha8sz5m999IdYsA9t7xvbr2OIXH3nmUe
         DQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678552543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSYGBwvERR9paAWVm+BPfUaOdOyyaRsYjyfcyhXtVw0=;
        b=mpQbl9zc8bf8oLd7gMxmNRHXx1KoLiLBfKF55+OxmjbW3MpSbad4BBPyQ0ujIeKK6V
         Oygo9eKRgkVZ67EGWoTF7oS8ghMCdHwAyFQYQ/IFU7TDNxwfpdVCL1EbrzKFvfewGSVS
         6sD+yUfIzQN36RHz1wltkCY/pQxdqP6r7hSzLg5TsBXH1eGiJcsPr2igZvD5plAtaCER
         ieRcCvlZMDz9Zxlv3WhAAdjVSt8iUkEVXNX4bhCuFuTHm1jcJxzaxXnFWGk7bQaakHkN
         mNXv9eJPWug7r50OquJxVR5QTDspwPodCmK3wxCnQU+LgN1fp/1Niy1rr3YYlK4mRfIR
         tjXA==
X-Gm-Message-State: AO0yUKUNFfngHjdWdv9ZZe16+RAz7tL+4hwAbVUYwxCWzAXXOvv9s2lW
        YjRtjDkL9f2gn1G+2lSZK+yAmn+2CoR6dHyrL1PM7A==
X-Google-Smtp-Source: AK7set93tV+avSHhtVAdwyX7DfN5gzCh81D4seJpwkCcmvQqrqKMSESRIYfCezkiV/oqBS7uIDZ168ZXua3DqwAa1MY=
X-Received: by 2002:a81:ac1a:0:b0:533:cf4e:9a80 with SMTP id
 k26-20020a81ac1a000000b00533cf4e9a80mr18506420ywh.6.1678552543118; Sat, 11
 Mar 2023 08:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org> <20230311111658.251951-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111658.251951-5-krzysztof.kozlowski@linaro.org>
From:   Guenter Roeck <groeck@google.com>
Date:   Sat, 11 Mar 2023 08:35:32 -0800
Message-ID: <CABXOdTdWkX9hpJtZmgMEBvT8XS5i3cTTF868RLx3Y9o52x6QAw@mail.gmail.com>
Subject: Re: [PATCH 5/5] i2c: synquacer: mark OF related data as maybe unused
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
>   drivers/i2c/busses/i2c-synquacer.c:632:34: error: =E2=80=98synquacer_i2=
c_dt_ids=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/i2c/busses/i2c-synquacer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-=
synquacer.c
> index e4026c5416b1..50d19cf99a03 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -629,7 +629,7 @@ static int synquacer_i2c_remove(struct platform_devic=
e *pdev)
>         return 0;
>  };
>
> -static const struct of_device_id synquacer_i2c_dt_ids[] =3D {
> +static const struct of_device_id synquacer_i2c_dt_ids[] __maybe_unused =
=3D {
>         { .compatible =3D "socionext,synquacer-i2c" },
>         { /* sentinel */ }
>  };
> --
> 2.34.1
>
