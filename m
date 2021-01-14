Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9620C2F6CE5
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jan 2021 22:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbhANVKy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jan 2021 16:10:54 -0500
Received: from mail-eopbgr60115.outbound.protection.outlook.com ([40.107.6.115]:59364
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726013AbhANVKy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Jan 2021 16:10:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGNAe3DJXwBpytzqbEmipzA530gks5xMIqSVYhYuZfbK5WdxPuGyxSfmp6YCLBhrN/DFoyo07yTNz2DjxIMGNlJ4b9Zw32XIIFB0jvYFI1QlXwKzSk9IRJuZ2dgNglmt35R2NhVWQGcwp/c3tQGb9Na6UQ9XXapkuTXEvdKwz7ENNk8RogIiF6HQ4osYYWtF4TOPDtOJun2RdDhEARWUZldKQJcImGX7eJXWsPJrF4i2PVou65qbDmqyaVZxhhGZSkquEZCk6d9az7BG01po7wQBKOVsQrUQLUj14F+pk3W7WV1AxwJcSvzF9ODcOCEQ5L7l38cqMDAZcvb3noBsrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxwPaSnv2GsA5aS4eHTAlj0eaJ+1HpvJqTlYPoho6hg=;
 b=enTzfxRWy/+KcIw9DmPeBczqhMacSPkm/7m+dv5uLrRb/JfcX7HDaXc+c6GB3S9V+Vvld8KZiDB6A617PtR0putOIyS03pLmXr7lUhhCGwlvXs9wGa62E3xhJvrGv2Ap+ACHocr7AvSSw68tq3PQiI1Ne8d5AM32LKKqYh2h7BeKbFvZWld9ym+ayx4OC8oq6oqhIPyGqXYGL7mdHQyz91r1wCSK9+TVm0ia1HFISACKCFFygpUI9VzRSV/1gNoibuFzLXVOhspLlX9RAQYF/i7x8Cs2bcooatog+yb7ffGwLMolvqZR/SWvD+NDt0ZZVGirFNj7ZZaJpm+jbnoH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxwPaSnv2GsA5aS4eHTAlj0eaJ+1HpvJqTlYPoho6hg=;
 b=FB2OK+5rDovVY2tJBVS4mQSqgtQTW+PN56MsjNIKxfcGP9QJi9YciNgqGD8b+v5tAgcnTvs9aqezY4TZl9HgEICOZYijjt2YsXh64Px2PV5ck2xwU2lCzrRAp0W3IV/cPhqnIHCYvMp2wrHyHstmVsBLsFLnG15RTcGFZ4xLE5U=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6104.eurprd02.prod.outlook.com (2603:10a6:10:183::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 21:10:05 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 21:10:05 +0000
Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver to
 support word address space devices
To:     Vadim Pasternak <vadimp@nvidia.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20201118144416.184120-1-vadimp@nvidia.com>
 <20201118144416.184120-6-vadimp@nvidia.com>
 <b1e3b52d-ddb2-ac56-665c-7500c939a55d@axentia.se>
 <DM6PR12MB38989872E06EA9593E862F23AFAF0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <268612bc-dc4a-cfcd-f529-e8540adfd8dc@axentia.se>
 <DM6PR12MB389804F87C41F41210837810AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <e02caf3a-86b7-23de-2723-3abe97fb92e4@axentia.se>
 <DM6PR12MB3898A35B743227426802C081AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <5860104a-f922-068d-18ca-32b69c7970f7@axentia.se>
 <20210112101144.GA973@kunai>
 <827c0c7f-dbe2-2769-749e-be838d890101@axentia.se>
 <DM6PR12MB38982210DFF37C7A0591E481AFA80@DM6PR12MB3898.namprd12.prod.outlook.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <184219c7-ef2e-06fc-e27c-f6d5ee6266e2@axentia.se>
Date:   Thu, 14 Jan 2021 22:10:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <DM6PR12MB38982210DFF37C7A0591E481AFA80@DM6PR12MB3898.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1P192CA0007.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::17)
 To DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1P192CA0007.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 21:10:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c074620e-a50f-45a7-9a1c-08d8b8d0c40f
X-MS-TrafficTypeDiagnostic: DBAPR02MB6104:
X-Microsoft-Antispam-PRVS: <DBAPR02MB6104ECD07C9F0C9E68697C98BCA80@DBAPR02MB6104.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rGEnsiMZzj0jzNqWKQBWTwcp9GhKtVGe0RX7kHrjRizNZNh6+3CL1W9MikVbZo6h6Fo49iIQPmaA1nmDo7Ik+TCNSYsqva/4DmjkRYuJejSItAkP4DLzdPKdKjppsmWLz7liX8ZOavpLuB57yWgXucZ7l0XBeP7um1d5iD4dtLnEGemld7aHqq0u7FPBUPDrDNQoTdhah5OXOj717VLoaFunn5MVqVsYpN7fzlM1zftfVW1aUWsoFJV444LI1IN1zeTseupDyZUabd3yOjiaA3v1aXUxpJJ9U+g1ZE0tpL+S39eSHqisBY8iPcipxHWrJ/4IY9x+kPvIqSc4Tu7zngYowPAnEYdEbOCobdAlCecor3fXepBpTmy6oE5ssGdOVuVkHhofsA7NnvUE5LvtlZQiGGMOh6lh0VLdien0/n3psQM10BJgCQTIXvpSTYKFSKeks4rXdhdQnQ0+aFSw9tcjaNwUCMF8RTYPdx/T76Sc0xQC0ojSyJomb82NAV1w
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(39830400003)(366004)(376002)(2616005)(478600001)(956004)(36916002)(16576012)(26005)(53546011)(86362001)(6486002)(5660300002)(66476007)(8676002)(36756003)(8936002)(186003)(66556008)(31686004)(31696002)(110136005)(16526019)(316002)(2906002)(66946007)(83380400001)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0JIVHlOTGFKcVlrWm8rOTRVQWdpc3UySXZhT2xyaC9JaVM1N2djaFdVTGFS?=
 =?utf-8?B?Q1VOeUxvNy9yZlVPYXZScGRFekJadzIxTndBSW5LaFZ4MmY4UFJIekhIMkYw?=
 =?utf-8?B?Z1FLV2RDYi9DTlAyUTZUOWJFZkpKcGlKTEJYRm9CNmJBTmFyL3p2T09LWGhZ?=
 =?utf-8?B?VlN4dmtlMkRhSHRlMWZZYTN5ZlhraVR4dHZNbXJVMGhkc1hkNDlpTHdNdHNK?=
 =?utf-8?B?cjJVdXlpSllTZUpWZHdVa29EaWJqS3Y3MzlpZCtOOFVQaUxjdVNwKzJkZGNZ?=
 =?utf-8?B?ZFJzTlVBNWxFaUNaTzVVbTZ6Q2dENDFYVDJ4K3pXQ3hYdEVIRzZKcmZVVEM3?=
 =?utf-8?B?b0JycllUUTJsZENkaDVYcU56bFBYVmNkTVNFREJ2bHlscWJsTzhTQjBMYW5o?=
 =?utf-8?B?d3M5Q1pPakVmWEdVRDMwSjEvVFlBNTFJMS9tL2RqUkwyZVI1eCtvVzZ1Qi9E?=
 =?utf-8?B?U1NtSzlWUkpGUXJSVWVGTCtCNWdjOEtVSHVSd1ZuRDl6M2J5SDRjTEZwZnlY?=
 =?utf-8?B?YTN3VCtjZGFzL01rWXZYNG9xZE1mU2hsTWsyQTZJbnY3NUNmUEdXbUZESXUr?=
 =?utf-8?B?MWlHbHAwamlyNWloeHF3YUdLcWdnSzYrdFJINjYvSmJheDdUZ1cwTVlTcHVt?=
 =?utf-8?B?eEwwNHE0ZHNLdmhCYlVFV2hoamRzQkY3TXdEYWxLNlZ3aHB3aFNUNEthYVVz?=
 =?utf-8?B?WFF4N1BYUGJQNVUwbUsyWTI2UEhPVUpSa3RrYklCSmY1dmdsemQwcDRHUVIx?=
 =?utf-8?B?dFIzb3dSc1I2bnNpSzJDRzZESE5mcEo0YzUzQnpFQU5MeFEvc0tzeHJ0VWg0?=
 =?utf-8?B?VjI5Z054c0gycjEycUsvWjFGOFFsNmx3Tkx6OU1MZ0trTmZDamRMNkRkb0pG?=
 =?utf-8?B?MUNXQkJxRWsvc0Rza0F5bm5sYmxGZngzcG53aFZSQWg5a2lIN2p0bXNiYk8r?=
 =?utf-8?B?ci80YzFCTVM1YnNwMWZ4WXlEZ1dZeEp4MTZqZ0FsR2dXRUV2VGpJNzdOekp6?=
 =?utf-8?B?M0pwMHAyR3RnVE9HN0lCV25Xd3hRZ0R2UnNFUmc4U2lOSmpMU0pkQ20zWWF5?=
 =?utf-8?B?MDRBTm1GeTBJQmlOYlNYSHNUYXIvSWlyS3NXWldJZDllMlZ4WFFFdk1KUmo5?=
 =?utf-8?B?b25kVDdubzZtS3FCa3Q3VlJXcGl3eHEyRElxSUpvd1hBR0JsRHMrbXBXTkFz?=
 =?utf-8?B?QmlBb2FwUmtDWmdyNUJGYUdYSGpPUFRtRmpoSVVXTFQ0YmlIb3JzQUZPR3dL?=
 =?utf-8?B?ZVFuZC9sWnZ1aE1QcXBBZ0YwR2FWbWNQQzNDRTVxUGJZRkFqb3RwVmQwV2VF?=
 =?utf-8?Q?eQsifiHd/EdeyMdYML5qYkMxDSeUb4Rkx2?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 21:10:05.3861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-Network-Message-Id: c074620e-a50f-45a7-9a1c-08d8b8d0c40f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMeaVrX6I7fbdytYLDN2OpRjziRlYSUx9o6tXKoJjb0CLtHSbBzuwAcCB16+aNkg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6104
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2021-01-14 19:43, Vadim Pasternak wrote:
> Hi Peter and Wolfram,
> 
> Thank you for your comments.
> 
>> -----Original Message-----
>> From: Peter Rosin <peda@axentia.se>
>> Sent: Thursday, January 14, 2021 9:49 AM
>> To: wsa@the-dreams.de; Vadim Pasternak <vadimp@nvidia.com>; linux-
>> i2c@vger.kernel.org
>> Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver to
>> support word address space devices
>>
>> Hi!
>>
>> On 2021-01-12 11:11, wsa@the-dreams.de wrote:
>>>
>>>> Wolfram, is there a better way to get something stable for user space
>>>> to interact with? Is there maybe a way to do this with aliases or something?
>>>> Setting up an ad-hoc scheme for forcing the adapter IDs feels a bit
>> outdated.
>>>
>>> Yeah, it feels rightfully outdated IMO. Bringing such policy into the
>>> kernel is frowned upon. I think the proper way is a udev rule to act
>>> on the newly created I2C adapter. This even could provide a really
>>> stable symlink for userspace to consume. The above scheme is only
>>> stable per "block" but inside the block, there is still randomness. Or?
>>
>> Right, that makes sense. Thanks! Vadim, is there any reason to not solve this
>> with udev? Doing that with care could perhaps provide stable names even if
>> you swap slots?
> 
> Yes, I can manage it by udev and provide some names like "i2c-lc1-fpga1",
> which maybe will be more clear for user, then name like "i2c-132".
> 
> I have another, not user space problem and maybe you can
> suggest some solution.
> 
> In line card driver I planned to create I2C infrastructure for the
> specific line card, like:
> 
> static int mlxreg_lc_chan[] = {
> 	0x04, 0x05, 0x06, 0x07, 0x08, 0x10, 0x20, 0x21, 0x22, 0x23, 0x40, 0x41,
> 	0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d,
> 	0x4e, 0x4f
> };
> 
> static struct mlxcpld_mux_plat_data mlxreg_lc_mux_data[] = {
> 	{
> 		.chan_ids = mlxreg_lc_chan,
> 		.num_adaps = ARRAY_SIZE(mlxreg_lc_chan),
> 		.sel_reg_addr = MLXREG_LC_CHANNEL_I2C_REG,
> 		.reg_size = 2,
> 	},
> };
> 
> 	mlxreg_lc->mux = platform_device_register_resndata(dev, "i2c-mux-mlxcpld", parent_nr,
> 							   NULL, 0, &mlxreg_lc_mux_data,
> 							   sizeof(mlxreg_lc_mux_data));
> 
> And after this infrastructure is ready - to attach from this drive line
> card devices from 'i2c_board_info', like:
> 
> static struct i2c_board_info mlxreg_lc_main_pwr_devices[] = {
> 	{
> 		I2C_BOARD_INFO("mp2975", 0x62),
> 	},
> 	{
> 		I2C_BOARD_INFO("mp2975", 0x64),
> 	},
> 	{
> 		I2C_BOARD_INFO("max11603", 0x6d),
> 	},
> 	{
> 		I2C_BOARD_INFO("lm25066", 0x15),
> 	},
> };
> 
> static struct mlxreg_hotplug_device mlxreg_lc_main_pwr_brdinfo[] = {
> 	{
> 		.brdinfo = &mlxreg_lc_main_pwr_devices[0],
> 		.nr = 4,
> 	},
> 	{
> 		.brdinfo = &mlxreg_lc_main_pwr_devices[1],
> 		.nr = 4,
> 	},
> 	{
> 		.brdinfo = &mlxreg_lc_main_pwr_devices[2],
> 		.nr = 5,
> 	},
> 	{
> 		.brdinfo = &mlxreg_lc_main_pwr_devices[3],
> 		.nr = 6,
> 	},
> };
> 
> Where the above 'nr's are from 'mlxreg_lc_chan'.
> 
> And then create with i2c_new_client_device() all the above devices from
> workqueue, which will be running until all the 'mlxreg_lc_chan' related
> adapters are created.
> With forcing base nr, I know the number of last nr, which should be
> created by "i2c-mux-mlxcpld".
> 
> Without it I'll need some ability to find with nrs have been created by
> "i2c-mux-mlxcpld".
> Do you have any suggestions for that?
> 
> I understand that I can also do it through udev, but I'd prefer to create
> all on-board (line card) devices from the kernel, if possible.

You could add a callback function to struct mlxcpld_mux_plat_data, and have the
driver call you back with the mapping so that you know what adapter ID you got
for each platform data (or channel if needed) you instantiate.

Would that do it?

Cheers,
Peter
