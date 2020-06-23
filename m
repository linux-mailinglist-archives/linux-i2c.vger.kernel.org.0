Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12BC6204F7B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 12:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732248AbgFWKrk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 06:47:40 -0400
Received: from mga14.intel.com ([192.55.52.115]:27789 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732205AbgFWKrj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jun 2020 06:47:39 -0400
IronPort-SDR: L35FBJtxKsyV6zXuIKNfHyOvvN3KwGJ4/XR5of3ujcbeP4pKHI37ge3wr3TPe1GWLsWDcgfoO+
 1E8OBfU/jojw==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="143096992"
X-IronPort-AV: E=Sophos;i="5.75,271,1589266800"; 
   d="scan'208";a="143096992"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 03:47:39 -0700
IronPort-SDR: +PoI+B2eh9aD9GjeYpNZEYSzv52m+YSfkEeXupy2UfF/rUtJZ2Xe3wAkyVrMuKEPWmsXS+Yxwx
 p2GrFQ0ODQiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,271,1589266800"; 
   d="scan'208";a="353766651"
Received: from mylly.fi.intel.com (HELO [10.237.72.87]) ([10.237.72.87])
  by orsmga001.jf.intel.com with ESMTP; 23 Jun 2020 03:47:37 -0700
Subject: Re: [PATCH] i2c: designware: Fix bus speed in !CONFIG_ACPI case
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        John Stultz <john.stultz@linaro.org>
References: <20200623083113.241137-1-jarkko.nikula@linux.intel.com>
 <20200623084635.GP2428291@smile.fi.intel.com>
 <20200623084710.GQ2428291@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <a153f12b-9135-17fa-d9cc-08498d0cf0b1@linux.intel.com>
Date:   Tue, 23 Jun 2020 13:47:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623084710.GQ2428291@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/23/20 11:47 AM, Andy Shevchenko wrote:
> On Tue, Jun 23, 2020 at 11:46:35AM +0300, Andy Shevchenko wrote:
>> On Tue, Jun 23, 2020 at 11:31:13AM +0300, Jarkko Nikula wrote:
>>> John Stultz reported that commit f9288fcc5c615 ("i2c: designware: Move
>>> ACPI parts into common module") caused a regression on the HiKey board
>>> where adv7511 HDMI bridge driver wasn't probing anymore due the I2C bus
>>> failed to start.
>>>
>>> It seems the change caused the bus speed being zero when CONFIG_ACPI
>>> not set and neither speed based on "clock-frequency" device property or
>>> default fast mode is set.
>>>
>>> Fix this by moving bus speed setting back to dw_i2c_plat_probe() and let
>>> the i2c_dw_acpi_adjust_bus_speed() adjust only speed from ACPI.
>>
>> I have slightly different idea, I'll send a patch soon after testing.
> 
> Note, your patch breaks PCI case.
> 
Ah, indeed. So please ignore my patch.

-- 
Jarkko
