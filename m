Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC5E4B2700
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 14:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239427AbiBKNXs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 08:23:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235417AbiBKNXr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 08:23:47 -0500
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D8ECCF;
        Fri, 11 Feb 2022 05:23:43 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id i62so11338715ioa.1;
        Fri, 11 Feb 2022 05:23:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MM9ApSYTqG0qCaN/6ztjyk0y0g35LdmJiBEhnwEn+Vs=;
        b=G3jYmly2nC8jwaK5Odo834nFXDY+6SXtX4buCdZZMLTHr+sK349Ji4SGQOHr62lfnM
         GagNajcYW+REuDmWXG0y3tUXG4pY0YhKfsHLyTFgTtaKcMEhYMPowjo1wLlq+TMsZLNv
         nDoT+CJAsYYupkEbgccpVklssBDNILggwNdctk9nUxdWpNAOS1Iz0sHq5xy+FI3O19RO
         FKkU2gVueGgtaTubb6LYPYidd4/erQJeZ0Gk/yoaZddW6gq6Ph4HLEDdKoY0JzisClf+
         Nt4PAGzJsUTVk16I+gkpFAX0WWk9igqqskFOOsskUVZ/yxbyaDyaJNEuWefrgk273x9q
         56lw==
X-Gm-Message-State: AOAM5328V9tfDo/Z9U5i04F+g4lb3QqtP4dkFwUaYiQOQsYo4YmAV75F
        gXvkVa+/4nKgVWX1TnaW8EFlUGmQBA==
X-Google-Smtp-Source: ABdhPJwo/cRQLrCRxH4D4zQwZrl4rJHa21iBgfetInmdJwwCSUW0IfYEi5UMMTC7YE+cN0suBUoQ/Q==
X-Received: by 2002:a05:6638:3003:: with SMTP id r3mr812384jak.239.1644585822896;
        Fri, 11 Feb 2022 05:23:42 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.139.71])
        by smtp.gmail.com with ESMTPSA id k1sm13382645iov.6.2022.02.11.05.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 05:23:42 -0800 (PST)
Received: (nullmailer pid 249238 invoked by uid 1000);
        Fri, 11 Feb 2022 13:23:38 -0000
Date:   Fri, 11 Feb 2022 07:23:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Ondrej Jirman <x@xff.cz>
Subject: Re: [PATCH 1/5] dt-bindings: input: Add the PinePhone keyboard
 binding
Message-ID: <YgZjWh6dQQJEK21K@robh.at.kernel.org>
References: <20220129230043.12422-1-samuel@sholland.org>
 <20220129230043.12422-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129230043.12422-2-samuel@sholland.org>
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

On Sat, Jan 29, 2022 at 05:00:38PM -0600, Samuel Holland wrote:
> Add devicetree support for the PinePhone keyboard case, which provides a
> matrix keyboard interface and a proxied I2C bus.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../input/pine64,pinephone-keyboard.yaml      | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml b/Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
> new file mode 100644
> index 000000000000..00f084b263f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/pine64,pinephone-keyboard.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Pine64 PinePhone keyboard device tree bindings
> +
> +maintainers:
> +  - Samuel Holland <samuel@sholland.org>
> +
> +description:
> +  A keyboard accessory is available for the Pine64 PinePhone and PinePhone Pro.
> +  It connects via I2C, providing a raw scan matrix, a flashing interface, and a
> +  subordinate I2C bus for communication with a battery charger IC.
> +
> +allOf:
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +
> +properties:
> +  compatible:
> +    const: pine64,pinephone-keyboard
> +
> +  reg:
> +    const: 0x15
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  linux,fn-keymap:

This should be handled in a common way. Not sure if there's anything 
existing for alternate key maps. Child nodes of alternate maps would 
scale better than new property name for every alternate map. Or you 
could make linux,keymap contain multiple maps (e.g. 2x XxY entries) 

Or if the map doesn't change, just put it in the driver.

> +    $ref: /schemas/input/matrix-keymap.yaml#/properties/linux,keymap

Referencing individual properties should be avoided.

> +    description: keymap used when the Fn key is pressed
> +
> +  wakeup-source: true
> +
> +  i2c-bus:
> +    $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +dependencies:
> +  linux,fn-keymap: [ 'keypad,num-columns', 'keypad,num-rows' ]
> +  linux,keymap: [ 'keypad,num-columns', 'keypad,num-rows' ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      keyboard@15 {
> +        compatible = "pine64,pinephone-keyboard";
> +        reg = <0x15>;
> +        interrupt-parent = <&r_pio>;
> +        interrupts = <0 12 IRQ_TYPE_EDGE_FALLING>; /* PL12 */
> +        keypad,num-rows = <6>;
> +        keypad,num-columns = <12>;
> +        linux,fn-keymap = <MATRIX_KEY(0,  0, KEY_FN_ESC)
> +                           MATRIX_KEY(0,  1, KEY_F1)
> +                           MATRIX_KEY(0,  2, KEY_F2)
> +                           /* ... */
> +                           MATRIX_KEY(5,  2, KEY_FN)
> +                           MATRIX_KEY(5,  3, KEY_LEFTALT)
> +                           MATRIX_KEY(5,  5, KEY_RIGHTALT)>;
> +        linux,keymap = <MATRIX_KEY(0,  0, KEY_ESC)
> +                        MATRIX_KEY(0,  1, KEY_1)
> +                        MATRIX_KEY(0,  2, KEY_2)
> +                        /* ... */
> +                        MATRIX_KEY(5,  2, KEY_FN)
> +                        MATRIX_KEY(5,  3, KEY_LEFTALT)
> +                        MATRIX_KEY(5,  5, KEY_RIGHTALT)>;
> +
> +        i2c-bus {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          charger@75 {
> +            reg = <0x75>;
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.33.1
> 
> 
