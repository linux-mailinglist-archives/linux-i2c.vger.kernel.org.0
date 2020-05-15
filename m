Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09591D479F
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 10:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgEOICj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 04:02:39 -0400
Received: from mail-eopbgr150111.outbound.protection.outlook.com ([40.107.15.111]:29063
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726694AbgEOICi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 04:02:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXb8nxF7cTxHK/y58fl91YOnGexMaY2+JBnpsf/PSCxVI0j17y3OS9we204BLX0FIxwtlRq/FBx0K4GShjq3E9eR0H6yy1v9y0y+0WnaKh4p/5K4uibw3WxnYH3ZQ5OknZ5+jaWZnmE+rTtMt+t+PrMZygqbW1X3GlLYCxu0q2xeTC2pB+xKHXDlqCbZWGOktOMRNRj2C/THaPBJ294wL4UHix44N/CuzAQTuU8K8L7vg4H19yOnOoaFN9L5DkVuOzy4yjW7T798UKD912zeGFqeZXjlwkyi+BvBq/PKEjnCmJUR90nq+Ax9koDn04xKWHPQSKNKa2gRtSZyYSGNDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puBNI+NefiUzmH7SmzHjYUJBmOibpJPZXXwubv2jBt0=;
 b=U/ZuVSs0p9zxshg7q0JtKX6IysEuExc8mDJyH1qJ9bMMniu2Yb1kX+CPbhAbzM/fPdkoa36JgUIh1YKbYJ2cn9fxawCDkztJ+6g+dI8THjs88EX6BUlTBS8yuglMFgqkyTasER1BUVK0OExw5V1pyxIHccuKEqikJ1wR1irRXlXB9mjlIyRtCLRyDzPQE5qVNdBPzGiiywTSv1hSxSby7U89xeRc4GFkEfvX7l0CngryOUTxcGBnIhQBcd7HYW6L7kibwpw3BNtUzHioBpFtFWLiMoSiNedCm32egFRNhx0WDXIaUCb6z9TbPUzVUjyfsUKIhUgOHXHAHTG1bfe54w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puBNI+NefiUzmH7SmzHjYUJBmOibpJPZXXwubv2jBt0=;
 b=R6AJvjup8ELf3NBEEQRnYftKHwAbj1TE/a67VSXbPfzwDAVuLUMMiAEv5ygnJNWQfipFZiLdLO8xfNW7dYq/5YzG/lxzqnWr1PCYcFCuJRvlvUUUKRrUMkxmZfvc0KIJSCv/vYppIXCrptCvGmqC6pyxaSR+axDQN3t9/oL26DQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5660.eurprd02.prod.outlook.com (2603:10a6:10:e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Fri, 15 May
 2020 08:02:34 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a%7]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 08:02:34 +0000
Subject: Re: Two separate i2c transfers
To:     =?UTF-8?Q?Adamski=2c_Krzysztof_=28Nokia_-_PL/Wroc=c5=82aw=29?= 
        <krzysztof.adamski@nokia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
 <20200514145005.GC1589@ninjato>
 <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <e8d2d552-d1eb-1c71-1aeb-6ec9876f33f0@axentia.se>
Date:   Fri, 15 May 2020 10:02:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0209.eurprd05.prod.outlook.com
 (2603:10a6:3:f9::33) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.138.116) by HE1PR05CA0209.eurprd05.prod.outlook.com (2603:10a6:3:f9::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend Transport; Fri, 15 May 2020 08:02:33 +0000
X-Originating-IP: [213.112.138.116]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 551c7e64-54c8-4e1a-7b81-08d7f8a6533f
X-MS-TrafficTypeDiagnostic: DB8PR02MB5660:
X-Microsoft-Antispam-PRVS: <DB8PR02MB56602A80F2A87C66959CBF2DBCBD0@DB8PR02MB5660.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cH8+bSLv4SeIHhuliwmoPcKfuPrry+fPJQ2fT6JCx0uKJT3rsyp6XLIqA/ykNeajikNBm20Qfd3IamHQf3gbTGV3Mcc6O6LpBbG7lpEuy4ctNo7SHRtz6FbSOQ6UdUW/1sMNDoHU7yxX7fFU3uFz+lnuZKbVwk5d+CX7U44TfY75Dh6XDk3rWB7ZLFZS8YTLG4VaZiWM8CAnVDdgu1ze4bUR/rNznTT+Gcm2qpdr0LpwACGrPR+AskGXwJw5KFc2RhdpFlb/TMnPd0UjUn/YRZZDO//69MkoSssWw7XXr0S5TEoWlQGtYYh7TEF4lgQS2E19dkLitdojkt+/YjFJhw0lcOz9Fqz78XjcM3qz6zrx3isBGoB2A1eN9wA6GlAkUu1vCgWvtcSoBkx+o1PTJxSW4TRRE+d76YyF2heA6H1814wzyTHALmy3ol/v0qC0v2fBO+QkGeNiZDDQLKEa5AqaZV4I3KixRHOZnN5Pri8aflh1Yc7ur2NIZSw2vc9c
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(376002)(39830400003)(366004)(346002)(66556008)(8676002)(508600001)(2906002)(31686004)(316002)(5660300002)(66574014)(66476007)(26005)(956004)(36916002)(110136005)(4326008)(86362001)(31696002)(8936002)(52116002)(66946007)(16576012)(53546011)(2616005)(186003)(6486002)(16526019)(36756003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: lcZNbaoBeQ+/vUiGtgaZDdzbihXuV0zJxCRP+SQa9E9AIAPJ7Ux2CTpsEdWHBN+8LqSCjWqNz0VRq/JwNDqvj7cD9LZIlihD8mS6sBV6T2EOI6ztZ0lspFpFKwrGpY6hChNXXIzIE35ONLvTinmZ+vhy+RxhFPvFA0pUIt4U86Ndeg8bl4jySxSCjZM4r773ZWZtsX58RoyVUiH4gbZpdOa8tLRSo53OAaA8enPn6DMS3p8nHahQrRdnY9AO1kNasEu4kEFdfKOv39abZoO1i+LpOqQfbhD23joG/b8LXe1g5QTPF+9Ubh8lNR7Zh5Fq40Ne6W1Lrsx645UDmfX8XvLiXBT6ZFzxPVV5pzoSTM5jY8LYt7psJ5bXqzxAms0wjB6fJod8tSkJsU5bD/Mr2RVeu16j+jPCAShOXKn98X8nX+CvTU0FbEWibKGNy1oori2SKIMcuV4baple8fl9Mhz7dx8tiAw1MsxUeKIDLcw5ZjlhSkQwdCxV85B3X4p4
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 551c7e64-54c8-4e1a-7b81-08d7f8a6533f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 08:02:34.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+bfa29JZxehFfwCbGh42IZYxfn2YR2ayvIXqwsaMxGsskMIRyvdMDEbBIcucq9n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5660
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2020-05-15 09:04, Adamski, Krzysztof (Nokia - PL/Wrocław) wrote:
> Hi Wolfram, Peter,
> 
> Thank you for the quick response.
> 
> W dniu 14.05.2020 o 16:50, Wolfram Sang pisze:
>> Hi Krzysztof,
>>
>> On Thu, May 14, 2020 at 02:41:17PM +0200, Adamski, Krzysztof (Nokia - PL/Wrocław) wrote:
>>
>> Adding Peter as the mux maintainer to CC.
>>
>>> I have a problem that I think cannot be currently easily addressed by I2C framework in the kernel and I'm seeking for an
>>> advice on how to approach this. I have an I2C device that can be accessed from two I2C masters connected to I2C bus
>>> master selector channels. Both masters must do such a sequence before performing long operation:
>>
>> I need a diagram of that setup. What is the BMS? A chip? Some software?
>> Can you draw a graph and give names of chips etc...?
>>
>> And, of course, why on earth do you need to access the same chip from
>> two masters within one Linux? :) (That's how I understood it)
>>

*snip* useful layout.

> I was thinking that maybe a lock like this could be expressed by i2c_lock_bus with some special flag that would make
> sure no deselect is called in i2c_mux_master_xfer() (and would be ignored if our parent is not an arbiter)? We already
> have the I2C_MUX_ARBITRATOR flag and the i2c_mux_core does have an arbitrator bool so it is just a matter of allowing to
> do this kind of deeper lock on the bus.

Yes, that definitely makes it clearer. So, what you need is something
more complex than an I2C xfer between select/deselect. Your proposal
to add a flag to not do the deselect should probably have a matching
flag to not do the select on the following xfer. Otherwise that second
xfer is likely to do useless work. This should probably also be two
independent flags, so that you can add intermediate xfers that neither
select nor deselect. But you also need an explicit deselect mechanism
for use if there is a problem half way through...

But, I think all that exposes the too much to the users, and while it
is certainly possible (most things are), I not a huge fan of it.
Maintainers of other subsystems will not know the rules, and drivers
are, over time, bound to start using these facilities in half-baked
ways.

I would rather have some generic I2C mechanism to request more than
a single xfer as a unit, such that the muxes/arbs/gates can then lock
the mux/arb/gate, do the select, feed the unit to the parent adapter
and finally deselect and unlock the mux/arb/gate. With the locking
and selecting centralized instead of spread out to all users. This
helps avoid bugs where things are not cleaned up on error paths etc.

How that "I2C unit" should be constructed is another matter. The
cool thing of the day seems to be eBPF programs, but I don't know
if that fits here?

Note that there are other users needing more complex "units" than
xfers. Muxes themselves could use it, and there are a number of
drivers that lock the adapter manually, do a couple of unlocked xfers,
and then unlock the adapter. All that could probably be cleaned up a
bit with a generic "I2C unit" facility.

Cheers,
Peter
