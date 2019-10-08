Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB9AED039E
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2019 00:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbfJHWz1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Oct 2019 18:55:27 -0400
Received: from mga06.intel.com ([134.134.136.31]:53105 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbfJHWz1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Oct 2019 18:55:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Oct 2019 15:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,272,1566889200"; 
   d="scan'208";a="187449670"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148]) ([10.7.153.148])
  by orsmga008.jf.intel.com with ESMTP; 08 Oct 2019 15:55:25 -0700
Subject: Re: [PATCH 3/5] i2c: aspeed: fix master pending state handling
To:     Brendan Higgins <brendanhiggins@google.com>,
        Joel Stanley <joel@jms.id.au>, Wolfram Sang <wsa@the-dreams.de>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com>
 <20191008203157.GA184092@google.com>
 <ac256b3f-2a06-6fa5-72ab-d8f8014d253e@linux.intel.com>
 <CAFd5g47vLN6NyZR73+EqOqfOPnM7CkGGsCwEn3udnJt99d8KCg@mail.gmail.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <8533c682-47ae-2861-6587-19f2501cb0c8@linux.intel.com>
Date:   Tue, 8 Oct 2019 15:55:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g47vLN6NyZR73+EqOqfOPnM7CkGGsCwEn3udnJt99d8KCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/8/2019 2:54 PM, Brendan Higgins wrote:
> On Tue, Oct 8, 2019 at 2:13 PM Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> On 10/8/2019 1:31 PM, Brendan Higgins wrote:
>>> On Mon, Oct 07, 2019 at 04:13:11PM -0700, Jae Hyun Yoo wrote:
>>>> In case of master pending state, it should not trigger the master
>>>> command because this H/W is sharing the same data buffer for slave
>>>> and master operations, so this commit fixes the issue with making
>>>> the master command triggering happen when the state goes to active
>>>> state.
>>>
>>> nit: Makes sense, but can you explain what might happen without your
>>> change?
>>
>> If we don't use this fix, a master command could corrupt data in the
>> shared buffer if H/W is still on processing slave operation at the
>> timing.
> 
> Right, can you add that to the commit message?

Sure, will do that.

> Is this trivially reproducible? We might want to submit this
> separately as a bugfix.

It's very rarely observed.

> Actually yeah, can you send this separately as a bugfix? I think we
> might want to include this in 5.4.

Why not. I can send it separately but this patch series should wait for
merging the bug fix to avoid context conflicts.

> Wolfram and Joel, what do you think?
> 
