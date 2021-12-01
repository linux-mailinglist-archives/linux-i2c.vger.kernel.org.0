Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B9C464D16
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Dec 2021 12:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243832AbhLALjA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Dec 2021 06:39:00 -0500
Received: from mga11.intel.com ([192.55.52.93]:46333 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243700AbhLALi7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Dec 2021 06:38:59 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="233942572"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; 
   d="scan'208";a="233942572"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 03:35:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; 
   d="scan'208";a="512667219"
Received: from mylly.fi.intel.com (HELO [10.237.72.148]) ([10.237.72.148])
  by orsmga008.jf.intel.com with ESMTP; 01 Dec 2021 03:35:35 -0800
Subject: Re: [PATCH v1 1/2] i2c: designware-pci: Add support for Fast Mode
 Plus and High Speed Mode
To:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Senthil, Bala" <bala.senthil@intel.com>,
        "N, Pandith" <pandith.n@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
References: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
 <YaUGV3lEmW9qtP+3@kunai>
 <042d2c9f-4333-44b1-09c0-b0953a51c176@linux.intel.com>
 <DM6PR11MB36609A77B3F5D7730FA16A52C4689@DM6PR11MB3660.namprd11.prod.outlook.com>
 <4a420cc0-d18a-32db-ed58-f611336c99ec@linux.intel.com>
 <Yac0JgqrEdUJcfsf@ninjato>
 <DM6PR11MB366003BA82D2A65F60D3AF4BC4689@DM6PR11MB3660.namprd11.prod.outlook.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <691f1f59-5f6e-14b5-7607-38b91c23e149@linux.intel.com>
Date:   Wed, 1 Dec 2021 13:35:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB366003BA82D2A65F60D3AF4BC4689@DM6PR11MB3660.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/1/21 11:39 AM, D, Lakshmi Sowjanya wrote:
> 
> 
>> -----Original Message-----
>> From: Wolfram Sang <wsa@kernel.org>
>> Sent: Wednesday, December 1, 2021 2:07 PM
>> To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> Cc: D, Lakshmi Sowjanya <lakshmi.sowjanya.d@intel.com>; linux-
>> i2c@vger.kernel.org; linux-kernel@vger.kernel.org; Senthil, Bala
>> <bala.senthil@intel.com>; N, Pandith <pandith.n@intel.com>; Andy
>> Shevchenko <andriy.shevchenko@linux.intel.com>; Saha, Tamal
>> <tamal.saha@intel.com>
>> Subject: Re: [PATCH v1 1/2] i2c: designware-pci: Add support for Fast Mode
>> Plus and High Speed Mode
>>
>>
>>> See the comments from Andy. Recent enough Elkhart Lake BIOS and his
>>> patches from last year already provide the timing parameters. Feeling
>>> embarrassed I forgot them :-(
>>
>> But the u16 conversion of the existing parameters is still useful?
> 
> Jarkko: I've seen the changes by Andy. These patches are no more required as suggested. I'm following up on the same, regarding ACPI table entries.
> 
> I have the same query...is the u16 conversion of existing parameters still useful?
> 
Yes, that's useful.

Jarkko
