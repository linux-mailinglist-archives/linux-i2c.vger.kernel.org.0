Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFFB7E7329
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 22:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjKIVC3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 16:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjKIVC3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 16:02:29 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9173C0C
        for <linux-i2c@vger.kernel.org>; Thu,  9 Nov 2023 13:02:27 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-da2b9234a9fso1449916276.3
        for <linux-i2c@vger.kernel.org>; Thu, 09 Nov 2023 13:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699563746; x=1700168546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87YsagAgSxTCzkx78cHO15uU55fceNs/c/03xKq5PQg=;
        b=t7IPZHWWBEWBNIM3toOIfR1gK/0XlwGha9rpP6Ht4Lv8ViFqUsc+APdtSx7AClzjYe
         rOX7LUUCFAsCnBqk5dc2A+PwNOqIBjX2Xl98+RqN1w91zuWuxO4KHzfYB+nONCo9XwGF
         /sKf00RmKTy81dgqySA9BMq2253VPF1ADU0mT0c/g4c0AZL/tZyckfZ0MEnz42RM8sZ6
         ffRIC9f99rXqpH5wCKBwjYI9bGFeN73K4a7aoIknkbDBwt9qMiqaQZxv192GV1jCAl5y
         dGaiUQgFT4DmBxxD0jWwmRcsSaUJ6ZS4pldd8IjfOOxyTo50sy2dLSKXTl7jyVY/8wLZ
         /79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699563746; x=1700168546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87YsagAgSxTCzkx78cHO15uU55fceNs/c/03xKq5PQg=;
        b=PGY9GBy6H+VeSgTZ0TZSVQ907GPuXNKZOcwPzmMheJl48qi5BtTf846iIjw22KB3Xp
         lgr6fbE/l7uSoyT+bYrPtxknr/JU6P4kLYWV80UBpmEV/h1c4UJfjCKf4H/5YULxlvbX
         FIgLXffl60xl8eymI9YzEPpIeodEAihvK1JnlN62S6VNl/shDIbH/Wwrpxy5QVU9GAkU
         ogJbPMlg2WY0Zv3CQJWNwrFh90XEcQJpDe3txV6e6SXVe/yNJemXvNOQokOMaei2gn6v
         N+9kK4/NJSDY56FYiztl3jvCQdYRDs96aPcELbgbjHEfRekWWMYqA5XV0RAQyXCgSrVi
         AZtg==
X-Gm-Message-State: AOJu0YyqEawi6RQ+6fxm7DJC0T3JRTx7smCg24EJ0Av4I7BwBbrj94a9
        +9Aud8KjD7wPJDkHY6ZGxeJcVzEORZXXA16zk4Ofvw==
X-Google-Smtp-Source: AGHT+IFZf0Ef1uCyXVsYVxmvVRjeOd50i7i/PDExqHkIFNnYHucLfuFOiMYxetycgpO4YM37XJhEHKMvC0YKeyfeDZc=
X-Received: by 2002:a25:aaf0:0:b0:d9a:d184:8304 with SMTP id
 t103-20020a25aaf0000000b00d9ad1848304mr6718605ybi.35.1699563746352; Thu, 09
 Nov 2023 13:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20230926160255.330417-1-robert.marko@sartura.hr>
 <CACRpkdZem9Gtd==gQM4EQ9R8MN2ZQ0JCyMCoTjg0kqCNDjuFMA@mail.gmail.com>
 <CA+HBbNFeVmc2CJeo+u9jbZrzsrDTOttW_4+aeLJFcOjDJ8DwyQ@mail.gmail.com>
 <CACRpkdYUW-mO6vhh-zkZAuqQOHpwMeJsNw=jSLzbgoEtoCTtNQ@mail.gmail.com> <ZU1BSmyD931BRwSD@shell.armlinux.org.uk>
In-Reply-To: <ZU1BSmyD931BRwSD@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Nov 2023 22:02:14 +0100
Message-ID: <CACRpkdZBR1ROkQ_w_QonVmvPB1nxh4c7BQksuP-k=hQG92FmDw@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: dont change pinmux state to GPIO during
 recovery setup
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Robert Marko <robert.marko@sartura.hr>, wsa@kernel.org,
        codrin.ciubotariu@microchip.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 9, 2023 at 9:30=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Thu, Nov 09, 2023 at 09:04:29PM +0100, Linus Walleij wrote:

> > > After it was converted to it, the I2C bus completely stopped working
> > > on Armada 3720
> > > if I2C recovery is enabled by making the recovery pinctrl available i=
n DTS.
> >
> > Shouldn't we just revert that patch until we can figure this out then?
>
> Note that when I wrote the i2c-pxa recovery code (which was developed
> and tested on Armada 3720 - the uDPU) it had to work... when the
> suggestion came up to implement generic recovery, I stated:
>
> http://archive.lwn.net:8080/linux-kernel/20200705210942.GA1055@kunai/T/#m=
f7f862fcd53245f14fb650d33c29cf139d41039d

Makes me even more convinced that we should just revert this. i.e.
commit 0b01392c18b9993a584f36ace1d61118772ad0ca
i2c: pxa: move to generic GPIO recovery

There is even:
https://lore.kernel.org/linux-i2c/20201209204645.GF3499@kunai/

"In case we missed a glitch, we can still revert the patch later."
Well this is later.

Robert can you see if it possible to revert, that things work after a
revert and send a revert patch?

> > > I then spent quite a while trying to bisect the exact change that
> > > causes this issue
> > > in the conversion as code is almost identical to what the driver was
> > > doing previously,
> > > and have bisected it down to pinctrl_select_state(bri->pinctrl,
> > > bri->pins_gpio) being
> > > called before SDA and SCL pins are obtained via devm_gpiod_get().
>
> Yes, indeed. That's because the pinctrl internals get confused. I sent
> you an email about it on 6th December 2019
>
> "pinctrl states vs pinmux vs gpio (i2c bus recovery)"

I found it:
https://lore.kernel.org/all/20191206173343.GX25745@shell.armlinux.org.uk/

Sadly I had no good advice for any simple elegant solutions
to the problem, but the more complicated solution does
work so let's go for that.

> which is why i2c-pxa did things the way it did in my commit
> "i2c: pxa: implement generic i2c bus recovery".

I think we need to go back to this.

It's nice with the ambition to create generic code of course, but
sometimes it is better to just roll something IP-unique.

Yours,
Linus Walleij
