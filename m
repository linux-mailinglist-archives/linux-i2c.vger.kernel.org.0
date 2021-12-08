Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7DA46D34C
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Dec 2021 13:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbhLHMdf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Dec 2021 07:33:35 -0500
Received: from mga12.intel.com ([192.55.52.136]:16192 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233367AbhLHMde (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Dec 2021 07:33:34 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="217844309"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; 
   d="scan'208";a="217844309"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 04:30:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="461674795"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by orsmga003.jf.intel.com with ESMTP; 08 Dec 2021 04:29:59 -0800
Message-ID: <c731ccbd-b1f1-907f-99b0-9e9ea37865f9@linux.intel.com>
Date:   Wed, 8 Dec 2021 14:29:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH v1 08/11] i2c: designware-pci: Add a note about struct
 dw_scl_sda_cfg usage
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>
References: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
 <20211207192159.41383-8-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20211207192159.41383-8-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/7/21 21:21, Andy Shevchenko wrote:
> Add a note about struct dw_scl_sda_cfg usage to discourage people
> of using this structure on new platforms. Instead they should try
> hard to put the needed information into firmware descriptions.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
