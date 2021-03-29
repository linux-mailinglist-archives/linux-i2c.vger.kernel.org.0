Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E874334D02D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 14:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhC2Mgd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 08:36:33 -0400
Received: from mga06.intel.com ([134.134.136.31]:9856 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231308AbhC2Mg2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 08:36:28 -0400
IronPort-SDR: hi8kNdTvqqa6RIsd/iMWzWWqqzipmnl5XZ/SfIDvFdxWoZR0iVNNMsGRO6I0+DsSKRdw+rKGRM
 9G3sWID7wlOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="252883549"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="252883549"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 05:36:24 -0700
IronPort-SDR: ar9LaWDocC739DTpnXV9AmV0TGJ2lc9QVcD7qUIU5tlyFAKDGE6RCgY6WJpAU5ciJA/rvCxucy
 4f6BLVIp0Ysg==
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="411059216"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 05:36:22 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lQr7z-00H11y-Kd; Mon, 29 Mar 2021 15:36:19 +0300
Date:   Mon, 29 Mar 2021 15:36:19 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Goswami, Sanket" <Sanket.Goswami@amd.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Subject: Re: [PATCH] i2c: add i2c bus driver for amd navi gpu
Message-ID: <YGHJwxBl8igqY6VR@smile.fi.intel.com>
References: <20210309133147.1042775-1-Sanket.Goswami@amd.com>
 <YEeFgZSIY5lb2ubP@smile.fi.intel.com>
 <fa1a59fb-a7fa-44bb-1629-5e726f164b94@amd.com>
 <YFzC19IiGZdmLCOR@smile.fi.intel.com>
 <617d0164-1290-250f-ae34-828c6b4b390a@amd.com>
 <YF26F8IFmbo80rMq@smile.fi.intel.com>
 <0ec22c6a-ec19-774d-bcc7-04a7f69c841c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ec22c6a-ec19-774d-bcc7-04a7f69c841c@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 29, 2021 at 11:25:58AM +0530, Goswami, Sanket wrote:
> On 26-Mar-21 16:10, Andy Shevchenko wrote:
> > On Fri, Mar 26, 2021 at 03:53:34PM +0530, Goswami, Sanket wrote:
> >> On 25-Mar-21 22:35, Andy Shevchenko wrote:
> >>> On Mon, Mar 22, 2021 at 10:26:55PM +0530, Goswami, Sanket wrote:
> >>>> On 09-Mar-21 19:56, Andy Shevchenko wrote:
> >>>>> On Tue, Mar 09, 2021 at 07:01:47PM +0530, Sanket Goswami wrote:

...

> >>> And I think I already have told you that I prefer to see rather MODEL_ quirk.
> >>
> >> I did not find MODEL_ quirk reference in the PCI device tree, It is actually
> >> used in platform device tree which is completely different from our PCI
> >> based configuration, can you please provide some reference of MODEL_ quirk
> >> which will be part of the PCI device tree?
> > 
> > I meant the name of new definition for quirk.
> 
> Can you please elaborate this? i am not able to comprehend.

Define in the i2c-designware-core.h something like
#define MODEL_AMD_BLA_BLA_BLA   BIT(FOO)


-- 
With Best Regards,
Andy Shevchenko


