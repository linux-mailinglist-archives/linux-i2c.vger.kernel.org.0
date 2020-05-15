Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41AB31D48A1
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 10:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgEOIgm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 04:36:42 -0400
Received: from mail-db8eur05on2107.outbound.protection.outlook.com ([40.107.20.107]:39469
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727779AbgEOIgm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 04:36:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtJWBwIMxgYcCEx5QDBLWHClGLeWBlCz24Nn9JVPWD4H58SJfj0y15DEfGKCsuBHHInGmkBRW31WWzVa4Sra/hJujP0/1Tz+O62H9xxiV4+OPmiKAB5dONZIP3CKoYaHc3/w1VJOMzOEQyxZLmA59Rtv9eKTQtNGqwdvsrE9+B7WQp5nRx8DCSGLeSfaUXgfElF6yBSDpZdyvxwXu36FY6iHMaRmJV7AScBOPHp1MCQjOWsE5LG+KqDHV/3NgNKk4YuyAHOc5fPgGU05a9Fn56/U1P+0LLRYLRLITeiDPME0A+F7STq8eTPmb/r+apMv+UG/954ITwQQmv5dHcaKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9Ym+QrBwWMO8NnzitCZQ6OpFbiFm3h1Uo7hQx1otqU=;
 b=IXWk10a+fXltge7rjtt4/YEUgSBcHiUFG/lLxfNvzrGaoLTwX+s380KRPeBKTkABdy4mq5Opu1XYhkFzLX4Ltr9MRcSm901TptgLc2FDYu2+/C3ByWzOd8/GIW7HDn2K/KKpJDMUcIMW3iOmYH8C4JsbyU1O4UJQrRDnIs8LwoCQYOyCICdTbXV/WIRpWIodjYCozxQDOYKsipNgYNv6bcZvzFHIFKff0S+WnqFf1KWhNjzGLWPVRjRvpQPN9K0+aI8AwhFCrciwpesz/93egR41j7d8To7gHIHOcx3kRh06EjItFfzcj5l3yVhJQ2dEjGX/PewW2RmYbxyOlp8heA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9Ym+QrBwWMO8NnzitCZQ6OpFbiFm3h1Uo7hQx1otqU=;
 b=Cg6dOiuemCPZfJKGnyeeh9ia7rvbOkCRaGlvhZcAtXMNpXAOH9XfytD78zMx1CNnbiOYiblX6encjOwJCiaAfkDthAqZajfC+W+v3kvzM38nwZDcqd30d6kZ+k0lnw+q4PWU64PqPO4kFtG3eJF3SunwA9+g5hNIQQQ34eNXYX0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from AM6PR07MB5957.eurprd07.prod.outlook.com (2603:10a6:20b:90::18)
 by AM6PR07MB6102.eurprd07.prod.outlook.com (2603:10a6:20b:96::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.11; Fri, 15 May
 2020 08:36:38 +0000
Received: from AM6PR07MB5957.eurprd07.prod.outlook.com
 ([fe80::74f8:a2fd:d0df:8ecc]) by AM6PR07MB5957.eurprd07.prod.outlook.com
 ([fe80::74f8:a2fd:d0df:8ecc%2]) with mapi id 15.20.3000.016; Fri, 15 May 2020
 08:36:38 +0000
Subject: Re: Two separate i2c transfers
To:     Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
 <20200514145005.GC1589@ninjato>
 <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
 <e8d2d552-d1eb-1c71-1aeb-6ec9876f33f0@axentia.se>
From:   =?UTF-8?Q?Adamski=2c_Krzysztof_=28Nokia_-_PL/Wroc=c5=82aw=29?= 
        <krzysztof.adamski@nokia.com>
Message-ID: <cb3c3457-8ebd-fa52-22e7-ddd229e15c50@nokia.com>
Date:   Fri, 15 May 2020 10:36:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <e8d2d552-d1eb-1c71-1aeb-6ec9876f33f0@axentia.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0501CA0035.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::45) To AM6PR07MB5957.eurprd07.prod.outlook.com
 (2603:10a6:20b:90::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (131.228.2.19) by HE1PR0501CA0035.eurprd05.prod.outlook.com (2603:10a6:3:1a::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Fri, 15 May 2020 08:36:37 +0000
X-Originating-IP: [131.228.2.19]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3ce68453-3a20-46f5-7141-08d7f8ab158a
X-MS-TrafficTypeDiagnostic: AM6PR07MB6102:
X-Microsoft-Antispam-PRVS: <AM6PR07MB6102F2F778501CA5D8FD1D51EFBD0@AM6PR07MB6102.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6SbMQYdNPnaj+xFkfdKHTvSUsUsoFn0YFkIELJZdhMExlgbwxvClw1TZg37Sj7w9ljodGejTudgJAhsGGesBKWcY7kBIjgTFeSNKTa4fzdarxfCU/7oT7miOqdIPQNOnD0ITVYdpe7TlUVJBTswydQrdiGIATsj00vBDvP5ECrHpPmSEwDIoIMa9mTGj5ylyKaj+LVjTwvFPjLJV0rlgGZqPH6iJFDLVSXp9mhoxlpHNcQSTr+eaXnFqlHpPJY14D/4lWXkPQhfjokftF4gT4mdaCAsvAKoA+Qrc+Hs+BaEQblZv26+x5Wr9N0vbcVLJrerBcgihUm153VfBYsdqLMsGZDQYwNpaUn+LFLO37MdVfFIaKcC7JzqsWulDofx2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR07MB5957.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(66946007)(66556008)(66476007)(66574014)(478600001)(5660300002)(31686004)(36756003)(2616005)(956004)(86362001)(26005)(316002)(4326008)(53546011)(6506007)(2906002)(6666004)(8676002)(16526019)(6512007)(52116002)(186003)(31696002)(110136005)(8936002)(6486002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: fVwn0X6X0VCIu0g83GR/6sUmCjCYYskRB+IJocdnQz0TxbB6TY4hLawp62x0wdJuu4JqFg2UyNA+AYCGZPUedx6TqZzUD9j3CGuXzSrcmUQ8KvYdIdQIHCTCttChChIOzmA3Oq0v/9cTGkH17If8YJL8fHBNW1hrozMFsNd+AcdKbw8Sm8ynsC7yHBjnrzf4JHQqGgH8UP60nojW1BV0pYb4OdQ1oSpPfva84FbLgkWyCfaOWY/0lUxM1FUGIyxEmcyQOBq88oFIYA9KJKoaYZ+HM4loetc/s2vNlwo4I5foUC3ULoig7AME5SnB8nVgwxXKM/mbwO6Tw4MqMLPBvr3jvyjnFdrP6FyMiRIgPxTCeYyUU4vlfhPeQqO8rW+N/Cf2WsvfPA3oRVjnAsnsCOLBykOFMdylYAqAuIYksv7IGK9Y8A/YNQd0rdAr5xVlF5Ix8SIxsy9gFt8hU4L+s6QjL5TWPzDf4GGBEFmGHjU=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce68453-3a20-46f5-7141-08d7f8ab158a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 08:36:38.2504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByVNOedRhbv3y/IrQQnTWOhKcF/WZopqFPh8P10IhIGVB5/s26rnearARMOi8xWdbfCwJ8cmUuysbElEKHGchOFxPkDmi0iybIKFn5rOnOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB6102
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,

W dniu 15.05.2020 o 10:02, Peter Rosin pisze:
> 
> 
> On 2020-05-15 09:04, Adamski, Krzysztof (Nokia - PL/Wrocław) wrote:
>> Hi Wolfram, Peter,
>>
>> Thank you for the quick response.
>>
>> W dniu 14.05.2020 o 16:50, Wolfram Sang pisze:
>>> Hi Krzysztof,
>>>
>>> On Thu, May 14, 2020 at 02:41:17PM +0200, Adamski, Krzysztof (Nokia - PL/Wrocław) wrote:
>>>
>>> Adding Peter as the mux maintainer to CC.
>>>
>>>> I have a problem that I think cannot be currently easily addressed by I2C framework in the kernel and I'm seeking for an
>>>> advice on how to approach this. I have an I2C device that can be accessed from two I2C masters connected to I2C bus
>>>> master selector channels. Both masters must do such a sequence before performing long operation:
>>>
>>> I need a diagram of that setup. What is the BMS? A chip? Some software?
>>> Can you draw a graph and give names of chips etc...?
>>>
>>> And, of course, why on earth do you need to access the same chip from
>>> two masters within one Linux? :) (That's how I understood it)
>>>
> 
> *snip* useful layout.
> 
>> I was thinking that maybe a lock like this could be expressed by i2c_lock_bus with some special flag that would make
>> sure no deselect is called in i2c_mux_master_xfer() (and would be ignored if our parent is not an arbiter)? We already
>> have the I2C_MUX_ARBITRATOR flag and the i2c_mux_core does have an arbitrator bool so it is just a matter of allowing to
>> do this kind of deeper lock on the bus.
> 
> Yes, that definitely makes it clearer. So, what you need is something
> more complex than an I2C xfer between select/deselect. Your proposal
> to add a flag to not do the deselect should probably have a matching
> flag to not do the select on the following xfer. Otherwise that second
> xfer is likely to do useless work. This should probably also be two
> independent flags, so that you can add intermediate xfers that neither
> select nor deselect. But you also need an explicit deselect mechanism
> for use if there is a problem half way through...
> 
> But, I think all that exposes the too much to the users, and while it
> is certainly possible (most things are), I not a huge fan of it.
> Maintainers of other subsystems will not know the rules, and drivers
> are, over time, bound to start using these facilities in half-baked
> ways.
> 
> I would rather have some generic I2C mechanism to request more than
> a single xfer as a unit, such that the muxes/arbs/gates can then lock
> the mux/arb/gate, do the select, feed the unit to the parent adapter
> and finally deselect and unlock the mux/arb/gate. With the locking
> and selecting centralized instead of spread out to all users. This
> helps avoid bugs where things are not cleaned up on error paths etc.
> 

Hmm.. but isn't such a "unit" expressed right now by using i2c_lock_bus()? If you want to do more transfers and do not
want to be disturbed by anyone on local system, you do:

i2c_lock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER);
 __i2c_transfer(client->adapter, ...);
 some_logic
 __ice_transfer(client->adapter, ...);
i2c_unlock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER);

right? So my idea would be to extend it to "outside of local system" if we have an arbiter as a parent. To not change
existing semantics, that might require additional flag (so such a "deeper lock" would be opt-in):

i2c_lock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER | I2C_LOCK_ARBITRATOR);
 __i2c_transfer(client->adapter, ...)
 some_logic
 __ice_transfer(client->adapter, ...)
i2c_unlock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER | I2C_LOCK_ARBITRATOR);


The I2C_LOCK_ARBITER flag would only be relevant for i2c_mux_lock_bus() that could do:
if (muxc->arbitrator && flags & I2C_LOCK_ARBITRATOR) {
    priv->muxc->select(muxc, priv->chan_id);
    priv->muxc->arbitrator_selected = true;
}

and unlock could do the opposite:
if (muxc->arbitrator && flags & I2C_LOCK_ARBITRATOR) {
    priv->muxc->select(muxc, priv->chan_id);
    priv->muxc->arbitrator_selected = true;
}

Now we would also need to change the xfer functions in i2c-mux.c to check for muxc->arbitrator_selected - if it is set,
it would skip doing both select and deselect as this "flag" would mean that selecting/deselecting is done on lock/unlock
and not on transfer level. Of course we could also skip the check for muxc->arbitrator if you think such a lock could
make sense for other types of muxes as well..

Would that really be confusing / un-intutive ?

Best regards,
