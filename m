Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F82E355108
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 12:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242766AbhDFKiU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 06:38:20 -0400
Received: from mga05.intel.com ([192.55.52.43]:3437 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229787AbhDFKiT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 06:38:19 -0400
IronPort-SDR: dxuMMEPNdgrtgdwYSnMJATDI5vhguj1ynvWxRK1rTW2NAsr/rfLL92+H/puHVWyI7cniXM57/t
 /aQgY7QrC3fQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="278297143"
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; 
   d="scan'208";a="278297143"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 03:38:12 -0700
IronPort-SDR: rWOHAocYmaoi3fT7ckghhJZddAWQ6+uoWJ/PCjcNk3HllAV97q73ihW7p8NgrUJlistOa0h62a
 42QE9ZtGfMrQ==
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; 
   d="scan'208";a="380870150"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 03:38:09 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lTj5y-001h6K-Bm; Tue, 06 Apr 2021 13:38:06 +0300
Date:   Tue, 6 Apr 2021 13:38:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 0/2] mfd: =?iso-8859-1?Q?int?=
 =?iso-8859-1?Q?el=5Fquark=5Fi2c=5Fgpio=3A_Covert_I=B2?= =?iso-8859-1?Q?C?=
 part to software nodes
Message-ID: <YGw6Duysei0WG2yA@smile.fi.intel.com>
References: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
 <20210405205928.GF3945@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405205928.GF3945@kunai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 05, 2021 at 10:59:28PM +0200, Wolfram Sang wrote:
> 
> > driver). In any case I guess the procedure is pretty much standard, i.e. Lee
> > creates an immutable branch that Wolfram can pull into his tree.
> 
> Yes, that would be my favourite.

Can you Ack the patch then?

-- 
With Best Regards,
Andy Shevchenko


