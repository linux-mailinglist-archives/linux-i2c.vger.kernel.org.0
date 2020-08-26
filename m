Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939C0252ADA
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 11:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgHZJ4X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 05:56:23 -0400
Received: from mga14.intel.com ([192.55.52.115]:17377 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728040AbgHZJ4W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 05:56:22 -0400
IronPort-SDR: 4LnHU0G6w3BK24UkRHCRm8lF5V6sG85o+rTWbSvOgxM4X06nqZZxnyVhItDUiEfzFTtSaeQePV
 pSmoy4xrYOTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="155524058"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="155524058"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 02:56:21 -0700
IronPort-SDR: UFrZ7j1KCaMRxux51wJaYbmjrA+45n6UPGpfFOwS8bKCGGzUwQArZDOf1j4hX7wx1Fb1mrXK6y
 kjd9YHH6pMQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="329168253"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 26 Aug 2020 02:56:19 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kAsAD-00BXGf-IQ; Wed, 26 Aug 2020 12:56:17 +0300
Date:   Wed, 26 Aug 2020 12:56:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: consider devices with of_match_table during i2c
 device probing
Message-ID: <20200826095617.GH1891694@smile.fi.intel.com>
References: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
 <20200826050851.GA1081@ninjato>
 <20200826052544.GA500@jagdpanzerIV.localdomain>
 <20200826095356.GG1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826095356.GG1891694@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 26, 2020 at 12:53:56PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 02:25:44PM +0900, Sergey Senozhatsky wrote:
> > On (20/08/26 07:08), Wolfram Sang wrote:

...

> You probably meant simply:
> 
> 	if (!i2c_device_match(dev, dev->driver)) {
> 
> >                 status = -ENODEV;
> >                 goto put_sync_adapter;
> >         }
> 
> On the first glance it will work the same way but slightly longer in case of ID
> table matching.
> 
> Send a patch!

But then the question is why we have this code in the ->probe() at all?
->match() is run before probe by bus core, no?

Wolfram?

-- 
With Best Regards,
Andy Shevchenko


