Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE815782D3
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jul 2022 14:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbiGRMzE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jul 2022 08:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbiGRMzD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jul 2022 08:55:03 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF4E2ACB
        for <linux-i2c@vger.kernel.org>; Mon, 18 Jul 2022 05:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhzejwaRPJSk1kJEJSASHmoayWNB5wWoFwuNUsC9yQum6H2kmN8kfW20vTimD+16RbXUoYy4PRUNscffx6Q1dw0VBuQ56UrXnTFpiyRqRjERyJla97tABPNbzKBBi8WZ/skzBs0zNp04dLR4JgjhpfIXvkh/WFv6zyEWqEFSHz7JgSlnRKPNcYGt9bpgrKHbzlbvj9fk916RSIgc0AI4QfV1iEpdgqE+dXB5ObRdJ0WSk2mkAlNLOSNkdytcEpLQIvSjz3phV8zshJw5FLGsuskJ0TsICBLSOyBAN+isnuM/T1SnID+eR0Kq+AAJW94dEu/oT2H0XDsT1IniBupQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79K0oVx28fPI/hTyeZsccmhgpRPsjeqfLRnhqNUz6OY=;
 b=SVa2Wy9mtW5nWny514AYUCgnYfCcBjR4GoREVlju/zt+XZ9BEcFehM+18V8y1bioprFzGeH/Gec8k5v7GWH0tmTclyZHZwkM1s7rqUfBUILiMu7iixjV/wlLB5RAS/BKu6HMFvDS+Hig2Cc2o/k4znvH15dLNWYsnW+DknMNddP4SMNzRsgauimEz6N7B9I2u6btKkATQex5/tOirH4iraPIImQicEBcSjejlTb4NqaXmY4J4znPltZ2e9Vb/eyDLh2e3hryjdehXRnasODpEE5rfZBvrDKeeFkrnGt+gpPOTwp4QFtuUHJH96DgCWyHnSw9bw5FYmtGQgCa9OINtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=metafoo.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79K0oVx28fPI/hTyeZsccmhgpRPsjeqfLRnhqNUz6OY=;
 b=QZuGRFxxWzPxN0FR/i5XtxMNV2aib3vd6BqT+/S11waM3ZUPPszzOVjIKnqa9bDFb/X9dGtA8vTeAfgH2+rlNyU3hUh7GP36XZzlWmAhJCyZb3QqPxC6VpwJE1BsptCyNdMy6PMHrmfGcPM73+mhjYaE7F6HaJXcd+7Iplw/v5s=
Received: from BN0PR04CA0082.namprd04.prod.outlook.com (2603:10b6:408:ea::27)
 by SN6PR12MB2685.namprd12.prod.outlook.com (2603:10b6:805:67::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 12:54:57 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::65) by BN0PR04CA0082.outlook.office365.com
 (2603:10b6:408:ea::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.22 via Frontend
 Transport; Mon, 18 Jul 2022 12:54:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 12:54:57 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 18 Jul
 2022 07:54:54 -0500
Message-ID: <51fcbbf2-c490-4b2b-fde5-df1dfce7e677@amd.com>
Date:   Mon, 18 Jul 2022 14:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] i2c: cadence: Support PEC for SMBus block read
Content-Language: en-US
To:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Wolfram Sang <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        git <git@xilinx.com>
References: <20220717145244.652278-1-lars@metafoo.de>
 <768b56a8-df1c-e24d-7879-328512598549@amd.com>
 <BY5PR12MB4902D36D299948DE036AC0BF818C9@BY5PR12MB4902.namprd12.prod.outlook.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <BY5PR12MB4902D36D299948DE036AC0BF818C9@BY5PR12MB4902.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0adbb1df-efbf-47e4-a206-08da68bcb7c5
X-MS-TrafficTypeDiagnostic: SN6PR12MB2685:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IBJu7ZjfPYD0uXa8pglAcUC/HveNMyEScta0QfmcchYlC/HYEwBIZw98eJ9dSEcmaZfq2SQB0vwK9An3F7VZFK6KoaV8SL8T0uXTi3jF9xoodBmUUFGkxAbuMBLmHXT4MgP1nFFFr393tlXBbf1qexaxEDKzYWpjt5GQENtsFr+ZepJw5tJIyjZuDygVVCbaBdviaXC2MspE1fn6UYeHCCCVyRyGLXimwUOUM5//0Ga84WddxRW1bGidapzFr+SEWU6uDbpe9f8gNpoIgbL4ZfYfdIAsWZXcBRXH3bh9GR7UWggEF4RJpnKd/N2vXMHs0z8RGO2ne9mwod7RtAN7sYZf1x58d3vcdTf6iaJzWxlUZ3qTgxJN8qntA3AtmFM6nCHkUfLzuKhPC3LsBMhy0PrZQnlYPKKOaPd/ibfolYM6EWX2nJC+MNMHy6Z73taPml1CmaEqyBHAx4iogmbGuVqeirGyFyr3F4ppiyUGS+zm8LhZEQsVLHrePgv4dyjEbfvw7ky1uq93++2imVRJbPP1XNfz8vWgwmYMJootNg3Z+2FufDWGZhuhDjqFn80J8SFC9jgOy46oGTJC82yofuvtd1u7HdQPniuVi974uOFuo8r4GWQGRHvGX9ae6TuHRgXDJ5fpnwYi2+Pu9zZHBlyj6YXpjV/GpbWcS7PD6ZfU35HcQxDQYNJ/vfb+JiMATaDH3isytSseidyM6I7nwwoLnGSAENpviQqH3+qqk+kCOzT2lpJ9wn5GQekskAV3TKziAsdLf3uTtTNmluY6cLzaaTyytAimMSZy3v2OJo00EhwrrqkY+jFookJ8TBkCBB/yu0BtUadTDtG34pdSA348txw1mbne2qzrmaIQGN65sPKPH/3jOvK/Fm7GdKVJ
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966006)(40470700004)(36840700001)(356005)(36756003)(82740400003)(36860700001)(31686004)(186003)(2616005)(426003)(70586007)(70206006)(81166007)(16526019)(86362001)(31696002)(107886003)(83380400001)(40460700003)(47076005)(336012)(53546011)(44832011)(478600001)(2906002)(110136005)(54906003)(41300700001)(6666004)(26005)(8936002)(316002)(4326008)(8676002)(5660300002)(82310400005)(40480700001)(16576012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 12:54:57.1732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0adbb1df-efbf-47e4-a206-08da68bcb7c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2685
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/18/22 14:37, Datta, Shubhrajyoti wrote:
> [AMD Official Use Only - General]
> 
> 
> 
>> -----Original Message-----
>> From: Simek, Michal <michal.simek@amd.com>
>> Sent: Monday, July 18, 2022 2:56 PM
>> To: Lars-Peter Clausen <lars@metafoo.de>; Wolfram Sang
>> <wsa@kernel.org>; Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>
>> Cc: linux-i2c@vger.kernel.org; git <git@xilinx.com>
>> Subject: Re: [PATCH] i2c: cadence: Support PEC for SMBus block read
>>
>>
>>
>> On 7/17/22 16:52, Lars-Peter Clausen wrote:
>>> SMBus packet error checking (PEC) is implemented by appending one
>>> additional byte of checksum data at the end of the message. This
>>> provides additional protection and allows to detect data corruption on the
>> I2C bus.
>>>
>>> SMBus block reads support variable length reads. The first byte in the
>>> read message is the number of available data bytes.
>>>
>>> The combination of PEC and block read is currently not supported by
>>> the Cadence I2C driver.
>>>    * When PEC is enabled the maximum transfer length for block reads
>>>      increases from 33 to 34 bytes.
>>>    * The I2C core smbus emulation layer relies on the driver updating the
>>>      `i2c_msg` `len` field with the number of received bytes. The updated
>>>      length is used when checking the PEC.
>>>
>>> Add support to the Cadence I2C driver for handling SMBus block reads
>>> with PEC. To determine the maximum transfer length uses the initial
>>> `len` value of the `i2c_msg`. When PEC is enabled this will be 2, when
>>> it is disabled it will be 1.
>>>
>>> Once a read transfer is done also increment the `len` field by the
>>> amount of received data bytes.
>>>
>>> This change has been tested with a UCM90320 PMBus power monitor,
>> which
>>> requires block reads to access certain data fields, but also has PEC
>>> enabled by default.
>>>
>>> Fixes: df8eb5691c48 ("i2c: Add driver for Cadence I2C controller")
>>
>> Subject is saying that you adding support for PEC and here you are saying
>> that it is fixing initial commit.
>>
>> If this is adding new support I think Fixes tag shouldn't be here.
>>
>> If it is fixing issue subject should be updated and this Fixes tag kept here.
>>
>> The rest looks good to me.
>>
>> Shubhrajyoti: Can you please test?
> 
> I have tested the reads and write smbus  without packet error check.

Can you please switch it to formal Tested-by: tag?

M
