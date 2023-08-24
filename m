Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDE4F7868CA
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 09:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbjHXHnD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 24 Aug 2023 03:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240429AbjHXHml (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 03:42:41 -0400
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C7A170A;
        Thu, 24 Aug 2023 00:42:26 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-bcb6dbc477eso5955730276.1;
        Thu, 24 Aug 2023 00:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692862929; x=1693467729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhv4Bg1fdD4fcuHP4DlJnIZ9JdHOfbSov1NYQWp3Ek8=;
        b=AUkWWfX/zFe56Yxj+BNMG9GYZd670gyfSKx962grd7skql98XJFT6sYafeF+K5Z5UT
         uOSKmvz4SSZIBuz5mqlJIuCg1m7IThElJhOyVuw3ickhoASJp57LSq/vhONcjoAzu5DS
         fJuAxaKSWp9TpgL6jR3raPzeb5LyRJKMzifsIEdYLoKXmiPpU6Qfxu/lmAHFtsYOm+cL
         DA26NRyOTLp4V8sfKm1CH9KnnpgoD1ArDN88uQ2GUXJ/q7zmPf9FaW3o0Ws2OXLChTub
         FKdW2N+Kp3V2QocRbp7vgkdQBkENXTXCCyC8bqGPrQelFUg6dYk1WS8VekSuws3VXTt9
         ipig==
X-Gm-Message-State: AOJu0Yx9vL8zg2n+aLaEmW1xcn/9o7fif0DG/MxgpsxjIpyozYQSjt2+
        1CGVEXxp2jYf0iYPVcQKqxHj8MGbeILy8w==
X-Google-Smtp-Source: AGHT+IFHvPS0ch0Ft+QoIRmYP0ssAD5Obu+K54gJyP4DyMVpin6CXenCeFQLr0zMO2e8H5nv/tKibg==
X-Received: by 2002:a81:dd02:0:b0:58f:afe5:4c16 with SMTP id e2-20020a81dd02000000b0058fafe54c16mr15233630ywn.30.1692862928821;
        Thu, 24 Aug 2023 00:42:08 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id i127-20020a819185000000b0058c4e33b2d6sm3798266ywg.90.2023.08.24.00.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 00:42:08 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d77f614243aso478610276.0;
        Thu, 24 Aug 2023 00:42:08 -0700 (PDT)
X-Received: by 2002:a25:ae92:0:b0:d3b:e659:5331 with SMTP id
 b18-20020a25ae92000000b00d3be6595331mr14472125ybj.58.1692862928507; Thu, 24
 Aug 2023 00:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230823183749.2609013-1-robh@kernel.org>
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Aug 2023 09:41:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWSrpjUK4Fa9cBiRqsnhh2GxyXK5fCt8B-RmaDgEy6OeA@mail.gmail.com>
Message-ID: <CAMuHMdWSrpjUK4Fa9cBiRqsnhh2GxyXK5fCt8B-RmaDgEy6OeA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
To:     Rob Herring <robh@kernel.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Corey Minyard <minyard@acm.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        M ark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
        linux-iio@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
        linux-watchdog@vger.kernel.org
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

On Wed, Aug 23, 2023 at 8:38 PM Rob Herring <robh@kernel.org> wrote:
> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  .../bindings/soc/renesas/renesas,rzg2l-sysc.yaml     |  4 ++--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
