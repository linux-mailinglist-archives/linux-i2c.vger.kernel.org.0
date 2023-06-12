Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98BEF72C579
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 15:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbjFLNGs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 09:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236140AbjFLNGh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 09:06:37 -0400
X-Greylist: delayed 470 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 12 Jun 2023 06:06:06 PDT
Received: from out-58.mta1.migadu.com (out-58.mta1.migadu.com [IPv6:2001:41d0:203:375::3a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E05F10E9
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jun 2023 06:06:06 -0700 (PDT)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
        s=key1; t=1686574695;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UwkijoWQ0udlefGoNxvUlEKEjhdGuK8Ewg/XFJdMteo=;
        b=vxAyCP0AITWCyku131v7zXVc7jCAOto7HdCroE3zLRkMjf6PRnw/ZdGndeZCl6fZsuyox9
        CXhucnlNCGh0/3QLmPXc4JMHd7J4GblnPGkwlMlZHqP9j9L1Drm+dTdE1W0uH5eKRaKnkP
        9Zbfb4Abfq/n4fALhiU9bsQf1dnAxff6XNIAG6gZcXiJF+/62bVLioFva/q+2wmje7J/Yq
        ZsOC1DseJLqC0aiX+zTafc3bWzjr78gXmUAs4yA8USLAwZ3hB8xVgSomKL2MloTajy6xUe
        cgmdVFXFjzSxXmOmEwUdfAbqDHpYEY3G2f6BxINFl2uNMe02ZjV9bIWV/vI2Rg==
Date:   Mon, 12 Jun 2023 12:58:11 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   alyssa@rosenzweig.io
Message-ID: <703264d7953baa9e542893fdca55a6cf@rosenzweig.io>
Subject: Re: [PATCH 10/15] i2c: busses: pasemi-platform: Use
 devm_clk_get_enabled()
To:     "Andi Shyti" <andi.shyti@kernel.org>,
        "Linux I2C" <linux-i2c@vger.kernel.org>
Cc:     "Michael Ellerman" <mpe@ellerman.id.au>,
        "Nicholas Piggin" <npiggin@gmail.com>,
        "Christophe Leroy" <christophe.leroy@csgroup.eu>,
        "Hector Martin" <marcan@marcan.st>,
        "Sven Peter" <sven@svenpeter.dev>
In-Reply-To: <20230611225702.891856-11-andi.shyti@kernel.org>
References: <20230611225702.891856-11-andi.shyti@kernel.org>
 <20230611225702.891856-1-andi.shyti@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>=0A=0AJune 11, 2023 =
6:56 PM, "Andi Shyti" <andi.shyti@kernel.org> wrote:=0A=0A> Replace the p=
air of functions, devm_clk_get() and=0A> clk_prepare_enable(), with a sin=
gle function=0A> devm_clk_get_enabled().=0A> =0A> Signed-off-by: Andi Shy=
ti <andi.shyti@kernel.org>=0A> Cc: Michael Ellerman <mpe@ellerman.id.au>=
=0A> Cc: Nicholas Piggin <npiggin@gmail.com>=0A> Cc: Christophe Leroy <ch=
ristophe.leroy@csgroup.eu>=0A> Cc: Hector Martin <marcan@marcan.st>=0A> C=
c: Sven Peter <sven@svenpeter.dev>=0A> Cc: Alyssa Rosenzweig <alyssa@rose=
nzweig.io>=0A> ---=0A> drivers/i2c/busses/i2c-pasemi-platform.c | 22 ++++=
------------------=0A> 1 file changed, 4 insertions(+), 18 deletions(-)=
=0A> =0A> diff --git a/drivers/i2c/busses/i2c-pasemi-platform.c b/drivers=
/i2c/busses/i2c-pasemi-platform.c=0A> index 0a44f64897c7a..5fbfb9b417440 =
100644=0A> --- a/drivers/i2c/busses/i2c-pasemi-platform.c=0A> +++ b/drive=
rs/i2c/busses/i2c-pasemi-platform.c=0A> @@ -66,22 +66,18 @@ static int pa=
semi_platform_i2c_probe(struct platform_device *pdev)=0A> if (of_property=
_read_u32(dev->of_node, "clock-frequency", &frequency))=0A> frequency =3D=
 I2C_MAX_STANDARD_MODE_FREQ;=0A> =0A> - data->clk_ref =3D devm_clk_get(de=
v, NULL);=0A> + data->clk_ref =3D devm_clk_get_enabled(dev, NULL);=0A> if=
 (IS_ERR(data->clk_ref))=0A> return PTR_ERR(data->clk_ref);=0A> =0A> - er=
ror =3D clk_prepare_enable(data->clk_ref);=0A> - if (error)=0A> - return =
error;=0A> -=0A> error =3D pasemi_platform_i2c_calc_clk_div(data, frequen=
cy);=0A> if (error)=0A> - goto out_clk_disable;=0A> + return error;=0A> =
=0A> smbus->adapter.dev.of_node =3D pdev->dev.of_node;=0A> error =3D pase=
mi_i2c_common_probe(smbus);=0A> if (error)=0A> - goto out_clk_disable;=0A=
> + return error;=0A> =0A> irq_num =3D platform_get_irq(pdev, 0);=0A> err=
or =3D devm_request_irq(smbus->dev, irq_num, pasemi_irq_handler, 0, "pase=
mi_apple_i2c", (void=0A> *)smbus);=0A> @@ -91,19 +87,9 @@ static int pase=
mi_platform_i2c_probe(struct platform_device *pdev)=0A> platform_set_drvd=
ata(pdev, data);=0A> =0A> return 0;=0A> -=0A> -out_clk_disable:=0A> - clk=
_disable_unprepare(data->clk_ref);=0A> -=0A> - return error;=0A> }=0A> =
=0A> -static void pasemi_platform_i2c_remove(struct platform_device *pdev=
)=0A> -{=0A> - struct pasemi_platform_i2c_data *data =3D platform_get_drv=
data(pdev);=0A> -=0A> - clk_disable_unprepare(data->clk_ref);=0A> -}=0A> =
+static void pasemi_platform_i2c_remove(struct platform_device *pdev) { }=
=0A> =0A> static const struct of_device_id pasemi_platform_i2c_of_match[]=
 =3D {=0A> { .compatible =3D "apple,t8103-i2c" },=0A> -- =0A> 2.40.1
