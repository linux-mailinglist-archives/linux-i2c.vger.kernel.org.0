Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A4D307319
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhA1Jqm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:46:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhA1JpD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Jan 2021 04:45:03 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355F2C061756
        for <linux-i2c@vger.kernel.org>; Thu, 28 Jan 2021 01:44:22 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id gx5so6762235ejb.7
        for <linux-i2c@vger.kernel.org>; Thu, 28 Jan 2021 01:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SoCmbGxN/aO/kMcp3ztDvA2jTIObtogCqRK1+lIzWfA=;
        b=oqpFU4MLxEO7C9YvlPwddm12aFeciDO382Q47IoKOi3ls4NYbIibDT0ss7Tnf4Bwsm
         pVE6cROJYJcgp2SoTTjLQ7vPOxSyOexkDPcH639ixiLGoOhsAdX4ABh9Egnke8Lk6HFZ
         NGE8WDGxpJCFo+BD0BZ8LNXf+fQ9eax70X8RZlQmNUvFQcBWTY3cHvtKv/eumpN+8/a9
         9PZfWDKV5jUND+Kw/QKWvQ4yhKRm5IGK+XzmVmuykp+GaKvgR1DvCgKrLYnx4RdZKSJu
         7S+0foOLHxcFNcOVU7MBEquAjyKaAGsMeZgGAAhdnX1YSxULhwpShF+TACdNI/ENrpEo
         Goxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SoCmbGxN/aO/kMcp3ztDvA2jTIObtogCqRK1+lIzWfA=;
        b=bFAcZIC5z/whhGpXbrZyKI3rLk3X/uO6+BTU8md4KLjVF1ci17FUBLZe0QTX7RjGZ/
         uggHYK9Pel5RNFIqtsQ0fpDrLdX5zRMqp0HYFOhn9UI0SA+5ACVs8/U4U4KhHxkmGzDW
         Q4CS3xwNmZ+KHb2QnI3N7/VcOPCMHcsizeQWVcQiYGislO3yeEJfO/O1Ug1VqTC5leZz
         3qBljbg653VxrAxgS414qDtYvHKQ0D9NhUcs+CP98hyih5cgcaCVK8iY8GGl0mp/TAp6
         87VYlaaq3PnjGZZMk4LcE1uKcG1YESKvWSR89DpLn/kdF/XadVaGjcOvFWZWmLPXclF/
         0aiw==
X-Gm-Message-State: AOAM530jxHdLfW7M33uhdjzSvduoHYPi+xLTyRYfah5BxCQaL1xuSBxe
        Jkcv36NOzK94hozLq7JKKJ/WYbh5XwWE3R00D8G4Lw==
X-Google-Smtp-Source: ABdhPJw+bEQ61E9n+dxT4VZUxb9uxr8oP2NUtJj9jFKlnJGI7qmHaQTDBvD9FryzOOMcwj3liYroiqFH/335Zoi//TQ=
X-Received: by 2002:a17:907:2632:: with SMTP id aq18mr3193614ejc.445.1611827060831;
 Thu, 28 Jan 2021 01:44:20 -0800 (PST)
MIME-Version: 1.0
References: <20210128081030.2345998-1-hsiufangho@google.com>
 <CAMpxmJWMMMNYj-U3WXGBa2GOO1xLze44ABnxnBo6-owgUwWwog@mail.gmail.com> <YBJ/3UuIMyfjpMHg@kroah.com>
In-Reply-To: <YBJ/3UuIMyfjpMHg@kroah.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 28 Jan 2021 10:44:10 +0100
Message-ID: <CAMpxmJXejQjbR1qZEYTcyrFUYivJ5_U0Tchmh5V4ZqOi5NK=7A@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: Add permission to write_timeout
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jenny Ho <hsiufangho@google.com>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 28, 2021 at 10:12 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jan 28, 2021 at 10:04:42AM +0100, Bartosz Golaszewski wrote:
> > On Thu, Jan 28, 2021 at 9:10 AM Jenny Ho <hsiufangho@google.com> wrote:
> > >
> > > Need to change timeout time for different use
> > > cases to prevent I2C error cases. Open the api
> > > and allow Read/Write permission to write_timeout
> > >
> > > Signed-off-by: Jenny Ho <hsiufangho@google.com>
> > > ---
> > >  drivers/misc/eeprom/at24.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > > index 926408b41270..39caead4058c 100644
> > > --- a/drivers/misc/eeprom/at24.c
> > > +++ b/drivers/misc/eeprom/at24.c
> > > @@ -117,7 +117,7 @@ MODULE_PARM_DESC(at24_io_limit, "Maximum bytes per I/O (default 128)");
> > >   * it's important to recover from write timeouts.
> > >   */
> > >  static unsigned int at24_write_timeout = 25;
> > > -module_param_named(write_timeout, at24_write_timeout, uint, 0);
> > > +module_param_named(write_timeout, at24_write_timeout, uint, 0600);
> > >  MODULE_PARM_DESC(at24_write_timeout, "Time (in ms) to try writes (default 25)");
> > >
> > >  struct at24_chip_data {
> > > --
> > > 2.30.0.280.ga3ce27912f-goog
> > >
> >
> > IMO this should be a per-chip device property and not a global module
> > param. Any chance you could maybe try and extend the driver with a new
> > property for that?
>
> This already is a global module parameter :)
>

I know but if we're touching it, then better do the right thing. :)

> But I agree, having it per-device would be much better, a sysfs
> attribute would easily work for that.
>

I was thinking about a generic device property that could be set from
device tree etc. I doubt there's much need to change this at runtime
outside of development?

Bart
