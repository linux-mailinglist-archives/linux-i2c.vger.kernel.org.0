Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E629D3DF24C
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Aug 2021 18:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232657AbhHCQQ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Aug 2021 12:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232709AbhHCQP3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Aug 2021 12:15:29 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49AEC0617A0;
        Tue,  3 Aug 2021 09:14:42 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id e5so24316177pld.6;
        Tue, 03 Aug 2021 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=63N7yY7g4fPpaCOR6YiV5UTKT+fh+IQEXizimfF3CXE=;
        b=hU08H5AqP48yaKR6gRomLspQHRr5TEEW2u5tzWfc7zTqXYuEZlPU7XpcCM5XjY1mjl
         jTvx+Q+BuLQQZilqj0cicRKbSGk1ji/0OATcAU4KtEtdke7Y/jTyu6boYzilpjPgg1Dv
         7yy/aoBKOzkFLqEzN81dJE52UxqLvOSrD7KERywv6LCrU9IOXE0GNWsCmLSVWlWRZngd
         QYnSyH1+AhR/0QbxsW4+ZO5KAe/AGCDNFL1/a2VAKqoJJ9FNUdLUX/NCkrAHBXOTyqhG
         NyXcnB208sLOml99b/1v+SOp/+ioltBey4gt9+wU2m6nC/ZoLPNDBZsZXxzmzTFg37Aq
         HPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=63N7yY7g4fPpaCOR6YiV5UTKT+fh+IQEXizimfF3CXE=;
        b=huKe0v7NrdNmEKBNH2NG9doju0CutYuyDbmrH3laWs5YrwisraWfcgh+MJxEoMlNkE
         nJFXA+/TUndhhCqsGLtHXDjWuZNt0NH44FI1P1B3lirsc8tEfbn6eqK6Q7RAP+d1yahD
         ewt0PM1D1fnqfNyPXJGutSYgbX3aMoGejcKYSq3XiFpzmnIziHJ7LWKgw9Op13mH/XdY
         WYIbbpSc923+LWY3/vy5EYV8DpXpSDUoDEjvTdJpgKq9s7A1jx7lOKhE0LJcL+qsewIg
         Y5umR29Tnl4JvozkSP89SuZSt519MfMVoprKz82VpvXG88g1Vfn9TnM4ASIStTiZ0vQ/
         OABQ==
X-Gm-Message-State: AOAM531WgLP1+xuxSF6+hrdhoFq6BeP3EZ3eogQ2EfaEA2IJDfJ+3atm
        JusLl7oMdgA/I82AnP47B6JsUdn20xrgDl+dfDk=
X-Google-Smtp-Source: ABdhPJwIjTA9bT089Xi3FmPhGrTkxVnj56xA+MUvjsgW76N7yqP31pdoGcN+UMVjM0rmMp5EZkaeuQvRMOqRsT+5jxs=
X-Received: by 2002:a63:40c1:: with SMTP id n184mr23160pga.74.1628007282199;
 Tue, 03 Aug 2021 09:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210803160044.158802-1-hdegoede@redhat.com>
In-Reply-To: <20210803160044.158802-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 3 Aug 2021 19:14:02 +0300
Message-ID: <CAHp75VcDOh=PzvOGg+PAJVkmjH94e6AwOTAbRKGH9Fxekp5ovA@mail.gmail.com>
Subject: Re: [PATCH 0/4] i2c/pdx86: Add an i2c_acpi_client_count() helper function
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 3, 2021 at 7:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> This patch-set adds a new i2c_acpi_client_count() helper function
> to remove a bunch of code-duplication.
>
> Since 3 of the 4 patches touch files under drivers/platform/x86 and
> also since the drivers/platform/x86/dual_accel_detect.h file is new
> in pdx86/for-next I believe that it would be best to just merge the
> entire series through my pdx86 tree.

Utterly in favour of this series
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Thanks for doing this!

> Mika + WSA, may I have your ack for merging the entire series through
> the pdx86 tree (or please let me know if you want to proceed in a
> different way) ?
>
> Regards,
>
> Hans
>
>
> Hans de Goede (4):
>   i2c: acpi: Add an i2c_acpi_client_count() helper function
>   platform/x86: dual_accel_detect: Use the new i2c_acpi_client_count()
>     helper
>   platform/x86: i2c-multi-instantiate: Use the new
>     i2c_acpi_client_count() helper
>   platform/x86: intel_cht_int33fe: Use the new i2c_acpi_client_count()
>     helper
>
>  drivers/i2c/i2c-core-acpi.c                   | 32 +++++++++++++++++++
>  drivers/platform/x86/dual_accel_detect.h      | 26 +--------------
>  drivers/platform/x86/i2c-multi-instantiate.c  | 27 +---------------
>  .../intel/int33fe/intel_cht_int33fe_common.c  | 29 +----------------
>  include/linux/i2c.h                           |  5 +++
>  5 files changed, 40 insertions(+), 79 deletions(-)
>
> --
> 2.31.1
>


-- 
With Best Regards,
Andy Shevchenko
