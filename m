Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0069631B6E
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 09:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbiKUIa1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 21 Nov 2022 03:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbiKUIaZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 03:30:25 -0500
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57521C90F;
        Mon, 21 Nov 2022 00:30:24 -0800 (PST)
Received: by mail-qk1-f175.google.com with SMTP id g10so7532048qkl.6;
        Mon, 21 Nov 2022 00:30:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VV82pu5u8NbT9jq7z3fcKpvggpPLbpVY5rhb5eoeVg=;
        b=Bb5NBp9wH8abyyLYWcWE1Xp9pOY0cZ9tUDBGOZD752xseD2M2kUmxGeCXsejlREc8P
         L9WZL6QjRF2op0U3LdQJTXgIriFSEeS9gx58rS0HRI/oxdpOy5KftrF9NAcNbyrkWiUh
         LQvMIEAp+k/2ale0uQkLHsNh+7WF+PRPNYWaTr0UKlOXUYrf96OBq2bZs8CaQ55nY709
         7lz0flMo+g6BBsnYIBrKainZMw0p9YHG71Rf9x1kF1PDJrXVRhcLChpXkCQubNSenI3d
         fvQF4CoqkO6OwcbXC1klm4/lQy18DfyE+ZoeAEevwW1vx025Ry71pJ0X+LXauTjfI87a
         LpxQ==
X-Gm-Message-State: ANoB5pl7h2o4HX/9+xvwmjnwGUb75sKiTo29h+9fiyBShD2P7X4xnT9k
        iTNE9ubVaPRfNOvHwVMj+yyjnyqpPaIuPQ==
X-Google-Smtp-Source: AA0mqf5t78rHQSlm3H2YKV+FU7uqt3YYw7xeOFB19IY7AWRPwvbZlKl7EYQf8K8JuUR+rr3CXZ1rfg==
X-Received: by 2002:a37:b1c4:0:b0:6fa:89:6642 with SMTP id a187-20020a37b1c4000000b006fa00896642mr15441239qkf.284.1669019423736;
        Mon, 21 Nov 2022 00:30:23 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id dm53-20020a05620a1d7500b006fbbdc6c68fsm7656744qkb.68.2022.11.21.00.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:30:22 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-3704852322fso106536657b3.8;
        Mon, 21 Nov 2022 00:30:21 -0800 (PST)
X-Received: by 2002:a05:690c:b81:b0:37e:6806:a5f9 with SMTP id
 ck1-20020a05690c0b8100b0037e6806a5f9mr604336ywb.47.1669019421512; Mon, 21 Nov
 2022 00:30:21 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-425-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-425-uwe@kleine-koenig.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Nov 2022 09:30:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ3cW2a-SLsKJ7Oot_5ww-D78ainJkb4UBV318vfwrVQ@mail.gmail.com>
Message-ID: <CAMuHMdXQ3cW2a-SLsKJ7Oot_5ww-D78ainJkb4UBV318vfwrVQ@mail.gmail.com>
Subject: Re: [PATCH 424/606] mfd: bd9571mwv: Convert to i2c's .probe_new()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Nov 19, 2022 at 1:05 AM Uwe Kleine-König <uwe@kleine-koenig.org> wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
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
