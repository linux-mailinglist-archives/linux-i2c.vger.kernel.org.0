Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C20356BB5A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 16:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238386AbiGHN6M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 09:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237952AbiGHN6L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 09:58:11 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE902B247;
        Fri,  8 Jul 2022 06:58:10 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2ef5380669cso199056537b3.9;
        Fri, 08 Jul 2022 06:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=FUz8/yJUz+qn4Uf/z4NBXBGwU75NgPGiABFdlcSojCA=;
        b=X0pbz0twx8kLnN2lUJQac2lR4EBwUesQsyXmnEIueFsVg+j46XQHKbm9NWP3ymAPCl
         I43FjFEH7w3AiEovkimFDWxpjPbHzvcX5bIa4KBgkge7NDaWqW9LPSyHXcJeWIziXD1u
         ioKSus2AMAJYoDVWjV+35AmKMK4iik0+ObKcbhg+4/2x5g617DKFT2khuW6WO69SvfhH
         urencUsetiqamq/oRmJ/ORuKhxEUyyeRDhorv61Jk+7HQo8OgVSd9wJtFDbHOODjgNQG
         aX4phLmr7BST/JKpFc3+odf9ZAjqWhVbg3VA/l5KOREL2rTR1Du9ZyWRFv50sERc5QaJ
         bMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=FUz8/yJUz+qn4Uf/z4NBXBGwU75NgPGiABFdlcSojCA=;
        b=PXl0Bx5emarHMHEgL50UNaaGK/5ZuYHW66JP7XI5+hsp3yMZKSZkmirD7ECbiD17p8
         N6vxgy3nyxz4JnyIxYZl5j2I55ws9ytQfEqIddQGcumtug8Qz7PlgZYgIXJeyknvKdsz
         vHAtiWjF9YnVT9CMzsjR3D5OC3GH3OjlVz0/vYO+DQM3FdoOITJI42eWnJjeAmmXhark
         7uMSDdgMCU/saM7uJI4hqwSKhAHglt7e14l1ELd+b2OI3E3BsfVKxKg+ypIV/+IzKFe6
         /eO4ikq6HVHfBfFHu0rOCZQon3TkuYtFKPwikDj7tvhXbqCeeWSbcSKfT45V1tJ2F4/2
         ygPA==
X-Gm-Message-State: AJIora8vqttyPOGI47E/4ouLj7jlLfnuadM++pEE55q9gdH9E/BZPaA7
        IcBA9PhUob134OCHE2U7xJ2N59VLUrN/2ZmCi2E=
X-Google-Smtp-Source: AGRyM1vZRR8ZOgXXAF5lBhSJnVLuxlnAx6cylO2Gyq4BOmheXbnYK3VvKHI7PC6eIF01/yn2EYtBHPsfcQMJNcEYqac=
X-Received: by 2002:a81:13cc:0:b0:31c:ad64:352c with SMTP id
 195-20020a8113cc000000b0031cad64352cmr3980020ywt.185.1657288690118; Fri, 08
 Jul 2022 06:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220703154232.55549-1-andriy.shevchenko@linux.intel.com>
 <20220703154232.55549-2-andriy.shevchenko@linux.intel.com>
 <YsWI4nzQa9gmqKdw@shikoro> <YsgBkDeq/KeQ15HU@smile.fi.intel.com> <YsgcZHzjzqyJjKqQ@shikoro>
In-Reply-To: <YsgcZHzjzqyJjKqQ@shikoro>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jul 2022 15:57:29 +0200
Message-ID: <CAHp75VdJ2AT30md_nR3a_hY6L511w+4oqsAJ-CoE2gXitXCrNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: Introduce i2c_str_read_write() and make use
 of it
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Walle <michael@walle.cc>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Till Harbaum <till@harbaum.org>
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

On Fri, Jul 8, 2022 at 2:07 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Just noticed yet another (but not in the category of the above) debug message
> > [1]. Would it be acceptable to use patch 1 from this series and its use in (a
> > completely new) patch 2?
>
> Well, it falls into the first category because we also have a tracepoint
> for smbus_xfer :)

Ah, indeed.

Okay, let me find another subsystem where this will be more useful. Do
yuo have any wiki page about TODO in i2c subsys for kernel newbies (it
would be good task to add)?


-- 
With Best Regards,
Andy Shevchenko
