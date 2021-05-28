Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD6A394012
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 11:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235721AbhE1JgK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 05:36:10 -0400
Received: from mga17.intel.com ([192.55.52.151]:6659 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235526AbhE1JgJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 05:36:09 -0400
IronPort-SDR: /SaKLMw/jUIwJNaJK3b5Oy3fFjQRTj3zm/p1Wg4Lq5xMnH4NWBD7poX1w/po088D5ueFsWr35f
 mZwCeaiv3peA==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="183267172"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="183267172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:34:32 -0700
IronPort-SDR: uB+8xYzoqucfKoRlgcPZPfMoWDR0sWUKEK/wrZ/nqFlwTj+F6xJJ7fiV6iEKowckLbTzfDkcjQ
 zs+Dt78+3+Dw==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="443938483"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:34:29 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lmYss-00FHPQ-JM; Fri, 28 May 2021 12:34:26 +0300
Date:   Fri, 28 May 2021 12:34:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Wolfram Sang <wsa@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v1 1/6] i2c: acpi: Export i2c_acpi_find_client_by_adev()
 for users
Message-ID: <YLC5IstyPFQA6mBp@smile.fi.intel.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
 <YLAAedlB6UaJQh0X@kunai>
 <YLC3HzCUhEYmfckj@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLC3HzCUhEYmfckj@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 28, 2021 at 11:25:51AM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 27, 2021 at 10:26:33PM +0200, Wolfram Sang wrote:
> > On Wed, May 26, 2021 at 03:43:17PM +0300, Andy Shevchenko wrote:
> > > There is at least one user that will gain from the
> > > i2c_acpi_find_client_by_adev() being exported.
> > 
> > No objections per se. But as the user is in staging, I want to ask if
> > the use there is really a solution we would also accept outside of
> > staging? Or is it a hack?
> 
> staging drivers should be self-contained, do not accept code in the core
> kernel that only is used by staging drivers.
> 
> So I would not recommend this be accepted at this point in time.

Fair enough.

> Andy, work to get the driver out of staging first before doing stuff
> like this.

Okay, I'll drop first one and patches related to it in the v2.
It should bring us closer to the mentioned point.

Thanks for clarification!

-- 
With Best Regards,
Andy Shevchenko


