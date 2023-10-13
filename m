Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1E57C8E1C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Oct 2023 22:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbjJMUFq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Oct 2023 16:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbjJMUFp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Oct 2023 16:05:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497DCB7;
        Fri, 13 Oct 2023 13:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697227544; x=1728763544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5it+lZKtnoTVXQpnj5JtqmDZwGeKWf9KR13g1UL7qjw=;
  b=keF77/CCV/rnVrm2KhscP506Z7cLsHRpF32Bx9d+P2VbzatSsuplSHwm
   8ti5nl+Pkvx/Y3MyRHd79vq5j1yyBE1CkfhTbnoQfnDO6tkgwsKtNJ2Gr
   D41bvFcWVKSO/HPivYY80hS0paiEWkXl5u4sL9qKGpS3gX+pQxBV1VhWi
   vr3f1GRkuNXMPAtWhhP/Ec3h+5um0pgZrH59vRDwr5RoPMja/SbBrWBzP
   2+Jy48igYMZJiwBWdyTbew6wXmDgGL3xp6rjArR6Pi5Kk15hgQbqx9oiM
   Yia5T5GcUL7/n53fVD9j0lHyzqD/UddmY9AdNYQi7UDhdCuLjbYxLHIG6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="389115490"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="389115490"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 13:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="789976484"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="789976484"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 13:05:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qrOPg-00000005Jz1-2wkn;
        Fri, 13 Oct 2023 23:05:36 +0300
Date:   Fri, 13 Oct 2023 23:05:36 +0300
From:   "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Wu, Wentong" <wentong.wu@intel.com>,
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
Message-ID: <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
 <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 12, 2023 at 01:14:23PM +0200, Hans de Goede wrote:
> On 10/11/23 14:50, Wu, Wentong wrote:
> >> On 10/11/23 12:21, Andy Shevchenko wrote:
> >>> On Mon, Oct 09, 2023 at 02:33:22PM +0800, Wentong Wu wrote:
> >>>> Implements the USB part of Intel USB-I2C/GPIO/SPI adapter device
> >>>> named "La Jolla Cove Adapter" (LJCA).
> >>>>
> >>>> The communication between the various LJCA module drivers and the
> >>>> hardware will be muxed/demuxed by this driver. Three modules ( I2C,
> >>>> GPIO, and SPI) are supported currently.
> >>>>
> >>>> Each sub-module of LJCA device is identified by type field within the
> >>>> LJCA message header.
> >>>>
> >>>> The sub-modules of LJCA can use ljca_transfer() to issue a transfer
> >>>> between host and hardware. And ljca_register_event_cb is exported to
> >>>> LJCA sub-module drivers for hardware event subscription.
> >>>>
> >>>> The minimum code in ASL that covers this board is Scope
> >>>> (\_SB.PCI0.DWC3.RHUB.HS01)
> >>>>     {
> >>>>         Device (GPIO)
> >>>>         {
> >>>>             Name (_ADR, Zero)
> >>>>             Name (_STA, 0x0F)
> >>>>         }
> >>>>
> >>>>         Device (I2C)
> >>>>         {
> >>>>             Name (_ADR, One)
> >>>>             Name (_STA, 0x0F)
> >>>>         }
> >>>>
> >>>>         Device (SPI)
> >>>>         {
> >>>>             Name (_ADR, 0x02)
> >>>>             Name (_STA, 0x0F)
> >>>>         }
> >>>>     }
> >>>
> >>> This commit message is not true anymore, or misleading at bare minimum.
> >>> The ACPI specification is crystal clear about usage _ADR and _HID, i.e.
> >>> they must NOT be used together for the same device node. So, can you
> >>> clarify how the DSDT is organized and update the commit message and it
> >>> may require (quite likely) to redesign the architecture of this
> >>> driver. Sorry I missed this from previous rounds as I was busy by
> >>> something else.
> >>
> >> This part of the commit message unfortunately is not accurate.
> >> _ADR is not used in either DSDTs of shipping hw; nor in the code.
> > 
> > We have covered the _ADR in the code like below, it first try to find the
> > child device based on _ADR, if not found, it will check the _HID, and there
> > is clear comment in the function.
> > 
> > /* bind auxiliary device to acpi device */
> > static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
> > 				   struct auxiliary_device *auxdev,
> > 				   u64 adr, u8 id)
> > {
> > 	struct ljca_match_ids_walk_data wd = { 0 };
> > 	struct acpi_device *parent, *adev;
> > 	struct device *dev = adap->dev;
> > 	char uid[4];
> > 
> > 	parent = ACPI_COMPANION(dev);
> > 	if (!parent)
> > 		return;
> > 
> > 	/*
> > 	 * get auxdev ACPI handle from the ACPI device directly
> > 	 * under the parent that matches _ADR.
> > 	 */
> > 	adev = acpi_find_child_device(parent, adr, false);
> > 	if (adev) {
> > 		ACPI_COMPANION_SET(&auxdev->dev, adev);
> > 		return;
> > 	}
> > 
> > 	/*
> > 	 * _ADR is a grey area in the ACPI specification, some
> > 	 * platforms use _HID to distinguish children devices.
> > 	 */
> > 	switch (adr) {
> > 	case LJCA_GPIO_ACPI_ADR:
> > 		wd.ids = ljca_gpio_hids;
> > 		break;
> > 	case LJCA_I2C1_ACPI_ADR:
> > 	case LJCA_I2C2_ACPI_ADR:
> > 		snprintf(uid, sizeof(uid), "%d", id);
> > 		wd.uid = uid;
> > 		wd.ids = ljca_i2c_hids;
> > 		break;
> > 	case LJCA_SPI1_ACPI_ADR:
> > 	case LJCA_SPI2_ACPI_ADR:
> > 		wd.ids = ljca_spi_hids;
> > 		break;
> > 	default:
> > 		dev_warn(dev, "unsupported _ADR\n");
> > 		return;
> > 	}
> > 
> > 	acpi_dev_for_each_child(parent, ljca_match_device_ids, &wd);
> 
> Ah ok, I see. So the code:
> 
> 1. First tries to find the matching child acpi_device for the auxdev by ADR
> 
> 2. If 1. fails then falls back to HID + UID matching
> 
> And there are DSDTs which use either:
> 
> 1. Only use _ADR to identify which child device is which, like the example
>    DSDT snippet from the commit msg.
> 
> 2. Only use _HID + _UID like the 2 example DSDT snippets from me email
> 
> But there never is a case where both _ADR and _HID are used at
> the same time (which would be an ACPI spec violation as Andy said).
> 
> So AFAICT there is no issue here since  _ADR and _HID are never
> user at the same time and the commit message correctly describes
> scenario 1. from above, so the commit message is fine too.
> 
> So I believe that we can continue with this patch series in
> its current v20 form, which has already been staged for
> going into -next by Greg.
> 
> Andy can you confirm that moving ahead with the current
> version is ok ?

Yes as we have a few weeks to fix corner cases.

What I'm worrying is that opening door for _ADR that seems never used is kinda
an overkill here (resolving non-existing problem). Looking at the design of the
driver I'm not sure why ACPI HIDs are collected somewhere else than in the
respective drivers. And looking at the ID lists themselves I am not sure why
the firmware of the respective hardware platforms are not using _CID.

-- 
With Best Regards,
Andy Shevchenko


