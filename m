Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 549364E83FA
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Mar 2022 20:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234705AbiCZUAe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Mar 2022 16:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbiCZUAe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 26 Mar 2022 16:00:34 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A027346B26
        for <linux-i2c@vger.kernel.org>; Sat, 26 Mar 2022 12:58:56 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t25so18613938lfg.7
        for <linux-i2c@vger.kernel.org>; Sat, 26 Mar 2022 12:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Xq0aLjK8mlWyJ0CXnoW648bxQRycwPWS0yoFwkrlVOo=;
        b=dFLDy7O2LZUcd7uoEP7FY3qmy3tSFS+MBFI1YigIfXCjrAowsTXSKLadzM4QtBSBXT
         z7SwY4RXCNcKvubpwS0SlVWOxK4BadrgxNayuVoBbUyF+lprdZAKjQVo2khFs8fMrZ2t
         MlXNsy5nBVSJXUdrlhXUDhKpxa+AoSGNzooEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Xq0aLjK8mlWyJ0CXnoW648bxQRycwPWS0yoFwkrlVOo=;
        b=UQBRq/eaorMelbQFhApTdPe3pleL++ORTpmXfTp9w0Cc5GnGADyVF9MYgC6uIeEKOa
         V/D604flJUisZ8gBEGJaHMg5lVjEpjChX3On4nMtv/sOABjH5e3ABv5CE//QV4cD7VQN
         D3zNZ4CQp9q4IUf16BtDPTmAcsWkunhui8MWEySJCjcddWu6e3R3fBbPrprK74L0TCCz
         Hy0ZO1FjJsFcPa3vDYdK8MNQlc0v28aRXZZ7X0VMqvedUMFouAiGvBux+6IVacAfxBOp
         Dn9V9obbV6IGWH5OXYlsncg4bclCVZCC4obbUKjADOV24/l6t7FUI6zZnZpeZ9aNMgem
         Y/vA==
X-Gm-Message-State: AOAM5321z4R0y9QOG8kcSC26cdEVDW+ogbLO9+2jGWtUUgQOeIF/Vfwm
        pK1ARq39aqpps18grkc5BIPy0BNWIZ35v3bcPa0=
X-Google-Smtp-Source: ABdhPJzx9v24EoS/svtrp8Hskb3i5va9WjfEOzhLTbunudYAc9w4BOrsYD7m4AbT6bW8OHJAMgyyAg==
X-Received: by 2002:a05:6512:31d0:b0:44a:db2:8f20 with SMTP id j16-20020a05651231d000b0044a0db28f20mr13036643lfe.96.1648324734643;
        Sat, 26 Mar 2022 12:58:54 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id t2-20020a05651c204200b00249324dd50bsm1119358ljo.71.2022.03.26.12.58.53
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Mar 2022 12:58:54 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id k21so18629383lfe.4
        for <linux-i2c@vger.kernel.org>; Sat, 26 Mar 2022 12:58:53 -0700 (PDT)
X-Received: by 2002:a05:6512:b13:b0:448:90c6:dc49 with SMTP id
 w19-20020a0565120b1300b0044890c6dc49mr13374071lfu.542.1648324733085; Sat, 26
 Mar 2022 12:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <Yj19RH3qpzQsIV/O@shikoro>
In-Reply-To: <Yj19RH3qpzQsIV/O@shikoro>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 26 Mar 2022 12:58:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgoeUc15-8Wu8U=4FnwhgmyU3C13R107oigbmJRpi_sZA@mail.gmail.com>
Message-ID: <CAHk-=wgoeUc15-8Wu8U=4FnwhgmyU3C13R107oigbmJRpi_sZA@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c for v5.18
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Terry Bowman <terry.bowman@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 25, 2022 at 1:28 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> I2C has for 5.18: tracepoints when Linux acts as an I2C client, added
> support for AMD PSP, whole subsytsem now uses generic_handle_irq_safe(),
> piix4 driver gained MMIO access enabling so far missed controllers with
> AMD chipsets, plus a bulk of device driver updates, refactorization, and
> fixes.

It feels odd/wrong to use the piix4 driver for the AMD MMIO case on SB800.

Would it not have made more sense to just make that a separate driver?

It feels like now the piix4 driver has a lot of "if SB800" for the
probing code, and then a lot of "if (mmio)" at runtime.

I've pulled this, but just wanted to mention this "that looks a bit
odd". How much code is actually _shared_ in the SB800 case?

I'm not insisting on splitting this up - maybe it all makes sense. I'm
just questioning it.

             Linus
