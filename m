Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED50D20E710
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 00:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgF2Vx2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 17:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404632AbgF2VxZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jun 2020 17:53:25 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E46C03E979
        for <linux-i2c@vger.kernel.org>; Mon, 29 Jun 2020 14:53:25 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 49wh7m53Rmz1rsNT;
        Mon, 29 Jun 2020 23:53:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 49wh7m4F6pz1qqkJ;
        Mon, 29 Jun 2020 23:53:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id vjlnCj95nPGs; Mon, 29 Jun 2020 23:53:23 +0200 (CEST)
X-Auth-Info: cJt5ZAtmO1/Wy4lUp2JczDvqLm6dDItL2BW4j/P6GDA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 29 Jun 2020 23:53:23 +0200 (CEST)
Subject: Re: [PATCH 4/5] i2c: xiic: Switch from waitqueue to completion
To:     Raviteja Narayanam <rna@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-4-marex@denx.de>
 <MWHPR0201MB3484AB3D1AB03068D56B18E9CA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
 <a2da37c2-f2b1-d961-81be-4c320f0ddb9a@denx.de>
 <SN4PR0201MB34863D361821EE403530A9CFCA6E0@SN4PR0201MB3486.namprd02.prod.outlook.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <21266683-095d-b8b7-6a23-62a07db846cb@denx.de>
Date:   Mon, 29 Jun 2020 23:52:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <SN4PR0201MB34863D361821EE403530A9CFCA6E0@SN4PR0201MB3486.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/29/20 2:53 PM, Raviteja Narayanam wrote:

Hi,

[...]

>>>> @@ -703,23 +704,24 @@ static int xiic_xfer(struct i2c_adapter *adap,
>>>> struct i2c_msg *msgs, int num)
>>>>  	err = xiic_start_xfer(i2c, msgs, num);
>>>>  	if (err < 0) {
>>>>  		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
>>>> -		goto out;
>>>> +		return err;
>>>>  	}
>>>>
>>>> -	if (wait_event_timeout(i2c->wait, (i2c->state == STATE_ERROR) ||
>>>> -		(i2c->state == STATE_DONE), HZ)) {
>>>> -		mutex_lock(&i2c->lock);
>>>> -		err = (i2c->state == STATE_DONE) ? num : -EIO;
>>>> -		goto out;
>>>> -	} else {
>>>> -		mutex_lock(&i2c->lock);
>>>> +	err = wait_for_completion_interruptible_timeout(&i2c->completion,
>>>> +							XIIC_I2C_TIMEOUT);
>>>
>>> This is causing random lock up of bus. Since it is "interruptible"
>>> API,  once we enter Ctrl+C, It is coming out of wait state, the message
>> pointers are made NULL and the ongoing transaction is not completed.
>>> Can use " wait_for_completion_timeout" API in place of this.
>>>
>>>> +	mutex_lock(&i2c->lock);
>>
>> So in case this is interrupted, we would have to somehow reset the controller ?
> 
> Yes, but the cleanup is not straight forward because we do not know the exact state
> Of controller and the I2C bus. That’s why preferring a non-interruptible API.

Ah, right, that makes sense, thanks.

>> What sort of lockups do you see exactly ? 
> 
> There is an i2ctransfer going on (let's say a read of 255 bytes), we get interrupt everytime the Rx FIFO is full.
> While the controller is receiving data, if there is a signal, this is exiting abruptly and there is no STOP condition
> on the bus. So, no master can communicate on that bus further. 
> 
> Can you share some sort of test case,
>> so I can replicate it ?
> 
> I have 3 scripts running with commands like below, and I am randomly giving Ctrl+C.

OK, thanks.
