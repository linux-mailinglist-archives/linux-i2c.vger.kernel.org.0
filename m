Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA602597B2D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 03:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242544AbiHRBsp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Aug 2022 21:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239291AbiHRBso (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Aug 2022 21:48:44 -0400
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788FE27B20;
        Wed, 17 Aug 2022 18:48:43 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id n12so158038iod.3;
        Wed, 17 Aug 2022 18:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=cQwuVR/IWKI+M7wWAhxVBRxxNtVieCNmzLOZ6rHYkbs=;
        b=1qyVbZwsWNIyPk8sodxW+r6lD0sS2az81GHnYlYMOpDIPXhanG7STyTy9FLHP7pEYn
         1YC4wJy/ofVH6JQ2STellDqm44kWYdj75y+yzzQzJXAbLhJcNux53OixEJjWhX8ONDHB
         SwdKLHpqYFkH4pYXF87AWLx7hisEVxNNAaPXvKF4VbbzFIvo9nhFo8qGAS+olmwhb0vH
         MCk+5112bzbuVNm5EHq4noNs3J6LrHssRSDpLFV/k11Q56AP0077AY+aai1AK2O8Aoqz
         v6Gmoy/BY3XEGPDa5G1TPG/kUSusnQZv6WgxenlsSAJ0V+QCSiig/UhlYCK84XxxCojq
         AGtw==
X-Gm-Message-State: ACgBeo2kbI7yEBN5hJzg7+RNQleRDeVKNe244CgxkI3XACT5VoCUncHk
        NU+BMZfGv/UtrSF261rxJqhwPgHDiQ==
X-Google-Smtp-Source: AA6agR6lctpCM/fShInQleQb1/6/FQ7zUtXemWxAQd5khWT+ENLcyRj2ckftRWx1NkLHt5XkKj1nPQ==
X-Received: by 2002:a05:6638:488a:b0:342:6d75:dfa6 with SMTP id ct10-20020a056638488a00b003426d75dfa6mr416551jab.319.1660787322704;
        Wed, 17 Aug 2022 18:48:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q14-20020a056e020c2e00b002e8f40137c8sm136588ilg.47.2022.08.17.18.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 18:48:42 -0700 (PDT)
Received: (nullmailer pid 943236 invoked by uid 1000);
        Thu, 18 Aug 2022 01:48:39 -0000
Date:   Wed, 17 Aug 2022 19:48:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eliav Farber <farbere@amazon.com>
Cc:     brgl@bgdev.pl, mark.rutland@arm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        talel@amazon.com, hhhawa@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, ronenk@amazon.com, itamark@amazon.com,
        shellykz@amazon.com, shorer@amazon.com, amitlavi@amazon.com,
        almogbs@amazon.com, dwmw@amazon.co.uk
Subject: Re: [PATCH 1/2] dt-bindings: at24: new optional property -
 enable-gpios
Message-ID: <20220818014839.GD921960-robh@kernel.org>
References: <20220816130002.41450-1-farbere@amazon.com>
 <20220816130002.41450-2-farbere@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816130002.41450-2-farbere@amazon.com>
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

On Tue, Aug 16, 2022 at 01:00:01PM +0000, Eliav Farber wrote:
> Boards using the AT24 EEPROMs might have a GPIO that must be set to
> enable the chip (e.g. pin that controls the power supply).
> 

If this is a power supply control, use a gpio regulator.

> Add a new optional property to the device tree binding document, which
> allows to specify the GPIO line to which the enable pin is connected.
> 
> On Linux this means that we need to hog the line at the beginning of
> probe function.
> 
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Documentation/devicetree/bindings/eeprom/at24.txt
> index f9a7c984274c..553b53ed3e4c 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.txt
> +++ b/Documentation/devicetree/bindings/eeprom/at24.txt
> @@ -73,6 +73,9 @@ Optional properties:
>  
>    - wp-gpios: GPIO to which the write-protect pin of the chip is connected.
>  
> +  - enable-gpios: GPIO to enables the chip (e.g. pin that controls the eeprom
> +                  power supply).
> +
>    - address-width: number of address bits (one of 8, 16).
>  
>  Example:
> -- 
> 2.37.1
> 
