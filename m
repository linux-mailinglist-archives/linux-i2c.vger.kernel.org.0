Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3B02A7A32
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Nov 2020 10:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbgKEJNU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Nov 2020 04:13:20 -0500
Received: from mga14.intel.com ([192.55.52.115]:42651 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729977AbgKEJNR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Nov 2020 04:13:17 -0500
IronPort-SDR: 2ED7vNkU99Du8Mdaw2saMbc1yhwDMLfYNaUwZ+P0mGQTBhnIzy2prhIRWXlFKvITnWkypvvBOG
 WRmKVjpUDZPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="168570020"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="168570020"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 01:13:16 -0800
IronPort-SDR: saLZF13o3718EDPN8QnqRPQAez5JZio9xxpQ58zhQwRNqy2QwRW4iaDKuuYZb0RBsSE+Y5Nl4H
 pUbY3VTvV/pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="471573991"
Received: from mylly.fi.intel.com (HELO [10.237.72.73]) ([10.237.72.73])
  by orsmga004.jf.intel.com with ESMTP; 05 Nov 2020 01:13:14 -0800
Subject: Re: [PATCH 2/2] i2c: designware: slave should do WRITE_REQUESTED
 before WRITE_RECEIVED
To:     Michael.Wu@vatics.com, wsa@kernel.org
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        morgan.chang@vatics.com
References: <20201030080420.28016-1-michael.wu@vatics.com>
 <20201030080420.28016-3-michael.wu@vatics.com> <20201103210349.GE1583@kunai>
 <5DB475451BAA174CB158B5E897FC1525B1295560@MBS07.vivotek.tw>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <815503b2-0124-b42e-be08-1f47e2dd0ee8@linux.intel.com>
Date:   Thu, 5 Nov 2020 11:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5DB475451BAA174CB158B5E897FC1525B1295560@MBS07.vivotek.tw>
Content-Type: text/plain; charset=big5; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/4/20 12:17 PM, Michael.Wu@vatics.com wrote:
> Hi Wolfram,
> 
>>> dev->status can be used to record the current state, especially Designware
>>> I2C controller has no interrupts to identify a write-request. This patch
>>
>> Just double-checking: the designware HW does not raise an interrupt when
>> its own address + RW bit has been received?
> 
> Not exactly. There're an interrupt state name "RD_REQ" but no one named
> like "WR_REQ".
> 
> For read-request, the slave will get a RD_REQ interrupt.
> For write-request, the slave won't be interrupted until data arrived to
> trigger interrupt "RX_FULL".
> 
> I tried to use GPIO to simulate an I2C master. I only sent its own
> address + W bit without any data and then I got only a STOP_DET interrupt.
> If I sent its own address + W bit + one byte data and then I got one
> RX_FULL and a STOP_DET.
> 
> It seems the controller doesn't interrupt when RW bit is W, but R does.
> What do you think, Jarkko?
> 
Yes, the datasheet has a flowchart for slave mode and it shows for a 
write only RX_FULL interrupt followed by read from IC_DATA_CMD to 
retrieve received byte. Which I believe won't occur if there is no 
incoming data byte and only STOP_DET happens as you have observed. The 
flowchart however doesn't include the STOP_DET flow.

Jarkko
