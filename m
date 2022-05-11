Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC9EB523C2B
	for <lists+linux-i2c@lfdr.de>; Wed, 11 May 2022 20:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345057AbiEKSCX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 May 2022 14:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbiEKSCS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 May 2022 14:02:18 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8578381991;
        Wed, 11 May 2022 11:02:17 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id z19so3485606edx.9;
        Wed, 11 May 2022 11:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WXSifZkVMNKJIWFI2353UCu3hiqezZq+FGcwxX96rkU=;
        b=G+0Za8nPUrc8M0fsDLPxGWlmEaKAp942tfzktpszcavil+hsJTVX794SkbzQ/4gxHG
         zPfJuX/ctiEtkVXbI+iyAkObd23R2vM54dbSvqo0AmvAdqDoYkSTKIH+oksSFKoIvpr8
         OdNV7sbn4X6o1ScR/3ah7q5ZA8YDLHOowO+FlJ75oyoaO0cUEcTr53Nx6Hu57P1GDdgV
         EWkoRGlWhnvF1Cj8GKw2amyZlIySmYbjduYLE21gYJcqRHDK60uJWe4HfwIWpSRW4GqQ
         d/00sYksDLT0W3c/YnrkFPS8zSl+s5dJOQYBMIhSBavxqsHr4jLh9Rg1L1wGtUrRMzEP
         RTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WXSifZkVMNKJIWFI2353UCu3hiqezZq+FGcwxX96rkU=;
        b=UX3AkJmqjS/ELQXvMTBPdR82lRXtOvX7KiH0Gk/+RzPYItccDfK5SRCpdsN/IYABoS
         pyCAtGHhpPPJ6LKIugg5i5hUicCWQVHhtxWXZ9wezGm0vTJMEyZx5e9qetLx6J3VbeoO
         9BMwfLGeHVakRSIJb6ixkMB9kzKe6Jxu3/2uJ540c47YjrDc6B1DYLbvl7VgLB5gGKI7
         EpXmPyRmT4OnCb9CGt9WUpMsBYcVk8FA75sc9oVhU8wpj9yakdwBfJ/eor7td10OS8R2
         LXnHwvLBqUd/XZGE67rSndCNGmOD+ddZGC0dx6apI7ojikJDrXYmroI5qa/E9wolwLCA
         k7lw==
X-Gm-Message-State: AOAM530qz0UMzVIisZfoPARu4PyzKRi0AjP584jbRmJlJ2AAH3j6SPw7
        WrkTqQsSWBGZY9au5mJde8Y00P7gpOEwMcP+PMQ=
X-Google-Smtp-Source: ABdhPJzED7Bj/17e150QFoZy4+zLcq3hKeUUGjsXs0im7kbV5CxZM9b9YkqCYtGyfOXYgxCLa43Mb4ikyMkmyAox4Qk=
X-Received: by 2002:a05:6402:d51:b0:425:d5e1:e9f0 with SMTP id
 ec17-20020a0564020d5100b00425d5e1e9f0mr30316725edb.125.1652292136090; Wed, 11
 May 2022 11:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com> <eff9907f-e92b-9115-bea7-b1093d1dc28e@redhat.com>
In-Reply-To: <eff9907f-e92b-9115-bea7-b1093d1dc28e@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 May 2022 20:01:39 +0200
Message-ID: <CAHp75Vcnq=Ou6QNyPjwC+HR9wJ2BheonTqmkGvQU0qFtHO2BDw@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] platform/x86: introduce p2sb_bar() helper
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-edac@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 11, 2022 at 6:08 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 5/10/22 17:14, Andy Shevchenko wrote:

...

> I must admit I have lost track of all the Ack-s / Reviewed-by-s a bit.
>
> So from the above I take it that the Ack-s resp. Reviewed-by-s on the
> other non drivers/platform/x86 bits also signal an Ack to merge the entire
> series through the pdx86 tree?
>
> Lee, any chance you can take a look at patches 3-5 and give your Ack
> for merging these through the pdx86 tree together with the rest?

Actually I misinterpreted Lee's different tags again. Acked-by is
normal for routing MFD code via other subsystems, while
Acked-for-MFD-by is for Lee (scripts?) to route the code via MFD tree.
Lee, is it the correct interpretation now?

...

> p.s.
>
> Since this is mostly a cleanup series and since we are getting close
> to the next merge-window I believe that it likely is best to merge
> this after 5.19-rc1 has been released.

OK.

> I can then also provide
> an immutable branch for other maintainers early on in the 5.19
> cycle which should help to avoid merge conflicts.

I guess I will send a v6 anyway in order to attach Henning's series to mine.

-- 
With Best Regards,
Andy Shevchenko
