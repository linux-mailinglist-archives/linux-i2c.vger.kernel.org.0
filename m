Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED973355200
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245483AbhDFL13 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:27:29 -0400
Received: from mga17.intel.com ([192.55.52.151]:45275 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245480AbhDFL1Z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:27:25 -0400
IronPort-SDR: tb23ks26+4jdPCfNlHWdGLQtZwpbCtjHUxzWx5r0/6oey6yz9DKU6yxVAbi24MbXqZkLL3LicU
 WQ1pKhV9AwZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="173122614"
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; 
   d="scan'208";a="173122614"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 04:27:17 -0700
IronPort-SDR: CNpaZgNMDahqFGQz3rPngbS/KRLe53vd/U7xay6NvtMIdSdNKYJGgWcjtzNSEwRlOiOxUp1sBG
 8lHHNfxVgyGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; 
   d="scan'208";a="518998822"
Received: from mylly.fi.intel.com (HELO [10.237.72.184]) ([10.237.72.184])
  by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2021 04:27:16 -0700
Subject: Re: [PATCH v1 2/2] i2c: designware: Get rid of legacy platform data
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
 <20210331154851.8456-3-andriy.shevchenko@linux.intel.com>
 <20210406104927.GA3532@ninjato>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <bf214a3f-fa6b-33e7-0459-6e5136bd068e@linux.intel.com>
Date:   Tue, 6 Apr 2021 14:27:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210406104927.GA3532@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/6/21 1:49 PM, Wolfram Sang wrote:
> On Wed, Mar 31, 2021 at 06:48:51PM +0300, Andy Shevchenko wrote:
>> Platform data is a legacy interface to supply device properties
>> to the driver. In this case we don't have anymore in-kernel users
>> for it. Just remove it for good.
>>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Wolfram Sang <wsa@kernel.org>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
