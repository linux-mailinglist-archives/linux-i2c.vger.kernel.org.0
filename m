Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8CD1BA5AE
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 16:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgD0OFw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 10:05:52 -0400
Received: from mga02.intel.com ([134.134.136.20]:32901 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbgD0OFv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Apr 2020 10:05:51 -0400
IronPort-SDR: v224VFGuvQQlcKRrz+jQVEpriYroNdA/BtIVMWLkSGBd9tduSLknVW9ZTMUQi1xL1rCLZkUUU0
 Bc4kve4XqW4A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2020 07:05:51 -0700
IronPort-SDR: vurSa1YcYsqLe1GBFCxtEfh8D76cDWzFSPhNMuMTJM6CPFi5MKuUe0kGqpgJ6ngQt7eJcfzf8g
 oxGJusA5o4iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; 
   d="scan'208";a="260738704"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by orsmga006.jf.intel.com with ESMTP; 27 Apr 2020 07:05:36 -0700
Subject: Re: [PATCH v2 5/5] i2c: designware: Allow slave mode for PCI
 enumerated devices
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20200425134448.28514-1-andriy.shevchenko@linux.intel.com>
 <20200425134448.28514-5-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <9f6213e9-e14c-a4b2-eb10-d5463dbe2c19@linux.intel.com>
Date:   Mon, 27 Apr 2020 17:05:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200425134448.28514-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/25/20 4:44 PM, Andy Shevchenko wrote:
> Allow slave mode for PCI enumerated devices by calling a common i2c_dw_probe()
> instead of i2c_dw_probe_master().
> 
> While dropping dependency to platform driver in slave module, move its
> configuration section above, closer to core.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: new patch
>   drivers/i2c/busses/Kconfig                 | 21 ++++++++++-----------
>   drivers/i2c/busses/i2c-designware-pcidrv.c |  4 ++--
>   2 files changed, 12 insertions(+), 13 deletions(-)
> 
To all 5 patches

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
