Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F06B855FEE6
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 13:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232682AbiF2LkH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 07:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233262AbiF2Ljw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 07:39:52 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5C13F88C;
        Wed, 29 Jun 2022 04:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsfzFdRTy6Rhjyxq9/X8t97B46wO553PKl3XWCj9AuwQfjx/8hoJytg6JwWU40r5ECgGphwFW/T6ilc3jRA32zFBDsGy+NHufvG2SkaJvqEAs/S7Y6+aw4I8cyTopEjA6eYlTE0G1cnKadUUbB11pA28ZcpFxHQCyq7/K0oO6TXud25kGx6/NL8Gt/WOqEb5XZM3sWvJPwz4zMJzBQJoc1D7Ob5hMM+zJgfPfCNt+uQ7lexs4kZC5Wgftr+gFB0V8WJOsNiZpGRFnAz7IW6zRDx+g0WJjf0tDggqzYoPzXbNKpQtmVM+s0IwdvPUGVkc3siN+/wgDSxxs5wZqvrmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+RWI71Io5EC9LL2RW5+LRa+ILIbLMliFEHC2BMjJWY=;
 b=LOvtiz19HLBnFl/PQEY7Qw6/VnzbbzCLou/mB3cvPWv8Aw2eOTUsclt2/VT7wMMKMXNYFQezQX7EBWX1FcI074G584AIkeX4KdvDuSateiOXil4dizlD1Im8izLvaAFbggWJTsEmm+ge5fcOPra9bh90DQmt+o7xGC+eQbsPpkdoDXr9wp/BIaNaYNWRUsKJTkG8+/u8qBQS+mdygqRqiCR8i+zUySo/hnaK5jmRrb8XgpWJmx1vHk71wm8MV50PKbbr2LpbafHGmiTvoU2kSswn/xJlKcAJoKUvbdkjrWTCNLeehMPc7FG+lzbnS7D8bUlsFF2Z8ylumogiH9T9Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nokia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+RWI71Io5EC9LL2RW5+LRa+ILIbLMliFEHC2BMjJWY=;
 b=Hfs8B81JHG08dk5/6FN8GtzvSsc8TIzxdJnsTxUz0Sj6cf+qnxAGXQeA78MBaYf59te155uoje8czxMXTPMMPfrIujDQIerQsV+KOl5xX0chd/CL4uC1IZ+Tdpcwtme5DG7hSOgwcejxylkk55wHcHLc8C98ICLYCXvPqZld6v0=
Received: from BN6PR1201CA0011.namprd12.prod.outlook.com
 (2603:10b6:405:4c::21) by MN2PR12MB3358.namprd12.prod.outlook.com
 (2603:10b6:208:d2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 11:39:48 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4c:cafe::ab) by BN6PR1201CA0011.outlook.office365.com
 (2603:10b6:405:4c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Wed, 29 Jun 2022 11:39:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 11:39:48 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 29 Jun
 2022 06:39:15 -0500
Message-ID: <27c88580-51bb-7813-c29f-b8a3faaaa294@amd.com>
Date:   Wed, 29 Jun 2022 13:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/10] i2c: xiic: Add standard mode support for > 255
 byte read transfers
Content-Language: en-US
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
CC:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        <joe@perches.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <20210626102806.15402-3-raviteja.narayanam@xilinx.com>
 <c8d4faf1-5f0c-4adb-e52a-92d46179ffa4@nokia.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <c8d4faf1-5f0c-4adb-e52a-92d46179ffa4@nokia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 313a1bdb-36ed-444d-e730-08da59c4129d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3358:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 90CNg2LiTRRgtpT4NyD+bgKAFj7lo+VEIrcXsuIlu0bHcM/fcwRiHLCgZUYCU5yf7LaSwKKbH3rRF0dwMJbnrAC/Zp2owJf1S8VQj4yZrlPpjzdj6f8miakxfamOAhTxmd5uDeitsfEL0MMnqv4moD10TQ5R+z8n/v+AxZKKVSSywkgMLmGC/cYI8UdKtKObJ55wLlojQtK6YZUL/pKtZdblOm4wSkBc35H2TRmaHMJfg/Ll+EGZXnmE1siCxAXpeTSiEPjU6WDiyk3ABKetlN1uoD9HkrqMYsRjt7k93Pq34xS/OEqLbHaxhdm4W46KmzjtWPMbj8vEdoyZanZjTSlXdtQNrV9/piOemBy/r6GvoUcjX330/fZNUPplKkwPkIylpggCR7xUlfSuodYTjNgxvrBQbSX/V4gjhfZBQPZolGyznAjyzUu5/NOEtbn7I83F9qdSIT6q0OTPkRujT5xCxr5dxVfTE3sfHGQjd9NyotJSJDGMpKazV+8u9iqf6IueHfb/5kFLVNa3OQU3JB0Nt17fpVJnEfWeGOAewLz3SlCYm507GG2Kof4gJgxB4bJIvLy98lGNpzWDHs6JzatfQOG3xb0pImTFW19fjTeAWFK71jKCPcaO5/p/0eFoofuQlH/PYFMQWhpdjGsylR94CE8Q1RLBNlKFLeUSEutq93xM/5841yMeqTFDRj+G2iC3AkE55AoMuJ5yu7hIU/fxrUmDJt5FB4sPt+HRlvYZf8y3d7esohwmS3UZJUKSsp2Y3+eEY+ewdSpnZVZ/tX5pespsD6ySTqa0Xw+1wWlOMPozWnL0stAq0UjQDQod8q1ERIsqI9u7XOioPvabz3T7gQ8ucuvTxjv8o/cBx0preXf77lj9MJxBrGg2/Brwe458Cy8s9caTB2tagfCSZQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(376002)(396003)(40470700004)(46966006)(36840700001)(81166007)(426003)(6666004)(41300700001)(53546011)(356005)(336012)(31696002)(186003)(26005)(16526019)(2616005)(36860700001)(70586007)(47076005)(82740400003)(82310400005)(83380400001)(4744005)(40460700003)(8936002)(16576012)(44832011)(2906002)(31686004)(36756003)(40480700001)(5660300002)(54906003)(4326008)(316002)(110136005)(8676002)(296002)(478600001)(70206006)(86362001)(966005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 11:39:48.6521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 313a1bdb-36ed-444d-e730-08da59c4129d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3358
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 6/29/22 13:02, Krzysztof Adamski wrote:
> 
> Hi,
> 
> I know this patch is quite old but we need the smbus_block_read
> functionality, which depends on this one, so I would really like this to
> be merged. See my comments below.

Please try this series and let us know if it is working for you or not.

https://lore.kernel.org/all/1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com/

Thanks,
Michal
