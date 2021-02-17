Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3218C31DAF0
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Feb 2021 14:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbhBQNtH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Feb 2021 08:49:07 -0500
Received: from mga14.intel.com ([192.55.52.115]:57442 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231748AbhBQNtD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Feb 2021 08:49:03 -0500
IronPort-SDR: Ucd2bFIG2htyppdwu8dLV2IZlKeesNPq4+jrEhaiwdoQj50rG0S/hA4/lIlv08y1v2pCJw24zn
 Vo1x13lzPHtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="182413780"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="182413780"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 05:47:07 -0800
IronPort-SDR: F90pREd138flyL/iIcxg7rFosRi7BUx7S/w3QiWC6N/l+QKAx/taM8RgmZbgQo8eKCkORNf4Os
 qP9ZHR9qgzjQ==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="580866233"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 05:47:03 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lCNAT-005ibQ-4B; Wed, 17 Feb 2021 15:47:01 +0200
Date:   Wed, 17 Feb 2021 15:47:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        helgaas@kernel.org, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] i2c: designware: Use the correct name of
 device-managed function
Message-ID: <YC0eVZf4Xci0IF5+@smile.fi.intel.com>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
 <20210216160249.749799-4-zhengdejin5@gmail.com>
 <YCwE2cf9X/Gd6lWy@rocinante>
 <20210217114014.GB766103@nuc8i5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210217114014.GB766103@nuc8i5>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 17, 2021 at 07:40:14PM +0800, Dejin Zheng wrote:
> On Tue, Feb 16, 2021 at 06:46:01PM +0100, Krzysztof Wilczyński wrote:

...

> > The change simplifies the error handling path, how?  A line of two which
> > explains how it has been achieved might help should someone reads the
> > commit message in the future.
> > 
> To put it simply, if the driver probe fail, the device-managed function
> mechanism will automatically call pcim_release(), then the pci_free_irq_vectors()
> will be executed. For details, please see the relevant code.

Perhaps as a compromise you may add this short sentence to your commit
messages, like "the freeing resources will take automatically when device
is gone".

-- 
With Best Regards,
Andy Shevchenko


