Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 556D2595821
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 12:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbiHPK0J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 06:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234665AbiHPKZs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 06:25:48 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F27BA1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 01:18:48 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id j17so7582884qtp.12
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 01:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=tpdPEcmpqlEkmQWon6OiNCbPhXTlF0ahHHE7RDXl2Cg=;
        b=Ex51sKiadx0Xa5JQLGQ1/Y5ZIyCCkLpnP0j1mcO3dj9dz/izOKYktcGM46rKycGTgm
         J7nIDbuns25W48+/gWJG69R7ZmYnJMg73YhGcqfy1MEcIYoR5JyJ/SgH5arw/km5bA8q
         +lMtx8D5wEw4IuQP7SAlO1qCS2iv2i6p+hDw+u94cH/U0DUPehOR8gT1RlBuTCegVxxB
         HUmrvTTaWld9M0Bg6gBFxZlIJhW3in3xSnRTR7VLZ6rLZUCiCQP2rb3KLFaewl6Y2wkH
         97T1jaF/zmiXihb40rbIemjXRcYkfhNfGp6rW64TnGTaBEBUiR2xyUgRLkwqFaaA0b3Q
         9e3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=tpdPEcmpqlEkmQWon6OiNCbPhXTlF0ahHHE7RDXl2Cg=;
        b=Let/IWNuiRosjcELRYo76Vpn5uSDxqcJrTSjiNXQJ4TaWz3KKCq2SRpw3Ow8XaaHkj
         IbL3n6tUARm2ZzcNKLD/utr5dEovB6Py0GRdb/bRSui5YPbYmtMNsAi+dBnYD5P2ij0z
         VEqQlYIBJTSodsazmcDpLeJBKD2g1S786UJBuqwoGOD80Qen1QLcgJyiI+RHM3Wn1ab+
         guIduZ4e3llxGMbcwXJ89CKd/adHeaGwYZJUjpYPzfb5JI6kLsSy2UQJkkKV6U8RZ0qu
         DQcj47fY93EMkO5kJrHwFt1I2P3eowTlmrULeCtMl2RTMvf68tlcn5Rv6brbUs4hyXuK
         FdDg==
X-Gm-Message-State: ACgBeo0Yl1U6/NytvmXtElorVywf55/Gi/yl7rtDFoWXyryzjHSKAQ7p
        q/fqfIDK5G9RhlcphWgx5C0mZJs9RMhjSTs1e/8=
X-Google-Smtp-Source: AA6agR798MTrowPBHNnyyBk2PCklVmEgEavff3t6PlfyNDZ8Qe9h7aIvOjevEK1aclmwC3nwOr/8vJqIRKZND22RNqY=
X-Received: by 2002:a05:622a:48f:b0:343:463:351a with SMTP id
 p15-20020a05622a048f00b003430463351amr17057555qtx.61.1660637927255; Tue, 16
 Aug 2022 01:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
 <20220815080230.37408-6-u.kleine-koenig@pengutronix.de> <CAHp75Vd16FcVrCEcg41vwRQLxnt82shsQmXpyJTnOejFquhWhw@mail.gmail.com>
In-Reply-To: <CAHp75Vd16FcVrCEcg41vwRQLxnt82shsQmXpyJTnOejFquhWhw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 Aug 2022 11:18:11 +0300
Message-ID: <CAHp75VeB_t1MTwvRS6UF=tCRmnBEw3UwTnZJTtVsyRfvgVAJLA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] gpio: pca953x: Make platform teardown callback
 return void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sekhar Nori <nsekhar@ti.com>
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

On Tue, Aug 16, 2022 at 11:16 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Aug 15, 2022 at 11:02 AM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > All platforms that provide a teardown callback return 0. New users are
> > supposed to not make use of platform support, so there is no
> > functionality lost.
> >
> > This patch is a preparation for making i2c remove callbacks return void=
.
>
> In case you need to send another version, consider below...

(forgot to add) otherwise it can be a follow up.

> >         if (pdata && pdata->teardown) {
> > -               ret =3D pdata->teardown(client, chip->gpio_chip.base,
> > -                                     chip->gpio_chip.ngpio, pdata->con=
text);
> > -               if (ret < 0)
> > -                       dev_err(&client->dev, "teardown failed, %d\n", =
ret);
> > -       } else {
> > -               ret =3D 0;
> > +               pdata->teardown(client, chip->gpio_chip.base,
> > +                               chip->gpio_chip.ngpio, pdata->context);
> >         }
>
> First of all, after this change the {} should not be needed.
> Second, with a temporary variable
>
>   struct gpio_chip *gc =3D &chip->gpio_chip;
>
> this becomes a one liner like
>
>   pdata->teardown(client, gc->base, gc->ngpio, pdata->context);


--
With Best Regards,
Andy Shevchenko
