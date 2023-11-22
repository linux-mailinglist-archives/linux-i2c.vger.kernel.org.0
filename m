Return-Path: <linux-i2c+bounces-387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 186FE7F4DFA
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 18:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACA26B20D35
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 17:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956814BA89;
	Wed, 22 Nov 2023 17:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="as20GBn+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2135.outbound.protection.outlook.com [40.107.21.135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5680197;
	Wed, 22 Nov 2023 09:14:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbhAgg7TBhpNVNXIiQ4o9x1aTJ+4cENxtPHG9OTaxFmbdXFzc8QtWRGYNOiYQZ1ADCheBHhoYnXZQYlrzrKr1TKMZLyYHpb74Za54CV+Pn5Af8nb2fRPhU0TVwycIIRdSbW0/UIu2A1wBU4LF3l+cX8Viw/z/YCOSMKxCO6aFF5LKyPKerJFETqlwktSsx2yF7hCoQT7FYplrP9HrYimKsOMJlo0/vwT9XR0JcciFOMbvOXlZTa4oHFxU7Sow5xiiXn0HYoVU48EHHNx9gA2AfaG9zjMX+mII38R8qnoxE+q41FgJsXs1VGEMPfSIv7PA4R5Z+kUHAQlE83wgOfIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auExw+X0Vw9lLbrD7bf/W981SegHFS/qN2n77sP1cfo=;
 b=NAb5zLW40EMh0qjLlaDTUXB//lAcQ4uBIeaWNv9+E0nUgLTN/QLQLz3/vmXomtVZc5aSZobgm7Du0XHs1gFoFmxGjiJQ6AbplSH9DqxvdV38alICE2cbK9Kmod5m9zDrG9lXOybV+e8KnRf1+G70CImTsvHXQGPWwv4ZD2rx00v9yTPA69kFnOvDyprRBZqg5fXQ1IJHkWxWbP5yguusuP+a0D8KcqV0aaHdD1FkqqmrBLY5UojUPe/PmxFCzayi5eFZLKUTne4uHdnXAwFXBDDH6aY4Bj3uLt6VJP17Z4YcSEKw5wYKjSzzpZocZ1z116SX8CFQiSygDUkZ6iU9kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auExw+X0Vw9lLbrD7bf/W981SegHFS/qN2n77sP1cfo=;
 b=as20GBn+u6mZWEqlp1PDMNGnwwkjkF68a/4x/ltHgcPPowYudlq9OTwcmUoWvRqZaBZGacGE9LAGrE0fVe3xcXGQi6PTuUgaOvuMNKEPN/UOgEV1DTXXWVIKRPExGoI4Nff+angUHiWGjE8Cp50quu1mEXmEd8W7Ad+oh2tmgW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by PAWPR02MB9173.eurprd02.prod.outlook.com (2603:10a6:102:33d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 17:13:59 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::eb7e:2017:35fb:d31b]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::eb7e:2017:35fb:d31b%6]) with mapi id 15.20.7002.028; Wed, 22 Nov 2023
 17:13:59 +0000
Message-ID: <978e008b-0787-4204-3d5f-16518f35a3c9@axentia.se>
Date: Wed, 22 Nov 2023 18:13:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] eeprom: at24: use of_match_ptr()
Content-Language: sv-SE
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20231122155916.38037-1-brgl@bgdev.pl>
 <480fef02-09ed-9a32-d5bb-e7114381220c@axentia.se>
 <CAMRc=Mc_KAX0QWSoL9UEwwjFCD=fHv6ydceSYwaY91C=RkURxA@mail.gmail.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <CAMRc=Mc_KAX0QWSoL9UEwwjFCD=fHv6ydceSYwaY91C=RkURxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF000000D2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:2:0:14) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|PAWPR02MB9173:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1885d8-5f9d-40f7-fdad-08dbeb7e6af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xr5tUhevCQNtkfRry9jqaMGlwgpRUpfuXLP6mofZN1cqc90qhCZ9NcCuKwCgzxeGZINwOA/PeaTNwRAF4SMz8g1CBVxV96tSjowC+9YE1ylFqvxrp1xsITCb85xxmXNqmPeQmT1d7S+whI/7+Ou+tQ8TCan1p4+llpOW0KjPnGFXqVYlDwHu5BCwMkt5sDcLlin0JqhgTsiwrRMBXYBIVBY2tV9dMIMMFSxsj8RdrLGxR0sYCIUzUBcLfgt7Zh0i2psrWojaORRv5lfsF6VGr41XXNFR1uzKH7NlXmDTTfosEcelCtzJ1FfPljKemCSBUJ7q7BgyCzPMLX3DoNor8UOsaI8vykpQoVs1X9t4t1IKV/7jZN9tUcbF8aMq0QGcXyNbLTvosXNTX/iUe67hNn5jMSJPJtzHM4h4uNKOsFS1AKMdLhybPwBGDvctsALeCJFpeRwMi3WPPW7P/7G9vRffRNZRML2Ow/mdg4oraNOilKburEBizy7dgE3u0faWEG3D2WyhecS2YQf2siYMQmqC92pFaknCD7aKFxxLl/0idVqzgMluH5qmPDxNopMJyF0hvsb43aZyfOgf4xo+nMTTutkCr5682vfgwWG79avUYDwPn29t9BJ3aYeRcJl1XUMzx8aSBKxKS4GjRskPCn0eMl3JetWUQgvxn3yWr5RFp8lYJKsgkxFerdfRrjaT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39840400004)(230173577357003)(230273577357003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(36756003)(86362001)(4744005)(5660300002)(2906002)(31696002)(4001150100001)(6486002)(966005)(26005)(83380400001)(478600001)(6506007)(2616005)(6512007)(4326008)(8676002)(38100700002)(8936002)(54906003)(316002)(66946007)(66556008)(66476007)(31686004)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHVOdlVmcldDeVpTSG9TejRXeW1RYzllemp4YUFYVkhZOG1MblBVYmd2Q2tt?=
 =?utf-8?B?V05NaTF1TkErRGFjVS94amp3cUJOSHNLaTRVZGNEeWNNRGlybkkxYzBJalFU?=
 =?utf-8?B?Z2NSTFFFNDQrYmRIN2VjSVB6UWMzNFh1VEx4QVhRMzZpQVVYMENkbVVTdndS?=
 =?utf-8?B?SUJHMnd5dU5QK2xQNGw4U2lpWDF5UzdEVzBiS09yeHRWMVI5NTV1UCtnbzhJ?=
 =?utf-8?B?a3lCdk0vNm5LVWhVcmo0T25BR0dIY2ZuTEN3VHlLalZDOGFYbzhyQmlRY3li?=
 =?utf-8?B?bFdMYzlSWCtyZFM2UTdMNUNkN2JNd2tFQUxCUDdaVGMvMVNBbHFjcUNpb2s4?=
 =?utf-8?B?QVdaWnhUMU9Bd21XdjBWa2lFcnJjeTFBbjZ2b1d1d2FyRHZpZkpEZ3pMbjRP?=
 =?utf-8?B?by9UNkJTT2loU01xRThkUGdCWmJOQnUxRXZtL2c5WHlaYTAxMkFscXg3a3Rt?=
 =?utf-8?B?akJDSCtXNXFxMWc1VlNGUmxDbUJ1VFpnYmhOVU91eDNmRmFBZ05oc0tJZ0Vv?=
 =?utf-8?B?M0cyVEN4ZUZrbzZqMlZaRXVTRXJnd0lKRElIMndjRzl0Sk1wallBOSt5OUNS?=
 =?utf-8?B?SEdiTDRIWldBcU1IN1phL0FKZDRuVXRRMTJrbEQyNlZrbnFoOFhpcHM0bG94?=
 =?utf-8?B?Z0NqUjBuZkNuTmRnbEdwYXU2dGp3SzgrNU1DTkY5Q1FORlN0S1BjNGJPY2FD?=
 =?utf-8?B?OWJjS3VBWituZWNmSTdscTNrbDhoWVhlT0kzamdtdU5XOHk3aXh3SCs0RW1G?=
 =?utf-8?B?NVpjMFdaWXZTK0t1SmdIc2V3ZG90OGZpN0lHVVpKVWpwTGoyUE5FQmgrVkJE?=
 =?utf-8?B?L0ovTmVNcXo5RXVCMFMwcDI4cFhwRXR0bGhBaW1wSTFRSmZhOUtGeWtWY0du?=
 =?utf-8?B?QkdYK21zOHBhcjlyZUVKOHNUalZxL2RBNVBPZUc3Mm9kUnR2eENrY0h4eUNB?=
 =?utf-8?B?SjF3RGZZc0tMdlZLbUNhRjlxdHBFeFI5eUlqWTVTK2NkQ3JPbHlyQ3lTZGx6?=
 =?utf-8?B?ZVVHb3pWY3RVeEdVU05vM3Fmcm1RR3ZyYjQ0cVhVUmtKdys1cnQyL0tYMXc2?=
 =?utf-8?B?bnhCam5HQ0puNmN0VHdCMnVScmd0MWFBT0VNVlZQN1hHOW5hQkxKaWN2cDlm?=
 =?utf-8?B?UlVkeEZaaTFNSFVJeVZKNWlVTm5hSlAxUlBPQVlOczdUSk9FVC9zRW5ZRW5Z?=
 =?utf-8?B?a21zblp5SGhONEk1azhQZVdNM0pab0htVEM1Z051dWRuWUJlMnhSRjAzZWxU?=
 =?utf-8?B?QVlTRHg1RlVrSmFveXlpNHBHcnl0UlFUbGtzS2JCb2xYV0ZhMW5HaXFpZXg5?=
 =?utf-8?B?VGlhdm0vKzc5MlpHaXZNVFlxc2d3SHExazVsRFdubkhzdS9Gb255QmlyMWdy?=
 =?utf-8?B?OElLSDZsREtmLzNRV3FraGFpNHkrRmtQZ3gyMDg5aHhHbTZxb3pvYjZ1Z0xW?=
 =?utf-8?B?ajBDaVBPVE14TjdkTUJBYTkzTG1XZTZBZ0RROFNzTkxwNmlKK1BPbHJrbXJT?=
 =?utf-8?B?UTc4RUtLSVJNamJXQXlDRS9QdllNZDZuamtjMXlrK3lHaEhxQU10M2ZnSUNL?=
 =?utf-8?B?dzJnVkFsY0pkRDNUa1RDaCsyNUdZbG5TUThvSlhGZVg3eHg0dEZ1R3lPOE4x?=
 =?utf-8?B?eTJ3K3lCeG1xV0Jtd25objE0c0RET2s1Nkk1L3lLOUkya1AxbWlBSEJzTE1I?=
 =?utf-8?B?Q3FrVjBFMkFLMUZhTi9JSUVUL2hyTFM2c2N2WXFHQ0Q1RC9hcmk4OFVIbnlS?=
 =?utf-8?B?M3A5RVA5YU4ydmZGLzNFcG5iZDBKQm5Zakc0WkdKVUVYc2FmZ2liR2ZjeHdS?=
 =?utf-8?B?ODdVeThMZmxEbjI0L2hBeEdTNkVlc0ViSTZ5cllWRmNRRUdMVzNHY29WbHU4?=
 =?utf-8?B?MFRUbWF4eERSWFpTQ1FMQlFCeDRSV01VN1AvNVZMVG9XYThjYU1VMEwvWDdT?=
 =?utf-8?B?cDFmZm1tcFJpM2treFZXaHpvK2hnY3o3L3R6TG9Gbk5WUzh1MEtJS1RjZ1hS?=
 =?utf-8?B?YjhRdEVZazBkbkxBYm9mTkhSR0lYWEZpSStLYUJLUjl1VmJjVjhreEJzN1FO?=
 =?utf-8?B?dVhXTzdoZXZ3MHhZOW5iNE1ZVXMwSXN5TnN6cTFwd285V0g5eUNlR05DTnZn?=
 =?utf-8?Q?aXIdewKdWxxHCyf463k8qNOX9?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1885d8-5f9d-40f7-fdad-08dbeb7e6af1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 17:13:59.8111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3OzEN+zLnjaMgtC59yscLb4Se2AYsb0AYh2ms0qgKICD9L/H2xkW0jC/sO4Iu9C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9173


2023-11-22 at 17:57, Bartosz Golaszewski wrote:
> On Wed, 22 Nov 2023 at 17:41, Peter Rosin <peda@axentia.se> wrote:
>>
>> Hi!
>>
>> 2023-11-22 at 16:59, Bartosz Golaszewski wrote:
>>> -             .of_match_table = at24_of_match,
>>> +             .of_match_table = of_match_ptr(at24_of_match),
>>
>> If you do that, you will need to also add #ifdef CONFIG_OF around the
>> at24_of_match definition, of you'll trigger a warning about an unused
>> const variable (for some configs). I think.
>>
>> Cheers,
>> Peter
> 
> Nope, no warnings even with W=2. This is true for unused functions but
> unused data structures are just silently removed.

Then I wonder what the difference is from the following?

https://lore.kernel.org/all/202311161306.opyfcoCY-lkp@intel.com/T/#m3a33dc4c3221ae167563bcff70757af776cf07b1

It sure looks like the exact same pattern to me.
I.e. a static const struct of_device_id paired with of_match_ptr(). 

CHeers,
Peter

