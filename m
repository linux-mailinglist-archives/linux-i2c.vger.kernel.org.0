Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4FA924A51D
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Aug 2020 19:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbgHSRmH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Aug 2020 13:42:07 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:58053 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbgHSRmG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Aug 2020 13:42:06 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BWw8D11yQz1qql5;
        Wed, 19 Aug 2020 19:42:04 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BWw8D0Vqzz1qsnq;
        Wed, 19 Aug 2020 19:42:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id utomrqPRfxIG; Wed, 19 Aug 2020 19:42:03 +0200 (CEST)
X-Auth-Info: g9O9my6ZMK4Z2Eo1T6+gVnCUmL/TLto052puck+nhl0=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 19 Aug 2020 19:42:02 +0200 (CEST)
Subject: Re: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
To:     Raviteja Narayanam <rna@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-2-marex@denx.de>
 <MWHPR0201MB3484A9A018788EA755645D2DCA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
 <9897de5e-0539-8125-7b3f-41a1c98468ae@denx.de>
 <SN4PR0201MB348615BCD7E2C82DF7919303CA6E0@SN4PR0201MB3486.namprd02.prod.outlook.com>
 <7cc8420d-c3a4-079b-42fc-90ac6e875d37@denx.de>
 <SN4PR0201MB3486E5229B0E870E6336A969CA670@SN4PR0201MB3486.namprd02.prod.outlook.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <a15a3e60-4738-3d38-fefb-c550dd0b0364@denx.de>
Date:   Wed, 19 Aug 2020 19:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <SN4PR0201MB3486E5229B0E870E6336A969CA670@SN4PR0201MB3486.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/8/20 5:23 PM, Raviteja Narayanam wrote:
> Hi Marek,

Hi,

[...]

>>> So, this local_irq_save()/local_irq_restore() is not related to
>>> exclusive access in the driver (xiic_process vs xiic_start), but to supply the
>> byte count to controller before it completes transmitting START and slave
>> address.
>>
>> But then shouldn't the XIIC IP be fixed / extended with support for such an
>> atomic update instead ?
> 
> I have started communicating with the hardware team on why the IP behavior is like this.

Any news from the hardware team ?

[...]
