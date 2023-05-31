Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D311E7188B6
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 19:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjEaRps (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 13:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjEaRpq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 13:45:46 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9A311D;
        Wed, 31 May 2023 10:45:45 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6260a2522d9so106326d6.3;
        Wed, 31 May 2023 10:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685555145; x=1688147145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgdrMHRhBrj2w4gP3hdil2jrvh2YEv+fg9Bd69AbBr8=;
        b=sq61hvZD7ONYPl668kNlgfz0nU3btZwfU/ppsIxRDfQ1NiiL6zcXYXmDYckR7bl4Z4
         +0V0Yjt/roQIX3g+c4PEKphlqw2U8X4rYinuFazTOer9srX1cFxYaxCM0cwOXFtj3UdO
         4hquCHvyKd9g3RpgNah9G7A/gUQG23WC7a8ZMYq9lR/NnhihxeblAg9s7l0id4DI1tkB
         //tRH85X/+SpF9UlTBH/IBsBCVZogS3ztAFM5hOS0VCQW2zLPE9dFzywE0ifkOw5L32v
         3hCSEJpDTfUZJ4zQthgS3C+W0n33uvSUrMVxhsAlSf7+8OmgpIXSJKjXQ6i1yeV0BglT
         6OMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685555145; x=1688147145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgdrMHRhBrj2w4gP3hdil2jrvh2YEv+fg9Bd69AbBr8=;
        b=F+Yts+XebqEMpK688hzPJ9siNRlrb0lyhoc7LrZoNZwvy4rBo3uNvl9BtPviMdLNqU
         PWQf36Dq29Bw3qrzudFHTszwIZ+9qlScIimvP89NmVxMylFBlIiJUZKZk/czuAZbBe12
         xYOxdjjwYrr/LvVbZcyzLtc2xW71kVwZ+Xnlu1ShvgGZyPX6dCgGUTdLSyZ+We2oMUuV
         XGegnp1knMOxGChNnY7QzpqDp3BIeljIjlSPQqQJ7eqUK9Mlwm/zFhKyrjYRZsuxN15W
         882YNn+2ZPcMu3sM6bN0tJxRamKOgbYH95eTf3AK9A56XNEn40InBpZMPxuotvkxPRng
         YAVQ==
X-Gm-Message-State: AC+VfDx7qgO3WnNFeHieCxcHqFS8ELZyudoO52X5aAjZCnMbdl5v829d
        /MLF5Qx5nd2NyvFyViBNX/+s0h6CDWT4R7wFqXc=
X-Google-Smtp-Source: ACHHUZ761XRvGAWhW/x9ZVHBTgQ/MTswm6CBNiBhJaYKf237FhzXJqSR/7jc9ituvdnRM92I1ej4quMmJ/+d2gxnDWI=
X-Received: by 2002:ad4:596f:0:b0:626:1db8:de49 with SMTP id
 eq15-20020ad4596f000000b006261db8de49mr5874702qvb.32.1685555144887; Wed, 31
 May 2023 10:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230531100600.13543-1-Jonathan.Cameron@huawei.com> <20230531100600.13543-6-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230531100600.13543-6-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 May 2023 20:45:08 +0300
Message-ID: <CAHp75Vd-4p=3QvCPpzUpZt_sAWfFS4r93aqDLAjHqZguhn3NSQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/7] i2c: aspeed: switch to generic fw properties.
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

On Wed, May 31, 2023 at 1:08=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Moving over to generic firmware properties allows this driver to
> get closer to working out of the box with both device tree and
> other firmware options, such as ACPI via PRP0001.
>
> Tested only via QEMU emulation.

...

>  static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>  {
> -       const struct of_device_id *match;

With

  struct device *dev =3D &pdev->dev;

...

> +       device_property_read_u32(&pdev->dev,
> +                                "bus-frequency", &bus->bus_frequency);

This can take one or both parameters on one line.

...

> +       bus->get_clk_reg_val =3D
> +               (aspeed_get_clk_reg_val_cb)device_get_match_data(&pdev->d=
ev);

This one as well I believe.

Also others, but it can be done in a separate patch.

--=20
With Best Regards,
Andy Shevchenko
