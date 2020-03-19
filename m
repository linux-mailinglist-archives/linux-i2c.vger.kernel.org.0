Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E496418B053
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 10:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgCSJeX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 05:34:23 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44152 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgCSJeX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Mar 2020 05:34:23 -0400
Received: by mail-io1-f67.google.com with SMTP id v3so1481154iot.11
        for <linux-i2c@vger.kernel.org>; Thu, 19 Mar 2020 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gb+Hu2SOIKPJY/Vz+mWJKDkNWjSOJ21b6a2hQTXeX2U=;
        b=EaJZZHLrTg/Xg3DwuzO7ZLHnasImMWqUZq3XtfjrU3ib70FBurSvoS5tAJAXyEcX3/
         Uh+pqkrprKanbFhZdaaxOyL5M9ZcmZHqrFbhMcqIn9NWIjg6V75iPoOyi74NQtTfOJ6I
         2K1C13+/rOJwAXNQmC4d+im4a20hsmPXVkCxWNqPwXfpO0J/x/CybMyV+l2CHxJmKzJQ
         k6M1usphT+WsQ7y/RdlsU8qmIqEVEcTdKPjTUWfW80A/FAZ8fKrvN/T1rHDur/JUJhP4
         h89pRIRO8RpaWN219GZVWLibot6NGYhU5uHL8aZb0oESqkhKriFJbEXBMoUQ5oQ7iel7
         cfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gb+Hu2SOIKPJY/Vz+mWJKDkNWjSOJ21b6a2hQTXeX2U=;
        b=ZgSt6u5IIiYig7pD9VyFxwQ2vpzbnTuCypqATvgnauo6nxOjFlt8jnz3mS9yoc1GL/
         yctjhXUDKWaZyC0U0ICsb+36yCCfVDQcZys/zI/AuysRFsfTx3CAQNNvxtdAn61CMzeL
         SC54sFA6hS5dogYzGCkYpdCZ+/yLi+xXJ/2i/xCHDE7cH0mQ0mOxD33TuypVgB4a2bpy
         yQxjn+kT3lBK7Q1861BZryj+G81UonRlcPA+t4TnKRp0Ha3Tn0NiyHjgE+yJLXhE6D89
         Gmx1qBIYPwt5d/jJEY8amwkCpjvs7RhnQd0SMU5Di7AQQAB403kIswTooSkohO2461vG
         dMHQ==
X-Gm-Message-State: ANhLgQ2abzHTSuswvPYhXQMcfhQYTN8BJUOKoVyyWo7vkps65K3cx2fA
        E0iCFyCZ9G3fSqjiFu9yWoTEmLkEhpe7vkwXXNdoKQ==
X-Google-Smtp-Source: ADFU+vuUhvJVGEX39D3Xa4poIqSlRZgGmB32RkqmU0CatDgcyck7d8NsDNza563r8HZODFJPVO6z7T8q+elO36/D4io=
X-Received: by 2002:a05:6602:2098:: with SMTP id a24mr1820383ioa.101.1584610462152;
 Thu, 19 Mar 2020 02:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <CAKfKVtFf+VpinkOGsBFZ2-_PKvx-C1L7G7_uhY2RCvV5dy6L_w@mail.gmail.com> <AM0PR06MB5185E501349E06428093B62FD4F70@AM0PR06MB5185.eurprd06.prod.outlook.com>
In-Reply-To: <AM0PR06MB5185E501349E06428093B62FD4F70@AM0PR06MB5185.eurprd06.prod.outlook.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Thu, 19 Mar 2020 15:04:09 +0530
Message-ID: <CAKfKVtGSq5rJ0EvZgyg1Rw3=d5Q4ReJUYM7hTSTPP4sXaJyJTw@mail.gmail.com>
Subject: Re: [PATCH] i2c: xiic: Support disabling multi-master in DT
To:     Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
Cc:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jakko,

On Wed, Mar 18, 2020 at 10:19 PM Laine Jaakko EXT
<ext-jaakko.laine@vaisala.com> wrote:
>
> Hello,
>
> >> @@ -521,19 +523,26 @@ static int xiic_bus_busy(struct xiic_i2c *i2c)
> >>  static int xiic_busy(struct xiic_i2c *i2c)
> >>  {
> >>         int tries = 3;
> >> -       int err;
> >> +       int err = 0;
> >>
> >>         if (i2c->tx_msg)
> >>                 return -EBUSY;
> >>
> >> -       /* for instance if previous transfer was terminated due to TX error
> >> -        * it might be that the bus is on it's way to become available
> >> -        * give it at most 3 ms to wake
> >> +       /* In single master mode bus can only be busy, when in use by this
> >> +        * driver. If the register indicates bus being busy for some reason we
> >> +        * should ignore it, since bus will never be released and i2c will be
> >> +        * stuck forever.
> >>          */
> >
> >the other thing i was thinking how will multithreading .
> >Should we have a lock here.
> >
> >> -       err = xiic_bus_busy(i2c);
> >> -       while (err && tries--) {
> >> -               msleep(1);
> >> +       if (i2c->multimaster) {
> >> +               /* for instance if previous transfer was terminated due to TX
> >> +                * error it might be that the bus is on it's way to become
> >> +                * available give it at most 3 ms to wake
> >> +                */
> >>                 err = xiic_bus_busy(i2c);
> >> +               while (err && tries--) {
> >> +                       msleep(1);
> >> +                       err = xiic_bus_busy(i2c);
> >> +               }
> >>         }
> >>
> >>         return err;
>
> Which resource specifically are you worried about needing locking here?
>
Earlier multiple threads on the same processor will wait for bus busy.

Now my concern was

thread1 -> makes a transaction

thread2  -> this will not wait for bus busy and access.
