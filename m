Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C76A46A3FAB
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Feb 2023 11:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjB0KsC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 05:48:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjB0KsC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 05:48:02 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4257869B
        for <linux-i2c@vger.kernel.org>; Mon, 27 Feb 2023 02:48:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P98auleKp2+ymnePVaaEQZnWEMvFZk9mvUxczXEofHZwQpFbDHk1WpL1N+PhtGdsMUWTqWEVjhCH5cjnVwAtvzuDxWBnXZjmhQI4oOqTlEYfOZ73Dsxyu0HOVK0GpjcBgPDmtpnLFkf3+NDsuw6WwIsdKZquMaj4ZSxfUb4qnFC3d4v8w+tfKdGaMgkYHQh3jLMpDyrNm+1dG2K8YW39C7m3bbX7U5j5rEfiKmEOU7H3cduwWWWqHISunKFYm2j52GyoGrZqAGV/SQu3pPHrJh+HnerZc3yMSM0m+xNDke2nPgIA9JDmhePQuAQUH6V2QHn8sljGXN7CndKlxMdt6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyiWA8TDiuM/H11oRFXQWcE4bqIkpysTSO6sIgrhGVg=;
 b=UvpEEV6ha8gjUUX2WcRY8md4NmK24D6Y6fogQ9TI1deb0Q6tPZjUQE4FlSQcVB1BqLm8GOd8ePhM28UlrtMQRr/a5HETHrgjiOr2f1YuRXOBTKGgKFxhX1HfM9/31RvMJV8wwuXhbpyV3dLAxurmAC5SWigWvBYIaf51QwQ0DQqx4M9gw8esfQbfCy5Ah1nM+BK/Jbi6PJ3keT8djBk0QYHWaHgioXLHrQoBtaU7HsgkJ8PyAEio/13qojqHGVSG/2rTLyUkbq7Jv4ULT16GCLGkjSqIyLhhwIyC2BLfWzuylv6F+ArYHncl9e8y+DUWJMMxP8ZQ+fOWHGCB566IuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=metafoo.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyiWA8TDiuM/H11oRFXQWcE4bqIkpysTSO6sIgrhGVg=;
 b=u930uNeQUvgHDEOMtRWnq1QxvInGogaV7Z8eC0fOT0ce5DeqX7gSUnDdIJXsZ4Y1GUvtHZfJsw6t3bLQk6y8NatdGATomPXGzEW/Zt16v1Qs7p0llwIPcT9yJFNfnus7IIkhAetdrVhx3ZO498HidFmZ2bTB0LehQwEW0BKCg+k=
Received: from CY8PR11CA0043.namprd11.prod.outlook.com (2603:10b6:930:4a::18)
 by CY8PR12MB7754.namprd12.prod.outlook.com (2603:10b6:930:86::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 10:47:58 +0000
Received: from CY4PEPF0000C982.namprd02.prod.outlook.com
 (2603:10b6:930:4a:cafe::c3) by CY8PR11CA0043.outlook.office365.com
 (2603:10b6:930:4a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29 via Frontend
 Transport; Mon, 27 Feb 2023 10:47:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C982.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.12 via Frontend Transport; Mon, 27 Feb 2023 10:47:58 +0000
Received: from [10.254.241.51] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Feb
 2023 04:47:55 -0600
Message-ID: <59b09614-a4c7-837c-61fd-22db0b13fa67@amd.com>
Date:   Mon, 27 Feb 2023 11:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 5/5] i2c: cadence: Remove unnecessary register reads
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
CC:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        <linux-i2c@vger.kernel.org>
References: <20230107211814.1179438-1-lars@metafoo.de>
 <20230107211814.1179438-6-lars@metafoo.de>
 <1086bd44-fc57-8a68-a418-1154828729b2@amd.com>
 <7fc8ed1d-c28d-1c0b-bce7-de75872f4ea2@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <7fc8ed1d-c28d-1c0b-bce7-de75872f4ea2@metafoo.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C982:EE_|CY8PR12MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc85e2d-780b-4dfd-6261-08db18b0171b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y7LXBad7BSoowlgAv5FWI5yL5JLaGPEVckFLRfgLnTV0upkMGf72y14ab+Qaa0LFBDIMpgZ5WhmwGCTcc8Yx7Sbi99QTzTLMmrq0WgFlEXB8ntUUf0GzWsyN97PQ5C85qiTuhbnM5bdpimz1zfSnB5LaraX5IzYTMEpiI0xNSH9jR+0F7zyhs6Xzl62huOeqYni1tscDoO9mQDoB/BSPOFiS0jCTQ/STKu2zc0kdY65FHcLxHUEaJtKd/uSXEx0wC0g8ST+n/RFBXnzU/T0l55a1T4pdgyC4ZjYTRLhuRnwx1eAoL0ZKi63EbeXsMmbhOS8qDFMGV8I7a2mc0gmsXTQhG3Rr/kgUTkfOeZDJf6c0oQNXQwZB/Cn/Tmy8ON76L0PsCUS93gcxxTubYarwrnwydXizmbyC6aDbykTZXRah255edvM8mRuQZi2vOb+TZ11Xgzfwo7JdgAuFLDOHmG38Y0XROuwtsomBoGEoGUt1VafkjXJrDPJge7slcuZXfYFqTRmBjZlCmxq4cNB0kvWZzDjIy8cvgQg57ns/bKxDXwKuLOoMcHuERWxB5ldppCMzWbvDfScoqAVFAXalyZGV2lQLuJLyffYQ+ZTqsYHQajkt7ZfxMbIXbOFnMvZbasMVHDF717uS/PtJvlq5l4BGK0xg3d963EmuyU7BL5QP2i7bkrq7ayAfa0cFXx9qEkNfE87sH23PxPwSlUc3dRpupc0c2bjZI3ZwD9zlKLlwfIQxTEHxLcG9Rv7/aDm3H9IyMOd4GC0nCGuzAU879g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(110136005)(81166007)(54906003)(8936002)(16576012)(316002)(82740400003)(336012)(16526019)(36756003)(8676002)(186003)(26005)(53546011)(478600001)(40460700003)(356005)(44832011)(86362001)(2906002)(31696002)(40480700001)(2616005)(5660300002)(82310400005)(70206006)(70586007)(4326008)(83380400001)(31686004)(426003)(41300700001)(36860700001)(47076005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 10:47:58.2945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc85e2d-780b-4dfd-6261-08db18b0171b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C982.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7754
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/16/23 18:14, Lars-Peter Clausen wrote:
> On 1/16/23 06:58, Michal Simek wrote:
>>
>>
>> On 1/7/23 22:18, Lars-Peter Clausen wrote:
>>>
>>> In the `cdns_i2c_mrecv()` function the CTRL register of the Cadence I2C
>>> controller is written and read back multiple times. The register value does
>>> not change on its own. So it is possible to remember the just written value
>>> instead of reading it back from the hardware.
>>>
>>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>>> ---
>>>   drivers/i2c/busses/i2c-cadence.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
>>> index bec50bfe7aad..93c6d0822468 100644
>>> --- a/drivers/i2c/busses/i2c-cadence.c
>>> +++ b/drivers/i2c/busses/i2c-cadence.c
>>> @@ -613,7 +613,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>>>
>>>          /* Determine hold_clear based on number of bytes to receive and hold 
>>> flag */
>>>          if (!id->bus_hold_flag && id->recv_count <= CDNS_I2C_FIFO_DEPTH) {
>>> -               if (cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & CDNS_I2C_CR_HOLD) {
>>> +               if (ctrl_reg & CDNS_I2C_CR_HOLD) {
>>>                          hold_clear = true;
>>>                          if (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT)
>>>                                  irq_save = true;
>>> @@ -624,7 +624,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>>>          addr &= CDNS_I2C_ADDR_MASK;
>>>
>>>          if (hold_clear) {
>>> -               ctrl_reg = cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & 
>>> ~CDNS_I2C_CR_HOLD;
>>> +               ctrl_reg &= ~CDNS_I2C_CR_HOLD;
>>>                  /*
>>>                   * In case of Xilinx Zynq SOC, clear the HOLD bit before 
>>> transfer size
>>>                   * register reaches '0'. This is an IP bug which causes 
>>> transfer size
>>> -- 
>>> 2.30.2
>>>
>>
>> Logically this is fine but that additional read on CR register ensures that IP 
>> receive previous writes. The code itself is related to bug on Zynq SoC and 
>> that two additional readbacks can actually do something.
>>
>> I think this should be properly tested on zynq to ensure that it doesn't break 
>> anything.
>>
>> Shubhrajyoti: Can you please make sure that it is tested on Zynq?
> Maybe it is better to drop the patch then if it is used to enforce ordering in 
> the hardware. But I guess we should add a comment to explain this.

Mani has tested it and he can't see any issue that's why I am fine both ways.

Thanks,
Michal
