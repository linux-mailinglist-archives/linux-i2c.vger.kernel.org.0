Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43EFC2696FE
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 22:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgINUui (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 16:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgINUuf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 16:50:35 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54EEFC06174A
        for <linux-i2c@vger.kernel.org>; Mon, 14 Sep 2020 13:50:34 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BA030891B0;
        Tue, 15 Sep 2020 08:50:26 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1600116626;
        bh=j7CmXB7N3coyBKmnpBrosy5XOW7xAh3/RRHRC6TUQZY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=1QQu9V4Yrh+/362SKEPh3ruzX5dfEW+KWIKIYbwH7kbp5/xXv9SnsO81FtXV6+Pdt
         HQHXKvqJC80r6g68YV4avTdJYpW6WLgmhpTmLTLJW4LC9kfzhX3RonWShqxSlAc/fE
         pZmYc0qj+xSI6gRxUeg3XUY16ANzyKs62QTFdwW9vQghRvfa+axsZQgo/q/ErggiY3
         R9YF9fFhymMSYdYjUrg5+/7KNCRowC+/hpfNr56xrPTcK+JRNp1PHozZgyBXrDGotx
         x1mhQhMT0gupr4+A7Ynt/W4O/bMDpINEXw72nhGA/vUoH4+Eh/KcgNMofSiyY64+IY
         iH+n3pHj0QNSA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f5fd7920001>; Tue, 15 Sep 2020 08:50:26 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 15 Sep 2020 08:50:26 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Tue, 15 Sep 2020 08:50:26 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Evan Nimmo <Evan.Nimmo@alliedtelesis.co.nz>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "jdelvare@suse.de" <jdelvare@suse.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] i2c: algo-pca: Reapply i2c bus settings after
 reset
Thread-Topic: [PATCH v4 1/1] i2c: algo-pca: Reapply i2c bus settings after
 reset
Thread-Index: AQHWhh88ZbCxr7/vmEC2Fb58jxyqGqlfL6AAgADNsQCAAxV2AIADP/WAgACeMwCAAOr/gA==
Date:   Mon, 14 Sep 2020 20:50:26 +0000
Message-ID: <39483c5c-398e-82a1-6297-fa2dc48fcd07@alliedtelesis.co.nz>
References: <20200908203247.14374-1-evan.nimmo@alliedtelesis.co.nz>
 <20200909082338.GC2272@ninjato>
 <5410e288-e369-0310-1b8e-061c95e46164@alliedtelesis.co.nz>
 <20200911194526.GB909@ninjato>
 <61c139a0-26fc-8cd1-0b54-b7cb9d9c0648@alliedtelesis.co.nz>
 <20200914064920.GA1088@ninjato>
In-Reply-To: <20200914064920.GA1088@ninjato>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <0A02511D3894C04DAB853CF8B0A9C5D8@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 14/09/20 6:49 pm, Wolfram Sang wrote:
>> I'm happy to route it to stable@ if you think it's worth it but I don't
>> think there's a specific Fixes: reference that can be used. The current
>> behavior appears to have been that way since before git (looks like we
>> noticed in 2014 but it's taken me 6 years to nag people into sending
>> their fixes upstream).
> Better late than never :) Thanks for sending and the heads up. If you
> don't need it for stable, then we should maybe not send it. It would be
> nice for 9665 but we haven't tested it on 9564. But I'll let it be your
> call.
>
Looks like it's been picked up already. If anyone does hit problems on=20
the 9564 hopefully the interweb will lead them to this mailing list=20
thread and they'll have some people to hassle.=
