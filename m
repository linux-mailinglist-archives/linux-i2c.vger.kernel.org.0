Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7186C403D2A
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Sep 2021 17:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349647AbhIHQAW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Sep 2021 12:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349588AbhIHQAW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Sep 2021 12:00:22 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C801C061575;
        Wed,  8 Sep 2021 08:59:14 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id q3so3605296edt.5;
        Wed, 08 Sep 2021 08:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L2FGV4xX0qJO8HXkkJYhLo4u/HNi1p+BxF7GSI6p3HU=;
        b=jGNJzL2JmM0Tmv80D16bSeO9+mm4X52DgIzWBSz+rc3aITc94NrBPbqP7kBfzXiOtA
         xim6iMdRe00gHkCIQztBO2+hI+shv4EVtQGTsd66jzO6uz1zUWesYB+OYOcbxw8KunfK
         B8w5AfhAVLKTk28cIL/R3ZF6je1+wv5uCsmQIhlu2E53z4Gt+skDMDAS3WqIB4yutF+i
         oyN0nPskdr7WLpn4rVvuApk34GUIkgRIUxy6gHnd6zZMQI4sswt8fidx6YSZ83TtC3GZ
         WLdNny5Y4NqEZeoYgKrbs+icytDpio5eTmeNquPOBa+KX1Vi3jO0ox827XhUTiQZjj9n
         tnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L2FGV4xX0qJO8HXkkJYhLo4u/HNi1p+BxF7GSI6p3HU=;
        b=YEB3zyNPZ/i0lrdcIL7hWsyEPWS4fQFKOjMe66t+Mu84ucpJpcMlY5bhos37yqxeMV
         vKwBrhHbTKpDw0w1CK7jlJ71H0ls3HX/MumSbqxQOfhZZrGDgJ2NKYYjonhqANCEkVTs
         Dxh1x1wJJ50Se4DJ26zFkttgG+wXtE3tDV1MsSKDMCsXgmYjkL7qSzJVvkZ5mnQ3pBAg
         Gcu5CJHnxdlUF89Ka8sSWr1iBX6hsnTgqsVcKI+IIIi+p64S5PLXi7sikOYVtSDvJUA0
         okGhKtSnxi/KiueyjPG/c2waC5TUAClnzUPPmqSBLtjPykolvDPnpJPD0ixSGlgYlcf+
         jz+g==
X-Gm-Message-State: AOAM53138XTgcM8dHEmH85DZG0oS2lD0l0+XV+eY6D5goYzmDiFeBhrj
        42r4rb4e946I4+ktm8LfCSadtELfpCkelkWgSqQ=
X-Google-Smtp-Source: ABdhPJye/cXSL48B7KHBiFGP1mWz+xme7DlTMb7OPdhcYX+VYOtAXxdyJIxIuhRAzXlAotwDDGKOY/1L9VpjjKej7Bg=
X-Received: by 2002:a05:6402:5242:: with SMTP id t2mr4548999edd.240.1631116752742;
 Wed, 08 Sep 2021 08:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210822184927.94673-3-jacopo@jmondi.org> <20210823073639.13688-1-jacopo@jmondi.org>
 <20210829175413.7ce30bfa@jic23-huawei> <20210830162051.rjqlhwvtguaivt3p@uno.localdomain>
 <20210830181117.6808f085@jic23-huawei> <20210831074011.d6f5rsix2mgxqba5@uno.localdomain>
 <20210905110429.34763e30@jic23-huawei> <5e9dce02-2884-d91e-78ef-da2f32258ea3@axentia.se>
 <20210908110019.kocdmytczyykcqfh@uno.localdomain> <6f43a6d4-93ef-4cb0-27fe-cb70c1f43a9c@axentia.se>
In-Reply-To: <6f43a6d4-93ef-4cb0-27fe-cb70c1f43a9c@axentia.se>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Sep 2021 18:58:33 +0300
Message-ID: <CAHp75VfnrJeN2DgJ=C6uiSh2E-VaciA1yd_zqhtaG4E6C0xazg@mail.gmail.com>
Subject: Re: [PATCH v3.1 2/3] iio: chemical: Add Senseair Sunrise 006-0-007 driver
To:     Peter Rosin <peda@axentia.se>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-iio <linux-iio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 8, 2021 at 6:29 PM Peter Rosin <peda@axentia.se> wrote:
> On 2021-09-08 13:00, Jacopo Mondi wrote:
> > On Mon, Sep 06, 2021 at 01:03:52AM +0200, Peter Rosin wrote:

...

>         struct i2c_msg msg[3] = {
>                 {       /* wakeup */
>                         .addr = 0x68,
>                         .flags = I2C_M_RD | I2C_M_IGNORE_NAK,
>                         .len = 0,
>                 }, {    /* write register number */

I'm wondering if device will have enough time in between to actualle
be woken up. I believe the waking up latency must be considered as
well as known 15ms suspending one.

>                         .addr = 0x68,
>                         .flags = 0,
>                         .len = 1,
>                         .buf = &reg,
>                 }, {    /* read register contents */
>                         .addr = 0x68,
>                         .flags = I2C_M_RD,
>                         .len = 17,
>                         .buf = buf,
>                 },
>         };

-- 
With Best Regards,
Andy Shevchenko
