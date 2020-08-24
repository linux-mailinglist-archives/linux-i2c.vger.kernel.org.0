Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2EA524FD15
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Aug 2020 13:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgHXL6b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Aug 2020 07:58:31 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:53040 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgHXL63 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Aug 2020 07:58:29 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BZrHQ4dPjz1qs0n;
        Mon, 24 Aug 2020 13:58:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BZrHQ3vz4z1qxns;
        Mon, 24 Aug 2020 13:58:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id rS8J2cstlduL; Mon, 24 Aug 2020 13:58:25 +0200 (CEST)
X-Auth-Info: RsQ/V7EoCrKB0XA4gXIvcpGkg/YX2mSEQKW4H82Tuwc=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 24 Aug 2020 13:58:25 +0200 (CEST)
Subject: Re: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
To:     Raviteja Narayanam <rna@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>, Srinivas Goud <sgoud@xilinx.com>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-2-marex@denx.de>
 <MWHPR0201MB3484A9A018788EA755645D2DCA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
 <9897de5e-0539-8125-7b3f-41a1c98468ae@denx.de>
 <SN4PR0201MB348615BCD7E2C82DF7919303CA6E0@SN4PR0201MB3486.namprd02.prod.outlook.com>
 <7cc8420d-c3a4-079b-42fc-90ac6e875d37@denx.de>
 <SN4PR0201MB3486E5229B0E870E6336A969CA670@SN4PR0201MB3486.namprd02.prod.outlook.com>
 <a15a3e60-4738-3d38-fefb-c550dd0b0364@denx.de>
 <SN4PR0201MB3486CDCD30F78416D3325D2BCA560@SN4PR0201MB3486.namprd02.prod.outlook.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <1913c876-d7ec-6f66-e9eb-20b45a4afec4@denx.de>
Date:   Mon, 24 Aug 2020 13:58:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <SN4PR0201MB3486CDCD30F78416D3325D2BCA560@SN4PR0201MB3486.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/24/20 10:27 AM, Raviteja Narayanam wrote:

[...]

>>>>> So, this local_irq_save()/local_irq_restore() is not related to
>>>>> exclusive access in the driver (xiic_process vs xiic_start), but to
>>>>> supply the
>>>> byte count to controller before it completes transmitting START and
>>>> slave address.
>>>>
>>>> But then shouldn't the XIIC IP be fixed / extended with support for
>>>> such an atomic update instead ?
>>>
>>> I have started communicating with the hardware team on why the IP
>> behavior is like this.
>>
>> Any news from the hardware team ?
> 
> " The expectation from the IP is un interrupted read i.e the read command should be un interrupted and max delay expected is not more than 35-40 us provided IIC frequency is 100 Khz. Please check if we can manage this in Software. If delay is not managed enable iic control only after stop related data is received"
> That was the response as is. 
> The workaround suggested above is to enable the AXI I2C only after second register write(STOP bit info with read count) is completed. This is not generic, so we couldn't move forward.
> Our typical application scenario is like this "START WRITE, REPEATED START READ, STOP". So, we must enable AXI I2C before read count is sent.

So, if I understand it correctly, the XIIC IP is broken and cannot be
fixed in software reliably ? How shall we proceed then ?
