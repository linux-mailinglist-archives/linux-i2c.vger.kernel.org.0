Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E58949A68E
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 03:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357608AbiAYCSk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 21:18:40 -0500
Received: from mail-bn7nam10on2066.outbound.protection.outlook.com ([40.107.92.66]:5485
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1445608AbiAXVEi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jan 2022 16:04:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N676UKuoE4wCkaPpth+kHsTq3UNACAHUDM6+4u/eL7DvSQbauAaAA30mubiGJiC5SkVx2f+RBowVLFHIH4AIB7k9tYC1HM9zmnW+Ua0oJ4fjxkFP61fer0TH1eux8ZVvuCkZ8uYTw3ier1ql29+rnZgAZMGkhUJzY237M4jlphxg3On9kZ7ZICx8wRM6WTpHSHQCb+EeaqNKwnaDvTci4pjSo8jrEsO8EPEqnljf0EGO5fYsaINxJ+xTdUeQAYwEKvPQR/5A+YTUccNQlZjG9QSgTLl3DLkAIGEjG2KFStYka+jaND5X1Is7tVwpHyAW/PwNoImS93H9b3rl0Gx0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80J+RtKrrAMxjZrZqpOqCGW1Uk7Wltc2Cebw3l6nXBQ=;
 b=Fwet9LEnEV9sdP11Zuzt9r26jlQInFU9vteS1SdWpvJEQiW4j2tlWJ4t7Fz/gU0QOGuJd6sjBvYMN2dd0V7pNrpxjJeuoe5BROBkoSVAo8056N5qU6v0s9LnscNkjkeo4riKoXBaes9L8NKkhKh8rbAjud+NlSHx9GDCaYifFzRy9ma3oxqezjOmozRwudHZfakDEq9uo1kIwR3R9UGo5RHyTIWDdZPbbhM6YDAQ/kzRX7KD9qpr7zFhPaseOlIDuV4PEx33bZxK8Yyw/8uDnL8b76Fhii6C1CAFujTSGII+5+EWQ8qP1h880hzJGAMWDD2Bh5rELqYAYhkHtYaUcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80J+RtKrrAMxjZrZqpOqCGW1Uk7Wltc2Cebw3l6nXBQ=;
 b=xyJpsQk3nPWdxawYUhNcCPM+1Xy4XNKZLUmp2r+jppt/Yutgw6ro9xrRzbVWDziCiJda/3X2ObBAzHZTJvugjyHGmcmbya9FmJetpNTzRz/UnOPKF1VYPAb/iuHIH9t3O+nBzv21hhoYPsxIYfUcoXebvUfXvIDDHTX0zlaZ0Gg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Mon, 24 Jan
 2022 21:04:29 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 21:04:28 +0000
Subject: Re: [PATCH v3 7/9] i2c: piix4: Add EFCH MMIO support to SMBus base
 address detect
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        sudheesh.mavila@amd.com,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
References: <20220119230626.31560-1-terry.bowman@amd.com>
 <20220119230626.31560-8-terry.bowman@amd.com>
 <CAHp75VdtnOuBK1ctkjO59vujopCrQ+MQ_LyBB+Mi2HJk4HaJuQ@mail.gmail.com>
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <67071cd7-b1b1-7647-3090-365b45b3b1f6@amd.com>
Date:   Mon, 24 Jan 2022 15:04:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAHp75VdtnOuBK1ctkjO59vujopCrQ+MQ_LyBB+Mi2HJk4HaJuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0332.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::7) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6010569-5dd1-43ce-b08d-08d9df7d1c29
X-MS-TrafficTypeDiagnostic: DM6PR12MB4105:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB41051A4CB20961A8DDDE825D835E9@DM6PR12MB4105.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MDXEjU4wzuoOYfLEvAORgZXQDuqRKK9Sicqi8P2JUoCczfOKGvJE6n/S51/+9nlfjqz1CP6e6tavZtAVl08FoxjX64OdIz/JOUkS9rPLJH/iBhXQn2vRvII7QcKzPERxVpN+6ggnkwBb4UNZRg1sGBYyj8GmE6rxxwlqb3a0IiyvxstPB2IxIsb2dn6aEthgReb4nf9RT2uIaSXvKqAI+vB0pfzQRYimFq/wKgRnS5pHS/6I9Lg+DNebUF1LEVwpBT1zvsCqyzVB/8lVmDmvr4iX+dAm8UP+Hr44KZXDMZ8YjY9zKvfaeHpF8cPTYOL7KVZmc3iEc7KW+uo7H8GP8g9ry+/75qZDQZ4sHKBGI1XuaSniAZslSh5kqv91dvUjKHhxvVI5ueToIKQG22mNk9yZd/sLub95Wrs8eq7wWnlEcm8VOEhWT4jpeWCFeX5ya9t/2j99oqm4HWIIRPYJGmlmhgc/O6GoKJAILb01gkwy6hV9mjc6s+gEc+9xeTXjpQyi7M5SAwMmH8q5yxnxrH1KZdcuR9kq5kujmDpQOdOwIMF4zJEz0jy2oItO6PfdQcvd+ipFqOFZyCw6DlFSsNjRc9sTLfZoGRJ9gkgNwJuLtehst4kVuI1GL38Crc1q5HC1sr1D+SYKUciQSl90NpqsRIAI+3B/IPBc8PnFwPx/UK417xvE6CqKn0jFpijZZcrcZA1x3kvaiuTBQ0JqjpdhuZhmpJ3zUH1EpyNV9uGhOmW4vQcGK9W+LsqyW6Uf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(2906002)(8936002)(6486002)(36756003)(66476007)(83380400001)(2616005)(31686004)(6512007)(38100700002)(26005)(6916009)(6506007)(53546011)(508600001)(5660300002)(54906003)(316002)(8676002)(186003)(4326008)(31696002)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1Q2V2pyMmlJOStTMkJUV1hJa3kyZVloc2xrcGthL2NxM3k0bXlDQjZEV0xX?=
 =?utf-8?B?UzNQQndRM3dOTXhwUXVLRzIzZDFHN0lHbDgyeUt4czI3eE5aTWJLbDU5UG5R?=
 =?utf-8?B?WWNjeDdSR0cxUWQyVm1KVjg1UGpEWS95RWRFNGhJZDhPR2VubmgxZTR6cysz?=
 =?utf-8?B?UVFkS21zZm1FMUlkaU5nRytvZmE3MGZWaXhOb25JSGpKNStJWFZFSjFYUkR5?=
 =?utf-8?B?bE8xb2ZYS0ZjQlBZZ0ZsN2ZxaUJxRHgrd3VLYldXb01uUkk1Qi9tZWNwL0F5?=
 =?utf-8?B?RThqNEZNc3ZLWXlhT2lOZlJ5YlU4NW03cGNEK05oczFvWnNnaXdZSUhDaUxE?=
 =?utf-8?B?QnBSdWRrbUVUME5pcEJFZ1ZjV0sxNlI0RWM0RldOOFFtS1YyTEJzYmZ5c1ZO?=
 =?utf-8?B?RWRVUjV1T0cyNTdEbSswUERHT0JPazl3VlZCWFoyanNUR0piL0J0LzNRUFdx?=
 =?utf-8?B?T1VuQk8wS3BlckYrY0lLTnJUUkhtaE0yUE1UcUFkakI1V0czZURpNWJaQkYy?=
 =?utf-8?B?U21zaE92aGpra3NJNFRaMm1Nd3FmVnVNb1ZhK0tzdEZ6SGFQTmozU2kvcndE?=
 =?utf-8?B?V293TjFKVVVpbnZpbVZXcTFjaE92UFphQmFmamtNVWliR29XTzUwYWVWU2l2?=
 =?utf-8?B?S2p6NVVFOEp1ZnM1MEtqUW5WSFFyclFUUWhXcy9yMTN0VTE0SWs2NUNOMjlF?=
 =?utf-8?B?R21yRkFtZ3VBNGR5a3RaUzh3RnRGVVdQV1F4WEFSdkRqS0xSMDN5bGFtc01t?=
 =?utf-8?B?STNCenhOa2hsZXNhNVRnMmtqOTVhWnZWQkthQWh3Njh6bFVMWHNEdjRTM1FC?=
 =?utf-8?B?RGtvQ3gzVG5CYVpteW5RTDdrWml1bzVnNnlSY0N6V3NSRHBlcmFOc3RlYy81?=
 =?utf-8?B?cDJ4dmRjRnhTZnBzTkdJZFNqNHJ5ZC9yWGttWG5yVHNiYXJPRWhhdktGMzJp?=
 =?utf-8?B?Z2F4b05Odm1GcmRoN0xybnFxaHNWNUpBN2VOZVBqVVAyRzV4WDFIUHk5WU1K?=
 =?utf-8?B?VGRzTHNFL1libTdlM09hQXJnUEVqZDYyV3laeUhmL3V3UWJOcEhIQStFc25s?=
 =?utf-8?B?aGlibmN2bVg2eW0zZjB5cWd6b0g3dm83WUN0bTYxekZYKzBRQ1hyMmxWeGxM?=
 =?utf-8?B?bnhVaTVwMFFhMU8zaGtmUjdlZEFwYmVZQ0RNbXgrZTNLdGJlSlROM0dQMWdC?=
 =?utf-8?B?U0ZUbFVHYmhxWTFLQzlhTmR6MzVpNTRUcmgrS2xNTTloQlk3YmkyZTk1NW11?=
 =?utf-8?B?TkpzaVhqL3I5UHRqak81MGZaSmtyZlJWblEyVVdlakRCTXBOdzJtYkN0UWRL?=
 =?utf-8?B?NjRMNHpUNGV3WWk1QzRsQjZwWlQ3WVZOSDFZVUdUYmR5Y2doeTIvOGxYbHZC?=
 =?utf-8?B?dW00dS9TeFk4S1g3RzFNWU5mMk1WR29GN1pWM2djcVhicGRqWE9oK2M3N1Zx?=
 =?utf-8?B?cStYT1hmYVJiS2tzTDZTcnc5Nk1PM3djNEx0NkFVL09kODAra292RytZWHJh?=
 =?utf-8?B?WFRaczZVR2FmQzE0RS80MWV0aFc4THh2T3Y2OTRRc0xqcGtwTDhzVlV2N2Fx?=
 =?utf-8?B?bFRaUnNVbE45VTU1eUpReUNtaTZwRTBiTG1WUGhneXBBL1pBSmVxYWZNZzBX?=
 =?utf-8?B?TEdqL2dVYW52THBhM1pHZ0dTaXlxcFc1NlQwak00MDFWNVAvRU4xVCtvU2RK?=
 =?utf-8?B?ZG45V2hDQ1JWc1d6VUxuaHpWSUJJK0Uyb01BZXJicEJKTEw0TDk1N3cwb1h5?=
 =?utf-8?B?UnlKSzNUQVBtRGRteVlMY3JwZHNXRFpmeWRLZHJuelRWU2pMemVNV0g0TldT?=
 =?utf-8?B?aC9aZlBOREVyZktNdTVWbURHVHpOMFJSeFV4N3laaDAxd1ozZEFPempJZ29Y?=
 =?utf-8?B?QW1IbmswZlpKUEEzRDgrUllQUStyQzRnNWpiK1BoV0ZSS0J2WC8wbWtaZDhs?=
 =?utf-8?B?cUVqT3JpU2xwWldkcWd5RHBPRWtaTXVUWTFUL1FzMEFEZSswUXBOZHZFNnA3?=
 =?utf-8?B?ODdpajczb0tyRktnMUNsbTZkZFQ5N2owd0Zxd3NzNFZ2WUl6ak82aTJBWUFT?=
 =?utf-8?B?eXNTVjhSNTdrcDhWVnVla1VweTVuU0g2cWh4YXNvdytTc3puVlRaMkE2ZDlt?=
 =?utf-8?B?QUc4K0VyOHg1MVNvOG1HcDJTSWlZbzhkL095V0RHYnkxZTJrbW5iZ2ZNVVZv?=
 =?utf-8?Q?uoo6olOFSK2/wvDZ2mOPWyk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6010569-5dd1-43ce-b08d-08d9df7d1c29
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 21:04:28.8704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTWa4moutHdGCd+bpvuQ2DROj+D4AYY7l+wIelKSvSCsflUi9i3F3hK4WsXWGmO8Qcz+YEyDwZ1dI12joMdkEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4105
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/20/22 5:27 AM, Andy Shevchenko wrote:
> On Thu, Jan 20, 2022 at 1:07 AM Terry Bowman <terry.bowman@amd.com> wrote:
>>
>> The EFCH SMBus controller's base address is determined using details in
>> FCH::PM::DECODEEN[smbusasfiobase] and FCH::PM::DECODEEN[smbusasfioen].
>> This code also writes to FCH::PM::ISACONTROL[mmioen] to enable MMIO
>> decoding. These register fields were accessed using cd6h/cd7h port I/O.
>> cd6h/cd7h port I/O is no longer available in later AMD processors.
>> Change base address detection to use MMIO instead of port I/O cd6h/cd7h.
> 
> ...
> 
>> +       if (mmio_cfg.use_mmio) {
> 
>> +               iowrite32(ioread32(mmio_cfg.addr + 4) | SB800_PIIX4_FCH_PM_DECODEEN_MMIO,
>> +                         mmio_cfg.addr + 4);
> 
> Can you split this to three lines (with the help of a temporary variable)?
> 

I made these changes for upcoming v4.

>> +               smba_en_lo = ioread8(mmio_cfg.addr);
>> +               smba_en_hi = ioread8(mmio_cfg.addr + 1);
> 
> This makes me wonder if we can replace these two by defining
> 
>   u16 smba_en;
> 

Hi Alex,

I was unable to make these changes without losing readability. By using
a u16 smba_en I found casting required between u8 and u16 to access the byte 
offsets. This increased the number of lines and complexity. I should mention 
the port I/O here is fixed at a byte and does not support 16bit port I/O. 
I'll leave as-is if Ok with you.

Regards,
Terry


> (below also may be easily adjusted for it).
> 
>> +       } else {
>> +               outb_p(smb_en, SB800_PIIX4_SMB_IDX);
>> +               smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
>> +               outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
>> +               smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
>> +       }
>>
>>         piix4_sb800_region_release(&PIIX4_dev->dev, &mmio_cfg);
> 
