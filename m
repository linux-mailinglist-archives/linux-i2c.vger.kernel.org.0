Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43AC6A0286
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2019 15:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfH1NEE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Aug 2019 09:04:04 -0400
Received: from mga02.intel.com ([134.134.136.20]:59863 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726548AbfH1NEE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Aug 2019 09:04:04 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 06:04:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; 
   d="scan'208";a="197552486"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 28 Aug 2019 06:04:00 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 28 Aug 2019 16:04:00 +0300
Date:   Wed, 28 Aug 2019 16:04:00 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: iTCO: Add support for Cannon Lake PCH iTCO
Message-ID: <20190828130400.GY3177@lahna.fi.intel.com>
References: <20190809124553.67012-1-mika.westerberg@linux.intel.com>
 <20190809124553.67012-2-mika.westerberg@linux.intel.com>
 <20190828145034.50700666@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828145034.50700666@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 28, 2019 at 02:50:34PM +0200, Jean Delvare wrote:
> Hi Mika,

Hi,

> On Fri, 9 Aug 2019 15:45:52 +0300, Mika Westerberg wrote:
> > In Intel Cannon Lake PCH the NO_REBOOT bit was moved from the private
> > register space to be part of the TCO1_CNT register. For this reason
> > introduce another version (6) that uses this register to set and clear
> > NO_REBOOT bit.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/watchdog/iTCO_wdt.c | 25 +++++++++++++++++++++++--
> >  1 file changed, 23 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> > index c559f706ae7e..505f2c837347 100644
> > --- a/drivers/watchdog/iTCO_wdt.c
> > +++ b/drivers/watchdog/iTCO_wdt.c
> > @@ -215,6 +215,23 @@ static int update_no_reboot_bit_mem(void *priv, bool set)
> >  	return 0;
> >  }
> >  
> > +static int update_no_reboot_bit_cnt(void *priv, bool set)
> > +{
> > +	struct iTCO_wdt_private *p = priv;
> > +	u16 val, newval;
> > +
> > +	val = inw(TCO1_CNT(p));
> > +	if (set)
> > +		val |= BIT(0);
> > +	else
> > +		val &= ~BIT(0);
> 
> Are you not supposed to include <linux/bits.h> before you use BIT()?

Apparently not because it compiles just fine without ;-) Probably gets
includes via another header. I'll add it in v2.

> > +	outw(val, TCO1_CNT(p));
> > +	newval = inw(TCO1_CNT(p));
> > +
> > +	/* make sure the update is successful */
> > +	return val != newval ? -EIO : 0;
> > +}
> 
> Other than this minor nitpick, looks good to me.
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks!
