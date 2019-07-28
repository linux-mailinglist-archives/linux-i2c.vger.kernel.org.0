Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8195577F14
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jul 2019 12:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfG1Kg6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Jul 2019 06:36:58 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34469 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfG1Kg5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Jul 2019 06:36:57 -0400
Received: by mail-io1-f68.google.com with SMTP id k8so113918199iot.1
        for <linux-i2c@vger.kernel.org>; Sun, 28 Jul 2019 03:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cqruKsAP1k6kuoCZ58RRfdZzoklShyPDryUJQRjTT/0=;
        b=UJ+vFcWogpjYpbiecN5FgQ6Qvui0/9S6w3qhZzFRbTGWnQWKiBvaAPFBJBPeNVlR/G
         uluV3nqQYofQ8wrKYtyXuRyW87Ea4IfWKJZvsNLOjsCAnR/iCRP67sP2XVsq82ggq19n
         EW2rJAT8RP3osE+D1RIHe2kRjmWR/VvRS4IwtzAQXzkQhTNa/O5ORA5mcM6jSlHboHic
         gLiGZ0/P47HivS9Sj1VIs/WZyiTdl5YK70iINVJhLoD//Me85pgKYRFjvD6s+htnyVSj
         UaZgBruRcmQcKTmEIlvV5dJUzAiesP+lQoAmxKUnyWhA1diWc4vLv9phk8sNEVLK/Owc
         VSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cqruKsAP1k6kuoCZ58RRfdZzoklShyPDryUJQRjTT/0=;
        b=RY1eFiUQW74VinMQF9/TE8GeypWHFIQ+j4QH6wXncc0lo2ZkIv5kDLEtpI/NKz0hZv
         X8I/2SR5cUh+xMNjgB2GZfMZ3iXTznr46cnpO9e8hS73Gq5aQ1sNq1fzCBqRuilEpYdb
         J319RlY+epcU1pyiDX61ySJif6eoROgrD0N++KeEAdnJJhB7jEiTEuGgXRuU+n+ypsNJ
         0Bi0pFuVpOzsRcexWNh7qUz4nbV800d0AfmudCpRdLT5bfML3ntJXK91GXZOyviNSuPO
         oZgFRTl9+X9hsUB3WE6rZ7zFcu0sEZ/qdmi71Bz1o9TieCsUJF7wQOSx//YdvSal+hUt
         PRfA==
X-Gm-Message-State: APjAAAUetAYLYhMi/3tHt0YceqIGhT3Zh2jHVcugZYZ63DWqVHnRhQAp
        XxFUbnddFAGhX3dwyzh6Q7WpM7Xu+eXpwzii2Z0=
X-Google-Smtp-Source: APXvYqxqOCtjIZlLBnuYUkXVh3RmuV4OmW988Vb1F/ZA7V6Qp3DKAnf2oC2eSjvWMKRq/kr7/8thigXpCY6N8gDfJFI=
X-Received: by 2002:a5d:80c3:: with SMTP id h3mr13745552ior.167.1564310216990;
 Sun, 28 Jul 2019 03:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190726151816.66f2ff2f@endymion> <CAMRc=Mcq6CMG5wWgYui79pHnx7BOG_7KwVJB0=dvZpXed9Dnaw@mail.gmail.com>
 <20190727175047.1c1ad06a@endymion>
In-Reply-To: <20190727175047.1c1ad06a@endymion>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 28 Jul 2019 12:36:45 +0200
Message-ID: <CAMRc=Me8HqgfxwUh+Z7=2L-tbwX3gLZ=eFS=sMg4FToY732eGQ@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: make spd world-readable again
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

sob., 27 lip 2019 o 17:50 Jean Delvare <jdelvare@suse.de> napisa=C5=82(a):
>
> Hi Bartosz,
>
> Thanks for your swift review.
>
> On Sat, 27 Jul 2019 13:15:03 +0200, Bartosz Golaszewski wrote:
> > pt., 26 lip 2019 o 15:18 Jean Delvare <jdelvare@suse.de> napisa=C5=82(a=
):
> > > --- linux-5.1.orig/drivers/misc/eeprom/at24.c   2019-05-06 02:42:58.0=
00000000 +0200
> > > +++ linux-5.1/drivers/misc/eeprom/at24.c        2019-07-26 13:56:37.6=
12197390 +0200
> > > @@ -719,7 +719,7 @@ static int at24_probe(struct i2c_client
> > >         nvmem_config.name =3D dev_name(dev);
> > >         nvmem_config.dev =3D dev;
> > >         nvmem_config.read_only =3D !writable;
> > > -       nvmem_config.root_only =3D true;
> > > +       nvmem_config.root_only =3D !(flags & AT24_FLAG_IRUGO);
> >
> > I have a preference for code as readable as possible. Please make it
> > something like: root_only =3D flags & AT24_FLAG_IRUGO ? false : true;.
>
> I think this is the first time someone asks me to use the ternary
> operator in the name of readability :-D
>

As I said - it's personal preference: figuring out the outcome of
!(flags & AT24_FLAG_IRUGO) took me a couple seconds longer than flags
& AT24_FLAG_IRUGO ? false : true.

> FWIW the !(flags & FLAG) construct is very popular among kernel
> developers, with over 8500 occurrences in the kernel tree, and I
> personally find it more readable. As a matter of fact, the very at24
> driver already uses that construct a few lines before I do:
>
>         writable =3D !(flags & AT24_FLAG_READONLY);

You're right. In that case let's keep the code consistent. Don't change tha=
t.

>
> which is why I did the same. I tend to think that consistency matters
> when it comes to code readability.
>
> That being said, you are maintaining the at24 driver, so I'll do as you
> prefer.
>
> > Also: AFAICT these changes can easily be split into two separate
> > patches, which would make pushing them upstream easier as at24 and
> > nvmem go through different branches.
>
> OK, makes sense. There is no dependency so they can take their own
> route to upstream and land there in whatever order. However the bug
> won't be fixed until both are committed.
>

Sure.

Bart

> Thanks,
> --
> Jean Delvare
> SUSE L3 Support
