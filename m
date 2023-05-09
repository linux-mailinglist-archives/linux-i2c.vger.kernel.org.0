Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 666376FBFDF
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 09:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235151AbjEIHDn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 9 May 2023 03:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235194AbjEIHDW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 03:03:22 -0400
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F06C72AA;
        Tue,  9 May 2023 00:03:10 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so28967246276.0;
        Tue, 09 May 2023 00:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615789; x=1686207789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NO8zVEYk/++8zOA7zf8bEX4CpTBTIb8P4P1OokzEZr0=;
        b=eM2rZkFSFjO2C+miufznJWdJ5HsuWtRGXVz0ZunA0vAaDuOaxuNphs0TdbtFUgfvgm
         4AyK7GxK0EHF+gIKq0K/fJ0M34jy0uyjcenJ7huG4N/motPEVgSsa+2b2sWVw+N4P/tW
         QjFGDjtAvn1uWpSzehBKcLn32ySDOGWWAtqixCSHjAsDA2rzs5NCrYC3YwIiCmHmpVgd
         cOfkB4Gqmrn7qA89xkqD/HXdXmf7wIP5ZVXzglovSIaHgl5A7gX+V5wlzlXmvpA6w5n1
         asmhSSewTP5EHk7sH7FyGyt2ZFhy7E+9FnjVim34wCh1xHy/VBMFWYvMDzyPYTmkPV7P
         qZXQ==
X-Gm-Message-State: AC+VfDwic20wNMrwn8JfkiZghXFQvi6k54eYoi/5t2IwUkn9dP70zHJM
        Gz7HV93gi/THdLFBDomI1geKcjQGS99BPw==
X-Google-Smtp-Source: ACHHUZ6xja3n++kSgf38rZBQts6Ky/97oMoUL/O61HfDWUnJ6FafJJh3h2Yp5QHiS+Uhu4x9jKerMA==
X-Received: by 2002:a25:d8c:0:b0:ba1:ecd3:b061 with SMTP id 134-20020a250d8c000000b00ba1ecd3b061mr14123546ybn.14.1683615789184;
        Tue, 09 May 2023 00:03:09 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id d136-20020a0ddb8e000000b0054f6ca85641sm3083113ywe.99.2023.05.09.00.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 00:03:08 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so28879829276.1;
        Tue, 09 May 2023 00:03:08 -0700 (PDT)
X-Received: by 2002:a25:b189:0:b0:b8f:722b:3570 with SMTP id
 h9-20020a25b189000000b00b8f722b3570mr13795243ybj.3.1683615788620; Tue, 09 May
 2023 00:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de> <20230508205306.1474415-67-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-67-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 May 2023 09:02:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+jcQ-ao-Ze14R7ggSyKA8ScC1ueKrqCbX3LYhqrhosQ@mail.gmail.com>
Message-ID: <CAMuHMdU+jcQ-ao-Ze14R7ggSyKA8ScC1ueKrqCbX3LYhqrhosQ@mail.gmail.com>
Subject: Re: [PATCH 66/89] i2c: sh_mobile: Convert to platform remove callback
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

On Mon, May 8, 2023 at 10:54 PM Uwe Kleine-König
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
