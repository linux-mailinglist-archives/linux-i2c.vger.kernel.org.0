Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172AD1D6D7B
	for <lists+linux-i2c@lfdr.de>; Sun, 17 May 2020 23:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgEQVcp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 May 2020 17:32:45 -0400
Received: from mail-eopbgr80122.outbound.protection.outlook.com ([40.107.8.122]:57427
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726458AbgEQVco (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 May 2020 17:32:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jomPBTyaJabgGS+Qtj22RDtfJtRNCBvjLgTx+WIwiESurf/46bp+U0YtZmzEBSafS/aK4IHkmxTUa6afP+iIue+0nY+AdJx3u5cB4gDKyCa1TcBsoza6XpHjuTugZioGXGZlbxQKOhy+XHCx/XVP2L7ZnapGfzdzDVhCzmXslk+D4vbYyy+dgWiaTVTpNAkNYpKB4WXVVOeENvnSqXFYGbD3RFu8+/mFWqWt1rkTM0M8yUYRRbKJNwsiRpRDvvWbemE4t4EcPNt61VmW6HfXxghxZro9dMRc6y6K6e3dpC3Vu2wW2maepd2lq4Sq3fjb/Z10BO79QkVj+dbJYOZ8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJIT4E9fss8PSfTPOuk6/F5LQAsWe9PolzBbV5n9u2M=;
 b=LAnjD0Pseh91w2ODUZnJigw+hLJEdSjiyLhWRg42i6WXArMX+ddQaXRIzWoIqNxhgGtESN+44RXrwXXYoYsJ0hLY+EsamCumnSMy4pzDou/SVK8rUTZ7wPGu+WlvGqHcML6rSm6EWCBG2uk8KmBd15CPu5/HBNXSHtaIz6V218FOeUaz5rwVi+OKAG9p7BWOu+1vX2bcp60zzlSNmq2FlvGhKOgnSrmYXMsEMbC5RhBVQzN61/hr0hULZRFmz6nIGwjiiSo2NAa72nqkSxVYPWqpirusLaJ+JmQ8haJ+W7/EOpMfRpTx8KEQioZPcekKyI0MgVIrffWMVlHs7n9mkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJIT4E9fss8PSfTPOuk6/F5LQAsWe9PolzBbV5n9u2M=;
 b=PaO2EKv9H6i6Xt5F9zfRXlYK6d3xxIYsKihoSLVi3v11ZfQYt8/23CTB/bwF8PfLFOaZWdhaKh4WdfvurKTiHywK5emcWFlh9yRBb+7z9BAm5l3IqmUK/QYsVJb2TKR8/chCNieG+QiXqF7XoCw16yPhCtQf2Yf4ln2pWpY2Cqs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5785.eurprd02.prod.outlook.com (2603:10a6:10:f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Sun, 17 May
 2020 21:32:38 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a%7]) with mapi id 15.20.3000.033; Sun, 17 May 2020
 21:32:38 +0000
Subject: Re: Two separate i2c transfers
From:   Peter Rosin <peda@axentia.se>
To:     =?UTF-8?Q?Adamski=2c_Krzysztof_=28Nokia_-_PL/Wroc=c5=82aw=29?= 
        <krzysztof.adamski@nokia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
 <20200514145005.GC1589@ninjato>
 <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
 <e8d2d552-d1eb-1c71-1aeb-6ec9876f33f0@axentia.se>
 <cb3c3457-8ebd-fa52-22e7-ddd229e15c50@nokia.com>
 <17f8514e-d130-3748-3b27-e272e9afbc29@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <0c0666bd-ffe4-f078-ade8-00b65c1279dc@axentia.se>
Date:   Sun, 17 May 2020 23:32:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <17f8514e-d130-3748-3b27-e272e9afbc29@axentia.se>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::30)
 To DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.138.116) by HE1P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend Transport; Sun, 17 May 2020 21:32:37 +0000
X-Originating-IP: [213.112.138.116]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21485c38-261d-4b95-e093-08d7faa9d239
X-MS-TrafficTypeDiagnostic: DB8PR02MB5785:
X-Microsoft-Antispam-PRVS: <DB8PR02MB57852B7EC8A1083278D55ACEBCBB0@DB8PR02MB5785.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 040655413E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VDzpAI6OLrQywodNu3V6CoVokTEYMqwRGbtq6b7qQ8PvHC44756OFQISJpmF0MFXONxMkjEq9e6mChVXL9TQqQ01ZEWWuTcKXEkW9Olw9n+DF+S2tko5T48THVSD9ji6+eX5STXDA+0U22xKYt+By9FSZd/EKRRXLlWrL1Ks5AZ4ZDi/WdYegVedwKfKJD/V+tqb3I0zsP3wEA0LuYAqi5yWU7RXpTV1LnWkNjmwff3UGYbdO8Xl+4R0UN+Ri0O2hFbHfak3HtSJgIlUlkmLNNEvn3YiZvEf5Q8dukfSmDOZuhiIx8dWZ8wxNErdV7wmNn1/oo9C+IaqhYpmJRMFN6AE4JuA3Ta0yswnfltRMtlBdH+a5cQv1N97KYM32A/i4qvldWNnstwcc4KOdYp+HGcW0wNerI74TmuaXbRPin+XVHeLb3qNBzFa8yUZoBlCVvQZx5Io5TDFXbVJ7G2n1mFa183AqWA0/xCabUOdDaMPRjr/4zP4I8pbxI5EpO6p
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(396003)(39830400003)(136003)(346002)(366004)(66476007)(66946007)(66556008)(110136005)(5660300002)(508600001)(2616005)(26005)(6486002)(8676002)(6666004)(31696002)(86362001)(31686004)(53546011)(8936002)(16526019)(4326008)(2906002)(36756003)(16576012)(186003)(52116002)(316002)(66574014)(36916002)(956004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: sdUf3uaO4iAQjlWG8xhnm3R0PwT3qWjDkYPLuq5ZPYwC/W1/dHTVs4kYB9kRE7HEU+MOv5CBl2cNpZlKILRadpcZaWC4x3pjT0i0ZxzPQJdiSIIy9HTLXPbQHMdTV6vOe1KKCy9lsu3wLIx9Pr74rhl6pE+P7RNamjHZx6wlRdzcpLyRvBdL8vZffYfSEfAGZog91896RkPUQNOK/CILBIRjrBKzz8sp47aUQqawEFUmTClbr8VEYkOcikW26BTxjoiFruAalDcVD6yMM7n2n48Eu616tF38WeMuGtea+C3+sYC9SduZVvpv7Mog7Dnq41hQ+QQ1E2nRWubl74AgBCCLKcmOBBg4YMme2KDwsG58TDjoqZ4RWzyTiAQP75d3G5CyumZllucOu0SgaTHH64hGAVF60nyhR5qtaKeBLDE2i8VeFyrXujyxycipogIQQhIwik6GHt22GvefcxAYXE0rz0QcdZMnqiU3dOGYTkg=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 21485c38-261d-4b95-e093-08d7faa9d239
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2020 21:32:38.0449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWlnFcZVq/fHl5glcfvL+50cmL3YxHeyXeIOf4WFF1IBLJsF6mLJ0+pSIEDi4xgb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5785
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2020-05-15 23:19, Peter Rosin wrote:
> 
> 
> On 2020-05-15 10:36, Adamski, Krzysztof (Nokia - PL/Wrocław) wrote:
>> Hi Peter,
>>
>> W dniu 15.05.2020 o 10:02, Peter Rosin pisze:
>>>
>>>
>>> On 2020-05-15 09:04, Adamski, Krzysztof (Nokia - PL/Wrocław) wrote:
>>>> Hi Wolfram, Peter,
>>>>
>>>> Thank you for the quick response.
>>>>
>>>> W dniu 14.05.2020 o 16:50, Wolfram Sang pisze:
>>>>> Hi Krzysztof,
>>>>>
>>>>> On Thu, May 14, 2020 at 02:41:17PM +0200, Adamski, Krzysztof (Nokia - PL/Wrocław) wrote:
>>>>>
>>>>> Adding Peter as the mux maintainer to CC.
>>>>>
>>>>>> I have a problem that I think cannot be currently easily addressed by I2C framework in the kernel and I'm seeking for an
>>>>>> advice on how to approach this. I have an I2C device that can be accessed from two I2C masters connected to I2C bus
>>>>>> master selector channels. Both masters must do such a sequence before performing long operation:
>>>>>
>>>>> I need a diagram of that setup. What is the BMS? A chip? Some software?
>>>>> Can you draw a graph and give names of chips etc...?
>>>>>
>>>>> And, of course, why on earth do you need to access the same chip from
>>>>> two masters within one Linux? :) (That's how I understood it)
>>>>>
>>>
>>> *snip* useful layout.
>>>
>>>> I was thinking that maybe a lock like this could be expressed by i2c_lock_bus with some special flag that would make
>>>> sure no deselect is called in i2c_mux_master_xfer() (and would be ignored if our parent is not an arbiter)? We already
>>>> have the I2C_MUX_ARBITRATOR flag and the i2c_mux_core does have an arbitrator bool so it is just a matter of allowing to
>>>> do this kind of deeper lock on the bus.
>>>
>>> Yes, that definitely makes it clearer. So, what you need is something
>>> more complex than an I2C xfer between select/deselect. Your proposal
>>> to add a flag to not do the deselect should probably have a matching
>>> flag to not do the select on the following xfer. Otherwise that second
>>> xfer is likely to do useless work. This should probably also be two
>>> independent flags, so that you can add intermediate xfers that neither
>>> select nor deselect. But you also need an explicit deselect mechanism
>>> for use if there is a problem half way through...
>>>
>>> But, I think all that exposes the too much to the users, and while it
>>> is certainly possible (most things are), I not a huge fan of it.
>>> Maintainers of other subsystems will not know the rules, and drivers
>>> are, over time, bound to start using these facilities in half-baked
>>> ways.
>>>
>>> I would rather have some generic I2C mechanism to request more than
>>> a single xfer as a unit, such that the muxes/arbs/gates can then lock
>>> the mux/arb/gate, do the select, feed the unit to the parent adapter
>>> and finally deselect and unlock the mux/arb/gate. With the locking
>>> and selecting centralized instead of spread out to all users. This
>>> helps avoid bugs where things are not cleaned up on error paths etc.
>>>
>>
>> Hmm.. but isn't such a "unit" expressed right now by using i2c_lock_bus()? If you want to do more transfers and do not
>> want to be disturbed by anyone on local system, you do:
>>
>> i2c_lock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER);
>>  __i2c_transfer(client->adapter, ...);
>>  some_logic
>>  __ice_transfer(client->adapter, ...);
>> i2c_unlock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER);
>>
>> right? So my idea would be to extend it to "outside of local system" if we have an arbiter as a parent. To not change
>> existing semantics, that might require additional flag (so such a "deeper lock" would be opt-in):
> 
> Ok, now I see what you mean, and I realize that you were talking
> about a new flag for i2c_bus_lock() all along. Brain-fart on my
> part. Sorry.
> 
> Yes, by adding the flag to i2c_bus_(un)lock() you get something that
> is much closer to existing semantics.
> 
>> i2c_lock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER | I2C_LOCK_ARBITRATOR);
>>  __i2c_transfer(client->adapter, ...)
>>  some_logic
>>  __ice_transfer(client->adapter, ...)
>> i2c_unlock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER | I2C_LOCK_ARBITRATOR);
>>
>>
>> The I2C_LOCK_ARBITER flag would only be relevant for i2c_mux_lock_bus() that could do:
> 
> This is not true, you would have to do it in i2c_parent_(un)lock_bus
> too. The I2C client drivers should not need to know (or care) if the
> muxes are parent-locked or mux-locked.
> 
>> if (muxc->arbitrator && flags & I2C_LOCK_ARBITRATOR) {
>>     priv->muxc->select(muxc, priv->chan_id);
>>     priv->muxc->arbitrator_selected = true;
>> }
>>
>> and unlock could do the opposite:
>> if (muxc->arbitrator && flags & I2C_LOCK_ARBITRATOR) {
>>     priv->muxc->select(muxc, priv->chan_id);
>>     priv->muxc->arbitrator_selected = true;
> 
> (unselect and false, but I get it)
> 
>> }
>>
>> Now we would also need to change the xfer functions in i2c-mux.c to check for muxc->arbitrator_selected - if it is set,
>> it would skip doing both select and deselect as this "flag" would mean that selecting/deselecting is done on lock/unlock
>> and not on transfer level. Of course we could also skip the check for muxc->arbitrator if you think such a lock could
>> make sense for other types of muxes as well..
> 
> I think it may well make sense, so skip the check and name the
> name of the flag can be just 'selected'.
> 
>> Would that really be confusing / un-intutive ?
> 
> No, I guess not. It's pretty much on-par with the existing I2C locking
> facilities.
> 
> Hmmm, on second thought, maybe the select/deselect should be part of
> lock/unlock unconditionally? The big problem with that is that
> "locking" may fail. And, I now realize that this is the big issue
> with the whole approach. You need to add a return value to
> i2c_lock_operations.lock_bus, and that feels like a *big* change.
> Maybe not technically, the there will be a signal that the function
> may fail. I.e. every client will, with that return value, get pressure
> to check and act on locking failures when it is in fact only needed in
> this new situation.
> 
> I guess you could do the select/deselect thing conditionally, like
> you suggested, but make it an error to try to use it with
> i2c_lock_bus(), and only allow it from i2c_trylock_bus() which
> already has a return value. But with that, I feel that you need to
> somehow separate the cases when you want to actually wait for the lock
> and when you want to give up immediately if the lock is taken.
> 
> I don't know if I'm making sense. I'm typing as I'm thinking if
> anyone hadn't noticed...

The return value could be added to i2c_lock_operations.lock_bus, but not
be exposed when called through i2c_lock_bus(). That wouldn't bee too bad
I guess. Then a separate set of functions could be added for lock+select
that do expose the return value (and adds the new flag of course). I.e.
i2c_lock_select_bus, i2c_trylock_select_bus and t2c_deselect_unlock_bus.
Or something like that.

However, I have the feeling that *most* client drivers that do their
own i2c_lock_adapter/__i2c_transfer/.../i2c_unlock_adapter really would
like to also keep arbitrators locked during the operation to prevent not
only the local master from clobbering the chip status.

Hmm. New idea. Maybe the arbitrator ->select should remain with the xfer
as it is today, but then you set a flag that the arbitrator is selected,
and delay the deselect until the unlock (instead of doing it last in the
xfer). You would of course need to check the flag before doing the select
in the xfer, so that follow-up xfers don't redo the select.

Something like this (untested, written in the mail client):

static int __i2c_mux_master_xfer(struct i2c_adapter *adap,
				 struct i2c_msg msgs[], int num)
{
	struct i2c_mux_priv *priv = adap->algo_data;
	struct i2c_mux_core *muxc = priv->muxc;
	struct i2c_adapter *parent = muxc->parent;

	/* Switch to the right mux port and perform the transfer. */

	if (!muxc->selected) {
		int ret = muxc->select(muxc, priv->chan_id);
		muxc->selected = true;
		if (ret < 0)
			return ret;
	}

	return __i2c_transfer(parent, msgs, num);
}

static void i2c_parent_unlock_bus(struct i2c_adapter *adapter,
				  unsigned int flags)
{
	struct i2c_mux_priv *priv = adapter->algo_data;
	struct i2c_mux_core *muxc = priv->muxc;
	struct i2c_adapter *parent = muxc->parent;

	if (muxc->selected && muxc->deselect)
		muxc->deselect(muxc, priv->chan_id);
	muxc->selected = false;
	i2c_unlock_bus(parent, flags);
	rt_mutex_unlock(&parent->mux_lock);
}

(i2c_mux_master_xfer(), __i2c_mux_smbus_xfer(), i2c_mux_smbus_xfer() and
i2c_mux_unlock_bus() need corresponding changes)

One more thing to keep in mind. Some arbs/muxes/gates auto-deselects after
the Nth xfer (always the 1st?), so arb/mux/gate drivers must probably have
some way to opt out of whatever we do to support "I2C units" across
arbs/muxes/gates. Maybe that property mostly applies to gates? Anyway, the
above is not a complete solution.

Cheers,
Peter
