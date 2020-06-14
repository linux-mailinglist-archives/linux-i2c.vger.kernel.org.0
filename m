Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9111F8824
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 11:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgFNJfD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 05:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgFNJfD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 05:35:03 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA327C03E969;
        Sun, 14 Jun 2020 02:35:02 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id u5so6284116pgn.5;
        Sun, 14 Jun 2020 02:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VKQ+8f2oANWDrsRPwgbeAooMgImIhjiWyL6tb/ZNJwg=;
        b=FRY0wXHryPnrpx+weUkFAhSaO2go/TxgvLOd90q7fyn2iSXm+6EI8exo+UPKuPgmHX
         3LCZmXLghaqoG9wJS4Zp8XJVdfG34vYv9bKnHpqfEPD72GyhpKIq+Kq9WMGQegA9zBaj
         IRRUFfwfMp1h/XBJKLP8EpZ6Wn1xG0kCrnkjXdoPgn3SCZmjRGGbksU8fnDMFwL9C/1j
         DyIB3QblMCsuacZQ8Bw5JjsVw9TmFQIaz4YsvXAZYdzyaUCb2tL+b42EjKmHAItOv/T2
         4eCjX1FnhTdtcGy7lNNe5VuELBk0qkNyrW17Mv/wZ5/kLp+78gg4PCfoEvUVYWurJKco
         yfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VKQ+8f2oANWDrsRPwgbeAooMgImIhjiWyL6tb/ZNJwg=;
        b=cX3BJnIUNwCQHMBvJ7PIzCgDm8j4k9aHupuYUomDYEgDuzK8Dztm4/vTC+7Rh9DD+x
         DYwVvJWh5haIP6soLwDLCsUjcgbHJroTPZLAYTRoyuRqaVgUqJZFOiiFnLBQaZJWrRCu
         bSXczDqeEd9Jdgz6oWBLCYbMf9Hv6YBjCjSrKLbJWN4Z1xaWCTmsts9nJVY5gMm6FmRi
         i4y/o6Ygyrii9b67aIKBA7A/dRXXXVaBu35mQP0agamlMhisO9FHXW8L2gjMUHodAHkQ
         aLly7RNdBoNt6F30x138AAvA/hgcdIWEmZultujCJH7ywlGLZbTyUdum9a3xAsMcDfhR
         dBvQ==
X-Gm-Message-State: AOAM533Ka5BKyhFZJ7gQ2KA3c/dClIHUkNwn000MsqgXWQ+zPXHEqVYP
        gSEBbbCnuQXh4/po6TNyrbX1jretLuvXrX4KUvw=
X-Google-Smtp-Source: ABdhPJwxE9Cfu4p9MCcwtwkYi/z9aS3PU4hXscagiSNnvzkgEESfhi6hxoh0mnOm0UOM2oHd9cLvduL11vw2H4f0bow=
X-Received: by 2002:a62:5284:: with SMTP id g126mr12615581pfb.36.1592127302057;
 Sun, 14 Jun 2020 02:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200614090751.GA2878@kunai>
In-Reply-To: <20200614090751.GA2878@kunai>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 14 Jun 2020 12:34:45 +0300
Message-ID: <CAHp75Vc2RV1daOHMM1zAT2P_YpFzYq=_NVXnagq7qBCS9En04g@mail.gmail.com>
Subject: Re: RFC: a failing pm_runtime_get increases the refcnt?
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jun 14, 2020 at 12:10 PM Wolfram Sang <wsa@kernel.org> wrote:
> both in the I2C subsystem and also for Renesas drivers I maintain, I am
> starting to get boilerplate patches doing some pm_runtime_put_* variant
> because a failing pm_runtime_get is supposed to increase the ref
> counters? Really? This feels wrong and unintuitive to me.

Yeah, that is a well known issue with PM (I even have for a long time
a coccinelle script, when I realized myself that there are a lot of
cases like this, but someone else discovered this recently, like
opening a can of worms).

> I expect there
> has been a discussion around it but I couldn't find it.

Rafael explained (again) recently this. I can't find it quickly, unfortunately.

> I wonder why we
> don't fix the code where the incremented refcount is expected for some
> reason.

The main idea behind API that a lot of drivers do *not* check error
codes from runtime PM, so, we need to keep balance in case of

pm_runtime_get(...);
...
pm_runtime_put(...);

> Can I have some pointers please?

-- 
With Best Regards,
Andy Shevchenko
