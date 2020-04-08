Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 195B81A1C4D
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 09:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgDHHJF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 03:09:05 -0400
Received: from mga18.intel.com ([134.134.136.126]:9785 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgDHHJF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Apr 2020 03:09:05 -0400
IronPort-SDR: 4mfM0cqGkMtDkxSkH0eNHtOGDwjgFv0UedcsjncCZP1VMrJNbowYk3UcKNZ3npqh405FrmQvSZ
 SIdv9SvWWsqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 00:09:04 -0700
IronPort-SDR: 2AHHaLhzcFV31DAKpk7G53VyOmS+mdXAQsZi6nxUFKUeuQnIhXy4OdCHl44OXjK30tykQF9PHY
 LvpkTqlWtDdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; 
   d="scan'208";a="451505302"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by fmsmga005.fm.intel.com with ESMTP; 08 Apr 2020 00:09:03 -0700
Subject: Re: [PATCH 2/2] i2c: designware: Calculate SCL timing parameter for
 High Speed Mode
To:     Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com
Cc:     linux-i2c@vger.kernel.org
References: <20200407133439.23422-1-wan.ahmad.zainie.wan.mohamad@intel.com>
 <20200407133439.23422-3-wan.ahmad.zainie.wan.mohamad@intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <cf000dbc-c89c-2fb3-8564-0b4c899f3018@linux.intel.com>
Date:   Wed, 8 Apr 2020 10:09:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200407133439.23422-3-wan.ahmad.zainie.wan.mohamad@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/7/20 4:34 PM, Wan Ahmad Zainie wrote:
> Custom parameters for HCNT/LCNT are not available for OF based system.
> Thus, we will use existing SCL timing parameter calculation functions
> for High Speed Mode too.
> 
> The value for the parameters tSYMBOL and tLOW is taken from DesignWare
> DW_apb_i2c Databook v2.01a, section 3.15.4.6. The calculation should
> assume higher bus load since it gives slower timing parameter.
> 
> Signed-off-by: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
