Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDDB4AE259
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 20:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239565AbiBHThC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 14:37:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353785AbiBHThB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 14:37:01 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780AFC0612AA;
        Tue,  8 Feb 2022 11:36:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYg1587UUsplbpLiZqNEPyoegj1E8CRwLEGeGk14yNoyjgoJ8RwQ3ZJ884A8H5Dsr887d2RWLOlq1a8/h2tkuRV1LcyQfwGx+mC4QxCbyTGV+fdRYkGJkN0MO6pmmIPmbiMEQTAmqTk2b+sH0C62l1lMoRmauUule7L/qnU0wvT2Ns+7agXny1XjLS+PTvh6oV3Nr8XTo9imCbG+3GlqLh+5FUMgbVmTNGPsIyIYPN6WiF4PKAd+PK2fGDQwzreT5q1Php+pP1sgtIjSMVM4FW0g0XcXIFex86kUEjvZmZeczzh9u7oDVRNzkY9Cc94BPoTplsPE/tUPfoetH8CIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUPHh/xtA1DTHxtATDn6L8lAd27xc9FwhS1KVvZ8Zmc=;
 b=VcUMvh8PDt6uOi/0M+4/vmVpg+5d/o1KiSE21MGFCc8xZmtMCu7mRLrI3YNZFpoiPwMkrY5H+Kg7ncV66b7ovHgoGhVLIYtAaVzWINg4q1SUPmgttRP4XD7buVC/wgtihm49KQ+gDFDQcX9nYPvb2WDwRvnnMkUeIqzpkmF28j7o0RRh9wbs04o0Shrmz7LmV/pEscww2QCTGA3KSR0sVZtB5gWTnUFbYuCiOBR4oG40um69hALSfwgByUb1OcgeM+vl+7bWirGDmxZeeG48Gf09ZhkkNVmJX7/TO/e58076JUfLtDwIPZyp008KsMIpwnzJyF8kZPx0euRkA/MDQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUPHh/xtA1DTHxtATDn6L8lAd27xc9FwhS1KVvZ8Zmc=;
 b=VUH1QUBfdCYlRU7D/9kf1x8YZR69pRS087UEkV+QF7gXK/Sfz9GWgDfGOOk+1WZ7bXzweYXDAQ0AzNTrfyByY3k7yo6dCdRdawt2c9+Z9ndnQxn+s+ksOwG0LOufn940i5R+yfpkGLa4O5UgsVtSDTpJrx0u53GoQbPTH+XjSPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by BY5PR12MB4888.namprd12.prod.outlook.com (2603:10b6:a03:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Tue, 8 Feb
 2022 19:36:58 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%5]) with mapi id 15.20.4975.011; Tue, 8 Feb 2022
 19:36:57 +0000
Message-ID: <4ae57999-0f23-7578-008d-2009bc36d46b@amd.com>
Date:   Tue, 8 Feb 2022 13:36:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses
 with MMIO accesses
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220130184130.176646-1-terry.bowman@amd.com>
 <20220208181114.180a99ba@endymion.delvare>
From:   Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <20220208181114.180a99ba@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0327.namprd03.prod.outlook.com
 (2603:10b6:610:118::20) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53dca901-5177-46cc-cfe9-08d9eb3a5e86
X-MS-TrafficTypeDiagnostic: BY5PR12MB4888:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4888832EAF10D1F8ABF8FD48832D9@BY5PR12MB4888.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9AuETWsriRutgpgIb3vkTLFQCM5iJ3Tucq0hr+lHUUC+Y9xvkoe1ZZ8ppFyzJY3mX4Xwk/l0ZuUcNY4Y4buIthIDkZ/V4h5+059QTBAl5uLsBOxNGQwApDkD1UqMtAou4l85IT284JcQgYxSBqevDd6wZ0K5/C7RZ1LH9cuoTIEnVbjx5W3hY1r+dE0xrfbIRwUTw+HCx5Wd/Z+B4RFDpI8vC3OXNrsSxHaOgNpjYWoNM1IlLw97SrgQDvS68CKKudczx86AclbH2Di46yC/pbb2iamJqNTxeRerWn3o5L3RJQVI3qy1KE/3df2pd7DXj+tujJSk1xLgwKQIaAu1p/M/LGowxFM5zTXUJFtouVFsQsN4uxX7Z7DfZSdhaeWhJ4Msw8kltF9Ob5m06QNTBNomssYMIkZ7tR10C20DGVvgF6TZJT/bP3tWb13gV30HNlg5PIZkpNWJ3lPnxRIuiuPsdot1Ax4Sv1ZIitxz97h0IoJHSn62y3juFJQifdT24RNRpJQCvEiuTa2v/5tnKRm9WL/NDX8hQV08WGZnpzGVpC9QCa7Qsoo08VKwr6pqlAJU5B5mG7Crnc/kJ7qJxPjRDnOjNDwpA1UIXd8MQsRVjvo82oHXNS89kRv8bH6HFDZdJD+h+XnX0ypeQcFCLbvIw/+I5zPUhz9CddcfoSaFnI0KDWhT+yhBWONrT0UDgaz+hoTEO4nJcdUJpH770OVVAzle1RTQl97zhr3e3oArwfeafnEk3ScnKuv+DKW9ZgWwxVU3Btq/Ryz9l3QtrdpsLPE1Gv8yvjVP107B3nJ5Nwsb0oXt+uGTIUBJYuqv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(66476007)(2616005)(66946007)(66556008)(4326008)(186003)(26005)(6506007)(6512007)(6486002)(86362001)(31696002)(38100700002)(316002)(6916009)(53546011)(508600001)(8936002)(31686004)(36756003)(2906002)(5660300002)(83380400001)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0tjM2xmbjBvNGVCb094U3I1WFJCUFlFTi9VV3NrcytaNGNDYUh5L0g4a3d0?=
 =?utf-8?B?L1ZmVGowS0RFb3N3aHpkZ01xZmVheTlhVDJWWk84Umpwa0F3Tm0yL2J6NjBJ?=
 =?utf-8?B?b1RpM2xjaXJoRFlEdHM1R3pITXo2MGRCRm1MYngyaXlRNkJ1djZ4RnE0MUxk?=
 =?utf-8?B?M2dKWndFQmlUdTA4eGVwbENJbERuUUxQSjdYSnE3cFpsL2NEZ0g4dFFPckhn?=
 =?utf-8?B?b1dsV08wK1ovVGd3VFEyeUFGcEFZYlEvL2tVdXhFZ29xd2phK0R3SlZ5SzVz?=
 =?utf-8?B?T2g1dnN4VGgxZUFocTFaOFhNeFNucjdlWjQ0UjdSdmZkaU9GYWR5eFVTY3lH?=
 =?utf-8?B?Z1BPSnkzN09SRndmYkhYcGtSVnAzdG5zT2krQytlc1E1cC8rQjJ2YUcwTGhN?=
 =?utf-8?B?b1NUZ0J4Qm93NnRsaUtCOGxBaFhSUlVFSWR6WmtVc2xQZjlzS2JialJCSWNx?=
 =?utf-8?B?bTdITjQ5aEllcWcxU2lJcnF1VlVNczFCUmtDKzNyeGNSWVF6WmF6WUttUk1x?=
 =?utf-8?B?OVY1VHNsa1RyU21sTWNlSHZCY0FGM2FJejB3SzQyS1BMbGJEdXJuOE9xSnl1?=
 =?utf-8?B?Yk94dTF0ZjhydTFDRHZJZkRvNkExQ0ttMXhhMkFFMDdYTEgyNTlvbFJHcVhI?=
 =?utf-8?B?b2htUkdZdkk4aDY3bWNmd0xmMVc0V0F2Z1hYK2JhTmhSbVZsbTlWYXI2WkUz?=
 =?utf-8?B?T3lCbWtLTkg3aE5CRnlSOWUvZDl4R3pSSDBWaTVWL0NBK1czb3hGQnpTYVhP?=
 =?utf-8?B?enNmSmNwOXBLMGFtRUJRSk9ZeDd6K2JYL3VWV2o5NmQxMGhuMXJTNW50RHgw?=
 =?utf-8?B?UkhGWjhOb3BSQngwMVdMSDVEN2s2TzNqWjl6YlhDSXQyKzVVcEI3RUNmNHdX?=
 =?utf-8?B?RGdGeDZvN3lWbGhjS2ZmemVFTzBqbWtQT2xLVDhUUE9lYkMwY3VaNk1WWkZF?=
 =?utf-8?B?b1dZMDd2NFc4WWlKSkk4MHc4cFdGL1V1QjFoNHlYd1ZRaVRWWm9ZSFBlbUN3?=
 =?utf-8?B?bzhIbnhNVVJnMTN4UE9ZMUJIK09FM1R2WDJiVFI4WWFEMklUaStRZFFQR3JR?=
 =?utf-8?B?WGJjL3ZuWC9qdjRwT0lST1pMMUc3Vm15Ylh2aHV5ZnlUeTJibGltQnNqdDdr?=
 =?utf-8?B?NHVMM0EwVEk2MWN3RUEvcVZnL3pkVkdpY21ZWC8ybC9uN01kYnNiZ3dDNDlH?=
 =?utf-8?B?Ry8zYVVBK3g5WDhtWXZJS0owdHA4SzhrVzlGT3ROc2hITk1GRHJ4Sk1kb1RQ?=
 =?utf-8?B?QTdMSllrR1M5bllSMDNheFpudndiUE1tV0R5Q243NUFFd2gxS2U2NDUySjdy?=
 =?utf-8?B?MUo5cXRQTXZmSk9ZbERCdUwxUTZQRW1HV204NnVOTlJkcWZPTUxtdDZmaGxi?=
 =?utf-8?B?Ym52T3AzS3U3cnZvc1ZIcms4VUU5TUltN3VrL25zR3RQT20vT1FxSmMwczZN?=
 =?utf-8?B?RFJFL3A0YnRkclJuTExIcy85cUtxTkUzVEJacFd4Y0p4TVZTdTdQSkYzdE9p?=
 =?utf-8?B?c3htQ251K3pzTTJPK2FMZXV1YU1WVXhBVFJld1pRL0U4alNsR2c3eDVlYVhD?=
 =?utf-8?B?RWh3Z09Xa0h6eHZDRzN0akhTK3Y5M3FhcDdwcDhybnlaTTg0c08wWFI2WlhL?=
 =?utf-8?B?KytubXF4ekc1Y3ExR3ZmWDNYbUlSM0VQSThubWZNQUwxQzJCSGgxMjFMNXRG?=
 =?utf-8?B?cnRRSTRraTFCODhERm9nSGxBc1BaYUFqaGMwSzhkb0V3QWdyUDIwR1RZaHE1?=
 =?utf-8?B?OTc4T2czcEJ5dzBscTZnczdKK2U4UFFndThuamVJM3NRbE16aEVIaG9HV1du?=
 =?utf-8?B?NXZ3SUpiMUk3azhoM3lUWG82b3RTL0EwVmhIQkh3NDJ3aTlIQjZMYXJHQkpp?=
 =?utf-8?B?MmFiZG8xUW9BQWNvYXRQMlFDZ2w2UjR0ZjRLdndMMUJzdWZXenpuQnRkSWI2?=
 =?utf-8?B?QUFBVzhtbzYwSlZHZWhlbTZBNHZnMXI1ZFBiVk5CSjNYbEMyS1VFOTFBS2VF?=
 =?utf-8?B?YTBYSkhvYjNzUWhSSWlLUWxYeUxQRTRmREVIYUg5SzY0NGlpNjJnTHVkZUF2?=
 =?utf-8?B?R1AvbWFMbTViRkIxSGVWYVpyRllxSlhhMmlPRTdPTjFUeUlTYkxPMXoydTdW?=
 =?utf-8?B?Y09sY1pGL1MrYW1MOStVZTl5UURJQkxsY2xMaVB4NWVCdVF6WWJUaWJGbFRT?=
 =?utf-8?Q?uDkLLMFCKUQ3+bSBK96ymdg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53dca901-5177-46cc-cfe9-08d9eb3a5e86
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 19:36:57.8815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvITuatpzaoBij49AYRLg2OraY3vumGbflfmdeG2EInIbD8KuVzaE3jb0jkFpWY0CwHS4ccSckoGdvaaw4uu4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4888
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

On 2/8/22 11:11, Jean Delvare wrote:
> Hi Terry,
> 
> On Sun, 30 Jan 2022 12:41:21 -0600, Terry Bowman wrote:
>> This series changes the piix4_smbus driver's cd6h/cd7h port I/O accesses
>> to use MMIO instead. This is necessary because cd6h/cd7h port I/O may be
>> disabled on later AMD processors.
>>
>> This series includes patches with MMIO accesses to register
>> FCH::PM::DECODEEN. The same register is also accessed by the sp5100_tco
>> driver.[1] Synchronization to the MMIO register is required in both
>> drivers.
>>
>> The first patch creates a macro to request MMIO region using the 'muxed'
>> retry logic. This is used in patch 6 to synchronize accesses to EFCH MMIO.
>>
>> The second patch replaces a hardcoded region size with a #define. This is
>> to improve maintainability and was requested from v2 review.
>>
>> The third patch moves duplicated region request/release code into
>> functions. This locates related code into functions and reduces code line
>> count. This will also make adding MMIO support in patch 6 easier.
>>
>> The fourth patch moves SMBus controller address detection into a function. 
>> This is in preparation for adding MMIO region support.
>>
>> The fifth patch moves EFCH port selection into a function. This is in
>> preparation for adding MMIO region support.
>>
>> The sixth patch adds MMIO support for region requesting/releasing and
>> mapping. This is necessary for using MMIO to detect SMBus controller
>> address, enable SMBbus controller region, and control the port select.
>>
>> The seventh patch updates the SMBus controller address detection to support
>> using MMIO. This is necessary because the driver accesses register
>> FCH::PM::DECODEEN during initialization and only available using MMIO on
>> later AMD processors.
>>
>> The eighth patch updates the SMBus port selection to support MMIO. This is
>> required because port selection control resides in the
>> FCH::PM::DECODEEN[smbus0sel] and is only accessible using MMIO on later AMD
>> processors.
>>
>> The ninth patch enables the EFCH MMIO functionality added earlier in this
>> series. The SMBus controller's PCI revision ID is used to check if EFCH
>> MMIO is supported by HW and should be enabled in the driver.
> 
> Thank you for splitting the changes into small chunks for easier
> review. Maybe it was even a bit too much in the end, as most patches
> don't serve a purpose on their own. But well, that's still much better
> than a monolithic patch.
> 
>> Based on v5.16.
>>
>> Testing:
>>   Tested on family 19h using:
>>     i2cdetect -y 0
>>     i2cdetect -y 2
>>
>>   - Results using v5.16 and this pachset applied. Below
>>     shows the devices detected on the busses:
>>     
>>     # i2cdetect -y 0 
>>          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>     00:                         -- -- -- -- -- -- -- -- 
>>     10: 10 11 -- -- -- -- -- -- 18 -- -- -- -- -- -- -- 
>>     20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
>>     30: 30 -- -- -- -- 35 36 -- -- -- -- -- -- -- -- -- 
>>     40: -- -- -- -- -- -- -- -- -- -- 4a -- -- -- -- -- 
>>     50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
>>     60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
>>     70: -- -- -- 73 -- -- -- --                         
>>     # i2cdetect -y 2
>>          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>     00:                         -- -- -- -- -- -- -- -- 
>>     10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
>>     20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
>>     30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
>>     40: -- -- -- -- -- -- -- -- -- -- -- -- 4c -- -- -- 
>>     50: -- 51 -- -- 54 -- -- -- -- -- -- -- -- -- -- -- 
>>     60: 60 -- -- 63 -- -- 66 -- -- -- -- 6b -- -- 6e -- 
>>     70: 70 71 72 73 74 75 -- 77
> 
> Unfortunately I'm not really able to test this series. While I do have
> an AMD-based laptop which uses the i2c-piix4 driver, the SMBus has
> never been usable on it. The driver creates 3 i2c buses (port 0 at
> 0b00, port 2 at 0b00 and port 1 at 0b20). The first 2 do not seem to
> have any device on them (i2cdetect returns empty). The last one must
> have some devices on it, I see address 0x1c answers the ping,
> unfortunately as soon as probing reaches address 0x2c, all later pings
> return success, regardless of the address. It seems that some I2C
> device (probably the one at 0x2c, but I don't know what it is) is
> holding SDA low forever, therefore preventing any use of the whole
> SMBus port until the next reboot.
> 

My understanding is the OEM may have different i2c devices because it
is mainboard specific.

>> (...)
>> Changes in v4:
>> (...)
>>  - Removed iowrite32(ioread32(...), ...). Unnecessary because MMIO is
>>    already enabled. (Terry Bowman)
> 
> I'm curious, how can you be sure of that actually?
> 

The removed code was using a MMIO region to write 1 to 'mmioen'. This was 
using the MMIO region to enable same MMIO region.

Programmer's manual shows FCH::PM::ISACONTROL[mmioen] has a '1' reset value.
Per programmer's manual, FCH::PM::ISACONTROL[mmioen] enables MMIO mapping 
at FED8_0000h..FED8_1FFFh. The FCH::PM::ISACONTROL register is MMIO 
mapped at FED8_0304h. 'mmioen' was intended to be set using port I/O to 
enable MMIO but, port I/O access to these registers is now disabled.

>> (...)
>> Terry Bowman (9):
>>   kernel/resource: Introduce request_mem_region_muxed()
>>   i2c: piix4: Replace hardcoded memory map size with a #define
>>   i2c: piix4: Move port I/O region request/release code into functions
>>   i2c: piix4: Move SMBus controller base address detect into function
>>   i2c: piix4: Move SMBus port selection into function
>>   i2c: piix4: Add EFCH MMIO support to region request and release
>>   i2c: piix4: Add EFCH MMIO support to SMBus base address detect
>>   i2c: piix4: Add EFCH MMIO support for SMBus port select
>>   i2c: piix4: Enable EFCH MMIO for Family 17h+
>>
>>  drivers/i2c/busses/i2c-piix4.c | 207 ++++++++++++++++++++++++++-------
>>  include/linux/ioport.h         |   2 +
>>  2 files changed, 164 insertions(+), 45 deletions(-)
> 
> I'm done with my review, looks good overall, I made a few comments here
> and there but no major issue. I'll leave it up to you (and Wolfram) to
> either send a new series with (some of) my suggestions addressed or
> just go with v4. In both cases you can add:
> 

I'll add your requested fixes into v5 and will send for review this afternoon.

> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
> to all patches.
> 
> Thank you very much for your work, and sorry for my late review.
> 

Thanks for the review.

Regards,
Terry
