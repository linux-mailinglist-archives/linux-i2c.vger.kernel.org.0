Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D5E1F8831
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 11:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgFNJnR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 05:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgFNJnQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 05:43:16 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E177C03E969;
        Sun, 14 Jun 2020 02:43:15 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id h10so2544333pgq.10;
        Sun, 14 Jun 2020 02:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c4ITETWel1nh6WkDgCFbqSZSx7+aV6bKI8KvrZbuTzE=;
        b=b1HebKnGC0QQAwhONczWtBrhC9j4bjcKBKCs2f8qgO9d1YhXJmhIINIRD2n0x3uw/6
         0VfKDYttWaHsyt+V9N3rgHEvfh0whT2R9oGw50B7OZrGaJsyYX9C0SDIOQ7yJ9c9l+1d
         Ap9wu9811rognik+khYYmjUUdG8K7EY+vpZO5C9pAw8H/G2aq7vzLl6993gbctwz1CpC
         QkDIiFZzTtY7nzMQ6R5z+xEx/c1qrjkMEGgCzHE94mNtDCV062tZ3qCFOKhs++ccxbQB
         jJgIuRVVnQLQ5gxbjbe/iZEfNoj3bgg9ZCJGghMcl2svy8ltovyV+Wa1ZFwira17WtTF
         5IJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c4ITETWel1nh6WkDgCFbqSZSx7+aV6bKI8KvrZbuTzE=;
        b=rGTNlAehpSJqVikp7lzRIGU+RJ0VTTdkwG8np4Ql+XtW8ED6yZlWCpcJcrce3tzcTa
         CKDw9pq1wn1drOONsUjoKDj3eGjcKfWjv9Sv1ceCz2+jZNwkULBPONBI+wdLidtDiax/
         g94yiNq+wiakzsWHbvZD5DZ09eJNYHvfcCipECA6dPCBHLHsE4R2Bl8SpJOIv52i43u7
         Jw+FYbolQqodHXW2v11Q8KHAWY4IINyukgGRPlujKUF62kc/jbSh6z4M7VZAeW/u8EAo
         HSTSDCUmojX2UApm+IO+bulH3X9THVNM0gqD0+SmG3NWrT4EkdN5ULUXiqtbxO2IqxM4
         sqFA==
X-Gm-Message-State: AOAM5335qEREfIsFgNOc80c3D721IIsNM2ikm0XnPKDKeyV9LwyXFaVF
        VsqQGliGTvsBmaFx33gdj9kWKu48tSMSCX0R73g=
X-Google-Smtp-Source: ABdhPJySrUoUQVbdT4SP2sf0la+aHsR0e6tBCx175n8MjQEu80ssnTUIw8nm21kltD+udEP+12BObF2YfK1IbhsM/9M=
X-Received: by 2002:a63:f042:: with SMTP id s2mr861874pgj.4.1592127794761;
 Sun, 14 Jun 2020 02:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200614090751.GA2878@kunai> <CAHp75Vc2RV1daOHMM1zAT2P_YpFzYq=_NVXnagq7qBCS9En04g@mail.gmail.com>
In-Reply-To: <CAHp75Vc2RV1daOHMM1zAT2P_YpFzYq=_NVXnagq7qBCS9En04g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 14 Jun 2020 12:42:58 +0300
Message-ID: <CAHp75VdtJN4KbsWgP3G40P4giPGgPE6gdr0CDqOXQjp2wK+i+g@mail.gmail.com>
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

On Sun, Jun 14, 2020 at 12:34 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Jun 14, 2020 at 12:10 PM Wolfram Sang <wsa@kernel.org> wrote:
> > both in the I2C subsystem and also for Renesas drivers I maintain, I am
> > starting to get boilerplate patches doing some pm_runtime_put_* variant
> > because a failing pm_runtime_get is supposed to increase the ref
> > counters? Really? This feels wrong and unintuitive to me.
>
> Yeah, that is a well known issue with PM (I even have for a long time
> a coccinelle script, when I realized myself that there are a lot of
> cases like this, but someone else discovered this recently, like
> opening a can of worms).
>
> > I expect there
> > has been a discussion around it but I couldn't find it.
>
> Rafael explained (again) recently this. I can't find it quickly, unfortunately.

I _think_ this discussion, but may be it's simple another tentacle of
the same octopus.
https://patchwork.ozlabs.org/project/linux-tegra/patch/20200520095148.10995-1-dinghao.liu@zju.edu.cn/

>
> > I wonder why we
> > don't fix the code where the incremented refcount is expected for some
> > reason.
>
> The main idea behind API that a lot of drivers do *not* check error
> codes from runtime PM, so, we need to keep balance in case of
>
> pm_runtime_get(...);
> ...
> pm_runtime_put(...);
>
> > Can I have some pointers please?
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
