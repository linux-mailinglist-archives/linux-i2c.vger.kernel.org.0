Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710D946D350
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Dec 2021 13:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhLHMeG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Dec 2021 07:34:06 -0500
Received: from mga18.intel.com ([134.134.136.126]:47120 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233367AbhLHMeF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Dec 2021 07:34:05 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="224689334"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="224689334"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 04:30:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="461674975"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by orsmga003.jf.intel.com with ESMTP; 08 Dec 2021 04:30:26 -0800
Message-ID: <7261c9c0-8b63-0e85-c8e9-2eb0f0007ac0@linux.intel.com>
Date:   Wed, 8 Dec 2021 14:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH v1 07/11] i2c: designware-pci: Group MODULE_*() macros
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>
References: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
 <20211207192159.41383-7-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20211207192159.41383-7-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/7/21 21:21, Andy Shevchenko wrote:
> For better maintenance group MODULE_*() macros together.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
