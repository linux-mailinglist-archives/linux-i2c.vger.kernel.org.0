Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3141E878B
	for <lists+linux-i2c@lfdr.de>; Fri, 29 May 2020 21:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727878AbgE2TRz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 15:17:55 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41574 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbgE2TRy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 May 2020 15:17:54 -0400
Received: by mail-io1-f68.google.com with SMTP id o5so503534iow.8;
        Fri, 29 May 2020 12:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3ddHQiK3DJ2IUR3hVArEyzHKH2yIHD9ENKbZz+fu8a8=;
        b=iQP8Q9cJSM1YPPKXAJ6SiCauX9rG8A6A7HDJih8gTVCcvXegUNo0Lqn5FV2TmrQdRS
         aSSilX8tSO5HSRdh8uGJRt9D8Aq1P0OH8SSuGkcm7t2T9km1oFOKjUg5X7l0jFyKjh/r
         eQeRKYGcJJW6k8yDVFAIYlOch7T2l4ASkRwTBypFBrEe26JTgHiiq/K4KNzpFLcqgGVo
         BJ09FnhOiZ0eiib1WGR+PhD1de0BWl86NEHT+5R0CZcGlnPr3SMMsk/mGSLwqSRHnh03
         08heobSJzZ91LS/wvAZi5w1HCZ4EQHt4GYipEeGSgtspnsVbUeInqlB+1tyfY7LLOMH5
         gwvA==
X-Gm-Message-State: AOAM532gemgqsEsrg4BsEcm9APgYrCTLeGifRlqaxrjxk/ZBWYzuVuci
        2vYhBwvZ3F3XCvH4SI0bVbgSrVjy/g==
X-Google-Smtp-Source: ABdhPJwXpZSrW8Me/AQYrMucDQsG4WjJwB/7zGkaasnF10zu4OJb8NfujUuM7K7ZfhxAEyp+pQzIuw==
X-Received: by 2002:a5d:8516:: with SMTP id q22mr7822916ion.122.1590779872008;
        Fri, 29 May 2020 12:17:52 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n12sm3944640iog.25.2020.05.29.12.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 12:17:50 -0700 (PDT)
Received: (nullmailer pid 2784485 invoked by uid 1000);
        Fri, 29 May 2020 19:17:49 -0000
Date:   Fri, 29 May 2020 13:17:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        devicetree@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v6 02/11] dt-bindings: i2c: Convert DW I2C slave to the
 DW I2C master example
Message-ID: <20200529191749.GA2784431@bogus>
References: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
 <20200528093322.23553-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528093322.23553-3-Sergey.Semin@baikalelectronics.ru>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 28 May 2020 12:33:12 +0300, Serge Semin wrote:
> dtc currently doesn't support I2C_OWN_SLAVE_ADDRESS flag set in the
> i2c "reg" property. If dtc finds an i2c-slave sub-node having an address
> higher than ten-bits wide it'll print an ugly warning:
> 
> Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
> 
> In order to silence dtc up let's replace the corresponding DT binding
> example with a normal DW I2C master mode-based one. It's done by clearing
> the I2C_OWN_SLAVE_ADDRESS bit in the reg property and converting the
> sub-node to be compatible with normal EEPROM like "atmel,24c02".
> 
> Just revert this commit when dtc is fixed.
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
> Rob, even though you asked for such modification, it might be a better to
> just ignore the warning until dtc is properly fixed. Andy and me agree
> with that. If you are also on the same side with us, just explicitly nack
> this patch so Jarkko or Wolfram would ignore it when merging in the series.
> 
> Changelog v3:
> - This is a new patch created as a result of the Rob request to remove
>   the EEPROM-slave bit setting in the DT binndings example until the dtc
>   is fixed.
> 
> Changelog v6:
> - Replace the "linux,slave-24c02" compatible string with "atmel,24c02" one
>   so the example would be perceived as a normal DW I2C master mode.
> ---
>  .../devicetree/bindings/i2c/snps,designware-i2c.yaml          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
