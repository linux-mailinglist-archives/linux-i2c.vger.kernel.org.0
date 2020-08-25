Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C67D2251222
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 08:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgHYGiY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 02:38:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:45118 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729068AbgHYGiW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 02:38:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7E359AD2F;
        Tue, 25 Aug 2020 06:38:51 +0000 (UTC)
Date:   Tue, 25 Aug 2020 08:38:19 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2 RFC] eeprom: at24: Tidy at24_read()
Message-ID: <20200825083819.7478f26e@endymion>
In-Reply-To: <CAMpxmJUiOjP5oGijw+QQOFj3uQG0fRGPCAFtcUv_=PxTmy4+4Q@mail.gmail.com>
References: <20200807150005.48c8c89b@endymion>
        <20200807161906.6d119d2e@endymion>
        <CAMpxmJUiOjP5oGijw+QQOFj3uQG0fRGPCAFtcUv_=PxTmy4+4Q@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

On Tue, 18 Aug 2020 15:46:36 +0200, Bartosz Golaszewski wrote:
> On Fri, Aug 7, 2020 at 4:19 PM Jean Delvare <jdelvare@suse.de> wrote:
> > The elegant code in at24_read() has the drawback that we now need
> > to make a copy of all parameters to pass them to the post-processing
> > callback function if there is one. Rewrite the loop in such a way that
> > the parameters are not modified, so saving them is no longer needed.
> >
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > This has the drawback of creating an asymetry with at24_write(), so
> > I'm not 100% if we want to apply this. If anyone has a better idea,
> > please let me know.
> >
> >  drivers/misc/eeprom/at24.c |   13 +++++--------
> >  1 file changed, 5 insertions(+), 8 deletions(-)
> >
> > --- linux-5.7.orig/drivers/misc/eeprom/at24.c   2020-08-07 14:23:39.882191500 +0200
> > +++ linux-5.7/drivers/misc/eeprom/at24.c        2020-08-07 14:28:39.039360687 +0200
> > (...)
> > @@ -449,15 +446,15 @@ static int at24_read(void *priv, unsigne
> >          */
> >         mutex_lock(&at24->lock);
> >
> > +       i = 0;  
> 
> Hi Jean,
> 
> I think doing:
> 
>     for (i = 0; count; i += ret, count -= ret)
> 
> would be even more elegant, don't you think?

Definitely. I'll change the code that way and send v2 of the patch,
thank you for the suggestion.

> Bartosz
> 
> >         while (count) {
> > -               ret = at24_regmap_read(at24, buf, off, count);
> > +               ret = at24_regmap_read(at24, buf + i, off + i, count);
> >                 if (ret < 0) {
> >                         mutex_unlock(&at24->lock);
> >                         pm_runtime_put(dev);
> >                         return ret;
> >                 }
> > -               buf += ret;
> > -               off += ret;
> > +               i += ret;
> >                 count -= ret;
> >         }
> >

-- 
Jean Delvare
SUSE L3 Support
