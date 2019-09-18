Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E39E7B6E80
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2019 22:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbfIRUwu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Sep 2019 16:52:50 -0400
Received: from foss.arm.com ([217.140.110.172]:49290 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727814AbfIRUwu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Sep 2019 16:52:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B3F31000;
        Wed, 18 Sep 2019 13:52:49 -0700 (PDT)
Received: from [192.168.0.21] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADD6D3F67D;
        Wed, 18 Sep 2019 13:52:47 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the driver-core tree
To:     gregkh@linuxfoundation.org, torvalds@linux-foundation.org
Cc:     broonie@kernel.org, wsa@the-dreams.de,
        mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190918170952.GT2596@sirena.co.uk>
 <20190918185257.GC1933777@kroah.com>
 <CAHk-=whreYmsU_AQtzDS5gd3yamYJ72gBo+YekYSyJLPQ1Qo-A@mail.gmail.com>
 <20190918190748.GA2014907@kroah.com>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <56d35d0e-ca17-56e8-38c6-e26acd527ee5@arm.com>
Date:   Wed, 18 Sep 2019 21:56:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20190918190748.GA2014907@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/18/2019 08:07 PM, Greg KH wrote:
> On Wed, Sep 18, 2019 at 12:03:17PM -0700, Linus Torvalds wrote:
>> On Wed, Sep 18, 2019 at 11:53 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>>>
>>> On Wed, Sep 18, 2019 at 06:09:52PM +0100, Mark Brown wrote:
>>>>
>>>> After merging the driver-core tree, today's linux-next build
>>>> for arm64 allmodconfig failed like this:
>>>
>>> Wait, I thought Linus said this fixup was now resolved.  What went
>>> wrong?
>>
>> I think this is purely a linux-next build failure.
>>
>> I do full allmodconfig builds between each merge I do, and what
>> happened is that as part of the LED merge, I removed the
>> no-longer-used 'i2c_acpi_find_match_adapter()' to resolve that build
>> warning.
>>
>> Then linux-next presumably merged my tree with the driver-core tree,
>> and that re-instated the use of i2c_acpi_find_match_adapter() - which
>> was now gone.
>>
>> But when *I* merged the driver-core tree, I did the merge fixup
>> correctly to actually re-instate not only the use, but also re-instate
>> the removed function that now had a use again.
>>
>>> Linus, should I submit a fix for this?
>>
>> My tree should be fine, and I really think this is just a temporary
>> linux-next effect from the above. I think linux-next only handled the
>> actual syntactic conflicts, not the semantic conflict of "function had
>> been removed to avoid build error from previous merge, and needed to
>> be brought back"
>>
>> Knock wood.
> 
> I looked at your merge of the driver core tree, and see that the
> "missing" function is now back.
> 
> And I did a test build here and all works for me, so I think this is ok,
> thanks for the fixup.
> 
> greg k-h
> 

Thanks for the fixup ! Apologies for the inconvenience

Suzuki
