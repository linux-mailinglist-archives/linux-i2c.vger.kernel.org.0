Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C567C268170
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Sep 2020 23:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgIMVXb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Sep 2020 17:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgIMVX1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Sep 2020 17:23:27 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77A9C061787
        for <linux-i2c@vger.kernel.org>; Sun, 13 Sep 2020 14:23:25 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5F972891B0;
        Mon, 14 Sep 2020 09:23:12 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1600032192;
        bh=2wKE3BtCR97hRw7cJ9WNorQmd/I7jmcf10RyvWySgEo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=OjjKfk6b0TTEDiLdWAKv6NwMZvgvQLw/bKG6AGrhEuO50Kb01Kwc0koFyDPTYknJ5
         agu/fA8GVBmUjz8WGYg7vHxxtsvu+Jk+e1SsoDJ+ZPd7ANJqUkHdeF+L1F2TpF7Yqx
         O511bAC7nbxZreLjb0GtbEvGTe63TNfGFReWLuB4+Naqi/DUAIS1HaXZkbvSx9kej/
         5p8VzHo/CPGP8lunYCohxrQ1GRAisUqA9zvuMLXEmqyQkNidjR6sHIye1aeb+T1q56
         zQSC9oMqHU8vALtWQDEZaG1TpF3lparZ8/Alwiwm6S8OL299x72OuhGt2s8apNDQlb
         /UdD78La8PD+A==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f5e8dc00000>; Mon, 14 Sep 2020 09:23:12 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 14 Sep 2020 09:23:08 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Mon, 14 Sep 2020 09:23:08 +1200
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
Thread-Index: AQHWhh88ZbCxr7/vmEC2Fb58jxyqGqlfL6AAgADNsQCAAxV2AIADP/WA
Date:   Sun, 13 Sep 2020 21:23:07 +0000
Message-ID: <61c139a0-26fc-8cd1-0b54-b7cb9d9c0648@alliedtelesis.co.nz>
References: <20200908203247.14374-1-evan.nimmo@alliedtelesis.co.nz>
 <20200909082338.GC2272@ninjato>
 <5410e288-e369-0310-1b8e-061c95e46164@alliedtelesis.co.nz>
 <20200911194526.GB909@ninjato>
In-Reply-To: <20200911194526.GB909@ninjato>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <0BA1031FAA6A424A947A95AC1F899B0E@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 12/09/20 7:45 am, Wolfram Sang wrote:
> On Wed, Sep 09, 2020 at 08:39:50PM +0000, Chris Packham wrote:
>> On 9/09/20 8:23 pm, Wolfram Sang wrote:
>>> On Wed, Sep 09, 2020 at 08:32:47AM +1200, Evan Nimmo wrote:
>>>> If something goes wrong (such as the SCL being stuck low) then we need
>>>> to reset the PCA chip. The issue with this is that on reset we lose al=
l
>>>> config settings and the chip ends up in a disabled state which results
>>>> in a lock up/high CPU usage. We need to re-apply any configuration tha=
t
>>>> had previously been set and re-enable the chip.
>>>>
>>>> Signed-off-by: Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
>>>> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>> Reviewed-by: Wolfram Sang <wsa@kernel.org>
>>> Applied to for-current, thanks!
>>>
>>> For the record, were you able to test both, PCA9564 and PCA9665?
>>>
>> Our hardware platforms only have PCA9665 so that's all we can test.
> Okay, good to know. BTW, just after I sent out my pull request
> containing this patch, I noticed there is no Fixes: tag. So, if you want
> this patch to be backported, please send it to stable@ once my
> pull-request is in Linus' tree.

For our purposes being in Linus's tree is good enough. We've already=20
back-ported it to our kernel fork (which doesn't really track any of the=20
stable branches properly).

I'm happy to route it to stable@ if you think it's worth it but I don't=20
think there's a specific Fixes: reference that can be used. The current=20
behavior appears to have been that way since before git (looks like we=20
noticed in 2014 but it's taken me 6 years to nag people into sending=20
their fixes upstream).
