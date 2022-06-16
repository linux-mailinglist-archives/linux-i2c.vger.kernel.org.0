Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 837C154E8FC
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 20:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbiFPSA7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 14:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiFPSA6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 14:00:58 -0400
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9EFF13F44;
        Thu, 16 Jun 2022 11:00:57 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id a10so2249450ioe.9;
        Thu, 16 Jun 2022 11:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fQXZSJhht4X5yNvw03hLRu3BZWLlJCfLhF7rU9SmcRw=;
        b=SBDuUIjY3V9QWdkZKbh/lMHW/CKxuk9YPjIQ+0wyD0H2Pq3wQA3BIljWG4eU4hU42U
         vuN1cP6Vge93K9x+1axw9YeKyMz3aOtOtBBbZp39N7xDDsqnZFJ6OJ/XRJqfI7Pgst/K
         g88Jf5BJyhp0grG+ZP2z6I/mo/lWghnC2C+8n1bF0ogeQ/Gm176HIM47IITFJ7dAje6p
         7iFOt9OVF1RJ2wpvDU9DP7xMoyBfOhtZ2i9YbMyhdHiWFp4dJ1QJ9ywfP2tgMsoeLIi5
         4Oa+tTaTHmpXQWx2fytKf5oNYNvSL+5/13Vz0STCiBJOstG4lLaHTTuOI0zJTsyP5Rfl
         JnYg==
X-Gm-Message-State: AJIora/JK/aPjNXZfiKvSUxpaeBwUVHWaTWZjlaSeF1VpCkjgCVy9m93
        UUfj9RKnoSFz+R8+d9t8FQ==
X-Google-Smtp-Source: AGRyM1spQJ7T8UrCvJ5pQYvBWRSSImqT+IRmKQ5FRE4451GZSxPWdZRJu8178mpfIlKesP0Ydg80uw==
X-Received: by 2002:a05:6602:2c4c:b0:64f:a897:80cb with SMTP id x12-20020a0566022c4c00b0064fa89780cbmr3138193iov.139.1655402457088;
        Thu, 16 Jun 2022 11:00:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y203-20020a6bc8d4000000b00669c07fbcb5sm1457589iof.5.2022.06.16.11.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 11:00:56 -0700 (PDT)
Received: (nullmailer pid 3729785 invoked by uid 1000);
        Thu, 16 Jun 2022 18:00:54 -0000
Date:   Thu, 16 Jun 2022 12:00:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-serial@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-spi@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: efm32: remove bindings for deleted platform
Message-ID: <20220616180054.GA3728782-robh@kernel.org>
References: <20220615210720.6363-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615210720.6363-1-wsa@kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 15 Jun 2022 23:07:19 +0200, Wolfram Sang wrote:
> Commit cc6111375cec ("ARM: drop efm32 platform") removed the platform,
> so no need to still carry the bindings.
> 
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
>  .../devicetree/bindings/clock/efm32-clock.txt | 11 -----
>  .../devicetree/bindings/i2c/i2c-efm32.txt     | 33 --------------
>  .../devicetree/bindings/serial/efm32-uart.txt | 20 ---------
>  .../devicetree/bindings/spi/efm32-spi.txt     | 39 -----------------
>  include/dt-bindings/clock/efm32-cmu.h         | 43 -------------------
>  5 files changed, 146 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/efm32-clock.txt
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-efm32.txt
>  delete mode 100644 Documentation/devicetree/bindings/serial/efm32-uart.txt
>  delete mode 100644 Documentation/devicetree/bindings/spi/efm32-spi.txt
>  delete mode 100644 include/dt-bindings/clock/efm32-cmu.h
> 

Deletions are automatically applied, thanks! ;)
