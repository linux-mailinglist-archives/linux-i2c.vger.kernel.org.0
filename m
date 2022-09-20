Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 854215BE900
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 16:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbiITObE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Sep 2022 10:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbiITOa5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Sep 2022 10:30:57 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611D73AB29;
        Tue, 20 Sep 2022 07:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T93jLpfnzWNz5oUHYAwK4Lqgal4OznEb/pftAJMbL27H8UYvznHy8hfmIcqgt5soT9S70sub1IWq2j8HEyeK0aCKNPfgTwIDkRYgGRsv7KGJtVsPA1u2WYSYLcOOpW566YBNg5jA618XfSFcrx3uoyB0zelHW54l8auJl4Qh/+NX71g3Z7FUueceL3myjP6iLHSflw/4YzoTHOzH6Xu42Jq7/xMOPnqooaBtbC4vzqVwAHToBF+iJRKPAREsQHQ+I6+cSUJ6Pv929vB40Fd6jrnCfKqri1uraHZjWh/07iVa7SIHvGdlldwWh/e11j3uABBGbzpBu7mRZzSY2RLG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntkuQQGPerXXklIHQf7aICWiW85+TFytr0oUlkHfeXk=;
 b=Xb3MkveEbeeAZQlcL9zOSNyLs+t3gW0ZpVt7yVumlOIumTOKuwK5sCvA1tdyLX73HxvmQlsK4Dn1/pGOfRP3GiQ1WJT3QEZYNKBF5M0D0wMCpLCZkcSHYerFO9Rj0h7C2jcetxCRmtc+OQ01b9AlSc1KRw3JHCkvTMxE3LqVDXY8Jo67wFtveg5lxrnZnI95cbg62YdyVezenRqfrtuFXkO74VJmAcU4pJ4s+ylBZwQQ262j4KE4l08LqdH5BCXEQJA8iyf0xpU/U6iHC41hfArMjI9KRysIj4LZegMiSWXHyxI8h9bAEfMHA/PqyUIWeOjY058UXdjQOVLE+XVzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gpxsee.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntkuQQGPerXXklIHQf7aICWiW85+TFytr0oUlkHfeXk=;
 b=G/hgFomewlGXO27pRwtR1GQHc6toTZdlUoj2GzEeznWQ0XvQ+Rh0+W+rssJPMWiAPvvuFBvVkWBnCX/UUfATIPa3KTZWfVo4wkrqbgl23LIAva9ZduGZIB7OKCMgqF3psHhytFO+1c3Pd3uZL39Tka4O4yC1DVeKzTxHzcbLMl4=
Received: from MW4PR04CA0336.namprd04.prod.outlook.com (2603:10b6:303:8a::11)
 by CH2PR12MB4054.namprd12.prod.outlook.com (2603:10b6:610:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 14:30:52 +0000
Received: from CO1PEPF00001A61.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::f4) by MW4PR04CA0336.outlook.office365.com
 (2603:10b6:303:8a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Tue, 20 Sep 2022 14:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF00001A61.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.11 via Frontend Transport; Tue, 20 Sep 2022 14:30:51 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 20 Sep
 2022 09:30:47 -0500
Message-ID: <6c5fd7a8-523b-100c-a104-d2f0bf69be16@amd.com>
Date:   Tue, 20 Sep 2022 16:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/3] Added platform module alias for the xiic I2C
 driver
Content-Language: en-US
To:     <tumic@gpxsee.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "Sreeram, Manikanta" <manikanta.sreeram@amd.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        =?UTF-8?Q?Martin_T=c5=afma?= <martin.tuma@digiteqautomotive.com>
References: <20220919185556.5215-1-tumic@gpxsee.org>
 <20220919185556.5215-2-tumic@gpxsee.org>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20220919185556.5215-2-tumic@gpxsee.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00001A61:EE_|CH2PR12MB4054:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e43a96a-b81c-4510-b9fd-08da9b14b7f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rw4gr/Z7dP72ruan/7aodN873ubi9uUEUZSH2zHvAumj7JRTaGAVjNNGiPysVz6BsMjY/evMyrkpd7H0LuKa/WU4ZgtG8jYcddL/hXTUh7+PmDd23lKW4WnWR42wbMarbgFpy21W5owdfSQWFhSCsqcDMBpfOXwd7majO/843ZOH/qgh6tfjdjLIDGwsiUk5ViEYOfJD0FMcRvNV3jdqu2ChtUvs3Ve2qL0UBH2E2iH+2QjneqRQKVZELrcBiiuyjZWr/Onb2LI3Mt4k5cXogFxJwW/Cm/yZiLQK4FWakIVmXTQkx1shAp6iKKzubZg/60YbAzcHhPPNQawsAcIyggfB1fqc2uSHv7hdNPAOQxFvhrkRX3lrWtl17lqQ+SYI30THNoOVH9i5hPfijC0BEh74nWJHaHjlb+stQbH8t5JgSRxbyomi8zph3gOF40gvoix9Dz819Ox0lzqmya4pZ8MW8OaPJHdFnNBR9R/gAWgBK+VFOwy4dPzK19eWjIV/eCAYzrPrUgeDSYXhVM/tqBcpenAV2GxejRyIQ6XFiD3N1tmTx65DPKmg+cIB6cuCZrh5lQTJBZpUzd1+elCGNhSOhU0EMl/MNzQA4gO3DX9w2MmJL5zBpCn7reTxu9zI37kZf3cU0qKhOTv+0BRgANz+OmKmJNPUIitlPIHicBsdBVO6QDNPN7WGte8lWbOFz3bapsiVIrW1mhqUMRvvC6tgZESvJIbtKpItKqBYZkovFg+o2xl3IEUINmLYfmTb/YUpDo7i6GomF1r1lFz68RXFYnIqTENUeAEvhC9Llz5cQ+fWHJTzuC6p362Ew1MrVwlEMRZqcfPxE9E83WsOYg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(44832011)(82310400005)(31686004)(40480700001)(36756003)(4744005)(2906002)(6666004)(336012)(16576012)(316002)(82740400003)(36860700001)(426003)(47076005)(4326008)(8676002)(5660300002)(70206006)(70586007)(31696002)(54906003)(110136005)(86362001)(6636002)(81166007)(356005)(16526019)(186003)(478600001)(2616005)(26005)(53546011)(8936002)(40460700003)(41300700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 14:30:51.1816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e43a96a-b81c-4510-b9fd-08da9b14b7f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00001A61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4054
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/19/22 20:55, tumic@gpxsee.org wrote:
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Subject should contain subsystem prefix and driver.

i2c: xiic: is commonly used in this driver.

> 
> The missing "platform" alias is required for the mgb4 v4l2 driver to load
> the i2c controller driver when probing the HW.
> 
> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
> ---
>   drivers/i2c/busses/i2c-xiic.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index b3fe6b2aa3ca..277a02455cdd 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -920,6 +920,7 @@ static struct platform_driver xiic_i2c_driver = {
> 
>   module_platform_driver(xiic_i2c_driver);
> 
> +MODULE_ALIAS("platform:" DRIVER_NAME);
>   MODULE_AUTHOR("info@mocean-labs.com");
>   MODULE_DESCRIPTION("Xilinx I2C bus driver");
>   MODULE_LICENSE("GPL v2");
> --
> 2.37.2
> 

Change is fine.

Thanks,
Michal
