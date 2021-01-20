Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA012FCB16
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jan 2021 07:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbhATGbl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Jan 2021 01:31:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728894AbhATGUV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Jan 2021 01:20:21 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B26C0613C1;
        Tue, 19 Jan 2021 22:19:40 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id u21so24761413lja.0;
        Tue, 19 Jan 2021 22:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PARrbZXSNPN7iNNTTbIUXkMdIWWiNGrwyhvH2ICpw70=;
        b=cvDh1YnmWCtuZPaobOb+KO/SRwfhUe0xzem75hfNE2O1qc56S117a4Gv0tLvCh3oBv
         8sgTo+SU/GZ72AATutIJrw46s6VjdQqptaRTCYV771Uc1MQCZo36AzPvIWXJ5ClD5QUA
         Z90aP+mNi86jt03axnaxk5AqRNFQmdnHhnv3xxE42UeWjHoakd6Twq4KQgqKNIwfaK4p
         2JViDBLQJJqbg5+wsdZ2F+TV+yEjUM+Jdi1WMd8jcUdiI0HebQkweEn8z3QZSbS4iq7U
         eWqIz1GtJK6/b0Ossz/Zwu+Ip4sb2SOoYWmYjOt5VaOJEsZ4Kr+z9D47UkVGA1PobkgN
         XMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PARrbZXSNPN7iNNTTbIUXkMdIWWiNGrwyhvH2ICpw70=;
        b=T5lM5h88mlzXd8/31AO0jYT/CtJ2PLT2S19dQWP/uVVoUuJ4T9tCH6yY8BmEEnMquO
         8bcUhzxNrfkvedW0BP6evr3/ri9dpd9NCOZ4WvJf1sZUjVkO7h/Bg/hd67d2UMA/5Lvk
         7i6anN2G/DftCq7S7WmgdMpQGJW7ILwkuPy6c/Sr5CFotF85+bRha60scoGwApVUdPoo
         qu3NLUGh8dRiGJl5uA9GzOJ2Mn0B6dcbu2ZVpukUbnBGANL2YFhCCWFg+K9saLE2I1Re
         PApgqt7VYxcHvO5lEZMdBjlPczuEl0X8dWAsdqQ1a9iPwcJpKnKjYahZGet9ko7LuomA
         S9vA==
X-Gm-Message-State: AOAM531qJiKrfp1Kvz/j5GQ4sUTIraaQkvFDIKpJ1vD3mia75n8bWi5o
        2wtyaAjMGWQBsphl5XxZfay7GFjKseY+qILQf+Hc5HlFmko=
X-Google-Smtp-Source: ABdhPJyQeipgMjf45WphthUA64/VG3eMczoqG/IWWzwquSsNcAGkQesT9BEf2op8DUHh+CEi8vjMIZBiZQaLcQttYqw=
X-Received: by 2002:a05:651c:28d:: with SMTP id b13mr3645167ljo.75.1611123578236;
 Tue, 19 Jan 2021 22:19:38 -0800 (PST)
MIME-Version: 1.0
References: <20210117114313.141428-1-krzk@kernel.org>
In-Reply-To: <20210117114313.141428-1-krzk@kernel.org>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Wed, 20 Jan 2021 14:19:33 +0800
Message-ID: <CADBw62pML49WTTmv7GSzMhJAsAJnujnReH70Kb1nCj2bt1voDA@mail.gmail.com>
Subject: Re: [PATCH] i2c: sprd:: depend on COMMON_CLK to fix compile tests
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Sun, Jan 17, 2021 at 7:43 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The I2C_SPRD uses Common Clock Framework thus it cannot be built on
> platforms without it (e.g. compile test on MIPS with LANTIQ):
>
>     /usr/bin/mips-linux-gnu-ld: drivers/i2c/busses/i2c-sprd.o: in function `sprd_i2c_probe':
>     i2c-sprd.c:(.text.sprd_i2c_probe+0x254): undefined reference to `clk_set_parent'
>
> Fixes: 4a2d5f663dab ("i2c: Enable compile testing for more drivers")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

LGTM. Thanks.
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>

> ---
>  drivers/i2c/busses/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index d4d60ad0eda0..ab1f39ac39f4 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1013,6 +1013,7 @@ config I2C_SIRF
>  config I2C_SPRD
>         tristate "Spreadtrum I2C interface"
>         depends on I2C=y && (ARCH_SPRD || COMPILE_TEST)
> +       depends on COMMON_CLK
>         help
>           If you say yes to this option, support will be included for the
>           Spreadtrum I2C interface.
> --
> 2.25.1
>


-- 
Baolin Wang
