Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BAA563A968
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 14:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbiK1NZs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 08:25:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiK1NZr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 08:25:47 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F391E3E6;
        Mon, 28 Nov 2022 05:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669641947; x=1701177947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Hm6Qs6uN6hk1dvnOSkESft5jK71X63lvlApLzzjTym8=;
  b=nHXZ4YsSO/fX8CiQdu6t0/2mP8uQ8rddkA97Bhg0bpCr8x3NmqNDII8+
   H6XQwlTHqqSxgOJ5nSMKNBP4cPskuSD1PWn0eBVHexIq6z0LK7awtTnuA
   hgnae7KlEalrENKWtavIX2pVSIO85mJ+lxYb86N9jV2He+60IGJHKDfw7
   uzP1gPc55N8mB2OyegR6IcFwwwTFdy4B4haWaIldTGJ4zsSjGw3qFFvPp
   10e7P9GinSiufGBMya1HHOY60jpX7V/qwtDcJeYdURrXAHCboZAsdmUMf
   8I1FwB0JJmvNJw5n23yP5I6HXLk4Gms6LUnGQ+wekhSm64ccWrNrMpCHM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="341744181"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="341744181"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 05:25:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="749384640"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="749384640"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 28 Nov 2022 05:25:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oze8h-0019NL-1h;
        Mon, 28 Nov 2022 15:25:39 +0200
Date:   Mon, 28 Nov 2022 15:25:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] i2c: loongson: add bus driver for the loongson
 i2c controller
Message-ID: <Y4S20yF+vB1atRFz@smile.fi.intel.com>
References: <20221117075938.23379-1-zhuyinbo@loongson.cn>
 <Y3X0bJxOQIpP6MZv@smile.fi.intel.com>
 <f401b35d-f775-9a06-bec6-983d33ddb249@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f401b35d-f775-9a06-bec6-983d33ddb249@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 28, 2022 at 09:13:02PM +0800, Yinbo Zhu wrote:
> 在 2022/11/17 16:44, Andy Shevchenko 写道:
> > On Thu, Nov 17, 2022 at 03:59:37PM +0800, Yinbo Zhu wrote:

...

> > > +start:
> > > +	mdelay(1);
> > Why?
> This is a workaroud.

You need to add a comment explaining that in details.

-- 
With Best Regards,
Andy Shevchenko


