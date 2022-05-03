Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18FC0518FC5
	for <lists+linux-i2c@lfdr.de>; Tue,  3 May 2022 23:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242688AbiECVPS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 May 2022 17:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242714AbiECVPQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 May 2022 17:15:16 -0400
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F3840A1A;
        Tue,  3 May 2022 14:11:36 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so18425339fac.7;
        Tue, 03 May 2022 14:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eh5OGgJnAtIHXJdL+WfBTLIsraxjNAm1ti5EfhZuw40=;
        b=q07uQBBKZNLbIawLBhceyZAjduHt8soVMgaPxS8bzyd/QQXXkLiQK/WSCbXohl8snN
         moEzZmcJWXqE/ULuz3hNw6CJq4OXz56dtaU5ELrI5y/NA4vuoaMQCU6TGFVl8cV3gsrq
         BT1kjUKoul1cjrnb6aHAtnHsY+9g6VqdDtnbNuOMtvco8zycA24GAozGBC3SMoaimc4z
         ECrhVCdM26pFOjHQVt1Au5vngxpXkisRnhk8Amq8jG3FYt8Jx3I/UCWE4uZ4pnlTAlFU
         WFpUxTImzAffXhIyc8AJfqgO7bK3a0xe1vQ7LjPFv0DTnVkDADATYH+lxmzstXGXfS8x
         xA6g==
X-Gm-Message-State: AOAM530EesFiXMOVkfaM+TC8xqNKh59460KXHwdVuzQ/4UpoeV+n3wA1
        lFeFL0PWsdQUrfug5IBBHA==
X-Google-Smtp-Source: ABdhPJxDpfn/Ees5StxaeeMPeh0vYo/Z6K2dj90q21D8dLT7ggEODCoMfKr8DnNQeDmJz6P7UYBccg==
X-Received: by 2002:a05:6870:a108:b0:ec:43ef:5338 with SMTP id m8-20020a056870a10800b000ec43ef5338mr2563907oae.16.1651612295751;
        Tue, 03 May 2022 14:11:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 8-20020a056870124800b000e686d13888sm7671639oao.34.2022.05.03.14.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 14:11:35 -0700 (PDT)
Received: (nullmailer pid 38846 invoked by uid 1000);
        Tue, 03 May 2022 21:11:34 -0000
Date:   Tue, 3 May 2022 16:11:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c-gpio: Add property
 i2c-gpio,sda-output-only
Message-ID: <YnGahvdwtOpqW7D7@robh.at.kernel.org>
References: <3e6c934e-5298-42c5-c346-31b1acaa06ba@gmail.com>
 <e2e30c3b-21db-72d1-1b40-d1f2fbcaaa43@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2e30c3b-21db-72d1-1b40-d1f2fbcaaa43@gmail.com>
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

On Wed, 27 Apr 2022 21:23:28 +0200, Heiner Kallweit wrote:
> There are slave devices that understand I2C but have read-only
> SDA and SCL. Examples are FD650 7-segment LED controller and
> its derivatives. Typical board designs don't even have a
> pull-up for both pins. Therefore don't enforce open-drain
> if SDA and SCL both are unidirectional. This patch makes
> i2c-gpio usable with such devices, based on new DT property
> i2c-gpio,sda-output-only.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - improve commit message
> ---
>  Documentation/devicetree/bindings/i2c/i2c-gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
