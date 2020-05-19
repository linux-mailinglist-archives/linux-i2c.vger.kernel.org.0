Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5FE51D96D7
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 14:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgESM7e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 08:59:34 -0400
Received: from mail-eopbgr140112.outbound.protection.outlook.com ([40.107.14.112]:3698
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727077AbgESM7e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 08:59:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XukEtXHeG5Ww+6zSV6WhzGTin7KdDvdLSxSaOiksPSou+46vrHXe8SZx/fzL+tzJz/4JSY1Rus9/qg35iar4gDyHZcK1/2EcIZSX+AyOlQLzvjJWYml9Z02btzZFbaHXQRlZk8nUVmbeDax2Qxnraa/uE0dsY2QuqfhIuOAxU3Iu0zPku36LLc1bDoQEgG3KFWX/8WH6+g/H5hKv3qLdaS6Z8Cixxs40vcC2c7rBZwC2joY51VekbsFVwSLaJjb3Otvj2J7cJRVbs5Aqb9CRrii7l14TKKvgL0Z74xM9QaWhmX/ny5soClBxHWC94j5DaqION3+0LN8oSBflnyZjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlGaJPML/oz1AODVTTjkqtYpd/7CPhV3gcoLeFBTnW4=;
 b=a6WFb/kI4jwph1czf4HTcfmgDbj1xq0wfELeAuhyH/JQGu9XaWcXctK8Yetys0snyqdaObn4Gq6AzlpJGEAriRqjjqbe0GCrSqvEFizVgMMUn2MuzLpTCu47WguvaSZ3JTtlAxc93R+CD6kwJMnIIR3P2OX7855GobYr6QELZw1xmflN1YmOQJ2O3OhQywxBoooe/WONqe4H7aD3QgwoKRyBoERWlB6a3SMFybwN9EyxWrKq3Y9hy+xcJfPdPMjNgm0VPhkEO2Ert6WLLKEGcVgQPBsMkr9lrxaxKrsv3csuws0GHg0BTmNScsT8Y4I0u4Ul4G1SmRR3Zczg+VbPFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlGaJPML/oz1AODVTTjkqtYpd/7CPhV3gcoLeFBTnW4=;
 b=tU1TRUMS08+V9Pw/z6pkpyt9ff5VY8BMvrRLG8VOSAx5mMmJ+Mpcy3SdEzlOnYUC1R/zrgsZp2FYJMiiiU5jn1wq3NJJxDScbVgfsNPrlCTkyx2GilmrexebiBiJT0Zy/d2YZrysA0H3z9TcRuwqWhq7MdFJIq1VrUqPNWjskeg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from AM6PR07MB5957.eurprd07.prod.outlook.com (2603:10a6:20b:90::18)
 by AM6PR07MB5349.eurprd07.prod.outlook.com (2603:10a6:20b:6c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.11; Tue, 19 May
 2020 12:59:30 +0000
Received: from AM6PR07MB5957.eurprd07.prod.outlook.com
 ([fe80::74f8:a2fd:d0df:8ecc]) by AM6PR07MB5957.eurprd07.prod.outlook.com
 ([fe80::74f8:a2fd:d0df:8ecc%2]) with mapi id 15.20.3021.019; Tue, 19 May 2020
 12:59:30 +0000
From:   =?UTF-8?Q?Adamski=2c_Krzysztof_=28Nokia_-_PL/Wroc=c5=82aw=29?= 
        <krzysztof.adamski@nokia.com>
Subject: Re: Two separate i2c transfers
To:     Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
 <20200514145005.GC1589@ninjato>
 <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
 <e8d2d552-d1eb-1c71-1aeb-6ec9876f33f0@axentia.se>
 <cb3c3457-8ebd-fa52-22e7-ddd229e15c50@nokia.com>
 <17f8514e-d130-3748-3b27-e272e9afbc29@axentia.se>
 <0c0666bd-ffe4-f078-ade8-00b65c1279dc@axentia.se>
Message-ID: <77d53140-5f04-6fff-b94e-c847d3d1c4d5@nokia.com>
Date:   Tue, 19 May 2020 14:59:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <0c0666bd-ffe4-f078-ade8-00b65c1279dc@axentia.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0313.eurprd05.prod.outlook.com
 (2603:10a6:7:93::44) To AM6PR07MB5957.eurprd07.prod.outlook.com
 (2603:10a6:20b:90::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (131.228.2.17) by HE1PR05CA0313.eurprd05.prod.outlook.com (2603:10a6:7:93::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Tue, 19 May 2020 12:59:29 +0000
X-Originating-IP: [131.228.2.17]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c70e597c-90cb-4d02-f050-08d7fbf47851
X-MS-TrafficTypeDiagnostic: AM6PR07MB5349:
X-Microsoft-Antispam-PRVS: <AM6PR07MB534942735AC44E30365C3F2CEFB90@AM6PR07MB5349.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: frbGNEIIELA2mE6lURSKgS3Xyq14U6900OPnxVcwc8jMa1n75q6qtSw1hwLJTMTHe4q4gcRzso58CFlMn6ucFrylpe3TsebUbCr6+DN3lBWsRJUi9sub6ZYxTKR3KjpPMQJUcuMAietNF8UkqqbDpNwIJczl/oElCdczco/yK54KHs6GmMiaYoZ8gSORg736GierqykYpkZmQcJsfx1xJfYvzV1omVWxvUpuCKftg+pOF8Ky/0tuw60DboXLTG3R4Yf1Oospk8ebIMG8dv16lIOkWEuofgQ4538rgYSko0ACTF6eqz/EDUXS6uqFQSRBZRbRrHrKs9LIlj4Izm/u9X11gVi8yLB57pDRqyW6G+0S59HXj9qEAbaZMADxwWuc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR07MB5957.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(4326008)(316002)(956004)(2616005)(66946007)(66476007)(66556008)(6512007)(5660300002)(6486002)(86362001)(8676002)(31696002)(52116002)(31686004)(6666004)(478600001)(26005)(8936002)(36756003)(2906002)(186003)(110136005)(16526019)(6506007)(53546011)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: O4/8+fz//WOO6J0Q++8xHgnL1q2Ed9xpTMA7kyPQ64573xWVP2AJlcu4eAdL6qbFoYktnlJkx699WXIcUEj5fs2mPv4BAc/6AOkgeQ92MX4JvO/H1cbeIwysAXThUbt+6KFYdYdyP3smCf8BLV3+8tFoP9j2VIjCthHtRKhaXVS3JthxmO4F2tJJCmPvayEfHRGk4pktRug0KN3wDZJFR4pgINF/qj2j2XDFjhtMJKiCXUCpoMivoKBoJSBKwu4PT9sIpux03QwuIbGz8ajJg8WDUf7sbKvvy/DO2p8t96XxcLE9kswttDg+gNraC6N6BQhvSnI3oqBorW/InzugUaTAKHNZ3wyc27Um2egtLp+S3TMIlekPznJdTTou7BB0TYfm8Q7jgU0h5iLiJgomRdi72p07MzlyAevzjatyMTFQweZOGYIzotyLQ/dkL1skfLNIyHUjTQ0mxmNDPo2PCCeV/iTDYhRvJUO8l7QMcWU=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70e597c-90cb-4d02-f050-08d7fbf47851
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 12:59:30.7051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KlatGEGXCXpqIxUtftsmEGX7iVsK/+g03Z4Lo7JEwcaE2Kqnvahfx0/omLaMQFt2rq7WJyYtEABKe+VvoT8rpSqUC1CqWkdwmFeCyLN48qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB5349
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter, Wofram,

W dniu 17.05.2020 o 23:32, Peter Rosin pisze:
> On 2020-05-15 23:19, Peter Rosin wrote:
>
> Ok, now I see what you mean, and I realize that you were talking
> about a new flag for i2c_bus_lock() all along. Brain-fart on my
> part. Sorry.
>
> Yes, by adding the flag to i2c_bus_(un)lock() you get something that
> is much closer to existing semantics.
>
>>> i2c_lock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER | I2C_LOCK_ARBITRATOR);
>>>  __i2c_transfer(client->adapter, ...)
>>>  some_logic
>>>  __ice_transfer(client->adapter, ...)
>>> i2c_unlock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER | I2C_LOCK_ARBITRATOR);
>>>
>>>
>>> The I2C_LOCK_ARBITER flag would only be relevant for i2c_mux_lock_bus() that could do:
>> This is not true, you would have to do it in i2c_parent_(un)lock_bus
>> too. The I2C client drivers should not need to know (or care) if the
>> muxes are parent-locked or mux-locked.

Yes, I agree. That was what I was thinking about - I meant that it is only relevant to callbacks in i2c-mux.c

>> Hmmm, on second thought, maybe the select/deselect should be part of
>> lock/unlock unconditionally? The big problem with that is that
>> "locking" may fail. And, I now realize that this is the big issue
>> with the whole approach. You need to add a return value to
>> i2c_lock_operations.lock_bus, and that feels like a *big* change.
>> Maybe not technically, the there will be a signal that the function
>> may fail. I.e. every client will, with that return value, get pressure
>> to check and act on locking failures when it is in fact only needed in
>> this new situation.

This is indeed a bigger problem I didn't think about earlier. But at I guess we agree that having such a possibility is
useful, we just have to find out the best way to implement this.

>>
>> I guess you could do the select/deselect thing conditionally, like
>> you suggested, but make it an error to try to use it with
>> i2c_lock_bus(), and only allow it from i2c_trylock_bus() which
>> already has a return value. But with that, I feel that you need to
>> somehow separate the cases when you want to actually wait for the lock
>> and when you want to give up immediately if the lock is taken.

But the problem is that currently the select callback does not have a "trylock" semantics - it tries for quite some time
before giving up. We would need to introduce some kind of flag to distinguish between the two. But the caller then would
have to most likely implement his own timeout loop which is not elegant solution either.

> The return value could be added to i2c_lock_operations.lock_bus, but not
> be exposed when called through i2c_lock_bus(). That wouldn't bee too bad
> I guess. Then a separate set of functions could be added for lock+select
> that do expose the return value (and adds the new flag of course). I.e.
> i2c_lock_select_bus, i2c_trylock_select_bus and t2c_deselect_unlock_bus.
> Or something like that.

That would be ok for me but Wolfram would have to comment, I guess.

> However, I have the feeling that *most* client drivers that do their
> own i2c_lock_adapter/__i2c_transfer/.../i2c_unlock_adapter really would
> like to also keep arbitrators locked during the operation to prevent not
> only the local master from clobbering the chip status.

I'm not sure how useful this is for generic case (if it's "most" or only "some") but as you pointed out, it is not a
simple extension of a lock as now the client would have to deal with the fail possibility so I think such a lock should
still be considered an opt-in. For this, a new API is good idea.

> Hmm. New idea. Maybe the arbitrator ->select should remain with the xfer
> as it is today, but then you set a flag that the arbitrator is selected,
> and delay the deselect until the unlock (instead of doing it last in the
> xfer). You would of course need to check the flag before doing the select
> in the xfer, so that follow-up xfers don't redo the select.
>
> Something like this (untested, written in the mail client):
>
> static int __i2c_mux_master_xfer(struct i2c_adapter *adap,
> 				 struct i2c_msg msgs[], int num)
> {
> 	struct i2c_mux_priv *priv = adap->algo_data;
> 	struct i2c_mux_core *muxc = priv->muxc;
> 	struct i2c_adapter *parent = muxc->parent;
>
> 	/* Switch to the right mux port and perform the transfer. */
>
> 	if (!muxc->selected) {
> 		int ret = muxc->select(muxc, priv->chan_id);
> 		muxc->selected = true;
> 		if (ret < 0)
> 			return ret;
> 	}
>
> 	return __i2c_transfer(parent, msgs, num);
> }
>
> static void i2c_parent_unlock_bus(struct i2c_adapter *adapter,
> 				  unsigned int flags)
> {
> 	struct i2c_mux_priv *priv = adapter->algo_data;
> 	struct i2c_mux_core *muxc = priv->muxc;
> 	struct i2c_adapter *parent = muxc->parent;
>
> 	if (muxc->selected && muxc->deselect)
> 		muxc->deselect(muxc, priv->chan_id);
> 	muxc->selected = false;
> 	i2c_unlock_bus(parent, flags);
> 	rt_mutex_unlock(&parent->mux_lock);
> }
>
> (i2c_mux_master_xfer(), __i2c_mux_smbus_xfer(), i2c_mux_smbus_xfer() and
> i2c_mux_unlock_bus() need corresponding changes)

Something like this was my initial idea. But I'm not that sure if such a "deeper lock" should indeed be default option
for all callers. Could that introduce some regressions? Especially if we somehow get deselected automatically by the
device (like noted below).

> One more thing to keep in mind. Some arbs/muxes/gates auto-deselects after
> the Nth xfer (always the 1st?), so arb/mux/gate drivers must probably have
> some way to opt out of whatever we do to support "I2C units" across
> arbs/muxes/gates. Maybe that property mostly applies to gates? Anyway, the
> above is not a complete solution.

Also there is a possibility that a mux could be deselected after some idle time as well. I think the PCA9461 does
support something like that but I would have to check.

Maybe a hybrid approach would be best, then? The user could provide a flag to i2c_bus_lock() to opt-in for a deeper lock
(to avoid possible regressions and changed behavior) but the actual select would be called in __i2c_mux_mater_xfer and
deselect in unlock_bus as you suggested above (but only if the flag was provided to i2c_bus_{un,}lock(). I'm not sure if
this is better than introducing i2c_{un,}lock_select_bus() as suggested previously, however. Wolfram, what are your
thoughts? I think an additional point of view would be useful here.

Krzysztof
