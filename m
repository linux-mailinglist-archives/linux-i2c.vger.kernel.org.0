Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D832CC226
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 17:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728632AbgLBQYJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 11:24:09 -0500
Received: from mga06.intel.com ([134.134.136.31]:38098 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727069AbgLBQYJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 11:24:09 -0500
IronPort-SDR: XJARCIUs7gMuQFxPdHw4480eeSIYFfL2JkTtFlc/011HLcU+90O7eKZ0k2EhoZMRarQWpspFR2
 SEW34unLSKuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="234648163"
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="234648163"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 08:22:22 -0800
IronPort-SDR: pi/94M+T2D1CmNCCOtBUodBA35PlXWozmw0PtA9qbd0yPuQOYcBaqkFZuLAb+9tkzsNB3wUXuK
 Sl1RBES4jgKg==
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="550119907"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 08:22:20 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkUuY-00BYFa-Ek; Wed, 02 Dec 2020 18:23:22 +0200
Date:   Wed, 2 Dec 2020 18:23:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>
Subject: Re: [PATCH v1] i2c: ismt: Adding support for
 I2C_SMBUS_BLOCK_PROC_CALL
Message-ID: <20201202162322.GJ4077@smile.fi.intel.com>
References: <20201116153245.24083-1-andriy.shevchenko@linux.intel.com>
 <20201202154501.GB13425@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202154501.GB13425@kunai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 02, 2020 at 04:45:01PM +0100, Wolfram Sang wrote:
> On Mon, Nov 16, 2020 at 05:32:45PM +0200, Andy Shevchenko wrote:
> > From: Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>
> > 
> > Expand the driver to support I2C_SMBUS_BLOCK_PROC_CALL since
> > HW supports it already.
> > 
> > Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I removed that. Andy's SoB should do.

It's against documentation, please return it back as a must by documentation [1].

> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>
> 
> Applied to for-next, thanks!

Thanks, but see above.

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

"..., every Co-developed-by: must be immediately followed by a Signed-off-by: of the associated co-author."

-- 
With Best Regards,
Andy Shevchenko


