Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 256F3103CFD
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2019 15:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbfKTOJn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Nov 2019 09:09:43 -0500
Received: from mga14.intel.com ([192.55.52.115]:22232 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727794AbfKTOJn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Nov 2019 09:09:43 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Nov 2019 06:09:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; 
   d="scan'208";a="259044815"
Received: from mylly.fi.intel.com (HELO [10.237.72.65]) ([10.237.72.65])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Nov 2019 06:09:41 -0800
Subject: Re: [PATCH v1] i2c: i801: Correct Intel Jasper Lake PCH naming
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
References: <20191107105529.22825-1-andriy.shevchenko@linux.intel.com>
 <5f1cc181-c45e-bea2-f466-f9db9276335f@linux.intel.com>
Message-ID: <1ef8d354-d5dc-19b6-206c-f07519323965@linux.intel.com>
Date:   Wed, 20 Nov 2019 16:09:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5f1cc181-c45e-bea2-f466-f9db9276335f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy

On 11/7/19 1:29 PM, Jarkko Nikula wrote:
>> diff --git a/drivers/i2c/busses/i2c-i801.c 
>> b/drivers/i2c/busses/i2c-i801.c
>> index df02040d36d5..2de184bbd21f 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -67,7 +67,7 @@
>>    * Comet Lake-H (PCH)        0x06a3    32    hard    yes    yes    yes
>>    * Elkhart Lake (PCH)        0x4b23    32    hard    yes    yes    yes
>>    * Tiger Lake-LP (PCH)        0xa0a3    32    hard    yes    yes    yes
>> - * Jasper Lake-N (PCH)        0x4da3    32    hard    yes    yes    yes
>> + * Jasper Lake (PCH)        0x4da3    32    hard    yes    yes    yes
>>    *
> Let's crosscheck this first. The spec version I have explicitly says 
> Jasper Lake -N and I wanted to carry it forward in case there is another 
> version in the future.
> 
Would you like to send an update to this? I can do it also.

As we were told it's Jasper Lake *SoC* so also 
drivers/i2c/busses/Kconfig and Documentation/i2c/busses/i2c-i801.rst 
should be updated accordingly.

Jarkko
