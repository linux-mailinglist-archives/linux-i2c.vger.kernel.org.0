Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 986A519521F
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 08:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgC0Hhf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 03:37:35 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:55287 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgC0Hhf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 03:37:35 -0400
Received: by mail-pj1-f65.google.com with SMTP id np9so3513461pjb.4;
        Fri, 27 Mar 2020 00:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=opFLXK+oU5nr5VziYLB6DvSlkmOra8TRpGw10EhhKes=;
        b=i0mIFmiLFnLnl7La9nA89TH3uvmz0CyFUVDeSF391P3EGeRHUQ2jSE1XhavheLSzG8
         tldn+ulHYrC15BuAZklv8H1CrItAT0l588/HW/0DhxFunvb8u7MCsMAiLGAJUVXsM5ln
         TuRKhgSpF91lom3RDXZk6654PAQD/Fx1nBD87HxZx+VeaKPhu+eFAosO1fn8iCDDiOnN
         PGi8i8g+avWbgv6acWCJ2lP6lmE9DbrWlCUR87Zpa/a0bSUwpgeuVaonlppzVN94HD7A
         dbJYmvWY+pmE51Gcx1JoWonHiCNefMUbq7FPuuAItLc5oSiGXegbtIyUaXaHpSTs2zh2
         nifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=opFLXK+oU5nr5VziYLB6DvSlkmOra8TRpGw10EhhKes=;
        b=LQBYlxa09SVuCja51OkUfsABaozQtFIZPMf7JYnWqGs6xODE3p2jIZrstmU7ErFvwJ
         190mlI6yT6FVFT/zDmip7sOwnojEM43iKw3fl7R1IVN2GEMB6JTtcFFDHnYz7/2n3qkf
         6DyqeA+jj8HBGTK2pgLWy3RMvqY/wJACNaFicLeLxET2G4moj+c10c9v5m8laIFWJrhE
         1kGlk0V9PYHCYc02uhDormgvK6jWfEQfCM3T2G39DvezV8Eh6oweA17LVSazusjo4kg3
         wuY/1TtW8BAO4jML8zynwsfzCFhmvYfAbjrTuzy/RRahYuaPNfxApBC4/hM2p7aRhXm2
         fFDQ==
X-Gm-Message-State: ANhLgQ31sOSY8jl+GBDfjVUWi7TIO5GJcbGAHY/c8M8wu/DYnGsvV0GY
        2sdo+aQOS4iExQSPsPxrXka9Z/vD0gmCtM3xyoI=
X-Google-Smtp-Source: ADFU+vu1UvjBtRvOpLwja1k65eQlVgj6Utj2N2kbwgv0q2V0K8kZnDwdzezTOXBj1HTItwGfppiZwNWEQLhEyTJlp14=
X-Received: by 2002:a17:902:b096:: with SMTP id p22mr11915050plr.262.1585294653624;
 Fri, 27 Mar 2020 00:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200326211015.13654-1-wsa+renesas@sang-engineering.com> <20200326211015.13654-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200326211015.13654-2-wsa+renesas@sang-engineering.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 27 Mar 2020 09:37:21 +0200
Message-ID: <CAHp75VdQAReLyr3GxMH8v5hD4EhpdGSunKbdKbaLoXRmnpyYgw@mail.gmail.com>
Subject: Re: [PATCH 1/1] x86/platform/intel-mid: convert to use i2c_new_client_device()
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 26, 2020 at 11:10 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Move away from the deprecated API and return the shiny new ERRPTR where
> useful.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/x86/platform/intel-mid/sfi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/platform/intel-mid/sfi.c b/arch/x86/platform/intel-mid/sfi.c
> index b8f7f193f383..30bd5714a3d4 100644
> --- a/arch/x86/platform/intel-mid/sfi.c
> +++ b/arch/x86/platform/intel-mid/sfi.c
> @@ -287,8 +287,8 @@ void intel_scu_devices_create(void)
>
>                 adapter = i2c_get_adapter(i2c_bus[i]);
>                 if (adapter) {
> -                       client = i2c_new_device(adapter, i2c_devs[i]);
> -                       if (!client)
> +                       client = i2c_new_client_device(adapter, i2c_devs[i]);
> +                       if (IS_ERR(client))
>                                 pr_err("can't create i2c device %s\n",
>                                         i2c_devs[i]->type);
>                 } else
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
