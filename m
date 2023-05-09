Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92CD56FBF43
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 08:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234563AbjEIGdJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 02:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjEIGdJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 02:33:09 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D60C59D5
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 23:33:07 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-965ab8ed1c0so880144066b.2
        for <linux-i2c@vger.kernel.org>; Mon, 08 May 2023 23:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683613986; x=1686205986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0qAJplq+FoI0Zp4URt/LobsN3wJwY/Cob7hjfKkbcY=;
        b=QsLNZPOdfTVI15CvYKz6nU5Jx4eYvQygux3+q8UGBogt5ad0FnvVMGb2wzLGF2FtFm
         o27GjsKehAG3gFdyd3oyjHfWPjoUdAopfyE+pifQawsgvbNgaACLebI2URtUWlFJkeLn
         +7vvti8C9anhzhk/2D2sffl2cOAmY2bEua/TMXjqLAR2PSNzgEJcg8qd9FcdD6Z58mIv
         xdDhM0mDv5W8lyg2z1eOdHu/JNcqP7Mr8+uGn0XRyY72p3Pn9Og+Hd8hzJaAQEyCQpK9
         0sKWIAxG2Jk0zPkyeuqbqGSWspGpKbclj2rwJLvyuzG5eDpopeKGDolbz/eTAYv/tnn2
         CBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683613986; x=1686205986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0qAJplq+FoI0Zp4URt/LobsN3wJwY/Cob7hjfKkbcY=;
        b=CUFFxzvG3+1cuUOsbC1l5QDGg7y8W6/kuHS1wu9BYdFMSUIFEJF7onDvlu3SX/hw/9
         cX45pUoiptMg4BRrpFXljkyXTUkTINnC1IRTRMCNI141wSFyRS9eXOhQ7qTIMCcUi1he
         3g0tojX7sdObS65BDMg3J4ZJz5Or8QIgpyifn1yOUd7SoLLUjJLlBTMiKXctFpCd8Q41
         ypQC1XleuU9BzOnj2RRqeuxAQZKf3OXbNvdbClT+VQU3pM3BmtDBYdcZT0YXLO9dRDi/
         zanMK3JdDvx3kl6T0J8/3QZJW+2ld7obGCXHiFyweKoaRZoFuU/2rlyK5sENAE4Gz5qg
         CHHw==
X-Gm-Message-State: AC+VfDwIOvcaCNhdxsH5elZlcOsoYVNxk1y2YpVmPGXSzqumOY2mhe/7
        W05uO43kQtF7ONZIgoMsbDrAZPw+CoCLiFSELA8=
X-Google-Smtp-Source: ACHHUZ40Pk/rGGD9Hs1bhsarUFa7aMrDojR7Hhcs9DWiGrJtcqFql8RALK7W2RsmZ6yAnhMOr+wsHb8JIqMeE1socOo=
X-Received: by 2002:a17:907:16a3:b0:967:92c6:1ec1 with SMTP id
 hc35-20020a17090716a300b0096792c61ec1mr4562870ejc.55.1683613985926; Mon, 08
 May 2023 23:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de> <20230508205306.1474415-46-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-46-u.kleine-koenig@pengutronix.de>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Tue, 9 May 2023 09:32:54 +0300
Message-ID: <CAHb3i=sP7GgEfc4yKe6E=9HCh=F-D6sKOvM1T22xN_0fyagiKQ@mail.gmail.com>
Subject: Re: [PATCH 45/89] i2c: npcm7xx: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks!

Reviewed-by: Tali Perry <tali.perry@nuvoton.com>


On Mon, May 8, 2023 at 11:53=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
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
>  drivers/i2c/busses/i2c-npcm7xx.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index 38d5864d0cb5..53b65ffb6a64 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2361,7 +2361,7 @@ static int npcm_i2c_probe_bus(struct platform_devic=
e *pdev)
>         return 0;
>  }
>
> -static int npcm_i2c_remove_bus(struct platform_device *pdev)
> +static void npcm_i2c_remove_bus(struct platform_device *pdev)
>  {
>         unsigned long lock_flags;
>         struct npcm_i2c *bus =3D platform_get_drvdata(pdev);
> @@ -2371,7 +2371,6 @@ static int npcm_i2c_remove_bus(struct platform_devi=
ce *pdev)
>         npcm_i2c_disable(bus);
>         spin_unlock_irqrestore(&bus->lock, lock_flags);
>         i2c_del_adapter(&bus->adap);
> -       return 0;
>  }
>
>  static const struct of_device_id npcm_i2c_bus_of_table[] =3D {
> @@ -2383,7 +2382,7 @@ MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);
>
>  static struct platform_driver npcm_i2c_bus_driver =3D {
>         .probe =3D npcm_i2c_probe_bus,
> -       .remove =3D npcm_i2c_remove_bus,
> +       .remove_new =3D npcm_i2c_remove_bus,
>         .driver =3D {
>                 .name =3D "nuvoton-i2c",
>                 .of_match_table =3D npcm_i2c_bus_of_table,
> --
> 2.39.2
>
