Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704DB2F9CE5
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 11:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389871AbhARK3r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 05:29:47 -0500
Received: from mga11.intel.com ([192.55.52.93]:37363 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389166AbhARJol (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 04:44:41 -0500
IronPort-SDR: xTvm9obDFb7MjVvx1Vw1Pa/o6VDM3jCGJ2E0X70NPBDCmtGip+2CQijf2v7FpGhAufl55RBPwy
 nr/c4GQvk4tA==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="175277848"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="175277848"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 01:42:44 -0800
IronPort-SDR: jVDVyL+1vvMd8SeoDIk51ZW3B/D398sltO/FBsgtKmWHqEkAoylU+dzZXhi5dStzYMWxc82stw
 KjMgNYFEFsag==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="355127834"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 01:42:40 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 7A48A208D7; Mon, 18 Jan 2021 11:42:38 +0200 (EET)
Date:   Mon, 18 Jan 2021 11:42:38 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 3/7] i2c: i2c-core-base: Use format macro in
 i2c_dev_set_name()
Message-ID: <20210118094238.GW11878@paasikivi.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-4-djrscally@gmail.com>
 <20210118094158.GV11878@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118094158.GV11878@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 11:41:58AM +0200, Sakari Ailus wrote:
> Hi Daniel,
> 
> On Mon, Jan 18, 2021 at 12:34:24AM +0000, Daniel Scally wrote:
> > Some places in the kernel allow users to map resources to a device
> > using device name (for example, gpiod_lookup_table). Currently
> > this involves waiting for the i2c_client to have been registered so we
> > can use dev_name(&client->dev). We want to add a function to allow users
> > to refer to an i2c device by name before it has been instantiated, so
> > create a macro for the format that's accessible outside the i2c layer
> > and use it in i2c_dev_set_name()
> > 
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Daniel Scally <djrscally@gmail.com>
> > ---
> > 	- Used format macro in i2c_dev_set_name() instead of sub func
> > 
> >  drivers/i2c/i2c-core-base.c | 4 ++--
> >  include/linux/i2c.h         | 3 +++
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 63ebf722a424..547b8926cac8 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -811,12 +811,12 @@ static void i2c_dev_set_name(struct i2c_adapter *adap,
> >  	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> >  
> >  	if (info && info->dev_name) {
> > -		dev_set_name(&client->dev, "i2c-%s", info->dev_name);
> > +		dev_set_name(&client->dev, I2C_DEV_NAME_FORMAT, info->dev_name);
> >  		return;
> >  	}
> >  
> >  	if (adev) {
> > -		dev_set_name(&client->dev, "i2c-%s", acpi_dev_name(adev));
> > +		dev_set_name(&client->dev, I2C_DEV_NAME_FORMAT, acpi_dev_name(adev));
> 
> Over 80, please wrap.
> 
> With that,
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Or rather:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> 
> >  		return;
> >  	}
> >  
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index 56622658b215..4d40a4b46810 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -39,6 +39,9 @@ enum i2c_slave_event;
> >  typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
> >  			      enum i2c_slave_event event, u8 *val);
> >  
> > +/* I2C Device Name Format - to maintain consistency outside the i2c layer */
> > +#define I2C_DEV_NAME_FORMAT		"i2c-%s"
> > +
> >  /* I2C Frequency Modes */
> >  #define I2C_MAX_STANDARD_MODE_FREQ	100000
> >  #define I2C_MAX_FAST_MODE_FREQ		400000
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Sakari Ailus

-- 
Sakari Ailus
