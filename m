Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7A530A951
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 15:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbhBAOFb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 09:05:31 -0500
Received: from mga12.intel.com ([192.55.52.136]:7453 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231778AbhBAOFa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Feb 2021 09:05:30 -0500
IronPort-SDR: M5jvLr1n6H/PYPov8q7YDBctPmb8M5zle+OZWjhCG/fkJDdrfyRx/RNoWrLgCK73BthttxlERr
 BHlWKtE1yQig==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="159855700"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="159855700"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 06:02:52 -0800
IronPort-SDR: zbcZ3BtmV8u1/LzUfbU5PXrxMj1+5+w5MrQlg/3t2zSM+OcztEAkJtdGZbw8Ra814Qzxi+C9Ms
 KAukZzPuFj1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="479075591"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2021 06:02:49 -0800
Subject: Re: [PATCH] i2c: i801: Add support for Intel Alder Lake PCH-P
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <20210114143811.1820137-1-jarkko.nikula@linux.intel.com>
 <20210128085943.GD963@ninjato>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <70c0c886-f8bb-1179-3bb9-f805ac7f4800@linux.intel.com>
Date:   Mon, 1 Feb 2021 16:02:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128085943.GD963@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/28/21 10:59 AM, Wolfram Sang wrote:
> On Thu, Jan 14, 2021 at 04:38:11PM +0200, Jarkko Nikula wrote:
>> Add PCI ID of SMBus controller on Intel Alder Lake PCH-P.
>>
>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> 
> Do we still update Documentation/i2c/busses/i2c-i801.rst?
> 
Actually need to avoid patching it and Kconfig for each new chipset 
variant and make them shorter was my motivation behind commit 
80d943ab19e9 ("i2c: i801: Consolidate chipset names in documentation and 
Kconfig").

Here Alder Lake name was added by the commit 332fdaebb64e ("i2c: i801: 
Add support for Intel Alder Lake PCH-S").

> And maybe we should add Jarkko as i801 maintainer because Jean is usually
> fine with such changes?
> 
I'm not sure am I up to the task? Meaning I don't feel I know it so 
well. I've been mostly adding new PCI IDs to new platforms.

Jarkko
