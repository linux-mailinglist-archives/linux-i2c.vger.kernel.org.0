Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9FE234B90A
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Mar 2021 20:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhC0TEI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Mar 2021 15:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhC0TEG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 27 Mar 2021 15:04:06 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CE4C0613B1;
        Sat, 27 Mar 2021 12:04:05 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id g10so2488144plt.8;
        Sat, 27 Mar 2021 12:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lgsshcy+PsZ/t9rqTgUoGAndFmeOd2wa5s6j7My/YTA=;
        b=pQT7TcXMOHGICKerXNSBa+xxkw/xrKtQw251ZL5CAATNnW0FoHIRmnLpe10KOXjJis
         ZL5QbuCnxoXtzW89bJP2JZTNmm94/p2/sLMcTTe0RxsH0OSG+vftRj8MYizEfQCmVSKR
         iEDoGT6S32NgWDrGCXVOLKpV+EjJrg3X/HvlcnOmoUXAahasnAi7Ydnu0dZ1w4vX5gnG
         IjcSBuDh/0ESt0d8JqRWdYD+1CQCaCvFXyuJzzXhzh77KfmmbUsHUvWpjyKWsVhSHYm0
         DtV7EiCAX4cuby4g09i9wzqNV6DOiXPMGK1b90FkMUs9Js/WQYxZFfDfzSsib89TCJiy
         ZEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lgsshcy+PsZ/t9rqTgUoGAndFmeOd2wa5s6j7My/YTA=;
        b=lJkB7m+6aecOi/JIXB8EcWXfcIfVXbTvIiyitIxHG9qd5iMxnrIfkr3/Lm4EMTefLA
         2OtaQoGL5kPHbrCqGs9SUwk0TiPpkCrQry11AE4xmRNVPHg7r4cx11en7/+97tOeG65O
         XWRJSplclCjQElgBqUoB9227kqnlFdExgHfAZ1AxLAkI2J6Lzmi2lfGisrgxJwlfTV8a
         VMVH0x3VEPEZbCwH+h57I+osnZb+RelszP6Hqi4ZCiuQOiRZj5+mwUXWEUHGeO6j8UDR
         5y1V6NkNsfMWYep9wTMikWjj2Hy+Zv84YHWRHu0WkR/XMTjvU5h8hcqoEmvuwrKhAJqT
         msJQ==
X-Gm-Message-State: AOAM531py2jsc20EdtO5LlXkeHdIWCNsmP4ACsxXhAkJHAo4jp9AoZhI
        BJ3HTiBuiR/ld+U4vKWzopniyU6H4MuDC7vSjKSUb2mJOrdFag==
X-Google-Smtp-Source: ABdhPJwWWAWYeX0yssVIrUN/WlAWPUlnyB6RVJzIfbruka0K6ISBBjj5Vs6xonzW/td/AVeP0NFUsnFcy2a28MoQ4sI=
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id
 z2-20020a170902ee02b02900e65397d79cmr21325737plb.21.1616871845247; Sat, 27
 Mar 2021 12:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210325151248.1066643-1-daniel@qtec.com> <YFyvh3sqyVcg8Iqj@smile.fi.intel.com>
 <CAH1Ww+Qs13GBC02PCgW60No2Z+vNsV14yRe7S4rtnnMLqH7BYQ@mail.gmail.com>
 <YF3TUhGEjrQyG5UU@smile.fi.intel.com> <CAH1Ww+Q8-YD_jc5Pkk3PG4M5vCiisnbpmd2zx0GQsaa_=si0ig@mail.gmail.com>
In-Reply-To: <CAH1Ww+Q8-YD_jc5Pkk3PG4M5vCiisnbpmd2zx0GQsaa_=si0ig@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 27 Mar 2021 21:03:48 +0200
Message-ID: <CAHp75Vf=kL7sKrRG4HCD9AT0zzsOEHHT4=CpZV7Z7B8mX64ubw@mail.gmail.com>
Subject: Re: [PATCH] i2c: designware: Add base addr info
To:     Daniel Gomez <daniel@qtec.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Mar 27, 2021 at 8:18 PM Daniel Gomez <daniel@qtec.com> wrote:
> On Fri, 26 Mar 2021 at 13:28, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Mar 26, 2021 at 11:35:08AM +0100, Daniel Gomez wrote:

...

> > It's a good question. On one hand we know that resource_size_t is a simple
> > redefinition of phys_addr_t, but it might be changed in the future. OTOH,
> > struct resource has types of resource_size_t. In any case it's a type that is
> > platform dependent (like long, size_t). Hence, the special specifier is needed.
>
> This 'issue' occurs in other subsystems like iio but I can see the
> patches are quite old in comparison with the i2c-tegra one.
> Also, the same happens when they print the variable (wrong specifier).

Now since you have better understanding you may clean those up!

-- 
With Best Regards,
Andy Shevchenko
