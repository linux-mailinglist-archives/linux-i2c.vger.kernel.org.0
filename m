Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4D5259CB16
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 23:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238249AbiHVVq1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 17:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbiHVVq0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 17:46:26 -0400
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4844564E6;
        Mon, 22 Aug 2022 14:46:25 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id a133so6045611oif.4;
        Mon, 22 Aug 2022 14:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=APAtt9ytTbBFoOR/hSOqBGYHXMVpfceVk0Ug71Kbs9M=;
        b=0+3gJi2ZRXccgq2uwy0dsjnSPMqfXoD5e/ZA5KgQQkwwfaRDQv7cb5XmtvLQ4lpmWJ
         DjDYw6S1na4xuo5eeJsRNcpzWC2LXg4ruciEAvGU/U2m8SBVjPkpAZw6S1xr85AopW9J
         M7Bl45PU5V9dQNK6vDSC/YTIkvYajb+9LZLmc3aA93Zmmy+ouo6Ba3/7kWSI5URHgz3Z
         EFs9nXEuNJ4+rjSOSu9kp2aNVtpafMSofkXvECqXIeLjwivdqRyc4CDXPmXw530rS5QA
         CTrfhvbf2qJCn5wPfoMIa2i55/iB+a7H5BnFJA6ZePNF21o3a6QNuzAufzzuzqrsK7LM
         nSFg==
X-Gm-Message-State: ACgBeo3vsI2tB19yXaR43ENm4YmVBNooXpWGQqld5napfa1nJv9u4Rpj
        RK1FtccXmsYu1BUlqiPS+7JkcO4Y/w==
X-Google-Smtp-Source: AA6agR6uIb3My2FK2lxe6V31YK3t9r+q0jxj72ow4yhV5ieg5ElNaVdhdbmpYBzOegB8IPOVWVHYWA==
X-Received: by 2002:a05:6808:118d:b0:2f9:ee54:8d05 with SMTP id j13-20020a056808118d00b002f9ee548d05mr130398oil.273.1661204785005;
        Mon, 22 Aug 2022 14:46:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z36-20020a056870d6a400b0011856117469sm3259108oap.10.2022.08.22.14.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 14:46:24 -0700 (PDT)
Received: (nullmailer pid 911465 invoked by uid 1000);
        Mon, 22 Aug 2022 21:46:23 -0000
Date:   Mon, 22 Aug 2022 16:46:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eliav Farber <farbere@amazon.com>
Cc:     brgl@bgdev.pl, mark.rutland@arm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        talel@amazon.com, hhhawa@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, ronenk@amazon.com, itamark@amazon.com,
        shellykz@amazon.com, shorer@amazon.com, amitlavi@amazon.com,
        almogbs@amazon.com, dkl@amazon.com, dwmw@amazon.co.uk
Subject: Re: [PATCH v2 1/2] dt-bindings: at24: add new optional power-supply
 property
Message-ID: <20220822214623.GA907654-robh@kernel.org>
References: <20220822105830.22790-1-farbere@amazon.com>
 <20220822105830.22790-2-farbere@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822105830.22790-2-farbere@amazon.com>
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

On Mon, Aug 22, 2022 at 10:58:29AM +0000, Eliav Farber wrote:
> Boards using the AT24 EEPROMs might have a GPIO that controls the power
> supply of the chip, and it must be set to enable the usage of it.
> 
> Add a new optional property to the device tree binding document, which
> allows to specify a GPIO regulator for the pin that controls the power.
> 
> On Linux this means that we need to enable the GPIO at the beginning of
> probe function, before trying to access the chip.
> 
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> V1 -> V2:
> Change pointed out by Rob Herring:
> - Use a gpio regulator for power-supply control.
> 
>  Documentation/devicetree/bindings/eeprom/at24.txt | 3 +++
>  1 file changed, 3 insertions(+)

This file doesn't exist any more. Use the latest -rc1 kernel unless 
there is a reason you need a different (even later) base.

Rob
