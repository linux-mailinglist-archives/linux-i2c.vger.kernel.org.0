Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D06574D5EB
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 14:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjGJMl7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 10 Jul 2023 08:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbjGJMl6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 08:41:58 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196F6DE;
        Mon, 10 Jul 2023 05:41:57 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5703d12ab9aso56148667b3.2;
        Mon, 10 Jul 2023 05:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688992916; x=1691584916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZqGOW9woC4hxySuD731jBWPOXAr5ZaE6PhY8Yhm8lY=;
        b=ImoS7t9dFXDyuOvkjRSl1MZ31kYtTVODReEfmNJDEJPUyFawmu/pCdYlSeYJFM4c9R
         IWt+4ORttfm71XVbDEns5HibJky9Pzlai+j0haEcwR6vvIwY3KvgMX8NceAvTQ0yGIU2
         1l+VeGGz6Mx7JQZ3vs/3IHjI13n0hbFUKdlx9v4bpXHKbyvrEuErAOHgMhQ7Q0nt6Kt4
         WPLa+f4O+CNxPcbxJIoh0hQ190GPjekEYsQzAhPkQQ8ugJ+FxYDzLpiy/mXSWB5xZ+HI
         VXIBelQ5Mk/Eka2BNiEZRCCGhu5UmIrBfH1o16GgyC/xCC+Y3k7sntZBCJ71ghi6+arQ
         gLtw==
X-Gm-Message-State: ABy/qLYf1g0wQCcTFZs8XHEATMXcLHiRTTqzpH443/iJAST2521+KKxX
        /YWvpikv1mKh0dAkiDfwVWS9kNknYu1A3Q==
X-Google-Smtp-Source: APBJJlE9UQJWa33lLGhl6vElj5+oXEUBksGAFqtVodWNGgKxyPo/hq0Moe4YcwkW0DDGTjFWn2v13Q==
X-Received: by 2002:a81:84d6:0:b0:568:d63e:dd2c with SMTP id u205-20020a8184d6000000b00568d63edd2cmr11689252ywf.11.1688992915920;
        Mon, 10 Jul 2023 05:41:55 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id p135-20020a0de68d000000b005707d7686ddsm3032925ywe.76.2023.07.10.05.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 05:41:55 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-c4e4c258ba9so5446538276.1;
        Mon, 10 Jul 2023 05:41:55 -0700 (PDT)
X-Received: by 2002:a05:6902:20e:b0:c6f:db67:cbf7 with SMTP id
 j14-20020a056902020e00b00c6fdb67cbf7mr6843481ybs.16.1688992915397; Mon, 10
 Jul 2023 05:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230705204314.89800-1-paul@crapouillou.net> <20230705204521.90050-1-paul@crapouillou.net>
In-Reply-To: <20230705204521.90050-1-paul@crapouillou.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jul 2023 14:41:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXecRUTmTcmWkXH1FY0iXPLYxKkqFhgoK7tRBD+ztcsRA@mail.gmail.com>
Message-ID: <CAMuHMdXecRUTmTcmWkXH1FY0iXPLYxKkqFhgoK7tRBD+ztcsRA@mail.gmail.com>
Subject: Re: [PATCH 19/23] i2c: rcar: Remove #ifdef guards for PM related functions
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 5, 2023 at 10:49 PM Paul Cercueil <paul@crapouillou.net> wrote:
> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
