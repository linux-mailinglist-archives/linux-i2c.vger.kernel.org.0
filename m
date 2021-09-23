Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287D54166B3
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Sep 2021 22:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243174AbhIWUcF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Sep 2021 16:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240613AbhIWUcE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Sep 2021 16:32:04 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400EDC061574;
        Thu, 23 Sep 2021 13:30:32 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id g8so27515116edt.7;
        Thu, 23 Sep 2021 13:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fL+h8uQ/7PfcEdzSSrp7BsmxOo8qUJEyVQToL1mn6dI=;
        b=qmNGwnEEe6lNlTpC650yBYGIgPH6NSSFR/zzN0YcnT21wOv8IGfTUiLM1aRqqRYHvx
         2uHHeigGqaUG2RqcVI49LQF/a6MJVX93ttfn/5ttX4x0ZVF9YKcniJsVrizLiq5IIOBg
         7YBThyeuHF9cX5PaySoilVr8uSDl+ngoy80c45b2BenMBHQ7VOwGxaFbW1M9oGuEK7Wy
         Mbsw8Zdck/83lRPiHGjS5GVyL876i2vh1RuLt7Gin4FBOwWsrtnxPXeRHadEXh47Ls2Q
         B+oTmnYkAJh6cd117aZaxf0QCSCojhAYnxUQ1LKKh/8M1FJKn14LoePYiF5pCqrOUVK1
         AS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fL+h8uQ/7PfcEdzSSrp7BsmxOo8qUJEyVQToL1mn6dI=;
        b=5qvVtPegR9G8SIYeitoI+782i7o4BQ74KpOuzG87ubtk3lsl+jI2ptMQGJXCQl3wrP
         zeXPohxk1WxnIY5Tou8qAeBF4GjBhY4h/8PmA2CYBO6iQukewg6aOX8YHv+Pg29hfg8h
         jfFwInbPjEfVut5WT8yagft+uiWlZ/PWpb3GLrbvPdwU0UM68qNvU+1uExiS4/jctk+V
         9G9Umx57ziQgtfVJTh6fjlRDHwp/49Pi5yZRU21tFEMiopSCbUKbOeCrO3TaVkqxdWYQ
         exBR+djU/FcDz3YS9iKoAtD4WmmrxpAQdOBdLHAvyTtvDQNFwcKpFe3yQCD1iVDo+J8a
         yDkw==
X-Gm-Message-State: AOAM530/qBydZ/QvksGp1Am3gc5Ieu/7ftm8GHSiiIWTkajdPz/7Z9/2
        3n4IrsXmvvuL1TY9ZgtlxJjwmpBi9V5vLYyueCQ=
X-Google-Smtp-Source: ABdhPJzQsDLZwUbvXYaKD2x4zY9eN8nczEIspbFwNJG4lWhki8aA062Ch01bY8MuA1JdWsUKZvxtj1k8tS5nYwL1Ns8=
X-Received: by 2002:a50:d987:: with SMTP id w7mr917015edj.240.1632429030823;
 Thu, 23 Sep 2021 13:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
 <290741faab199d3e43b6255bf2282075@dev.tdt.de> <YUrO5ajlS9wS6xYU@smile.fi.intel.com>
 <YUrg6TfVhk+TIxDz@smile.fi.intel.com> <d84fb798722762862a7fb08f1e343b6a@dev.tdt.de>
 <CAHp75Vcc_6mcR4gC-MzVTjTBpuozMJMFTosQjpXN8A25pndNpg@mail.gmail.com>
In-Reply-To: <CAHp75Vcc_6mcR4gC-MzVTjTBpuozMJMFTosQjpXN8A25pndNpg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 23 Sep 2021 23:29:54 +0300
Message-ID: <CAHp75Ve=nySDrM9e0yjvvzcGpqAzNaw7A46UdfcSwPyhY66nRw@mail.gmail.com>
Subject: Re: Add a SSDT ACPI description to recognize my I2C device connected
 via SMBus
To:     Florian Eckert <fe@dev.tdt.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Enrico Weigelt <info@metux.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Florian.Eckert@googlemail.com, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 23, 2021 at 11:26 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Sep 23, 2021 at 5:26 PM Florian Eckert <fe@dev.tdt.de> wrote:

...

> Summary:
> 1) _CID notation is wrong in ASL;
> 2) driver seems supports the _ADR schema which you have used in ASL;
> 3) something fishy about I/O addresses in the sysfs (is it a typo when
> you composed the email?);
> 4) it's unclear what you did with ASL to get it loaded;
> 5) as Mika suggested, have you checked the kernel configuration?
>
> Otherwise I can't see anything else suspicious here.

One more thing, I have no idea how max77620 is related to all this
(you mentioned it in [4]).


-- 
With Best Regards,
Andy Shevchenko
