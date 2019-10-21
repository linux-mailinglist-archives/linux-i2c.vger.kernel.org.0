Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6F18DF505
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2019 20:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfJUS1X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 14:27:23 -0400
Received: from mga14.intel.com ([192.55.52.115]:32220 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726955AbfJUS1X (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Oct 2019 14:27:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 11:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,324,1566889200"; 
   d="scan'208";a="209421613"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143]) ([10.7.153.143])
  by orsmga002.jf.intel.com with ESMTP; 21 Oct 2019 11:27:23 -0700
Subject: Re: AST2600 i2c irq issue
To:     Wolfram Sang <wsa@the-dreams.de>,
        Eddie James <eajames@linux.ibm.com>,
        Peter Rosin <peda@axentia.se>
Cc:     Ryan Chen <ryan_chen@aspeedtech.com>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
References: <CACPK8XdqFkPgCQcgpM5C_YwfJ86Lmk=hG5zTcfbCDCMncXCJMg@mail.gmail.com>
 <f9fecc04-2a9a-4cbd-a1ff-ffb680b0fec2@linux.vnet.ibm.com>
 <dbb8635e-a95a-3951-cd65-3428adc461ec@linux.intel.com>
 <8c62b118777c44d1bf8e1a3c32175644@TWMBX02.aspeed.com>
 <20191021121629.GE1145@ninjato>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <cdc01cea-57a3-3b54-e3a1-44088c9120ed@linux.intel.com>
Date:   Mon, 21 Oct 2019 11:27:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021121629.GE1145@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/21/2019 5:16 AM, Wolfram Sang wrote:
> 
>>           spin_lock(&bus->lock);
>>           irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>> +       if (!irq_received)
>> +               return IRQ_NONE;
>> +
>>           /* Ack all interrupts except for Rx done */
>>           writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>>                  bus->base + ASPEED_I2C_INTR_STS_REG);
>>
>>
>> I think it's a right fix for the issue. At least, we need to prevent
>> any driver state corruption. The state machine would run correctly if
>> we filtering the garbage interrupt out.
> 
> Just unlock the spinlock before you return...

Thanks Wolfram!

Peter also pointed it out, and Eddie made a patch which includes the
spin_unlock.

Hi Eddie,
Can you please submit your patch into 'i2c-next' upstream?

Thanks,

Jae
