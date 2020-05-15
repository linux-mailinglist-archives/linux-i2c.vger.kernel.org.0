Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3571D5B5C
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 23:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgEOVT0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 17:19:26 -0400
Received: from mail-eopbgr40101.outbound.protection.outlook.com ([40.107.4.101]:5511
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726183AbgEOVTZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 17:19:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jhfw8zkIovBoZl4JPrMiqRheBAdHxu4AkGmIoR0iz9DbhpSSrXK1EHuYXSGZhYnvJcDOZR1wNfhZDuNhV6jW+k1P8PgOiwkCy3pn79QXVTDOE/RF54ld5H/ehNHigNB7qk18GY7F0Qa3MKiwrPhDeFgvXlpCJzOJYcDvBjMqf6K0PFYwdYpmT6Ar86VzBnwafPiHNupy2uG6zUBsjrFmOBlxxO2GC/FC1svdTXpkUoIEJXcuhw/tVtGqMVTuSJmn7qKrkf7SvHsvaru09GLy+iqHE+OrNSbmsbztAnueShIqyou50UIwnDTx1XHoJYTG6OOKy5QqPjKmnFStb5uHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/F+b6OgHJbyBVK8U9cgfuXkNtjOFD1WM24QI9E4H7M=;
 b=gTx+lJQTmZwKj5EjIhWh3noFSjOdKcM8xfCPDVdNc8DfX7iPhk+CVkPXeqP8Dtyo/GwGCdmxaRfu11aqCpG9YasCj1Mz0dZ3+FqcGqocUnljTJuKc8K5hOPicTudGcAHLwqxxu+RCLvlm9bUBjtHYA4SNkQ1CeFYmvzzJ6q2uU/fKld8hgZwCU8Jeg01I4KJlsQ5TEzKGBxiGwFSTzBBaMOyfhYHlQTToZ7Rm6q6K32PibCTs8Sa5WagYrl39LPh7KSHgRMbnZqO73hUzDeIPCUBhDgaYecdvb/OpXngd5ztcautddAi7VyVTMaIoe4GPiv8wqw3yP7rY80IUN2PyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/F+b6OgHJbyBVK8U9cgfuXkNtjOFD1WM24QI9E4H7M=;
 b=kS8bbHHSoNgQW7oDAa2DNkDcep7ixSVZQJFXwPUB1XZ6NZVc90YBMDj6HXXYV8lP7/+8HrYESmJ8gjJqP7CFJK/qbP4aUYO+Ft8qpOYJaJogeO+OW4DPnLIgXMHWc8NZBCOfj0IBJgZvnTsBkeXIisYzjT0uWOhKFae8zTaSvyE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5401.eurprd02.prod.outlook.com (2603:10a6:10:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Fri, 15 May
 2020 21:19:06 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a%7]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 21:19:06 +0000
Subject: Re: Two separate i2c transfers
To:     =?UTF-8?Q?Adamski=2c_Krzysztof_=28Nokia_-_PL/Wroc=c5=82aw=29?= 
        <krzysztof.adamski@nokia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
 <20200514145005.GC1589@ninjato>
 <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
 <e8d2d552-d1eb-1c71-1aeb-6ec9876f33f0@axentia.se>
 <cb3c3457-8ebd-fa52-22e7-ddd229e15c50@nokia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <17f8514e-d130-3748-3b27-e272e9afbc29@axentia.se>
Date:   Fri, 15 May 2020 23:19:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <cb3c3457-8ebd-fa52-22e7-ddd229e15c50@nokia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::29)
 To DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.138.116) by HE1P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Fri, 15 May 2020 21:19:05 +0000
X-Originating-IP: [213.112.138.116]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8fcd46b-f49d-433a-b7c6-08d7f915998f
X-MS-TrafficTypeDiagnostic: DB8PR02MB5401:
X-Microsoft-Antispam-PRVS: <DB8PR02MB54012CAD7BAFF61401F4416ABCBD0@DB8PR02MB5401.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i6JDDL/B71RukbKlHnMrwRSE//SMN65/S6yKPzrEj+poIlhrSalR/syaxKg1e/rVUrHWupZkS/dx1ExwDhp647KwxTuVfKNismvmN0SqGE89vUosk6CPRMbXq22KT5U1sF/eZrVOWpiarLr82mlZk1mOcfY3M8loginUxZ2Y5wBNbdFqQNJRxo+RgdgVoatgl4LVvhVBDyuh9F4+VkMocNTaaZWkhykLD2F29c4CryJZVXucdjslzIVq3uChPqFaR8u5v56SDg0GDZO5gwgn9lknu9/6JaIoJmFgu17YDMY3dv4yXg76BAPtXcso2RPTXFJM37pTJTIbIVJ1Osigu+tUHH4tHoYhQtLQETI+7HzdJQgl+XpiXkf8IVKN9A3enFm0Md3swiYvEtlStaYwV2eX+DuUZdw9GOy1kYmxQkeqVtew02GvbanfIxofjQBQOmC5dor8sRJAdKSMw3RaYw9pz19vB2l41cZbCDw9KVKKpidM8UGMIJdwi+VtTCfW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(366004)(136003)(39830400003)(396003)(956004)(2906002)(2616005)(53546011)(86362001)(36756003)(66946007)(16526019)(8676002)(52116002)(66476007)(4326008)(508600001)(186003)(31696002)(26005)(66574014)(36916002)(316002)(66556008)(6486002)(6666004)(16576012)(5660300002)(110136005)(8936002)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: Kq0dizWH74PW9b+yGYx8nKNZ6Y6AAPOFdZ87pDfX+F81tT4HIzIgY6H/gYfk+jl3J7e2GiaXf03U0nw3j6UJLAE6BsWQuevhjdgG9WnUq17Pw+KYedr6k4fiHzA29vBkYpTB5mc1wXvTK0r5bI4N3EWW4xfgWlfl7YgsZg0OGn53gy2MLRvUXKMHecgMO5p+1x90aLMJLfv+EP8JL4VYvwXir0LX/OI/We377XhFUlP5QQaQ6movkLuzy0g7ivWZZDRyNzLSGII5WcSLOXgADOKxtDDRbbMlFuuSPlcj4ba9k3qu+hnpWw+M45lJZmSDltR2HbF2oMvzpTs3sfgseg3DUyPspvFeTd5Ht+Pfa096WxPsGHOUcZTbD4ckqrISYtILtdRKB1hLFUOWdg4kFthH4Go6P2J9+IslUKLNyrw3FNKYeod8fPKL3HPpb94NiMkddrrBqMpGAXEOESvoF31P+b9EZm6oBw6Qqm1+noE=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fcd46b-f49d-433a-b7c6-08d7f915998f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 21:19:06.5035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5pv6SZQNDXw4HZNU+a5zrRECuo0m0WhDI1pBcnFXGf29Os6Mc2/1K8Y/Fv/a4gT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5401
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2020-05-15 10:36, Adamski, Krzysztof (Nokia - PL/Wrocław) wrote:
> Hi Peter,
> 
> W dniu 15.05.2020 o 10:02, Peter Rosin pisze:
>>
>>
>> On 2020-05-15 09:04, Adamski, Krzysztof (Nokia - PL/Wrocław) wrote:
>>> Hi Wolfram, Peter,
>>>
>>> Thank you for the quick response.
>>>
>>> W dniu 14.05.2020 o 16:50, Wolfram Sang pisze:
>>>> Hi Krzysztof,
>>>>
>>>> On Thu, May 14, 2020 at 02:41:17PM +0200, Adamski, Krzysztof (Nokia - PL/Wrocław) wrote:
>>>>
>>>> Adding Peter as the mux maintainer to CC.
>>>>
>>>>> I have a problem that I think cannot be currently easily addressed by I2C framework in the kernel and I'm seeking for an
>>>>> advice on how to approach this. I have an I2C device that can be accessed from two I2C masters connected to I2C bus
>>>>> master selector channels. Both masters must do such a sequence before performing long operation:
>>>>
>>>> I need a diagram of that setup. What is the BMS? A chip? Some software?
>>>> Can you draw a graph and give names of chips etc...?
>>>>
>>>> And, of course, why on earth do you need to access the same chip from
>>>> two masters within one Linux? :) (That's how I understood it)
>>>>
>>
>> *snip* useful layout.
>>
>>> I was thinking that maybe a lock like this could be expressed by i2c_lock_bus with some special flag that would make
>>> sure no deselect is called in i2c_mux_master_xfer() (and would be ignored if our parent is not an arbiter)? We already
>>> have the I2C_MUX_ARBITRATOR flag and the i2c_mux_core does have an arbitrator bool so it is just a matter of allowing to
>>> do this kind of deeper lock on the bus.
>>
>> Yes, that definitely makes it clearer. So, what you need is something
>> more complex than an I2C xfer between select/deselect. Your proposal
>> to add a flag to not do the deselect should probably have a matching
>> flag to not do the select on the following xfer. Otherwise that second
>> xfer is likely to do useless work. This should probably also be two
>> independent flags, so that you can add intermediate xfers that neither
>> select nor deselect. But you also need an explicit deselect mechanism
>> for use if there is a problem half way through...
>>
>> But, I think all that exposes the too much to the users, and while it
>> is certainly possible (most things are), I not a huge fan of it.
>> Maintainers of other subsystems will not know the rules, and drivers
>> are, over time, bound to start using these facilities in half-baked
>> ways.
>>
>> I would rather have some generic I2C mechanism to request more than
>> a single xfer as a unit, such that the muxes/arbs/gates can then lock
>> the mux/arb/gate, do the select, feed the unit to the parent adapter
>> and finally deselect and unlock the mux/arb/gate. With the locking
>> and selecting centralized instead of spread out to all users. This
>> helps avoid bugs where things are not cleaned up on error paths etc.
>>
> 
> Hmm.. but isn't such a "unit" expressed right now by using i2c_lock_bus()? If you want to do more transfers and do not
> want to be disturbed by anyone on local system, you do:
> 
> i2c_lock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER);
>  __i2c_transfer(client->adapter, ...);
>  some_logic
>  __ice_transfer(client->adapter, ...);
> i2c_unlock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER);
> 
> right? So my idea would be to extend it to "outside of local system" if we have an arbiter as a parent. To not change
> existing semantics, that might require additional flag (so such a "deeper lock" would be opt-in):

Ok, now I see what you mean, and I realize that you were talking
about a new flag for i2c_bus_lock() all along. Brain-fart on my
part. Sorry.

Yes, by adding the flag to i2c_bus_(un)lock() you get something that
is much closer to existing semantics.

> i2c_lock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER | I2C_LOCK_ARBITRATOR);
>  __i2c_transfer(client->adapter, ...)
>  some_logic
>  __ice_transfer(client->adapter, ...)
> i2c_unlock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER | I2C_LOCK_ARBITRATOR);
> 
> 
> The I2C_LOCK_ARBITER flag would only be relevant for i2c_mux_lock_bus() that could do:

This is not true, you would have to do it in i2c_parent_(un)lock_bus
too. The I2C client drivers should not need to know (or care) if the
muxes are parent-locked or mux-locked.

> if (muxc->arbitrator && flags & I2C_LOCK_ARBITRATOR) {
>     priv->muxc->select(muxc, priv->chan_id);
>     priv->muxc->arbitrator_selected = true;
> }
> 
> and unlock could do the opposite:
> if (muxc->arbitrator && flags & I2C_LOCK_ARBITRATOR) {
>     priv->muxc->select(muxc, priv->chan_id);
>     priv->muxc->arbitrator_selected = true;

(unselect and false, but I get it)

> }
> 
> Now we would also need to change the xfer functions in i2c-mux.c to check for muxc->arbitrator_selected - if it is set,
> it would skip doing both select and deselect as this "flag" would mean that selecting/deselecting is done on lock/unlock
> and not on transfer level. Of course we could also skip the check for muxc->arbitrator if you think such a lock could
> make sense for other types of muxes as well..

I think it may well make sense, so skip the check and name the
name of the flag can be just 'selected'.

> Would that really be confusing / un-intutive ?

No, I guess not. It's pretty much on-par with the existing I2C locking
facilities.

Hmmm, on second thought, maybe the select/deselect should be part of
lock/unlock unconditionally? The big problem with that is that
"locking" may fail. And, I now realize that this is the big issue
with the whole approach. You need to add a return value to
i2c_lock_operations.lock_bus, and that feels like a *big* change.
Maybe not technically, the there will be a signal that the function
may fail. I.e. every client will, with that return value, get pressure
to check and act on locking failures when it is in fact only needed in
this new situation.

I guess you could do the select/deselect thing conditionally, like
you suggested, but make it an error to try to use it with
i2c_lock_bus(), and only allow it from i2c_trylock_bus() which
already has a return value. But with that, I feel that you need to
somehow separate the cases when you want to actually wait for the lock
and when you want to give up immediately if the lock is taken.

I don't know if I'm making sense. I'm typing as I'm thinking if
anyone hadn't noticed...

Cheers,
Peter
