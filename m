Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 811257BA3F2
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Oct 2023 18:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbjJEQCp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Oct 2023 12:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237841AbjJEQBm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Oct 2023 12:01:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CC82D5E;
        Thu,  5 Oct 2023 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696513856; x=1728049856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tXYScCQloVsf+4gJdEXKIeLEpV9gui3O8J54Ug/L2KY=;
  b=cpznR0Chai9JWC4G9Fgygf7Z+65i3xBOmbnfawgh8+H1Hg7wW8ELlWWK
   7//TH63VkXPIJhaEt8UH+kKFestRDBfi247f/oVOibhnmtC6xWR9wpnY0
   67xsGXS2eF7htZjPzrevGmHQGIm9YYU6UUnNw03p6v13EQ6Vu9jHKJB3x
   samxVCqkyxvqt2Zz2c6B28e5VgXCAj//fMFJfdyn7GgtnYNVs34LfGJED
   z45n/MPF5sSME65Ccp2oACHcjsCWz8C/LdL0T8vO+a6jNOEepCzYE4RoN
   Mkcfa1Ar+QEacbAti12bsk4cDMc7pzH7ct8bUQGX7M/kr3WyjXdgsAL6T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368546539"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="368546539"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 04:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701629587"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="701629587"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 04:56:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qoMxl-000000030t3-0Z6W;
        Thu, 05 Oct 2023 14:56:17 +0300
Date:   Thu, 5 Oct 2023 14:56:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ryan Chen <ryan_chen@aspeedtech.com>
Cc:     "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "=linux-kernel@vger.kernel.org" <=linux-kernel@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Message-ID: <ZR6kYMOB67+WJonG@smile.fi.intel.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <ZLENe5B3gi/oNTQp@smile.fi.intel.com>
 <SEZPR06MB5269831E049E2267661F181FF2E8A@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <ZPcXJ4adUNMv4LDr@smile.fi.intel.com>
 <SEZPR06MB52699EC5463397F4BFF244DBF2CAA@SEZPR06MB5269.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR06MB52699EC5463397F4BFF244DBF2CAA@SEZPR06MB5269.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 05, 2023 at 06:21:35AM +0000, Ryan Chen wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Tuesday, September 5, 2023 7:55 PM
> > On Tue, Sep 05, 2023 at 06:52:37AM +0000, Ryan Chen wrote:
> > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Sent: Friday, July 14, 2023 4:55 PM
> > > > On Fri, Jul 14, 2023 at 03:45:22PM +0800, Ryan Chen wrote:

...

> > > 			divisor = DIV_ROUND_UP(base_clk[3],
> > i2c_bus->timing_info.bus_freq_hz);
> > > 			for_each_set_bit(divisor, &divisor, 32) {
> > 
> > This is wrong.
> > 
> > > 				if ((divisor + 1) <= 32)
> > > 					break;
> > 
> > > 				divisor >>= 1;
> > 
> > And this.
> > 
> > > 				baseclk_idx++;
> > 
> > > 			}
> > 
> > for_each_set_bit() should use two different variables.
> 
> Will update by following.
> 
> for_each_set_bit(bit, &divisor, 32) {
>     divisor >>= 1;
>     baseclk_idx++;
> }

It's unclear what you are trying to achieve here as the code is not equivalent
to the above.

> > > 		} else {
> > > 			baseclk_idx = i + 1;
> > > 			divisor = DIV_ROUND_UP(base_clk[i],
> > i2c_bus->timing_info.bus_freq_hz);
> > > 		}
> > > 	}

...

> > > 	divisor = min_t(unsigned long, divisor, 32);
> > 
> > Can't you use min()? min_t is a beast with some subtle corner cases.
> > 
> Will update to 
> divisor = min(divisor, (unsigned long)32);

No, the idea behind min() is that _both_ arguments are of the same type,
the proposed above is wrong.

-- 
With Best Regards,
Andy Shevchenko


