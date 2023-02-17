Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3CD69A831
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 10:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjBQJe4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 04:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbjBQJex (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 04:34:53 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B784B507;
        Fri, 17 Feb 2023 01:34:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBSatMiL1B38BKgnLKLTkwOoqqA3jPscb0giXLAeRQa5vMm3IxlzQecaIFyDq9JPLTL3HD8/8nh21Z//vRimog1cGU5LLBdAglk8N24DJTo6gDY/R9k9gxCnkQIwf1LufjiJX03Oaz5XG5CXVpFQcTOy3L6PHO7aLP0CsfJalaqbHMoLzj3sc/jlAW5Qo6/4y7ZudGISrt6G7i0ur8ISRFAgF6e+m0d9wwm85MXZuL/c0AkaE6qb5/5+lfaWDyVQS+G8FucXMEhgARvm05VipEu9a/8wfhxboDkvXaWkmtD71RgN0lyG3MZPiIHQctGhW4/jkHqymbzElJmraIcZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElGoSWJlFqF/9Q6ZF8MG9FHIibUHrBQ0PPuvawn4h30=;
 b=GWv8VVDYRWFvgz+O8GjySePIUP4Q5ot25OzxkOJUs9/daJCDq4YcP9XpGkirUABgQuzdJLOsoHfkItfV8N/WwsCUc0JM/uaB7RIP5TlgrxFcpeUFa6KwxKx5AdPQDbF4jLFxI0pYZa3EdOXLQY03Fo95vfXqsYdOfeQsG/ejyMNIgG3a8IwYenDHODr2Sf1Vk1vp1VUpEQWhHPUMKUGaKy5nwCUNGNK3Np68poDzuhx+k8O12CYDiYaA6PdBXiysQJEiWu/kaecJZxnzCZBZHtyQ1uj1uJSVObgATRU5cE4GTqhjOOKld9HKhgjW5lbnYzUEI5IytIfUWpdfMChGhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=metafoo.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElGoSWJlFqF/9Q6ZF8MG9FHIibUHrBQ0PPuvawn4h30=;
 b=H8DsMH4cBNKmGh/bJgWWBRFmUTHSb47IaUSoCzgHz+tFTOzfq5tR51vML8TpMjZgRqhXtRa8EFAknsF7B9HDaKD6gulECbVNn9r1/0jL8Uku5x9YdepanXvwEW4V/LiqZJqd5SC7nJc2i3DvYKRw/N8+3odeRlaDqB9OvIp5IEo=
Received: from MW4PR04CA0380.namprd04.prod.outlook.com (2603:10b6:303:81::25)
 by SA1PR12MB8600.namprd12.prod.outlook.com (2603:10b6:806:257::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 09:34:46 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::4b) by MW4PR04CA0380.outlook.office365.com
 (2603:10b6:303:81::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Fri, 17 Feb 2023 09:34:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.13 via Frontend Transport; Fri, 17 Feb 2023 09:34:45 +0000
Received: from [10.254.241.51] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 Feb
 2023 03:34:42 -0600
Message-ID: <08839e77-5b0f-db13-ac7f-c9addc73b7a3@amd.com>
Date:   Fri, 17 Feb 2023 10:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/2] i2c: cadence: Allow to specify the FIFO depth and
 maximum transfer length
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
CC:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20230205230208.58355-1-lars@metafoo.de>
 <813224a5-54c9-f6f1-4288-703a6388dab6@amd.com>
 <c26a994e-a004-8706-eb82-ce89b6cbbeb0@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <c26a994e-a004-8706-eb82-ce89b6cbbeb0@metafoo.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|SA1PR12MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f01054-8e88-4421-688b-08db10ca3499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EcS4mJoyrd2n7o8JwFpPNHEtRlnxbZPZcfWGp6ccJz7zGW/ph6R67yPwji+1YNxo2Dnq/mRFVbACNfSmlZREH8WkolFK3p2ZjpfsBKUYsXZqCVh5Ij9iMgeB6z/o1YKqnukLXHIi1rb1XZzGX2pCGuk/hmBKeudZ4VrhLpcSPMCZz49/sVdG93GtnATuOTWbEWvn0k9FgSJMkOSeo5oYQBGjFyZ+bHIhWIqTRsNRcimUpX9DUYRXpaTF0qkul7OQDULWbPzb9F9SoiqGnlaaQZBzUrI60KZyR5jJkxRGPVElTYdSdcSuWvNwa+iJqEJlSmDtCDy1UPmw2/r5wuZUfzvw5QKWY76vECl3SrUvbhBx5g+kPed1u5cygw8PekYjSVeNwESkSTawKmpeZBzpielAQDIL7/OHoG0OCxhlp30xRr96gb5ACzWh6Y4dkf8Sqxd5FeN6hQHs0iwnJmUQXkiWT+a21UxVt/beO/4DhLIQU7jKIATscTcuvhVKDGUGsRE01vdBWle5JIDPqlZ8TzKfhlZs3s7O2PGOM+Kzvmi7oXFSagTONusnxmsuErLId7NG2ZRl9JOS1JyPUFehuFt2Wx0R1gN4oB9Ge2l6kWy09CAkGpWmNlF0R1IPB+9WKexwzihpD9Vv2dijja9vkG6j8eh0AhK2M2p1ni0EcGD3XjNNrCa5sQCEDUB8+VkAxAxRj+W6SDyQlpfm+fSdYppp22/uPFRSego6Mzb7XS62hC1lfrzwoOI32OKojQJlbtyRMiDfmlKREHkF9mIjWw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(2906002)(31686004)(356005)(36860700001)(44832011)(5660300002)(426003)(83380400001)(8936002)(41300700001)(40460700003)(54906003)(16576012)(8676002)(36756003)(4326008)(70206006)(110136005)(316002)(70586007)(336012)(40480700001)(16526019)(86362001)(82740400003)(186003)(478600001)(47076005)(31696002)(82310400005)(2616005)(81166007)(53546011)(26005)(6666004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 09:34:45.3401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f01054-8e88-4421-688b-08db10ca3499
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8600
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2/16/23 15:12, Lars-Peter Clausen wrote:
> On 2/6/23 00:02, Michal Simek wrote:
>>
>>
>> On 2/6/23 00:02, Lars-Peter Clausen wrote:
>>> The FIFO depth and maximum transfer length are Synthesis configuration
>>> parameters of the Cadence I2C IP. Different SoCs will use different values
>>> for these parameters.
>>>
>>> Currently the driver has the FIFO depth hardcoded to 16 and the maximum
>>> transfer length to 255. Trying to use the driver with an IP instance that
>>> uses smaller values for these will work for short transfers. But longer
>>> transfers will fail.
>>>
>>> The maximum transfer length can easily be detected at runtime since the
>>> unused MSBs of the transfer length register are hardwired to 0. Writing
>>> 0xff and then reading back the value will give the maximum transfer length.
>>
>> I think that these are pretty much two patches in one.
>> The first should target transfer length part and second fifo depth part.
> Hm, I'm not sure it is worth separating this out. These two are very tightly 
> related, but I can split it.

thanks

>>
>>>   /**
>>>    * cdns_i2c_probe - Platform registration call
>>>    * @pdev:    Handle to the platform device structure
>>> @@ -1242,6 +1274,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>>>       struct cdns_i2c *id;
>>>       int ret, irq;
>>>       const struct of_device_id *match;
>>> +    u32 val;
>>>         id = devm_kzalloc(&pdev->dev, sizeof(*id), GFP_KERNEL);
>>>       if (!id)
>>> @@ -1317,6 +1350,12 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>>>   #endif
>>>       id->ctrl_reg = CDNS_I2C_CR_ACK_EN | CDNS_I2C_CR_NEA | CDNS_I2C_CR_MS;
>>>   +    val = CDNS_I2C_FIFO_DEPTH_DEFAULT;
>>
>> you can remove val completely.
>> id->fifo_depth = CDNS_I2C_FIFO_DEPTH_DEFAULT;
> But only if I make fifo_depth a u32.

No problem for me.

M
