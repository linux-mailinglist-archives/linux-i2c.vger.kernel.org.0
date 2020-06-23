Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43D0204C6F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 10:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731665AbgFWIdd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 04:33:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:54205 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731579AbgFWIdd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jun 2020 04:33:33 -0400
IronPort-SDR: FDGEW1N0Bq4pEde0OtEtv/LQZzM4mlIrTE+z1pbGdW1j4XCeOqkXFEyIh9ghzobNU5ZL0m9KUg
 cSxYEosBRzJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="124262267"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="124262267"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 01:33:32 -0700
IronPort-SDR: VcuRFLa3aMgDYJ1ODJzyyswd2p2S6MJd1FWN3QstouzkItwFoYqOy+yoiy7dx39ldYrJYBW7Ig
 1tpAJH0qHEWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="353737239"
Received: from mylly.fi.intel.com (HELO [10.237.72.87]) ([10.237.72.87])
  by orsmga001.jf.intel.com with ESMTP; 23 Jun 2020 01:33:30 -0700
Subject: Re: [PATCH] i2c: designware: Fix functionality in !CONFIG_ACPI case
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
References: <20200623025144.34246-1-john.stultz@linaro.org>
 <d6c317ee-4f97-9c57-6b04-1eabd814b6ce@linux.intel.com>
Message-ID: <96ea5e42-0632-4c8b-03c2-4958b9eea8c5@linux.intel.com>
Date:   Tue, 23 Jun 2020 11:33:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d6c317ee-4f97-9c57-6b04-1eabd814b6ce@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/23/20 10:59 AM, Jarkko Nikula wrote:
> Hi
> 
> On 6/23/20 5:51 AM, John Stultz wrote:
>> On the HiKey board, where CONFIG_ACPI is not set, we started
>> to see a graphics regression where the adv7511 HDMI bridge driver
>> wasn't probing. This was due to the i2c bus failing to start up.
>>
>> I bisected the problem down to commit f9288fcc5c615 ("i2c:
>> designware: Move ACPI parts into common module") and after
>> looking at it a bit, I realized that change moved some
>> initialization into i2c_dw_acpi_adjust_bus_speed(). However,
>> i2c_dw_acpi_adjust_bus_speed() is only functional if CONFIG_ACPI
>> is set.
>>
>> This patch pulls i2c_dw_acpi_adjust_bus_speed() out of the
>> ifdef CONFIG_ACPI conditional, and gets the board working again.
>>
> Andy: what you think should the i2c_dw_acpi_adjust_bus_speed() fixed to 
> return adjusted speed or zero if not found (also for !CONFIG_ACPI) and 
> move above lines back to probe? It looks more clear to me that way and 
> should fix the regression I think.
> 
Ok, I sent a patch what I was thinking. Care to test John does it fix 
the regression you are seeing?

-- 
Jarkko

