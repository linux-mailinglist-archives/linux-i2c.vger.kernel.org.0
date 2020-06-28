Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8211820CB1A
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 01:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgF1Xml (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Jun 2020 19:42:41 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:49578 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgF1Xmk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Jun 2020 19:42:40 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 49w6cH0bXLz1rxwk;
        Mon, 29 Jun 2020 01:42:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 49w6cH00RHz1qw6s;
        Mon, 29 Jun 2020 01:42:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id QiyCk-68Ueeh; Mon, 29 Jun 2020 01:42:37 +0200 (CEST)
X-Auth-Info: DF3ryrF3GXdMlyIxbVKV4D81eBV3SOHNhvEskISZt4c=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 29 Jun 2020 01:42:37 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 4/5] i2c: xiic: Switch from waitqueue to completion
To:     Raviteja Narayanam <rna@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-4-marex@denx.de>
 <MWHPR0201MB3484AB3D1AB03068D56B18E9CA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
Message-ID: <a2da37c2-f2b1-d961-81be-4c320f0ddb9a@denx.de>
Date:   Mon, 29 Jun 2020 01:41:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <MWHPR0201MB3484AB3D1AB03068D56B18E9CA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/26/20 2:13 PM, Raviteja Narayanam wrote:

Hi,

[...]

>> @@ -703,23 +704,24 @@ static int xiic_xfer(struct i2c_adapter *adap, struct
>> i2c_msg *msgs, int num)
>>  	err = xiic_start_xfer(i2c, msgs, num);
>>  	if (err < 0) {
>>  		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
>> -		goto out;
>> +		return err;
>>  	}
>>
>> -	if (wait_event_timeout(i2c->wait, (i2c->state == STATE_ERROR) ||
>> -		(i2c->state == STATE_DONE), HZ)) {
>> -		mutex_lock(&i2c->lock);
>> -		err = (i2c->state == STATE_DONE) ? num : -EIO;
>> -		goto out;
>> -	} else {
>> -		mutex_lock(&i2c->lock);
>> +	err = wait_for_completion_interruptible_timeout(&i2c->completion,
>> +							XIIC_I2C_TIMEOUT);
> 
> This is causing random lock up of bus. Since it is "interruptible" API,  once we enter Ctrl+C, 
> It is coming out of wait state, the message pointers are made NULL and the ongoing transaction is not completed. 
> Can use " wait_for_completion_timeout" API in place of this.
> 
>> +	mutex_lock(&i2c->lock);

So in case this is interrupted, we would have to somehow reset the
controller ? What sort of lockups do you see exactly ? Can you share
some sort of test case, so I can replicate it ?

Thanks

[...]
