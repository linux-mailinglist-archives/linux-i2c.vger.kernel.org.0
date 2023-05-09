Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D52D06FBFD9
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 09:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235173AbjEIHCk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 9 May 2023 03:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235157AbjEIHCK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 03:02:10 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE72144AF;
        Tue,  9 May 2023 00:02:08 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-b9e66ce80acso7322802276.3;
        Tue, 09 May 2023 00:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615728; x=1686207728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NO8zVEYk/++8zOA7zf8bEX4CpTBTIb8P4P1OokzEZr0=;
        b=VdMh4qjR5sAAJo806lfX7WKBJGrawQQfi0W3ZvI9+biUllhZcUWXZLcwQvTukMoHI5
         ooYPsC/kUr6lDIQdpciF8ULPNHnD/L+Y3I1BX0fcROTT12lQNpwlvHH8whhym3jtwE5z
         qVGc/8d3/2+xqEUJ0ZY3jUWlOaJn3J58Z5xnpG7udwf5GAiNmgIxi7xnFKvm835QkETQ
         s6oV/NqWOcIWxClQocomhMQSJ4n2yTnr5CO4aR4Taq0RWNkaYWoo0gRL+1+cnNnzWPxt
         vqIwYnA0pA9wGTFEgFvNhND71pPmDDsPvhe1tYibrIT5KQXT3ihhXpcBmLYKWWx6XOLU
         IXmA==
X-Gm-Message-State: AC+VfDyYhK1p6tXsBTTbaMkTrQNQmTHQc3l5mH2pc8P1JMrRVOEef+PZ
        vUIb1t6E+RN3uRWSAEABBecI633D9bsKzA==
X-Google-Smtp-Source: ACHHUZ46hsoA/n2p0/V2D1xlIbD2RNJ/RHg8Fsi0lbaYK7RgpwqqV5ML+CI9gDfpZEDpJlc1Bi7X/g==
X-Received: by 2002:a05:6902:114a:b0:b9d:9183:482c with SMTP id p10-20020a056902114a00b00b9d9183482cmr15438802ybu.18.1683615727943;
        Tue, 09 May 2023 00:02:07 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id y80-20020a253253000000b00b997ef4b45dsm2850558yby.65.2023.05.09.00.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 00:02:07 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-b9a6869dd3cso7329567276.2;
        Tue, 09 May 2023 00:02:07 -0700 (PDT)
X-Received: by 2002:a25:4087:0:b0:b9e:5006:42af with SMTP id
 n129-20020a254087000000b00b9e500642afmr13317900yba.58.1683615727214; Tue, 09
 May 2023 00:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de> <20230508205306.1474415-59-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-59-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 May 2023 09:01:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9B2s0UTfkNvNCvtx6tbmKWfyyMOtSuLJSamA_aSoC2w@mail.gmail.com>
Message-ID: <CAMuHMdU9B2s0UTfkNvNCvtx6tbmKWfyyMOtSuLJSamA_aSoC2w@mail.gmail.com>
Subject: Re: [PATCH 58/89] i2c: rcar: Convert to platform remove callback
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
