Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7F72513BB
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 09:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgHYH7D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 03:59:03 -0400
Received: from mga06.intel.com ([134.134.136.31]:36014 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbgHYH7D (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 03:59:03 -0400
IronPort-SDR: B0bhI52qy+efavhpqZ1QjsgPZ0eY/PUpa+oR9VImXQtnmkKIg8HJokOuSZCBYSE8/gIX1IEtzl
 EFTlK669hj/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="217615541"
X-IronPort-AV: E=Sophos;i="5.76,351,1592895600"; 
   d="scan'208";a="217615541"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2020 00:59:02 -0700
IronPort-SDR: XRZqXFdVXwbyoa0eSbomAfxI64yOWNWo03VliYkXksLgxeAm93gJD8stXY2K/Kczs40dWZkxWR
 iOY0brt9/yzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,351,1592895600"; 
   d="scan'208";a="499220465"
Received: from mylly.fi.intel.com (HELO [10.237.72.187]) ([10.237.72.187])
  by fmsmga006.fm.intel.com with ESMTP; 25 Aug 2020 00:58:59 -0700
Subject: Re: [PATCH] i2c: Remove 'default n' from busses/Kconfig
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <20200820080525.2767120-1-jarkko.nikula@linux.intel.com>
 <20200825092809.2d826758@endymion> <20200825075100.GH1861@ninjato>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <eb9dd76f-6bcd-2237-6923-c13a3c8a7b96@linux.intel.com>
Date:   Tue, 25 Aug 2020 10:58:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825075100.GH1861@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/25/20 10:51 AM, Wolfram Sang wrote:
> 
>> Option I2C_STUB suffers from the same but uses a different syntax,
>> which may explain why you missed it.
>>
>> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
> I removed that one, too, and added your tag. Thanks!
> 
Ah, thanks! I was just going to send another patch removing it :-)

Jarkko
