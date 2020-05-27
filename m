Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9095E1E4B8F
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 19:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731202AbgE0RMI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 13:12:08 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:46449 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731164AbgE0RMH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 13:12:07 -0400
Received: by mail-io1-f68.google.com with SMTP id j8so26805282iog.13;
        Wed, 27 May 2020 10:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lH1rJnnAmu6mmVD9f+LiVA8Cp9GhZ/wNWYkFw3lVpLM=;
        b=tWQZpIrBlsFv9F0gdZR8caqSGN4QrY4bxPuwr8m3TRTuWL+FxxaAmE7N0mBZtuwelX
         raUSsu9Brnqsww1NiDzsMoiFR9pLhaGtY+vpWaHCpJq0xmM2qiCEI+0u1uD0qDF2Qyj/
         8kTQB3Kj9vkiK3uwjJWVnbDxKV0VkVdxcnVb6OXmhDdM/rXGMh39diKA6rviRQK41Dbh
         SRp4g3Mx4yGJBy4kU5FSQDyboq7B1+IkGv1XzUUuUoLM+kesLTjL8AWYKuQo2Prhxx/1
         FmFUQYThX2RI2x7DAawNmKXcwYrH88GnE+QqwjfH5meSRudTa+8KCHhy85sU/jzg64Zj
         nYWg==
X-Gm-Message-State: AOAM530FxKDSE1z7or7uXHfp7OKsukcBR4cSEkU8JXq6QT5qgQ1aIiO1
        twdePx5pAmpSMk1RIKXT0Q==
X-Google-Smtp-Source: ABdhPJy6mZmSjT4GnETlDIhT4c/i6cpi2dbaYN20yoQHKee1l9OtKky3c0rbR9VKGY7uzGPRH/rQMg==
X-Received: by 2002:a5e:970a:: with SMTP id w10mr11183277ioj.114.1590599526064;
        Wed, 27 May 2020 10:12:06 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j15sm1832662ilk.0.2020.05.27.10.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 10:12:05 -0700 (PDT)
Received: (nullmailer pid 2353199 invoked by uid 1000);
        Wed, 27 May 2020 17:12:04 -0000
Date:   Wed, 27 May 2020 11:12:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/11] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
Message-ID: <20200527171204.GA2348490@bogus>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527120111.5781-3-Sergey.Semin@baikalelectronics.ru>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 03:01:02PM +0300, Serge Semin wrote:
> dtc currently doesn't support I2C_OWN_SLAVE_ADDRESS flag set in the
> i2c "reg" property. If it is the compiler will print a warning:
> 
> Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
> 
> In order to silence dtc up let's discard the flag from the DW I2C DT
> binding example for now. Just revert this commit when dtc is fixed.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: linux-mips@vger.kernel.org
> 
> ---
> 
> Changelog v3:
> - This is a new patch created as a result of the Rob request to remove
>   the EEPROM-slave bit setting in the DT binndings example until the dtc
>   is fixed.
> ---
>  Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> index 4bd430b2b41d..101d78e8f19d 100644
> --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> @@ -137,7 +137,7 @@ examples:
>  
>        eeprom@64 {
>          compatible = "linux,slave-24c02";
> -        reg = <0x40000064>;
> +        reg = <0x64>;

But the compatible is a slave, so you need an example with a different 
device.

>        };
>      };
>    - |
> -- 
> 2.26.2
> 
