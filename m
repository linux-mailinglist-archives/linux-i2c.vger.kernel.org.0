Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 752C778CDA
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2019 15:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbfG2N1x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jul 2019 09:27:53 -0400
Received: from mga04.intel.com ([192.55.52.120]:42693 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726960AbfG2N1x (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Jul 2019 09:27:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Jul 2019 06:27:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,322,1559545200"; 
   d="scan'208";a="182746059"
Received: from mylly.fi.intel.com (HELO [10.237.72.159]) ([10.237.72.159])
  by orsmga002.jf.intel.com with ESMTP; 29 Jul 2019 06:27:50 -0700
Subject: Re: [PATCH] i2c: designware: make use of devm_gpiod_get_optional
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Dominik Brodowski <linux@dominikbrodowski.net>
References: <20190725202136.19423-1-uwe@kleine-koenig.org>
 <20190725203923.GQ9224@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <d183839e-09e0-1a97-58f1-dace016c1f43@linux.intel.com>
Date:   Mon, 29 Jul 2019 16:27:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725203923.GQ9224@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/25/19 11:39 PM, Andy Shevchenko wrote:
> On Thu, Jul 25, 2019 at 10:21:36PM +0200, Uwe Kleine-König wrote:
>> There is a semantical change: if devm_gpiod_get_optional returns -ENOSYS
>> this is passed as error to the caller. This effectively reverts commit
>> d1fa74520dcd ("i2c: designware: Consider SCL GPIO optional") which
>> shouldn't be necessary any more since gpiod_get_optional doesn't return
>> -ENOSYS any more with GPIOLIB=n.
> 
> I like this!
> Thanks and take mine
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
