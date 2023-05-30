Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81FAC716E13
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 21:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjE3Tvm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 May 2023 15:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbjE3Tvk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 15:51:40 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E6310D;
        Tue, 30 May 2023 12:51:39 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-62615694bb9so16415396d6.0;
        Tue, 30 May 2023 12:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685476298; x=1688068298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dg1R316DQtTQ+hZUY/dFh+6+GoPVV4Hxs4Uo4a0mNgA=;
        b=T5F4eM+cPjxi+xgjsrzc97J58tELtMqaM+d4vNzHxTHLyMwCVqHqVfGPUYtNXrPQxd
         ceu5oSZuwFknrR0ast2u8W0Uu9SQBO9ZLNbrHe1WsUu7B4z4bq1+C4dXEZdBOvpz74Fk
         rbzPhNk5iHJAxILnFhzaN9vbwvsvjlCoa5nXTqTOeF3RLOYp6xoM8Hhd7GM+3HKUQ9W7
         uT0VVnrd4aQisZTLTpsdVZZanTXrWDKQl+lLJQHAkp53+vzxJrttSnZP8NgLRrjuwOjc
         bS/VEyHGhB4BzihNUyEugCL9msKyD78iaNplWKp69MqtIjVT1MC8IxsvPuk6Cu1VfsV3
         FK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685476298; x=1688068298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dg1R316DQtTQ+hZUY/dFh+6+GoPVV4Hxs4Uo4a0mNgA=;
        b=IMfF5+frQqWwJ5Y4e5Yt4yD9gMDOFz/hpHRhw4IfOpkY1XHWeKkiHvhZvgXHKc+Lkz
         lRcg79iU9G+ROXQcSwKzvL3QcVCeLbLgvXGQ5DzDOgzTa0Nb1cSlzO2fqEGXndKBzvtJ
         dOGpR8DbwLmaAQbSfTaGvtqkMx2v4RlJfZ2iEsJn7lDDQbmq4ewY9dZKCWq+9tLGmA5Z
         Qy88dl0K/rPg2Z9h2hpHERnKqai0ZcU/LkzimimnZYYWMd+yxg1FRqCXw8S9khcWJ4H7
         UqQiYp3vf/WMNhi1F6S4v8Xz+Jx5BjyTHk4ibGj5dMKNvR7Jf4Hru6zOUPlTtDmOBOJM
         1vyA==
X-Gm-Message-State: AC+VfDzLQtxz2iKYwfw6Vo6rT05Cs4XoDME4VPwUpW4M0RxnZAJS6IX3
        q73o0WLnbz698RJgyhMDn0lo9v5br6vmpp5pS40=
X-Google-Smtp-Source: ACHHUZ4j4CImuQ/J5RAiTA30bK75M2iguljSLXFIeSUpIg9H9dHEScuu3KPqtDKf6KRLDA625Ij0q1Z5anRsUziXxYU=
X-Received: by 2002:a05:6214:1247:b0:623:6d96:c8ca with SMTP id
 r7-20020a056214124700b006236d96c8camr3483044qvv.33.1685476298004; Tue, 30 May
 2023 12:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230530145601.2592-1-Jonathan.Cameron@huawei.com> <20230530145601.2592-6-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230530145601.2592-6-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 May 2023 22:51:01 +0300
Message-ID: <CAHp75VeE6UXxmC-opesh8D4wj9J0N=SvtV3Z=m-icanO7TRK7Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/6] i2c: aspeed: Set the fwnode for the adap->dev
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

On Tue, May 30, 2023 at 5:58=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> This is needed for the bus matching used for ACPI based
> i2c client registration.

The right thing to do.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> v2: Drop the separate setting of the of_node. (Thanks Andy)
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index 353834d7ffd5..ae8e187f2233 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -1017,7 +1017,6 @@ static int aspeed_i2c_probe_bus(struct platform_dev=
ice *pdev)
>         bus->adap.retries =3D 0;
>         bus->adap.algo =3D &aspeed_i2c_algo;
>         bus->adap.dev.parent =3D &pdev->dev;
> -       bus->adap.dev.of_node =3D pdev->dev.of_node;
>         strscpy(bus->adap.name, pdev->name, sizeof(bus->adap.name));
>         i2c_set_adapdata(&bus->adap, bus);
>
> @@ -1043,6 +1042,8 @@ static int aspeed_i2c_probe_bus(struct platform_dev=
ice *pdev)
>         if (ret < 0)
>                 return ret;
>
> +       device_set_node(&bus->adap.dev, dev_fwnode(&pdev->dev));
> +
>         ret =3D i2c_add_adapter(&bus->adap);
>         if (ret < 0)
>                 return ret;
> --
> 2.39.2
>


--=20
With Best Regards,
Andy Shevchenko
