Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779F5403C7D
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Sep 2021 17:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352058AbhIHPaQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Sep 2021 11:30:16 -0400
Received: from mail-eopbgr00118.outbound.protection.outlook.com ([40.107.0.118]:39050
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234070AbhIHPaP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Sep 2021 11:30:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMKrs9T/fgNiyPOo68WWxPxfnYZZUDE/r/zT6SpkzJsEC9rxeHFBiZE9noQNEZGuPEIBVEUBFLPWQcG5HGFL6hvAK1DCkcFMPzBQDH+F7LTKiKAZ1s7ucQvIhwapJP2Zt6eoPOW1tR8+9tcgHay65+tf0EM3pHxzj1ao5MjzOHllW3iveZ4+gDiPNWxipncDCzHvi1LLFIVhjcWPEQ/52uBrPNOMPb99pT5PL5PSJHKAUe3sTyUj+4W5uwpuT7VNR8GRP3Ao8otFGF7i7/f/LpSVI82dpFULFC9KySwwutPQw8GIY/e37p9qCJMi6rhsZvUk4rfxXkFizJrK7DcNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ftyNbxFJy3sia2ohuKOF9OiFJMUf2UkhaAnSdDP1cEM=;
 b=NfWd25ujRUCQ5rz4iuEgU6kZ3999wkp5JF/6XcetVpmZJEXe/KkKQKy6tQ6x5LKyr85l0ZTXZBjUNQW9lZM0HxWCafYA+5Y+F14/7SWQWyzcqtsleDO65biawKM0Cw8gfrpERv+8B+qEBiiDnfHrHHKTNwS1ozQGhUzfqs5YaSd4i2qwdOz+iFTwdXeIsQW8djHrOo2UxhRICWxJAY6R5Sf/h2C8J2TOy8BNEaUjYuU4mXXPxdMPaS3vO0uY9MxTEgUhSR+/os6RR05acNwMsFz1i7BqoV++bPEYJiwzKeX4n9r6wwUDDsI1lM5hmUkMnC+Yc0H/VH/OGmdzkHJZ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftyNbxFJy3sia2ohuKOF9OiFJMUf2UkhaAnSdDP1cEM=;
 b=jVvonMIS6rnQDcQDOBXSdKV8kLmufZ+pwT84PDU8JgpyloHFPTZaFNT0Nni0V0I81fDKmsjLHXMS+ACRicPQfZc7996Voe/CDx8p/sTaQjsch385p/bIfmlLKpVl2XCQ8p/n3YXPyTRlep/hfVUkZ0yJC0yy444j6zKaoKb9gTQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB3673.eurprd02.prod.outlook.com (2603:10a6:5:8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.24; Wed, 8 Sep 2021 15:29:04 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a%4]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 15:29:04 +0000
Subject: Re: [PATCH v3.1 2/3] iio: chemical: Add Senseair Sunrise 006-0-007
 driver
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
References: <20210822184927.94673-3-jacopo@jmondi.org>
 <20210823073639.13688-1-jacopo@jmondi.org>
 <20210829175413.7ce30bfa@jic23-huawei>
 <20210830162051.rjqlhwvtguaivt3p@uno.localdomain>
 <20210830181117.6808f085@jic23-huawei>
 <20210831074011.d6f5rsix2mgxqba5@uno.localdomain>
 <20210905110429.34763e30@jic23-huawei>
 <5e9dce02-2884-d91e-78ef-da2f32258ea3@axentia.se>
 <20210908110019.kocdmytczyykcqfh@uno.localdomain>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <6f43a6d4-93ef-4cb0-27fe-cb70c1f43a9c@axentia.se>
Date:   Wed, 8 Sep 2021 17:29:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210908110019.kocdmytczyykcqfh@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0140.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::45) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by AM6P193CA0140.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 15:29:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c27987f-055e-4cca-6f79-08d972dd6443
X-MS-TrafficTypeDiagnostic: DB7PR02MB3673:
X-Microsoft-Antispam-PRVS: <DB7PR02MB3673604044A343DB91AFBF90BCD49@DB7PR02MB3673.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3D1OywVo9VUtlA0ZdHJ9IAnNAHVpSV/0/C/RAoIr6X+k1Qn4Ai6J5IhEEdFIrR1oqUzfN1rC0woauP+3z+DpE6e57+U3Cn0FzmXDbT7lMi5dYL7uCzaeSQB13IR92WDsgR9hcORDvFt8H/z3ANrG6wsyIcnVm0ivrppLT5QoMZMvOThAklEFMzG4E64WSObvaTZhlIMiQtMlbKUkYzCbq4lflKwmqjRV5qwXLYts+CRrX+VDAdbBo7aMdd4DrMhPOTuIQkn58rgJJhGr0uo8Xx4bJpBJutRWt1TfKLwOfTvfEcwByqqvTit0OyLm+lEZbY+Tyqn4nM+Pd+B+IZx/aKDX2JSvA3lkNNUigOEEtylU9JY4yGXOS8V43T9pot1233jOLce+nlzKAM+ejSUQcnweOafPJiyFA9LjMA98El4C7kRgPAAPwIZ1SReWfeFA5VD5uWwn2NUYya2CT0Ut+UThtPgZpQWXnVPkYOQp2GEnx0pT9DynVoyHC2OIkCRxb0p+gsxv6Y1FswJaKXxkvddpnIx1bOIM/4HNE6y85V548OcbaWtoxO4d9WMrttX4Baq+nRwghG1aT8KNI/mNrMLvXjYDquPN4Xe9xR56gSaWwuE454czJWYNPXsNEgWy1s3n6V1Cz/Yk+06On+RUvfCMK6IX2y2x4v6VT3Fmp78rPOPt35Bl7vhOwBcl9JEG/802qYSZSIyom90pLyGM0jxSQ2eCE31XUiF8rgZ/rpk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(376002)(39840400004)(346002)(38100700002)(2616005)(478600001)(186003)(4326008)(26005)(6486002)(66556008)(8676002)(8936002)(53546011)(36756003)(66476007)(66946007)(36916002)(6916009)(2906002)(5660300002)(31696002)(86362001)(316002)(31686004)(956004)(83380400001)(16576012)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDJNYVF4ZFpMNFJqa2JrSlRnNzVxM3JDSXR6M3QvZ0Q0Y1VOU1ZKRWJnbHhl?=
 =?utf-8?B?RVZJOWQyeU1UMVNrMGdYYzFBaEsyYlZKdGo0Z1NTeHl3dXRvS0JVTDNBODRK?=
 =?utf-8?B?OWhidmpuZExrR09WUSs3aUFzbksxdnVaWFZUNE9Td3J3ZkMyblBmSFNSNnFs?=
 =?utf-8?B?eVhJN0FVT0FmVjhHT05MVE5MQ3VMTDJ2YngxMlFRd1FCbTRpOVZhZWlvVzVM?=
 =?utf-8?B?YVVDMW5BNTkvdndVNnJ2SExsSzMzZTNYOEd3TnRFT05MY2ZndGFsY2JNWSsv?=
 =?utf-8?B?Y2J3aEJ4UXA2clBlbWIxWE8xL0VxR0Z4S2NPZjJIRzlWUWVIZGdQMG9jMDZa?=
 =?utf-8?B?Nm45L2txNzNJM1V4VHZpZ1M1c1BSUDdFazFTcjduU0FMZHFPQTZuNnZydlpL?=
 =?utf-8?B?Nktad2hrekNUMHNYV1JoSzNTNm1nVi82blZTZlBvdHFZcm1OakRDOUx3K0p6?=
 =?utf-8?B?WnFQRTRWVWQ3QnRQMHJYUUlZMU9GY3hHcjlMWTJqT3grOUxjTDFtekZINkR2?=
 =?utf-8?B?b1BVNmFlNWdjU3FOVDdmbVFBdDQ1VVRobzBVcCtHMFl1OE1TbnNTdEs3KzNC?=
 =?utf-8?B?Yk96cjhUWEhkeG5BSWpwYUo3UzYxUUQyTlp1QWswQlowcFhjeDFwRU52bTU1?=
 =?utf-8?B?Yk5WQXdaTUludk0wNWxSTFhaUmRZOVVXTjlPMDB6SlZjTkJ1NEpDSTR5cHpI?=
 =?utf-8?B?a1VmcGFsVm9jT3hLck8xQWFuT2dJY2RyY0FFSXZRZVJYQzQzWEFjb21Yb1Zv?=
 =?utf-8?B?RnVNaCtCMnQ3MjVUMDI4enV2d1N4U1ZWZEVHK1grUWVjSVlxeEdKdUFGUXAv?=
 =?utf-8?B?eUVXc1R1M1ljSzNNdzd2MUx3eC84cHh6LzRMWGhGTm1xSDlKeS9oLzFnS3NG?=
 =?utf-8?B?cER1S3NpTkU2dGxKQm5SSlJlTDFhU2pWVEY2Nk1YSUVLbGc3YTlyckdodDBo?=
 =?utf-8?B?aWxOdDh3YnV1d1l6NkFhb2hhSUpOM1laUzRIOWJJWC9SMnFDRWxsSUY1ckdi?=
 =?utf-8?B?ZS9hbXRwdDhpZ1RmRWhzOGFabE9nVDBmUnNpRXI5YlBtNWN4MEd1VzhNU1kx?=
 =?utf-8?B?djk5UEEvZkZoRkZINlJwM1g0VDFJd1U4UzZRRlNPNDN5Z28zSU8yQkRGUGFk?=
 =?utf-8?B?TWdnUXYrU24xRU1Qc214bjJlMFptTTZNU1NkNGdEZGZKaTd4SzFLNzBKb0NI?=
 =?utf-8?B?OXNvRXdZK0tLaCs5ZWhzOW1ZdXQrbERKNHRxYjl1TmpvMTZCQyt0SHN3WEs5?=
 =?utf-8?B?eWZYcVFoOHVnUTdycnRDRWJmRGsrZWVUQUZQZUQwVlJqVldyZGVUN3Exa2p1?=
 =?utf-8?B?eEVvRFZPNG5tRkpUOEJleVlXRi9pU1NoZ2hWaVg2K3hOUHFKOVdKQ3dxLy9o?=
 =?utf-8?B?S0ZNRmY2NmRuWWQxOC9xUXBXNDI2U2VQc2g5TEdad1J0dGUzaWU4YTE5WGxw?=
 =?utf-8?B?aVBueTk1QVUyY3RtdWMxSU5NUWNBTStkREx5bzhKamJ6NXY3NldwakxxVUZ2?=
 =?utf-8?B?SnI2cExLOExNNmsyZWgwQ014UW5wT0c2N3RJNnRLeXRvUEhIUi9yZ2g2MjlC?=
 =?utf-8?B?RWVkc3E3L3ZlRnc1MDZkdEJYZ3dxZFg4czJzbGlDL0VhSUtsOVNhTzJQbnRq?=
 =?utf-8?B?Z3pvYXoySXptL1NNeHM4bEJmWDIvYW1CcEs3bElWRVIvamtVSHp3S3hIckZX?=
 =?utf-8?B?dXVlTlUvd0xnbTNkZS9FSFB1N1NNa0JBSFJFQnBteGpWRWxiLzA5V21PYUt1?=
 =?utf-8?Q?OiPp7GQ47YiZ5Ks59mkVjPilKiKGk7+st7pecMk?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c27987f-055e-4cca-6f79-08d972dd6443
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 15:29:04.6435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDVpgMqznRpaFZ/MYE/cOe7LDS8k2jEwOANOKUTrbikiPEUemF8U0JCkhp+qZxl1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB3673
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-09-08 13:00, Jacopo Mondi wrote:
> Hi Peter,
>    thanks for your detailed answer
> 
> On Mon, Sep 06, 2021 at 01:03:52AM +0200, Peter Rosin wrote:
>> The way I read this is that interactions with other I2C devices that squeeze
>> in are not a fundamental problem. Not unless there are so many of these 3rd
>> party xfers that the device times out again. If my assessment is correct,
>> then I would suggest handling this in the driver by somehow making sure that
>> it doesn't clobber its own pairs of wakeup+work interactions. But see below.
> 
> So, I tested by sending a double wakeup signal, to verify if the chip
> goes back to sleep after -any- kind of transaction after the first
> wakeup. It seems it does from what I see.
> 
> I also tested by inserting a spurious i2c transaction to a
> non-existing address between the wakeup and the actual transaction,
> but I cannot say if that proves anything as I'm not sure if messages
> directed to non-registered addresses are actually put on the bus.
> 
> Anyway, quoting the chip manual:
> 
> ------------------------------------------------------------------------------
> Senseair Sunrise spend most of its time in deep sleep mode to minimize
> power consumption, this have the effect that it is necessary to wake
> up the sensor before it is possible to communicate with it.  Sensor
> will wake up on a falling edge on SDA, it is recommended to send
> sensors address to wake it up. When sensors address is used to wake up
> the sensor the sensor will not acknowledge this byte.
> 
> Communication sequence:
> 1) Wake up sensor by sending sensor address (START, sensor address, STOP).
>    Sensor will not ACK this byte.
> 
> 2) Normal I2C read/write operations. I2C communication must be started
>    within 15ms after the wake-up byte, each byte sent to or from the
>    sensor sets the timeout to 15 ms. After a complete read or write
>    sequence sensor will enter sleep mode immediately.
> ------------------------------------------------------------------------------
> 
> I think you're correct assuming the only way 3rd parties could
> interfere with the wakeup session is by issuing so many transactions
> that the bus is not available to the device for such a long time
> (15msec) that the wakeup session expires.
> 
> Other messages, not directed to the chip, doesn't seem to interfere.
> 
> So locking in the driver should be good enough I think.

I think so too. Even if 15ms is kind of short... I mean, locking the
I2C segment can certainly exclude (some) 3rd party xfers on the bus and
that may help, but there is so much else that could potentially cause
a 15ms stall, especially on smallish single-cpu devices.

>>
>> Because there really is no way to protect against those extra I2C accesses.
>> With a parent-locked mux you can (ignoring arbitrators, where another
>> system may possibly take over the bus if too much time is spent between
>> two xfers that were supposed to be adjacent). But if there's a mux-locked
>> mux in the path it's simply not possible to lock out all other xfers on
>> the root adapter.
>>
>> With a parent-locked I2C tree, "locking the segment" is equivalent to
>> locking everything all the way to the root adapter. But the whole point
>> of mux-locked muxes is that they can't operate if you do that. Mux-locked
>> muxes are allowed to depend on other (ignorant) drivers using other parts
>> of the I2C tree while the segment is locked. If you lock the root adapter
>> when there is a mux-locked mux involved, you simply kill that property
>> and sign up for a deadlock. Which also means that you cannot prevent 3rd
>> party xfers to other parts of the I2C tree.
>>
>> However, if you worry about 3rd party xfers causing the wakeup to timeout
>> again and that only handling it in the driver as suggested above is
>> insufficient, then it's an option to lock the segment. For parent-locked I2C
>> trees, this should prevent (most) 3rd party actions and minimize the delay.
>> In the odd case that there are mux-locked muxes involved, there will simply
>> be a higher risk of failure, but there is little to do about that.
> 
> It doesn't feel to me this is required, but I let Jonathan and Andy
> which have discussed this with me in the past express an opinion as
> well.
> 
> In case I need to go for this solution am I correct assuming I should
> lock the bus for the whole wakeup-work session and override the
> regmap_bus operations to perform unlocked access to the i2c bus?
> 
> In my mind this could be realized as
> 
> int wakeup()
> {
> 
>         /* Unlocked wakup ping */
>         __i2c_smbus_xfer()
> }
> 
> int regmap_bus_read()
> {
>         i2c_lock_bus();
> 
>         wakeup();
>         /* Unlocked i2c read transaction */
>         __i2c_transfer();
> 
>         i2c_unlock_bus();
> }
> 
> 
> struct regmap_bus regmap_bus = {
>         .read = regmap_bus_read,
>         ...
> }
> 
> int probe()
> {
> 
>         regmap_init(..., regmap_bus, ..).
> }

Yep, that looks like the right direction from here as well, should you take
that path.

> But I somehow feel like I could have locking and wakeup handled by a mux's
> select/deselect and have a simpler read function. However even if I
> think I could have the driver register a mux even if there's actually
> no muxed bus behind the chip, I'm missing how that would work if not
> by exposing this in the DT bindings or by registering an
> i2c_board_info, but this feels already too complicated to be worth it,
> right ?

This basically is exactly what is otherwise called an I2C gate. You have
to do <something> to get I2C xfers safely past the gate, in this case
wake the device up. So, that model isn't wrong.

However, since the device wakes up on *any* action on SDA, would it not
also work to make special I2C xfers, with a restart instead of a full
stop-start after the "wakeup call". That is, if you can assume that the
I2C adapter is flexible enough...

I.e. something like this:

static int
sunrise_foo(struct sunrise_context *ctx)
{
	unsigned char reg = 0x17;
	unsigned char buf[17];
	struct i2c_msg msg[3] = {
		{	/* wakeup */
			.addr = 0x68,
			.flags = I2C_M_RD | I2C_M_IGNORE_NAK,
			.len = 0,
		}, {	/* write register number */
			.addr = 0x68,
			.flags = 0,
			.len = 1,
			.buf = &reg,
		}, {	/* read register contents */
			.addr = 0x68,
			.flags = I2C_M_RD,
			.len = 17,
			.buf = buf,
		},
	};
	int ret;

	ret = i2c_transfer(ctx->adapter, msg, 3);

	...

	return ret;
}

Cheers,
Peter

> Thanks
>    j
> 
>>
>> See Documentation/i2c/i2c-topology.rst for some discussion on the details
>> of mux-locked and parent-locked muxes.
>>
>> I hope I make at least some sense...
>>
>> Cheers,
>> Peter
