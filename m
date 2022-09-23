Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25D575E7804
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Sep 2022 12:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbiIWKPU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Sep 2022 06:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbiIWKPT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Sep 2022 06:15:19 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125967B2A3;
        Fri, 23 Sep 2022 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663928118; x=1695464118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4Gihtk+jMIv+Zy1C9obT/rIZhF/51KRjSSSw/EX4tCw=;
  b=dMNDEm5hg5zWehbGpvXMLOY10sVukTlevRrLO9IOmFy+SQ6w54YCvn81
   lhGsbqEQq+oemgYQMAAwa3zVYY4pGEI3sNEEwvM4yxOeJFgkmPXpjjjhu
   qpJQUuNtdj6z4YTYW2f+3iZrjvDVXo4I03PwLJZBGUjgFOn7363xFpRnj
   Vkgz1dRb0nsSpitR8gdGw3DlJI9Fx2vS053TdXaovjbpe8pRGUsTnNzn+
   z2EcV0JdFbv+J+vF2n3ZLTICN4MoQ+7/c+U4eUcPvJUjL/P196CpWh/xE
   7lglp3sVVMOZGkwB4Wt0HqQI0NdAVd8S1b4f5VZJBCgnlUBzVe6BRE7WJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="362372978"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="362372978"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 03:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="688671226"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2022 03:15:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C8EC4F7; Fri, 23 Sep 2022 13:15:32 +0300 (EEST)
Date:   Fri, 23 Sep 2022 13:15:32 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        linux-acpi@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 2/5] i2c: gpio: Add support on ACPI-based system
Message-ID: <Yy2HRPxWPCvda8Hz@black.fi.intel.com>
References: <cover.1663835855.git.zhoubinbin@loongson.cn>
 <74988d34ceae9bf239c138a558778cd999beb77c.1663835855.git.zhoubinbin@loongson.cn>
 <YyxUjuP1TxEzoxvG@black.fi.intel.com>
 <73a11791-997b-c2d7-fa0c-3d0431293dae@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73a11791-997b-c2d7-fa0c-3d0431293dae@loongson.cn>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 23, 2022 at 06:01:30PM +0800, Binbin Zhou wrote:
> Hi Mika：
> 
> 在 2022/9/22 20:26, Mika Westerberg 写道:
> > Hi,
> > 
> > On Thu, Sep 22, 2022 at 07:39:55PM +0800, Binbin Zhou wrote:
> > > Add support for the ACPI-based device registration so that the driver
> > > can be also enabled through ACPI table.
> > > 
> > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >   drivers/i2c/busses/i2c-gpio.c | 41 ++++++++++++++++++++++++++++++++++-
> > >   1 file changed, 40 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> > > index b1985c1667e1..ccea37e755e6 100644
> > > --- a/drivers/i2c/busses/i2c-gpio.c
> > > +++ b/drivers/i2c/busses/i2c-gpio.c
> > > @@ -13,6 +13,7 @@
> > >   #include <linux/init.h>
> > >   #include <linux/interrupt.h>
> > >   #include <linux/module.h>
> > > +#include <linux/acpi.h>
> > >   #include <linux/of.h>
> > >   #include <linux/platform_data/i2c-gpio.h>
> > >   #include <linux/platform_device.h>
> > > @@ -318,6 +319,24 @@ static void of_i2c_gpio_get_props(struct device_node *np,
> > >   		of_property_read_bool(np, "i2c-gpio,scl-output-only");
> > >   }
> > > +static void acpi_i2c_gpio_get_props(struct device *dev,
> > > +				  struct i2c_gpio_platform_data *pdata)
> > > +{
> > > +	u32 reg;
> > > +
> > > +	device_property_read_u32(dev, "delay-us", &pdata->udelay);
> > > +
> > > +	if (!device_property_read_u32(dev, "timeout-ms", &reg))
> > > +		pdata->timeout = msecs_to_jiffies(reg);
> > > +
> > > +	pdata->sda_is_open_drain =
> > > +		device_property_read_bool(dev, "sda-open-drain");
> > > +	pdata->scl_is_open_drain =
> > > +		device_property_read_bool(dev, "scl-open-drain");
> > > +	pdata->scl_is_output_only =
> > > +		device_property_read_bool(dev, "scl-output-only");
> > > +}
> > 
> > I think this would work with the DT description too as it is using
> > device_property_xxx() so I wonder if you can just do:
> > 
> > 	i2c_gpio_get_props(dev, pdata);
> > 
> > instead of
> > 
> >   	if (np) {
> >   		of_i2c_gpio_get_props(np, pdata);
> > 	} else if (ACPI_COMPANION(dev)) {
> > 		acpi_i2c_gpio_get_props(dev, pdata);
> > 
> Sorry, I don't quite understand how to do a unified api.
> 
> We get the corresponding value by matching the propname, but obviously the
> propnames related in the two ways are different.
> 
> e.g. "delay-us"(ACPI) vs "i2c-gpio, delay-us"(FDT)

Oh, we have different bindings for these? :( That's unfortunate - they
should really have the same. That's the whole purpose of device
properties API in the first place.
