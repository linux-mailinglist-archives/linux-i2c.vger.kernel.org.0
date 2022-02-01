Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D0B4A5FE8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 16:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbiBAPVQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 10:21:16 -0500
Received: from mail-mw2nam10on2051.outbound.protection.outlook.com ([40.107.94.51]:60832
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231308AbiBAPVQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Feb 2022 10:21:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKLMKYjiYZRlNL/TqcK5VpTvzV8zR4DpRIiRTP+qsElWZVyAVf2hFi+3dixZpj0lNRbxISYphOxHmZARXNGVycl7QTQ2dkcecZUr8d+/4jLXw19d15eyctV7zWMyxmllFNzempoPo/ryl26V4Uvh2i+bbD62mwmz1JDXOgEOycNjrZcMp+LjqHPlIodNRoV6MIGDb3gRKNi57e2avTwwAUEnh8b1wlEQwMKqMySfk5OlmAEUyJ9V6Nb3TQkk8rwqDKvLOQT9sYKseQt6IM5XrnRcry+mNGexLFCHr6bLJR0dqmVInZMiI3cTJunDgjRJtd+m1h7xDiDblxzhx3b3tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=454R9EE1LHjUzw+AalFaxn96O7Mia0phWk2Vz3reu94=;
 b=iUS3gq779viu5Y6BC8sn4+zn9nf3nBMXV1DBWG2gEg7jizIEwEU32FgtWvH//axL5SAQmf89HlgdNxPnwoCSCJLRimjI2Q6QRiJmr+XVaw3NV70ZVJCZ1lE2ThLcKW9RGlIQrmJtbPkgPOLBIpbbJaEqPHh4gcb1iAoAYs1pX4BbfCrXZgmRZFiplbu5a/1uO4Vtzz1nawkBv3wFezZUpEHxbuqPz31f/RhC4BacICqDzW3UCK38uciKFsr8vCNMDnb/B4WyKUV7+yA//kqGDAecbyCWvaT75yjSWvoSlqn0/lw4rgjtC+R93a/j+k6Onwsq12gofRP8HNKPaJ5CaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=454R9EE1LHjUzw+AalFaxn96O7Mia0phWk2Vz3reu94=;
 b=t+Td9lalMVAb83fSTnBXmwuIzKiptnC1SEFrGoI3Yg9w62qcenAaA1g6n6+a73EUCcy4ex2O8IrWzt20M1LDWYCQ/IXb9Lpo5GvcKZrDBjIrz59xu0GobgpgZpSlMTgh9kiSAZ7yaV34tH2F1hCt1OY+vmeqBsctj3u/Ajjzrhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by MN2PR12MB2877.namprd12.prod.outlook.com (2603:10b6:208:ae::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 15:21:12 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 15:21:11 +0000
Message-ID: <6d392557-e9e8-b150-3d5b-250655aa7013@amd.com>
Date:   Tue, 1 Feb 2022 09:21:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses
 with MMIO accesses
Content-Language: en-US
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
References: <20220130184130.176646-1-terry.bowman@amd.com>
 <CAHp75VdOLDCMzS+uRxLY1=0CX8tD4sfkeE6=5Sk2quNTn8z12A@mail.gmail.com>
From:   Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <CAHp75VdOLDCMzS+uRxLY1=0CX8tD4sfkeE6=5Sk2quNTn8z12A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::34) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f087e5f0-9ce9-4df1-2ef1-08d9e5967aa1
X-MS-TrafficTypeDiagnostic: MN2PR12MB2877:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB2877A8D5F88D491AF767527A83269@MN2PR12MB2877.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ybWz53db3KpADxeQ34tcpvGAYcA/9Q2zmc76FHm6N8HjMAzFJ4QV97LjdfU1TSxSqGYs7ugAblHez6+Ssc4wHv89WF1Zn4r8dIaAJ/8Zvetw9uw1j5pXetYJo0A36AjDZ66NeiABA/MxsACWrMu9XDWdWHZpTRdquS2hycxwPrfpiyMU8M0IiXNZwNCOKFkv8zHpaqZwkosXggfsyqBKGQ9lUx5pQESqLw54N0k6t7EWyxZfCYcjBOWUYgofs/baKVIdunp/hMNZN6fw7OKVlcNko9QJGgtFqPM96PWvqXk/zS4gKpg8AcoN7jtrqijTUdBRA+NBab9T9kzIP+ckaM3Hx6YzZ0KXG2PDWmlvYwaMwpUaQnKkRahdT8jr/34bJ9LSeoqlKMxZQ+/U/5g3UJELEYQzYOoMWqAtKeVXCpVVNtP4JcS+H2mNz1muQUiLWpHewa1kUwdyO1e8/DYOGL92/rrJZV418Hu63yN7b2dPjnUKyuh/Hk/VjpMsZaZ3SrCWTUBfkxf13r5TQQvT5WZgf6Zb7ycD8Sy0YWXYmbXrtTHIm45drb+MGvlCHtzD9q5OiomBOAUZApCeQBHFsTL2dFxMBsOW7f2VIvxdl9kYxaMv3n7Df4Vgz6rdDOREIM16nyW7N7nihKbKSCzZQaHtImbOZsu+LASz6q2QykEsJ04tetD4iquC6R4CSI6VoHrtd24FVI+qj/XL5ktHQALVjhpk7IHfTs4vl39jpQXGZ9Wlz0XB1oYYWu+JLVLhPJLkbnoj7av7GOAQbTfuYao6w2oFEIGyI9YRnT7TXb/sxc8F01CDP34Vaz9nPaWOiM03kxCSc/7SLfLNiUNwTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(66946007)(6506007)(6512007)(8676002)(66556008)(186003)(8936002)(4326008)(66476007)(36756003)(31686004)(53546011)(38100700002)(6666004)(316002)(2616005)(508600001)(31696002)(6916009)(86362001)(45080400002)(54906003)(966005)(5660300002)(6486002)(2906002)(83380400001)(32563001)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzdWYWQrVmkrYWF2NFBPWDRtN0FLQ3pVeXhTQVJvN3k2STdSeElNVWZHR1Zx?=
 =?utf-8?B?M2xHUDdKMjBFNm5KTDlBUTBZdnV2Z1hoVFpHZWpvRFlGWkFYblhhNWtDNGxP?=
 =?utf-8?B?a25ZaUM1WEtjejJ5VVlHelFoZVExWGtOSVB0Z01USnpyWkFQZEhTSGlYRDJ2?=
 =?utf-8?B?WEdQZW9hWXhoaDdhcFUzaE9PVWtvTGRCaXpOd1RKV1J6cThwY2NIaTZEVHpm?=
 =?utf-8?B?MWZlWmlYazl1Yzdxejh3aGRsUis4eUt0VDJPRS9RV2xWOFdSL2tFNFNabG5j?=
 =?utf-8?B?cXVoWXNaLzdyNFNMa3JIMmwwY0huNzZnTld5OHh6QlpPZGYzVkY2ZXRqYUIv?=
 =?utf-8?B?N1NkMWRJTDFuUjdRMCt5SWlWalpnekVlS2svYlFhdVh1dHN3ZWhBMWp1MGJM?=
 =?utf-8?B?RWhBSjkzTS90a0xrUDdEQi95MEFhQ1NuNDFGUmIxc3FFY2Y1VzZ2SDl2aXNl?=
 =?utf-8?B?YkdUQlhqYldFaDZ1Y2RpcG5HM3pCc0tueVUvSmtNallucmhzSVZWcExJb2NZ?=
 =?utf-8?B?ZktONWxlcFE1dmtVeU1wNmlGYlFCREEzYmR6OVZsYlNkRDhNYURIT0k5QmNY?=
 =?utf-8?B?N2hyekxkNS96VTZKa2ZReXExUjVudVgzR2xMOWloV3ZPYU4ySnJpZ3VQQlJH?=
 =?utf-8?B?d2FVc1hwSDRBakVFYmlIWWZZMkZjc0pTa2F0Y0I4V3U3VDdpYjJUa0pNZVVv?=
 =?utf-8?B?L2o1dWVqMFFVdk5vM2ErbU9BMFJmUVVXZ1QvY2hoN1hwTEpKRGtVWTBIQ21P?=
 =?utf-8?B?cWxZdldVV25yOWd4cG9vZndHMCtlNHZNMkdWWmlkY3U0UXhNVHl2TTNPTGNt?=
 =?utf-8?B?K25hQ2NOOUk5YlgxT1dMWks1Nk0vME1QUVBoVm5pazhmUUJRN211d3Uvd0VU?=
 =?utf-8?B?RklEOWZRUG04azJKV1JsR0w1N2tzVkhmNmFXQUtvdjdWamhqSlh0RE1wNk16?=
 =?utf-8?B?TG9nNjhDZjF5Yjc4SU1BZVllSVlIdXVIL09ucVNpVWluWi92cktGSzN5THI2?=
 =?utf-8?B?czBjRkFPL1lHMEFtRFdYT3VVMk50LysvazJVQ1FYRGFpbythcjV0OUdDVG1u?=
 =?utf-8?B?dXpyL0ZFMnVzOVJBdGloSzNWOW4wcXVEQWRPVGlJZ3hJZVU4cVF4dFZFYUg5?=
 =?utf-8?B?dzZ4ekw1ckF5QnVHT2tlcVNiSnl1bVVtSHltQ3djK3FxOEJia0R4WDlTcG5H?=
 =?utf-8?B?MTR3Tm5LQ0Q2MzlEeitpUUpVbUYweC8yK3lOblA2dzlUTS9sVWg5VWVWV0FO?=
 =?utf-8?B?cjZvRUVhckxjYStiMFBzNTBIcTRKSXlTTVpwcng2S0ZBUmpIZ0Zab29FQkRL?=
 =?utf-8?B?SnJyTEhWUWs5Ym44TE1zQlZoZ0wzN0pwUTU0cXNSLytEZHY4QzYwaFQ5SmIy?=
 =?utf-8?B?b0VTWkxFZCsyblUyT2hUamNpZXJKZzJxd1kwRFNtb1FWamZVWGdBM2xrODI1?=
 =?utf-8?B?UTRUb2dUQ2VSZHdmd3gwRmphRG9Kd3krOVlzbDQyVk03cTZRUU1jdnl3YTk1?=
 =?utf-8?B?dnZ3cndvUkpsUEM5N0N3OWZyaGdIeFBXSmszeGZkU0cwZ2FZL2dGRTl6eFNI?=
 =?utf-8?B?Sms4dDdhUWZsOGxnekkyUWVyNWNUUmx4TG55cEEvaGpndVBJbXEvSDRNTlNv?=
 =?utf-8?B?Ry9JY2htRWU2dkxwVjhQNE1lMzgydU00ait4bDNvL1VEM3l0eEltT0ova3dx?=
 =?utf-8?B?ZmJDSkVCWVl2UG8zdEZhNXNQTFFTWDJzbG0wdnhNcS9CRmw4V1NsSUNzRDZF?=
 =?utf-8?B?d3JpTS9CNDNScE1memdMRVpaYW9kR1NTUWJjUEpIK0xMaHZZcGFxOU1XVWFY?=
 =?utf-8?B?VmsyQ0hnbm5TSnRWY2xMdnZSN0F3aVM1L2NMdy91N0xYNW9GcnNJR3c3M3h0?=
 =?utf-8?B?RTE5c1hMeUx3UlVsOVlhN0w2bzdyaDFnc21ESEpXOFZqUzRzUU9pYlVqeWRr?=
 =?utf-8?B?YUI4QVRPSTRhVVM3THRMMHc5bVJJVlQ3OFRBa2FLUVcvdldVVFZaOFJXV29Q?=
 =?utf-8?B?Z2hnNE5hTFNBVjRzRlB4aDVlRGY2WjRZWC9kVC9Ic1RGTHJZWHN4ZnBXSFdl?=
 =?utf-8?B?NkJTOUM0WVkydEtSTndQZ0E1RGdoWUMxYkdFL01tZy95SlpRQmg3UHJLYzcy?=
 =?utf-8?B?S1ZxMVJnbmpmekpKdmRvaWRRQlBzSEhJR1BDR3VrM0RMc25UUUpvenN1OG0w?=
 =?utf-8?Q?nJ4Udo3IoDVHIgV7VvrrEvA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f087e5f0-9ce9-4df1-2ef1-08d9e5967aa1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 15:21:11.6280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOtPAP7XjhsajkDz7dq1n/6QyezDmLjADNSt28M/WSK6w5RH/sY5YpIHQf0HAvTiUqNiC90AdI/hlOjljUFZpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2877
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On 1/31/22 05:01, Andy Shevchenko wrote:
> On Sun, Jan 30, 2022 at 8:41 PM Terry Bowman <terry.bowman@amd.com> wrote:
>>
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
> I'm not against the series, but I am still concerned that we are using
> _p IO without clear understanding why. With cleaning them up, this can
> be simpler and cleaner.
> 
> For the i2c patches:
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> if it helps somebody.
> 

Thanks for the review Andy! I plan to add the ioport_map changes you recommend 
in a future patchset. I will include you as "suggested-by".

Regards,
Terry

>> Based on v5.16.
> 
> v5.17-rc2 is out :-)
> 
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
>>
>>   Also tested using sp5100_tco submitted series listed below.[1]
>>   I applied the sp5100_tco v4 series and ran:
>>     cat  >> /dev/watchdog
>>
>> [1] sp5100_tco v4 patchset is in process but not sent yet. Below is v3
>>     upstream review:
>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-watchdog%2F20220118202234.410555-1-terry.bowman%40amd.com%2F&amp;data=04%7C01%7Cterry.bowman%40amd.com%7Ca4a101d574724ba6958808d9e4a94579%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792237972109034%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=LNxoYDcBRCT4Fih%2F8v1m9Xwbvbq1rqHbFlAcqrT4YDU%3D&amp;reserved=0
>>
>> Changes in v4:
>>  - Changed request_muxed_mem_region() macro to request_mem_region_muxed()
>>    in patch 1. (Andy Shevchenko)
>>  - Removed unnecessary newline where possible in calls to
>>    request_muxed_region() in patch 2. (Terry Bowman)
>>  - Changed piix4_sb800_region_setup() to piix4_sb800_region_request().
>>    Patch 3. (Jean Delvare)
>>  - Reordered piix4_setup_sb800() local variables from longest name length
>>    to shortest name length. Patch 4. (Terry Bowman)
>>  - Changed piix4_sb800_region_request() and piix4_sb800_region_release() by
>>    adding early return() to remove 'else' improving readability. Patch 6.
>>    (Terry Bowman)
>>  - Removed iowrite32(ioread32(...), ...). Unnecessary because MMIO is
>>    already enabled. (Terry Bowman)
>>  - Refactored piix4_sb800_port_sel() to simplify the 'if' statement using
>>    temp variable. Patch 8. (Terry Bowman)
>>  - Added mmio_cfg.use_mmio assignment in piix4_add_adapter(). This is
>>    needed for calls to piix4_sb800_port_sel() after initialization during
>>    normal operation. Patch 9. (Terry Bowman)
>>
>> Changes in v3:
>>  - Added request_muxed_mem_region() patch (Wolfram, Guenter)
>>  - Reduced To/Cc list length. (Andy)
>>
>> Changes in v2:
>>  - Split single patch. (Jean Delvare)
>>  - Replace constant 2 with SB800_PIIX4_SMB_MAP_SIZE where appropriate.
>>    (Jean Delvare)
>>  - Shorten SB800_PIIX4_FCH_PM_DECODEEN_MMIO_EN name length to
>>    SB800_PIIX4_FCH_PM_DECODEEN_MMIO. (Jean Delvare)
>>  - Change AMD_PCI_SMBUS_REVISION_MMIO from 0x59 to 0x51. (Terry Bowman)
>>  - Change piix4_sb800_region_setup() to piix4_sb800_region_request().
>>    (Jean Delvare)
>>  - Change 'SMB' text in  logging to 'SMBus' (Jean Delvare)
>>  - Remove unnecessary NULL assignment in piix4_sb800_region_release().
>>    (Jean Delvare)
>>  - Move 'u8' variable definitions to single line. (Jean Delvare)
>>  - Hardcode piix4_setup_sb800_smba() return value to 0 since it is always
>>    0. (Jean Delvare)
>>
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
>>
>> --
>> 2.30.2
> 
> 
> 
