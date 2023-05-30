Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D72E7716DEB
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 21:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbjE3Trx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 May 2023 15:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233236AbjE3Trw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 15:47:52 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A423F129;
        Tue, 30 May 2023 12:47:39 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-626149fbc8eso33754066d6.3;
        Tue, 30 May 2023 12:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685476059; x=1688068059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6Iuam2b262mdUMhR9+h2TigfoZPMkHnpApBozTQVKU=;
        b=esItVw904EenPq9DgcCQIprUq2dTb5AfCxlpBnwtRk0J7HpSUFg9gNi5PTEVmdQ42M
         QCfenXlbMeCkSljtYni8ZRMLG5lraK8Hdu1WLooZNEMH2yxqxhkyPO/SOLklGK1yjJxO
         mKWV7/zgS8V2TCgHy7OvveKGD/WF9d+11VvN/NYrn+zdtBG2fS4FoPUdQVYAfXUOzDeS
         XlBw2h6vJZC/g+eZKew7Ze9YQgiAksIeWBqNgfRqxHVVhkfwNi1P6FSYbtL/hfQFba9W
         yM5w8YCV9u1bLknNsCHTt3nEqSMnuiWtjaNO/8Vunq7xy1VK8v6FyHPbRNOzun1bV4z0
         VCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685476059; x=1688068059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6Iuam2b262mdUMhR9+h2TigfoZPMkHnpApBozTQVKU=;
        b=FTiBZLDcPD+BiCm0LQWljIkuchzV+uA1stnhGeWMuVYAFodJbYu5ENeVFUpbV8sw3Y
         y/ecM/MGQSj6xVftC0LP2rf346N+KvLHBmpAWuDmVycLoTjDT5Exn9iIYGzsotHPF0rp
         /NRnG3ekaftsr32ilw6xvXxz3wQJ+aBicyspAzN/5m6Q2fY196cGNKgE49hXWypsnt4f
         E6yF3/m3Ge+rtWJvMrlr5aFwFtYg3Dse4V3R+YF2Am2lOioTS/cZr+Vp+NZFC0ZvbWL2
         E8xjjxVC9UHS7MiONzS8UULEw3pffUs/85Ww6fra9U6aIJoNp7v0UArhWQ2l7nQ4hoVk
         iU5g==
X-Gm-Message-State: AC+VfDx6UOxFz3hVDh3yXhoQ9sVkbbxB8xPXmqf+LcyApZxXWvKvM1i9
        n9COljzXNDLamHFDlpkDGpRlQCTQa6OyE9PEcoQ=
X-Google-Smtp-Source: ACHHUZ4Mw0mPx7kfh6MO4xMrMR4odRyRQtigVoXP/frYsX72F9x7qlDxktvg7FOxpgbKcX7oT052wSLvB9OeDm4LdeY=
X-Received: by 2002:ad4:5be9:0:b0:621:3b88:7af2 with SMTP id
 k9-20020ad45be9000000b006213b887af2mr3070128qvc.52.1685476058714; Tue, 30 May
 2023 12:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230530145601.2592-1-Jonathan.Cameron@huawei.com> <20230530145601.2592-4-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230530145601.2592-4-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 May 2023 22:47:02 +0300
Message-ID: <CAHp75Vet3kv1N67R51oC9sfhZuQdav=v34a+qL6jfn8ynkk1RQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/6] i2c: aspeed: Don't report error when optional
 dt bus-frequency not supplied
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

On Tue, May 30, 2023 at 5:57=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> The bindings have this property as optional with a default of 100kHz.
> As such the driver should not be printing an error message if it is not
> supplied.

Right
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> v2: New patch after Andy raised some questions about this property
>     and I read the binding doc.
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index 21a2f139f445..4363bfe06f9b 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -1003,13 +1003,9 @@ static int aspeed_i2c_probe_bus(struct platform_de=
vice *pdev)
>         }
>         reset_control_deassert(bus->rst);
>
> -       ret =3D of_property_read_u32(pdev->dev.of_node,
> -                                  "bus-frequency", &bus->bus_frequency);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev,
> -                       "Could not read bus-frequency property\n");
> -               bus->bus_frequency =3D I2C_MAX_STANDARD_MODE_FREQ;
> -       }
> +       bus->bus_frequency =3D I2C_MAX_STANDARD_MODE_FREQ;
> +       of_property_read_u32(pdev->dev.of_node,
> +                            "bus-frequency", &bus->bus_frequency);
>
>         match =3D of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_nod=
e);
>         if (!match)
> --
> 2.39.2
>


--=20
With Best Regards,
Andy Shevchenko
