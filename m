Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30FF174D5E0
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 14:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjGJMkd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 10 Jul 2023 08:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjGJMkc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 08:40:32 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA5199;
        Mon, 10 Jul 2023 05:40:27 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-579dd20b1c8so52984797b3.1;
        Mon, 10 Jul 2023 05:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688992827; x=1691584827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZqGOW9woC4hxySuD731jBWPOXAr5ZaE6PhY8Yhm8lY=;
        b=ZKLP/PywOlCp6Sa5q1VuQ0U38wL3kiaTt8pX/3p1O9byMpkIVHF1w4WC8o66FS4d6f
         SGum8XUdo75a+q+OJX6/G0qnHpZX6kYw6GXUazD/oTOoFaadzkECRz6hkXthApcNWv7V
         r/rtFxRNuEOV6AX5/o55rz7Vzu959xasMYQbvfCOxBtqD1DGE91f5VJ5xRSGYwqLdZsU
         0ToI77zDWEjrQVKJ7M5B/7XmvBLKceKVPME2zylOy4G62UR5fYqF9oxZyOWBRaduW64o
         wmgWLtM0xYYpElSiFYtNqfrnVAnG3qEfyAkdruKgwRDDqc6JX4QWdPjJvltEvlSdx5l0
         TAFQ==
X-Gm-Message-State: ABy/qLbQWJhV899YD6RYcCxdFgUHSHQJ+uP/sKTGoflzrZZ7Z0rc6ED0
        pVxP1TWwKsAK8+CcNy8EfHjl8rY3Mqetqg==
X-Google-Smtp-Source: APBJJlEJMTbC7f17bZd3ijIwfZ3qfrMe+B/VWAArTlKJZz8rElYmkFojUmt6Ej6gBRJN7hPBS08vJw==
X-Received: by 2002:a81:7bc5:0:b0:577:150f:3efe with SMTP id w188-20020a817bc5000000b00577150f3efemr10164599ywc.27.1688992826671;
        Mon, 10 Jul 2023 05:40:26 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id o2-20020a817302000000b0057a8de7f43dsm252137ywc.109.2023.07.10.05.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 05:40:26 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-c5079a9f1c8so5299926276.0;
        Mon, 10 Jul 2023 05:40:26 -0700 (PDT)
X-Received: by 2002:a25:f40e:0:b0:bc5:6c3d:9e43 with SMTP id
 q14-20020a25f40e000000b00bc56c3d9e43mr9410301ybd.6.1688992826199; Mon, 10 Jul
 2023 05:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230705204314.89800-1-paul@crapouillou.net> <20230705204521.90050-1-paul@crapouillou.net>
 <20230705204521.90050-3-paul@crapouillou.net>
In-Reply-To: <20230705204521.90050-3-paul@crapouillou.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jul 2023 14:40:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoSRXf3AWcbjx7sPW2JzKD2_77HDQM_2cv6uDutw-H8w@mail.gmail.com>
Message-ID: <CAMuHMdVoSRXf3AWcbjx7sPW2JzKD2_77HDQM_2cv6uDutw-H8w@mail.gmail.com>
Subject: Re: [PATCH 21/23] i2c: sh-mobile: Remove #ifdef guards for PM related functions
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
