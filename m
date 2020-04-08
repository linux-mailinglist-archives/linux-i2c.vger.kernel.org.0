Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF3C71A1C4C
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 09:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgDHHIq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 03:08:46 -0400
Received: from mga03.intel.com ([134.134.136.65]:48132 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726525AbgDHHIq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Apr 2020 03:08:46 -0400
IronPort-SDR: Yjjxka7Am7v7OwnIho1QiEsfKrAkMItGbqvjXeqpQaxOnK+qRNwOfAd2OcURwlG8FD7LE9cZ59
 KnnpiCiZy/KA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 00:08:46 -0700
IronPort-SDR: M+1C4s3v+XrQaWCv/3+1I2uA2L6OGfwjgWPis8RrjhVJSjGm0MgVaIRQSd6vHKKzInYBhRRBzF
 cudSzjvQCXeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; 
   d="scan'208";a="451505248"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by fmsmga005.fm.intel.com with ESMTP; 08 Apr 2020 00:08:44 -0700
Subject: Re: [PATCH 1/2] i2c: designware: Calculate SCL timing parameter for
 Fast Mode Plus
To:     Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com
Cc:     linux-i2c@vger.kernel.org
References: <20200407133439.23422-1-wan.ahmad.zainie.wan.mohamad@intel.com>
 <20200407133439.23422-2-wan.ahmad.zainie.wan.mohamad@intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <f2b888cf-0251-21dc-f803-122d1c32e24f@linux.intel.com>
Date:   Wed, 8 Apr 2020 10:08:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200407133439.23422-2-wan.ahmad.zainie.wan.mohamad@intel.com>
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
> for Fast Mode Plus.
> 
> Signed-off-by: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
