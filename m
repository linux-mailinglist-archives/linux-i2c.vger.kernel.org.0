Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 563A162F343
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 12:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbiKRLHS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 06:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241962AbiKRLHE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 06:07:04 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C346099EA9;
        Fri, 18 Nov 2022 03:07:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAos0hkLsiUN3nhHwvQdbf0U/lUJUoe2UTrfrhCaQ0BK0JlXnXWBazus3TqbLdA7zj2j0FNxpGdN1qAtFR0qj4FpvVkzAcHxvSYjuJiM7Z0SMJAopUMX8+cNffTyAiMU9QzU/UbqorzwOq2U8tWqWIALyxfRB5zJ0NotRE1Q+VZAioKv/jp7K5eg6Okc5v1yDG/NmEQd1qzv5iYsFiRRHBNO4OYZQEnJYAfpz+e292+SgvSSzslr8IEfwYnRgx+hK+xxF1/woJNYwlDhKChiwY1xO+tBs0QrEYL+hiPyjHmV1nXWlZKzVp2O2m8u1wVPZC2udv3vo9nqELa5liaUKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDT+q8HgiLtn2Y5MWYsWM+JoHGWq04mlJ+A4RezDr+k=;
 b=clboe7tR4N08C2sUsOaydWpUxs/HZqHuywEjweMmSEwZ4LmqnpjyjNkcZII1neu3Xp2/ladciUIje18CrKIQnp98Ju4ra7v1Wb8siEYEkVt1JgLXQVkEoB2xyJPlLH3iZ0QTDU6dK9Yfx0vtqbWYEThFd4+XQfMyOPKjmuRRgbf6dc50F2YrFsGzzwZsCbj9Amcb5JtYxHafjHoP3OyqlyjJXMkaxQUT0XAicaejIjDbsl5Ux9VksZulLiLFMOijxzcKczleAU6PxKsueqxJw8LDSaqHBsDt5H6Wo3/OAg3sdMoSPpXvtLbzcjYmdY3Z7QVDxML6xaKACRo30Us86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDT+q8HgiLtn2Y5MWYsWM+JoHGWq04mlJ+A4RezDr+k=;
 b=ORH9exd3LBdWpp9fLE2Rewkh21SEXLt1YZYa6GMNl1c47mf7HdAYp1KItVlWKtNAEjWf0jZtWyd7GFnoRID9tAV0SVX/xPNvyi7MDnQy36ZL/EACVRi5I9ZZ8sJ7lB+pz0n1R1Cli9BpRMfUIzZ2wskNlaTK3h23z73ziMSDe50Ilv1z2M8wnr7DhTTL24tVHoqESnU5peDKN0Amphfqt48vWAxlEaEZXmgmwIkUHlGn+b1AU3RFkBS8klZVxgPUxEoflfOC2cfVCjVRCYxPrB2j26CiqzUjBJvlnIlAgfGVrttTwCmcTX4yoBrcAWhl42iSzbH7lfNi181oBGT6yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BL1PR12MB5351.namprd12.prod.outlook.com (2603:10b6:208:317::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 11:07:00 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 11:07:00 +0000
Message-ID: <1edbceed-e5a1-460e-25a7-08f299e11c35@nvidia.com>
Date:   Fri, 18 Nov 2022 11:06:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] i2c: tegra: Set ACPI node as primary fwnode
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        digetx@gmail.com, ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, wsa@kernel.org,
        Zubair Waheed <zwaheed@nvidia.com>
References: <20221117100415.20457-1-akhilrajeev@nvidia.com>
 <29db0e24-4f7c-e3dc-91ce-2decf6a253a5@nvidia.com> <Y3dcDCgC42QcMX3k@orome>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y3dcDCgC42QcMX3k@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0266.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::8) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BL1PR12MB5351:EE_
X-MS-Office365-Filtering-Correlation-Id: ff54fdda-c922-4702-f1f1-08dac95502f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KwWoR8OQQZnm9wv4MvirI3PvTGW5Kfg/n7fKrMTu8o8wPnX1KWPU8baUFDuSL8jAsou0Zqm4zyBQP+k4EImI+UQ/K5WV/0PCTbFwzlAC5nCENTPDRfNGhvL7NRlh3HCfIAC/WMTtZrXJ44yIAtv1aiOcTXg3Zv2GNH2wzZ+q6PwGNH3VnCvJyAa8KJikz3vB3uF96HWqVsYQaJ1wmj3w88mOW6OVHKonTyn98JNZSbQm8W8MRU1A2D7m6E+VVudgZpLwijemn1gnN4SPdglWatJpPoOG9K8uHscJJsl2K3ymPOl4xRU/o9AGP0D+f7ywCCRh96POz66u0/n9tjW+tjEYxmR7WgCM6nsmFDErYZ8/mGBPN++1G0dPk8Ik9tgZZ5AHM8IZ1h6836gajqRCXTSY9xWsGxZdepIB/3H+cgebGCfkBQCcfmJVUMQJPGixfXFeVYilzknURp3MSvB36h3uDNLIEm6OCJIi/IoovWAb78Tc4jck1MqlictgEi5KqZOQX7MRb8YqnaMvLCI9P4JLfFACjbPyZZ01INEpoPPTq5C2oKmqPGs0UD6KxY/i/IPCkuz/gS19plHyKZs3u1GLii/J27jrQ+6aavPoWSpunH2i080Sj7MqM7ybnSsb2Mjmx2bL6SvKxXpURRYUrkOgKZjpRo8VWqUWTUPhJAQ+gIDskkRO9+A7sU25kqI/lK33lUKqxY0qx9zznh8Dcn1UjOVqVfp+a+D2KrximVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199015)(6506007)(54906003)(478600001)(6486002)(316002)(6666004)(6512007)(66946007)(53546011)(6916009)(107886003)(31686004)(41300700001)(66476007)(4326008)(66556008)(8676002)(8936002)(2616005)(5660300002)(186003)(2906002)(83380400001)(38100700002)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkFWWlVwSFRHSVVOdXE5M1dVb2UxaE9RTjQxcmorU0xjdit1ckF2MmE5NlNO?=
 =?utf-8?B?dXRHMUEzQTVZamZVTExCTjlaQW8zUGlwYlNOWDdUcXNyQk0rbEt1bFR1bGZi?=
 =?utf-8?B?RFhGMFlZRExLck8rZFYvVHVjRVdFQWdYZ21ITTgvOFl0akRiZlN3eXlSRWdR?=
 =?utf-8?B?SDFTQTBYMnNVUXcvNWZSWFJ5Rk5MN2tkWHJhdVpJZDhhSHB5R1BNQWJJSkQr?=
 =?utf-8?B?cUcxcTcwN0dqOTNLZjRkYjZ5aEdiM1NueXVpS0hmVjUxRHd4NEthODdzVnhu?=
 =?utf-8?B?RzY2TGtXMEsvTUxDeXIrbDZFb1Q0ZFBrZngyT0dBbnlTSGNHSVB0K1NpQjhS?=
 =?utf-8?B?cVh2cVdiR2RIeDZFSGRrQjZuWjg2bUY2NEFHTHlLZUxheXNqY0tuN0FFa0lL?=
 =?utf-8?B?azNjMlVpdXRaNCs0M3JFazk2ZzQ1NVVEdlBpQmVvQmoweDN1bkhYTThDQ3B1?=
 =?utf-8?B?S2VpNnFWVzJzVnBqVk1EQkNoOEROdzdBcUtNUVZmSDdUOHhTWHA1MXZMTktI?=
 =?utf-8?B?dnB0MGlnSkwvZ1hLN0o5cVJXeWgwZEE3STNzWkt4RVBKWFRiVkpuSjVyc2xP?=
 =?utf-8?B?STYrU0xkeFpPL0ZUVjBrc1IyZWVwVGxoa250SzlNSzZUWExPY0x2a2NySGU0?=
 =?utf-8?B?Z0l2ZUE0MTdQQWhrSm05Y1N1QkROQ2xKM0xzeFNseTVvd1R3SklBaEhJRnBC?=
 =?utf-8?B?bitjdGJCYXRDNlhaZEdwSm9HMnNwcVlDalNNR3FSczhJczEvbFhFY0hWZm5j?=
 =?utf-8?B?VDR5VHl2SWZMRGtEUkliVzVYMnNVbzZPZmdqT1NGdUtQV0FHUndnblNXZlN5?=
 =?utf-8?B?NG83V3BuMHN6bnZCWjBIbzA1YWhDclR3dmlObEVWZlNFdkNwL3lyR1JPMzNs?=
 =?utf-8?B?T00xbUdYdGFqZHhxN0l0bWp1cHZhamZNN1VCckVZUTJWTFl3SzUzSXZWaGNY?=
 =?utf-8?B?eEdsSUdPc3hjbXpXZFZUbDA0dTZvVE1ORlN3NDlhazhlZ1JoeVR6LzVGd1J5?=
 =?utf-8?B?UGcrUktSZzVxcDlKckNpWjNyeHlxZmh1WStIczQ4c1Jsa3FmYUpnWkRPZmNH?=
 =?utf-8?B?akM3SmN2QkJ4UjBnS3hFemRpeW9oUks1bXNoSkxCUW80ZGV0eDRZS1dxSHdh?=
 =?utf-8?B?eG9yWmIzdVlUeVZ2Snl5cGtLUnRVZWpqdkJQejNZbW02SEpRYlZpTFJiODk0?=
 =?utf-8?B?dlR4RElZNXRrYTZ6bmhzQjFiQnBQbkRCVHpHaUhreS80aUdnaTV6N3g5UndR?=
 =?utf-8?B?ajVMbElXcmRCTmVNUkRsem5vSExubkJkOERLY0NFVWt1NlladzlEMktmdlV2?=
 =?utf-8?B?VHNFR2VOcjRrb0ptejIzOURFa1RuTUFaZ0ZscmhFNDdSeHJ5N2wza21RYXdN?=
 =?utf-8?B?SlljWjBRdmpTNFUxNldRMmZ6bytQWExZQmtIY2xHS28xU0tPMnlHc3pBWklt?=
 =?utf-8?B?dGJncHRQMElaSlcwZ0J3UWhEcGtldGFOaWNtaXhqMU1weVp2V0dhZVBBbG9O?=
 =?utf-8?B?bk9uMllXSGpOVm9PWVNPVm03VXJQNWZHVDRGdGhJY1pHbDN0ODhZUUZZNXdn?=
 =?utf-8?B?SGp1a1dKeW9DNkg3dU9udUJWaDdHK3pGTGVzSFU0TFIxL20xV0xvQ0prWHBM?=
 =?utf-8?B?WmRjaktJZEgwcGVOYktHVmg2VlUzK2VhOGcyRXAvMjJwcUxSTThzaWlVaUli?=
 =?utf-8?B?TDRHdnRlaEU1SnB1WTV1NXgzWStTSy83K2Q5TEdweFoyU3A2WFEzUHFZeTZR?=
 =?utf-8?B?Y1dBV3d0ckRFT1pJR3AvZlZFSFBkOXJEb2tWWS80OUI2RzBDdzNoREFQaWZM?=
 =?utf-8?B?OHV6S2o5WUZyUUpRYTBSdTVmU2tpSDMzSjJKUmhPVEgvR1RxOHFkajdFdHY4?=
 =?utf-8?B?ZVNvcElJWDNNTThtUm93NS83Wnp6NzYyNkdlekJNOU15ZklENEV3WkR5c25y?=
 =?utf-8?B?NU5PUWF5QUxhZzY0ZFRqekRkd3E2b0tWTHUrMmdWOTF5UU1xZ3owTk1DdHV2?=
 =?utf-8?B?aWNWOENLNWlnWlJaY1Vxa21UcDRkZE51eUxiVlU3alJNVlMwNDFGcForVjUv?=
 =?utf-8?B?RFE3OVpybVdISmNDOWkvMmRhSDFaYnRqVlNFYzlWRE56eDRpemQ0bjNXZ0NS?=
 =?utf-8?B?N2Ywc21vTStBcjdJWHlsVnBpdXh0dnY4V3hqSHZsTW9WUUNDVjZWbm5QdXRi?=
 =?utf-8?Q?ti52N+jnpt5lkdt5uucTGkb+pR4CAm60134P4Ml7Xz3A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff54fdda-c922-4702-f1f1-08dac95502f5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 11:06:59.9182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CR09C8ltkw0CV6HOxRgccTatsPOFYWyFDvLUKHuJwr60TKXDSH6OtdpMZZLW10FqwWyIxVqKSlFeshwzkXC6XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5351
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 18/11/2022 10:18, Thierry Reding wrote:
> On Fri, Nov 18, 2022 at 09:38:52AM +0000, Jon Hunter wrote:
>>
>> On 17/11/2022 10:04, Akhil R wrote:
>>> Set ACPI node as the primary fwnode of I2C adapter to allow
>>> enumeration of child devices from the ACPI table
>>>
>>> Signed-off-by: Zubair Waheed <zwaheed@nvidia.com>
>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>> ---
>>>    drivers/i2c/busses/i2c-tegra.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>> index 954022c04cc4..69c9ae161bbe 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -1826,6 +1826,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>>>    	i2c_dev->adapter.class = I2C_CLASS_DEPRECATED;
>>>    	i2c_dev->adapter.algo = &tegra_i2c_algo;
>>>    	i2c_dev->adapter.nr = pdev->id;
>>> +	ACPI_COMPANION_SET(&i2c_dev->adapter.dev, ACPI_COMPANION(&pdev->dev));
>>>    	if (i2c_dev->hw->supports_bus_clear)
>>>    		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
>>
>>
>> Do we always want to set as the primary fwnode even when booting with
>> device-tree? I some other drivers do, but I also see some others ...
>>
>>   if (has_acpi_companion(dev))
>>          ACPI_COMPANION_SET(&i2c_dev->adapter.dev,
>>                             ACPI_COMPANION(&pdev->dev));
>>
>> It would be nice to know why it is OK to always do this even for device-tree
>> because it is not clear to me.
> 
> ACPI_COMPANION() returns NULL if there is no ACPI companion, which will
> cause ACPI_COMPANION_SET() to set the primary fwnode to NULL. If I read
> the code for set_primary_fwnode() correctly, that's essentially a no-op
> for DT devices.

Yes it does, but doesn't it is not clear to me if it is a good idea to 
pass NULL to set_primary_fwnode(). It does seem to handle this but my 
biggest gripe is the lack of explanation in the commit message why this 
is OK.

Jon

-- 
nvpublic
