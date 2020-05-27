Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20BF91E4794
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 17:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgE0Pdz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 11:33:55 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:36842 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgE0Pdz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 11:33:55 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id D4B698030809;
        Wed, 27 May 2020 15:33:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gT1-Zau-FHP8; Wed, 27 May 2020 18:33:52 +0300 (MSK)
Date:   Wed, 27 May 2020 18:33:51 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 02/11] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
Message-ID: <20200527153351.rmzguymz7lm6gvsx@mobilestation>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200527153046.6172-3-Sergey.Semin@baikalelectronics.ru>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rob,
Could you pay attention to this patch? The patchset review procedure is
nearly over, while the DT part is only partly reviewed by you.

Thanks
-Sergey

On Wed, May 27, 2020 at 06:30:37PM +0300, Serge Semin wrote:
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
>        };
>      };
>    - |
> -- 
> 2.26.2
> 
