Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEF22614E3
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 18:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731947AbgIHQkN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 12:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732073AbgIHQh0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 12:37:26 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78903C061A18
        for <linux-i2c@vger.kernel.org>; Tue,  8 Sep 2020 07:06:42 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Bm6N3598nz1rvRj;
        Tue,  8 Sep 2020 16:04:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Bm6N34NLbz1qwT7;
        Tue,  8 Sep 2020 16:04:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id YHnTXernMOeF; Tue,  8 Sep 2020 16:04:34 +0200 (CEST)
X-Auth-Info: EfAq+TOSAMZAX+HQpchLefnWYSmzNmW05wvKsQlGBjQ=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue,  8 Sep 2020 16:04:34 +0200 (CEST)
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
 <1913c876-d7ec-6f66-e9eb-20b45a4afec4@denx.de>
 <SN4PR0201MB3486689C38889DB9360D524ECA570@SN4PR0201MB3486.namprd02.prod.outlook.com>
 <f34e3539-4f2a-669f-6bb1-0b95ebf6c51f@denx.de>
 <SN4PR0201MB348634B4F722A224E071D049CA280@SN4PR0201MB3486.namprd02.prod.outlook.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <488a2682-b15a-0463-b8be-b681c6d87b94@denx.de>
Date:   Tue, 8 Sep 2020 16:04:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <SN4PR0201MB348634B4F722A224E071D049CA280@SN4PR0201MB3486.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/7/20 10:51 AM, Raviteja Narayanam wrote:

[...]

>> Is this dynamic/standard mode switching what is already in the downstream
>> xilinx kernel tree ?
>>
>> I think we should fix what is already upstream first, and only then add more
>> complexity.
> 
> Yes, agreed. But, that would be a hardware fix in the future IP release. Since we have
> to support existing IP versions, we are planning to upstream the standard mode
> and based on the DT property (IP version), we will switch.

Is the dynamic mode addition be backported to stable as well ?
It is a lot of code, so I have a feeling that would be difficult.

Maybe it would be better to mark the xiic driver as broken until the
hardware is fixed ?
