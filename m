Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A3E1D8939
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 22:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgERUdX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 16:33:23 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:46978 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgERUdW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 May 2020 16:33:22 -0400
Received: by mail-il1-f193.google.com with SMTP id w18so11204998ilm.13;
        Mon, 18 May 2020 13:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aCdfZ7ueYmEHhf27ECx3pl3zz6CbgFMjwskwT2kCHRE=;
        b=c6ccFKzM1au209IPK3k0fg/V6jXBqQly2G7SGHEigdfijov6p9AxSAgmZ1vKZvraxq
         KrhYd/ZpEzqzwYmEdJ/o+Y/unOnCl5oXBsYD+P47TIAN6sa+1lea+vpmKA5GsCRxoqfj
         0XCZxssUrFZlxYCRKDoYGH7N5+zTdBV53mt0Dz5wuWvwRKx+6i68SoF1Y/wSRZS0MKvo
         rBnGLTtxY4FfMsLgIJGOYS1JkWYsKs87kUBt/4zj1c+z6wL+nkg3AbQ7lpmf+x5uqhPX
         IH+jnW2bD1EUSwbF5MPgseWFU8J22UWjX22Z3NPsKa3SyEtBwiTQqbOSb/E9uV5u3jKO
         Rq9Q==
X-Gm-Message-State: AOAM533+/Y9oRLw4ii58lWK+ZF0BtQ6dagcNe/X5kGn1yWI8CBAWjDpp
        xnPjIwnqsIUYc4ZjlP772Q==
X-Google-Smtp-Source: ABdhPJwGNhQsjXHbVcG/RCJvvyF1a7+gc39oF1lqupbQlZeHsmLopWJZSzTWyAp5EdP5nZruQOvORg==
X-Received: by 2002:a92:4909:: with SMTP id w9mr18358517ila.302.1589834001709;
        Mon, 18 May 2020 13:33:21 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id e19sm4266220iob.1.2020.05.18.13.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 13:33:21 -0700 (PDT)
Received: (nullmailer pid 31386 invoked by uid 1000);
        Mon, 18 May 2020 20:33:19 -0000
Date:   Mon, 18 May 2020 14:33:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/12] dt-bindings: i2c: dw: Add Baikal-T1 SoC I2C
 controller
Message-ID: <20200518203319.GA14243@bogus>
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
 <20200510095019.20981-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200510095019.20981-4-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, May 10, 2020 at 12:50:09PM +0300, Serge Semin wrote:
> Add the "baikal,bt1-sys-i2c" compatible string to the DW I2C binding and
> make sure the reg property isn't required in this case because the
> controller is embedded into the Baikal-T1 System Controller. The rest of
> the DW APB I2C properties are compatible and can be freely used to describe
> the Baikal-T1 I2C controller dts-node.

Is there not a sub-range of the system controller with the I2C 
registers? I'd assume there is, so you can still have 'reg' even if 
Linux doesn't use it (currently).

> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linux-mips@vger.kernel.org
> 
> ---
> 
> Rob, I had to remove your acked-by tag because of the changes introduced
> in v2 of the patch.
> 
> Changelog v2:
> - Make the reg property being optional if it's Baikal-T1 System I2C DT
>   node.
> ---
>  .../devicetree/bindings/i2c/snps,designware-i2c.yaml | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> index 8d4e5fccbd1c..579964098eb9 100644
> --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> @@ -21,6 +21,15 @@ allOf:
>        properties:
>          reg:
>            maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: baikal,bt1-sys-i2c
> +    then:
> +      required:
> +        - reg
>  
>  properties:
>    compatible:
> @@ -31,6 +40,8 @@ properties:
>          items:
>            - const: mscc,ocelot-i2c
>            - const: snps,designware-i2c
> +      - description: Baikal-T1 SoC System I2C controller
> +        const: baikal,bt1-sys-i2c
>  
>    reg:
>      minItems: 1
> @@ -98,7 +109,6 @@ unevaluatedProperties: false
>  
>  required:
>    - compatible
> -  - reg
>    - "#address-cells"
>    - "#size-cells"
>    - interrupts
> -- 
> 2.25.1
> 
