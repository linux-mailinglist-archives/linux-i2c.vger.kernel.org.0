Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4550C47E491
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Dec 2021 15:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbhLWOit (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Dec 2021 09:38:49 -0500
Received: from mga11.intel.com ([192.55.52.93]:30964 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232183AbhLWOit (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Dec 2021 09:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640270329; x=1671806329;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ppV6NZ7oiK+8XyQQ1CMZ7i5YWKknr1zrYniCHtFSmWw=;
  b=TgjjS8aWnqyoFYEiG/6qQEBYz2VfwLfUQuNEKQac6eR8e/sEe5HyM/SL
   EshJn5lpdby2QZqY3/0zUX4LozJkxxYYXaw/evu78wA3eklBZNEQdFM52
   Hiu1s+bQImQaC3ttzMWSiZOth6fqH57xtzB93ATdx9irTTrNp1LWH4769
   +YURzV9fbe/TEk3+l4W4wCnpgRlII2HH9lTA6y+sSHXG/ZOq/YZ0ARVb+
   1zCK/Mqck4KBLeVKfe6ZI8Sh0LH/SPKmkDyt2EE//jQfoD1SaQtEpNIlE
   n3KylQoeIA3N4vo7AnV7riEn2f6c+PxCpv0kWSeZbbzrTRetHvZeV+OEM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="238369474"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; 
   d="scan'208";a="238369474"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2021 06:38:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; 
   d="scan'208";a="617506959"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by orsmga004.jf.intel.com with ESMTP; 23 Dec 2021 06:38:46 -0800
Message-ID: <293f465a-a0c1-ece2-794b-2f3bf393e319@linux.intel.com>
Date:   Thu, 23 Dec 2021 16:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH v2 5/5] i2c: designware-pci: Switch to use
 i2c_new_ccgx_ucsi()
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
References: <20211222162041.64625-1-andriy.shevchenko@linux.intel.com>
 <20211222162041.64625-5-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20211222162041.64625-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/22/21 18:20, Andy Shevchenko wrote:
> Instead of open coded variant switch to use i2c_new_ccgx_ucsi().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: rebased on top of current i2c/for-next
> 
>   drivers/i2c/busses/Kconfig                 |  1 +
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 30 ++++------------------
>   2 files changed, 6 insertions(+), 25 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
