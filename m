Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC498F2789
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2019 07:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfKGGNV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Nov 2019 01:13:21 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45259 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfKGGNU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Nov 2019 01:13:20 -0500
Received: by mail-ed1-f66.google.com with SMTP id b5so884968eds.12;
        Wed, 06 Nov 2019 22:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b6XwzsC8T7k6SsHnaEqnkGYpU/j8kgJJS6Ga6U3GP2U=;
        b=VIWMNYO2uJZ/ucdnjhZQPeoGhFSDz7GxnECCBYJyaZJo/aA767Fx5wQZ4G/kd3863l
         WR+hwk509J/YPOvBRlwBfmWKJc4lub6uj+fHcMJDnxPfKLwVzsJP8m9F7TgmUe/ySThl
         zbAwfLtePYTJyT8qGRn6P+d2j3706q2iMY1q841WLX7iBaLfO1hd2p5HJoao2wa4QT0X
         mnASaMI2n5wraePRgoghikEcm95gEjyWQFfZjxHckPpJyD0HOlrKPZ9kSryeA/OA7uq1
         bvA/UwDlyJOredDzeHpZaB4mqzuryo+geg847EC/h+YGoK2FAL2fPej4N0lfUZPjkPIa
         2GRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b6XwzsC8T7k6SsHnaEqnkGYpU/j8kgJJS6Ga6U3GP2U=;
        b=lDTFys77s5QZksQoW1+vVyuWiKK6E79z7UTuaPThYeg7YbOkWlMI8t4iDEhFfZjFlf
         A6YxEK8HqCH5z0QwHmfwQTm8n7a1RNQIRjEXnQuInAT9KXaUiu5ceL9eNiIzS+2KiiYH
         8lk4hZOJRNU+TDLmkjQStrJetM+Bc6qHF2lSfX81Ys6IP6gCze7a/E6KjZQTtX/XsYHg
         THAsVfHyN9+Ft2cYciwRI7nSClWzxVvSJ7mrPz9/iVFqFswkuyiiuyFoLIJUGj5Nxwzi
         0QFnlbBozMDBQzFxEwTuaWfFQN1rKLLkl32ZZASaYGJ1/E7z4jsqFK99ohjPHORcOAni
         25iw==
X-Gm-Message-State: APjAAAXJL9vdiJv9Xc+N1rbvLNV8GcTM71tfPU5k/3DYI7iQoAGXK7Au
        WMJcyMTH2hu8mdhrIlKnW8vfJDZjMp/LvIF1A6Q=
X-Google-Smtp-Source: APXvYqxj/w79RiUGYwYctucmAuZQHkD9r7iRqtiJ1jcGgNDephBLrz0OaK8DOQ1VZYQaV1p3rxYY1qHMkE/UXCrdf8s=
X-Received: by 2002:a17:906:698b:: with SMTP id i11mr1353680ejr.97.1573107198964;
 Wed, 06 Nov 2019 22:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20190219012447.5900-1-sxauwsk@163.com> <CAKfKVtEwHcydp=+hNhG91h3qbMoYOPq7jEYjbuAVrWXT53DC3Q@mail.gmail.com>
 <2019110516474778997625@163.com>
In-Reply-To: <2019110516474778997625@163.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Thu, 7 Nov 2019 11:43:07 +0530
Message-ID: <CAKfKVtH8OvA9Hku8V2CxRkX8hiouLzsEJTTDQWgBtQF8PGXyBQ@mail.gmail.com>
Subject: Re: Re: [PATCH v2] i2c: cadence: try reset when master receive
 arbitration lost
To:     "sxauwsk@163.com" <sxauwsk@163.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Shikai,

On Tue, Nov 5, 2019 at 2:18 PM sxauwsk@163.com <sxauwsk@163.com> wrote:
>
> >Hi Shikai,
> >
> >On Tue, Feb 19, 2019 at 8:19 AM Shikai Wang <sxauwsk@163.com> wrote:
> >>
> >> When the adapter receive arbitration lost error interrupts,
> >> cdns_i2c_master_xfer return to the caller directly instead of resetting
> >> the adapter which resulted in the adapter being out of control.
> >>
> >> So when driver detect err_status such as arbitration lost,
> >> then try to repair and fix it.
> >>
> >I am missing the issue that you are facing.
> >You are having a multimaster scenario and getting arbitration lost.
> >
> >the current code would attempt a retry did that lead to any issues?
> >
> >Can you explain the issue that you are facing?
>
> Of cource,  The following describe my situation.
>
> In my product,  Touchscreen connect to zynq-7000 XC7Z010 by i2c bus( Just connect only one i2c-device of touchscreen),
> when user tap Touchscreen, Touchscreen interrupt send to CPU and notifyed i2c-driver to obtain location data by i2c-bus,

So it is single master single slave.
>
> when Tap the screen frequently,  sometimes CPU get interrupt from touchscreen and try to obtain data,  then detect arbitration lost,
the arbitration lost is surprising in non-multimaster scenario.
Is there any other master in the configuration that we may not be triggering.
Or can  you probe the lines?

> Although i2c-driver try three times,  it's useless.

You get bus busy? what is the issue.
>
> Actually i2c clock-line and data-line keep high, that mean i2c bus free.
> Once this situation occur, i2c-control did't work anynay but cpu receive interrputs still.
>
> I am sorry that I have't found a good solution for this issuse;
