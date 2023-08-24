Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09C7878659B
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 04:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239454AbjHXC5S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 22:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239464AbjHXC5F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 22:57:05 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43CA5124;
        Wed, 23 Aug 2023 19:56:59 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-76d92a5e652so383902785a.0;
        Wed, 23 Aug 2023 19:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692845818; x=1693450618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9Fv6zMHUmxIJtQTWw3otja3eb7daBbRUnAPWR3+Kws=;
        b=EVi36tdUqJMlOvMF5BKp2qBduN+pjKuz6Us6qWN0euQMxX//FBn2tkevUvmQ0jT7dy
         QIYTSLIrOwJJrbwKo9ZkDfR2N+fo2G2cnY9a7T0gyOxaEX87NC1xNeL/UwLcOFtHALic
         ZLiva7jbc5XlX1Ewghy60+GynWZHY461VYZBL+rKjJr0gJc6PhtDfsvnnfDKMTF+nmSY
         b67dYc7Ry1QTt8dSvag7E3m3wxL+T/zxdYaloB7x8dxtgj588ko4UqYQcmY36CHVtxWt
         iYF3G4mM3FFe+F+/+nyQoaPThIAVJk/g4AuxUBKaCu+vIZtlOzjd8HrBF87f6fV68U4J
         kBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692845818; x=1693450618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9Fv6zMHUmxIJtQTWw3otja3eb7daBbRUnAPWR3+Kws=;
        b=ZV7JD2PItNNgINa80/2cPivFJfCsfpZfGIJad1Q2T2yg4eReWKFsKl4B0X6bWW7D4I
         OhZmsSx9ObxvmsBTWRD9ZcbDxS/rVKnnouTItqO5fdednXNYJQvZzySgg/FmAm5vIoS5
         fD1XcrVk+iYsmC+HCZaleA8ots9wvUaxMZd2Vzc9njnIrXMKNlXffYKnPpQ7UkA/hVXW
         VrXngXiougdiAAuyvA4arEcFLhGwoZ1Mw2OYpk6ZHrzi6+hT6DYTQv4fEyt4FV52Ophx
         rknVPTKU1szUH9dAN6r3tcYzHcx6R47JEJ8UI220hxtW4IU9sv61S9mrVPcqbAB7bxoG
         06ZA==
X-Gm-Message-State: AOJu0YzTgp518ISLA9kNoOzUEjHuawPPGrRr9RhkCwprc+Z8Fhl/LDe2
        63VCtALML+m3YuZavTHY1E0=
X-Google-Smtp-Source: AGHT+IGfrlLR+AVm4rNxdl7JpMbBTxVzD5wv8rDFBbxVFAKSvhzmEDzdpW59h59MCcReusMlyP0fPw==
X-Received: by 2002:a05:620a:290e:b0:767:261d:1ef6 with SMTP id m14-20020a05620a290e00b00767261d1ef6mr19366337qkp.59.1692845818303;
        Wed, 23 Aug 2023 19:56:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z137-20020a63338f000000b0055386b1415dsm4743735pgz.51.2023.08.23.19.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 19:56:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 23 Aug 2023 19:56:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
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
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
Message-ID: <0f6ee9b9-3792-4865-8183-c50d4f3896e1@roeck-us.net>
References: <20230823183749.2609013-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 23, 2023 at 01:28:47PM -0500, Rob Herring wrote:
> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/hwmon/iio-hwmon.yaml         |  4 ++--
>  .../bindings/watchdog/toshiba,visconti-wdt.yaml      |  4 ++--

For hwmon and watchdog:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter
