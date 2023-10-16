Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69C447CB015
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 18:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbjJPQop (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Oct 2023 12:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343939AbjJPQoW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 12:44:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B82987D91;
        Mon, 16 Oct 2023 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697474105; x=1729010105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XHgG6AwTXSuXo/oRlKIUbP9Fwdm8hlGaOqwUtMzxG9Q=;
  b=TGUwP/giY1PoHbxk5Bj7Yyne8ae41HJKPbw/7C1ilF2o/y9QsfJI+oQh
   3Ola4RwzF8mD/wa4sWx4bTHCtuekTiIh+Gy5tL08HAvsoxOPN7rGW8HJ7
   lFgmT3PK4OivcAwxMPi9aWC/RWPyMoVFAchCMqk6PyBGHOaduLFkRNK+w
   C/kUb/WFXEoAikvIYkqnQgpZ0ktKLSfqK5ZAupNi21YpnJGDJDWV6attv
   Jt6rzc+Exc38607fnAOMeBl8MJgOkzTaZJRkuxEFH9R7UVAf7j31Ybch+
   gVLhW1eVKNcy4mSiFZKu/9q1YHpg3w2SJ0ebUzAwOCJqzJ1+vdDGff742
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449786465"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="449786465"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 09:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="759461692"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="759461692"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 09:34:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qsQ5w-000000062PB-24R4;
        Mon, 16 Oct 2023 19:05:28 +0300
Date:   Mon, 16 Oct 2023 19:05:28 +0300
From:   "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
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
Message-ID: <ZS1fSPhfREVlELLD@smile.fi.intel.com>
References: <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
 <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
 <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZSzogNhlX9njvOIU@smile.fi.intel.com>
 <DM6PR11MB4316382324D15985A70E531C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <2023101653-shiftless-scorebook-19e3@gregkh>
 <DM6PR11MB4316711C71937AE3C0516C7B8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4316711C71937AE3C0516C7B8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
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

On Mon, Oct 16, 2023 at 06:44:21PM +0300, Wu, Wentong wrote:
> > From: gregkh@linuxfoundation.org
> > On Mon, Oct 16, 2023 at 03:05:09PM +0000, Wu, Wentong wrote:
> > > > From: Shevchenko, Andriy
> > > > On Mon, Oct 16, 2023 at 08:52:28AM +0300, Wu, Wentong wrote:

...

> > > > But this does not confirm if you have such devices. Moreover, My
> > > > question about _CID per function stays the same. Why firmware is not using
> > it?
> > >
> > > Yes, both _ADR and _CID can stop growing list in the driver. And for
> > > _ADR, it also only require one ID per function. I don't know why BIOS
> > > team doesn't select _CID, but I have suggested use _ADR internally,
> > > and , to make things moving forward, the driver adds support for _ADR here
> > first.
> > >
> > > But you're right, _CID is another solution as well, we will discuss it
> > > with firmware team more.
> > 
> > Should I revert this series now until this gets sorted out?
> 
> Current _ADR support is a solution, I don't think _CID is better than _ADR to both
> stop growing list in driver and support the shipped hardware at the same time.
> 
> Andy, what's your idea? 

In my opinion if _CID can be made, it's better than _ADR. As using _ADR like
you do is a bit of grey area in the ACPI specification. I.o.w. can you get
a confirmation, let's say, from Microsoft, that they will go your way for other
similar devices?

Btw, Microsoft has their own solution actually using _ADR for the so called
"wired" USB devices. Is it your case? If so, I'm not sure why _HID has been
used from day 1...

Also I suggest to wait for Hans' opinion on the topic.

-- 
With Best Regards,
Andy Shevchenko


