Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3ED712EC4
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 23:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbjEZVLs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 17:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjEZVLr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 17:11:47 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D8ED9;
        Fri, 26 May 2023 14:11:45 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6260a9ef126so4630846d6.2;
        Fri, 26 May 2023 14:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685135505; x=1687727505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OWiPUbvdlGlxJq0LzPwU4W/J5rZSuUmTIx0Eo1/JlA=;
        b=s0PBcfGKYRNf9edWrB9UCE+XWRrpv/P4fkp9Day018+fFT8rmCfh6X7+zFTAI7NSxo
         pojM5hn1yO0WObY+OTiV59xNxKrFjnonGfS6j2QjZhp+xtpodI+qIEZvDS6J35dgpoXv
         xx7OaVWnMMWcmG102z0MBksD/OnIiUhpRgIWO8hzdHTNht33rtA9CUylgMiddHgIe3Am
         hOFfQ7l1JknHvyYLmN/lBYeht5KtTHolwHIkqu62zu42Kdc1RPTJDsCPJZNtVMe94enC
         eO6EtKmdt+7/rexgkse8sMr0J46zAfwDWxImN4W8nzu+UVTtW7VejXERvtETHeyxYOi9
         ubVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685135505; x=1687727505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OWiPUbvdlGlxJq0LzPwU4W/J5rZSuUmTIx0Eo1/JlA=;
        b=RPL9sbCdPO13L7wspLAkK3J3oHNNggARhyLAWNWqt3wWasuk1ED0bvzhQNii9P+7mS
         6nimsnLGB90DeXapaUSKGgmyHunSeiOY1szZTzZQyLCTHh0sHZ8N8/1S9ZUv0/00iNec
         HlpNt2OFTEuAP/IK4sTpTNPgPvuNorDNFs5di3jmukBchgpbOVtzUx9y3hsgizMDea2X
         s1YOay9fI+U0HsqEqgwVkRKKzHn5O3reSaD0OydYKApw50FTqtkHZpOF9FawFfQar64O
         cMX9/Dfqijev15V3bXQq2jssn7mVRsSn8gbNwN/fJFMOYfFwuCRmfBt12TvF4NNxXo/e
         FMJQ==
X-Gm-Message-State: AC+VfDxtaWUO+UjTXdpaKviLv78LTa/K9VakWOCd/IbrrVD2UkpVxWay
        edfL9t28olqaBbvi22N8wweUGVhF6lP5dE4yw2E=
X-Google-Smtp-Source: ACHHUZ4AdGD+kqyhpYO/r0ddFQvT46EVI64rLJn7RILdwH3TgG/f39FVuYWfnjjmkkev9+wWUzvQUPRauRuWLQpjDek=
X-Received: by 2002:a05:6214:1d2d:b0:626:a61:5b59 with SMTP id
 f13-20020a0562141d2d00b006260a615b59mr3175477qvd.16.1685135505038; Fri, 26
 May 2023 14:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230525152203.32190-1-Jonathan.Cameron@huawei.com> <20230525152203.32190-4-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230525152203.32190-4-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 27 May 2023 00:11:09 +0300
Message-ID: <CAHp75Vd3ARzzWjWV=cRRghHKXMFWkrRXBa2ssCGRCZAqDEAjAA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/6] i2c: aspeed: switch to generic fw properties.
To:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Niyas Sait <niyas.sait@linaro.org>,
        Klaus Jensen <its@irrelevant.dk>,
        Andy Shevchenko <andy@kernel.org>, linux-acpi@vger.kernel.org,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Shesha Bhushan Sreenivasamurthy <sheshas@marvell.com>,
        linux-cxl@vger.kernel.org, linuxarm@huawei.com,
        "Viacheslav A . Dubeyko" <viacheslav.dubeyko@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 25, 2023 at 6:23=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Not tested on device tree but works nicely for ACPI :)

Needs a better commit message obviously :-)

...

> -       ret =3D of_property_read_u32(pdev->dev.of_node,
> +       ret =3D device_property_read_u32(&pdev->dev,
>                                    "bus-frequency", &bus->bus_frequency);

Oh, please avoid double effort, i.e. go further and use I=C2=B2C core APIs
for the timings. Oh, wait, do they use non-standard property?!

...

> +       bus->get_clk_reg_val =3D (u32 (*)(struct device *, u32))
> +               device_get_match_data(&pdev->dev);

Personally I prefer using pointers in driver_data so we can avoid
ambiguity for the 0/NULL value returned by this call. But if 0 value
is considered invalid here, it's probably fine.

> +       if (!bus->get_clk_reg_val)
>                 bus->get_clk_reg_val =3D aspeed_i2c_24xx_get_clk_reg_val;
> -       else
> -               bus->get_clk_reg_val =3D (u32 (*)(struct device *, u32))
> -                               match->data;


--=20
With Best Regards,
Andy Shevchenko
