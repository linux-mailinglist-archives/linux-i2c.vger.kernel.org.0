Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D80E11F8314
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jun 2020 13:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgFMLOb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 07:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgFMLOb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Jun 2020 07:14:31 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298A1C03E96F;
        Sat, 13 Jun 2020 04:14:31 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ne5so4690750pjb.5;
        Sat, 13 Jun 2020 04:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ynzO98iVzfOWrdbiRVVAvIwjn4Ogh7xOfjXabeEMm5w=;
        b=VLshoWMEgEFMcQG/SzlL6NXOw/1HwPkhE0XOW7TdHnRnFPi5IawHvc2QjkJszop3ZD
         eVbGUT+sO6Aj3wo2/yCPLhPOQStr6iIgKkqwyOdRNFD1X25SmOsmX2blLJVR4eRM0rvz
         l/zwTxiRhlOsd4/chUM0pgm6m3l/XZ9gaCP3uzOIfSOmOIOAj9HGvT8Wsz7y3qQ9QaTR
         dRioOnUcVTN8N1LToWQr0CAPHOIrwXcXACe85x0c2lVZRK360+t/nBRAHMUjUt/9QkOm
         0ZP+uTPyGlCAlEtAlWrqzrv8xh2xWCUBpCRQMCgyn7oXk8oGhduUoshbmlONErpqcDu5
         wJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ynzO98iVzfOWrdbiRVVAvIwjn4Ogh7xOfjXabeEMm5w=;
        b=NV2rz6v0VzTSrC/9S3EIpNvepLBakk4f33Xz1URavpEWL58y+Cu2YtZhhzX6f4MG/2
         hNmcYFuSZPGLiBtFWRn5cwNVeA7PAT+qpB+dQesMFih2BL9sNyu+50Ze8qu14Dj1ZSu6
         Q8KypaVKG2DUpGgVcDelNfByjjY5tXb8tmDPez3JayniDoUnu1Ha1juMnuAxUXlxJ8q1
         6JOEp2CWYCkEQbYw1naOwsO9hZCdk+dl3xzxzGtYOdNP09FnkGXEWlbbFvtuDU3gC/DX
         +1IZcd3/5Qn6Irk1ZHn0z03z6yym0Pq9a98mbVi1vskT4xnwOY9mnCuKLBLXqm1yxy3Q
         x4dg==
X-Gm-Message-State: AOAM530dm+WYIFv+8zH9mme6/F3lf6YDBCgqejf7dUuH0V610uAtK3oZ
        gesQpYnR0u0TZo+BNKIdJnZAI1x6BbQqRa7KTDp4ZJZvQkM=
X-Google-Smtp-Source: ABdhPJxFYBiyu2Z2/Ts9/OnGYZzwIMCsRrv7K+RITbpFMBiuSEfC9R53XO6nS+7g6+bKzwH0mf5uSFApzZgZ/MO7fvo=
X-Received: by 2002:a17:90a:ac05:: with SMTP id o5mr3234020pjq.228.1592046870430;
 Sat, 13 Jun 2020 04:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200607182812.9438-1-max@enpas.org> <20200607184604.GA12911@ninjato>
In-Reply-To: <20200607184604.GA12911@ninjato>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 13 Jun 2020 14:14:14 +0300
Message-ID: <CAHp75VfcZ43QJ9f9-Ph9QboVYgReLeUbOPZ=Ckk0RzSq-xmQ_Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: icy: Fix build with CONFIG_AMIGA_PCMCIA=n
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Max Staudt <max@enpas.org>, linux-i2c <linux-i2c@vger.kernel.org>,
        linux-m68k@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jun 7, 2020 at 9:48 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Sun, Jun 07, 2020 at 08:28:12PM +0200, Max Staudt wrote:

> Applied to for-next (i.e. for-5.8), thanks!

A bit of offtopic, merge window is at its end, do you have plans to
send PR to Linus soon?

-- 
With Best Regards,
Andy Shevchenko
