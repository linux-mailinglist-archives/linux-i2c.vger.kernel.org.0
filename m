Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0D2178F984
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 10:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241675AbjIAIH5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 04:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231522AbjIAIH4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 04:07:56 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2120.outbound.protection.outlook.com [40.107.13.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D7DCC
        for <linux-i2c@vger.kernel.org>; Fri,  1 Sep 2023 01:07:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gv7ASXL9KifrXH0KSui5ommeeg+HHF0zNlwfvIJeZUrqMSITj1e38IeiJuhUBj/6D5LacooqDgwomiBZpJOte01Ci1UDdUfuQ9tgTxNIKFksjMfYEIRriN76qYBZ5ThdxvKQWF3hAKxyFhwMCnP6yEjAwqYzlDNWGwNxOEIx7Jq7XHTvvZuAM8u+a66obzegSRDWMe7sbbsGIBgbJ/VWO065So5UxNRqwx4zi/zW7LV0uZIhD33/kJ8QJVcqgRwGqTWj5QegE3F7sQuSGUHBelZIbJruU+PmgSRg4UsbSFkCpW7Unic3zOlfh00fBN5SOTTgOOUAFPGyxEVqzUqsgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzptBOyb+W3zxIKKtgLRC94a+1aFNJlrBYDx1CmwL30=;
 b=FJzpbVbDxJhk96BRfxNKiVOTRfCapZX3hSmFyHlpBvrVTye5KzcdM6CLLdeCD9TJ37P24kibWcVVvcmwKy1DSjbOqH+KEIOKlL06OwUqAmTKe29aPqvAgzIGpk0Lk8NP/BCHxkfahl8La6k2bGMBGWgUAfM2s61OrgjgYs584Jsi7sOSvteszsWK8bEUbOowGJn8GGjX5sc8+epAPHfoygS83MInB11OpzOAEPo7/BzxJaso+zL7/lguBycPvGuN95Xie8FxduSadQvImWwIIgs/OgwtzPBMtbFr/U6CZ90yqY+Z5qNJWxP4W3K+8oI2uAXzfHgfHjENiwNtsh4B6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzptBOyb+W3zxIKKtgLRC94a+1aFNJlrBYDx1CmwL30=;
 b=OCOM0ws2L5SVq61r/3cXn9Uz4hBNVEr+u1BlViT/ZbJmk0grI1kv0TquiXiqZxn+HYDI6Y41uJeJ07RVXGAcrPjgdUGOQvMkfe004ImMmBbHpHmpFFPl1HOG0fFIZmALxk7n6V0hzT3IOZwcFIqprug7Us7zBtbPGxQC3YQ6WgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DB9PR02MB10372.eurprd02.prod.outlook.com (2603:10a6:10:3d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 08:07:45 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c%4]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 08:07:45 +0000
Message-ID: <0bd8048e-65bb-8eed-d768-390bc29ee2b6@axentia.se>
Date:   Fri, 1 Sep 2023 10:07:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] i2c: mux: pca954x: Make sure the mux remains
 configured the same as before resume
Content-Language: sv-SE, en-US
To:     Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>
References: <20230831181753.154787-1-marex@denx.de>
 <0d768c94-604e-7fa3-21b4-65598e30edf4@axentia.se>
 <8df4003e-41b8-0ec7-0706-77641bdcd6a5@denx.de>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <8df4003e-41b8-0ec7-0706-77641bdcd6a5@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3P280CA0032.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::33) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|DB9PR02MB10372:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b8ab49-7f48-446e-6652-08dbaac28609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U0JJw8JUTj5UQ6pCmP8/Yt3sZJhR25UwmQj8PIR6csGMcrrMxaq7iUBfT9PO2Zo/CDskbW1Ich3d8yiZSLZ1WTq9H1/w+gbFkmJJCqrpKREVhLz4E2ddF0Ya2r6fyBzyYavh+lBcWAngl6njIAYQ8Z7NcDbKcl5j2po8v2Ohmay8wghWbTlJTIMzroZAvgOanrOqppJI1rck2JH+pIqFdlbXIJEVaDQUH/4iD1OoyPw5mJSUkR0M4vSQmL9xp0RdGxhNicFZvbexeEJvtc6cq/uMPm9Dm6/fpWO6wT+vEWsk6clWvUSudDdr8XPtVM7JKmHtLZNuyNHGmRYMTTlFvnxBWrfc+QW16WhrgtURQDo0DKyEpJY8b4mVt1taiQO7eaAbH54cA1pGnDj87PDS5ytP/IGSFhM0sQIxmSJzrOyr73U/XzMACqaoJNlhekinXyP2KzcHvPHzA1zhZmV9QrESVMpiWqgKMHPYZ+Zhxq70cK1rz9KSp/KOfnIY3Quo76IDXt6J0X8ac1HXTAe5GAEvMHZx34HdG0v+NPkBpBcQzzoN1KK8DPdVhzbgE/r6EhI+8U1A3IGCaF46uAIpuY1RRICcFAvjjbzRVX0V/SeXEcr3xXWWf4SRIv/kUogYzLGjId9zTZpbo53m6u0x7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(376002)(396003)(366004)(346002)(136003)(186009)(1800799009)(451199024)(6486002)(6506007)(6512007)(53546011)(478600001)(83380400001)(2616005)(26005)(2906002)(66476007)(66556008)(316002)(41300700001)(66946007)(5660300002)(8676002)(8936002)(4326008)(36756003)(86362001)(31696002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZitBTFVLNzB3YUVLY0pSRTlwK2plOWFCcTJTNUIyanl4Z2lkMWNLMEZDTEdo?=
 =?utf-8?B?QUt0Z2tTOXcvNGp2ZENuSXJzbDlkVnlIenQzMmJhVkV3bWo1WmU1QTltSjNI?=
 =?utf-8?B?MEZoT29JMGs4L09KcXVUZGt1STFTVCtXckQ0NUY0MkIzWTNhS1VWWFQ4eTNQ?=
 =?utf-8?B?eDUwUUw5QmkxYWcwelFHVEZIQTVnanhDZGVWbDVLUzB6N3M5Y2RJaldPUS9z?=
 =?utf-8?B?Y1lxZ1FRL1lyQW9pTGM3eFRLZ29YSHpDazRFQk12ZnZaQ044a0ZCSGRBRm5P?=
 =?utf-8?B?MWlvZzdoVVNDVHpvQ09CdytwUTZwNVVZTkRUUG9qMjNOeUdlYUpNNWdpajNh?=
 =?utf-8?B?aFdzMHFxa1JUMFdBREduUlM2bU8rSHliMEJrczNqT0ZUWGRGakdIcU1NUWpp?=
 =?utf-8?B?RVNEQVdwRDJsZ0lNRWx1NFZ0ZmVyc0FNVzc3a011ZmpFLzhtOVBRZVFFdlpK?=
 =?utf-8?B?TnFSSkFzMG00N3pxZW1QQXhubDlrUEY3WTY2dkxZYW9vaU5zQWROREVXMWxY?=
 =?utf-8?B?a3Q3enUySFpJVUdDcjdIZnVteUJQY1AxWHplNXdvMjJsYllVaTBQWWJiWXJ1?=
 =?utf-8?B?NGllUWM0aGVZZTRnRkxjMGpmbC82clV4YlpmTTdXVUV4Z1RWMTlySW9jQk5Y?=
 =?utf-8?B?bzFRVDZ3NnlaZ2tEL3ZSVWtjekVKd0pDZ1RkZG5UeWtxQUVPaGlFYnlJbG96?=
 =?utf-8?B?OVhVWElBd1RoRUZ1RmppZEg0b21jTG00bDhFVmVPWXZyU3FXeGIyeXF1NXBZ?=
 =?utf-8?B?eStvRVpNWVFzSk5YTGxVdXdqVVorQkdpemV6OUMrVVBLMEs3RjBVcDdaR2oy?=
 =?utf-8?B?QzZ2cXFkTGUybEpCSEFpcENGS2tCY0gwOWs1d3lNMTRUVkx5bVhlOHdDWlMv?=
 =?utf-8?B?TWVabWpselJBTVgyNjNXOHYwZWRtSUFzVFgzZWk3T0diWndXSGxkYmFkWUxE?=
 =?utf-8?B?T1NnQmU4S3JaVVp6bXVmdkVQUnJvZnFXQ3dTTElFVmkxemhqaStwdGtsTXlT?=
 =?utf-8?B?YkhqYmxWN3VqSDZnbzZscmhVbzhkTERUUFdpcTdhTFRDdnhucW9GRGkwU3VO?=
 =?utf-8?B?MzZZbjF0TGJOWDdNZkFTQ2lQQ0c1dVVtaTBDQjFLN2h4czhiMExkdkZ4bnJC?=
 =?utf-8?B?UUt1b2RTa05lR3RXbTJtS0NuelRnbzJEK1V5Z243UjFPMVVkM2NWS0hqY0RO?=
 =?utf-8?B?WlFzSVRWMGt0TGFLbUdKU1luN01XM0x4NXhDSGszckxZYzVZMHVBVEhYY1BM?=
 =?utf-8?B?UzhvQWtGbEpHcTdDWVZSd2ZqZmtybTRBUlZmUzlpTFByM1BtUEhyb01hTTBk?=
 =?utf-8?B?YWI2WjJSWkhCc0NpUGlOYlBlcDBEMVozd0VNMXR2RVphcE51OFRFaVZpUlZu?=
 =?utf-8?B?dzlnRFBKRVE0YmtKd0ZPbjN1NXlmOGwzOWdjWkZybVRyWGxpTUt2YlFsN3hM?=
 =?utf-8?B?SGNydmZUTGJiNFVSalZTVU5UKzBka0M4N2EzSVF3S2wrOTArYllnaHQ3dEJ1?=
 =?utf-8?B?cmFjOG1KdU9aUDRVNDllSlBEZWdaN2NMS1AzbkxXUElWazNtUjU2bE1XMThp?=
 =?utf-8?B?RXRrYUZXNHlPcy9wTWxOOUJXaWNHYmhGZW0vbnpkY2FKR3BwM3BXcktldko0?=
 =?utf-8?B?NCtGc3IzTTVWQXZwbVpHV1BxR3pDMkVxVG9TRThoQ29yMHNJbXRhbi9vMGgz?=
 =?utf-8?B?UGtkQVMvbDBORFlKMjBpazM2Y2xXVkZ3TXYyUXFhbitpam40T2t4U0lacWFH?=
 =?utf-8?B?UUdnNHM2NGFZTW1RTGV2ZjZIOFUyRkJUczRWbFVwVG1hY04rd2RoU1pvRnp0?=
 =?utf-8?B?WUlDeVp2aHVyeTFLNE9BYXpNWEpEMXV4MU1EejFDY21jRm50a1AydFlFeTBN?=
 =?utf-8?B?OHcvTXVJWDJndm5SMkJHekFQYzlxeGxCcGtvZTd6SjgwcWdjVHBSalJ4RE55?=
 =?utf-8?B?TzNVU1QwTEcyOTRpRWJzMGxHY0RxZ0NIQ1Y0VGlvanR1YjBqdWIyandIeHIy?=
 =?utf-8?B?a2hRaFBSb01VRDYrRVVEMzZFVUhmSyt3a1R2KzErREtxMUw2bnJTZjMxQUI3?=
 =?utf-8?B?MTdKMnB5UkhPKzg1ZzEvQm4xZVkrVWQ3Qm96ZVBtVzlMTjRiUmw1ekZTYkhX?=
 =?utf-8?Q?SemRvZPzHCYLj7btJjnfVj5uy?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b8ab49-7f48-446e-6652-08dbaac28609
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 08:07:45.4488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arO66Hx3qiKxgT1JLgTwiUQoXsZG3NxW2SWQP5sUNQVvATK1/4xE4//0/e2o+GGA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB10372
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-08-31 at 23:50, Marek Vasut wrote:
> On 8/31/23 23:24, Peter Rosin wrote:
>> Hi!
> 
> Hi,
> 
>> 2023-08-31 at 20:17, Marek Vasut wrote:
>>> The current implementation of pca954x_init() rewrites content of data->last_chan
>>> which is then populated into the mux select register. Skip this part, so that the
>>> mux is populated with content of data->last_chan as it was set before suspend.
>>> This way, the mux state is retained across suspend/resume cycle.
>>
>> I fail to see in what situation this change makes a significant
>> difference? For me, it's a nice conservative thing to initialize
>> to the default state after something comparatively heavy such as
>> a suspend/resume cycle. If there is a significant difference,
>> then maybe it's not the usual access patterns after resume since
>> there are probably other chips initializing as well, in which
>> case this change might make things worse depending on what
>> devices you do have and what idle-state you have configured.
> 
> Isn't it better to keep the hardware in the same state it was before it entered suspend ? For me, that's the behavior I would expect from suspend/resume .

Ok, in either case the current behavior isn't a bug. Please drop
the Fixes-tag.

> 
>>> Fixes: e65e228eb096 ("i2c: mux: pca954x: support property idle-state")
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> Cc: Peter Rosin <peda@axentia.se>
>>> Cc: Wolfram Sang <wsa@kernel.org>
>>> Cc: linux-i2c@vger.kernel.org
>>> ---
>>>   drivers/i2c/muxes/i2c-mux-pca954x.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
>>> index 2219062104fbc..97cf475dde0f4 100644
>>> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
>>> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
>>> @@ -620,9 +620,9 @@ static int pca954x_resume(struct device *dev)
>>>       struct pca954x *data = i2c_mux_priv(muxc);
>>>       int ret;
>>>   -    ret = pca954x_init(client, data);
>>> +    ret = i2c_smbus_write_byte(client, data->last_chan);
>>>       if (ret < 0)
>>> -        dev_err(&client->dev, "failed to verify mux presence\n");
>>> +        dev_err(&client->dev, "failed to restore mux state\n");
>>
>> data->last_chan is no longer cleared in case the write fails. Is that a
>> problem?
> 
> If the write fails here, the hardware is in undefined state anyway .
> Either the next attempt to flip the switch would help bring it back, or, the system is in undefined state.

Being in an undefined state with last_chan being zero is better than
being in an undefined state with last_chan holding some other value,
so that writing the register isn't skipped in the following call to
pca954x_select_chan(). This is the whole point of clearing last_chan
on error. Notice how pca954x_select_chan() also clears last_chan on
error.

Cheers,
Peter
