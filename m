Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB9A12FF36
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2020 00:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgACXkq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jan 2020 18:40:46 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:43679 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgACXkq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jan 2020 18:40:46 -0500
Received: by mail-il1-f196.google.com with SMTP id v69so37908897ili.10
        for <linux-i2c@vger.kernel.org>; Fri, 03 Jan 2020 15:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1G7HBZ/lx4jhuYMngmAkk5nXPN0Gyvary5PxJkGPU+Q=;
        b=YVDO3ZpWnK32KRIoFz1LLMuGKTmYJFuxhGOiBCuIze0qlaBTNqr4YjI0dbG96V20Wf
         0OsSoB9iw+Awz+zJ0R0iNLA3ugGCVPsn+4kXs8idTS9ayaGPugSIUoM0RCf0TqsArcjh
         aHExZYpks6oN45dIjyZVFpyUchhRJH55VzGa/002T+FBH6fK9Sub70f+O6np8TC4enHv
         mUEyNrDEvKZHvxyllbxeiA/RmKsBrZylyRsbqCV4067eeu7Ugn0ffbTZBVIedVR8ttud
         PHAWfJsWRV6OaAOzLlgSV4XACch5i/b1L+SXAZ+86cNhzpSQAF6tBXdKLoNyoXR+iOsH
         gXxg==
X-Gm-Message-State: APjAAAVUMZx3sI5n6KGzbxtgU/dWZVa9oa4Fe2i/9E2f2g4UeUpe8N3D
        H2mlGqL+SZ6ivBkaFbN0Vmn6nMA=
X-Google-Smtp-Source: APXvYqxpotUVr1MghVEO61PfUfZDcx6K8ZFoElayW7uS4zyOeOse0SPuRclo7rIN5uHRJRdYQMobZA==
X-Received: by 2002:a92:d18a:: with SMTP id z10mr80232548ilz.48.1578094845135;
        Fri, 03 Jan 2020 15:40:45 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id g12sm12410690iom.5.2020.01.03.15.40.44
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 15:40:44 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 16:40:42 -0700
Date:   Fri, 3 Jan 2020 16:40:42 -0700
From:   Rob Herring <robh@kernel.org>
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     bgolaszewski@baylibre.com, mark.rutland@arm.com,
        srinivas.kandagatla@linaro.org, baylibre-upstreaming@groups.io,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH v3 1/4] dt-bindings: nvmem: new optional property
 write-protect-gpios
Message-ID: <20200103234042.GA14976@bogus>
References: <20191219115141.24653-1-ktouil@baylibre.com>
 <20191219115141.24653-2-ktouil@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219115141.24653-2-ktouil@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 19, 2019 at 12:51:38PM +0100, Khouloud Touil wrote:
> Several memories have a write-protect pin, that when pulled high, it
> blocks the write operation.

Subject doesn't match the actual property name.

> 
> On some boards, this pin is connected to a GPIO and pulled high by
> default, which forces the user to manually change its state before
> writing.
> 
> Instead of modifying all the memory drivers to check this pin, make
> the NVMEM subsystem check if the write-protect GPIO being passed
> through the nvmem_config or defined in the device tree and pull it
> low whenever writing to the memory.
> 
> Add a new optional property to the device tree binding document, which
> allows to specify the GPIO line to which the write-protect pin is
> connected.
> 
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> ---
>  Documentation/devicetree/bindings/nvmem/nvmem.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> index 1c75a059206c..b43c6c65294e 100644
> --- a/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> @@ -34,6 +34,14 @@ properties:
>      description:
>        Mark the provider as read only.
>  
> +  wp-gpios:
> +    description:
> +      GPIO to which the write-protect pin of the chip is connected.
> +      The write-protect GPIO is asserted, when it's driven high
> +      (logical '1') to block the write operation. It's deasserted,
> +      when it's driven low (logical '0') to allow writing.
> +    maxItems: 1
> +
>  patternProperties:
>    "^.*@[0-9a-f]+$":
>      type: object
> @@ -63,9 +71,12 @@ patternProperties:
>  
>  examples:
>    - |
> +      #include <dt-bindings/gpio/gpio.h>
> +
>        qfprom: eeprom@700000 {
>            #address-cells = <1>;
>            #size-cells = <1>;
> +          wp-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
>  
>            /* ... */
>  
> -- 
> 2.17.1
> 
