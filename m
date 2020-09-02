Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8605625A822
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 10:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgIBI6v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 04:58:51 -0400
Received: from mga18.intel.com ([134.134.136.126]:28395 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726167AbgIBI6v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Sep 2020 04:58:51 -0400
IronPort-SDR: cOLo8EOE4vTVNq9EjbZul+UXQyilz/e4KhF7nEa+OFRiHviiVWUidgi86tTeN0BwW/hDCUBvVv
 gm61WFbsajeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="145039202"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; 
   d="scan'208";a="145039202"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2020 01:58:47 -0700
IronPort-SDR: 2CJGKaIlw/C2SVozeZwg1xN512nRjfKZQ7PytBv7Jg4gKlgIhwwX/EcPX2K5ZdHnnB0eUe0I2s
 7GQXpBiZKF9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; 
   d="scan'208";a="331361247"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 02 Sep 2020 01:58:45 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kDOOg-00DfSo-2Y; Wed, 02 Sep 2020 11:45:38 +0300
Date:   Wed, 2 Sep 2020 11:45:38 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
Cc:     wsa@kernel.org, jarkko.nikula@linux.intel.com, jdelvare@suse.de,
        chris.packham@alliedtelesis.co.nz, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: algo-pca: Reapply i2c bus settings after
 reset
Message-ID: <20200902084538.GY1891694@smile.fi.intel.com>
References: <20200901211747.20649-1-evan.nimmo@alliedtelesis.co.nz>
 <20200902084356.GX1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902084356.GX1891694@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 02, 2020 at 11:43:56AM +0300, Andy Shevchenko wrote:
> On Wed, Sep 02, 2020 at 09:17:47AM +1200, Evan Nimmo wrote:
> > If something goes wrong (such as the SCL being stuck low) then we need
> > to reset the PCA chip. The issue with this is that on reset we lose all
> > config settings and the chip ends up in a disabled state which results
> > in a lock up/high cpu usage. We need to re-apply any configuration that
> 
> cpu -> CPU (I guess Wolfram can decide with this when applying)
> 
> > had previously been set and re-enable the chip.
> 
> FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

And actually you forgot Chris' tag... But I dunno if the moving struct
definition is something that Chris might not like.

-- 
With Best Regards,
Andy Shevchenko


