Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDFBF7AAA65
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 09:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbjIVHhV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 22 Sep 2023 03:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbjIVHhU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 03:37:20 -0400
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C86EC2;
        Fri, 22 Sep 2023 00:37:14 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50308217223so2977034e87.3;
        Fri, 22 Sep 2023 00:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695368231; x=1695973031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/AwkMqcydRXtjTPwCiDk2wI5A7HmbHim06+U2RTEk8=;
        b=KsZyMNwFEGsq1yOuPmKCae7mAnuMZDeAR+hox/xVQt4KpJz2ll80St7Z69tG83yFXw
         94WS1c6vc42Ivq7XGSbJbNalRxEqdCEt59n8ppoFhJykaYDUiTDZyb+4BeoAQ7bml9G5
         zFzNddaHaAH/dkg8KzaduLFooqrOXec0rgoMGRe4nnoK6ztan6/QqmgIm4Rt9zqjdQiZ
         HcbLj7GrZvYwuKUZwJk43CNqLeXjbcsp+wpWJPsiE8IqG/5vi1pwoJt1QPUsQSLnqv7t
         kGgXL626ec1sVVUYsWqmF60Lbm9J6Ue/A81pOQWovibQ19Rugsruet5qGfovt6bn9eP/
         Rsbg==
X-Gm-Message-State: AOJu0YwqvOzeEfWag9AKTYvwbZBQ0PoxP6YGaOEsSNdqAMP6fpBEB2F3
        G8I0UYPXka+CDUl3vzO6Je5+P0boRs76pcr/
X-Google-Smtp-Source: AGHT+IEvATs3i/pFs3zL5O5gTMQn1d2NKdo1QUITAGRN48aYbq0uUqyyArLMRflMu89Pwaie498TYA==
X-Received: by 2002:a05:6512:208c:b0:500:acf1:b42f with SMTP id t12-20020a056512208c00b00500acf1b42fmr6255825lfr.53.1695368230788;
        Fri, 22 Sep 2023 00:37:10 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fdc0023a47sm617625lfe.238.2023.09.22.00.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 00:37:10 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c02e232c48so30366231fa.1;
        Fri, 22 Sep 2023 00:37:10 -0700 (PDT)
X-Received: by 2002:a2e:908c:0:b0:2bc:da4a:4649 with SMTP id
 l12-20020a2e908c000000b002bcda4a4649mr6786575ljg.22.1695368230179; Fri, 22
 Sep 2023 00:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230921085752.8686-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230921085752.8686-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Sep 2023 09:36:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkn1saSGo_71cwfAaia4L_2q-91HqePTvXxer9j_JfOQ@mail.gmail.com>
Message-ID: <CAMuHMdVkn1saSGo_71cwfAaia4L_2q-91HqePTvXxer9j_JfOQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: gpio: adhere to coding style
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
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

On Fri, Sep 22, 2023 at 1:51 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Advertise our coding style by following it :)
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
