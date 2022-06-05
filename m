Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61F3953DC38
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jun 2022 16:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235486AbiFEO1C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jun 2022 10:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344908AbiFEO07 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jun 2022 10:26:59 -0400
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B76F314;
        Sun,  5 Jun 2022 07:26:57 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id q11so1286053oih.10;
        Sun, 05 Jun 2022 07:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VsiIchXwU4RTc0DIFo0td3SBFYIKs94Vi7gT4ZClFTk=;
        b=Z/CBbU745rV1fD/F6HHKEKp123LIvclBRDk4MH9Wte06bZSPhPNVnIMiEM6JSm/60h
         1KGxGTE1AEEFciiIOLq0/mUNkJ8kBDMrcHih6B+2wtdN3e4hi+UtY6JZfycETIn3OyfM
         UZj7o1nddLAZgLlZogoEstNK2CUrcm9qSU8wyJG+HcE+kuHBLdDpH/uIvL0ixR3CXoHq
         Vnx/Vwgsa3dzOEmh4gMwyKDCaQh/l9PMH2OBgxsxIg0xPbxLJHYwazbCNT+7Yvw0L+3v
         uZ9UapJkPlXqC/bHW2ss27hL4Gwc175eUmRBAiq80FqML5tWf97jDU+56OvWyx7HQpA3
         YLbg==
X-Gm-Message-State: AOAM533aku31ZW66zUCR0Qxo8hzWCM4Ov4d4rhN0pyI5GyGJoH6C80eV
        GTTwR+8WuSQS5VOsYu6V8Fe10TTYMA==
X-Google-Smtp-Source: ABdhPJyDthWEK+AD0C/PttdCfWvWpqPlhPSwwQ1IhA19nlEDzZKGGDSKcchFOf4GKxx8RgFB3vEP4Q==
X-Received: by 2002:a05:6808:1453:b0:32b:84a4:5a49 with SMTP id x19-20020a056808145300b0032b84a45a49mr27903807oiv.105.1654439216013;
        Sun, 05 Jun 2022 07:26:56 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:5fed:bdd:4931:91d5:7dbb:83fc])
        by smtp.gmail.com with ESMTPSA id lx15-20020a0568704b8f00b000f5e89a9c60sm5534321oab.3.2022.06.05.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 07:26:55 -0700 (PDT)
Received: (nullmailer pid 3448755 invoked by uid 1000);
        Sun, 05 Jun 2022 14:25:40 -0000
Date:   Sun, 5 Jun 2022 09:25:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Rewrite Nomadik I2C bindings in YAML
Message-ID: <20220605142540.GA3448684-robh@kernel.org>
References: <20220526211046.367938-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526211046.367938-1-linus.walleij@linaro.org>
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

On Thu, 26 May 2022 23:10:46 +0200, Linus Walleij wrote:
> This rewrites the Nomadik I2C bindings in YAML, some extra
> tweaks were needed because of the way the original nomadik
> names the compatible with two compatibles and the DB8500
> with three, and the two main variants use a different clock
> name.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/i2c/i2c-nomadik.txt   |  23 ----
>  .../bindings/i2c/st,nomadik-i2c.yaml          | 113 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 114 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-nomadik.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
