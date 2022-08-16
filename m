Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 752DC595807
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 12:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbiHPKVW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 06:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232916AbiHPKUR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 06:20:17 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B75FDD5EB1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 01:17:17 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id ct13so7347531qvb.9
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 01:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=Pehfh1RqfJn2kVULtrCPrBrMAB+7O/oyc0bYZHQhlEE=;
        b=XfcibtteH5N/ef55/yCOAnRJG1j3nvuNDdy/GKw7e5TnFH6HGS7G/xT3Dkd2PCYsSv
         2H+xMunR2EbcIZ8IVun75PNOrK+0reM2RHv8y/G/29kNZtkHEoxY0VOoqIx+W8SsFJ5L
         qcNwZhdwIv+ssOCZ2gXGNpbBopOlO93b9vkyt0vA+okJidn9VsCfrWxJoj6w/xpd0Pkb
         Sletm7OShBBXdymgmGtbkrySbZWven8O8L3OUZzXydRcFrDjFQNKXAznBZbsDMQgo2+m
         JpxHRxDeT+RVIi9hhQ9fH+lcWPInBMwmXEyO1Q61JrPTIUgOH75mr9qHr1sbJt8un+MV
         91wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=Pehfh1RqfJn2kVULtrCPrBrMAB+7O/oyc0bYZHQhlEE=;
        b=OcEBgiVKYJAlXR2Ap2pf8TrkInNUWNpcuIJ+ShNiAO15xKQ8cQB6016Tix0ci43lZA
         3zBTHWu1cCUTnsu1ITKYCNMAlHP5kZqXAFUwpVoN99hdWqXBBSJ1M40LmE3DGt0iY5Wc
         MkfbazpFX1dHNu7pihqCFC6AXVlkH3K4h2XkIwMuq926ZOqqeFFP1s3hL9Os2xp01uhl
         hCa1W0+7gTj0E51pPZF9sNTOPM4i+NMdmi41lGsJdgLX/WBuaWXAIt+GZyhyxdHGwF1X
         /CxPW8jjZ0ZqubxnYYXZduraU4mDIpyoHZheFFSFZMq3gONUmdPEAYwQg4bxyG4XaqQj
         20Xg==
X-Gm-Message-State: ACgBeo1y4b12smqf1PBw1j3/QxZNhDrbApFJ+m3iUpdW4MWWabnwJo+F
        OUFynQB2+1tM0TtfMxNv2cQ256OYUBpJsIied8g=
X-Google-Smtp-Source: AA6agR7ogDTBHljac9/7FrrpT7xDc5h8jxTfZc2nYvdhEOujrNsFS/KsEq8iuLPNnQFWdxNdXE+311ZiRVK9VznD3YE=
X-Received: by 2002:a05:6214:d07:b0:476:c32f:f4f4 with SMTP id
 7-20020a0562140d0700b00476c32ff4f4mr16814950qvh.11.1660637836822; Tue, 16 Aug
 2022 01:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de> <20220815080230.37408-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220815080230.37408-6-u.kleine-koenig@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 Aug 2022 11:16:40 +0300
Message-ID: <CAHp75Vd16FcVrCEcg41vwRQLxnt82shsQmXpyJTnOejFquhWhw@mail.gmail.com>
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

On Mon, Aug 15, 2022 at 11:02 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> All platforms that provide a teardown callback return 0. New users are
> supposed to not make use of platform support, so there is no
> functionality lost.
>
> This patch is a preparation for making i2c remove callbacks return void.

In case you need to send another version, consider below...

...

>         if (pdata && pdata->teardown) {
> -               ret =3D pdata->teardown(client, chip->gpio_chip.base,
> -                                     chip->gpio_chip.ngpio, pdata->conte=
xt);
> -               if (ret < 0)
> -                       dev_err(&client->dev, "teardown failed, %d\n", re=
t);
> -       } else {
> -               ret =3D 0;
> +               pdata->teardown(client, chip->gpio_chip.base,
> +                               chip->gpio_chip.ngpio, pdata->context);
>         }

First of all, after this change the {} should not be needed.
Second, with a temporary variable

  struct gpio_chip *gc =3D &chip->gpio_chip;

this becomes a one liner like

  pdata->teardown(client, gc->base, gc->ngpio, pdata->context);

--=20
With Best Regards,
Andy Shevchenko
