Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3B866FBFD1
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 09:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234929AbjEIHCH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 9 May 2023 03:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234840AbjEIHBj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 03:01:39 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6736446BD;
        Tue,  9 May 2023 00:01:38 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-559e317eef1so81041557b3.0;
        Tue, 09 May 2023 00:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615697; x=1686207697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8IHLV/BKF7Q/2XmYmPAm+C1DD5o9mDJUXDw9Xzrg1M=;
        b=SkAP1tNQTpWrh1zFKGqffVUWTBFARglNHJYo6DRBK4vVsiuiZDK012dcZqNLudq26o
         OeWIvn13bbJyHf8izkg/UdCqF496F4GyTjiBIrIHESCYkiAWtWkl2qOsBlQvcgEQjVti
         l1H6UTloe32q0oYoWXT7VKg1yU5rMhgjDJ4eEiy6BCPGTO/Uz4D2wlv8ymiHEFR28JMf
         7b0EwZrXOFnBX6JfZ6/+JtPb9cm2OJXp3uziMPtPFWHpGu+yNpYspgdlg75fjwMdjXke
         x2XqF8lX+mFzyzVvsL+2iBiJ5uAWrTFg9tolxIq4zUypU6zi3cEoZvSLlEYAMNzliMmd
         lWlA==
X-Gm-Message-State: AC+VfDx8h0e83uCJM1G9WXfefjW9WgmZi+DJj2BxDX9a6wkzawu1WtkL
        URuP61vm9i8YS5JZ3/3NWCRgv8kxUJ0CWQ==
X-Google-Smtp-Source: ACHHUZ4Hf5d6bqf3SIQssv0h1hcx5aE6ncPbi7QodfJfJo1LHf59JUrUXtsJHHOLi4GVi6xhGz6TZA==
X-Received: by 2002:a0d:c641:0:b0:55d:8cee:96e9 with SMTP id i62-20020a0dc641000000b0055d8cee96e9mr13452950ywd.5.1683615697412;
        Tue, 09 May 2023 00:01:37 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id k4-20020a0dc804000000b00555ca01b115sm3042480ywd.104.2023.05.09.00.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 00:01:37 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-b9a6ab9ede3so7096567276.2;
        Tue, 09 May 2023 00:01:36 -0700 (PDT)
X-Received: by 2002:a25:4285:0:b0:b99:cace:9cd9 with SMTP id
 p127-20020a254285000000b00b99cace9cd9mr12937514yba.44.1683615696745; Tue, 09
 May 2023 00:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de> <20230508205306.1474415-22-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-22-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 May 2023 09:01:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEaSmijjM2QnHq+oA_86dMmkLgoyN07uQDPcWSsXuC+g@mail.gmail.com>
Message-ID: <CAMuHMdUEaSmijjM2QnHq+oA_86dMmkLgoyN07uQDPcWSsXuC+g@mail.gmail.com>
Subject: Re: [PATCH 21/89] i2c: emev2: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 8, 2023 at 10:53 PM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
