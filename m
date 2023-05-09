Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 793926FBFDB
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 09:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235170AbjEIHDL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 9 May 2023 03:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233852AbjEIHCm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 03:02:42 -0400
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84212D044;
        Tue,  9 May 2023 00:02:41 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-559f1819c5dso82348037b3.0;
        Tue, 09 May 2023 00:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615760; x=1686207760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NO8zVEYk/++8zOA7zf8bEX4CpTBTIb8P4P1OokzEZr0=;
        b=Ki4tUgQ3F0ZehKg5LMk+ADIR5sSeKLahi5KZHdjvEG8aPMBe71F7Jf18s+E3MmnRSp
         p2QidlTPVziwIE7VevjNlaNq1ndhWGOo4KRuKkFpFMIX2hYJqKvJXYPWjhhRgmFCZGQP
         2KgVfyKEWzO1FYLrnF4H773M5JO95Wj3buAU5+YIqtkcziH93+wew97DvcOTwFXChqHU
         tRMu+5PGQiBIt2IruV4jg4Y3DZVpXX04jUaWuPqW0SjRerim+Hn1fdhV4VJnMVHf576j
         U0Pu4dwghA9Jw7s9dm5Q7vA0zHF/5Lc+QHMKFC0WM4kMxPkgkdvmGJ0D04ITBa05by7Q
         uxAA==
X-Gm-Message-State: AC+VfDzLFb05V0vmZJ+UaYSNnYpT02d6WOT7MA/DXSVbbnugnZnjRZBG
        WujxZvLwioFpVDRTiE/vjn47ESEM4/cu9Q==
X-Google-Smtp-Source: ACHHUZ6sYNt8uafptKdvJvnIvtSjcRfSpIPvU3OEfyZFWJWSvbt6w7drEKWK3a+Nn52l4tgF76CZ3w==
X-Received: by 2002:a0d:e696:0:b0:55a:2d2b:cdf0 with SMTP id p144-20020a0de696000000b0055a2d2bcdf0mr14060817ywe.8.1683615760250;
        Tue, 09 May 2023 00:02:40 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id u75-20020a81844e000000b0055a7ff0a5cdsm3056984ywf.27.2023.05.09.00.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 00:02:39 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-55a76ed088aso82146387b3.2;
        Tue, 09 May 2023 00:02:39 -0700 (PDT)
X-Received: by 2002:a25:ab2f:0:b0:b9d:c877:b302 with SMTP id
 u44-20020a25ab2f000000b00b9dc877b302mr13879044ybi.10.1683615759580; Tue, 09
 May 2023 00:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de> <20230508205306.1474415-60-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-60-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 May 2023 09:02:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVg8YW91nRpJG_4js-F2sq_yLqeyX8OU779V_QXunF_vg@mail.gmail.com>
Message-ID: <CAMuHMdVg8YW91nRpJG_4js-F2sq_yLqeyX8OU779V_QXunF_vg@mail.gmail.com>
Subject: Re: [PATCH 59/89] i2c: riic: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
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
