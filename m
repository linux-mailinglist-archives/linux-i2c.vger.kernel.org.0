Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 570947AA9A4
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 09:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbjIVHDE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 22 Sep 2023 03:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjIVHDE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 03:03:04 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C56C18F;
        Fri, 22 Sep 2023 00:02:58 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d8181087dc9so2017988276.3;
        Fri, 22 Sep 2023 00:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695366177; x=1695970977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhjVAE7WlPuKD4pmT6JIj2Ntx2AmY+YJOfXX6OuQXmU=;
        b=xS4Tf5TaEdSSHfrqv/8KVu2xv7TRkUl9x6nMXoih5lNN4RzVb+JGMcPWckQZ188lu5
         k/BLmTCyHKX71yeiBZr9w5ruOWo7ePpGDp8GGPKkbfir6O6DYwCZFGR740MFkuQreXea
         NHZBSoNupYTIoPNmh0yd5L23hlQJsBB1P0JyaCsjVX5/iW3hKq0k3k1MX30D7a8a3Avn
         sXikHIUt+P840r5iq3BrTEIhvYITMBviG1DAqvFAMIH0Nd9vnCXa9BJkjebHK0FMs91c
         L0NtBg9y/DF6A9pllY2h5PFXU/7lcCbL8qFua3L5LMk3U/8txl2Y6J7xbGwA94dI7qLD
         PlOA==
X-Gm-Message-State: AOJu0YziDqPt+flh0TkQ1lJbRwV8Bl1P9z0G0rWYlyTEzPsJ6cqmBzxD
        K+BvY5XRfOnFoGdhz8R/ysCse2An7gaZHlBK
X-Google-Smtp-Source: AGHT+IHU3R9BixLEiGapSAOaK4OqP289PS0J0IqlCcqabEwUnRI6MfLhpFMIR6x0C7eS6hxbBRQ3hQ==
X-Received: by 2002:a25:2741:0:b0:d81:afb1:bf77 with SMTP id n62-20020a252741000000b00d81afb1bf77mr6903254ybn.28.1695366177212;
        Fri, 22 Sep 2023 00:02:57 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id d23-20020a25e617000000b00d800eb5ac2asm731031ybh.65.2023.09.22.00.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 00:02:56 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d815a5eee40so2024287276.2;
        Fri, 22 Sep 2023 00:02:56 -0700 (PDT)
X-Received: by 2002:a25:311:0:b0:d7b:9d44:7574 with SMTP id
 17-20020a250311000000b00d7b9d447574mr7198081ybd.64.1695366176664; Fri, 22 Sep
 2023 00:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230921125351.3954-1-wsa+renesas@sang-engineering.com> <20230921125351.3954-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230921125351.3954-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Sep 2023 09:02:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0OYDKhrveQWmQ1PUFZ46FzuhpeBv62sFq=j2EbppO2A@mail.gmail.com>
Message-ID: <CAMuHMdU0OYDKhrveQWmQ1PUFZ46FzuhpeBv62sFq=j2EbppO2A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: rcar: improve accuracy for R-Car Gen3+
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 22, 2023 at 2:05 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> With some new registers, SCL can be calculated to be closer to the
> desired rate. Apply the new formula for R-Car Gen3 device types.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Change since v2:
> * swapped SCHD/SCLD to match ordering of datasheets

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
