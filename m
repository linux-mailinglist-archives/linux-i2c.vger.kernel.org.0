Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A22A69F974
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Feb 2023 18:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbjBVRCU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Feb 2023 12:02:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjBVRCT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Feb 2023 12:02:19 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF3AE38B6A;
        Wed, 22 Feb 2023 09:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677085338; x=1708621338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=H6sgHyH1BF+t+Pph+yN1fdkk4hRr7/Fbwj3Oh7bSCsQ=;
  b=ZKWzvipQtPSaWTVBHFPywhgiqdVkQOlV/7lqitrtOqnODR0OF2ZxlO26
   COmIXYo3vK0/5jPhSg4jbDL9xFA0WO75INsPpIsjDwlqLADdsjjjPeCS4
   Q0iveBiSWk+59WjiRNmqU5R2034e1cIJNEbpf4GTnTZ3FrSJq8Y3YL73y
   dRNTeeeUx5tzKDreiej1M4EdN1C20TPtwqh4+ONmOr9XqTFaLbue4ns3m
   epsZSnp7dsfDpqTlML/rGu6zFvsF3+DxpME9fesslQuCLX8EKUuc1AMJF
   pliSt2AsklH6OITMxCzg+9jRctajYtUkit34RNZEnUc06SeXVqja1XY1U
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="397665251"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="397665251"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 09:01:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="649634418"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="649634418"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 22 Feb 2023 09:01:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pUsUu-00AWZN-1Y;
        Wed, 22 Feb 2023 19:01:40 +0200
Date:   Wed, 22 Feb 2023 19:01:40 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Robin van der Gracht <robin@protonic.nl>
Cc:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 2/3] auxdisplay: ht16k33: Make use of
 device_get_match_data()
Message-ID: <Y/ZKdN4nuHcL4DgE@smile.fi.intel.com>
References: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
 <20230221133307.20287-3-andriy.shevchenko@linux.intel.com>
 <Y/TJs+Arban0ats8@smile.fi.intel.com>
 <be203dfd290e67c8ce74d11c5c9478a4@protonic.nl>
 <Y/UD3HWNy8uKYShC@smile.fi.intel.com>
 <0235f0fed989a8b027db720663699f5d@protonic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0235f0fed989a8b027db720663699f5d@protonic.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 22, 2023 at 05:46:00PM +0100, Robin van der Gracht wrote:
> On 2023-02-21 18:48, Andy Shevchenko wrote:
> > On Tue, Feb 21, 2023 at 05:10:00PM +0100, Robin van der Gracht wrote:
> > > On 2023-02-21 14:40, Andy Shevchenko wrote:
> > > > On Tue, Feb 21, 2023 at 03:33:06PM +0200, Andy Shevchenko wrote:

...

> > > > > -	id = i2c_of_match_device(dev->driver->of_match_table, client);
> > > > > -	if (id)
> > > > > -		priv->type = (uintptr_t)id->data;
> > > > > +	priv->type = (uintptr_t)device_get_match_data(dev);
> > > >
> > > > Looking closer the I²C ID table should provide DISP_MATRIX to keep
> > > > default and

> > > > this needs to be not dropped.

^^^^^ (1)

> > > > So, the question is what to do with unknown type then, return -EINVAL
> > > > from probe()?
> > > 
> > > If you leave out your addition of the DISP_UNKNOWN type, the default
> > > type
> > > will be DISP_MATRIX if no match is found, which is as it is now.
> > > 
> > > In that case the following change should suffice:
> > > 
> > > @@ -713,7 +715,6 @@ static int ht16k33_seg_probe(struct device *dev,
> > > struct
> > > ht16k33_priv *priv,
> > >  static int ht16k33_probe(struct i2c_client *client)
> > >  {
> > >      struct device *dev = &client->dev;
> > > -    const struct of_device_id *id;
> > >      struct ht16k33_priv *priv;
> > >      uint32_t dft_brightness;
> > >      int err;
> > > @@ -728,9 +729,8 @@ static int ht16k33_probe(struct i2c_client
> > > *client)
> > >          return -ENOMEM;
> > > 
> > >      priv->client = client;
> > > -    id = i2c_of_match_device(dev->driver->of_match_table, client);
> > > -    if (id)
> > > -        priv->type = (uintptr_t)id->data;
> > > +    priv->type = (uintptr_t)device_get_match_data(dev);
> > > +
> > >      i2c_set_clientdata(client, priv);
> > > 
> > >      err = ht16k33_initialize(priv);
> > > 
> > > Or do you think falling back to DISP_MATRIX if no match is found is
> > > wrong?
> > 
> > First of all, the I²C ID table should actually use DISP_MATRIX.
> > 
> > Second, there are two points:
> > 
> > - It would be nice to check if the OF ID table doesn't provide a setting
> >   (shouldn't we try I²C ID table and then, if still nothing, bail out?)
> > 
> > - The I²C ID table can be extended in the future with another entry
> > which
> >   may want to have different default
> 
> For my understanding, please correct me if I'm wrong;
> 
> For all methods of instantiation during ht16k33 probe, i2c_of_match_device()
> matches the compatible strings in the OF ID table due to a call to
> i2c_of_match_device_sysfs().
> 
> device_get_match_data() only matches the compatible strings in the OF ID
> table for devicetree instantiation because of_match_device() won't match
> is there is no actual of_node.

That's half-true. On ACPI based platforms we may have no of_node and match
against OF ID table.

> So with only device_get_match_data() and a non devicetree instantiation,
> priv->type will always be (uintptr_t)NULL = 0 = DISP_MATRIX.

Yes.

> Which effectively breaks i.e. user-space instantiation for other display
> types which now do work due to i2c_of_match_device().
> (so my suggestion above is not sufficient).
> 
> Are you proposing extending and searching the I2C ID table to work around
> that?

See (1) above. This is the downside I have noticed after sending this series.
So, the I²C ID table match has to be restored, but the above mentioned issues
with existing table are not gone, hence they need to be addressed in the next
version.

-- 
With Best Regards,
Andy Shevchenko


