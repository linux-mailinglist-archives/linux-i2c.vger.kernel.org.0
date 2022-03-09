Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6022C4D3CCD
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Mar 2022 23:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238596AbiCIWV5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Mar 2022 17:21:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233383AbiCIWV4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Mar 2022 17:21:56 -0500
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E1711985B;
        Wed,  9 Mar 2022 14:20:57 -0800 (PST)
Received: by mail-oo1-f44.google.com with SMTP id n5-20020a4a9545000000b0031d45a442feso4643545ooi.3;
        Wed, 09 Mar 2022 14:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=WuHDc6v3uOzowGHm6UtrQZFQgPa2xYn/b0QP1E2NrtU=;
        b=KhJ0RQRFRhPkrZkSlix08XmES6Br3IPbNm9XbyDkApL25a/QIyMAwdVEphsmD3bUP3
         3VrUvp5iw0j10rRizSnzupBEpXDA+KsshhUbfFXXMcS2A3VYJugEYGvqkux9J2y+dgYg
         4PsXAo7M5urDT9JumCwt9l8vEvW7H/kNc7hai22vaHM1J98dg6D4kelZMxsNMWFVCe+f
         mQwwAs6ZUJ4KZ3UKG2M/3UCKCl0UYHWSfMZh5oORe8Z9OsjxwEv4twm8iiatEODixYFY
         Q8kwXTvp9oK9p9lTmLyNQ4UnsYtYlYwqVr1u+5L/vh4OIF+eem4TinP/gMduCBuskUwI
         oVng==
X-Gm-Message-State: AOAM533CDgpPEidT7ltivdu9D6atZJYn8Z80s7HioTYq6UZYTlSCgk0a
        I/d4bSRaDpzMQ6f/q1H4XF31x11eJg==
X-Google-Smtp-Source: ABdhPJzC7IxSe0nOpoXmKQ/dOW3QU1tV9W+5+0lyQ81LhaDWeK5vDEdYVAh0tg5gibz3hZx90nYcCg==
X-Received: by 2002:a4a:be82:0:b0:320:d362:88e6 with SMTP id o2-20020a4abe82000000b00320d36288e6mr972107oop.21.1646864456837;
        Wed, 09 Mar 2022 14:20:56 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n13-20020a056820054d00b0032106118fb3sm1638596ooj.37.2022.03.09.14.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 14:20:56 -0800 (PST)
Received: (nullmailer pid 326440 invoked by uid 1000);
        Wed, 09 Mar 2022 22:20:55 -0000
From:   Rob Herring <robh@kernel.org>
To:     Sergiu Moga <sergiu.moga@microchip.com>
Cc:     claudiu.beznea@microchip.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski@canonical.com, nicolas.ferre@microchip.com
In-Reply-To: <20220309120714.51393-3-sergiu.moga@microchip.com>
References: <20220309120714.51393-1-sergiu.moga@microchip.com> <20220309120714.51393-3-sergiu.moga@microchip.com>
Subject: Re: [PATCH 2/3] dt-bindings: i2c: convert i2c-at91 to json-schema
Date:   Wed, 09 Mar 2022 16:20:55 -0600
Message-Id: <1646864455.115517.326439.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Mar 2022 14:07:13 +0200, Sergiu Moga wrote:
> Convert I2C binding for Atmel/Microchip SoCs to Device Tree Schema
> format.
> 
> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
> ---
>  .../bindings/i2c/atmel,at91sam-i2c.yaml       | 144 ++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-at91.txt      |  82 ----------
>  2 files changed, 144 insertions(+), 82 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-at91.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.example.dt.yaml:0:0: /example-0/i2c@f8034600/eeprom@1a: failed to match any schema with compatible: ['wm8731']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1603370

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

