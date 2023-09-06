Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8843A793F1F
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 16:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241558AbjIFOmC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 10:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235885AbjIFOmB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 10:42:01 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559F9199A
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 07:41:45 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68a1af910e0so2528058b3a.2
        for <linux-i2c@vger.kernel.org>; Wed, 06 Sep 2023 07:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1694011305; x=1694616105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kol0pgf/fC9MIuMDVXfOTORheiJFWAU3O+8xMDqfAis=;
        b=vsESHGL3z5IUN08mGbgNj3x61nq8xZpd4LKoTQVoNRgaZSiRhYAU09adjHzXbYzJyp
         1EqNyaOjqiLTiXF9Puv0TpHA8Z+Oexlb4Z5V0HuRN5Hu1Nq2rUK8C2q0MWgo+55xYHbg
         JAPC8uv/bbCj49DN9DpRN5qnHvuHxvWXN4o29YiYkMfwV03cWP4mr81KXf7lpRs9fMsN
         WEc8Jda5+p2w6SMcBcIrrljGtJ8Ip4Kkc9fBC/PlxjimPG7CdCsk1YfwRscHO76cNXTD
         6IzaFuWb4tC0vXfBUBD+odTPmBPc7OE7Ul5bIyYAT7s2dIiFTJqJd8joyGWNm2P3b7+Z
         5iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694011305; x=1694616105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kol0pgf/fC9MIuMDVXfOTORheiJFWAU3O+8xMDqfAis=;
        b=hZ8rUo0L9YgMToO/fAqF5VO8yI9QbGGqTJ6AA/JoBCSlJc1jw2DYR3vRv8m4tNFKYA
         8yZqHdn6oh2BCnSorlZy6CekgzOgYX3dMy8ir2y2kF6M2kXCYVKpBhWjgsXaEnpiZSpA
         iyTl9sIqyDBpWwTK1imQMVcBFfgWjMOKS9MHVSVmBpZAx6qtt55fbBMhu1Cot6TOhhUc
         OU84bc8WGSwsSj+JzDuYJYvmuDsM3XQKCn8FFeoyjJqrhcEquP5RUXznv76brkleZ2MP
         PcEidtAULSuvhz9HT4P86dONat9IFtMmeMs4evnr1YUvfiI+O+NISMgMaq7pnYtf1zn9
         /kJw==
X-Gm-Message-State: AOJu0YwRbGugsS+iROz2IyBXdDJNPwqCJ11KBPDOlvxL7GaU+5EcZ3mQ
        aaI/7bTjD9XlR1lEB2fInpKD1tsjqPAfjrUY9PGwuA==
X-Google-Smtp-Source: AGHT+IEstA5WJj6AG+b4Jsx4Dj1n3k4DsxsVVKT3jrtoERP3wwKRdTsMu6Dhyw0G7cOqZlPmHsgifKo64KKsSBsiI9Y=
X-Received: by 2002:aa7:9196:0:b0:68e:2ef2:3379 with SMTP id
 x22-20020aa79196000000b0068e2ef23379mr1978180pfa.15.1694011304721; Wed, 06
 Sep 2023 07:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230901114936.1319844-1-robert.marko@sartura.hr>
In-Reply-To: <20230901114936.1319844-1-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 6 Sep 2023 16:41:33 +0200
Message-ID: <CA+HBbNEM6AfwX87DLRNAuJSWPKboGuuJJDRK_E+G3sJDF73oZA@mail.gmail.com>
Subject: Re: [RFC PATCH] i2c: core: dont change pinmux state to GPIO during
 recovery setup
To:     wsa@kernel.org, codrin.ciubotariu@microchip.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,T_SPF_TEMPERROR
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 1, 2023 at 1:49=E2=80=AFPM Robert Marko <robert.marko@sartura.h=
r> wrote:
>
> Ever since PXA I2C driver was moved to the generic I2C recovery, I2C has
> stopped working completely on Armada 3720 if the pins are specified in DT=
S.
>
> After a while it was traced down to the only difference being that PXA
> driver did not change the pinmux state to GPIO before trying to acquire t=
he
> GPIO pins.
> And indeed as soon as this call is removed I2C starts working.
>
> To me it seems that this call is not required at all as devm_gpiod_get()
> will result in the pinmux state being changed to GPIO via the pinmux
> set_mux() op.
>
> Fixes: 0b01392c18b9 ("i2c: pxa: move to generic GPIO recovery")
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> I am aware this probably isnt the correct fix, so I am sending it as RFC
> cause I have ran out of ideas.

CC-ing Russel as well since I forgot him.

Regards,
Robert
>
>  drivers/i2c/i2c-core-base.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 60746652fd52..b34d939078a1 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -359,13 +359,6 @@ static int i2c_gpio_init_generic_recovery(struct i2c=
_adapter *adap)
>         if (bri->recover_bus && bri->recover_bus !=3D i2c_generic_scl_rec=
overy)
>                 return 0;
>
> -       /*
> -        * pins might be taken as GPIO, so we should inform pinctrl about
> -        * this and move the state to GPIO
> -        */
> -       if (bri->pinctrl)
> -               pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
> -
>         /*
>          * if there is incomplete or no recovery information, see if gene=
ric
>          * GPIO recovery is available
> --
> 2.41.0
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
