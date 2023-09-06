Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3B907935C4
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 08:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235424AbjIFG6C convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 6 Sep 2023 02:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjIFG6C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 02:58:02 -0400
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F020CFA;
        Tue,  5 Sep 2023 23:57:57 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d7bae413275so887143276.0;
        Tue, 05 Sep 2023 23:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693983476; x=1694588276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKAX/Cl8B+QFuR8jwwAccCXa8j+76FDvzTqnRpcle2U=;
        b=bAbqO+85rn3O/x110BS1/mPen5C/3nwqIjB/auxHBRkBCwgETBrrKXQ15mo/K+GWEl
         6glBUYKD65z20LaxS3AMS5K8VwT8PfYwwmvoDfJnaJtuOzzzwzOYG6YRBfyuQ1LqEIKI
         /OEG4U8q+YbQecYnFeY2ABkJXhX4XBQ0NMTbRmkbODcou+3Y0BSsXV+CWjrOLdsxsAnN
         o7GKixVsZdfouskZ8yGrZHwsRNZHAqORrLdedWUod1txR8RVJeKqGoXRJ/jWP1k3aGsx
         d2Ngj/epwM0Vogi7JmY3zVjdcu/sck43T+thP3QCbMhCUQth5bEfsZzU/k/1XM1qr5u2
         wB8g==
X-Gm-Message-State: AOJu0Yxwwh4CSqeHN7JBAkHEFTZsZZsjgir9IMkrO9xgtUK4TAio9CtK
        SmkOi1wsmZ1JXHLt9BfaieiQ2RPCuWmBzw==
X-Google-Smtp-Source: AGHT+IFeNPSEJvuJXlJCtsheRWdv4vh18NHbyNAIltOcVrh4kIVoYz+dmJsQoXRfic2FpkIicrXzYw==
X-Received: by 2002:a25:cb8e:0:b0:d7f:71cb:7280 with SMTP id b136-20020a25cb8e000000b00d7f71cb7280mr5546572ybg.24.1693983476427;
        Tue, 05 Sep 2023 23:57:56 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id c198-20020a25c0cf000000b00d71855984b5sm3193661ybf.18.2023.09.05.23.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 23:57:56 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d74a012e613so874002276.1;
        Tue, 05 Sep 2023 23:57:56 -0700 (PDT)
X-Received: by 2002:a25:1184:0:b0:cb2:7e6:191c with SMTP id
 126-20020a251184000000b00cb207e6191cmr16400897ybr.20.1693983475941; Tue, 05
 Sep 2023 23:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com> <20230904135852.12146-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230904135852.12146-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Sep 2023 08:57:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWTHaMK=-rWM7XAHisjFQykqCF_K_ji5C8XibB3eH2eA@mail.gmail.com>
Message-ID: <CAMuHMdWWTHaMK=-rWM7XAHisjFQykqCF_K_ji5C8XibB3eH2eA@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: rcar: avoid non-standard use of goto
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 5, 2023 at 6:22 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Kernel functions goto somewhere on error conditions. Using goto for the
> default path is irritating. Let's bail out on error instead.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
