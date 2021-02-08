Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6873E31388F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 16:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234198AbhBHPxA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 10:53:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbhBHPwy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Feb 2021 10:52:54 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0502C061788;
        Mon,  8 Feb 2021 07:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=RvXJ37lUS29Py6Q88UU6CXjCfQr8HQrtxGSbml6m5Xg=; b=nEhEI3TccV8gvo4tq69qEQ3OMH
        NdvpURRARBrElIzLkx5fBXvwKEuejVoftixqY2+ldDbdm9AS1lS+oqpLW9mAn+W5OuCdCg8+CS98p
        ZA8c0VVFjV/lBUhyvZRgn7jHCkxXwGpbsd/FqJsgdja08XdJBm3+hC+CHo0UmUHJwj0w1Q5yaunmO
        11rqmkvw+9W+ynXenKgUFCiNasSJogcIZZpbKHzRRoR1FPhfg+wNA6517dua8A2n7OX1OdkO9wV18
        55yCY6WTsEjjTJxzjwgaGjpQgx0YQXsMaHFkyWZrdTwTIchgnAjGOBvYc9JVUB7NfGwwmLrxRKbfJ
        K+yaCMMA==;
Received: from [2601:1c0:6280:3f0::cf3b]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l98pd-0004qg-4g; Mon, 08 Feb 2021 15:52:09 +0000
Subject: Re: [PATCH v10 3/7] Documentation: ACPI: Document _DSE object usage
 for enum power state
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
 <20210205132505.20173-4-sakari.ailus@linux.intel.com>
 <4894ef52-71f5-c651-c45b-4788f0e24162@infradead.org>
 <20210208080108.GL32460@paasikivi.fi.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bbafe79a-0e3c-288b-d989-af4f26309854@infradead.org>
Date:   Mon, 8 Feb 2021 07:52:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208080108.GL32460@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/8/21 12:01 AM, Sakari Ailus wrote:
> Hi Randy,
> 
> On Fri, Feb 05, 2021 at 04:56:47PM -0800, Randy Dunlap wrote:
>> On 2/5/21 5:25 AM, Sakari Ailus wrote:
>>> Document the use of the _DSE object for setting desirable power state
>>> during probe.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
>>> ---
>>>  Documentation/firmware-guide/acpi/index.rst   |  1 +
>>>  .../firmware-guide/acpi/low-power-probe.rst   | 69 +++++++++++++++++++
>>>  2 files changed, 70 insertions(+)
>>>  create mode 100644 Documentation/firmware-guide/acpi/low-power-probe.rst
>>>
>>
>>> diff --git a/Documentation/firmware-guide/acpi/low-power-probe.rst b/Documentation/firmware-guide/acpi/low-power-probe.rst
>>> new file mode 100644
>>> index 0000000000000..b96804d959a6c
>>> --- /dev/null
>>> +++ b/Documentation/firmware-guide/acpi/low-power-probe.rst
>>> @@ -0,0 +1,69 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +======================================
>>> +Probing I²C devices in low power state
>>> +======================================
>>> +
>>> +Introduction
>>> +============
>>> +
>>> +In some cases it may be preferred to leave certain devices powered off for the
>>> +entire system bootup if powering on these devices has adverse side effects,
>>> +beyond just powering on the said device.
>>> +
>>> +How it works
>>> +============
>>>
>>
>> Hi,
>>
>> Please don't use ============ underlines for all section levels.
> 
> The sections under the title are intended to be on the same level.
> 

Oops. My bad. Sorry about that.

-- 
~Randy

