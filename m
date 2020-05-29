Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA6E1E8661
	for <lists+linux-i2c@lfdr.de>; Fri, 29 May 2020 20:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgE2SNm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 14:13:42 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:37039 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgE2SNl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 May 2020 14:13:41 -0400
Received: by mail-il1-f193.google.com with SMTP id r2so3408551ila.4;
        Fri, 29 May 2020 11:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aRBnenMFveSAABdwlROP/FvdOi6pos1MRvJer5gJKo8=;
        b=N1eI2QxLX3cf32YTIZjABQ7XNWHMFsKWSy5ANpfndBGWwagRpX8dASVBY7b4ajLpnW
         D+TQ+MZwcNjhS1seiMODaniq1IaRh7boiR7+/LEGOMjiDRamwg/yVa2Z50XaoLJiiFRH
         DFIG4WAehP8gLlFy1mD0c0W44LfFkhpXf3w8f5ocQqJA2LtO/DcG6A6m2+Kitq83BqQe
         LrLl0tVEQ5IKe5BToTbiN2Ju7w5hJIdykHzFPlVRZE+Hwu+Ezko6K+7478wvszfoTr97
         mxWDTLV+T5+1RWJUVNc2GA6E/+BB8/EiK5dOzwAip0axUs/+FbhR9f5dODZmqZWCV8qq
         YGhw==
X-Gm-Message-State: AOAM533jIf2LExfJNOEeagr2prIlil9HfZNmHGZKlDYXwavX9YIXTmJe
        f0ENtcrbU2ivjKZAnjtjSw==
X-Google-Smtp-Source: ABdhPJx2nW8lDxavRSJmbF0k3z1CkhwQPOmSKpswzKd6H4iHfuG5Z9SNcWxYWDtEg0wux3hPuBSakA==
X-Received: by 2002:a92:d34b:: with SMTP id a11mr8638435ilh.180.1590776020832;
        Fri, 29 May 2020 11:13:40 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id p3sm4173510iog.31.2020.05.29.11.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 11:13:39 -0700 (PDT)
Received: (nullmailer pid 2683492 invoked by uid 1000);
        Fri, 29 May 2020 18:13:38 -0000
Date:   Fri, 29 May 2020 12:13:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/11] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
Message-ID: <20200529181338.GA2676189@bogus>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-3-Sergey.Semin@baikalelectronics.ru>
 <20200527153351.rmzguymz7lm6gvsx@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527153351.rmzguymz7lm6gvsx@mobilestation>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 06:33:51PM +0300, Serge Semin wrote:
> Rob,
> Could you pay attention to this patch? The patchset review procedure is
> nearly over, while the DT part is only partly reviewed by you.

Pretty sure I commented on this. Not sure what version, you're sending 
new versions too fast. Give people time to review.

> 
> Thanks
> -Sergey
> 
> On Wed, May 27, 2020 at 06:30:37PM +0300, Serge Semin wrote:
> > dtc currently doesn't support I2C_OWN_SLAVE_ADDRESS flag set in the
> > i2c "reg" property. If it is the compiler will print a warning:
> > 
> > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
> > 
> > In order to silence dtc up let's discard the flag from the DW I2C DT
> > binding example for now. Just revert this commit when dtc is fixed.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: linux-mips@vger.kernel.org
> > 
> > ---
> > 
> > Changelog v3:
> > - This is a new patch created as a result of the Rob request to remove
> >   the EEPROM-slave bit setting in the DT binndings example until the dtc
> >   is fixed.
> > ---
> >  Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > index 4bd430b2b41d..101d78e8f19d 100644
> > --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > @@ -137,7 +137,7 @@ examples:
> >  
> >        eeprom@64 {
> >          compatible = "linux,slave-24c02";
> > -        reg = <0x40000064>;
> > +        reg = <0x64>;

This is wrong though because "linux,slave-24c02" should have bit 30 set. 
(And either the unit-address was wrong or we can define the unit-address 
does not include the high bits.)

Rob
