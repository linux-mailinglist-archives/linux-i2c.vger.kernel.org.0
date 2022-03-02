Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 254254CA90D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 16:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243455AbiCBPaP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 10:30:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243436AbiCBPaO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 10:30:14 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F8D21E1A
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 07:29:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbgcHN+msL14eqfNKonIPPPVpcuz7f1YpPDD8omWmWarSuHsoIGxE3s9Euc5P4hGCsCrp+UkQbvEu1MZ8jirSrnVrlT8Ko0BIybKaO7qLbNzTsactxz+Sq4AjoEuSEfM+6VUfHL9Bxw4fW/8oJn1UItR0UETxKqvWcIpzgkC2Rag8ZRMpsYyj3sQr/GOcYL7FJybWoPUp6j/H7n+L3sSu+saXFdPHvbtQ5ha6mKOrGNjBASkxVTnquUFyx+7JUv/IFkTYeAUnW+H+zVQPdzr6Fdfw1CsMAN292PGxpnDUI4k/JFndmbaBnEy6xbaNnyiN5WHO8AY12e6PaHAl5GEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGJJWImiPWLkjdleaBZZgmkEBSBu5EL/qnhE3U1iapg=;
 b=fe8HnVZ73pyyTpJtGQYSpWpvW6er3uLuuEDhoV76+VGFy1D3Ig/+3e3CnBV0KBb0XHPo6wUGbCmmyENpCVThwCBPKCvTauXqDDAhF3NkE0Z7a4ZN5BtvK2BfvKN8JLs6onfG5rsRo3Nn3Rgr+woDhRX3k9tMY6XI9wbr8BzxRLWusacdt7f5laQDoGwAwk/HP2SfC0iqZ5v1szz6Y1hvEytGo4mh7+JZG7gIlcgk/pW3IcLQ5P1KEXcqNvhJw8IY0I9Tj7OPPiSeEQclyAWd88iQag9dm1OVm+lffeA5hLW/IGE+eRf6hpAI9vk6KfXi5cmOJfdwuLD5jpCQyKY4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGJJWImiPWLkjdleaBZZgmkEBSBu5EL/qnhE3U1iapg=;
 b=R2/xRJvDqgnXnxsOomPJ40UHEkOzE/nSLBbODp75i8j46G5XCjafri4yeB+zrfXBm3WoiSfkGyO6ZxtMbMXC84OQDiptRurh9ka7Kfp16t4JRZn+p3kWzhboA4YQTaPKZsikYBkmGXbJlTG9d5lGD17kVhOWmYfNZpy9BHR2DOg=
Received: from BN0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:408:e6::28)
 by CO6PR02MB7508.namprd02.prod.outlook.com (2603:10b6:303:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 15:29:27 +0000
Received: from BN1NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::25) by BN0PR03CA0023.outlook.office365.com
 (2603:10b6:408:e6::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Wed, 2 Mar 2022 15:29:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT022.mail.protection.outlook.com (10.13.2.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Wed, 2 Mar 2022 15:29:27 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 2 Mar 2022 07:29:26 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 2 Mar 2022 07:29:26 -0800
Envelope-to: wsa@kernel.org,
 robert.hancock@calian.com,
 linux-i2c@vger.kernel.org,
 ben-linux@fluff.org,
 richard.rojfors@pelagicore.com,
 linux-arm-kernel@lists.infradead.org
Received: from [10.254.241.50] (port=55134)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nPQus-000EYX-2t; Wed, 02 Mar 2022 07:29:26 -0800
Message-ID: <77a3ee4d-8452-26b5-d9d3-9376f17e558d@xilinx.com>
Date:   Wed, 2 Mar 2022 16:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] i2c: xiic: Make bus names unique
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Robert Hancock <robert.hancock@calian.com>,
        <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>,
        <ben-linux@fluff.org>, <richard.rojfors@pelagicore.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20220127175013.3689724-1-robert.hancock@calian.com>
 <Yh6TjgPxGUG6U3dg@ninjato>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <Yh6TjgPxGUG6U3dg@ninjato>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3df3a574-37e5-4f5a-d0df-08d9fc61702d
X-MS-TrafficTypeDiagnostic: CO6PR02MB7508:EE_
X-Microsoft-Antispam-PRVS: <CO6PR02MB7508B3DED89649B46CE9CCD8C6039@CO6PR02MB7508.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wys9a/Cs/q2ZsffSSyuOb4SXgEdC0bNlBKefkVV06PIERGC1ccijpEyyJ6WSbDD/C6M+51xCxTpav9LAv/tFlmyeBgmzH0MQ/WLZbw/g4RZcnitYKjEO0LJnI7mhjT9ef6Q6T2SCxf7af/HOof2dmA4KpCm2bAbYO3UkX8e7vXX8fSC7sazHd0lkdamPT7iGoSzfPyu5Q0yi7sK1kyEhh4eihHbJFiRY+AzldhVxjCn4+AzrfYhgoVPB5ZS2G6fHVDJTbE7y987aR+2MEKzWYJlOAEBMBxERWT1xTO+4B59XcaaiZsyemoNGX1nJpI8HVwxmzMd4qJqkVFibhWYicfFikBjcHU75ygmT7xtFhp+04y2R3abnoX2ruokZ5lrYoWCWstp5ZNo6Y7ajyU7/NbGk9tg3erptDYEXCeneSucg4afQCP+qlBgn2QSagRPx9iva4by7G0BpCMJPdnpz7iKKcH2ky6PmA9LLhs0bXsQOVNynqlX0rcinEirXJmvkgSr/Y1xhzTqtyGY/TZUC7RHZt1y6Uje4c88ABw52MwPFAmbOUxeNPvwcaJ7lYw4WpM7ugInb4pJ487ZaZc/4lqPn/PSOzNn1r8+m/cXN0JANrqs/vKQVkjVJrgJskd5pcYUtBotFPpjiNNvIA5zqXoJZ1L9wQSlw5l5ui1M/q1jSiGNzN2G1GcAx5mfze0wl1B7n3+w57p7ilGAs+hQIuot6J5Hr0qvLpi9wLHFkusk=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(82310400004)(36860700001)(7636003)(356005)(47076005)(40460700003)(8676002)(36756003)(70586007)(70206006)(5660300002)(316002)(110136005)(31686004)(4744005)(44832011)(9786002)(2906002)(8936002)(186003)(2616005)(426003)(336012)(26005)(53546011)(31696002)(508600001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 15:29:27.2307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df3a574-37e5-4f5a-d0df-08d9fc61702d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7508
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 3/1/22 22:43, Wolfram Sang wrote:
> On Thu, Jan 27, 2022 at 11:50:13AM -0600, Robert Hancock wrote:
>> This driver is for an FPGA logic core, so there can be arbitrarily many
>> instances of the bus on a given system. Previously all of the I2C bus
>> names were "xiic-i2c" which caused issues with lm_sensors when trying to
>> map human-readable names to sensor inputs because it could not properly
>> distinguish the busses, for example. Append the platform device name to
>> the I2C bus name so it is unique between different instances.
>>
>> Fixes: e1d5b6598cdc ("i2c: Add support for Xilinx XPS IIC Bus Interface")
>> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> 
> Michal, is this okay with you?
> 

Origin state

~# cat /sys/class/i2c-adapter/i2c-0/name
xiic-i2c

new state.

~# cat /sys/class/i2c-adapter/i2c-0/name
xiic-i2c 40800000.i2c

I am fine with it.

Tested-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
