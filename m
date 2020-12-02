Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73FBE2CBC44
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 13:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbgLBMCU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 07:02:20 -0500
Received: from mga14.intel.com ([192.55.52.115]:63533 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726442AbgLBMCU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 07:02:20 -0500
IronPort-SDR: ohqOjj+e91ZBB8GosCstX2wBkULxNj3ux7RYKomnRdAL53NtRAUOQoEySi7s355N/FwbAdj7/F
 IkvU1aGK8LPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="172219749"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="172219749"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 04:00:39 -0800
IronPort-SDR: 1RU+IPtoJ2BDPfekl0ododlyt4YMxcDIILxwElc+mA3UJ+22QjtuQtgfpYtiqiDkL/pDKQ4RfW
 mtpZBBcMWVxQ==
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="361418876"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 04:00:31 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkQpA-00BV8u-K2; Wed, 02 Dec 2020 14:01:32 +0200
Date:   Wed, 2 Dec 2020 14:01:32 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 13/18] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201202120132.GA4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-14-djrscally@gmail.com>
 <20201130170955.GN14465@pendragon.ideasonboard.com>
 <b5cc6bbd-f679-7023-fde0-de2acb65a3c2@gmail.com>
 <20201201223053.GB4569@pendragon.ideasonboard.com>
 <20201202103851.GC852@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202103851.GC852@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 02, 2020 at 12:38:51PM +0200, Sakari Ailus wrote:
> On Wed, Dec 02, 2020 at 12:30:53AM +0200, Laurent Pinchart wrote:
> > On Tue, Dec 01, 2020 at 10:08:25PM +0000, Dan Scally wrote:
> > > On 30/11/2020 17:09, Laurent Pinchart wrote:
> > > > On Mon, Nov 30, 2020 at 01:31:24PM +0000, Daniel Scally wrote:

...

> > > >> +#define CIO2_NUM_PORTS			  4
> > > > 
> > > > There are a few rogue spaces before '4'.
> > > 
> > > Argh, thanks, this is the curse of using VS code on multiple machines...
> > 
> > I recommend vim ;-)
> 
> What is VS code? Very Serious Code?

Visual Studio Code. Something good from MS (no sarcasm, btw).

> I can recommend Emacs; that could help, too.

-- 
With Best Regards,
Andy Shevchenko


