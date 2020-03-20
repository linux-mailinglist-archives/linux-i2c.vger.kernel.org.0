Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6199918C79B
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 07:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgCTGmq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 02:42:46 -0400
Received: from mga18.intel.com ([134.134.136.126]:33484 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726602AbgCTGmq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Mar 2020 02:42:46 -0400
IronPort-SDR: 4nEdSCDf3OZmquxmL0qOJmFejkdjhFbNPoz44bCJ1cRNG+XwvHkXhp5mU3rHN5dGkqF1KOTsUC
 4urJjQy0fiZw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2020 23:42:46 -0700
IronPort-SDR: RqusFT6oNuJYgGoa+TzLas7LCLryt7ukZ6Q+SVPqX0Gg9Vh9qWdGWdSlxD30xJcCaqg3r+1Mgl
 4KIbvA1e7A6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,283,1580803200"; 
   d="scan'208";a="268994763"
Received: from mylly.fi.intel.com (HELO [10.237.72.153]) ([10.237.72.153])
  by fmsmga004.fm.intel.com with ESMTP; 19 Mar 2020 23:42:44 -0700
Subject: Re: [PATCH v1] i2c: designware: Fix spelling typos in the comments
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20200319153012.36136-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <34fd7275-f017-7e6c-f413-9eb5dddef62b@linux.intel.com>
Date:   Fri, 20 Mar 2020 08:42:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319153012.36136-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/19/20 5:30 PM, Andy Shevchenko wrote:
> Fix spelling typos in the comments with help of `codespell`.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-baytrail.c | 2 +-
>   drivers/i2c/busses/i2c-designware-common.c   | 8 ++++----
>   drivers/i2c/busses/i2c-designware-master.c   | 2 +-
>   drivers/i2c/busses/i2c-designware-pcidrv.c   | 2 +-
>   drivers/i2c/busses/i2c-designware-slave.c    | 2 +-
>   5 files changed, 8 insertions(+), 8 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
