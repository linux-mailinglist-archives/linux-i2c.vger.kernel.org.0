Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A01478C0E2
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Aug 2023 11:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234303AbjH2JCD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Aug 2023 05:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234378AbjH2JB4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Aug 2023 05:01:56 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0514107;
        Tue, 29 Aug 2023 02:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1693299709;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=enNMWrefHR+UVXg2TD1VzcTqWSNIgCW2PLkCOpY+hDY=;
        b=kJyFwwXxQtr788Yy06gQm27MSUBsbHvOOgHhPIeH3vxi4aUeBTlCTJSCLWF8PujTF9Z3C9
        YMb9boAkONkv9/OeiIvDdyTTGfrKbjUQImAymMg69znNF1EMRWxHSrnlKxyA7YB0W8l0sc
        uwXtL/hfJy6LEg5Xv0vnEiUAuN3Vy18=
Received: from [192.168.1.18] (91-171-21-26.subs.proxad.net [91.171.21.26])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 80c32b59 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Tue, 29 Aug 2023 09:01:49 +0000 (UTC)
Message-ID: <055a2e15-58e0-9644-3779-75ba1d2d14be@sionneau.net>
Date:   Tue, 29 Aug 2023 11:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] i2c: designware: fix __i2c_dw_disable() in case master
 is holding SCL low
Content-Language: en-US
To:     Yann Sionneau <ysionneau@kalrayinc.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Borne <jborne@kalray.eu>
References: <20230822090233.14885-1-ysionneau@kalray.eu>
 <2f215e0f-c2ed-4300-8b75-1949f17cdf1c@linux.intel.com>
 <89e54d6a-9105-bf6a-72bb-fd9e0fb7b2f8@kalrayinc.com>
From:   Yann Sionneau <yann@sionneau.net>
In-Reply-To: <89e54d6a-9105-bf6a-72bb-fd9e0fb7b2f8@kalrayinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Le 22/08/2023 à 12:28, Yann Sionneau a écrit :
> Hi,
>
> On 8/22/23 12:14, Jarkko Nikula wrote:
>> Hi
>>
>> On 8/22/23 12:02, Yann Sionneau wrote:
>>> The DesignWare IP can be synthesized with the 
>>> IC_EMPTYFIFO_HOLD_MASTER_EN
>>> parameter.
>>> In this case, when the TX FIFO gets empty and the last command 
>>> didn't have
>>> the STOP bit (IC_DATA_CMD[9]), the controller will hold SCL low until
>>> a new command is pushed into the TX FIFO or the transfer is aborted.
>>>
>>> When the controller is holding SCL low, it cannot be disabled.
>>> The transfer must first be aborted.
>>> Also, the bus recovery won't work because SCL is held low by the 
>>> master.
>>>
>>> Check if the master is holding SCL low in __i2c_dw_disable() before 
>>> trying
>>> to disable the controller. If SCL is held low, an abort is initiated.
>>> When the abort is done, then proceed with disabling the controller.
>>>
>>> This whole situation can happen for instance during SMBus read data 
>>> block
>>> if the slave just responds with "byte count == 0".
>>> This puts the driver in an unrecoverable state, because the 
>>> controller is
>>> holding SCL low and the current __i2c_dw_disable() procedure is not
>>> working. In this situation only a SoC reset can fix the i2c bus.
>>>
>> Is this fixed already by the commit 69f035c480d7 ("i2c: designware: 
>> Handle invalid SMBus block data response length value")?
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git/commit/?h=i2c/for-next&id=69f035c480d76f12bf061148ccfd578e1099e5fc 
>>
>
> Indeed the bug that I am having is fixed by 
> 69f035c480d76f12bf061148ccfd578e1099e5fc
>
> Meaning that thanks to 69f035c receiving a SMBus byte count of 0 won't 
> put the controller into a state where the completion will timeout and 
> it will need to start a recovery that will fail and then a controller 
> disabling that will also fail.
>
> But, still, the disabling procedure is wrong, it lacks the abort part 
> (in case SCL is held low).
>
> What my patch does, is fixing the disabling procedure. So that - for 
> example - even without 69f035c, the controller will timeout when 
> receiving byte count of 0, triggering the "disabling" procedure which 
> will work to recover the bus.
>
> My patch fixes the general disabling code, that could be triggered by 
> the bug fixed by 69f035c but also by any other bug really.
>
> Speaking of 69f035c btw ... I am really wondering if it's the best 
> fix, because it will lie to the kernel saying "we have byte count of 
> 1, read another byte" to trigger a read with STOP bit set so that the 
> transfer does finish and the controller does not timeout. But to do 
> this it will do an extra spurious byte read.
>
> I propose another approach that will acknowledge that "we are in a bad 
> condition" and directly abort the transfer without doing an extra 
> read: https://marc.info/?l=linux-i2c&m=169175828013532&w=2
>
> I hope my answer to your question is clear enough... English is not my 
> native language.
>
> Regards,
>
Is this any clearer?

Also, what do you think about my remarks on 69f035c?

Regards,

-- 

Yann

