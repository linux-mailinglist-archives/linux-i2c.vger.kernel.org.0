Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28A38584F42
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jul 2022 12:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiG2K4V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jul 2022 06:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiG2K4U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Jul 2022 06:56:20 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::615])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764464BD05
        for <linux-i2c@vger.kernel.org>; Fri, 29 Jul 2022 03:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwOMnOPzcsJmLrxUBhOJmCTM0M45vmBOwYRymNWHYXAPZsvYvt7cQf/73Q7o5/lu1TuGc966xq4fOu8a388DB34fftCqmM7612YGJ3pqwHVvu132ppshy/tdr+d8pUiF1jKveUtKMWf5L1a5MFdEWAw7l9KZo/Ta+mc75CVKESCrvxDmgBb3E79izHsgv4odr2qKJ7Sv+PQZN3Kr7uSmxW1JtD/U8eAw8oPY+swZBqN1bVML7kormZBysXejUt5YyO+zGGW/zR2TM6ahiMqlAf2ngzNZgR125o73go36fghbjoE88w7wifXkINwwMMe0opoh7asQc/5XfCUmps+AcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvz3wFmuyzUj+R5C1S/tRYOjFotIsCCbKA//kVTQSII=;
 b=KQftwxpiVjaCnwWw0Dw4BtJRdRA4fAOC4MA3IbqTkYFbm5neVwyIZtHP8J6r2GUouvDPjdbhf2rhn3sT33+yjLtZ+qWo3QpuZv07D3y8WZ6lZGMyAwyM2n2i0JQjqBFUsAau8Wg2pMixqkGn0XSwAAgTVaqTJNXwhpKEwN6no6t17yytVJc+8J6rYGlzpaEITawbTB8fTcxVe2+mfyC/RC2Esw7gVUi6KTrX5b/ln68H48ChBZxz/+yQLY4hTOFTqcS6babKnDrEmxnbzWW+D1PKJ/tlHEr0tqW/6mEhjYSmxdQiPmO9GGj6LTWCnLey1mTACp2TSl7XBUqYr0ABYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvz3wFmuyzUj+R5C1S/tRYOjFotIsCCbKA//kVTQSII=;
 b=ujF7VLWpsZINlsmMYUblmpaLAW08FLmw8H/jN9QIY31YIHnbHqbmj4RuM2t5dMG7DmhsljpEj/TruReFm7LAc7bPVLccd92cqL4reWu/LnwvdqMuanu6vRjau3tbidQc3MXUYH+d3vk+/yq0eV0rylckBzOAbe1IiMJ+COwPmKU=
Received: from MW4PR04CA0255.namprd04.prod.outlook.com (2603:10b6:303:88::20)
 by LV2PR12MB5894.namprd12.prod.outlook.com (2603:10b6:408:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Fri, 29 Jul
 2022 10:56:16 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::d0) by MW4PR04CA0255.outlook.office365.com
 (2603:10b6:303:88::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24 via Frontend
 Transport; Fri, 29 Jul 2022 10:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Fri, 29 Jul 2022 10:56:16 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 29 Jul
 2022 05:56:09 -0500
Message-ID: <920041df-0ac2-7298-4568-c8bba4a2838c@amd.com>
Date:   Fri, 29 Jul 2022 12:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] i2c: cadence: Add standard bus recovery support
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git-dev@amd.com>,
        Chirag Parekh <chiragp@xilinx.com>,
        Robert Hancock <robert.hancock@calian.com>
References: <20220728055150.18368-1-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20220728055150.18368-1-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2dfc57b-6961-43d0-d374-08da7150f5fa
X-MS-TrafficTypeDiagnostic: LV2PR12MB5894:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RVK2wkc5+ZuKVSbukq1iES4xhnK1wZiFT9Gn54s0mHVaim9pqpxyw6C0NYWwxCfLJ5/J1B6CnopX0ZdpP/qStsKn7LBvbNowFLnLZnDtE/pN9fuNG2GXIV4F9eKBPbas+xPnTEDtMF87zu3U+f8ROGslYQxC7LkRLtX48IDbLUUaf0WS9OF9+dxE8d6H5SFGHqf5rm4KU0AuTTij6gLtN8yMupS4XkA4ccwDvq5gj1Ko3xizqxuQU/6NvSX23eKZI0/DaYRMRTsIv+AyEvsp4nuHvS77Qo8XrVkvhQbix+QGXi0Bjvs6bn+z8E1h6rWE3UaQcWqPoPUy3PWKJPIJMAE0CBI6mJDvRXZtKevCm0UP5AfPjCSlqm6uDdA6ioeiGHMd+myj6Kx6PAFsFximGKFYFMIi7gx6tDO+vzdaa3hmS4zWH3SscCRVfwKLgrnbdhpKuGXzewSBe8D9xn6XsX3B8rS9pT+30cIE1ZV3ilFG00RQo1bMAg2vyEy4CsCH8VEXn358Jqs2ROnNg8vygBAxSwWJ7oAPprr98SrY7eJoASRizcGTzBJ4uPMcxOyvVcWZFxSNZ5YEjSJocvOU7QXot8Wl8cjaH7V5N6YxBb7cvT9e6/3mJX9v9XZ2y5QXEQp8V7W6gEVyyoMgG+l59+MErRW6R9wM1K5u1pgTNsbuwIOAWDfs3pvB+AMSNgP5ZyE2dxMbq/ikM5PpsQVuFc1xKfISJwsDemTVqby9/Q9OtvQqOwUmgFcqA+i7I1qVDTz0yUb1vpH15ipNI95Q4Xdqk5KHNzsU4CuU3e9GCjLKRg6QRKzhlwo4T+ki0wsBir216V3oGTrINm8Y4YptsaHFyv4V7hIYWLdEwMS2B3eMxcStYOSdgs9rcSPquWki
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(376002)(346002)(36840700001)(40470700004)(46966006)(44832011)(186003)(336012)(2616005)(47076005)(16526019)(31696002)(53546011)(2906002)(26005)(426003)(82310400005)(83380400001)(36860700001)(82740400003)(40460700003)(356005)(54906003)(40480700001)(41300700001)(81166007)(86362001)(5660300002)(110136005)(8936002)(316002)(31686004)(4326008)(8676002)(478600001)(70206006)(70586007)(4744005)(16576012)(36756003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 10:56:16.2650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2dfc57b-6961-43d0-d374-08da7150f5fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5894
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/28/22 07:51, Shubhrajyoti Datta wrote:
> Hook up the standard GPIO/pinctrl-based recovery support.
> We are doing the recovery at the beginning on a timeout.
> 
> Multiple people have contributed to the series.
> Original patch from Cirag and another one from Robert.
> 
> Cc: Chirag Parekh <chiragp@xilinx.com>
> Cc: Robert Hancock <robert.hancock@calian.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>   v2:
> Updated the busbusy check on a timeout
> v3:
> Added pinctrl_get
> 
> Did unit testing and probed the scl to see the clock pulses.

Can you please describe testing procedure? What board did you use?
What was the hardware configuration?

Thanks,
Michal
