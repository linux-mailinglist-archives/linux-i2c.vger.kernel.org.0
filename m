Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54F83682C7A
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Jan 2023 13:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjAaMWl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Jan 2023 07:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjAaMWk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Jan 2023 07:22:40 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E78193C6;
        Tue, 31 Jan 2023 04:22:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0PTAigQZ35hlPQMjm1QP/Ql0G3r71jtCUFvaFG3z3yoBtRQ9WWT5isk0fhhZdtdZvUuhfL06Hv9SptY1xm8txAOgxmBWwpGkI+3DYCRCcBFy3fKCOITVsKZKF+WjGrkrz2itgzrK7YVqHQDKi3c8nXq/usiki8AwodoYkw9J2qlv/oMrwJU91SggDa0HjxH+HVUl2QA3WBLb6ur2t8/BzZ2lq7YQfmy+SDa10qG6eXTJ3GjoLyMf1vvTaebzYHELimVWRop3xbH9S4Fiw+mq4in47MMtZvmCik/B7ZUgA5blkmldtQoAeeZzFF53NbZ8oWJ1o8c+PrllyLbYz5UcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvhRF9ZqipWgKg5Lg5VFzlow8eGQVKErpvz1koUNOb4=;
 b=BWfsdl/OMGsfzC+3JpDL70qkQEd4pZtuw6Pu6RQSKXrRpi4iXryPEM1BblhPBwPCqxQnBzI6ItPdKuoG+gzROKpKMs2kl8Mm/PNNtdkMldZyGiqrOaGPRAoxxT+GFno11ZpWKsBceLdWvep1+u4F4ViEiEaigZflvL9O+kSe/AGzJVFvu15FKP5XZIR8XeKEs250v/Z7wJRZ1MmwM4oKS3v8ZRgAjgYwIUNdFEMKEvb9+Vupezq4TuSLIJ87BUKURGs5YNeB25maHEG/V0g0RZnq8q+RdfzBk5GR1dbPo+QQPSmXghKLZJhQOjpleKlKVtefNNVPlQo0YnvdCu1/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=zte.com.cn smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvhRF9ZqipWgKg5Lg5VFzlow8eGQVKErpvz1koUNOb4=;
 b=uf43MFDmlCwDL0OJ1Uqyd2b1LpAxOffnS+CVEcGDWtN0B+hfPd5Rg9TFYn3cnyqok3SvkkOt5o/yMA1sAQwIb5XoWFziNd9yaD8F9pbCx3/aYyPk8e3w5DA/w6rPuEnQKGp+tjsm5bGMbxDd/KJOovukpFPMSAMnK31I0ofjZqY=
Received: from DM6PR02CA0044.namprd02.prod.outlook.com (2603:10b6:5:177::21)
 by CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 12:22:36 +0000
Received: from DS1PEPF0000B075.namprd05.prod.outlook.com
 (2603:10b6:5:177:cafe::78) by DM6PR02CA0044.outlook.office365.com
 (2603:10b6:5:177::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Tue, 31 Jan 2023 12:22:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000B075.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.17 via Frontend Transport; Tue, 31 Jan 2023 12:22:35 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 06:22:32 -0600
Message-ID: <8e4ec3a1-e0ac-ad7a-3414-6e213451e276@amd.com>
Date:   Tue, 31 Jan 2023 13:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] i2c: xiic: Use devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To:     <ye.xingchen@zte.com.cn>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <202301281453121890132@zte.com.cn>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <202301281453121890132@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B075:EE_|CH2PR12MB4956:EE_
X-MS-Office365-Filtering-Correlation-Id: 2000c410-d00f-4c6f-b02e-08db0385d58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HxaqzKkVTs8fMogUJzeWVq/72lTbeIlNksWgXN2TeoifoX5lA93wH8Ocqslqwd0tuQ90pl3b+UCWaMAk35e9slnRv1k179ducNuMqXU1XsJ90GrvPKFUnQv1aUmuzWYSMHLHds9mNqYesNuEG5HoTmR2lkz0Y7xP1sfyabISXjAAVRXylcYKJ7KKNqfkJT8q7zVn69Dujwb1EY11fv5q/hzgZo5EeyPPjH0QOLmHbZRGGPBP1Yxzatl3KQmmC9GUOPh4Q5f8z71cS5k2X0QlRpOnVAsDXz37d8TKIwN3bNxG4JdRBub5QNC7W/LtSr1gdV2bwIikIvUSgyCbH1p7xfn7F7HR/PfEtYtaByjEY0meMGLIMYNDqirnItdUG6SYtVNl3lDOeXRBGNX75tqiANbRx9qz5zveOduxjHkBwg9p7krtqlJuIpFLnFHpLJQY5xxvK/f4rlcTqmhnBxRVEemwO25kqmCe9rIgKSdJF5938EnG9T2aiNzPfYBip+pbPhs9XQb7bGE1/jjc1tvj6I18hZFA/HAigx+xXHepgjG+ONaHzeJ2WJvDZg56CcmKYxItPYyle9+yJT+6EDk+7aNN0tjVg10/G51G3fR+uVrTUNlxvGBxwV5xZJC1CD0p9Ozq4eQnI4LFpllJM1M19DnbJIEtsxB2mYZk54eelkb7vsP5Row7ukImiTWpOPsRt1pqbroCbwZ1BZJyYHRymRebwt4SltU36DnW0pyHxQpKvLuU4nmyUwN9Hfix3NMU4N5+xDFs/imHAAQ98YVf6w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199018)(36840700001)(46966006)(40470700004)(2616005)(81166007)(82740400003)(40480700001)(110136005)(5660300002)(36860700001)(31696002)(54906003)(86362001)(44832011)(16576012)(82310400005)(316002)(8936002)(356005)(41300700001)(40460700003)(36756003)(83380400001)(2906002)(336012)(426003)(47076005)(53546011)(8676002)(4326008)(70586007)(478600001)(26005)(186003)(70206006)(6666004)(31686004)(16526019)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 12:22:35.0601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2000c410-d00f-4c6f-b02e-08db0385d58a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000B075.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4956
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/28/23 07:53, ye.xingchen@zte.com.cn wrote:
> 
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

note: in my part of world name is starting with upper letter

> ---
>   drivers/i2c/busses/i2c-xiic.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index bee5a2ef1f22..5114888f2916 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -752,7 +752,6 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>   {
>          struct xiic_i2c *i2c;
>          struct xiic_i2c_platform_data *pdata;
> -       struct resource *res;
>          int ret, irq;
>          u8 i;
>          u32 sr;
> @@ -761,8 +760,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>          if (!i2c)
>                  return -ENOMEM;
> 
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       i2c->base = devm_ioremap_resource(&pdev->dev, res);
> +       i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>          if (IS_ERR(i2c->base))
>                  return PTR_ERR(i2c->base);
> 
> --
> 2.25.1

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
