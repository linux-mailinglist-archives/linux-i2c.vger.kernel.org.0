Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3AA5EEF00
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 09:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbiI2H3s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 03:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233931AbiI2H3p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 03:29:45 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC47117884
        for <linux-i2c@vger.kernel.org>; Thu, 29 Sep 2022 00:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFZzNfAIX2R8zXSC4I+hI/wWOtpRjUEK934oPT84Pccp/3/SLXTcZmW3jCPBEsfFfAcB5TAJtXQ2ZqL0kI3MZ56VxU9mptWfmPtt3nE5X0zDmEiTLS1pokhqXrmkaHq4ez0/B3JCr3CJB8tz/p73syOhPhh91sScDs9lktlOSf1vP9NrXlE+F3ITOYL8XeJ2dETNqpKPgdlELF0iX26b/yPXPZ3hlPy6b565/OsOorpLxWUxP6X5UK66ELWCp1PiF5eX8PKnBnsLI/mIdQUtpGAxDbYio6PkF8k5yGPnWELghpoV5SeEXIMOdhotyyk+gGrEi34hYGI4jQGXJUrtAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgyxBCf64F7Qx8uPy/JpNbuA/1uccD8jPt8dA/Fl0dk=;
 b=NHzbM78/PaDHiv8YVuGf/9D4q55sBgoU2kHRJ+MOHQ1Lg5hxsx2jbjjVdc9V6XaY29FnG/UQ7WEfOXh1cFjZi9xJOvh08OESepulAYk6ZWk2lxNxrM58TOUnqxkwei78QjpUx/v7QfpH1D+zzxatyjd84h/06IGCVFUes2nEUet3x+7Is5ZJWdz0k1XRcdLPRfEi74zQJ8SV1MDRrAmjfIPCW7R+xUlvEGXxu9BHRDjzDcdBdURrly/T0TbaTSml24J9n56/rWetHhFH33+C2AA71+bGgwL62+O4Jnp5JE5y8D4kjhGKr812Qgb0CsPos0x9o6skTI/P4L2JcutrSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgyxBCf64F7Qx8uPy/JpNbuA/1uccD8jPt8dA/Fl0dk=;
 b=2GNXBNM1xfhFOHaLus7YujtJGu25WloOMw8SDnmuLlZNyV0SB4vOhQLsaz/OIsMDo2p3jQkm745Ng+eb3kCreZI1vesjjzmFH4HUZ6C7nm49d4jSGu5qkhCxqL/0hb4uGNM4xnfVDT/nfGjzzMTcoSNETbDWShdvzhBcjE7/BAw=
Received: from BN9PR03CA0416.namprd03.prod.outlook.com (2603:10b6:408:111::31)
 by PH8PR12MB7207.namprd12.prod.outlook.com (2603:10b6:510:225::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Thu, 29 Sep
 2022 07:29:40 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::ae) by BN9PR03CA0416.outlook.office365.com
 (2603:10b6:408:111::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Thu, 29 Sep 2022 07:29:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 07:29:39 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 29 Sep
 2022 02:29:33 -0500
Message-ID: <6112f323-63d2-f698-43aa-deed8aa6616c@amd.com>
Date:   Thu, 29 Sep 2022 09:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v3] i2c: cadence: Add standard bus recovery support
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>,
        <git-dev@amd.com>, Chirag Parekh <chiragp@xilinx.com>,
        Robert Hancock <robert.hancock@calian.com>
References: <20220728055150.18368-1-shubhrajyoti.datta@xilinx.com>
 <YzNdytanT3dO1eai@shikoro> <YzNei/DBUohqYlX1@shikoro>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <YzNei/DBUohqYlX1@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT029:EE_|PH8PR12MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: 95323494-8cc9-4fbc-2d79-08daa1ec5ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qjv7xAn69iD5omK5ivW1JukeK4jlSBzWqkZ9nIE6VZrEQPn0gAXBslydIAvvaT80e7fElWAdzUFj7Ipb/gkIDB87QsuW6rtCjvRj/oYXDnmuR+feEnLD0TSNq18BeV6k/BZl/GRaggJicRQ3/Y+q6oQptTdkeQe9C0dDbTLKpRMfJfi2RmsRE6Lg1ylu7TPy0rBJF9fFLrZT7epnYDGX35ry6V0HtuvNTodZK8e5L2KKAgk6SnPPuTJ9St6Snw8IF7h8MlJ3YivUvszogETsh3C2fXYyj1AqSEAxutnfr0B4ndJcG/RFzWusMubGM1XD4j051vUizv6I7rIDxKRwCO+GU1c7Z5pADzA7QZI4EwWBPf738uzNrD43NBiHGpyvuHpmZSkay5CK/xikAtlwNA0GqgRMR+KxdT83XXz/22ds5TFiNN3N8m5WlbgO7zh4llVA0acxPCXi1SyA+JBRGKBfTI0tKbGARKeag0/G5l4cUuAZwuZTHrMZTQJogbyCicuW5RC+/ltTRllp2I4bPX6IxxGDT4LjD87yMjBreIqRmWC0q62rJ6VpmD5FvMiK5hIvbPvejUwewi0esphgRtzWxTUSqh4kBdR8aBfA8EfbVWKKguTa/bhrNM3Uw8/ot4gzpZe5pajGA2mVLb4yqpBNYCCKOHHGHq23DOXmh/kpBl9F+AZBnyyTsTt7c5ybPjrAhDwvbOAuTx33fkwxDK7dlmxcsHjTdOJInQv3lpuUBv2hmuM+gat/Vj5xXSdXv/C27UEREldDro6FUmweOCk73B1p1SkWfxhelqX2qxerSiNGtnF/CSKfLHjn3NPRK+1WVzl87bETuZ1vE0280w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(47076005)(336012)(36860700001)(83380400001)(16526019)(186003)(40480700001)(426003)(110136005)(316002)(8676002)(86362001)(41300700001)(8936002)(70586007)(53546011)(36756003)(26005)(2616005)(31696002)(16576012)(2906002)(31686004)(4744005)(81166007)(478600001)(40460700003)(70206006)(44832011)(6666004)(5660300002)(82310400005)(356005)(82740400003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:29:39.8089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95323494-8cc9-4fbc-2d79-08daa1ec5ea7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7207
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 9/27/22 22:35, Wolfram Sang wrote:
> 
>> Applied to for-next, thanks!
> 
> Unrelated to this patch, but cppcheck found this issue:
> 
> drivers/i2c/busses/i2c-cadence.c:1038:33: warning: Condition 'actual_fscl>fscl' is always false [knownConditionTrueFalse]
>    current_error = ((actual_fscl > fscl) ? (actual_fscl - fscl) :
>                                  ^
> drivers/i2c/busses/i2c-cadence.c:1035:19: note: Assuming that condition 'actual_fscl>fscl' is not redundant
>    if (actual_fscl > fscl)
>                    ^
> drivers/i2c/busses/i2c-cadence.c:1038:33: note: Condition 'actual_fscl>fscl' is always false
>    current_error = ((actual_fscl > fscl) ? (actual_fscl - fscl) :
> 
> I had a glimpse and I think the checker is correct...

Are you still using your ninja-check script?
Can you please share your latest version?

Thanks,
Michal

