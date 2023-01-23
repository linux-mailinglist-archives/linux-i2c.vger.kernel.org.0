Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55ED56774C2
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jan 2023 06:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjAWFMC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Jan 2023 00:12:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbjAWFMB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Jan 2023 00:12:01 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD6A17CFA;
        Sun, 22 Jan 2023 21:11:59 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id y19so13244063edc.2;
        Sun, 22 Jan 2023 21:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sWioUiHkjNJu+qFD0c7stZaNR29l77ssapWjZeRh5zw=;
        b=L+Abc93j8hf8PGkpz2K1amYZkyIZ0U8J2kqQpf9Jle5sLJzmqYDLWihTwnQ+qAtY3e
         LdQxfusjChLBsrBeTFLG3xEWt7QEIn6Y/SUhhnkTUWtpy6ntmaeo9zEhr97i4E4fuEdm
         RUouQGeLiyTCbHjs+HJ8kcpLsOOldAmgf41sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWioUiHkjNJu+qFD0c7stZaNR29l77ssapWjZeRh5zw=;
        b=qOpUwr4uLJEWzGoaHZZ7xcTXKz2fIaWPlZ5VWYNbr9yyWElAWAtmLGxntQrixUslZ0
         /qylV0GqkIXjx5vtz5xsPrCr9jBEAoUCiNQGsb/a0FkwZRCCDEHK7n5aeWMs+H2MrT47
         Bd5Tv/p+61C2/rneDrwbGFlUbvpl3oue38n7D18DrRaKdMXgebxkGmov5wLAz5Oi2Cz8
         wVgwByzxUktCb1FiY/vPVX/0KGTJtK532doHzBgJWKIHHi/gys5n7/cA/Fk1eDi96RPY
         0Z3NXArVorNydBNjZdNOTp9z9GMjX4BYBxGKVnxrguPTP1rkGrrs1Vjt7tbQiScBegPz
         GJxg==
X-Gm-Message-State: AFqh2kqUjdI+02qwDMDc7sFx6/t7Ak4TIqrCKvzCrVYN008FO2si1I4t
        X0gKQI0Yh6zcNyQ7vcsDsqISpzecet4Nt8WVtlk=
X-Google-Smtp-Source: AMrXdXsPVC66oPNni93hPdj3sCljs/LtZOEps1r4t9jmIAGlnws/huj/ohwTtulkMAqHa1SeXH3p2vbViEYi1hHQSh8=
X-Received: by 2002:a05:6402:524f:b0:497:233d:3eee with SMTP id
 t15-20020a056402524f00b00497233d3eeemr3118354edd.92.1674450717581; Sun, 22
 Jan 2023 21:11:57 -0800 (PST)
MIME-Version: 1.0
References: <20230120190159.23459-1-nick.hawkins@hpe.com> <20230120190159.23459-2-nick.hawkins@hpe.com>
In-Reply-To: <20230120190159.23459-2-nick.hawkins@hpe.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 23 Jan 2023 05:11:45 +0000
Message-ID: <CACPK8Xe46F4Rk1jkLzXdzHE8t_HePe83teTrwUoV4wMvOn4_CQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] i2c: hpe: Add GXP SoC I2C Controller
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 20 Jan 2023 at 19:04, <nick.hawkins@hpe.com> wrote:
>
> From: Nick Hawkins <nick.hawkins@hpe.com>

> +static int gxp_i2c_remove(struct platform_device *pdev)
> +{
> +       struct gxp_i2c_drvdata *drvdata = platform_get_drvdata(pdev);
> +
> +       disable_irq(drvdata->irq);

The i2c core calls disable_irq for us (see i2c_device_shutdown) so you
don't need that here.

In my review I wondered if you needed to do something like this:

+               regmap_update_bits(i2cg_map, GXP_I2CINTEN, 0x00000FFF, 0);

> +       i2c_del_adapter(&drvdata->adapter);
> +
> +       return 0;
> +}
> +
