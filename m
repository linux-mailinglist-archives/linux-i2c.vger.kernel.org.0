Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD753363D81
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Apr 2021 10:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237914AbhDSIeD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Apr 2021 04:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhDSIeC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Apr 2021 04:34:02 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF65C06174A;
        Mon, 19 Apr 2021 01:33:33 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id s14so12635773pjl.5;
        Mon, 19 Apr 2021 01:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nXAoRa2UrIlJ9e5z4Yh7wHRJrkulXwyDRq9azWs4mI4=;
        b=tcDJiiAaxA0dU93gfmr0LZLp9z/rM9gWZsFKV3PaUmgedMvwGUChDHYNcCGZips99Q
         nKMXRzt6rZWssNoc6wACqWd9jc/I4dE4z3/Y99R07wuMhuvHzT1eV5S13C/7Wl39OiOF
         Qo5kq134S6beNxc3T6uBjZc1NVeeGy/lvj1eQpQdYFoT1nWG/zMq+fGkkqEytlzWCv4h
         b252RS68O6zGyIPypaFTvMkn/7uQjDopHYIL/ZrrtI6UHG36yqMjVOi+8kEQnjxg3nvE
         0S58IASMYLtt9kpCED76AAogbW5n2mlQS797P00c6gx222k6uIittr/ABetbLkbJT6Pz
         yVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nXAoRa2UrIlJ9e5z4Yh7wHRJrkulXwyDRq9azWs4mI4=;
        b=jIlcA8YPQ/DJOPR3IB9c6qKymlmNblvKqsiDVRPs+XtrxRWbzcB5rbOGvq2Et1mXvF
         90wil5B6gXRJP+yMilhokNeuY+GhEs328rQJIaMbqBOCYo6oorDdcIQ/m5EL1OeyIUPh
         GQlX30zuOS4g+36IzDAyMQh6JCj0F0z7nZjG4lDd6jY+0u0wXPpBB+RjBLQQj7AYxX9P
         GDwTK2zV3yLZ35dIKTRPxhSFg544m4fr/s5Aca9FxHSFle1fPu2YDcLLIUkxp8ZUu7Ox
         zjvrwNg5m7KT9IuMbq39OayQXPZGfyH+z9nBLWO03zYwrTCEpBzkZ4t/9Zcnkz5t3Pdu
         TO9A==
X-Gm-Message-State: AOAM530IbhjNERX+UmOy6guJ2A0glPq3o6IB21iTBv4HURFG5s/0Cgqw
        jeNKXXtBoBSgjQgnZ13gMFX+xytdAEbJ7akVgeM=
X-Google-Smtp-Source: ABdhPJwROB/iJmK7Xs/KjcTfZrbHMvrMFtU2QwFubPDWfZ7jv31T9D9ukhfbCNSDO1gqTbHnAV0337hKngeBrgeiRm4=
X-Received: by 2002:a17:90b:1184:: with SMTP id gk4mr18380884pjb.129.1618821212898;
 Mon, 19 Apr 2021 01:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210419061809.15045-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210419061809.15045-1-lukas.bulwahn@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 19 Apr 2021 11:33:16 +0300
Message-ID: <CAHp75Vfv0FQGXrmpDveOf-cBahoDK3uSPHjPU2RNh6mhFxN7vQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust to removing i2c designware platform data
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 19, 2021 at 9:38 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 5a517b5bf687 ("i2c: designware: Get rid of legacy platform data")
> removes ./include/linux/platform_data/i2c-designware.h, but misses to
> adjust the SYNOPSYS DESIGNWARE I2C DRIVER section in MAINTAINERS.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>   warning: no file matches F: include/linux/platform_data/i2c-designware.h
>
> Remove the file entry to this removed file as well.

Oops, I was under the impression I grepped all occurrences, but I have not.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks for the catch!

> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210419
>
> Andy, please ack.
> Lee, please pick this minor patch on your -next tree.
>
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bbe356508f29..6b903aad27f4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17667,7 +17667,6 @@ R:      Mika Westerberg <mika.westerberg@linux.intel.com>
>  L:     linux-i2c@vger.kernel.org
>  S:     Maintained
>  F:     drivers/i2c/busses/i2c-designware-*
> -F:     include/linux/platform_data/i2c-designware.h
>
>  SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
>  M:     Jaehoon Chung <jh80.chung@samsung.com>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
