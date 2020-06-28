Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7185C20CB19
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 01:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgF1Xmi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Jun 2020 19:42:38 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:57484 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgF1Xmi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Jun 2020 19:42:38 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 49w6cC54ySz1qsZt;
        Mon, 29 Jun 2020 01:42:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 49w6cC3vCmz1qw6s;
        Mon, 29 Jun 2020 01:42:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id yADMSww06-BB; Mon, 29 Jun 2020 01:42:34 +0200 (CEST)
X-Auth-Info: wZC4d6+NCKK7l4ijJtb7Ey0IEBRY2CK8Ola9ReYXHLs=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 29 Jun 2020 01:42:34 +0200 (CEST)
Subject: Re: [PATCH 1/5] i2c: xiic: Fix broken locking on tx_msg
To:     Raviteja Narayanam <rna@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20200613150751.114595-1-marex@denx.de>
 <MWHPR0201MB348439A109964704D30EF0B4CA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <fee2d0a5-138d-fc31-ed46-348706bc0491@denx.de>
Date:   Mon, 29 Jun 2020 01:18:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <MWHPR0201MB348439A109964704D30EF0B4CA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/26/20 2:11 PM, Raviteja Narayanam wrote:

Hi,

[...]

>> @@ -699,14 +708,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct
>> i2c_msg *msgs, int num)
>>  	if (err < 0)
>>  		return err;
>>
>> -	err = xiic_busy(i2c);
>> -	if (err)
>> -		goto out;
>> -
>> -	i2c->tx_msg = msgs;
>> -	i2c->nmsgs = num;
> 
> On an SMP system with multiple i2c-transfer command scripts running, the above critical section is expected to cause serious trouble overwriting the previous msg pointers.
> But that's not happening as the i2c-core is having a lock at adapter level inside i2c-core-base.c (rt_mutex_lock_nested).
> So, the race condition between different threads is not possible. They are all serialized by the locking in i2c-core.
> 
> Although no issues are seen in the tests, the contention within the driver is still possible (isr vs xiic_xfer), if there is a spurious interrupt. And this patch is needed in that case.
The contention happens between the threaded interrupt handler
xiic_process() and this xiic_xfer() function. While you can not have
xiic_xfer() running on two CPU cores at the same time, you can have
xiic_xfer() running on one CPU core and xiic_process() on another CPU
core, and that will lead to problems.

[...]
