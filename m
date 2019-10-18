Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 842E9DCA51
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2019 18:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502397AbfJRQHu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Oct 2019 12:07:50 -0400
Received: from mga17.intel.com ([192.55.52.151]:59159 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502391AbfJRQHu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Oct 2019 12:07:50 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Oct 2019 09:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; 
   d="scan'208";a="199748833"
Received: from unknown (HELO [10.7.153.143]) ([10.7.153.143])
  by orsmga003.jf.intel.com with ESMTP; 18 Oct 2019 09:07:40 -0700
Subject: Re: AST2600 i2c irq issue
To:     Peter Rosin <peda@axentia.se>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <CACPK8XdqFkPgCQcgpM5C_YwfJ86Lmk=hG5zTcfbCDCMncXCJMg@mail.gmail.com>
 <f9fecc04-2a9a-4cbd-a1ff-ffb680b0fec2@linux.vnet.ibm.com>
 <dbb8635e-a95a-3951-cd65-3428adc461ec@linux.intel.com>
 <b2149b86-56c7-dee7-2ea7-49f8837534b0@axentia.se>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <672b0fd5-6b19-32e9-5c0a-3153732353d8@linux.intel.com>
Date:   Fri, 18 Oct 2019 09:07:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b2149b86-56c7-dee7-2ea7-49f8837534b0@axentia.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/17/2019 9:28 PM, Peter Rosin wrote:
> On 2019-10-18 00:29, Jae Hyun Yoo wrote:
>> On 10/17/2019 1:31 PM, Eddie James wrote:
>>> I was also able to "fix" this by simple returning IRQ_NONE if irq_status
>>> == 0 in the interrupt handler. But probably not a good solution.
>>
>> A fix like below, right?
>>
>> @@ -603,6 +603,9 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void
>> *dev_id)
>>
>>           spin_lock(&bus->lock);
>>           irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>> +       if (!irq_received)
>> +               return IRQ_NONE;
>> +
> 
> Don't forget spin_unlock(&bus->lock);

Ah, I missed that. Thanks for your pointing out.

Cheers,

Jae
