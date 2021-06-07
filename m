Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0D439DAC0
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 13:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhFGLLJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 07:11:09 -0400
Received: from mail-mw2nam10on2057.outbound.protection.outlook.com ([40.107.94.57]:6497
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230264AbhFGLLI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 07:11:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcbKyxsSAuDpG1hueo7vVr2IPzYXFRQpfEHn13lsa9H9RXWpCsXDoH4QYxfFRFCIWDAAH/1JdU9FDk8JEsvPiiq2eZoLTB1e8imZygElAcSKUkmm27H6DRvodmASiC/oR+qCult6sS5Pqts9cHG+5dR2jVHvNejwMlr51eI8HTca0h48+ER/3AuNF/Ck1Z5rdAm5+EjdRXVwqcNbe+BMlK+E8zip0jLM6kBf7PoKDA03cxdNMTqe/TyQNOn80je+Y8WFue5mgA4c1mOOyNsmkyd8OvtTCOOSLpnFGyj1Ygk7SSXy6Nfa/8tC+Rnp9X3ATM2z5yBeXWBNv6d7BxYGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xT75tHZORIQ6gxngGMMMakWV7WwAHSG6TNzK3LmCZsw=;
 b=QFhyV2FNXiOi8OuD/EikeFkhcQcKsoeseLxLkGNKIL/DhFNGaOfeK0tMGT+aNVExf+ihYaQvl3bgtvC9URmw7mV37qiROrJ8kJGKpXUExajHX355vQn/tbSRYpKtEqXdOzH2Zib1nCJG+X2TOUXTEOyQ+Y75TjhI/q29SoVE2Tn1sNR+aG3uuQg8RkTMZNboESs7BIXRke/5ipiH5XdY/CmTN/R0k5FFH1QmtjLnHouHMueFEEXQVqETBcVTc3nUV6QRZcek7QWL7LoQK+TZwaXwpg6zu62czfdGyH5jVt4Bgr5fYf6y+w4KsuA/IRtx7MD/5QW9GBPIJS5pJGgvPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xT75tHZORIQ6gxngGMMMakWV7WwAHSG6TNzK3LmCZsw=;
 b=FuLcx5Y7YKdCwj1sHxxfpdysyYnAo/Yzoummv+DNwUscW1gpqY3qsN7V2edf+EUFUHNSu6yZiHHzYTgHlJ0x3mm9y5VZtYtOgPrUYgCkOjxSR0ZzdTTdC3YXrrnuoLaOr/m5eyIbJ0A7ppRl28deMA5WhxjV0tLT0cAhAPy2Kd6nbCiSrrFBXMgRgKRMTCEjCRCyaRAgSvMwLpI6ylXMD4vqLSN7YloU6pHhkPFzYwvj4HP66iL1a73HVNLWNpbAvtdipiXjLiL1EvOZGmskHmoSwOuUD4hqu6+Wpqzpxe9zED1uPciU+ZR7v/VAYQoD7T8rWYw8m5TsSq2XyKOJ1A==
Received: from DM6PR03CA0093.namprd03.prod.outlook.com (2603:10b6:5:333::26)
 by DM6PR12MB3995.namprd12.prod.outlook.com (2603:10b6:5:1c6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 11:09:16 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::6a) by DM6PR03CA0093.outlook.office365.com
 (2603:10b6:5:333::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Mon, 7 Jun 2021 11:09:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 11:09:16 +0000
Received: from [10.26.49.10] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Jun
 2021 11:09:13 +0000
Subject: Re: [PATCH] eeprom: at24: Support custom device names for AT24
 EEPROMs
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Fomichev <fomichev.ru@gmail.com>
CC:     linux-i2c <linux-i2c@vger.kernel.org>, <linux@yadro.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
References: <20210602170823.vnshp2gfrcay35nx@yadro.com>
 <CAMpxmJWa0ZXN--2S84B-Un0WSKM16eKAiWUtKD4V_szZPEi+gg@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b2b7be69-eebb-b325-1962-4d45e6d5f088@nvidia.com>
Date:   Mon, 7 Jun 2021 12:09:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMpxmJWa0ZXN--2S84B-Un0WSKM16eKAiWUtKD4V_szZPEi+gg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49e5c252-eaa8-4a5e-8efa-08d929a4b099
X-MS-TrafficTypeDiagnostic: DM6PR12MB3995:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3995CCAD990DD93F7B4960C4D9389@DM6PR12MB3995.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 81vJkWFJL4s6TTNGXMqBnIflY66OrW1iGAYq4Duq6kdifr6hXH8tsyWBZK0YV1ur4GlXGj8Y09pa59W1BsqBeboRJV1TeW9GbUU/4b/4nAtdv0HjcVKgOsJxpO9sZiWFaGJ/8e0VVisA8eM1Y/VzT5JPstTj3eJwnJ/Lk70WmtQzEzb65+rTvkQmneKyVyTFhjVdeU3ek9AfJrshVO/263QSWCa6LpgdrdNpxETC6pUqzvocNqHhNdKbrKi5JH1BZo8KaX+tGNlWs4e1YNuSIsgiHNKrNQFQgtBt/igoos6kRCHncz1oilSW32x3HmdFxCUfQ71opJBP9db0d8gUbT1RMt1YOuGfZWKDWgojVbG2YCkIXB+Iv0zQ3ZhTJP7wOU5ikeUS1gwYdQ7L/2Nni6GScFbbJFgwHpcFWR1mdAx9AQZdaQUxwobtacPIZS78/b2Cb1le9C3mmugWRK09D1/D+r/Z9gXBwSnSN+GNV3DWs0e13o1H3RatVsK3NJ5voZFLmR09FZLuQOR5TTGohLoJuf/2vMPDbMr+UjLJJHBmKSjzNZGKWCrC7TWXlp6bALpG4jgccYa34MnLUOX+3Zx8UcL6MS1NPM9ptI+Sw0ruIknPHIUQm+M+Z1SWJYoD55xX0vEBt1R+15qRyIseb/afNV+N10iBZCyJX/DCv644iONJngWJEvGfV2hoRi4j
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966006)(36840700001)(2616005)(186003)(426003)(336012)(16526019)(31696002)(36756003)(47076005)(478600001)(36860700001)(8936002)(26005)(8676002)(31686004)(107886003)(4326008)(82740400003)(86362001)(53546011)(70586007)(110136005)(2906002)(316002)(54906003)(16576012)(70206006)(356005)(36906005)(5660300002)(82310400003)(7636003)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 11:09:16.2765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e5c252-eaa8-4a5e-8efa-08d929a4b099
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3995
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 04/06/2021 11:00, Bartosz Golaszewski wrote:
> On Wed, Jun 2, 2021 at 7:08 PM Alexander Fomichev <fomichev.ru@gmail.com> wrote:

...

>> This change has a serious defect, as it doesn't guarantee a name
>> uniqueness. For my case there are a bunch of NVMEM devices with
>> 'dimm-spd' name. So the module initialization fails with several error
>> dumps in dmesg, like following:
>>
>> [    4.784679] at24 3-0051: supply vcc not found, using dummy regulator
>> [    4.784781] sysfs: cannot create duplicate filename '/bus/nvmem/devices/dimm-spd'
>> [    4.784783] CPU: 24 PID: 1354 Comm: systemd-udevd Not tainted 5.13.0-rc4-at24-catch+ #25
>> [    4.784787] Call Trace:
>> [    4.784789] [c00000003f3eb010] [c000000000914700] dump_stack+0xc4/0x114 (unreliable)
>> [    4.784797] [c00000003f3eb060] [c00000000061c5c8] sysfs_warn_dup+0x88/0xc0
>> [    4.784803] [c00000003f3eb0e0] [c00000000061ccec] sysfs_do_create_link_sd+0x17c/0x190
>> [    4.784809] [c00000003f3eb130] [c000000000ac3014] bus_add_device+0x94/0x1d0
>> [    4.784817] [c00000003f3eb1b0] [c000000000abe7b8] device_add+0x428/0xb90
>> [    4.784822] [c00000003f3eb2a0] [c000000000debbd0] nvmem_register+0x220/0xe00
>> [    4.784829] [c00000003f3eb390] [c000000000dec80c] devm_nvmem_register+0x5c/0xc0
>> [    4.784835] [c00000003f3eb3d0] [c008000016f40c20] at24_probe+0x668/0x940 [at24]
>> [    4.784845] [c00000003f3eb650] [c000000000cfecd4] i2c_device_probe+0x194/0x650
>> [    4.784850] [c00000003f3eb6f0] [c000000000ac4d3c] really_probe+0x1cc/0x790
>> [    4.784855] [c00000003f3eb790] [c000000000ac545c] driver_probe_device+0x15c/0x200
>> [    4.784861] [c00000003f3eb810] [c000000000ac5ecc] device_driver_attach+0x11c/0x130
>> [    4.784866] [c00000003f3eb850] [c000000000ac5fd0] __driver_attach+0xf0/0x200
>> [    4.784873] [c00000003f3eb8d0] [c000000000ac1158] bus_for_each_dev+0xa8/0x130
>> [    4.784879] [c00000003f3eb930] [c000000000ac4104] driver_attach+0x34/0x50
>> [    4.784885] [c00000003f3eb950] [c000000000ac35f0] bus_add_driver+0x1b0/0x2f0
>> [    4.784893] [c00000003f3eb9e0] [c000000000ac70b4] driver_register+0xb4/0x1c0
>> [    4.784900] [c00000003f3eba50] [c000000000cfe498] i2c_register_driver+0x78/0x120
>> [    4.784905] [c00000003f3ebad0] [c008000016f41260] at24_init+0x6c/0x88 [at24]
>> [    4.784914] [c00000003f3ebb30] [c0000000000122c0] do_one_initcall+0x60/0x2c0
>> [    4.784920] [c00000003f3ebc00] [c0000000002537bc] do_init_module+0x7c/0x350
>> [    4.784926] [c00000003f3ebc90] [c000000000257904] __do_sys_finit_module+0xd4/0x160
>> [    4.784932] [c00000003f3ebdb0] [c00000000002c104] system_call_exception+0xf4/0x200
>> [    4.784938] [c00000003f3ebe10] [c00000000000cf70] system_call_vectored_common+0xf0/0x268
>> [    4.784944] --- interrupt: 3000 at 0x7c1adac4b4c4
>> [    4.784948] NIP:  00007c1adac4b4c4 LR: 0000000000000000 CTR: 0000000000000000
>> [    4.784951] REGS: c00000003f3ebe80 TRAP: 3000   Not tainted  (5.13.0-rc4-at24-catch+)
>> [    4.784955] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48222844  XER: 00000000
>> [    4.784976] IRQMASK: 0
>>                GPR00: 0000000000000161 00007fffefc78b90 00007c1adad37000 0000000000000006
>>                GPR04: 00000f6614d56be0 0000000000000000 0000000000000006 0000000000000000
>>                GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>                GPR12: 0000000000000000 00007c1adafde680 0000000020000000 0000000000000000
>>                GPR16: 0000000000000000 00000f66118b1980 00000f66118b1a18 00000f66118b1948
>>                GPR20: 0000000000000000 00000f6614d60500 00007fffefc78df0 00000f6614d535c0
>>                GPR24: 00000f6614d56be0 00000f6614d60500 000000000000000c 00000f6614d49cb0
>>                GPR28: 00000f6614d56be0 0000000000020000 0000000000000000 00000f6614d60500
>> [    4.785033] NIP [00007c1adac4b4c4] 0x7c1adac4b4c4
>> [    4.785036] LR [0000000000000000] 0x0
>> [    4.785040] --- interrupt: 3000
>> [    4.785146] at24: probe of 3-0051 failed with error -17
>>
>>
>> It needs either to use NVMEM_DEVID_AUTO flag irrespective of the 'label'
>> property or to add a sort of counter suffix to the name field.
>>
>>
>> Reported-by: Alexander Fomichev <fomichev.ru@gmail.com>
>> CC: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> --
>> Regards,
>>   Alexander
> 
> Alexander: Thanks for your bug report. The counter suffix you suggest
> is precisely what NVMEM_DEVID_AUTO would do so I think we'll need to
> use it. On the other hand, a non-unique label is bad design but
> obviously we can't break working setups.

Yes the intention was that the label itself would be unique. In our case
we wanted to have something specifically named 'system' or 'module' to
identify a specific eeprom.

BTW I did a quick grep from 'dimm-spd' and did not find it in the
kernel. Where is the device-tree you are using?

> Jon: As the author of this patch - do you have any objections/better ideas?

I would need to check if appending a suffix then has ramifications for
what we were trying to achieve.

Jon

-- 
nvpublic
