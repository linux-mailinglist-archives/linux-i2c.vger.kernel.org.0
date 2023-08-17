Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7BC77F970
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 16:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346003AbjHQOly (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 10:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352199AbjHQOln (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 10:41:43 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AADD835B6;
        Thu, 17 Aug 2023 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692283198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7LyoCUBAc7o5T+dm0L2sI/suKq65mYLXZo6F0fpk478=;
        b=hQjIg8p5nDJPDhsMTyeNkB2zh6z2b5JN3080gcJN3SbFYM1EjQdp1EcsyKBSLPnyNxtc/Y
        /PZHE0fTjCWLwEeYp2kno7hGUxUfwOva2rZ8cwwuEvJKkt0e48o5HVxcC9bi6yEcB7qJGL
        zmNZtNO5El1x8NiP4jsMizu/CvhOFMc=
Received: from [192.168.43.126] (hen56-1_migr-78-240-185-16.fbx.proxad.net [78.240.185.16])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id ab2025cd (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Thu, 17 Aug 2023 14:39:58 +0000 (UTC)
Message-ID: <c4558640-58b7-7c56-b164-403333405b09@sionneau.net>
Date:   Thu, 17 Aug 2023 16:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] i2c: designware: fix __i2c_dw_disable in case master
 is holding SCL low
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>,
        Jonathan Borne <jborne@kalray.eu>
References: <20230811124624.12792-1-yann@sionneau.net>
 <ZNY+vyEsM/kNKgHt@smile.fi.intel.com>
From:   Yann Sionneau <yann@sionneau.net>
In-Reply-To: <ZNY+vyEsM/kNKgHt@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Le 11/08/2023 à 15:59, Andy Shevchenko a écrit :
> On Fri, Aug 11, 2023 at 02:46:23PM +0200, Yann Sionneau wrote:
>> From: Yann Sionneau <ysionneau@kalray.eu>
>>
>> The designware IP can be synthesized with the IC_EMPTYFIFO_HOLD_MASTER_EN
> DesignWare
Ack!
>
>> parameter.
>> In which case, if the TX FIFO gets empty and the last command didn't have
> "In this case when the..."
Ack!
>
>> the STOP bit (IC_DATA_CMD[9]), the dw_apb_i2c will hold SCL low until
> "the controller will..."
Ack!
>
>> a new command is pushed into the TX FIFO or the transfer is aborted.
>>
>> When the dw_apb_i2c is holding SCL low, it cannot be disabled.
> "When the controller..."
Ack!
>
>> The transfer must first be aborted.
>> Also, the bus recover won't work because SCL is held low by the master.
>>
>> This patch checks if the master is holding SCL low in __i2c_dw_disable
> Grep for "This patch" in the Submitting Patches document and fix this
> accordingly.
Ok I didn't know, ack!
>
> __i2c_dw_disable()
>
>> before trying to disable the IP.
>> If SCL is held low, an abort is initiated.
>> When the abort is done, the disabling can then proceed.
>>
>> This whole situation can happen for instance during SMBUS read data block
>> if the slave just responds with "byte count == 0".
>> This puts the master in an unrecoverable state, holding SCL low and the
>> current __i2c_dw_disable procedure is not working. In this situation
> __i2c_dw_disable()
>
>> only a Linux reboot can fix the i2c bus.
> If reboot helps, what magic does it do that Linux OS can't repeat in software?
> Please, elaborate more.
Sorry I was not very clear. In fact I meant a SoC reset, not a Linux 
reboot. It's just that on our SoC with boot-from-flash a reset will also 
reboot the Linux. But indeed what fixes the issue is the reset of the SoC.
>
> ...
>
>>   	int timeout = 100;
>>   	u32 status;
>> +	u32 raw_intr_stats;
>> +	u32 enable;
>> +	bool abort_needed;
>> +	bool abort_done = false;
> Perhaps reversed xmas tree order?
Oh, I didn't know about this, thanks, ack!
>
> 	bool abort_done = false;
> 	bool abort_needed;
> 	u32 raw_intr_stats;
> 	int timeout = 100;
> 	u32 status;
> 	u32 enable;
>
> ...
>
>> +	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
>> +	if (abort_needed)
>> +		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
>>   
>>   	do {
>> +		if (abort_needed && !abort_done) {
>> +			regmap_read(dev->map, DW_IC_ENABLE, &enable);
>> +			abort_done = !(enable & DW_IC_ENABLE_ABORT);
>> +			continue;
> This will exhaust the timeout and below can be run at most once,
> is it a problem?
I was also wondering about this... I can propose to extract this in 2 
loops. First loop to wait for the abort to finish, with its own timeout. 
Then the untouched second loop that waits for the disabling to finish.
>
> Also it's a tight busyloop, are you sure it's what you need?

I don't know, I would expect that this would not take much time, I 
already have a V2 for this patch with all your remarks taken into 
account, including the splitting into 2 loops (previous comment).

I am waiting before sending it to have the opportunity to test it on the 
real device, it will be done on the August 21st since I am in holidays 
for now.

I will print the number of iterations it takes for the abort to finish. 
If the abort is quick, maybe there is no need for sleeping. I didn't see 
any info about the time it takes inside the IP documentation.

Thanks for the review!

I'll get back to you when I have done the testing of the V2 patch :) (or 
maybe you want it on the mailing list now as an RFC ?)

-- 

Yann

