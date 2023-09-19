Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF297A5E5F
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 11:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbjISJmf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 19 Sep 2023 05:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjISJme (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 05:42:34 -0400
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5291EA;
        Tue, 19 Sep 2023 02:42:28 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d85800eb234so142091276.0;
        Tue, 19 Sep 2023 02:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695116548; x=1695721348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0h3rL/x/HNLwpVF5ucA8c2hYYGS3gbuq0AP1UWDvEs=;
        b=AhuKR+HdBoiUIDJLS+JsYBl7581kTRUAnGloEO/MjEy2okFzy1fHbUv0RAMD7AOIvc
         jDU4x7HAi07T08BLQ+5IEbSc5osgLboD0N1enAOhj9ySSeuYzGIY+TVSHHu2hJDX4uwC
         OlNbHhTFWCTC5FFd/cwU61smAcQXf7l6gIGz7gfSkfUpN6junbzPW+yY0V9DO38EZyU9
         YU6N2sPIzNmvLB/ceEheXMxR9iyt+iYdYL/0rmuSpjZIyCp7vB2aHCQAD8ksMRx9ckdV
         eAihhfqIkGaxiXReEDK5LdiUYCaXUke+yzJhUFWGqRijXzt0+aovcc9IurROd7wP6RPq
         kOlA==
X-Gm-Message-State: AOJu0YzxHhUtyfdPMxc7L/9hm11Mx75RsXb5fPMzSJ7sMjfiEZbapopU
        ypG/qgg5yISqG79yJ4ZAyW9WoDyC//araQ==
X-Google-Smtp-Source: AGHT+IE+KcTp0QZC8Qykg6chQUk/YP+wwMubs2Ve6QNR3XrrihoWsgqreIKpCvxkt7dPSLlL3zV1Ag==
X-Received: by 2002:a5b:60a:0:b0:d7e:44de:1c1 with SMTP id d10-20020a5b060a000000b00d7e44de01c1mr10151542ybq.14.1695116547897;
        Tue, 19 Sep 2023 02:42:27 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id z19-20020a25ad93000000b00d72176bdc5csm2763486ybi.40.2023.09.19.02.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 02:42:27 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59bcd927b45so57167697b3.1;
        Tue, 19 Sep 2023 02:42:27 -0700 (PDT)
X-Received: by 2002:a0d:d583:0:b0:59b:4f2d:231 with SMTP id
 x125-20020a0dd583000000b0059b4f2d0231mr12017509ywd.45.1695116547461; Tue, 19
 Sep 2023 02:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230913062950.4968-1-wsa+renesas@sang-engineering.com> <20230913062950.4968-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230913062950.4968-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 11:42:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3LTp-35_+2QAkvq0a+K8uAzY2R9A8xryjP5po+d18ig@mail.gmail.com>
Message-ID: <CAMuHMdX3LTp-35_+2QAkvq0a+K8uAzY2R9A8xryjP5po+d18ig@mail.gmail.com>
Subject: Re: [PATCH RFT 2/2] i2c: rcar: improve accuracy for R-Car Gen3+
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

Hi Wolfram,

On Wed, Sep 13, 2023 at 11:38 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> With some new registers, SCL can be calculated to be closer to the
> desired rate. Apply the new formula for R-Car Gen3 device types.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c

> -       /* keep icccr value */
> -       priv->icccr = scgd << cdf_width | cdf;
> +               priv->icccr = scgd << cdf_width | cdf;
> +       } else {
> +               u32 x, sum_ratio = RCAR_SCHD_RATIO + RCAR_SCLD_RATIO;
> +               /*
> +                * SCLD/SCHD ratio and SMD default value are explained above
> +                * where they are defined. With these definitions, we can compute
> +                * x as a base value for the SCLD/SCHD ratio:
> +                *
> +                * SCL = clkp / (8 + 2 * SMD + SCLD + SCHD + F[(ticf + tr + intd) * clkp])
> +                * SCL = clkp / (8 + 2 * RCAR_DEFAULT_SMD + RCAR_SCLD_RATIO * x
> +                *               + RCAR_SCHD_RATIO * x + F[...])
> +                *
> +                * with: sum_ratio = RCAR_SCLD_RATIO + RCAR_SCHD_RATIO
> +                * and:  smd = 2 * RCAR_DEFAULT_SMD
> +                *
> +                * SCL = clkp / (8 + smd + sum_ratio * x + F[...])
> +                * 8 + smd + sum_ratio * x + F[...] = SCL / clkp
> +                * x = ((SCL / clkp) - 8 - smd - F[...]) / sum_ratio

Woops, I missed that both "SCL / clkp" above should be "clkp / SCL".

Fortunately I noticed your "[PATCH 2/2] i2c: rcar: add FastMode+
support for Gen4" fixed that, but I guess it's better to fix that in
this patch instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
