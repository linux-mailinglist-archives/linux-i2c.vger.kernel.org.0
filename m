Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812DE213942
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jul 2020 13:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgGCLVf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jul 2020 07:21:35 -0400
Received: from mga01.intel.com ([192.55.52.88]:35605 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726374AbgGCLVf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 Jul 2020 07:21:35 -0400
IronPort-SDR: M5v14p1woQHQFp+SHNmdrIfn2aX5Kt/PtWm7NlD1gO6pcK55Bq6bCoAB/zCf1cm/UzKqIp1bD2
 nniqYCCKOQGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="165197804"
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; 
   d="scan'208";a="165197804"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2020 04:21:35 -0700
IronPort-SDR: zZJdcdf/ZIZzX2VlNvLNUGgbUu8fpS3tce0x2rXTEoH9EyKSu5f9Pu3sUKrCCXuS3gpSgbvEkN
 TTdW1NmEOEQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; 
   d="scan'208";a="296186000"
Received: from mylly.fi.intel.com (HELO [10.237.72.153]) ([10.237.72.153])
  by orsmga002.jf.intel.com with ESMTP; 03 Jul 2020 04:21:31 -0700
Subject: Re: [PATCH v2] HID: i2c-hid: Use block reads when possible to save
 power
To:     Sultan Alsawaf <sultan@kerneltoast.com>
Cc:     aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com, jikos@kernel.org,
        kai.heng.feng@canonical.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org
References: <c4373272-e656-773c-dfd2-0efc4c53c92d@linux.intel.com>
 <20200616154951.3050-1-sultan@kerneltoast.com>
 <37ceaf7a-3421-e305-4355-a6b40ae54843@linux.intel.com>
 <20200629174328.GB1646@sultan-box.localdomain>
 <ef949533-c614-7afb-f206-5c54d827deac@linux.intel.com>
 <20200701150007.GA2141@sultan-book.localdomain>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <b3b751fc-668d-91e2-220b-0d7edd231e01@linux.intel.com>
Date:   Fri, 3 Jul 2020 14:18:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200701150007.GA2141@sultan-book.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 7/1/20 6:00 PM, Sultan Alsawaf wrote:
> On Wed, Jul 01, 2020 at 11:04:01AM +0300, Jarkko Nikula wrote:
>> On 6/29/20 8:43 PM, Sultan Alsawaf wrote:
>>> Hmm, for some reason in 5.8 I get the same problem, but 5.7 is fine. Could you
>>> try this on 5.7 and see if it works?
>>>
>>> In the meantime I'll bisect 5.8 to see why it's causing problems for me...
>>>
>> I see the same issue on top of v5.7:
> 
> Try reverting my "i2c: designware: Only check the first byte for SMBus block
> read length" patch and apply the following change instead:
> 
This combination (the diff and this HID patch) works on top of v5.7.

I tried also these other combinations:

v5.7
- HID patch + this diff -> ok
- HID patch -> not ok
- HID + acked i2c-dw patch -> acked i2c-dw patch doesn't apply

v5.8-rc3
- acked i2c-dw patch -> ok
- HID patch -> nok
- HID patch + acked i2c-dw patch -> nok
- HID patch + this diff -> diff doesn't apply

Hopefully gives some glue. I'll be out of office for a few weeks and 
unfortunately cannot test patches meanwhile.

Jarkko
