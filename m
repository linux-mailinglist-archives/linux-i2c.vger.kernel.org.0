Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1403A344C72
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 17:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhCVQ5d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 12:57:33 -0400
Received: from mail-bn8nam11on2066.outbound.protection.outlook.com ([40.107.236.66]:40929
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231609AbhCVQ5J (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Mar 2021 12:57:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGMC5Oiv0DhX7/Sck45WhvkIVcvWy3/fPhG8GrzAeKkIHkiozRHl+isBqzrDUGJSpKIXs77iR+Fr4iK5ggYBZOVl/KQ74cunJYSRTiu4g+XI18G6Y0J+SzYqYcy6IO5xu8x7HLRc4B9wmbrmUUad5CfIMh2DkzSTTmIFjWkyagSBRHy2rluSXuo3V1897duG+oq8f7SQM9l0v3aP1bruKjyOIZGUuX+jqbMWo1OsJr12Lg+yweomGGWJOMOks/eJd/Dsk06WeHFiYlAJNOxFB5Tg0Q2I1z8HGwiBo/uN7GMtMFghquMrEAQX7RDQKiEIJujBPfJUuEHusx+r7LYV2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m++bTK0mizbitaysiKkUN5XXYazRudX8hC4gwfP7o+w=;
 b=JC71456RfYAG5dJa3CD0bZFah35G1tYpnRxwlyeMu9oOPSY+6kCkKFztrHA4U3vr3WdNdsmVGi7MxuOcSvVKIntTlMu7AzQtdzAyp8fyxQM7eu96qRChTV9tRHkCvwG9uAFvm8O7nGFos65OZlevG2dnwjV8aGhtd2oX6qTN1bB3s74Oti3FVQgkpdfSZwoOVpegIbNhzjr6tf194W0l3ykiyIZbYZTyY/ZX1h2rn9IWJcCvkRLZUrU+I3+2OLf1yk7Y4rIGW1vfL0N9Z3MpfOv9CxdBKB3GGyNOxeYBihYEQ4K58DKilBlwK6KxqgICs1tCyIHbz+X5b7dlITEv8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m++bTK0mizbitaysiKkUN5XXYazRudX8hC4gwfP7o+w=;
 b=bhdlLOlKvPYU3ROge0/twq3m50BS/p8QqEaR+XcDlN1UxyMjuWOgJmDhDUixqu6SwG/NWB9572TLrGkDEfNPSW0QT3TmMAaGpBvYT2jNPM9sdDQqLxBhot3mLey+okZf263oJPCnh78rfsuXAbdrhcpdmV4hK44KCBJmcuTf7h4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) by
 DM6PR12MB2890.namprd12.prod.outlook.com (2603:10b6:5:15e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Mon, 22 Mar 2021 16:57:07 +0000
Received: from DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052]) by DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052%10]) with mapi id 15.20.3955.027; Mon, 22 Mar
 2021 16:57:07 +0000
Subject: Re: [PATCH] i2c: add i2c bus driver for amd navi gpu
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
References: <20210309133147.1042775-1-Sanket.Goswami@amd.com>
 <YEeFgZSIY5lb2ubP@smile.fi.intel.com>
From:   "Goswami, Sanket" <Sanket.Goswami@amd.com>
Message-ID: <fa1a59fb-a7fa-44bb-1629-5e726f164b94@amd.com>
Date:   Mon, 22 Mar 2021 22:26:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YEeFgZSIY5lb2ubP@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::27) To DM5PR12MB1835.namprd12.prod.outlook.com
 (2603:10b6:3:10c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.90.71] (165.204.159.242) by PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 16:57:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: defe80be-cd09-4c15-3055-08d8ed5386cf
X-MS-TrafficTypeDiagnostic: DM6PR12MB2890:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB28900EB53A7ACC8266D4C42E9C659@DM6PR12MB2890.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2sDWuQj+LRzcGetPHpsg6yAljEKrymsGBEPso0KAu9g5OWkEufmmL3TuoTOl6bNciTJwoB7/79SP5odWHcMmUnJbT1EKkLC84a59WujVmlcUa0HZk7ifckeaB4VU8Zre/JKs70Gef4Nz8PMgVBMjJO0Rf0UB+ciaWKuOWXRfgVxj3x5nT0nEiUbqcIpfjHENSH4P70T0UqMkNC76/GLAjRI4Q13jHxr+UbyanhIzw6fOPm1+DE968QylrvE7RIceEmR4vYqk0kUujdpo19gpVHJTU9Ag0zZcEgRdf7We9IWKgs7w6Znc76Noe6qk6W9SatTscb6AgibBLIpb+MJQrPor+5M2r7wbUCu3hnSh6mjIjDYyH/0ckUiqKCB/k4YGl0Ax6n/pjldSPlR+X65NpNbrLuqBs7mvCO9RNzaUUdmfgNHEY8DMxV8hNuOTw2NLmmhrLc5098VVUDDZizX6h3WcXfqkpRrcU93Plx2p+RsUw0e4/7bI5QhJzpmP07AIHpLF6jxXJoHbBILBAIk+kNc/Paw5nru0Pho/EznMXiiaCHzhmoTSrQBXFbZUci8qIpDiIOfAKGSfVmlkOG08Vqg6ZZpLCi/sXi+EI9EE4ntz+vBnMLGO1wMHRJWJrn7qPjpC20Pvthuvwb+CZRoGzDcKW/tres6hNr+4dhzTGIuC6XfZgshMyODI74kaPyRYhR92dqYOjxLO+am6sGe2RlvVhoGcuTQRRDozalSQ1rbtAiugdLuMEaJmDjbgxnXDaymLut9C6/s9P3HcRdujnTtA2UMl9GVRrmbYRhOEras=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(8676002)(66556008)(45080400002)(53546011)(38100700001)(6486002)(54906003)(966005)(66476007)(478600001)(5660300002)(8936002)(16576012)(86362001)(26005)(2906002)(66946007)(31696002)(316002)(31686004)(4326008)(956004)(36756003)(6666004)(16526019)(2616005)(186003)(6916009)(83380400001)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aHVZdHJLWWlkQ3RZMmJIYSsveFBmTWxxalRjVEV1ZE04NmJjNVArMEpUOEEr?=
 =?utf-8?B?YTN5TmxwWXk0eGt5c2NESjlBWm1wMncrUFVOK1JkdDd6R2VpQ1RNdnk5eFQ2?=
 =?utf-8?B?OEN2bTQyNzEyZUFmU251Z2xwUWxxZzJzRkFRcnlpREVzOWwwRGxwMk1DT1Rx?=
 =?utf-8?B?aEJ3Q2ZJSUpmY3FVMDBhQkZFV08zTkhhQ2FQQ0ZodU9ZL21wSit1MjJrR2Rx?=
 =?utf-8?B?UTJDL3IrRytYdnIrby9XRjd4ck9vbFdONkwySm1xbVN3ZVkySmFEdkFvRnZz?=
 =?utf-8?B?S2N4a0p5elloZEh0ZXo0L1kxQWJveGpaUnAzcUlzMVN6d2dMUHovS2RQejhC?=
 =?utf-8?B?ekYxKytpLzNTRXVoaUFDQ3k0VzJvcnNSUmUwZ2FhTDV2WkdBYnJxeEZ3SVVZ?=
 =?utf-8?B?NUh5WHRidlhndkIwUFlOc3hxL3JQTkRUOEovTm5vZE9XMUZhLzQ0aFZYOWkv?=
 =?utf-8?B?aGNyL0xVOVV6eWU1STg3aFpWbXZyRUlFb1BnUGJHdjZZVFRqTFAvRW9RSUZE?=
 =?utf-8?B?dkxwQTE2cGg4YmtWNnYyWWlJL0ZzR2ZmdllkT0RZQnVvZmNvNCs1bWNpUFNk?=
 =?utf-8?B?Z1M2c3ZKZjI0SnZoUTQvOGhWdVllSmVKNWdyWXJ5OUNjank2RExQUnFnYkFu?=
 =?utf-8?B?L3lYekRNb2dYMXp2SFhQbmsrT3ZuQ21MWnNaKzk0ZzBnSWZrOExjcGJRRkVk?=
 =?utf-8?B?TmpQUzZLdTY1NTA2eENOSjZmd2Q5M1VVYTZDNnFvblE1WlZHdHY3aitVOHF3?=
 =?utf-8?B?ak1JK2dEU2tJbVhYTTFkTmROL2hvQ0xmdDVEWWNRNXUzNmNoVUZwb210dXBY?=
 =?utf-8?B?bXFZeEtCaHpLU2UvZVFSNFcxOTZVdE91STJZbzRWYTUrd2tBa2d5dEdJQ3Bi?=
 =?utf-8?B?ZnptYzV1NHBOS3RJSEovTDZ2dDF1czNGV00xTmZaY0dSeEFzM2RhTnI1ZUNq?=
 =?utf-8?B?TENHbnFuK0VkZ1l0Y2FHM21HMFowNDRZbzVESndLeHo2SE03M1JzQ3RZaTJq?=
 =?utf-8?B?dGR1NHhCTUMrak82VE9pVkVrbndrU2trZ2FSRkUrb2xCcWJHV0d2RXpOQmlH?=
 =?utf-8?B?cVZTeTRGbjBWaEYvZkEwSVFnM3FNUDRoU092WGxSbUxtWVBYcStUYTNENDJa?=
 =?utf-8?B?QUlXZTFKemR1QXVhUmNCdDlYbWNRR3F0K2FWQW95RVJjdjdpayt5dHZreGhF?=
 =?utf-8?B?NFBGbHpHZ2xsYmZGYVFVQXJFMmNMMnUvMlVGczBVOVVGODR3emZNcnRUZDg0?=
 =?utf-8?B?T0NYODM1STZ3bmd4R3g5WGxySUg3NHZYRFBST2pKUHhGeURyRWJJUS9FbmNp?=
 =?utf-8?B?ZnFpUEJaYzhVd1kzMmZSSWRyZjBWckgzNWtkN2g3Y05KYTgvYUNUYjI0Tysv?=
 =?utf-8?B?NmF4OUhZcmpac0ZuVWVNR1pYY0EzdEZYbUZ5dFdKdDlTanpHbFhXV1o1eXlH?=
 =?utf-8?B?b3MzNEE3Q2VUckU0Uk9obWFnTXh1QmFyTEdkSGREVUJYUXZ2U0ljU3FQSWdV?=
 =?utf-8?B?eWJ0RlNtMFdtU3ZaYXY4L3VBNFBKaXFBTkd0VnZuODhTaDVtcUVEV1VmNmd0?=
 =?utf-8?B?U0g0V3l5VWhxQ0FrSlVLTXFtVkpHdGpSN3J1dHBvSFdzdm9NdldiVUlRUkJ6?=
 =?utf-8?B?dCtCRDlMRlNDVnlvK1RMNkdVRmhOQ0hoZTI4bnBNOTY3dDBVK2lDTkRrUlQr?=
 =?utf-8?B?RzdGQ2lDZkoyMFRuWUJtK3hvTTBwKzNvamJCYjZBemZscEtQUDhaVW8vMmdQ?=
 =?utf-8?Q?n9QSWHqBTQeClrGrwsxlI6Sg1h2BnwxomjD02jv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defe80be-cd09-4c15-3055-08d8ed5386cf
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 16:57:07.4977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kF0GGvdaDVaOD2bpXBkAyCSdhjLnU4WJJkUNSXBzERn8xfVN4eprc79uH/9SsCbSzmjfexhHAMh9VgX4wUgI6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2890
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On 09-Mar-21 19:56, Andy Shevchenko wrote:
> [CAUTION: External Email]
> 
> On Tue, Mar 09, 2021 at 07:01:47PM +0530, Sanket Goswami wrote:
> 
> i2c: -> i2c: designware:
> add i2c bus driver -> add a driver
> amd -> AMD
> gpu -> GPU
> 
> in the subject
> 
>> Latest AMDGPU NAVI cards have USB Type-C interface which can be accessed
>> over I2C.
> 
> I didn't get this. You mean that USB traffic over I²C? This sounds insane
> for a least. Maybe something else is there and description is not fully
> correct?
> 
>> The Type-C controller has integrated designware i2c which is
> 
> DesignWare
> 
>> exposed as a PCI device to the AMD platform.
>>
>> Also there exists couple of notable IP problems that are dealt as a
>> workaround:
>> - I2C transactions work on a polling mode as IP does not generate
>> interrupt.
>>
>> - I2C reads commands are sent twice to address the IP issues.
> 
> Please, read this article: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fchris.beams.io%2Fposts%2Fgit-commit%2F&amp;data=04%7C01%7CSanket.Goswami%40amd.com%7C70d1c562d0c04fc2b76508d8e3074c97%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637508967775355658%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=yLiOkOtqCwGQAJgpYast8cMfCY4I9R74ElWm9FDNFNQ%3D&amp;reserved=0
> 
> ...
> 
>> +#define AMD_UCSI_INTR_EN     0xD
> 
> Why it's capitalized?
> 
> ...
> 
>>  #include "i2c-designware-core.h"
> 
> + Blank line
> 
>> +#define AMD_TIMEOUT_MSEC_MIN 10000
>> +#define AMD_TIMEOUT_MSEC_MAX 11000
> 
> Use unit suffix in the definitions.
> 
> ...
> 
>> +static void i2c_dw_configure_bus(struct dw_i2c_dev *i2cd)
> 
> Why all this is customized? Why FIFO can't be autodetected?
Addressed in v2.
> 
> ...
> 
>> +/* Initiate and continue master read/write transaction with polling
>> + * based transfer routine and write messages into the tx buffer.
>> + */
> 
> Wrong multi-line comment style.
> 
> ...
> 
>> +static int amd_i2c_dw_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
> 
> Why do you need a custom function for that? Can it be generic and not AMD
> specific?
This function takes care of AMD Specific bus configuration for the transfer and
also addresses the IP issue of i2c transactions hence it is kept as custom.
> 
> ...
> 
>> +     /* Enable ucsi interrupt */
>> +     if (dev->flags & AMD_NON_INTR_MODE)
>> +             regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);
> 
> This is looks like a hack. Why is it here?
In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
it is mandatory to set the right value in specific register
(offset:0x474) as per the hardware IP specification.
> 
> ...
> 
>> +     if (dev->flags & AMD_NON_INTR_MODE)
>> +             return amd_i2c_dw_master_xfer(adap, msgs, num);
> 
> Ditto.
Initiate I2C message transfer when AMD NAVI GPU card is enabled,
As it is polling based transfer mechanism, which does not support
interrupt based functionalities of existing DesignWare driver.

> ...
> 
>> +int amd_i2c_adap_quirk(struct dw_i2c_dev *amdev)
>> +{
>> +     struct i2c_adapter *amdap = &amdev->adapter;
> 
>> +     int ret;
> 
> See below.
> 
>> +     if (!(amdev->flags & AMD_NON_INTR_MODE))
>> +             return -ENODEV;
> 
>> +     return i2c_add_numbered_adapter(amdap);
>> +
>> +     return ret;
> 
> What the second one does?
> 
>> +}
> 
> ...
> 
>> +     ret = amd_i2c_adap_quirk(dev);
>> +     if (ret != -ENODEV)
> 
> This is ugly. Can we run quirk if and only if we have an AMD chip?
> 
>> +             return ret;
> 
> ...
> 
>>  #define DRIVER_NAME "i2c-designware-pci"
>> +#define AMD_CLK_RATE 100000
> 
> Add units.
> 
> ...
> 
>> +/* NAVI-AMD HCNT/LCNT/SDA hold time */
>> +static struct dw_scl_sda_cfg navi_amd_config = {
>> +     .ss_hcnt = 0x1ae,
>> +     .ss_lcnt = 0x23a,
>> +     .sda_hold = 0x9,
>> +};
> 
> (1)
> 
> ...
> 
>> +static int i2c_dw_populate_client(struct dw_i2c_dev *i2cd)
>> +{
>> +     struct i2c_board_info   *i2c_dw_ccgx_ucsi;
>> +     struct i2c_client       *ccgx_client;
>> +
>> +     i2c_dw_ccgx_ucsi = devm_kzalloc(i2cd->dev, sizeof(*i2c_dw_ccgx_ucsi), GFP_KERNEL);
>> +     if (!i2c_dw_ccgx_ucsi)
>> +             return -ENOMEM;
>> +
>> +     strscpy(i2c_dw_ccgx_ucsi->type, "ccgx-ucsi", sizeof(i2c_dw_ccgx_ucsi->type));
>> +     i2c_dw_ccgx_ucsi->addr = 0x08;
>> +     i2c_dw_ccgx_ucsi->irq = i2cd->irq;
>> +
>> +     ccgx_client = i2c_new_client_device(&i2cd->adapter, i2c_dw_ccgx_ucsi);
>> +     if (!ccgx_client)
>> +             return -ENODEV;
>> +
>> +     return 0;
>> +}
> 
> This is the same as in nVidia GPU I²C driver. Can you do a preparatory changes
> to deduplicate this?
Addressed in v2.
> 
> Also why (1) and this can't be instantiated from ACPI / DT?
It is in line with the existing PCIe-based DesignWare driver,
A similar approach is used by the various vendors.
> 
> --
> With Best Regards,
> Andy Shevchenko
> 
> 
Thanks,
Sanket
