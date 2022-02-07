Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B31FA4ACA13
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 21:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237994AbiBGUKs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 15:10:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240553AbiBGUH6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 15:07:58 -0500
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5205BC0401DA;
        Mon,  7 Feb 2022 12:07:58 -0800 (PST)
Received: by mail-oo1-f45.google.com with SMTP id o192-20020a4a2cc9000000b00300af40d795so15026052ooo.13;
        Mon, 07 Feb 2022 12:07:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HsXp1ktRNXXH1ZuQq9T7gkz8YQLCBAGSvs9f6otXSEc=;
        b=kTD45pxxBRaJAEMawetNv/mQtrIxcK7j9j96hqdJhE0EnE3hbxqzAAWvJkgsX6Hqmt
         mtmQtr+s/xZaYEoUNxF2jNgxZSVpz0b9llomZuCjyuXdaErEY0WGor6HESxgOruB89Ih
         qg3DRl8mRLQWfwz7VRRIQppC+WBoPV36HByI7tDF68hOOVyzFmSMArnkSQCvBtfrkoBh
         j1nTw4rgQ4+G4CA1K5SCWUYt0/DQ6lN9T+RutjVQbJshkBfZdhQIuDuDRUKlI71wSEZK
         PtRmznH5Dgz0grw6afPCD5C/gBQbnwUWKN04r7Y4joDBBkShbai4oi39rkBObJrGXxkm
         FoOQ==
X-Gm-Message-State: AOAM532L3nl4BQkAt8fLUsskaeHHqrZpisclhHZo5v6wfBKVwZx8B52m
        dXx/1ullVMeZMr5AO4Td8A==
X-Google-Smtp-Source: ABdhPJwZ69i+KxDCJdLyXXbkdUnY+k1QIC0WKQTQTKD8UaxeMwXblmqX/F1sU7XCejibDstsOhUa7A==
X-Received: by 2002:a4a:d051:: with SMTP id x17mr562987oor.60.1644264477617;
        Mon, 07 Feb 2022 12:07:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id ep17sm4757304oab.21.2022.02.07.12.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 12:07:56 -0800 (PST)
Received: (nullmailer pid 820845 invoked by uid 1000);
        Mon, 07 Feb 2022 20:07:55 -0000
Date:   Mon, 7 Feb 2022 14:07:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, jassisinghbrar@gmail.com,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
        krzysztof.kozlowski@canonical.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
        bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        atishp@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v6 02/12] dt-bindings: soc/microchip: add services as sub
 devs of sys ctrlr
Message-ID: <YgF8G/Eed03xn9iI@robh.at.kernel.org>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
 <20220207162637.1658677-3-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207162637.1658677-3-conor.dooley@microchip.com>
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

On Mon, Feb 07, 2022 at 04:26:28PM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Document mpfs-rng and mpfs-generic-service as subdevices of the system
> controller.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .../microchip,mpfs-sys-controller.yaml        | 35 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> index f699772fedf3..b02c8bd72605 100644
> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> @@ -13,7 +13,6 @@ description: |
>    The PolarFire SoC system controller is communicated with via a mailbox.
>    This document describes the bindings for the client portion of that mailbox.
>  
> -
>  properties:
>    mboxes:
>      maxItems: 1
> @@ -21,6 +20,38 @@ properties:
>    compatible:
>      const: microchip,mpfs-sys-controller
>  
> +  rng:
> +    type: object
> +
> +    description: |
> +      The hardware random number generator on the Polarfire SoC is
> +      accessed via the mailbox interface provided by the system controller
> +
> +    properties:
> +      compatible:
> +        const: microchip,mpfs-rng
> +
> +    required:
> +      - compatible
> +
> +  sysserv:
> +    type: object
> +
> +    description: |
> +      The PolarFire SoC system controller is communicated with via a mailbox.
> +      This binding represents several of the functions provided by the system
> +      controller which do not belong in a specific subsystem, such as reading
> +      the fpga device certificate, all of which follow the same format:
> +        - a command + optional payload sent to the sys controller
> +        - a status + a payload returned to Linux
> +
> +    properties:
> +      compatible:
> +        const: microchip,mpfs-generic-service
> +
> +    required:
> +      - compatible
> +
>  required:
>    - compatible
>    - mboxes
> @@ -29,7 +60,7 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    syscontroller: syscontroller {
> +    syscontroller {
>        compatible = "microchip,mpfs-sys-controller";
>        mboxes = <&mbox 0>;

Removing the child nodes in the example doesn't address my comment. You 
still have them in the schema. IOW, this patch should be dropped unless 
you have reasons for child nodes other than I want to partition the OS 
drivers a certain way and creating DT nodes instantiates them for me.

>      };
> -- 
> 2.35.1
> 
> 
