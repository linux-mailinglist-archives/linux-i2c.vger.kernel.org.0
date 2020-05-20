Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C8B1DB5BC
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 15:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgETNzm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 09:55:42 -0400
Received: from mga14.intel.com ([192.55.52.115]:21470 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgETNzl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 09:55:41 -0400
IronPort-SDR: wAuArhf6c/FQIcUE2QF9M06hE5W8XnpL78IM9gyCW9dlUi3BHhQdp0sC0g+cPBcc9bwZFjHXPh
 6Two8GmuZeNQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 06:55:41 -0700
IronPort-SDR: YjiR1VlDuQZb0WK3isDxPndTZw/SwouYUlN340tMnZr5BO3RyVzsW5sIuKV+1KGjPZXwQDZwcz
 f+czMe7x8d7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; 
   d="scan'208";a="289357972"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga004.fm.intel.com with ESMTP; 20 May 2020 06:55:40 -0700
Subject: Re: [PATCH v2 1/7] i2c: designware: Get rid of PCI driver specifics
 in common code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
References: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <46e45caf-7ce4-d3b2-cea6-747424b44a4a@linux.intel.com>
Date:   Wed, 20 May 2020 16:55:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/19/20 3:50 PM, Andy Shevchenko wrote:
> Do not spread PCI specifics over common code. It seems to be a layering
> violation which can be easily avoided. Refactor PCI driver and drop
> PCI specifics from common code.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: new patch
>   drivers/i2c/busses/i2c-designware-core.h   |  1 -
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 24 +++++++++++++---------
>   2 files changed, 14 insertions(+), 11 deletions(-)
> 
For all patches 1-7/7:

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
