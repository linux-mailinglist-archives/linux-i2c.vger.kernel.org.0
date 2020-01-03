Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7443112FF3A
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2020 00:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgACXo2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jan 2020 18:44:28 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:43903 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgACXo2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jan 2020 18:44:28 -0500
Received: by mail-il1-f196.google.com with SMTP id v69so37913062ili.10
        for <linux-i2c@vger.kernel.org>; Fri, 03 Jan 2020 15:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oHVJcbfywZ2wbBBx9DgqhrtkzwrTvD4xChukN5BH1kY=;
        b=iZT7yO04arPM8y/imI87fDNBURFgA737jGfJ6lA5Pb8lE9J/qWSlYIFkks3B7Wj7/n
         Dvy258rakSPCF15AmomiVWy29rXauE/1Bcen1l6BBZDg2AXGJCx77vfnleazQQjwlXKi
         GjxZHgG+JU2C+a4wEkjiasE+WUjOZTLdAQ15+Z++L5mM5qDsOITg9BHD+YTik1b6u5at
         LTX2RgzFYmrfPdSYr8Z54BTrw3f3Zv4F6EKOvFOXZGuS8jXts3miNygIpFCobb8y6QTr
         NA/VgFrXb0GnjSrMntbZZBvOqlh3QR1WrDuSRDrf6ejcl5ReI4MENR4eJojUKWT1v9FR
         Qtuw==
X-Gm-Message-State: APjAAAX9WodX1G+ku8qdKOhlNVuXHxDmr15H3fjul1Nu3tnvKi58QWJZ
        3vuO9WOcvmhaStsz/LT29TktD7U=
X-Google-Smtp-Source: APXvYqw4LSisXFt0XboBwrl7E2ArHfBTZJGx3vr0+l53SgVSqEOopSDvvfdFqcFgtCepSe9veUciYQ==
X-Received: by 2002:a92:2904:: with SMTP id l4mr79802457ilg.166.1578095067459;
        Fri, 03 Jan 2020 15:44:27 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id b3sm21623148ilh.72.2020.01.03.15.44.26
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 15:44:26 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 16:44:25 -0700
Date:   Fri, 3 Jan 2020 16:44:25 -0700
From:   Rob Herring <robh@kernel.org>
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     bgolaszewski@baylibre.com, mark.rutland@arm.com,
        srinivas.kandagatla@linaro.org, baylibre-upstreaming@groups.io,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH v3 3/4] dt-bindings: at24: remove the optional property
 write-protect-gpios
Message-ID: <20200103234425.GA17746@bogus>
References: <20191219115141.24653-1-ktouil@baylibre.com>
 <20191219115141.24653-4-ktouil@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219115141.24653-4-ktouil@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 19, 2019 at 12:51:40PM +0100, Khouloud Touil wrote:
> NVMEM framework is an interface for the at24 EEPROMs as well as for
> other drivers, instead of passing the wp-gpios over the different
> drivers each time, it would be better to pass it over the NVMEM
> subsystem once and for all.
> 
> Removing the optional property form the device tree binding document.
> 
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index e8778560d966..75de83708146 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -145,10 +145,7 @@ properties:
>        over reads to the next slave address. Please consult the manual of
>        your device.
>  
> -  wp-gpios:
> -    description:
> -      GPIO to which the write-protect pin of the chip is connected.
> -    maxItems: 1
> +  wp-gpios: true
>  
>    address-width:
>      allOf:
> @@ -181,7 +178,6 @@ examples:
>            compatible = "microchip,24c32", "atmel,24c32";
>            reg = <0x52>;
>            pagesize = <32>;
> -          wp-gpios = <&gpio1 3 0>;

This is still valid, why is it being removed?

>            num-addresses = <8>;
>        };
>      };
> -- 
> 2.17.1
> 
