Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FBF48CE90
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 23:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234695AbiALWyV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 17:54:21 -0500
Received: from mail-mw2nam10on2046.outbound.protection.outlook.com ([40.107.94.46]:20832
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234670AbiALWyN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jan 2022 17:54:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvLa1ihLP7x8CRkhfD/IMNcuMWHQnCmOKMlpWbl36JwtQyFhGOcO5NalcSmXzunGaZ1qhgRRKj1o5KpiVkVWoPiCQ06VLyBpTpd9gLEGGCGGTpmCzfYehSflQgOSD64QnR4XJ49NjNmgtWUDV/mcMZmQEveJTY1006YyClQtuXpliKpZ/EgdfH90Tdvg5VS5GP3S/UQdytEyz1JIGN9MwSV/PNUKHfi/NcVevXb6XKIqV9UWOBVANkjAdLfF2IdFkX09pAKpdoVOlCuO7C6B5VlYeUPBhGWd9SfS6tT5W4yjmTGjJFdFpRgwqpmkaoVQiPeowaGMwkGTvzRqkdzwVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySNkQQRTM6M7aDB2+S40Qixjb/IHNiGo8l+32lx6zOM=;
 b=LCP29JmYpIjbp5ShzbwEy8G8Keqtw8ah16U4p5Ml7P2NfVKki3Fp7yBbQhdZ7n3kOMabixCemtpieHFGruaoFwLhCAyVJRINQiWoysvwk6XW0MsPT8/z1fqjkJPLqsBWD0j9+EiL//7XmhqSg84GU8peYXVkWk6v7IgSI5Pq2hn44aXo9ftHDrW5eBMZYnD/+JGEw3IFpsnM6/fFCLugi9vch29Pe58yq54LFLT5ZMF4oXvNd+rzM8SOaowfBKfJnTS4UoopxDC+3oifC7fNPjuqx2Yniph1alwfi7WP3sL84sHnqy56WmfC5Ekibvc/y4uRcOFv4HzxxvykTKcEwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySNkQQRTM6M7aDB2+S40Qixjb/IHNiGo8l+32lx6zOM=;
 b=RNFswOTQI/a8eU8PfgQdGAFzKD1o1ueSfNXFn9btqbnODryphE1yAl7FZEtliEReuYybw/E5Fo1FU5d5K/AO+uWgrHDPNtHC2jop6y6sNrpPyoxSntS8Ygx+/Dc3CBfIxZ61a32pl3LH2kr98VKF95yUWHZWnSD2ExB0hDEZ8vM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BL0PR12MB2356.namprd12.prod.outlook.com (2603:10b6:207:4d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 22:54:10 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%4]) with mapi id 15.20.4888.011; Wed, 12 Jan 2022
 22:54:10 +0000
Message-ID: <d39101a9-adc6-df32-12f5-fccc8fd34515@amd.com>
Date:   Wed, 12 Jan 2022 16:54:07 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Touchpad stickiness on AMD laptops (was Dell Inspiron/XPS)
Content-Language: en-US
To:     =?UTF-8?Q?Miroslav_Bend=c3=adk?= <miroslav@wisdomtech.sk>,
        Wolfram Sang <wsa@kernel.org>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alex Hung <alex.hung@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
 <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com> <YdbrLz3tU4ohANDk@ninjato>
 <42c83ec8-bbac-85e2-9ab5-87e59a679f95@redhat.com>
 <CAO-hwJJ9ALxpd5oRU8SQ3F65hZjDitR=MzmwDk=uiEguaXZYtw@mail.gmail.com>
 <5409e747-0c51-24e2-7ffa-7dd9c8a7aec7@amd.com> <Yd6SRl7sm8zS85Al@ninjato>
 <596d6af1-d67c-b9aa-0496-bd898350865c@wisdomtech.sk>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <596d6af1-d67c-b9aa-0496-bd898350865c@wisdomtech.sk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:208:23b::15) To BL1PR12MB5157.namprd12.prod.outlook.com
 (2603:10b6:208:308::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5642506e-6702-4297-5513-08d9d61e721c
X-MS-TrafficTypeDiagnostic: BL0PR12MB2356:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB23564C378ED438F10A51D48FE2529@BL0PR12MB2356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ELqCZ6QZZV7qUbUmRKZzMMouBITJi1BfLRZnC29BzliqVf1e+Yoi06uuBqLjrdKd0XZASlyY5pQemsZz1rmdxz5ad8tr/LC1t073bJ6sP25fS3D3Q6G/873new8y0n9m9CgIWPSDVZHner550LgaSldRuiFPWKXCW2YZX/yHwe77kF40mDIn6U5mRTR42Ph0xShhXxFaqdoYJVn4syb2uD80DM1CJNVnNPwLgUuU8uAoevaNepReBLWL3tRJx+cGtUJb+oB3Xe6k9DDbQ/Vn2NjZkGElcMMyALD9ildumbR2AEQt3awHTfdXQvAa3eCenkLANw7Hw4A+AT/+AzfTzru96AMFfaDXgSHRVP4iC+0WRCW88fC/S7rAQRWq1LSQdqT+OfaSvid0kVJnQB0Q9P6MBM69uG76oe2YkzMsNdlNYapQ0bMdWWDzqq9swCzs8cLKU6Ot2Lq9oaRQohMckNpQ7D14XPYUkdFeaNvHZE5Dhg2t+PoFGqDcSft76ciZcQZeXBqvq0sdLXfjMY4TRZ0zPdWJnkBgAYxmPaVk1pk9n01EOQTqIfnxB/vGj2BHxU8q8ktm1zx9l+CyoLEHquvwOMbPUbveQxXjl8dhoTFYoDRGgix2p5dru7kyDEZohoZmW3CemrYDEnouj02UNK7CD8cFOBxvRlArTND8Ds92vXuyAQR2bR3xzDwNByZgEwyaEyiFQOk1yFxFywdeL8v8r2SluEOHBM7CAPYwYaUfkkQSBb2IodYgdZCeYpfVym14DTh+iXYUIXIL/n54sb7IC5dmrb2tAUwkmW0VbjZ9Ad8/wmXQZWdl0QpSrpTuyTf3XhrWkq0oYX+PPhTGvTq0Kodt02QQOGWsefjDzfeq2yIm8pw6GkP1QXu6IGm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(8676002)(7416002)(36756003)(31686004)(86362001)(921005)(6636002)(6486002)(316002)(2616005)(31696002)(186003)(110136005)(6666004)(66574015)(66556008)(83380400001)(26005)(53546011)(2906002)(38100700002)(5660300002)(6512007)(6506007)(966005)(45080400002)(66946007)(508600001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTIyUlZ1aE93ZnZvK0FaZzR4N202RUFRcW4rUWZxV1M4S25ONkE3M1RHYS9N?=
 =?utf-8?B?cWtzamZYNzJiM2lEOXZ3L1NkNXFFRDNmVjRNRklRTHIzSFQ4N3V0a3JDOTFq?=
 =?utf-8?B?TEFpTlg0enFXWW9OWG94dEtLUEN4S1NGbHMxeGdRd21VaW9qUnZid2gzSktH?=
 =?utf-8?B?V1loZ3pUZUZUMEpMYWM1Mlc2WGVQRWVMNEl1TFNvdEx3S3pGenJUbkcrc0Fu?=
 =?utf-8?B?bzdleWtzMW93TWxzcGVId09yYm56OXVKZzNqbVNmSFNhMFpaamhueXVmWWRv?=
 =?utf-8?B?WHM0QmpMUThocUVzL2xmcFRSSWVNSmtCZFhUdVVLcnQ1aTk3cWM3NDJPWVB6?=
 =?utf-8?B?Q3k2S2xIM0tRTGhhT3Y5dUVyYVcwTHQ2UTNhZHoxVGs5dkZkeno2SU43bXJX?=
 =?utf-8?B?cTdzeG12NThnbTk2RG1mZnYyaC9sZGljWWp3VDVLNDVrTHNkZ3p5bVhZTmJx?=
 =?utf-8?B?R0RNWWl5WkJxWFAvdHplcXFpTXo1SVBEVW5ab0VXRXJzbmtFNnZXYUhtcjhm?=
 =?utf-8?B?ZTI5dW56eEZOUDQycFdvaisrTHpPV0cvWW9FK0NrcGxHK3BPbmxOdk5TM1E0?=
 =?utf-8?B?RUxkRW9kMEFDa1VuaUpXMGtMSFViSWFWTGtKeFdsV0UxK0VKYmtJTUFaanVs?=
 =?utf-8?B?OFFacmRsZ2hIOFc1d1hRZkw5c1lPcDVkRzNEZUZTVDRsZXZrK01ub05pUGdk?=
 =?utf-8?B?UWczaVM4cG91S1ZaZGV6YWIvSlJoV2pMQlh1R2JzcXp1RFM4Y1FoenZIdEVZ?=
 =?utf-8?B?U1RXTEF1bnFzb2RQSXVsOVFKNW03TTNjOUVMcXRRaUNpcGtCOHJKaitoYlZt?=
 =?utf-8?B?RFkyZnRFai9yRVoyUWVWMW5lWnA4NDRaMU9ZZEtHTmd6ZWtsd1ZsM3JQS0Jm?=
 =?utf-8?B?L1hHK3lSMmpUYWJFK01HdXdLd2tBcjZrenM1djZLSlp3R1c1NnVWWG9nNTZn?=
 =?utf-8?B?cVBLOFRDd3NSK0hIa2RIVjgwY0lBdzlzS2JyUTBsMkVxOWxhQXBRSGRtbDQ0?=
 =?utf-8?B?Sjd6UXJKRjYwc1lQQWgyUmFIeVp3Z1F4NVpzV0kyUmk4QXZZMWZJeU1JRG5t?=
 =?utf-8?B?cWlhaHVxVVNMeXBHdG5tQnpFUTNCc2VPd2R6MlcxQzVnUHJkeTZJZVNHQVhB?=
 =?utf-8?B?eWRkS2ZLMmRCN2JONDQ2K1AxeVRkZEFVSi93c2RoakdSMUJ6QzA3dTFwTHRz?=
 =?utf-8?B?NmVpTmRQblFBRUNSOUZLdWxZZjVBQkI3TWFNQ0hxb09zWTMvQXY2eEdSV0hl?=
 =?utf-8?B?Q3p3azExRlNBTGN0YXZGTmN4K0pwMitBSjRCYkQraWFncGlEMkZQNHhBZU15?=
 =?utf-8?B?dXcycitOalhmQVF3bFF4WkhIZkpWaFV1cG1IQzRPWmU0TVNiRnBQK3VvOHlW?=
 =?utf-8?B?QXFKQjVxQndCalZPQTlEenFiZEJkWTRPT1VNUGthNEUwM3NIVGlYY0svSVRl?=
 =?utf-8?B?VVI5ckVmMitidjNyQm5YdkhaNFgwaDAxbkc5ODE0OVYzTzdTd0dXM1dXUVJK?=
 =?utf-8?B?dEgvcXBRU21nZUIvRXdWVWFiRDZzOGdaOVNXa0kxYzlHc0pabENlSkpaOWxt?=
 =?utf-8?B?QkNrQTZZcTgxYmlPYk1KcVpmam5QOWF4ZUI4RzNuYWtucmtuSm9aVjlzOTEz?=
 =?utf-8?B?S3VSZ0VFbzluMDBMTHIwbDEzenIwNVhydk55NkZNblYyVVdqSk5IVmRhZjRn?=
 =?utf-8?B?SFpucEdZRW40V28wQTFlNzY3RWw2cWNJbG9iSmhidkluajZHcEMrL25WTFB0?=
 =?utf-8?B?T1NyN2h1eW55amdENytHdWtaRFlkcEpTVmw5TmU0SEgxaUJ3VGFVdS82eWJF?=
 =?utf-8?B?c29YaU9HcUdwR3JJeW5Xa2ZVSmZqMjlQYkdLbkVKYitlRUFxUDRDVlo1RVJB?=
 =?utf-8?B?bFlIYnBFRmJjanBORHpPUnd5L2V1bUxWbWR5M0MyNEs5UDBpRXRKbXZqRW16?=
 =?utf-8?B?a20vdmlDbVp0UWJ0RlRzNGVXOEFtM0syM1BHSk1QYzN1eXdYK09QbWdJZmFl?=
 =?utf-8?B?VGlhUWtaQXhmbnlWV2NGUkxueHRGbWJOSW10b2MxVEpqT0JxMk1NZDgySy9R?=
 =?utf-8?B?bGdlQVMyVDJjcVZmZnBxcmlJMTNKMWQvbGdhTVNic09GUm9KclVGeFRtZHBK?=
 =?utf-8?B?N1VjV2hQUWZ1QjFRU2psZmZ6cE5GYW9aZVh5TE9UcW9uL1ZyS3BodkRXd2hw?=
 =?utf-8?Q?v5GlP7E5+K5+JkQfEF0xYk4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5642506e-6702-4297-5513-08d9d61e721c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 22:54:10.4906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSp2Dl8vmNL1zw+JWGX8B5NC9c3x+WosaV/bWancfPHZLn/iNWTLFbw2G9saCKZMVITW+HfO+CSf6EPC7Wc0ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2356
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/12/2022 06:21, Miroslav Bendík wrote:
>  > IIRC tests done by Miroslav showed that interrupt 7 was used for
>  > completing SMBus Block transfers and alike, but not for HostNotify. He
>  > suspects this is wired via GPIO somehow.
> 
> This is just speculation. It may be routed to GPIO pin, but think it's more
> likely that AMD implements host notify. I have looked at windwos drivers 
> and
> there is only SMBus driver bundled with synaptics.
> 
> Lets look at 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.intel.com%2FAssets%2FPDF%2Fdatasheet%2F290562.pdf&amp;data=04%7C01%7Cmario.limonciello%40amd.com%7Cb813c9d7934b4bb971dc08d9d5c610a4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637775869527091018%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=GyQUs1tNgpQDcE%2FeoV1lF%2BKQgFZs3YDgYrP8Z5oCS2E%3D&amp;reserved=0 
> (PIIX4 from
> Intel). There is SMBSLVCNT register (page 152). Last bit (Slave Enable) 
> should
> enable interrupt on host notify if slave address matches content of 
> SMBSLVC.
> This register is described on page 135 (SMBUS SLAVE COMMAND). Registers are
> accessible using PCI configuration registers. I have tried this code before
> enabling interrupts without success:
> 
> pci_write_config_word(dev, SMBSLVC, 0x2c); // synaptics
> 
> I don't know if this PDF is relevant for AMD. Newest documentation from 
> AMD,
> which i found is:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.amd.com%2Fsystem%2Ffiles%2FTechDocs%2F55072_AMD_Family_15h_Models_70h-7Fh_BKDG.pdf&amp;data=04%7C01%7Cmario.limonciello%40amd.com%7Cb813c9d7934b4bb971dc08d9d5c610a4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637775869527091018%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=OYtn%2FisOR1uHzWVmre9wdIuFhD3PCaHqP2NTRrTh07A%3D&amp;reserved=0 
> 
> 
> This document describes SMBusSlaveControl on same address (0x08) and 
> SlaveEnable
> looks almost identical.
> 
> The interesting part is:
> 
> "address that matches the host controller slave port of 10h, a command 
> field
> that matches the SMBus slave control register, and a match of corresponding
> enabled events"
> 
> Slave device should send address 10h automatically. Enabled events can 
> be set
> using SMBusSlaveEvent register. I have enabled all (set 0xff to 0x0a / 0x0b
> registers), but i don't know how to set "command field". There is no 
> register
> named "command field". Intel has SMBSLVC, but i can't find corresponding
> register on AMD.

I think "SMBUSx11 I2CCommand" may be what you're looking for.

> 
> Constant activity on I2C pins can be repeated host notify request from 
> synaptics.
> 
> Last interesting fact:
> 
> I have recorded register value (except 0x02 and 0x07) after each SMBus
> transaction. This is from last 2 transactions:
> 
> 0200 0004 5801 0000 0fa9 00ff ff00 a8aa
> 0200 0001 5802 0000 0fa9 40ff ff00 a8aa
> 
> Every call has SMBusSlaveEvent (register 0x0a) 0x00 except of last 
> command after
> which device is initialized. After this call register has value 0x40. I 
> have
> written 0xff to this register to enable all events in probe function. I 
> don't
> know why it's 0x00 until last transaction.
> 

