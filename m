Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB3C77A64
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jul 2019 17:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728953AbfG0Puw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Sat, 27 Jul 2019 11:50:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:60784 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728882AbfG0Puw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 27 Jul 2019 11:50:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5D4F1B008;
        Sat, 27 Jul 2019 15:50:50 +0000 (UTC)
Date:   Sat, 27 Jul 2019 17:50:47 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] eeprom: at24: make spd world-readable again
Message-ID: <20190727175047.1c1ad06a@endymion>
In-Reply-To: <CAMRc=Mcq6CMG5wWgYui79pHnx7BOG_7KwVJB0=dvZpXed9Dnaw@mail.gmail.com>
References: <20190726151816.66f2ff2f@endymion>
        <CAMRc=Mcq6CMG5wWgYui79pHnx7BOG_7KwVJB0=dvZpXed9Dnaw@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

Thanks for your swift review.

On Sat, 27 Jul 2019 13:15:03 +0200, Bartosz Golaszewski wrote:
> pt., 26 lip 2019 o 15:18 Jean Delvare <jdelvare@suse.de> napisał(a):
> > --- linux-5.1.orig/drivers/misc/eeprom/at24.c   2019-05-06 02:42:58.000000000 +0200
> > +++ linux-5.1/drivers/misc/eeprom/at24.c        2019-07-26 13:56:37.612197390 +0200
> > @@ -719,7 +719,7 @@ static int at24_probe(struct i2c_client
> >         nvmem_config.name = dev_name(dev);
> >         nvmem_config.dev = dev;
> >         nvmem_config.read_only = !writable;
> > -       nvmem_config.root_only = true;
> > +       nvmem_config.root_only = !(flags & AT24_FLAG_IRUGO);  
> 
> I have a preference for code as readable as possible. Please make it
> something like: root_only = flags & AT24_FLAG_IRUGO ? false : true;.

I think this is the first time someone asks me to use the ternary
operator in the name of readability :-D

FWIW the !(flags & FLAG) construct is very popular among kernel
developers, with over 8500 occurrences in the kernel tree, and I
personally find it more readable. As a matter of fact, the very at24
driver already uses that construct a few lines before I do:

	writable = !(flags & AT24_FLAG_READONLY);

which is why I did the same. I tend to think that consistency matters
when it comes to code readability.

That being said, you are maintaining the at24 driver, so I'll do as you
prefer.

> Also: AFAICT these changes can easily be split into two separate
> patches, which would make pushing them upstream easier as at24 and
> nvmem go through different branches.

OK, makes sense. There is no dependency so they can take their own
route to upstream and land there in whatever order. However the bug
won't be fixed until both are committed.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
