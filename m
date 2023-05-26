Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB83B712DCA
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 21:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236628AbjEZToZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 15:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbjEZToX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 15:44:23 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4516BD;
        Fri, 26 May 2023 12:44:22 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-75b076babc3so76298885a.3;
        Fri, 26 May 2023 12:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685130262; x=1687722262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfNLNTpmaXslWadDEZ7wQJQB6lSbfqDgJMJHU7b+JOc=;
        b=XfKcfVFUG8ql8usk72UncrPw3a0E7ubvh9HSFlE1XRnAt4KPI63d2BNCHeLkR82EJ7
         nNbs74oU8tE0UZCNOaU62RLrxt10TJ1/eO72CFqvR4BAW52iUQrI2oi/gQhmYRJnvsDX
         pXuVSuunMo3p/+EcnQrijAQIlTQkn9Z6BhjanBnqWER9jJf6wEyc9brLnS2Hu7LP6fQ4
         UWhTwC0LbXql/ZLiygrGtFY2+gCQ7doLPiZSBt4hm9r4RMZdot33qzdMAoXfouTtXnxV
         cnAvQfxxIVzR/UJY7AXiPSGEuycNjWuzm0u/VdIEzlHKfK+3HNItX4u3pdSwr0XvEWYn
         5rXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685130262; x=1687722262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfNLNTpmaXslWadDEZ7wQJQB6lSbfqDgJMJHU7b+JOc=;
        b=EDhTmL5plqRkxoS4Ysv+zvVOCbLigWAT6vffGX3okrIxu95kJZeZV9M1BuTsNGCdaF
         lzeI5FdW23JPoGN+ctOeT7RQHX8LECiVXiG2q/z60d0Hg2sdsfzYkeS7JtloQ9EiLabi
         /bX1/Y6hNg0MLltK1wIbnxgh8dlrKqUt2qZmlAP4uKVv8bZ6APeERT7XZWaLr1AedfhE
         mj8uk6U2DtnWYU1LFrD6FlRy5SZFyv9uowVFkEas66XbAmgip45IvTQsFonMPjQNFXan
         5CN8ZnD3gmqGf9F418XK3jlynZRJomiS/T/hr1fbJFV79XnCH4fLWgNEQ+He2S/3jSIl
         FCqQ==
X-Gm-Message-State: AC+VfDz7N19xyAdEF6DWDrcOHtRWrDYoyEofWbTdysTGKX0hsdlroKHp
        wB9ektJug6ZA1Ws3d4LywyBYdNzi3HERPzKaRBU=
X-Google-Smtp-Source: ACHHUZ6ZEcPFd97gH97yiv6TcVcYAm0nDF45Vtg9uJsoHjKrP3lFJbewpSlGDQTslUSPDWj9D5OMlqFOTMCejch+IXc=
X-Received: by 2002:ad4:5aa2:0:b0:625:76bb:b25e with SMTP id
 u2-20020ad45aa2000000b0062576bbb25emr3549508qvg.20.1685130261616; Fri, 26 May
 2023 12:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230525152203.32190-1-Jonathan.Cameron@huawei.com> <20230525152203.32190-2-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230525152203.32190-2-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 May 2023 22:43:45 +0300
Message-ID: <CAHp75VfUeGsOJP=oRw9HeA-LtBXvDwt=S7GUbAa2L4FfLfm3tQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] i2c: acpi: set slave mode flag
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

On Thu, May 25, 2023 at 6:22=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> If the GenericSerialBusConnection includes the General Flag
> for slave mode set it during parsing.

Since it's obvious that you are using the existing ACPI specification
bits, it's a nice patch!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Nevertheless the remark is that most likely this feature was never
tested on the ACPI implementations other than ACPICA (evidently by
you). Would it be interesting to know Microsoft's point of view on
this.

> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/i2c/i2c-core-acpi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index d6037a328669..7dda5eab9645 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -125,6 +125,9 @@ static int i2c_acpi_fill_info(struct acpi_resource *a=
res, void *data)
>         if (sb->access_mode =3D=3D ACPI_I2C_10BIT_MODE)
>                 info->flags |=3D I2C_CLIENT_TEN;
>
> +       if (sb->slave_mode)
> +               info->flags |=3D I2C_CLIENT_SLAVE;
> +
>         return 1;
>  }
>
> --
> 2.39.2
>


--=20
With Best Regards,
Andy Shevchenko
