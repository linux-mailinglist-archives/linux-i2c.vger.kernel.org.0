Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA2746E11E2
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 18:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjDMQM3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 12:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjDMQM2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 12:12:28 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B51AE6B;
        Thu, 13 Apr 2023 09:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681402347; x=1712938347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u3In46KoV7jrlPQBLlMpa2pfQ3+DhOK7gwXj89ZvQh0=;
  b=fz34nK6Ha1m34z4HWQpV73uEcSYigx5Ggbf5mM9iUb+pp20bNoK2Uhpq
   IXMRepbftMliBM6JMDB0u/OglxpUr+QSueSrmQP5wTWTtgj+g4ybrpoov
   aqNcexjFyqIwiuciwx/pfeaayxtWkWv5PtoSrzVVvdER+qLcT9VBqWiI9
   IWCcl0uDby6PEiUETWwj17X0y2+1dTwUIqnCXtdAe8TnTY7FJ+lEzG6Z4
   ElCJ/mkpn60djxvr6CgKjlolZyPtZuF8WZOCoTgPX+jfKgDVRthAtvviC
   KWhLdJOD3uQwbFfgLgnCfMkyhtARHzgOUc5XzW0G/HjSGGJI73tVCFFeh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="323853012"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="323853012"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 09:12:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="758753815"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="758753815"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 13 Apr 2023 09:12:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pmzYT-00GchC-2q;
        Thu, 13 Apr 2023 19:12:13 +0300
Date:   Thu, 13 Apr 2023 19:12:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ryan Chen <ryan_chen@aspeedtech.com>
Cc:     Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/2 RESEND] i2c: aspeed: support ast2600 i2c new
 register mode driver
Message-ID: <ZDgp3VrjW1YdC16z@smile.fi.intel.com>
References: <20230413075327.1397306-1-ryan_chen@aspeedtech.com>
 <20230413075327.1397306-3-ryan_chen@aspeedtech.com>
 <ZDgpkK/Dv3y1LUe2@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDgpkK/Dv3y1LUe2@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 13, 2023 at 07:10:56PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 13, 2023 at 03:53:27PM +0800, Ryan Chen wrote:
> > Add i2c new register mode driver to support AST2600 i2c
> > new register mode. AST2600 i2c controller have legacy and
> > new register mode. The new register mode have global register
> > support 4 base clock for scl clock selection, and new clock
> > divider mode. The i2c new register mode have separate register
> > set to control i2c master and slave.
> 
> There is already i2c-aspeed.c in the kernel. Can you elaborate what's wrong
> with the extending existing driver? (It seems to me that so called "legacy"
> mode is exactly what is being serviced by that driver.)

Okay, it seems the answer is in cover letter.

-- 
With Best Regards,
Andy Shevchenko


