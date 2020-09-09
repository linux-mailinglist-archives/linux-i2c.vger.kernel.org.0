Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00FF9263791
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 22:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgIIUkJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 16:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgIIUkI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 16:40:08 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340ABC061573
        for <linux-i2c@vger.kernel.org>; Wed,  9 Sep 2020 13:40:07 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id F08EC80719;
        Thu, 10 Sep 2020 08:39:51 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599683991;
        bh=NHjUxeEhMMCSoluiwizAPmsG3H1noXImr/miOLmn704=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=Q6xToLnINjCuZ7tW/YZdrjasaA2KbwwMUxmJmvJI/wWWR4eIZAR8OtnLGPvyYEXJu
         xV/bW0UK9iExFVUgT/YR4lK5Z/3+RkqNdWLl8mJcPTQTJG9/RQRnenPue9tIAzoU+7
         JjPtdlRgx3AtUPmFvvM/6djzkbL1Gk7+2N0DRZxf3vXZyUby3UQzDUIYNB/vAmdXrZ
         E30S5RqKMjCbJc8ljOeF1v0JeGikX6BCIgIx6kNpXqU/grwebJSde+f4OSMIvOPMks
         yM/fEPcGgJln/hkJXHawoFkNnJVkGp9xqQVX0RL/Au0umfoeUZKj9Ifnp5dKeuLo/C
         Z9KkiiV7w87zQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f593d970000>; Thu, 10 Sep 2020 08:39:51 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 10 Sep 2020 08:39:51 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Thu, 10 Sep 2020 08:39:51 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>,
        Evan Nimmo <Evan.Nimmo@alliedtelesis.co.nz>
CC:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "jdelvare@suse.de" <jdelvare@suse.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] i2c: algo-pca: Reapply i2c bus settings after
 reset
Thread-Topic: [PATCH v4 1/1] i2c: algo-pca: Reapply i2c bus settings after
 reset
Thread-Index: AQHWhh88ZbCxr7/vmEC2Fb58jxyqGqlfL6AAgADNsQA=
Date:   Wed, 9 Sep 2020 20:39:50 +0000
Message-ID: <5410e288-e369-0310-1b8e-061c95e46164@alliedtelesis.co.nz>
References: <20200908203247.14374-1-evan.nimmo@alliedtelesis.co.nz>
 <20200909082338.GC2272@ninjato>
In-Reply-To: <20200909082338.GC2272@ninjato>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <1291A7C6A2B28C4F846F672BC47AF75D@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 9/09/20 8:23 pm, Wolfram Sang wrote:
> On Wed, Sep 09, 2020 at 08:32:47AM +1200, Evan Nimmo wrote:
>> If something goes wrong (such as the SCL being stuck low) then we need
>> to reset the PCA chip. The issue with this is that on reset we lose all
>> config settings and the chip ends up in a disabled state which results
>> in a lock up/high CPU usage. We need to re-apply any configuration that
>> had previously been set and re-enable the chip.
>>
>> Signed-off-by: Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
>> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Reviewed-by: Wolfram Sang <wsa@kernel.org>
> Applied to for-current, thanks!
>
> For the record, were you able to test both, PCA9564 and PCA9665?
>
Our hardware platforms only have PCA9665 so that's all we can test.=
