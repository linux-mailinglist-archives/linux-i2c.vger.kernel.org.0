Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C36A2074D0
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jun 2020 15:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390974AbgFXNpa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jun 2020 09:45:30 -0400
Received: from mga04.intel.com ([192.55.52.120]:11012 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390774AbgFXNpa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Jun 2020 09:45:30 -0400
IronPort-SDR: Bltt1TY/9uvuvIZ2Xi4dHwsrSwo7f5OhZk11UprwgDQ1dHfQ38rVJWGPrghy+/4tRo0kYrezcv
 DNqbqC47jH1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="141942263"
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; 
   d="scan'208";a="141942263"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2020 06:45:30 -0700
IronPort-SDR: Mq/SO21xQZePfU1/Id2YHl4HnxiF0C/hF6HttxwuJf/GpSnTCqptenjm5QFJQasYqQO/32hUk7
 VqYTJtjcUFpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; 
   d="scan'208";a="291742582"
Received: from mylly.fi.intel.com (HELO [10.237.72.87]) ([10.237.72.87])
  by orsmga007.jf.intel.com with ESMTP; 24 Jun 2020 06:45:28 -0700
Subject: Re: [PATCH v2] i2c: designware: platdrv: Set class based on dmi
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
References: <20200624112530.852254-1-ribalda@kernel.org>
 <20200624132231.GF3703480@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <f71e301f-f205-1236-a8b7-a448132b94a8@linux.intel.com>
Date:   Wed, 24 Jun 2020 16:45:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624132231.GF3703480@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/24/20 4:22 PM, Andy Shevchenko wrote:
> On Wed, Jun 24, 2020 at 01:25:30PM +0200, Ricardo Ribalda wrote:
>> Current AMD's zen-based APUs use this core for some of its i2c-buses.
>>
>> With this patch we re-enable autodetection of hwmon-alike devices, so
>> lm-sensors will be able to work automatically.
>>
>> It does not affect the boot-time of embedded devices, as the class is
>> set based on the dmi information.
> 
> I think it misses Fixes tag. And...
> 
I don't think we have regression here. Commit 70fba8302ade ("i2c: 
i2c-designware-platdrv: Drop class based scanning to improve bootup 
time") was done before any of those AMD ACPI IDs were added.

-- 
Jarkko
