Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B251E3492
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 03:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgE0BRI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 21:17:08 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:45302 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727937AbgE0BRH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 21:17:07 -0400
Received: by mail-il1-f196.google.com with SMTP id 9so3966026ilg.12;
        Tue, 26 May 2020 18:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K2RpsvgqWdvk/VhLsXZfdJ8GJexHCmKIWzl61ljgxjU=;
        b=trX2tcvJGNLZ3vRh6iUMNQJwZg3PAeZ767HnrSSHrL/ShjlrzlY1G6Ub35UFxmUFcp
         CJAuzuINZAwP9zFwgGbo8Xq6ZaZQsegltK8J7BcqQPvjmFc48yB8NKhl6bimO77kjHS9
         elJtWUizZ+rROzF9IrkOfyo46kvPefWOaljW9n5FIXU/ec4hnzklzD1tYV0sw0N0n0g8
         zkrss0wCdeymyfezuwgcILTz6l0FdvSLVc7qzrv5VP5whFIEeli5ULjOtd1kDbjp7ZKQ
         wvfCe6As6BzExlzRCW8wkOEeHq0qbDzfqtMdVWupix58FPPocHBvRybg2YfZxnqhzt5n
         36eg==
X-Gm-Message-State: AOAM533u3ObuLw99qB4rGR/It19jmk2Qi5MnlAR/G48ScIQM9+Oc4RW3
        zc7bmCrLsxxREaOpVV7TfmCj+I0=
X-Google-Smtp-Source: ABdhPJz9jOzb4M6JUeX67KjpLCWqMnC7X4U7KMu7WaisuKAW36Ms05pdr0FupZfHM0JMSMwZOAKTwg==
X-Received: by 2002:a92:2a0d:: with SMTP id r13mr3597939ile.21.1590542225912;
        Tue, 26 May 2020 18:17:05 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c62sm206186ill.62.2020.05.26.18.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 18:17:05 -0700 (PDT)
Received: (nullmailer pid 817648 invoked by uid 1000);
        Wed, 27 May 2020 01:17:04 -0000
Date:   Tue, 26 May 2020 19:17:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Frank Rowand <frowand.list@gmail.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/12] scripts/dtc: check: Add 10bit/slave i2c reg
 flags support
Message-ID: <20200527011704.GA808104@bogus>
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
 <20200526215528.16417-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526215528.16417-2-Sergey.Semin@baikalelectronics.ru>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 12:55:17AM +0300, Serge Semin wrote:
> Recently the I2C-controllers slave interface support was added to the
> kernel I2C subsystem. In this case Linux can be used as, for example,
> a I2C EEPROM machine. See [1] for details. Other than instantiating
> the EEPROM-slave device from user-space there is a way to declare the
> device in dts. In this case firstly the I2C bus controller must support
> the slave interface. Secondly I2C-slave sub-node of that controller
> must have "reg"-property with flag I2C_OWN_SLAVE_ADDRESS set (flag is
> declared in [2]). That flag is declared as (1 << 30), which when set
> makes dtc unhappy about too big address set for a I2C-slave:
> 
> Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
> 
> Similar problem would have happened if we had set the 10-bit address
> flag I2C_TEN_BIT_ADDRESS in the "reg"-property.
> 
> In order to fix the problem we suggest to alter the I2C-bus reg-check
> algorithm, so one would be aware of the upper bits set. Normally if no
> flag specified, the 7-bit address is expected in the "reg"-property.
> If I2C_TEN_BIT_ADDRESS is set, then the 10-bit address check will be
> performed. The I2C_OWN_SLAVE_ADDRESS flag will be just ignored.
> 
> [1] Documentation/i2c/slave-interface.rst
> [2] include/dt-bindings/i2c/i2c.h
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> ---
>  scripts/dtc/checks.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

I've lost track of who all I've said this to already for this issue, but 
patches to dtc should be against upstream and a version of this has been 
sent there already. But it seems they've lost interest in addressing the 
review comments. So feel free to send another one. The same comment 
applies here.

Rob
