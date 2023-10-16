Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB8777CA0D8
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 09:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbjJPHjy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Oct 2023 03:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbjJPHiw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 03:38:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE30B4;
        Mon, 16 Oct 2023 00:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697441930; x=1728977930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OjiDPKU/1kFB84uYY7sa1KWVsWQGpsIwF7hcDhhKQGs=;
  b=V6LCn+3QjXHVsbM4DupR3Yltv5pW4Ad8Pz7f3ewNXcVhn+mfD9UQ0qql
   9AwaGuDwHIY6wDRukjZPdvLo8FCHdB1ap7lLrIwzqzvoSNbYk0tvq1aHj
   /VHnDC5LxiTwa39ekHppnQ1gi0cESQnjSuPKDSZXpoRV3EoumC0ZLaHzg
   zZElDyYTKQd3/09TSZyqV8X61dGOpU8qyXrmvRV31mxEJHjStzc7bn2BY
   dx50t+kXylkgb/i5dudMZjO4PltV8hFH1YxGlk7AxCSJ4hhTHsNMzzQKu
   K6WPpCS5O/VK4fTTTJHji3HsP+EXXzddWPSXKbCn1e7fuyqDEpJU1f24X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389325764"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="389325764"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 00:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="784999645"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="784999645"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 00:38:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qsIBV-00000005x14-004W;
        Mon, 16 Oct 2023 10:38:41 +0300
Date:   Mon, 16 Oct 2023 10:38:40 +0300
From:   "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
Message-ID: <ZSzogNhlX9njvOIU@smile.fi.intel.com>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
 <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
 <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
 <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 16, 2023 at 08:52:28AM +0300, Wu, Wentong wrote:
> > On 10/13/23 22:05, Shevchenko, Andriy wrote:
> > > On Thu, Oct 12, 2023 at 01:14:23PM +0200, Hans de Goede wrote:

<snip>

> > >> Ah ok, I see. So the code:
> > >>
> > >> 1. First tries to find the matching child acpi_device for the auxdev
> > >> by ADR
> > >>
> > >> 2. If 1. fails then falls back to HID + UID matching
> > >>
> > >> And there are DSDTs which use either:
> > >>
> > >> 1. Only use _ADR to identify which child device is which, like the example
> > >>    DSDT snippet from the commit msg.
> > >>
> > >> 2. Only use _HID + _UID like the 2 example DSDT snippets from me
> > >> email
> > >>
> > >> But there never is a case where both _ADR and _HID are used at the
> > >> same time (which would be an ACPI spec violation as Andy said).
> > >>
> > >> So AFAICT there is no issue here since  _ADR and _HID are never user
> > >> at the same time and the commit message correctly describes scenario
> > >> 1. from above, so the commit message is fine too.
> > >>
> > >> So I believe that we can continue with this patch series in its
> > >> current v20 form, which has already been staged for going into -next
> > >> by Greg.
> > >>
> > >> Andy can you confirm that moving ahead with the current version is ok
> > >> ?
> > >
> > > Yes as we have a few weeks to fix corner cases.
> > >
> > > What I'm worrying is that opening door for _ADR that seems never used
> > > is kinda an overkill here (resolving non-existing problem).
> > 
> > I assume that there actually some DSDTs using the _ADR approach and that this
> > support is not there just for fun.
> 
> right, it's not for fun, we use _ADR here is to reduce the maintain effort because
> currently it defines _HID for every new platform and the drivers have to be updated
> accordingly, while _ADR doesn't have that problem.

But this does not confirm if you have such devices. Moreover, My question about
_CID per function stays the same. Why firmware is not using it? In that case
you need only one ID per function in the driver (it might require some IDs in
the _HID, I don't remember that part of the spec by heart, i.e.  if _CID can be
only provided with existing _HID or not).

> > Wentong, can you confirm that the _ADR using codepaths are actually used on
> > some hardware / with some DSDTs out there ?
> 
> what I can share is that we will see.
> 
> > > Looking at the design of the
> > > driver I'm not sure why ACPI HIDs are collected somewhere else than in
> > > the respective drivers.
> 
> AFAIK, auxiliary bus doesn't support parsing fwnodes currently. Probably we can 
> support it for auxiliary bus in another patch. 

This is good idea!


> > > And looking at the ID lists themselves I am
> > > not sure why the firmware of the respective hardware platforms are not using
> > _CID.
> 
> I think firmware can select _CID as well, but the shipped hw doesn't use _CID,
> the driver has to make sure the shipped hw working as well. And switching to _CID
> for the shipped hw is not easy, and it has to change windows driver as well.

I understand, but at least you may stop growing list in the driver. And actually
using separate IDs for multifunctional device seems not ideal solution to me.

> > This is a USB device which has 4 functions:

Yes, I understand this part, but thank you for elaboration about auxbus, which
seems lack of needed support. And I would really like to see someone adds it there.

> > 1. GPIO controller
> > 2. I2C controller 1
> > 3. I2C controller 2
> > 4. SPI controller
> > 
> > The driver for the main USB interface uses the new auxbus to create 4 child
> > devices. The _ADR or if that fails _HID + _UID matching is done to find the
> > correct acpi_device child of the acpi_device which is the ACPI-companion of the
> > main USB device.
> > 
> > After looking up the correct acpi_device child this is then set as the fwnode /
> > ACPI-companion of the auxbus device created for that function.
> > 
> > Having the correct fwnode is important because other parts of the DSDT
> > reference this fwnode to specify GPIO / I2C / SPI resources and if the fwnode of
> > the aux-device is not set correctly then the resources for other devices
> > referencing it (typically a camera
> > sensor) can not be found.
> > 
> > As for why the driver for the auxbus devices / children do not use HID matching,
> > AFAIK the auxbus has no support for using ACPI (or DT) matching for aux-devices
> > and these drivers need to be auxiliary_driver's and bind to the auxbus device and
> > not to a platform_device instantiated for the acpi_device since they need the
> > auxbus device to access the USB device.
> 
> Yes, total agree. Thanks

-- 
With Best Regards,
Andy Shevchenko


