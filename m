Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE78559861
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 13:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbiFXLTF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 07:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiFXLTE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 07:19:04 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A33256F84;
        Fri, 24 Jun 2022 04:19:03 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id o43so4087447qvo.4;
        Fri, 24 Jun 2022 04:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Cj7lugVD8UUUwjT9MTe2bieOs5d3zpPuDxtcUlSg/I=;
        b=Z+5dX+vSjYpknJJFehsfSSCyN/Hqx1EsogtPx5pzDSf5I4PWpHVRerOLSr5T8VE1HA
         HLSa8gut0olyd0MyoizXTMNZbYwrPaMylaSF3vj6k0CKDarbU7LlOeqqBh5AZCVLUz4g
         jOq2NPO4hvCm+0UCDnFdHRplb0sITv0OfopvyKv87HheNnXDTbevn3SV+y3A8gyndEXv
         ZpJpxMLDNbP+tplFuHH3BSplCYEszu47SaqXn+jbla2+fGJZRtpCTXusXzrkki5JCpTq
         QRlObY8NV07uIks8rswCTZ/kp+rmCUkRR2HtUqsjYnqn3vTWJTmbkHYnEE4s+lwwMFP/
         7swA==
X-Gm-Message-State: AJIora+1jAAEppMOzkZxj2hYXHyxsye2V3vKdDEO8vzVBOVCcXBXy/22
        qBpEiLimBcQFJVytOuTxDsMQxFsPYEoQZw==
X-Google-Smtp-Source: AGRyM1vkYfMcAkxILupBKCz5jxJSPd4DWUFFTIAN6CYyh8hpXownl3fxnyxSoe3fxnowZJ0jLFCW3w==
X-Received: by 2002:ad4:5be5:0:b0:470:3d13:81d6 with SMTP id k5-20020ad45be5000000b004703d1381d6mr24227399qvc.114.1656069542399;
        Fri, 24 Jun 2022 04:19:02 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id bp11-20020a05622a1b8b00b00304e38fb3dasm1294722qtb.35.2022.06.24.04.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 04:19:01 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-31780ad7535so21328187b3.8;
        Fri, 24 Jun 2022 04:19:01 -0700 (PDT)
X-Received: by 2002:a81:4fc9:0:b0:318:b0ca:4b13 with SMTP id
 d192-20020a814fc9000000b00318b0ca4b13mr4238711ywb.502.1656069541307; Fri, 24
 Jun 2022 04:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220624101736.27217-1-phil.edworthy@renesas.com>
In-Reply-To: <20220624101736.27217-1-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Jun 2022 13:18:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWHL4W4JW72yczODohj+xZ3EmqVm0dtuWxbfY_fs3VZeg@mail.gmail.com>
Message-ID: <CAMuHMdWHL4W4JW72yczODohj+xZ3EmqVm0dtuWxbfY_fs3VZeg@mail.gmail.com>
Subject: Re: [PATCH 0/2] i2c: Add new driver for Renesas RZ/V2M controller
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sven Peter <sven@svenpeter.dev>, Jie Deng <jie.deng@intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Phil,

Thanks for your series!

On Fri, Jun 24, 2022 at 12:17 PM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> The Renesas RZ/V2M SoC (r9a09g011) has a new i2c controller. This series
> add the driver. One annoying problem is that the SoC uses a single reset
> line for two i2c controllers, and unfortunately one of the controllers
> is managed by some firmware, not by Linux. Therefore, the driver just
> deasserts the reset.

That is actually an integration issue, not an i2c controller issue.

Perhaps we need a RESET_IS_CRITICAL flag, cfr. CLK_IS_CRITICAL,
to be set by the reset provider?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
