Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71B6307268
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbhA1JPX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:15:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:50620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231845AbhA1JMn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 04:12:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C89D664DE2;
        Thu, 28 Jan 2021 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611825121;
        bh=V0gFBUmlQ3mUq1LhdKTMEyJZFGxdd6qNoJjRUhrIJeU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MoUJRBgpNYBrcHaoC9XIwU8/GZtvNJcr+Xut3aR8CHSxuojiwW+h3GZo76jopEyDk
         Y9Wwupg72Rdx7Jyq20vI/E5luNttcZamdbZwozRJtBQP2sa0NbvtZfRVXY7VLUpooa
         XP699CHI6Zh03olf/65nceNmyjgi3PkTj7feoRh8=
Date:   Thu, 28 Jan 2021 10:11:57 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jenny Ho <hsiufangho@google.com>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] eeprom: at24: Add permission to write_timeout
Message-ID: <YBJ/3UuIMyfjpMHg@kroah.com>
References: <20210128081030.2345998-1-hsiufangho@google.com>
 <CAMpxmJWMMMNYj-U3WXGBa2GOO1xLze44ABnxnBo6-owgUwWwog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWMMMNYj-U3WXGBa2GOO1xLze44ABnxnBo6-owgUwWwog@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 28, 2021 at 10:04:42AM +0100, Bartosz Golaszewski wrote:
> On Thu, Jan 28, 2021 at 9:10 AM Jenny Ho <hsiufangho@google.com> wrote:
> >
> > Need to change timeout time for different use
> > cases to prevent I2C error cases. Open the api
> > and allow Read/Write permission to write_timeout
> >
> > Signed-off-by: Jenny Ho <hsiufangho@google.com>
> > ---
> >  drivers/misc/eeprom/at24.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 926408b41270..39caead4058c 100644
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > @@ -117,7 +117,7 @@ MODULE_PARM_DESC(at24_io_limit, "Maximum bytes per I/O (default 128)");
> >   * it's important to recover from write timeouts.
> >   */
> >  static unsigned int at24_write_timeout = 25;
> > -module_param_named(write_timeout, at24_write_timeout, uint, 0);
> > +module_param_named(write_timeout, at24_write_timeout, uint, 0600);
> >  MODULE_PARM_DESC(at24_write_timeout, "Time (in ms) to try writes (default 25)");
> >
> >  struct at24_chip_data {
> > --
> > 2.30.0.280.ga3ce27912f-goog
> >
> 
> IMO this should be a per-chip device property and not a global module
> param. Any chance you could maybe try and extend the driver with a new
> property for that?

This already is a global module parameter :)

But I agree, having it per-device would be much better, a sysfs
attribute would easily work for that.

thanks,

greg k-h
