Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB77D69F9E2
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Feb 2023 18:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbjBVRVg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Feb 2023 12:21:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbjBVRVf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Feb 2023 12:21:35 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7DCB392A1;
        Wed, 22 Feb 2023 09:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677086494; x=1708622494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6S41OIRfgmiuDJ4i/nPxkW9fVgv7jxlVLFt0pVMWJSA=;
  b=YK4GZwU4XCA9PyvwXT6wPgwz3GwI0+O1/JjObKa9YBA6U1cBtSJjgPQF
   YJJ6kh9557Vc1mlE6qQvG0RWm+wTArCcUDlqAk0SZ123XK4g+wMhDI17X
   saDYudt2M2KdqAtsnNrl6KgmpSoi1FNWdNHpw+ZUiSGF6P8wOZg1rh8iv
   81wFvJ/xHBXWFiNuqAh5MomC5OfwU2yu6EPJlND+uyx7DJKLZzdDKVKvy
   NH/rHK8zEMts//kgLyamg6Kd2sbpqBRZqcVzYJ5aXuQ9k6U59Mk5Saro5
   ZRuT8pSwFxAYDMNCKqw3KV4IufgLGN9LFEevQSMYUJog68MC7rJLFS0QR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="332987860"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="332987860"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 09:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="672150232"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="672150232"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 22 Feb 2023 09:20:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pUsmm-00AWyb-1C;
        Wed, 22 Feb 2023 19:20:08 +0200
Date:   Wed, 22 Feb 2023 19:20:08 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/3] auxdisplay: ht16k33: Make use of
 device_get_match_data()
Message-ID: <Y/ZOyGo8X7r258EC@smile.fi.intel.com>
References: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
 <20230221133307.20287-3-andriy.shevchenko@linux.intel.com>
 <Y/TJs+Arban0ats8@smile.fi.intel.com>
 <be203dfd290e67c8ce74d11c5c9478a4@protonic.nl>
 <Y/UD3HWNy8uKYShC@smile.fi.intel.com>
 <0235f0fed989a8b027db720663699f5d@protonic.nl>
 <Y/ZKdN4nuHcL4DgE@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/ZKdN4nuHcL4DgE@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+ Cc: OF bindings people for the mess with the IDs.

On Wed, Feb 22, 2023 at 07:01:40PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 22, 2023 at 05:46:00PM +0100, Robin van der Gracht wrote:
> > On 2023-02-21 18:48, Andy Shevchenko wrote:
> > > On Tue, Feb 21, 2023 at 05:10:00PM +0100, Robin van der Gracht wrote:
> > > > On 2023-02-21 14:40, Andy Shevchenko wrote:
> > > > > On Tue, Feb 21, 2023 at 03:33:06PM +0200, Andy Shevchenko wrote:

...

> > > > > > -	id = i2c_of_match_device(dev->driver->of_match_table, client);
> > > > > > -	if (id)
> > > > > > -		priv->type = (uintptr_t)id->data;
> > > > > > +	priv->type = (uintptr_t)device_get_match_data(dev);
> > > > >
> > > > > Looking closer the I²C ID table should provide DISP_MATRIX to keep
> > > > > default and
> 
> > > > > this needs to be not dropped.
> 
> ^^^^^ (1)
> 
> > > > > So, the question is what to do with unknown type then, return -EINVAL
> > > > > from probe()?
> > > > 
> > > > If you leave out your addition of the DISP_UNKNOWN type, the default
> > > > type
> > > > will be DISP_MATRIX if no match is found, which is as it is now.
> > > > 
> > > > In that case the following change should suffice:
> > > > 
> > > > @@ -713,7 +715,6 @@ static int ht16k33_seg_probe(struct device *dev,
> > > > struct
> > > > ht16k33_priv *priv,
> > > >  static int ht16k33_probe(struct i2c_client *client)
> > > >  {
> > > >      struct device *dev = &client->dev;
> > > > -    const struct of_device_id *id;
> > > >      struct ht16k33_priv *priv;
> > > >      uint32_t dft_brightness;
> > > >      int err;
> > > > @@ -728,9 +729,8 @@ static int ht16k33_probe(struct i2c_client
> > > > *client)
> > > >          return -ENOMEM;
> > > > 
> > > >      priv->client = client;
> > > > -    id = i2c_of_match_device(dev->driver->of_match_table, client);
> > > > -    if (id)
> > > > -        priv->type = (uintptr_t)id->data;
> > > > +    priv->type = (uintptr_t)device_get_match_data(dev);
> > > > +
> > > >      i2c_set_clientdata(client, priv);
> > > > 
> > > >      err = ht16k33_initialize(priv);
> > > > 
> > > > Or do you think falling back to DISP_MATRIX if no match is found is
> > > > wrong?
> > > 
> > > First of all, the I²C ID table should actually use DISP_MATRIX.
> > > 
> > > Second, there are two points:
> > > 
> > > - It would be nice to check if the OF ID table doesn't provide a setting
> > >   (shouldn't we try I²C ID table and then, if still nothing, bail out?)
> > > 
> > > - The I²C ID table can be extended in the future with another entry
> > > which
> > >   may want to have different default
> > 
> > For my understanding, please correct me if I'm wrong;
> > 
> > For all methods of instantiation during ht16k33 probe, i2c_of_match_device()
> > matches the compatible strings in the OF ID table due to a call to
> > i2c_of_match_device_sysfs().
> > 
> > device_get_match_data() only matches the compatible strings in the OF ID
> > table for devicetree instantiation because of_match_device() won't match
> > is there is no actual of_node.
> 
> That's half-true. On ACPI based platforms we may have no of_node and match
> against OF ID table.
> 
> > So with only device_get_match_data() and a non devicetree instantiation,
> > priv->type will always be (uintptr_t)NULL = 0 = DISP_MATRIX.
> 
> Yes.
> 
> > Which effectively breaks i.e. user-space instantiation for other display
> > types which now do work due to i2c_of_match_device().
> > (so my suggestion above is not sufficient).
> > 
> > Are you proposing extending and searching the I2C ID table to work around
> > that?
> 
> See (1) above. This is the downside I have noticed after sending this series.
> So, the I²C ID table match has to be restored, but the above mentioned issues
> with existing table are not gone, hence they need to be addressed in the next
> version.

I see now what you mean. So, we have even more issues in this driver:
- I²C table is not in sync with all devices supported
- the OF ID table seems has something really badly formed for adafruit
  (just a number after a comma)

The latter shows how broken it is. The I²C ID table mechanism is used as
a backward compatibility to the OF. Unfortunately, user space may not provide
the data except in form of DT overlays, so for the legacy enumeration we
have only device name, which is a set of 4 digits for adafruit case.

Now imagine if by some reason we will get adafruit2 (you name it) with
the same schema. How I²C framework can understand that you meant adafruit
and not adafruit2? Or did I miss something?

-- 
With Best Regards,
Andy Shevchenko


