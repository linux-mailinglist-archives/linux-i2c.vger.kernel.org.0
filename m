Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE53640226
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Dec 2022 09:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232917AbiLBIbl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Dec 2022 03:31:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232738AbiLBI37 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Dec 2022 03:29:59 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9697860B66;
        Fri,  2 Dec 2022 00:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669969786; x=1701505786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4tZ8P1rjFZqQdEDu1Entw+Faj29DY+fm4wogYriUb4s=;
  b=Jdt8OOBFCU2iBd2rV6fjNUU1WhsCSQfugO5vi918dZQOBVDmUURee7kF
   wy4DNQmulxM9x2mekJdHFLN6ZLJc91iOJz7qwS3qFjUgjUujIKaGnQboA
   0b1nADg7T/1N2kz+QR31RJem6yAOD9cxhO7pHMPmOM1+adtqmoLK55QvU
   Tq4jJ0nBdNViYr7fKzjgIPgqe3LRl95LOeif7HKCBeZd9ZOCClCQdeZru
   xiC3dKvU0NIdH8g9k13TV7JVkXB7WZ9Xiu8hwQ9UmCMZine8eaPBRayq/
   cbqZA2psQ5Lrurx4B3yQwAHqcrtyA8sLt9uCX2Xl4/IASLIsn7Ry5L5PL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="317764272"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="317764272"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 00:29:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="973832094"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="973832094"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 02 Dec 2022 00:29:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p11QA-003HNL-05;
        Fri, 02 Dec 2022 10:29:22 +0200
Date:   Fri, 2 Dec 2022 10:29:21 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V4 4/5] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y4m3Ycs88nOk5zs9@smile.fi.intel.com>
References: <cover.1669777792.git.zhoubinbin@loongson.cn>
 <f6cc2dbe5cd190031ab4f772d1cf250934288546.1669777792.git.zhoubinbin@loongson.cn>
 <Y4e/6KewuHjAluSZ@smile.fi.intel.com>
 <f0060385-644a-847e-48cf-865c12b96473@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0060385-644a-847e-48cf-865c12b96473@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 02, 2022 at 11:22:19AM +0800, Binbin Zhou wrote:
> 在 2022/12/1 04:41, Andy Shevchenko 写道:
> > On Wed, Nov 30, 2022 at 01:56:20PM +0800, Binbin Zhou wrote:

...

> > > +	for (retry = 0; retry < adap->retries; retry++) {
> > > +		ret = ls2x_i2c_doxfer(adap, msgs, num);
> > > +		if (ret != -EAGAIN)
> > > +			return ret;
> > > +
> > > +		dev_dbg(priv->dev, "Retrying transmission (%d)\n", retry);
> > > +		udelay(100);
> > Why atomic? This long (esp. atomic) delay must be explained.
> 
> The modification records for this part of the source code are no longer
> traceable.
> 
> Communicating with colleagues offline, I learned that this part of the code
> first appeared on Linux 2.6.36, which was done to circumvent the problem of
> probable failure to scan the device for i2c devices on some boards.
> 
> How about I add a comment here to explain the reason for this?

Yes, that's what we want, and not what you said above. I.o.w. the comment like
"reason is unknown" is not accepted.

Can you be more specific about the boards and why do you still need this delay?

And also why is it atomic?

> > > +	}

...

> > > +	r = devm_request_irq(dev, irq, ls2x_i2c_irq_handler,
> > > +				IRQF_SHARED, "ls2x-i2c", priv);
> > Indentation.
> 
> Do you mean  "IRQF_SHARE"  should be aligned to "dev"  ?

Yes.

...

> > > +static const struct dev_pm_ops ls2x_i2c_pm_ops = {
> > > +	SET_SYSTEM_SLEEP_PM_OPS(ls2x_i2c_suspend, ls2x_i2c_resume)
> > > +};
> > Use corresponding DEFINE_ macro.
> 
> ok.
> 
> I will use
> 
> "static DEFINE_SIMPLE_DEV_PM_OPS(ls2x_i2c_pm_ops, ls2x_i2c_suspend,
> ls2x_i2c_resume);"  corresponding to  ".pm     = pm_ptr(&ls2x_i2c_pm_ops),"

Shouldn't be pm_sleep_ptr()?


-- 
With Best Regards,
Andy Shevchenko


