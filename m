Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF92786219
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 23:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237327AbjHWVQ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 17:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237875AbjHWVQr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 17:16:47 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099AB171A
        for <linux-i2c@vger.kernel.org>; Wed, 23 Aug 2023 14:16:34 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d746d030a86so4837656276.1
        for <linux-i2c@vger.kernel.org>; Wed, 23 Aug 2023 14:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692825394; x=1693430194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEpTjrnLVqxen66G7Uvz7Jyy/E11cVlVrjCW6/VyKj8=;
        b=ZDmv2BjJU3fBSftYGcNM3tb+ILU/d9+cLODcLN7bJx5jE0GqvFKrPnlSYGlL0k9kWu
         m0bch7za38IJ+CLWsWjflpljG/O8F9HEsNE/VWjVNStBDOBq3iJDnH2eTLO/dJEAtALA
         zbXY+4ZWcbcUYtwqB7UctSATyz1sDYmgfZ/uZj88iB4dhaAHsNB4lm1XJShf+lSlTUF4
         q1mw8cBg/PsTLqlxfYRQ9OdT1JyBSqfrgsLuehUHu9V36ypWdR+RMX9JIQmW7yxqcnfx
         Bu1+6uVlgAFqvayOjaJa8cEpXa7Hm+cDiofeMeKPmewLASFqzTHTuUzB1cC9zTcv8uzK
         +bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825394; x=1693430194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEpTjrnLVqxen66G7Uvz7Jyy/E11cVlVrjCW6/VyKj8=;
        b=QVGW5oPW/8PMBX/TLR7O9KCed/zUdMUHNr4woz5T/5//5u6Y3UDIq2V2I4vk/br8wt
         VJeno95i68Etz/7TldhxCTQZ2+rJxvvsjFzBjp2/kjXk0b55Njp+GyhM8yz7Wl6O+PES
         bxBYt2x95jdrUoNxBUxhl2Hvr0rDxgHGTJSZy+DiESVR2t/J04GOknWm91u+fDKJVOyj
         HlMlQ2pKDVT4KLyXrcneyc4Xzyr9pASo3bCAl1VKTj8Ny+Y8n7crYUpascYP9ueLiU/V
         TIMNkTbwWbTeE4X8XUtBDO38vkIuQlkVLXrPkPdjdpM/uUw8FstM0XWZFvDRKsMlykhO
         HBqw==
X-Gm-Message-State: AOJu0YxBlDT27FDNw4LmovCcNNrN0AoeJd2LNQdMirgQXhAHxsngJ8W8
        sZXc4nujFM2MMJCQmW8QgE3mqJh/CuCaKK9WpvpBcQ==
X-Google-Smtp-Source: AGHT+IGU5hlAbzjKR6dHf8nG7wjH+gLTIhLdkOAR0BQZYCAzmvxO+0vsobrLpwu8+6G8uJRZXAov+P50unjaO9+ZE7g=
X-Received: by 2002:a25:c08f:0:b0:d09:f39b:cecf with SMTP id
 c137-20020a25c08f000000b00d09f39bcecfmr12862557ybf.9.1692825393910; Wed, 23
 Aug 2023 14:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230823183749.2609013-1-robh@kernel.org>
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Aug 2023 23:16:22 +0200
Message-ID: <CACRpkdbuB-NotnMXc9vZj-byjk7spCSkZ+Dx=R_eOqoSV5CdTA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
To:     Rob Herring <robh@kernel.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 23, 2023 at 8:38=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
