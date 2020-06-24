Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE33320745B
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jun 2020 15:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388126AbgFXNVP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jun 2020 09:21:15 -0400
Received: from mga18.intel.com ([134.134.136.126]:51673 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387687AbgFXNVO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Jun 2020 09:21:14 -0400
IronPort-SDR: phv/UE7Gkz9MSem8h4881+yn5Di4aBsV/zAJUnwnzMyQ1ft0QRdB/YCS+wTQ7viIqLEh8OiRiz
 CFWL+6zfowzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="131894868"
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; 
   d="scan'208";a="131894868"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2020 06:21:14 -0700
IronPort-SDR: G+IkHUKjLawvwudJtxi4G5cY9mI00b4glz6WVDZOyT0uSzNTRKVQacF6LSNEVS6oopoUedUnDe
 vL7qUu298cQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; 
   d="scan'208";a="275686949"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 24 Jun 2020 06:21:12 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jo5I6-00FaSz-R9; Wed, 24 Jun 2020 16:18:14 +0300
Date:   Wed, 24 Jun 2020 16:18:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: designware: platdrv: Set class based on dmi
Message-ID: <20200624131814.GE3703480@smile.fi.intel.com>
References: <20200624091239.802218-1-ribalda@kernel.org>
 <20200624104655.GD3703480@smile.fi.intel.com>
 <CAPybu_1g=RAHca3=UyG2Tk6mo1E56NgCXoo0j=zc9MAa7A7r2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPybu_1g=RAHca3=UyG2Tk6mo1E56NgCXoo0j=zc9MAa7A7r2Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 24, 2020 at 01:31:06PM +0200, Ricardo Ribalda Delgado wrote:
> On Wed, Jun 24, 2020 at 12:46 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, Jun 24, 2020 at 11:12:39AM +0200, Ricardo Ribalda wrote:
> > > Current AMD's zen-based APUs use this core for some of its i2c-buses.
> > >
> > > With this patch we re-enable autodetection of hwmon-alike devices, so
> > > lm-sensors will be able to work automatically.
> > >
> > > It does not affect the boot-time of embedded devices, as the class is
> > > set based on the dmi information.
> >
> > Hmm... Do we really need to have DMI? I mean wouldn't be safe just always
> > provide this to be compatible with HWMON class?
> >
> 
> I do not care :), I was just trying to follow the logic of
> 70fba8302adecfa08a087c6f1dd39537a55f5bd3
> 
> If it is decided otherwise I can change it, no problem ;)

I guess you need to send a kinda revert with a fixes tag.

-- 
With Best Regards,
Andy Shevchenko


