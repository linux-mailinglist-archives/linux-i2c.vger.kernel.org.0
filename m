Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB94226E5C3
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 21:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbgIQT4P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 15:56:15 -0400
Received: from mga02.intel.com ([134.134.136.20]:10770 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727487AbgIQOqS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Sep 2020 10:46:18 -0400
X-Greylist: delayed 7082 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 10:45:51 EDT
IronPort-SDR: B+ZFbACdWBlZuVV/TCXBd/VpeYAwOaT1O3QOIQXzLiAOomkKv7NeGj4fVD89HoGtESO38iiWVl
 /8TCPP9R/LUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="147398662"
X-IronPort-AV: E=Sophos;i="5.77,437,1596524400"; 
   d="scan'208";a="147398662"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 07:45:39 -0700
IronPort-SDR: wUnwzzA+zhduLkhwDoEyFcAwETHWsz3DLEWqMEamXY2uxGQu14k40LWrcdYwWVuDWxO8Ua2Xjs
 XKWyDyW06dPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,437,1596524400"; 
   d="scan'208";a="336440069"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Sep 2020 07:45:35 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kIvAC-00HLjp-9b; Thu, 17 Sep 2020 17:45:32 +0300
Date:   Thu, 17 Sep 2020 17:45:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Sultan Alsawaf <sultan@kerneltoast.com>, linux-i2c@vger.kernel.org,
        jikos@kernel.org, aaron.ma@canonical.com, admin@kryma.net,
        benjamin.tissoires@redhat.com, hdegoede@redhat.com,
        hn.chen@weidahitech.com, kai.heng.feng@canonical.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org
Subject: Re: [PATCH v2 2/4] i2c: designware: Ensure tx_buf_len is nonzero for
 SMBus block reads
Message-ID: <20200917144532.GO3956970@smile.fi.intel.com>
References: <20200917052256.5770-1-sultan@kerneltoast.com>
 <20200917052256.5770-3-sultan@kerneltoast.com>
 <4698b23c-7af6-3f44-975d-b1f692ae3f00@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4698b23c-7af6-3f44-975d-b1f692ae3f00@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 17, 2020 at 04:44:18PM +0300, Jarkko Nikula wrote:
> On 9/17/20 8:22 AM, Sultan Alsawaf wrote:
> > From: Sultan Alsawaf <sultan@kerneltoast.com>
> > 
> > The point of adding a byte to len in i2c_dw_recv_len() is to make sure
> > that tx_buf_len is nonzero, so that i2c_dw_xfer_msg() can let the i2c
> > controller know that the i2c transaction can end. Otherwise, the i2c
> > controller will think that the transaction can never end for block
> > reads, which results in the stop-detection bit never being set and thus
> > the transaction timing out.
> > 
> > Adding a byte to len is not a reliable way to do this though; sometimes
> > it lets tx_buf_len become zero, which results in the scenario described
> > above. Therefore, just directly ensure tx_buf_len cannot be zero to fix
> > the issue.
> > 
> > Fixes: c3ae106050b9 ("i2c: designware: Implement support for SMBus block read and write")
> > Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> > ---
> >   drivers/i2c/busses/i2c-designware-master.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> Were other patches in series dropped somewhere? I received only this.

@linux.intel.com has some issues in delivery (accepting) messages. You may
download thru lore.kernel.org entire series and reply.

-- 
With Best Regards,
Andy Shevchenko


