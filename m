Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D88C10A8F3
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2019 04:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfK0DAS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Nov 2019 22:00:18 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:43670 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfK0DAS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Nov 2019 22:00:18 -0500
Received: by mail-il1-f194.google.com with SMTP id r9so19615769ilq.10;
        Tue, 26 Nov 2019 19:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lw4cD3kutaFDVddLCV0RjxviVHYVABRcCS8zz30AG+0=;
        b=OouLQInOKxdSo4FTdg/pBT7Fpkk1edne0elU51TUMQZjVJKm7zPO5gCxM1OvtKBlU5
         v3lauUCs0ZwjrtIzn1kh0g7M2eGdbE6zIu2XYpbA2Ao/xx4I2M+ak8oZpQ1b6FCmI3oL
         ZOQ2Jnef5vyDbwLb0CSZhvMh94TiKtCFv9JIK+veM+V+Yg7xTwUbG5exFZRC1/9dW+ai
         LaZKYD6p7qFcOgtAl70qDVAqlDFfX5twFN7a9erlw2ZhitvxgUwevuLPf/ezBFurAsWg
         rrDhUtWR8x8Na3ZvS4FD0VwSITWKUEuwDtGTh7xdxYLv/lnSFo4tKje+X9nZmEcRo+2v
         /9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lw4cD3kutaFDVddLCV0RjxviVHYVABRcCS8zz30AG+0=;
        b=Pi/x5bixw8fKR3zIOzE7lGHioIndnYW3z/Lf3keI0fbMnMCU65B5CwK5xW2J4Y2IbS
         OZHAicT/zLwPfX/eV0xz8H9v6ILJbAMjWZFSnI+UEL4UfGFU7i6NQNM3OTp+wxhNTvFb
         pl9j3ZswtcVyzZ8/ajGgN6rgTPgE3XyDlEBmvvRh1WLuGTntQZ31A1rYZJn6IKl0/EuY
         tLlA7ggYTpSizDcpf2ZyAecaA7PUv2L8FQdYJ2q0T6Y+VXtyxfbw1/C+2mtd+k+CsT5T
         puOHvKfg9W0orrJGJ2GD/JxUlfvO/mzL50jnG+n3AjlZ6gp1hcxHoTb/fidnISLfvwLz
         7huw==
X-Gm-Message-State: APjAAAXMq1+UkXs/k0sNAbqFu7DfkWr6WEkC0+lhphYFMLKljHkrPvTa
        wlEnItYrQvCHwcKJwjw9b1ecImuN+WaeVTwm5j28cEdaFEY=
X-Google-Smtp-Source: APXvYqwyCmvjyH63xSGHWUUd6kRK418eApS3s0JA5VWS0Cx+dj4KmScQLo4MuMuhkKyqT76Sytp9I1lJvZbCCtEqRA4=
X-Received: by 2002:a92:7949:: with SMTP id u70mr33215605ilc.42.1574823617736;
 Tue, 26 Nov 2019 19:00:17 -0800 (PST)
MIME-Version: 1.0
References: <1574162632-65848-1-git-send-email-mine260309@gmail.com>
 <20191125144857.GA2412@kunai> <20191126115243.673fc164@endymion>
In-Reply-To: <20191126115243.673fc164@endymion>
From:   Lei YU <mine260309@gmail.com>
Date:   Wed, 27 Nov 2019 11:00:07 +0800
Message-ID: <CAARXrtkcr+OALyXW75t9WAifmn1aMPqtVgS7fEb6d_i0F9XdRw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: i2c: Fix return value of i2c_smbus_xxx functions
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 26, 2019 at 6:52 PM Jean Delvare <jdelvare@suse.de> wrote:
>
> On Mon, 25 Nov 2019 15:48:57 +0100, Wolfram Sang wrote:
> > On Tue, Nov 19, 2019 at 07:23:52PM +0800, Lei YU wrote:
> > > In i2c/dev-interface.rst it said
> > >
> > > > All these transactions return -1 on failure
> > >
> > > But actually the i2c_smbus_xxx functions return negative error numbers
> > > on failure, instead of -1.
> > >
> > > Fix the document and remove the following sentence.
> > >
> > > Signed-off-by: Lei YU <mine260309@gmail.com>
> > > ---
> > >  Documentation/i2c/dev-interface.rst | 9 ++++-----
> > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/Documentation/i2c/dev-interface.rst b/Documentation/i2c/dev-interface.rst
> > > index 69c23a3..f2f2b28 100644
> > > --- a/Documentation/i2c/dev-interface.rst
> > > +++ b/Documentation/i2c/dev-interface.rst
> > > @@ -163,11 +163,10 @@ for details) through the following functions::
> > >    __s32 i2c_smbus_write_block_data(int file, __u8 command, __u8 length,
> > >                                     __u8 *values);
> > >
> > > -All these transactions return -1 on failure; you can read errno to see
> > > -what happened. The 'write' transactions return 0 on success; the
> > > -'read' transactions return the read value, except for read_block, which
> > > -returns the number of values read. The block buffers need not be longer
> > > -than 32 bytes.
> > > +All these transactions return a negative error number on failure.
> > > +The 'write' transactions return 0 on success; the 'read' transactions
> > > +return the read value, except for read_block, which returns the number
> > > +of values read. The block buffers need not be longer than 32 bytes.
> >
> > I think the correct solution is to remove this paragraph entirely.
> > Because the returned value does not depend on the kernel but on the
> > libi2c version. Check this commit from 2012 in the i2c-tools repo:
> >
> > 330bba2 ("libi2c: Properly propagate real error codes on read errors")
> >
> > So, I think we should document it there. Jean, what do you think?
>
> I would go further and move half of the document to i2c-tools. i2c-dev
> itself only provides the ioctls. Everything on top of that is in libi2c
> now, so the kernel documentation should point to libi2c and the
> detailed documentation should come with libi2c.

Yeah, I sent the patch to simply fix the "return -1" issue, which is misleading.
But if the whole paragraph or the whole document is not valid anymore,
it needs to be fixed.

>
> So I guess I should review the whole document now to see what needs to
> be updated, what should stay, and what should move.

Thanks, please help to fix the whole document so that others get the
correct information :)

>
> --
> Jean Delvare
> SUSE L3 Support
