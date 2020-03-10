Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAA217F929
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 13:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729355AbgCJMyZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 08:54:25 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36029 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729350AbgCJMyX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Mar 2020 08:54:23 -0400
Received: by mail-qk1-f193.google.com with SMTP id u25so12557091qkk.3;
        Tue, 10 Mar 2020 05:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4gPRUE/8c5unfeblSQvhYpKxeSuVZhZNXJJMTut3+xc=;
        b=XkznGvkaYBTUY217XQ+/JcQlXuOsrjWrLd6qvYVsRlLicZNCjg+d1sTOEeWvFDBjed
         ZUQFiYxNYCClkr65W3vIB7yabWXsorUCj9aoLmomRhnyGmNzS97zSfSpHywipgu2WlML
         5GQjtgI93aBcWLFmFWtro9CmlXquwSClaP6pI8JhmVxxHoD+ywnBhYIi0tL5byG53uHe
         HOh3OK35wClm2ks6crxtZTJmPM1XzoHgk/pmQ3S/3FEKsFWVaHcUpEs4Li1XwIw9Eij7
         l3eZfqtzF8TEb9w+VUtY2cK+IIlD/WcB23bnYGWkxIH/bCgp91JtqG+n3saW1kbB6HGz
         07jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4gPRUE/8c5unfeblSQvhYpKxeSuVZhZNXJJMTut3+xc=;
        b=NCOg7YCbAvKQHwGhs0qvOzf8I6su65P9a+E50imI6lUwlMGid9USmjS/APlZTv8ryO
         /Hqr4Xey0NxaRPqZ36fvuaccNRHFNDrxsTW5fk8wpwkjwf7fMskYucrWRQwkhhm+fNmz
         FV5zpvm5f9kO8sFTNTGwfnTNPhRAH2OdMiCHF/N+9xzas4BHvucVLUcMQxpX7KTJqDCz
         WyG5UUC5pp+XFDgiYWkwsh/b+8tkclRvSvoVUBBk7diP9/SnbwqrexK7jXksmUvlxKkW
         /b4Z2jflslLdcAvgX2U58uooGyKdXcrN6XdFJtUXE9w+OOpEAJO+diuVUE0stslIptNi
         PwrQ==
X-Gm-Message-State: ANhLgQ1nKO/VtkW8wHApSt5FV8XxvnIp7vwnkHYiOgl/sxeW3uEpW1J8
        UxrRV73nXNdp4X78621mjbjYSpoYjm8Nfa37+Pg=
X-Google-Smtp-Source: ADFU+vvDgu6r2lvGrzD+aENtSuJiR4ntDHyMa/Gp9A1Gub6RnDjugtxTlXjHNfyjGwMDnaqFEam8O6u6HzvTy4j0zEU=
X-Received: by 2002:a05:620a:22cd:: with SMTP id o13mr10800851qki.160.1583844862180;
 Tue, 10 Mar 2020 05:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <1580185137-11255-1-git-send-email-gupt21@gmail.com> <20200310122934.GA13896@ninjato>
In-Reply-To: <20200310122934.GA13896@ninjato>
From:   rishi gupta <gupt21@gmail.com>
Date:   Tue, 10 Mar 2020 18:24:10 +0530
Message-ID: <CALUj-guKqkRKVKDa1U+gv0rLx23zc5cFT3Qnakp4muk9LSUYfQ@mail.gmail.com>
Subject: Re: [PATCH v3] HID: mcp2221: add usb to i2c-smbus host bridge
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        wsa+renesas@sang-engineering.com,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I will send two more patches in sometime.

Patch 1: Define i2c_adapter_quirks to let i2c core check msg's order,
type and length
              As of now this driver itself is doing this sanity.

Patch 2: Add support for GPIO functionality

On Tue, Mar 10, 2020 at 5:59 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > +     if (num == 1) {
> > +             if (msgs->flags & I2C_M_RD) {
> > +                     ret = mcp_i2c_smbus_read(mcp, msgs, MCP2221_I2C_RD_DATA,
> > +                                                     0, 0, NULL);
> > +             } else {
> > +                     ret = mcp_i2c_write(mcp, msgs, MCP2221_I2C_WR_DATA, 1);
> > +             }
> > +             if (ret)
> > +                     goto exit;
> > +             ret = num;
> > +     } else if (num == 2) {
> > +             /* Ex transaction; send reg address and read its contents */
> > +             if (msgs[0].addr == msgs[1].addr &&
> > +                     !(msgs[0].flags & I2C_M_RD) &&
> > +                      (msgs[1].flags & I2C_M_RD)) {
> > +
> > +                     ret = mcp_i2c_write(mcp, &msgs[0],
> > +                                             MCP2221_I2C_WR_NO_STOP, 0);
> > +                     if (ret)
> > +                             goto exit;
> > +
> > +                     ret = mcp_i2c_smbus_read(mcp, &msgs[1],
> > +                                             MCP2221_I2C_RD_RPT_START,
> > +                                             0, 0, NULL);
> > +                     if (ret)
> > +                             goto exit;
> > +                     ret = num;
> > +             } else {
> > +                     dev_err(&adapter->dev,
> > +                             "unsupported multi-msg i2c transaction\n");
> > +                     ret = -EOPNOTSUPP;
> > +             }
> > +     } else {
> > +             dev_err(&adapter->dev,
> > +                     "unsupported multi-msg i2c transaction\n");
> > +             ret = -EOPNOTSUPP;
> > +     }
>
> Have a look at struct i2c_adapter_quirks and especially the flags to let
> the I2C core do the sanity checks from here.
>
