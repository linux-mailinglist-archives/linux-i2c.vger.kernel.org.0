Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF237188A7
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 19:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjEaRmE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 13:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbjEaRl7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 13:41:59 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F392126;
        Wed, 31 May 2023 10:41:47 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-75b0b2d0341so630207485a.3;
        Wed, 31 May 2023 10:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685554907; x=1688146907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFEbaRLOuKH45m1LdnRI2++6MRQ0qqCzEQLABracwpw=;
        b=b1Put0JPUZ59/6HrSHF2hjXLUr2Gew8+ePL2lAXIIJM0XVtrc4n21M1erbnasaguiv
         EF0521yFKyg9m9CQp6viH2ZCMw/dDN/r35w6gt+u8yQFSOOfLQ+Q+5HAngTOHYk8sU9Q
         gZ2vNAYhckqecQBy1svMzJFhIh6ZJqtQ9GT6k375U8und5dtf5dcqUx6S2LZKib09bAg
         bU1H5N9pgAhqPsSGly/USHjg6h2oxshWsJKzbM7y/Hm88kR3xpigZlrXkVhVShIlGAlU
         BjGG8Zsjv9tkRRuXYlgZCex8FZ919WD8U7ROMSWPiLJgBOiIDIZAzQD2iYfF7EWB6exQ
         26cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685554907; x=1688146907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFEbaRLOuKH45m1LdnRI2++6MRQ0qqCzEQLABracwpw=;
        b=aeDj0ew7inbHAV6tvnjjR67Tbbcl9oqslXhEaO/rwjVVBxUUsy9swu5JBd3AeVZOCP
         rvB0tqE+V5nfGEZl5JCBcrRj5p4EllEP9SM8XCHfMN9wpbIyEvGGgbiAiy/WkjXHZ+hv
         L7q1y/xqx1+yqFqSWpoNGxlYsJoJ58LHSREOnB9Dz5RYWs1DzXNP36OjaoXRiWNV88T/
         lBIdfZ/UZ0dF76QrO9yM07WAp07uEcyn1ZKA5aINUyXbNmC6GPX3wPRZpMCuSnzrGkWE
         RysEQwTMaLgHKR6iauWM58/pQbbjWUPPr887XUtC8PcZ1eao66UoXFmY19rlhGYxTvvb
         iv1Q==
X-Gm-Message-State: AC+VfDyuQbTXcigbmSQi0i9R0otCI+NEzSJZwnuEGAXwWA0SiD11MBfB
        +WyYv4q0J872qpQKp8DF3Ua8IV2EDvNznpogx7Q=
X-Google-Smtp-Source: ACHHUZ4fyKkFH6ppzSOivcIAqgw/Vi5LQOCYLq9j7pXN6GqTWnvXCjxVrfrPfq1Sm3EFdZi42TiszHpcsJFmgJiYnRU=
X-Received: by 2002:a05:6214:48a:b0:625:b1f3:69c8 with SMTP id
 pt10-20020a056214048a00b00625b1f369c8mr8784749qvb.49.1685554906436; Wed, 31
 May 2023 10:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230531100600.13543-1-Jonathan.Cameron@huawei.com> <20230531100600.13543-3-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230531100600.13543-3-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 May 2023 20:41:09 +0300
Message-ID: <CAHp75VdtPrjcJgo7=BYfCWqMpHgH7iThymtFd3_oSKkU8jk_7w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/7] i2c: aspeed: Use platform_get_irq() instead of opencoding
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

On Wed, May 31, 2023 at 1:07=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> A cleanup in its own right.
> This has the handy side effect of working for ACPI FW as well
> (unlike fwnode_irq_get() which works for ARM64 but not x86 ACPI)

Hadn't I provided a tag?
Anyway,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> ---
> v3: Fix it's -> its in description.
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index d3c99c5b3247..21a2f139f445 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -19,7 +19,6 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> -#include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> @@ -1043,7 +1042,10 @@ static int aspeed_i2c_probe_bus(struct platform_de=
vice *pdev)
>         if (ret < 0)
>                 return ret;
>
> -       irq =3D irq_of_parse_and_map(pdev->dev.of_node, 0);
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;
> +
>         ret =3D devm_request_irq(&pdev->dev, irq, aspeed_i2c_bus_irq,
>                                0, dev_name(&pdev->dev), bus);
>         if (ret < 0)
> --
> 2.39.2
>


--=20
With Best Regards,
Andy Shevchenko
