Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337162CB905
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 10:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388063AbgLBJgn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 04:36:43 -0500
Received: from mga14.intel.com ([192.55.52.115]:52055 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387860AbgLBJgn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 04:36:43 -0500
IronPort-SDR: RX2kKdM+wks8X9cGkkR3ycBdTwe6imPRq8zOcFf4n5a/CB7V8Jsz6L7Xo5mS3pXesfiW55zaq6
 vJSIVzjpk2bQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="172203324"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="172203324"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 01:35:02 -0800
IronPort-SDR: TRuLP0MuNUbMhEctpQsl7zL+Q9R+HZjxBcLneteL7+Tg0bHZEotzS7cGKuTxOppL/5QnAWVkvS
 Ngz2HIAjm9Cw==
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="345807126"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 01:34:53 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkOYE-00BTjl-7U; Wed, 02 Dec 2020 11:35:54 +0200
Date:   Wed, 2 Dec 2020 11:35:54 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 16/18] i2c: i2c-core-base: Use the new
 i2c_acpi_dev_name() in i2c_set_dev_name()
Message-ID: <20201202093554.GT4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-17-djrscally@gmail.com>
 <20201130171241.GP14465@pendragon.ideasonboard.com>
 <20201130191856.GX4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130191856.GX4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dan, does this mail among other my replies reach you?
It seems you answered to Laurent's mails and leaving mine ignored. Just
wondering if our servers have an issue again...

On Mon, Nov 30, 2020 at 09:18:56PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 30, 2020 at 07:12:41PM +0200, Laurent Pinchart wrote:
> > On Mon, Nov 30, 2020 at 01:31:27PM +0000, Daniel Scally wrote:
> > > From: Dan Scally <djrscally@gmail.com>
> > > 
> > > To make sure the new i2c_acpi_dev_name() always reflects the name of i2c
> > > devices sourced from ACPI, use it in i2c_set_dev_name().
> > > 
> > > Signed-off-by: Dan Scally <djrscally@gmail.com>
> > 
> > I'd squash this with 15/18, which would make it clear there's a memory
> > leak :-)
> 
> ...
> 
> > >  	if (adev) {
> > > -		dev_set_name(&client->dev, "i2c-%s", acpi_dev_name(adev));
> > > +		dev_set_name(&client->dev, i2c_acpi_dev_name(adev));
> > >  		return;
> 
> But you split pattern used in i2c_dev_set_name().
> What you need is to provide something like this
> 
> #define I2C_DEV_NAME_FORMAT	"i2c-%s"
> 
> const char *i2c_acpi_get_dev_name(...)
> {
> 	return kasprintf(..., I2C_DEV_NAME_FORMAT, ...);
> }
> 
> (Possible in the future if anybody needs
>   const char *i2c_dev_get_name_by_bus_and_addr(int bus, unsigned short addr)
> )
> 
> And here
> 
> -		dev_set_name(&client->dev, "i2c-%s", info->dev_name);
> +		dev_set_name(&client->dev, I2C_DEV_NAME_FORMAT, info->dev_name);
> 
> -		dev_set_name(&client->dev, "i2c-%s", acpi_dev_name(adev));
> +		dev_set_name(&client->dev, I2C_DEV_NAME_FORMAT, acpi_dev_name(adev));
> 
> -- 
> With Best Regards,
> Andy Shevchenko;
> 
> 

-- 
With Best Regards,
Andy Shevchenko


