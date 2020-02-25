Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA3016BEBE
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 11:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbgBYK27 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 05:28:59 -0500
Received: from mail-lf1-f50.google.com ([209.85.167.50]:42996 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730267AbgBYK27 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Feb 2020 05:28:59 -0500
Received: by mail-lf1-f50.google.com with SMTP id 83so9341103lfh.9
        for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2020 02:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Xt5gQY8jFB58VXdpXhD78knoaZZIRVN1gIxs+GjvtcY=;
        b=eczlL2B8ndUO2ZveCZ9xAm6QfeO2ZsoGzkSrpq9tUeFzVQpDcXrQnD2i1cokWy/kNH
         zBraQYQo6JC8xfCrx4aaCB9krjVYzzNhuFfq0fpJcB5/719sU9d6FXbRspLIz3rr1yO4
         T8eRcDltNpChrUD5QZ3fG3lGL5kFv8z6PKNrZit5hL8Ik8vjpqgnfljeECMoR9pThZA2
         6ZtOyR2QJL0LM0eFZIDw2UJU+KLr+sYbACoxCgdtUND3jSaW+AHKnAg3DdTpHP2QSUxI
         7BdCTvBwlqhxbnJ5zp3l79LI0EJdvjV06eRiT+R32F75VtMqV3HyMBz5aK9sOENCGkik
         supw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Xt5gQY8jFB58VXdpXhD78knoaZZIRVN1gIxs+GjvtcY=;
        b=JlYXd63jorbhe2HHAghCu4pY304sJMCbr54jqgYllCIplOdFHSCnTDjFgy2F/ljyyd
         XntHNg5H2rBMVhjRnxje/2ezpy4hs+DfoOTtn/8f8xWKzG9i6zV6j8RcBPwTyj34E6+l
         UAn66klBlM123Ll/qjzdQ8is7H50NwVA1s3P556hpEFpqllbgLTFxwJIRr4r8Ik+MIqH
         fcmp2YQ4L0wcv8z7sRyw/Hi223EqxsD92zM+pu1QfjEzinkVvnTS4pzJqumWB7mbcIJK
         O9TNHOowrOfbJdHL6P3lIv4LnVKOXlAzTKlrmBAi5N8RkCrc4wv+SWqCU/QlSzlrtt3V
         rRFA==
X-Gm-Message-State: APjAAAUsSPw1uU2zGumU2LDImVwJFpmOumpbng/S4gqC0iusm28ogRaB
        LmAC33BigmmQ81uRxjE37CaWzpYyZUZXk1eJVrQHxeQu
X-Google-Smtp-Source: APXvYqyDnEM7/bmFrgy9wNMvHyIEpCb10Bbu369dWbopn8AK7ZlR5qKnmTqCM41vUItA2K453sp93QcsqRGlCaSCWw8=
X-Received: by 2002:a19:c38e:: with SMTP id t136mr14664384lff.153.1582626537261;
 Tue, 25 Feb 2020 02:28:57 -0800 (PST)
MIME-Version: 1.0
References: <CAHb3i=uXLgjT-emHeJzHGG5L_0z94ZwDYcX5vtaDf8+Eh90ziQ@mail.gmail.com>
 <CAHb3i=vA76p6iXt0Q8ZECSj8r_Ltv_c7U1W21r_aD4HsLuJPrA@mail.gmail.com>
In-Reply-To: <CAHb3i=vA76p6iXt0Q8ZECSj8r_Ltv_c7U1W21r_aD4HsLuJPrA@mail.gmail.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Tue, 25 Feb 2020 12:29:35 +0200
Message-ID: <CAHb3i=shEPFMmVJG=MTP-t9UqNfxMoyVqRnr9WDFMg1S=_TeSg@mail.gmail.com>
Subject: Re: npcm-I2c driver
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Just a reminder,
please take a look at this patch.
This patch is a new driver for npcm-i2c.
The patch has been waiting patiently for several months now...


https://patchwork.ozlabs.org/patch/1198846/


Thanks,

Tali Perry
Nuvoton Technologies

On Wed, Feb 19, 2020 at 11:39 AM Tali Perry <tali.perry1@gmail.com> wrote:
>
> Hi,
>
> Just a reminder,
> please take a look at this patch.
> This patch is a new driver for npcm-i2c.
> The patch has been waiting patiently for several months now...
>
>
> https://patchwork.ozlabs.org/patch/1198846/
>
>
> Thanks,
>
> Tali Perry
> Nuvoton Technologies
>
>
> ---------- Forwarded message ---------
> From: Tali Perry <tali.perry1@gmail.com>
> Date: Mon, Feb 17, 2020 at 3:52 PM
> Subject: npcm-I2c driver
> To: Wolfram Sang <wsa@the-dreams.de>
> Cc: <linux-i2c@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
>
>
> Hi,
>
> Just a reminder,
> please take a look at this patch.
> This patch is a new driver for npcm-i2c.
> The patch has been waiting patiently for several months now...
>
>
> https://patchwork.ozlabs.org/patch/1198846/
>
>
> Thanks,
>
> Tali Perry
> Nuvoton Technologies
