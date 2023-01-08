Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4A34661AE8
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 00:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbjAHXHb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 8 Jan 2023 18:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbjAHXHa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 8 Jan 2023 18:07:30 -0500
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E37B4B5;
        Sun,  8 Jan 2023 15:07:29 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id h10so5095083qvq.7;
        Sun, 08 Jan 2023 15:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5+wsnPjPi1Bcm+M4YVJ6k64LL4TqCk+hrgTeY4Mrac=;
        b=eQ4W96iv3G6meM5qxgYRMTEwDieoWcBeJGn2TmFmB+gqJ2MDjfe6+rFaJcJBj1iqa2
         27KBabJsxGGR60WN3ySdqUc8/dj2PfaShsuuQpN6608Nt1/AaVZofyo6UhJm2tBHkbh5
         T7AsOAOfT1f/UzSio+zqfRH0OV45kOVN/vijC6PaBEt9StOJUxmy8mN0tVFhLYNw19k8
         UYeoZuKIzPqyxTZZx7P3d4dZgOgWGhX8Cjtmx6Qgje2Wl7ZmC8pDm0apDeytJ9Ip1tCw
         vcJUmNgt097a17hjDHXcL9JgeEK8pwEHJvDqWIgxadS6Fk2s6wElngdKQFKutYm4+aL0
         Cm8w==
X-Gm-Message-State: AFqh2krNMY4GaHuMDt3oI3qB5Eb2aAIgKetvf36oHkqeu3oq1EnR3jgx
        oS497nS0uc2Lcqk2uwBwiQ==
X-Google-Smtp-Source: AMrXdXu2FRA+dZtv2VufD6smPehhtCtGTuP3HXrzSvmoH5Yy/RR6cw1T3WdqVjJkdlhBQxjtMAhkFQ==
X-Received: by 2002:a0c:d602:0:b0:52d:937c:cd7b with SMTP id c2-20020a0cd602000000b0052d937ccd7bmr86631693qvj.21.1673219248453;
        Sun, 08 Jan 2023 15:07:28 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80a5:9b51:39ae:24d1:33f3:811e])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006fa43e139b5sm4350066qkl.59.2023.01.08.15.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 15:07:28 -0800 (PST)
Received: (nullmailer pid 406175 invoked by uid 1000);
        Sun, 08 Jan 2023 23:07:25 -0000
Date:   Sun, 8 Jan 2023 17:07:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        devicetree@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Convert Synquacer I2C to DT schema
Message-ID: <167321923020.405832.4680313153434149204.robh@kernel.org>
References: <20221209171658.3352119-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209171658.3352119-1-robh@kernel.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Fri, 09 Dec 2022 11:16:57 -0600, Rob Herring wrote:
> Convert the Socionext Synquacer I2C binding to DT schema format.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/i2c/i2c-synquacer.txt | 29 ----------
>  .../bindings/i2c/socionext,synquacer-i2c.yaml | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 59 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-synquacer.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/socionext,synquacer-i2c.yaml
> 

Applied, thanks!
