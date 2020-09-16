Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47EB426C84C
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 20:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgIPSo7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 14:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbgIPSWz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Sep 2020 14:22:55 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B80BC02C2A8;
        Wed, 16 Sep 2020 08:56:54 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id a3so8691239oib.4;
        Wed, 16 Sep 2020 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WM9s3RsVy5Wg/Fr5iWNEv4Ft/ePfRGMrEjAFWBssexY=;
        b=HibUHMtrtW4RCSELXbpEJ/jU9BQUHRKY1KLG0tSoyWXtDEXnMOXArt4bXrtKF0wI+l
         hEWgQnPcY5ndeeKXQrdEqvjIYbATa2MHPTjkQnVUYBL7J24NEA8z7Cm9UpO56RXmV5BV
         nsQLibmMb1aIRicQ+8IQ8uyZXi2tKzwJ3nzzIm03lb5rDecbUXhlmyOv70+aAiAq2bIz
         jVaaO0CThQDFrkxK4rbRcAkvw28QowcyE/lzv23D7UDIU9EfrYytE+/WOdAs6PYQehdh
         cikfmx6mhxof2G4HIokFFgTBxnrjBRhHTf17GAfDBDeKbP1qhPsx5GCMD2RrniZVe6eK
         wzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=WM9s3RsVy5Wg/Fr5iWNEv4Ft/ePfRGMrEjAFWBssexY=;
        b=F4Ml8SQ5hjjQRFbdD61ReCAgXnvYvDfND0DVoqjCWNlGf6geXBc6Wb0fnwu1pCcC8m
         YmBu/ZNrXiwnji/ZUk3H6YL3t1ROhCfZfQ+BpPouAucKGsB50mhjTxVKG+p4cxGjncX+
         g+z9RnRyKTqVUMA+MmOm6puFNLv7rnmFocRRnF/X9h2dJJAV+Pjq1N3XfgFv8HNkBPVN
         od80v8tOieEMOs0IUdmR10IYLCoEYc9QvVmiBT0hWc+bkSSFoicticHicA/O7xvR/Ch/
         DrUydFthguCFUNoL7xTkOjfXI2KoKVDVPfd+PeF4z2NRSEuVj2DX3uTl338Oefz13XUB
         IR/w==
X-Gm-Message-State: AOAM532azv/uRKPhiaRN0xmJBVQqGY+W4SWHaSyTF8Fwmd1wDq5IUMbf
        7WZ/bVvkKHdRm9gYiqz4p+0=
X-Google-Smtp-Source: ABdhPJyHYueqAW0g+xfrRVGc4rFP8R+hvE8d7LEnDb/RxanX+QeoVw3b8fHsVd4K26So3/y/leBYqA==
X-Received: by 2002:aca:7544:: with SMTP id q65mr3688427oic.77.1600271814047;
        Wed, 16 Sep 2020 08:56:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r62sm8460206oih.12.2020.09.16.08.56.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 08:56:53 -0700 (PDT)
Date:   Wed, 16 Sep 2020 08:56:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>, wsa@kernel.org,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] hwmon: (pmbus/ucd9000) Throttle SMBus transfers
 to avoid poor behaviour
Message-ID: <20200916155651.GA90122@roeck-us.net>
References: <20200914122811.3295678-1-andrew@aj.id.au>
 <20200914122811.3295678-3-andrew@aj.id.au>
 <71067b18-c4bc-533a-0069-f21069c5fd0d@roeck-us.net>
 <48962472-b025-4b0d-90e9-60469bebf206@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48962472-b025-4b0d-90e9-60469bebf206@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 16, 2020 at 02:51:08PM +0930, Andrew Jeffery wrote:
> 
> 
> On Mon, 14 Sep 2020, at 23:44, Guenter Roeck wrote:
> > On 9/14/20 5:28 AM, Andrew Jeffery wrote:
> > > Short turn-around times between transfers to e.g. the UCD90320 can lead
> > > to problematic behaviour, including excessive clock stretching, bus
> > > lockups and potential corruption of the device's volatile state.
> > > 
> > > Introduce transfer throttling for the device with a minimum access
> > > delay of 1ms.
> > > 
> > 
> > Some Zilker labs devices have the same problem, though not as bad
> > to need a 1ms delay. See zl6100.c. Various LTS devices have a similar
> > problem, but there it is possible to poll the device until it is ready.
> > See ltc2978.c.
> > 
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  drivers/hwmon/pmbus/ucd9000.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
> > > index 81f4c4f166cd..a0b97d035326 100644
> > > --- a/drivers/hwmon/pmbus/ucd9000.c
> > > +++ b/drivers/hwmon/pmbus/ucd9000.c
> > > @@ -9,6 +9,7 @@
> > >  #include <linux/debugfs.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/module.h>
> > > +#include <linux/moduleparam.h>
> > >  #include <linux/of_device.h>
> > >  #include <linux/init.h>
> > >  #include <linux/err.h>
> > > @@ -18,6 +19,9 @@
> > >  #include <linux/gpio/driver.h>
> > >  #include "pmbus.h"
> > >  
> > > +static unsigned long smbus_delay_us = 1000;
> > 
> > Is that to be on the super-safe side ? Patch 0 talks about needing 250 uS.
> > 
> > > +module_param(smbus_delay_us, ulong, 0664);
> > > +
> > 
> > I would not want to have this in user control, and it should not affect devices
> > not known to be affected. 
> 
> Can you clarify what you mean here? Initially I interpreted your statement as 
> meaning "Don't impose delays on the UCD90160 when the issues have only been 
> demonstrated with the UCD90320". But I've since looked at zl6100.c and its 

Yes, that is what I meant.

> delay is also exposed as a module parameter, which makes me wonder whether it 

My bad. Not how I would implement it today. I'd also not use udelay() if I were
to re-implement this today.

> was unclear that smbus_delay_us here is specific to the driver's i2c_client and 
> is not a delay imposed on all SMBus accesses from the associated master. That 
> is, with the implementation I've posted here, other (non-UCD9000) devices on 
> the same bus are _not_ impacted by this value.
> 
The delay is specific to the driver's i2c client.

> > I would suggest an implementation similar to other
> > affected devices; again, see zl6100.c or ltc2978.c for examples.
> 
> I've had a look at these two examples. As you suggest the delays in zl6100.c 
> look pretty similar to what this series implements in the i2c core. I'm finding 
> it hard to dislodge the feeling that open-coding the waits is error prone, but 
> to avoid that and not implement the waits in the i2c core means having almost 
> duplicate implementations of handlers for i2c_smbus_{read,write}*() and 
> pmbus_{read,write}*() calls in the driver.
> 

Not sure I can follow you here. Anyway, it seems to me that you are set on
an implementation in the i2c core. I personally don't like that approach,
but I'll accept a change in the ucd9000 driver to make use of it. Please
leave the zl6100 code alone, though - it took me long enough to get that
working, and I won't have time to test any changes.

Thanks,
Guenter
