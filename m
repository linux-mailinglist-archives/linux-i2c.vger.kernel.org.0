Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7D4278EF8D
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 16:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbjHaO0P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 10:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjHaO0P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 10:26:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB562A3;
        Thu, 31 Aug 2023 07:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693491971; x=1725027971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7paPh2mF9Wy7OEwJY1d2GalGy2y7dQanY+hUyqVQRaU=;
  b=Y0D3U3kLlFmMGiM54D053w7T1ecUFVORDPL5WeK9AyStCG15zgnG0fNB
   zmBb8rnE5IiApn6cbxoU879KGzH89//1M9oWwL15ktMlv4btbXLT+pUl9
   tqWkwX9pYv/qElFEmipI9F0o1TX7ikeJ6R4gNe8unHexmCJeTJ/ZzAqIO
   KiAz/2A/oCL59+Su5PNWhVMfrFK8eO5Q1gYEg0w4LK5rnWQh+QKKx/Ny8
   yQKL7jwBnOo6yeBcCZlYfD217uw+jAd3Nl/0ZYcM6wp5XUgn58eHRv1WF
   XtDJy7VYEiwOHAczxY2qWN+RYouqHKz6CKrn19GiZc6bp2hQYH4oS9K0u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="360978690"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="360978690"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689370098"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="689370098"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:18:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qbiV9-005PI8-0Q;
        Thu, 31 Aug 2023 17:18:27 +0300
Date:   Thu, 31 Aug 2023 17:18:26 +0300
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
Message-ID: <ZPChMrsKrOQppY1F@smile.fi.intel.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <ZLENe5B3gi/oNTQp@smile.fi.intel.com>
 <SEZPR06MB5269A43F801EF04F39461174F2E5A@SEZPR06MB5269.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR06MB5269A43F801EF04F39461174F2E5A@SEZPR06MB5269.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 31, 2023 at 06:04:30AM +0000, Ryan Chen wrote:
> > On Fri, Jul 14, 2023 at 03:45:22PM +0800, Ryan Chen wrote:

Stop overquoting! Remove the context you are not answering to.

...

> > > +				if (--i % 4 != 3)
> > > +					writel(*(u32 *)wbuf, i2c_bus->buf_base + i - (i % 4));
> > > +				writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
> > > +				       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> > 
> > Wrong memory accessors. You should use something from asm/byteorder.h
> > which includes linux/byteorder/generic.h.
> > 
> 
> Are you preferring add comment to explain more by following?
> 				/*
> 				 * The controller's buffer register supports dword writes only.
> 				 * Therefore, write dwords to the buffer register in a 4-byte aligned,
> 				 * and write the remaining unaligned data at the end.
> 				 */

This does not explain endianess bug (or feature) it has.
You are using CPU side byteorder for the aligned data.
This is not okay, on top of the code looking ugly and
prone to errors. Note, that somebody may refer to your
code, once accepted, in educational purposes, but since
the code is not good written, it makes a false positive
impression that this is the right thing to do in the similar
case elsewhere.

Please, fix this.

> 				for (i = 0; i < xfer_len; i++) {
> 					wbuf[i % 4] = msg->buf[i2c_bus->master_xfer_cnt + i];
> 					/* accumulating 4 bytes of data, write as a Dword to the buffer register */
> 					if (i % 4 == 3)
> 						writel(*(u32 *)wbuf, i2c_bus->buf_base + i - 3);
> 				}
> 				/* less than 4 bytes of remaining data, write the remaining part as a Dword */
> 				if (--i % 4 != 3)
> 					writel(*(u32 *)wbuf, i2c_bus->buf_base + i - (i % 4));
> 				writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
> 				       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> 
> Or more columns (use get_unaligned_le32(wbuf); ) by following.
> 
> 	for (i = 0; i < xfer_len; i++) {
> 		wbuf[i % 4] = msg->buf[i2c_bus->master_xfer_cnt + i];
> 		if (i % 4 == 3) {
> 			wbuf_dword = get_unaligned_le32(wbuf);
> 			writel(wbuf_dword, i2c_bus->buf_base + i - 3);
> 		}
> 	}
> 
> 	if (--i % 4 != 3) {
> 		wbuf_dword = get_unaligned_le32(wbuf);
> 		writel(wbuf_dword, i2c_bus->buf_base + i - (i % 4));
> 	}

-- 
With Best Regards,
Andy Shevchenko


