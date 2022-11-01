Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96523614D1F
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 15:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiKAOyG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 10:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbiKAOxu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 10:53:50 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07F7117D;
        Tue,  1 Nov 2022 07:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMpRn+n/B2iaoX/wNfcanBRzPBfqMrOhFaO+F9eZg4EWwuMcs6KWf5ToTLw/zT8pD58DTU4gcY7rAAOq1LSvM9yMvMJBA+a1N5N7s4r3TRo+q5rOSS1XtygZ/jQ7iMweXxee0dnJKsXDiEXD2uaWAuIBBZb3bIXoVlT+aIHXQnPiX0KzKwWdSbd5y8w8DD4R7Pt4z+lQXMwIHqVUbBo8UyFvT3MhK/1fxcC2Cc1Ow4FzdidHUnQkeNP0uBXCc5vqhSmDVGCa1arEBpJYrOAz8W4L2ZDGRbqNrSH9wAOQ+dVsp7gXbQUkdW1R6GgaZNe36dBBiaxfJdaAUWt6153PVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUob2fx0kTobMjceFG5DCMdpD8iUJFLsO+ksnmdxm5s=;
 b=OZq/IkOAUBtjcYxdBgbPq5tsulx6vF7e2m0ZbI5Xr9g5anfS8cPJc8Vcu4sOGDPO3aIetEK7LsOkX9aVdLW7N+ti61VVsS6Lc3mK4+KuDuIYZ4XlF7dtDpk3pFoLxlStgPlbr1IRdV0IRGRKzGlIXujcaasDiFegdYTUibdBYX9nXN8+H6MUuAkew9GMyfFG5l0GbjGFFRLva219rUzZFwjuDO9mX2u0dvCAVfIo3L0lmQZk7bYEjaUo80Pqsu385H41K+ehQw0/6C1XuPs5eqHj2LA/0Fq+J1e5J9gTGX0sfo6pMc7gfjZnRobYMzfrHj0d4hPuglA1GxVZN5yQhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUob2fx0kTobMjceFG5DCMdpD8iUJFLsO+ksnmdxm5s=;
 b=mR+VawwxRBVtndFrfwCxjuhp7WX4AAb4OmIKpPRbBnIq8MoTvNBKSRA9R1yufHQundHLaLzucxy+myq0gmGh1/1upReHG2wOELX4RNfO1WUAE8acvT47wUcFamjmxUeaw4A5kIl6J3zt3sKRrbp98CQjmUEeYis+2YhuRYAq8L10U+uX2GdJJc9lD2wE4Th4kunyXBaE+POQCO4wbqHYBMNpip+m/fdFdSAq844Djt0TYBTOdcAkW46GlvqTRsxtaQqB0Ge2TqsfepdhEWBW4vshuIWHR0wl+EWLJiM+799PXOVqZLPc0bW/WUQSBy8jCjV8ZUCFW4+F5a9qGhbEPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DS7PR12MB6141.namprd12.prod.outlook.com (2603:10b6:8:9b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.19; Tue, 1 Nov 2022 14:53:38 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::d749:2439:e6ae:5840]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::d749:2439:e6ae:5840%4]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 14:53:38 +0000
Message-ID: <c33efd7e-7cb5-0933-4511-bfb84ff662aa@nvidia.com>
Date:   Tue, 1 Nov 2022 14:53:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 10/11] usb: host: xhci-tegra: Add Tegra234 XHCI support
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Wayne Chang <waynec@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, treding@nvidia.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com, kishon@ti.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-11-waynec@nvidia.com> <Y1vblCOXOCtX/RTP@orome>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y1vblCOXOCtX/RTP@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0128.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::7) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DS7PR12MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c76c51-66ce-455a-2f2f-08dabc18dba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 17vdc9Fjy2HiN7hi98QOSkMgNU1oP5qCjTWNUzq3ZfgsI3AxP+8yGYC8d6i7MjRCtmYj6lAa47muNeH3tN5+JpNNVWcSqjxJPFdLdmXCPJH+weNYbh8mwI2NHFvml1+AuuaMLS7kS6BqEBjif5jfuNN4qhtJez8w5wbgl5MY3EDnLyPRkSYHyhdQOFL88p62UHO3h1X/UwCcZlQXJlVWXIk4pOfcLbPx4lYqqk+J7ffSdDS0wZIbeWOv7eByYpkKhoFPHGHThqcn4DY9USrIILPyNXgYozfvxUuokkor4qnO5mTOfH2dG2YK4M65QEWjkLhO1CmG1OAJAns6lbIcw8n3wBoeyM3wdq1pNUh43oQNw+ktfgpjzcOazMFKtoiEFACMy8b0qlDQH7mgtiAYfQBtznIp/POxLpp5bVVTLqTmDRZd4HWNQtleSZBUW7RRY133KNdF4jse+YNnOcFnaE/tb5Eah+9GxuuHKVyVAnuZslqfkSDx4grdPOqG7FQ0LIZKu+0juYuiu+USnHz8zAZlX/nK3hWx0pZjGqp9aT53OFM5TNnwWbwxZhG/22l1/mMF0hY+EHVwK1qKFv4pl6d8yO+dJpUzpEmauDlRrqKblihRA5b/34M1F5HfQ4uvmChSMFNT0oCTZ5TqVuu0OJQy79gsaAsEYZu7uE15rdP1e8KOTqJFlBopg/usefmjFrl+cXcp7u1IqT8G1cnDALrPBp3p1eUOl9lkm+xLNgMbav7xOgy2KZL1CL46FeXnKKqqlcDF+2KaLMEt43IlA8NfzwfD43DnaTUg8Pm3EZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199015)(2616005)(186003)(8676002)(4326008)(66946007)(66556008)(66476007)(41300700001)(6506007)(6512007)(6636002)(110136005)(36756003)(6666004)(5660300002)(26005)(8936002)(316002)(55236004)(7416002)(53546011)(31696002)(86362001)(6486002)(83380400001)(478600001)(38100700002)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDJKbVBHWUNGNDFZUU5nbjJlSEFEdEg2S0tETmg4M0QxUWZDejNUZGhQYmpa?=
 =?utf-8?B?ZGxucCtpM08vMkRQS2xLWDlHdDNGQUJ3Tld0M1FhWWltYWs5aXd6ODNJM0t6?=
 =?utf-8?B?QU5lV0x3WGttSkRsaVpRSjNFRktIUGNuMVJuWldmaDVjdjc3QTZDN0NESzBn?=
 =?utf-8?B?YW9aV2ZEMVRiaVFJbEdFYi9iZlQvVUtGZ0crOFRSK3hBUHRoclhWT09NM1Zh?=
 =?utf-8?B?a0YvQzN1dWdvWWxCdHdmalZ4RFl5dU1aQlcycEJjTnk4cHE0RzRyT3FrNHpK?=
 =?utf-8?B?L3V1cWJ2dVJnRFRxRzFTbVM2SXpjbk1TcG95UEd6K0tmcEdTaEliWDllanJr?=
 =?utf-8?B?TkVEVVBnMnNuaU5BZXFDSzhmZkluRTNUQUJPN1JoektRYnhYbVVwUEJyVHVR?=
 =?utf-8?B?RmFzNXVMMlpwQmRpd0JXUExZMlluclRGL0phNFBMMUsxbTUzdDhmRWw4NW9D?=
 =?utf-8?B?cmxkZ21XbXpvVzBJYUtTRjR0NjZYOFNYNnlJL0drYTlhN2cxNCtUVlJjVXhS?=
 =?utf-8?B?WWtqbXBpdUtZaWFpODBRYUhiNUoxeG1nVWwvcVYyeEZTWW1aYUFHN3QzZklI?=
 =?utf-8?B?M1oyUkpqTEhVZUNNdVlUS1pmT21Fc0g5VzdaRUVXdlJIc08vejZsS0l5ZnVS?=
 =?utf-8?B?VDB4cHJSYkNUaCtENWFZK1BhSEdQck5lVVlYZU9lRnVrb3FBTFNVbDNqVTFY?=
 =?utf-8?B?aHdZMElTdUFxc2ZiTDR6YVgrVzQ3aS9MM2FHT204Nytjbnh5NW9peE4xZUlG?=
 =?utf-8?B?YXI1Smw4YkxXblgrcml5d0lFV1NNQnlUalZmSm82eTFEaWNqelloMjhWVDlD?=
 =?utf-8?B?ZjlyczVpSjIyb3BEZExqaDRtZnpUcVVYdzNsM2J4U3YrdVhvaXBVMi9QdHhs?=
 =?utf-8?B?OXNwVkpRL00wZDh5RVd4SFpKZEZGc1Z0UklHWnpoRloybVkzaS8weW1SUm05?=
 =?utf-8?B?Mnp5cnc0TWY1bTNGdWxGVDY3U2tSeDFtc1hQMGlmZE03UjNiMjRJdE1pQ0pn?=
 =?utf-8?B?dEJmZE5hQ3ZVRzVWWGNFTkRSUGhvZDBqMnJHZnE5elh2M2lLbERDRnRTY3dJ?=
 =?utf-8?B?QzBKeXFQbVExYVlDSEYzOG5nVngrb3pWeTVlUkhpSG9uOFZNUXRIMEZDT3d6?=
 =?utf-8?B?dU5PKzZQRS8rdzlsZjIzT0daakVWYm9qTUt0VlZ6Ny9GUmV0eUUwVXNEek9L?=
 =?utf-8?B?a2FtWXZUVnd2T1BmQXRXWmxPMEVXMkFlZk9RTEl3QTVzS0FhRjEzOThtdTRs?=
 =?utf-8?B?Nlk4dVpxZ1kweVJ6OFd0aWtpS1Y4RlFsS25lZ1pIeEc2WGVjcmhOWXc2NnN6?=
 =?utf-8?B?Ti9DbXk2dVJIRTFEUG80MHZ1V01aR05GUmFPMVNJdkVLWXJjbG9ZQXIvTzE4?=
 =?utf-8?B?NkdLUk5Za0FEbEk4ZjVTY1NmV2xVK2tORkFOYXN6VlQ0aUg1RkEraEhLU0Y4?=
 =?utf-8?B?NE5aYzJzWW9hN1djOWYxcTA0bk51bnkzbDYreVVxS0lRRUZLSGIxeW1vVkt2?=
 =?utf-8?B?ZFFzMFYxMDQ4OXZ1ZVFaTU9URVplcnl5U2RmbnBxb2VQMDZJckN1aG4xKzc2?=
 =?utf-8?B?QmVNanhmUWJLUGVMUXRUMmJRUGVIUzNlQ3VXczA1Q2owdHorNlNXVi9oS0Mv?=
 =?utf-8?B?eGZBL0xzVjVnSHBFaUtUaFV5dDlINE5mbVR0ajErWk1YNWZ0WkRrTmRBd2ZO?=
 =?utf-8?B?cTBUOE9YUlZqeDFjT000RkpSNWFvNXNjMksyRnhKRzNQQUdvVERNMTJtL2VO?=
 =?utf-8?B?cklPWnNsMUswb09uS2grdzRod1RNNnRKL0hybmZWMzE1SjRWWjA4S0E1aDls?=
 =?utf-8?B?cVE4blkrcWQ3cGMyMm1MaUtOcEN1L040amNrVU5ldE5CUU5RS3JkckU5ZTd3?=
 =?utf-8?B?THVTWklNR1VpMzMxZUs3LzhKNjRvZC9LMzlnZmgvUjhkajk5U3J2VkIwVk53?=
 =?utf-8?B?TWdqbm5wN0JwUUpkTGVrUTNUR3FCK0NydVZYdXhnVkJEQkJGR1Jpa1ZzMTRY?=
 =?utf-8?B?WDRNOENXMWRHdTBQWlNISWptZnk4d0RBWUx0NGRpNWh6T0hJQkRwQTlFRm4r?=
 =?utf-8?B?bXdBZ0VVbWQ0dk1XaHhIRXdibHhxKy9teDhzM2trRmYrOFpIM09XMDVxU2d1?=
 =?utf-8?B?cnBJSDBha0h3SUhmM2JaV1NmMG9MVEt2ZjJjNWczWE9Jb0VKWXJiZC9tTlUx?=
 =?utf-8?B?Y3c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c76c51-66ce-455a-2f2f-08dabc18dba5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 14:53:37.9756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWfFeR3nc3mU8RwHE1YS2e2+ZZmVoWUpNiuH0uvfmaHZnEMwUaqXdrMMevonpc1AV+P+r2QK0ijKWLfJt67x4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6141
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 28/10/2022 14:39, Thierry Reding wrote:

...

>> +static const struct tegra_xusb_soc tegra234_soc = {
>> +	.firmware = "nvidia/tegra234/xusb.bin",
>> +	.supply_names = tegra194_supply_names,
>> +	.num_supplies = ARRAY_SIZE(tegra194_supply_names),
>> +	.phy_types = tegra194_phy_types,
>> +	.num_types = ARRAY_SIZE(tegra194_phy_types),
>> +	.context = &tegra186_xusb_context,
>> +	.ports = {
>> +		.usb3 = { .offset = 0, .count = 4, },
>> +		.usb2 = { .offset = 4, .count = 4, },
>> +	},
>> +	.scale_ss_clock = false,
>> +	.has_ipfs = false,
>> +	.otg_reset_sspi = false,
>> +	.ops = &tegra234_ops,
>> +	.mbox = {
>> +		.cmd = XUSB_BAR2_ARU_MBOX_CMD,
>> +		.data_in = XUSB_BAR2_ARU_MBOX_DATA_IN,
>> +		.data_out = XUSB_BAR2_ARU_MBOX_DATA_OUT,
>> +		.owner = XUSB_BAR2_ARU_MBOX_OWNER,
>> +		.smi_intr = XUSB_BAR2_ARU_SMI_INTR,
>> +	},
>> +	.lpm_support = true,
>> +	.has_bar2 = true,
>> +	.has_ifr = true,
>> +};
>> +MODULE_FIRMWARE("nvidia/tegra234/xusb.bin");
> 
> Can you prepare a patch to add this firmware to the linux-firmware
> repository? I don't see it there yet.


Actually, we should remove the MODULE_FIRMWARE completely for Tegra234. 
Per the commit message the variable 'has_ifr' is used to indicate if the 
firmware is loaded by calling request_firmware() or via these IFR 
registers. I wonder if we need this 'has_ifr' variable if we should just 
avoid setting the 'firmware' variable for Tegra234 and use this instead 
of the 'has_ifr'?

Jon

-- 
nvpublic
