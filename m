Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247186FBDA1
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 05:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234040AbjEID1R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 23:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234538AbjEID1B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 23:27:01 -0400
X-Greylist: delayed 607 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 08 May 2023 20:26:42 PDT
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4C176A1
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 20:26:42 -0700 (PDT)
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.tkos.co.il (Postfix) with ESMTPS id 5DA91440F5B;
        Tue,  9 May 2023 06:16:30 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1683602190;
        bh=WXfiMe0MB7Nd23UweF3xbQpkeuU5yNNld69eZchM3xY=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=gwJXOvGi9++QBfpJ7MV/zaPEziSQX2qXONcj7sh3Q9ou8a45h+zmlR/HKRr66koJV
         /p4Ja5BdyCFQrn1pPyaRSv4yCQIIPkDiEueaHin9yr/IRgkUchjaf9GjHKMaGb8vVH
         Lmevc2VWODLPi5JWJ0sXWUpFmPtWFptaoSBBrJlVC6W1XBzKa1YZLXJWt7m6ZVPebE
         O6xKykRtobfVfV+QE/8vnokWZDi6lkZT45Ie6yqO30zx6pXv5VehZcdgthQyqNbZhb
         YEpuqSDNjmc18/Vi1EyZ3m2cm9NnVdxAHgN8He1LiJrHgki7Nko/snnLkoIVXu73N4
         7OPUbK2l5o/dQ==
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-20-u.kleine-koenig@pengutronix.de>
User-agent: mu4e 1.9.21; emacs 28.2
From:   Baruch Siach <baruch@tkos.co.il>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 19/89] i2c: digicolor: Convert to platform remove
 callback returning void
Date:   Tue, 09 May 2023 06:15:29 +0300
In-reply-to: <20230508205306.1474415-20-u.kleine-koenig@pengutronix.de>
Message-ID: <87wn1i5h4f.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe,

On Mon, May 08 2023, Uwe Kleine-K=C3=B6nig wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

>  drivers/i2c/busses/i2c-digicolor.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-=
digicolor.c
> index 50925d97fa42..3462f2bc0fa8 100644
> --- a/drivers/i2c/busses/i2c-digicolor.c
> +++ b/drivers/i2c/busses/i2c-digicolor.c
> @@ -347,14 +347,12 @@ static int dc_i2c_probe(struct platform_device *pde=
v)
>  	return 0;
>  }
>=20=20
> -static int dc_i2c_remove(struct platform_device *pdev)
> +static void dc_i2c_remove(struct platform_device *pdev)
>  {
>  	struct dc_i2c *i2c =3D platform_get_drvdata(pdev);
>=20=20
>  	i2c_del_adapter(&i2c->adap);
>  	clk_disable_unprepare(i2c->clk);
> -
> -	return 0;
>  }
>=20=20
>  static const struct of_device_id dc_i2c_match[] =3D {
> @@ -365,7 +363,7 @@ MODULE_DEVICE_TABLE(of, dc_i2c_match);
>=20=20
>  static struct platform_driver dc_i2c_driver =3D {
>  	.probe   =3D dc_i2c_probe,
> -	.remove  =3D dc_i2c_remove,
> +	.remove_new =3D dc_i2c_remove,
>  	.driver  =3D {
>  		.name  =3D "digicolor-i2c",
>  		.of_match_table =3D dc_i2c_match,


--=20
                                                     ~. .~   Tk Open Systems
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
