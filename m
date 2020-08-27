Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E2A253D0B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 07:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgH0FGK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 01:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgH0FGJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Aug 2020 01:06:09 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE45C061240;
        Wed, 26 Aug 2020 22:06:09 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d19so2483537pgl.10;
        Wed, 26 Aug 2020 22:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7IhqloVaMibf2jlzA4WMOp2YL1jlSwNWW6bEUaEjE70=;
        b=MM4m8VVL34hq0942VtiA6yVZWBnFE6qE2Nc4MymlFTZV67g9XvTBfU1MiU8HQlKQoS
         Z2qEyLxFY6FUzNvUOQFeLPLruy6txqYKOIV0NXyKHST1ceZ96kzEEcor/EiirnEqvz9W
         yC2d3AuWlQRyQ2PV490ityVLNiUUV+I+J4Cixc5ED6TqMy4yOn/lt1moJLqRMl1h5m9i
         E1UasyiSxHGX2Hv5VKdth69XX9/O5beUehPugxZyjOUoaQTiWTskVb0E8SsHEenMIXi4
         D8BK27J/FkVwkOLzrGq/j2sdagtYAvgPY8IRhbw06EvX1GVhAsZP2qSxO+GX+dqu4kIx
         /6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7IhqloVaMibf2jlzA4WMOp2YL1jlSwNWW6bEUaEjE70=;
        b=PCeYqfnctwVa/ggu7IEv/ysA62Bq8K041vXkUkf29Qhk5fxDPrYSRNLeYIz1qyTyCZ
         8w1h6qrWI2EYbP/UR6aSOXALXYwGesM0hIOw+ivn4qR5pzsM3hevaenvBS/WE/4MCWRV
         LTi7K8VXw3QGgilDDT1h2FvsCWAQ15xGhHeLLpJayN9lBqZzPIMApJQ9ueXdRfFfVB11
         s9COv/CpzzCmZ0F2dwpDuC1CuBo2PNktKe+ZQiAATDOFInz7B2ChOpRGtZin82+dwxZC
         02ggpuVbiOTPEKvEfVh09u1WDOCZXqtruXxPX5Ru8ZcPMOLuJIUUSQzquFSv+kDAeITZ
         aTQA==
X-Gm-Message-State: AOAM531+T62M7QilmKqXyU2odM3FOQY3wX753qAXHZL5FhejKQlToRMo
        ojkXEH/fkdYWKagcuGbv/30=
X-Google-Smtp-Source: ABdhPJzjzzoY7Skt0zwRoFrIRfr0W5ogmgbRPGMxbAV7U8UUadv17Mke6ZwLr9hn9Sqv/G/bMGtLoA==
X-Received: by 2002:a63:4cc:: with SMTP id 195mr10585879pge.376.1598504768573;
        Wed, 26 Aug 2020 22:06:08 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id w199sm933744pfc.191.2020.08.26.22.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 22:06:07 -0700 (PDT)
Date:   Thu, 27 Aug 2020 14:06:05 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: do not acpi/of match device in i2c_device_probe()
Message-ID: <20200827050605.GA512@jagdpanzerIV.localdomain>
References: <20200826144920.110605-1-sergey.senozhatsky@gmail.com>
 <20200826151629.GR1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826151629.GR1891694@smile.fi.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On (20/08/26 18:16), Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 11:49:20PM +0900, Sergey Senozhatsky wrote:
> > i2c, apparently, can match the same device twice - the first
> > time in ->match bus hook (i2c_device_match()), and the second
> > one in ->probe (i2c_device_probe()) bus hook.
> > 
> > To make things more complicated, the second matching does not
> > do exactly same checks as the first one. Namely, i2c_device_match()
> > calls acpi_driver_match_device() which considers devices that
> > provide of_match_table and performs of_compatible() matching for
> > such devices. One important thing to note here is that ACPI
> > of_compatible() matching (acpi_of_match_device()) is part of ACPI
> > and does not depend on CONFIG_OF.
> > 
> > i2c_device_probe(), on the other hand, calls acpi_match_device()
> > which does not perform of_compatible() matching, but instead
> > i2c_device_probe() relies on CONFIG_OF API to perform of_match_table
> > matching, IOW ->probe matching, unlike ->match matching, depends on
> > CONFIG_OF. This can break i2c device probing on !CONFIG_OF systems
> > if the device does not provide .id_table.
> > 
> >  i2c_device_probe()
> >  ...
> >    if (!driver->id_table &&
> >        !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
> >        !i2c_of_match_device(dev->driver->of_match_table, client)) {
> >        status = -ENODEV;
> >        goto put_sync_adapter;
> >    }
> > 
> > i2c_of_match_device() on !CONFIG_OF systems is always false, so we never
> > perform of_match_table matching. i2c_acpi_match_device() does ACPI match
> > only, no of_compatible() matching takes place, even though the device
> > provides .of_match_table and ACPI is capable of matching such device.
> > 
> > It is not entirely clear why the device is matched again in bus
> > ->probe after successful and proper matching in bus ->match. Let's
> > remove ->probe matching.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> (assuming it's okay to go)

Thanks.

I tested the patch on x86_64 (a mix of i2c devices with and without
.id_table) and arm64 boards - didn't notice any difference, module
probing wise.

	-ss
