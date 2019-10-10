Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1840D33BF
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2019 00:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbfJJWEC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Oct 2019 18:04:02 -0400
Received: from mga17.intel.com ([192.55.52.151]:36272 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726983AbfJJWEC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Oct 2019 18:04:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Oct 2019 15:04:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,281,1566889200"; 
   d="scan'208";a="184560498"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148]) ([10.7.153.148])
  by orsmga007.jf.intel.com with ESMTP; 10 Oct 2019 15:04:00 -0700
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
To:     Tao Ren <taoren@fb.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Cedric Le Goater <clg@kaod.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
 <3ea1c0d5-47f1-bf8c-6b2d-2ea8d3f93471@fb.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <637d4b8b-5113-b07b-f99f-ce66dbe6948c@linux.intel.com>
Date:   Thu, 10 Oct 2019 15:04:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3ea1c0d5-47f1-bf8c-6b2d-2ea8d3f93471@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/10/2019 2:20 PM, Tao Ren wrote:
> On 10/9/19 2:20 PM, Jae Hyun Yoo wrote:
[...]
>>   		/*
>>   		 * If a peer master starts a xfer immediately after it queues a
>> -		 * master command, change its state to 'pending' then H/W will
>> -		 * continue the queued master xfer just after completing the
>> -		 * slave mode session.
>> +		 * master command, clear the queued master command and change
>> +		 * its state to 'pending'. To simplify handling of pending
>> +		 * cases, it uses S/W solution instead of H/W command queue
>> +		 * handling.
>>   		 */
>>   		if (unlikely(irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH)) {
>> +			writel(readl(bus->base + ASPEED_I2C_CMD_REG) &
>> +				~ASPEED_I2CD_MASTER_CMDS_MASK,
>> +			       bus->base + ASPEED_I2C_CMD_REG);
> 
> Sorry for the late comments (just noticed this line while testing the patch):
> 
> I assume this line is aimed at stopping the running master commands, but as per
> AST2500 datasheet, it's NOP to write 0 to MASTER_STOP/MASTER_RX/MASTER_TX bits.
> Maybe all we need is writing 1 to MASTER_STOP field?

There could be two pending cases:
1. Master goes to pending before it triggers a command if a slave
    operation is already initiated.
2. Master goes to pending after it triggered a command if a peer
    master immediately sends something just after the master command
    triggering.

Above code is for the latter case. H/W handles the case priority based
so the slave event will be handled first, and then the master command
will be handled when the slave operation is completed. Problem is,
this H/W shares the same buffer for master and slave operations so
it's unreliable. Above code just removes the master command from the
command register to prevent this H/W command handling of pending events.
Instead, it restarts the master command using a call of 
aspeed_i2c_do_start when the slave operation is completed.

Thanks,

Jae
