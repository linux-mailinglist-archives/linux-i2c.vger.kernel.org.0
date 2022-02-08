Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87F2B4AE3EB
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 23:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387534AbiBHWYm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 17:24:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386635AbiBHVAy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 16:00:54 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2082.outbound.protection.outlook.com [40.107.96.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BFAC0612BA;
        Tue,  8 Feb 2022 13:00:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlE6mC45rSjIPbvinWlNu8GBPOPSdY4w16zBEY+UxirhU0BiU1isYRa9oD2eVyKc6EirMxq0bYnvtB5sUxokdpKs6kUUYaxiv2M/jyeg4NtIWh7YTIO0hMN8DRAjwQIV0w92FLb5rIyukMd6jOSVbhaR3LDMn7N84+o7steuhxk+E7PxcoGm/njvdi/VvyvBNUfRibnZl2z8Y0ONRX/0W6mB7EM+ZpquJau8hUnqrreTgft5p7ql1Wm5n7wFYKmBDd9rERPkUy08TEw4nupf9d14RmfAGsjSNPQZTjVuSmzvOhg1b0jomLOSv2GFt3Z9GPpLjKhp+NNODrHtp6dvpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qb8Tn4XkuTJHZY6zq7lzCj4WQgEQHTH3nydzKyWokDw=;
 b=jczRK4Q1OBGPpL1ymj5pkI3JEjVApOm0cDXDDmGCzeMxOmxKPplro3/8YADSaw0AlSpdmK4uMk1+aGDiBLlAbxCHPV7RguETr6LoyAsKjG6r/quAVOfy7WAXtrenbl/LmVbhVsul3wZkB3vBaPtJuhKp4i0e/BnwnwQCidVEiHrAC7X1F2cMKL1Ud9g7K3yIT1z56jZc2pvHIH7x57BpGmkIRmb+YObs4J+TbncMd854HCMKT1tlVbhtLjjethkLCIZ5bJPR2S8/u7LUJPjqUViaw/53bvyh9QdUy5YaBP/u/rYT0nqfTcwPOgzWNsHGld0UhLwhT6mecSYYv4E4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qb8Tn4XkuTJHZY6zq7lzCj4WQgEQHTH3nydzKyWokDw=;
 b=ZCeY4JQuvoTU0Ep8/2DmO7sU4xoNPOiSVb7PD+ERoy42zUbWg7DOfQSapdtKNfFPRyvm+d5AZB/u2kBclNIU1X9f0EW0+Ylyldql8+RQJ8Bb9eFFuhLA3o2Sm0WGJQ3XNEi4LfbtXSCq+p0HK/fYOi3y25k7YkcOobunyLEVhhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by BL1PR12MB5379.namprd12.prod.outlook.com (2603:10b6:208:317::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Tue, 8 Feb
 2022 21:00:50 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%5]) with mapi id 15.20.4975.011; Tue, 8 Feb 2022
 21:00:48 +0000
Message-ID: <ad8b8beb-85be-a0b2-57b3-d8e3b8acda51@amd.com>
Date:   Tue, 8 Feb 2022 15:00:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 9/9] i2c: piix4: Enable EFCH MMIO for Family 17h+
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jean Delvare <jdelvare@suse.de>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
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
References: <20220130184130.176646-1-terry.bowman@amd.com>
 <20220130184130.176646-10-terry.bowman@amd.com>
 <20220208173316.403ec944@endymion.delvare>
 <CAHp75VfjQv=k4fG0GOSRRqTmpTkXe8chRQqjBaY3caHzdnhEKw@mail.gmail.com>
From:   Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <CAHp75VfjQv=k4fG0GOSRRqTmpTkXe8chRQqjBaY3caHzdnhEKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:610:20::25) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5aaf84f-078c-4efc-b1b7-08d9eb461504
X-MS-TrafficTypeDiagnostic: BL1PR12MB5379:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB53793C3F75E3583ECF2F3E99832D9@BL1PR12MB5379.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oNNSOFLg6xB88DSIsehPPmLH4qJdvXiZDrspShq6voIwLrDkm5zIb5uFRj+AfLgbYTuhMbdBIk85kLLxs0cHaTUR/wzh3TXcnKLuxljr6Irv9HyRXuAM9GiHhlizuGGmp6RhlUu5IZ/CqAP7jh7jZA0OgQCDSB+0QrLT6LeA354wPE/+tO313ErZw6hPeEf+ZWefUzKLnpFStJOAJpikRH8heFZD2gDmxPFgdViuYIZ9UU3EhHMTsfYbp3xANLfshwZOqDEjFVUdByK0+IvnEts0WjyknnqbQ9wwOhJD2Gp79WMwNd0AeoytcPlKqfSgcaslzl1PZE3o+tISGaRPw0QIWGmKN4A62nD2fwGU88wvWGdV2pdHHEplp6hgDQOvG3mQl0+ws0u7a0BmyKVCR6wdyFg/iWOSoRTVAwgmV2uDjKa0Z+nDOA86A4/arQCoYU8Mrx763d7NQpxypwHvfB+UCFYwVd2GPsGQMsbRo/cxUq5exdqbbEZ6sEX6ig3vrCfrgQprgNeqMbZDnnTEJwsAjuMvF2P9/thbGxXjjSdJ/SYFNlNq76tlcXANq3ZtO3oLFaTG0zl8DSfDN7AN3Fnv3ZY5iT6M81C+1Ex9dvzaUxqYN2PDROByGnEeUg/n2JwcGBHwvjMV03ckpbpIjHyhElrSYC5AtDRbv68JWoh46NVOsxt79QkuMlrWmuhqSFnw+Ibk2FWUoTEoPjor1pdBSLQ/WdkvwlZ17LlwV4eOE5z+NXQtfwRxbOIXiQp8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(36756003)(186003)(6512007)(5660300002)(4326008)(31686004)(2616005)(26005)(86362001)(6666004)(31696002)(6506007)(8936002)(508600001)(6486002)(53546011)(8676002)(316002)(54906003)(110136005)(66556008)(66476007)(66946007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzBieUVqbmpCYisyV1FPejFLZ3poRG4wK1F0cFJJeGsvaUR3TzgvdVo2ZERv?=
 =?utf-8?B?Q0RjVmpuRzVSQWNuS0tYZGFtTnFRNUpCbFlveHdrTlhMaEJLUjhnQ0o4RlU2?=
 =?utf-8?B?R3VGWFdPTExyV2l4NkduMnhDOTlhY0IrbCtlMGFqMWtEZEVuNE5vVVc5K2xM?=
 =?utf-8?B?cmFYRlRpUlJpQnBZNXZYSG1rL3ZwdXA4b2tValduei8ybk5zYWxpZnRzNkpD?=
 =?utf-8?B?dW9DeVNGa014RzBEdS9PMmtCVzBGeksrRlN2UmV0KzhGQ3VBY1hqQ091bTlz?=
 =?utf-8?B?S1oxaUFDdWxJOEpDbDIxZktGMUc1bkk0M1o1VmYwcW12aTh4T2Q1dDI1bjBU?=
 =?utf-8?B?ZXFqMnl1d3ZJWStpQkVGZE1KckJ3WUtTTGhGNXZVOEdKL1BxaTVaUDJ0VXpT?=
 =?utf-8?B?Y242aExmZGd6TldJNlUrVUFDcmNOOUdBZEg2SnZZd05EdURFeGxvV3F6aHZv?=
 =?utf-8?B?ZWYyUHpyeVF2c0dCL2k5dlRNWlpINUs0UWQ2OWMrVlg1dGx2a0oxYXY5amoy?=
 =?utf-8?B?ZnhOZGk5OWdNRXJOdEMwMk8vb0ZSbXlTQ0MrVEdHb1psb0lia3BwcW5hV21J?=
 =?utf-8?B?Wi96cHpkMlE4cnl4TEFmSnVhTFJhS3FNVFdsbzFDdWpHNnlHdHB1cVMxYkZO?=
 =?utf-8?B?eFhpbktRRVgzUnBDTVdVcm9wbUMwN3VZTmpGVWtLZXQzOUljZGRGQnUzdC9T?=
 =?utf-8?B?VWdJcmZlZXc5UU9KR3VFRzFkazFWallYQlJmSVdkeGlyWGYyZEtFeTVwMlBr?=
 =?utf-8?B?b2tYb0VJdk9wamJyaWtTTWJiTDEwWXMzMk9xbkd5UW0xS1pZYmk4bVpzL1Y0?=
 =?utf-8?B?L0trUzFzZjRvR1dwMmhpUXN1a20rMDdDclZ6QzR4VGl5UTR3ZkZDaHhibGdt?=
 =?utf-8?B?SU5iOFo1cWRqaWp5SEF0cFRNemFQZS84dW95aDlBSHBPTnQ5cElpOHp0RkU2?=
 =?utf-8?B?NkpjREFuSk1iNGIrb1dmcHFJaDU5WEtVSWtvUHBWV0VqYnduU0xVaHBUWkxE?=
 =?utf-8?B?ZG9GUkJlVEczQk80cjBQUGtab0JFVjNtS1NTZlcraEE5TGRSRXZCNXRGdUJD?=
 =?utf-8?B?N3VPdmFFRm5wcjQwMVVndVBQeUM5YWF4SHNONEgxS3pwZUtPL3pIZ0VLdzFz?=
 =?utf-8?B?RU54ZlIycjlFZnNTWThXQVJIbUE3VEp4ei9sbHJGcEVscEk3U0ZGS1lkazdD?=
 =?utf-8?B?MlEzZG5hTzdpRG5lNVFZRGp3RU0wYVdvYzZmd05qSGM2eFN3NmNSK0JsQjA2?=
 =?utf-8?B?ZzIveTVWa1E0bWhYOXVzUmxITmp2OC9lUHA3NUJjWmxweDdGUitBVUtHVGFR?=
 =?utf-8?B?WWZJaldRdFUwdUlJSFhQRHZERDdZZnhrRkorVDEzd1NDcUh5T0d0TVhwYkZK?=
 =?utf-8?B?RWVIUVJvZG1IWDUwcEZ0M1lPSmJyZWl0Njg1TWgrL2NQYUN2NVBidWF6bldR?=
 =?utf-8?B?cThCZTZ3ZUFjVWlMSG5sUHNyT3c5VS9wdFFKNW1NekcreWZRYllVZ2NYUzVm?=
 =?utf-8?B?aVJIVUJDZU51N3NhVzkvTW9hL1RwL0JUanhTZU92U013aFF0T3N6VWlPS2RM?=
 =?utf-8?B?amdwN1RDMVBlNnMvVjlTNk1JdjZGNXdDV2kwVHNnTDhvYmJXZkZhL081dys2?=
 =?utf-8?B?ZEEzRHN1S1FLVDlqRHk0ZWpCdm05a1BYQjNTSC9XQS9SVHdVK0d1eFlWUXJx?=
 =?utf-8?B?Ny9ueGR3TDFPc3hyTUxzLzV3SnRTeldGWjlrNENkT1RqeTN4MVowbUJDc2Vh?=
 =?utf-8?B?aWNBNE1wdHU4NEV3MkRPTXNLNmlCd3hGd0FlN1lsWVBOUDlWbmRuZWtzaGhT?=
 =?utf-8?B?YlBBM0tPY25pRU8xV09paTR0MTRQUTlIQjhza0NlekpWVkVjcGNaSHo2TFpS?=
 =?utf-8?B?U08walFUZ1QwN1RrWDcxU1p2SzUxaFBCR1FlQndYVkI3R0RxNG9oUmpMNWV2?=
 =?utf-8?B?M0xTNTdUS0FZQmdiMHNIOU5hUU1DMmkwWmVQRkdCQjh2ZnlONWhhODV6eERG?=
 =?utf-8?B?N1llclliZitrUVBnT2xDK1J2VHpBajFIU0VLbnk5cHI5d2krakdkdy8rRXE1?=
 =?utf-8?B?OTBZUGI2anhFSFdLRXdXNytLYTB3aFpNTTBwWU5uNkFZNDFCUktUUytjcFlK?=
 =?utf-8?B?NkE1ZlZVVTVzekQyRk5SUlM5OGlYKzNjS1IySmpxV2pSR3lRZk5CWDd0UmFE?=
 =?utf-8?Q?leaFuukiiC39DShWzAHuPIE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5aaf84f-078c-4efc-b1b7-08d9eb461504
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 21:00:48.5170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dS2kHgJpSd2CnWImNCIV49RYKXXMin0wql9YVrOR+F+ZOTwpYGVuSgtxFYu40Xwmgf4O67/cjQfGIVO9BvpEww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5379
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On 2/8/22 14:10, Andy Shevchenko wrote:
> On Tue, Feb 8, 2022 at 6:33 PM Jean Delvare <jdelvare@suse.de> wrote:
>> On Sun, 30 Jan 2022 12:41:30 -0600, Terry Bowman wrote:
> 
> ...
> 
>>> +#define AMD_PCI_SMBUS_REVISION_MMIO          0x51
>>
>> I don't think that was worth a define. You only use the value once, in
>> a context where the symbolic name doesn't add much value IMHO.
> 
> I don't remember the code context here, but it would be nice in such a
> case to convert this definition to a comment (if it's not crystal
> clear what this magic number is about).
> 
> 

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 239df17ce02b..218ed8efb83e 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -229,6 +229,13 @@ static void piix4_sb800_region_release(struct device *dev,
        release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
 }
 
+static bool piix4_sb800_use_mmio(struct pci_dev *PIIX4_dev)
+{
+       return (PIIX4_dev->vendor == PCI_VENDOR_ID_AMD &&
+               PIIX4_dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS &&
+               PIIX4_dev->revision >= AMD_PCI_SMBUS_REVISION_MMIO);
+}
+
 static int piix4_setup(struct pci_dev *PIIX4_dev,
                       const struct pci_device_id *id)
 {

----

I added the context above. I'll add a comment in v5 to describe what and 
why 0x51 is used.

Regards,
Terry



