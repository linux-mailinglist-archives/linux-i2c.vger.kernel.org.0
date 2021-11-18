Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90B3B455D45
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 15:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbhKROHU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 09:07:20 -0500
Received: from mga14.intel.com ([192.55.52.115]:33525 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232210AbhKROHA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Nov 2021 09:07:00 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="234424415"
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="234424415"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 06:03:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="455335610"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by orsmga006.jf.intel.com with ESMTP; 18 Nov 2021 06:03:40 -0800
Subject: Re: [PATCH] 2c: i801: Improve handling of chip-specific feature
 definitions
To:     Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
References: <89eb31f3-8544-35c6-7b15-920831746563@gmail.com>
 <20211118110912.76b74cd3@endymion>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <56d37e6a-a0c0-861b-dfd7-e50b95cd5377@linux.intel.com>
Date:   Thu, 18 Nov 2021 16:03:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211118110912.76b74cd3@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/18/21 12:09 PM, Jean Delvare wrote:
> Hi Heiner,
> 
> On Mon, 08 Nov 2021 21:10:12 +0100, Heiner Kallweit wrote:
>> Reduce source code and code size by defining the chip features
>> statically.
> 
> While I don't like the PCI_DEVICE_DATA macro implementation (for it
> breaks grepping for PCI defines), I generally enjoy more data and less
> code. So I am fine with this change.
> 
> Jarkko, you are typically the one adding support for new devices to
> this driver so this change will affect you. Are you OK with that change?
> 
I think it makes code more readable and less error prone when adding 
support for new devices and merging with other upstream changes. I 
remember one such accident:

fd4b204a0971 ("i2c: i801: Bring back Block Process Call support for 
certain platforms")

>> +#define DEF_FEATURES	(FEATURE_BLOCK_PROC | FEATURE_I2C_BLOCK_READ	| \
> 
> Not a good name ("default" isn't descriptive) and not consistent
> either. I suggest "FEATURES_82801EB" instead, as this is the first
> chipset which supported all these features. And you can make the
> definitions of FEATURES_82801DB and FEATURES_82801EB consistent
> (spacing/alignment).
> 
How about calling default as FEATURES_ICH5 and 82801DB as FEATURES_ICH4? 
That makes easier to follow comments like "/* ICH4 and later */" in the 
code.

Jarkko
