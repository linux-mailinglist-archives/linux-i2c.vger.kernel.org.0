Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D10253167
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 16:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbgHZOfp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 10:35:45 -0400
Received: from mga03.intel.com ([134.134.136.65]:46979 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728073AbgHZOe5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 10:34:57 -0400
IronPort-SDR: 1ywbDJurWODDgZCJzSTnl43wQf42GDNfyQuHPjkAN0ou7tUDkS8w53p57eTzC5/NGC42cWrw9m
 axNc8JhQQp3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="156286876"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="156286876"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 07:34:54 -0700
IronPort-SDR: AetVBk4ux2dukFFbj0nUEH9hh1LT0seBw931B9YtzzJi09W43bgqJEo2/XUTv8b4ZNBxkDjZ+G
 SeYo4Vv/eKrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="329244972"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 26 Aug 2020 07:34:52 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kAwVm-00BaSQ-CO; Wed, 26 Aug 2020 17:34:50 +0300
Date:   Wed, 26 Aug 2020 17:34:50 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: consider devices with of_match_table during i2c
 device probing
Message-ID: <20200826143450.GQ1891694@smile.fi.intel.com>
References: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
 <20200826050851.GA1081@ninjato>
 <20200826052544.GA500@jagdpanzerIV.localdomain>
 <20200826095356.GG1891694@smile.fi.intel.com>
 <20200826095617.GH1891694@smile.fi.intel.com>
 <20200826102411.GC8849@jagdpanzerIV.localdomain>
 <20200826103807.GD8849@jagdpanzerIV.localdomain>
 <20200826105426.GJ1891694@smile.fi.intel.com>
 <20200826112326.GC1081@ninjato>
 <20200826141810.GE8849@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826141810.GE8849@jagdpanzerIV.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 26, 2020 at 11:18:10PM +0900, Sergey Senozhatsky wrote:
> On (20/08/26 13:23), Wolfram Sang wrote:
> > On Wed, Aug 26, 2020 at 01:54:26PM +0300, Andy Shevchenko wrote:
> > > On Wed, Aug 26, 2020 at 07:38:07PM +0900, Sergey Senozhatsky wrote:
> > > > On (20/08/26 19:24), Sergey Senozhatsky wrote:
> > > > > > But then the question is why we have this code in the ->probe() at all?
> > > > > > ->match() is run before probe by bus core, no?
> > > > > 
> > > > > That's a good question.
> > > > 
> > > > Everything seem to be working OK on my test board with this patch:
> > > 
> > > I'm okay with it, but I want to hear Wolfram about this.
> > > If it gets a green light to go, feel free to add
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Sergey,
> > 
> > Can you send a proper patch (with patch description) and me and Jean
> > Delvare <jdelvare@suse.de> in the To: field?
> > 
> > The origins of this matching code are pretty old and Jean is more
> > experienced there than I am. Nonetheless, I will check it, too, of
> > course.
> 
> Oh, sure, will do. Is that OK if I'll base my patch on linux-next?
> I'm also going to test the patch on more devices here on my side.

Today's one includes above mentioned patches, I think it's okay.
The i2c/for-next is currently listed
ab70935d37bb i2c: Remove 'default n' from busses/Kconfig
on top of current, don't see how it may interfere with this.

-- 
With Best Regards,
Andy Shevchenko


