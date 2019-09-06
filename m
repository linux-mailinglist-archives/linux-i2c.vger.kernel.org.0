Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E316AB8FB
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2019 15:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392950AbfIFNNI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Sep 2019 09:13:08 -0400
Received: from mga06.intel.com ([134.134.136.31]:52549 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727914AbfIFNNI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Sep 2019 09:13:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Sep 2019 06:13:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; 
   d="scan'208";a="267358344"
Received: from mylly.fi.intel.com (HELO [10.237.72.68]) ([10.237.72.68])
  by orsmga001.jf.intel.com with ESMTP; 06 Sep 2019 06:13:05 -0700
Subject: Re: [PATCH] i2c: designware-pci: Remove needless pci_set_master()
 call
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20190906124029.25406-1-jarkko.nikula@linux.intel.com>
 <20190906124358.GL18521@lahna.fi.intel.com>
 <9e1c4015-f99e-ac3c-3dad-0cf10522dee6@linux.intel.com>
 <87r24t37b7.fsf@gmail.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <fc5ebf99-ede5-ed5b-7549-332029f7880e@linux.intel.com>
Date:   Fri, 6 Sep 2019 16:13:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87r24t37b7.fsf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/6/19 4:03 PM, Felipe Balbi wrote:
> Jarkko Nikula <jarkko.nikula@linux.intel.com> writes:
> 
>> On 9/6/19 3:43 PM, Mika Westerberg wrote:
>>> On Fri, Sep 06, 2019 at 03:40:29PM +0300, Jarkko Nikula wrote:
>>>> I failed to notice the pci_set_master() call is needless in the
>>>> commit 21aa3983d619 ("i2c: designware-pci: Switch over to MSI interrupts")
>>>> due the fact driver don't support DMA.
>>>
>>> Hmm, MSI still needs bus mastering to be enabled, no?
>>>
>> At least Documentation/PCI/msi-howto.rst doesn't mention it and I think
>> I saw some commit adding MSI support without pci_set_master() but I'll
>> dig more.
> 
> Read PCI documentation (see attached)
> 
Thanks, that explains it. So please drop this patch.

-- 
Jarkko
