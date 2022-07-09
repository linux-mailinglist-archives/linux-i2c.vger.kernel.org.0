Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061E556CAFD
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jul 2022 20:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiGISE2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jul 2022 14:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGISE1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Jul 2022 14:04:27 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8EC15801;
        Sat,  9 Jul 2022 11:04:26 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-3137316bb69so14648027b3.10;
        Sat, 09 Jul 2022 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=dZb0z9oQGjeGeVmJPdpy5L//+nMPYZT6cUKj4IQueRw=;
        b=EeKIKeabZt2DEwx/zEOB1h23sJtPXlCNiPhSK0haoxJcQgKHysEpGqfO6EMyRzE1QS
         7sjgvBoe6Xbvfw3qfcGuUAgEIMUEVWLtQPWlBEzFrFPbGa43OdwWpVEExgCg2B5fHTTa
         OXznYfDSZBHVkEQi1mH84pAp2DHu62QgMp7Lwou5Tn9VUa6gLw6h+z5FjJv8D3W2awzO
         2uVdzI/AFE4bQlo5T0dTvtOpr5Yyp9G37IX/eA3i2BmbaLJFC8jorXNxAMNjTiZLKX3E
         8EXpsGMt2pLI2uzZQyLmPsv2/XcfeRj8IDTlq7LUl9/zm3w783cRg/3lO5B2CPcxmS/T
         eViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=dZb0z9oQGjeGeVmJPdpy5L//+nMPYZT6cUKj4IQueRw=;
        b=caGLqVFc2B1hSRmDLtq0nVYnouv/6VySxttGxdG0ybH/Qs2Way0TVqq/gYrGsA4Y8L
         rU/VaQf3bY7u0WpdlRV4LhHhzFre5QzGLlKmE7LAlny3sOGClrKq5p+f5P8yZxaz47Ax
         OGHnNHHIjG3tvd4LJWZeHZN9l9w+FyVyjkfQr8KULJlbq74s+sGIAHZ3JCeo1fQvOB28
         f82i51X14a+f2kiPapay+4WQo7rrmxROyOd6T130Gqw13qiggHjJ6r19Zc5qQwAHLVw3
         EHFXANZxSYcvzjUuSikhIK09s7uWD/a4J2e1S3El128AD/m1syQlRf6q5qrN7hkwqHWT
         uPag==
X-Gm-Message-State: AJIora9Hu8EcD0CxvJ6QScfPNNMP2370h8aXPkPhX/+EYLWGJqp7D+pv
        /jr7m556aYf1rBd+s0JEDZhVmTwe+zCcStMvsGGec4m9J2uS7g==
X-Google-Smtp-Source: AGRyM1tpt9b06DebOPL+shjB/ySoyuMlM8pCnKlYf6dzx4Vkl46SEo1fYMDg5lGPMsPyqTIZDJ/rA3jMROq3HQPbEpA=
X-Received: by 2002:a81:108f:0:b0:31c:d7ae:9ff1 with SMTP id
 137-20020a81108f000000b0031cd7ae9ff1mr10604838ywq.18.1657389865584; Sat, 09
 Jul 2022 11:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220703154232.55549-1-andriy.shevchenko@linux.intel.com>
 <20220703154232.55549-2-andriy.shevchenko@linux.intel.com>
 <YsWI4nzQa9gmqKdw@shikoro> <YsgBkDeq/KeQ15HU@smile.fi.intel.com>
 <YsgcZHzjzqyJjKqQ@shikoro> <CAHp75VdJ2AT30md_nR3a_hY6L511w+4oqsAJ-CoE2gXitXCrNw@mail.gmail.com>
 <YsmneQ1VAKXMU7eP@shikoro>
In-Reply-To: <YsmneQ1VAKXMU7eP@shikoro>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 9 Jul 2022 20:03:46 +0200
Message-ID: <CAHp75VdkJP+5Lbr=E5s1-cX5ALVAXaVeatr_0KqiCU88h3wHTQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: Introduce i2c_str_read_write() and make use
 of it
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
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

On Sat, Jul 9, 2022 at 6:06 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> > Okay, let me find another subsystem where this will be more useful. Do
>
> Yes :)
>
> > yuo have any wiki page about TODO in i2c subsys for kernel newbies (it
> > would be good task to add)?
>
> There is https://i2c.wiki.kernel.org/index.php/Main_Page but it is not
> kept up to date. Do you mean "cleaning drivers from dbg messages"?

Yes.


-- 
With Best Regards,
Andy Shevchenko
