Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77AA663EFBC
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Dec 2022 12:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbiLALnC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Dec 2022 06:43:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbiLALmt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Dec 2022 06:42:49 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E5B578D1
        for <linux-i2c@vger.kernel.org>; Thu,  1 Dec 2022 03:42:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wu7mD79xn0XUktBGQYX3bOCi4hWZ86ZhjOoYkYrI1YwirTk810aUghV3tdBIpxTre4ilMd7bI8igFJqDNE/seRx21FRdrChJOTMcAk1uCwlqiFgu/iKQiG7zp8A/H2rAJdHjcPmOU9xsm2ARbbxon5Z10pT9lX6e3Pqq0mqFb7k/uGuuszG8NLmwnHHCJr64tdXZylBoISC6z9AIeMJcIAPDGtHPq/z0XlLguXYK4kCsC9FarrgjAGaSN14MYaw6YsL9ZAVAX7faEhsXCJxmgs63aKFCO5DqlaJt+T5k8f/8nV+VONNlY6NQS6YJKUCRAMEKcS3f+Kvxtt7yevK1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugN2wtOYmT0EdZgvCGuLkXVkES482TlPcYmXGdb3L4k=;
 b=AGyEDuWZJz+P2cdOv+qh7ZMIkJre3YEV/f3Tr7GjCHa/tJfaxiXehHSgfPtBpgdimat6a/5cAK1T0gB5iGQqH7QjUl9YKzdPPBRuoPrCJkYWlQt+J2QwiKYpX8hhDaNuoEfp9sF5nw/Jmjhv20ACw2fbR/g9D+UDvlp3Adm4DdrJMw6+zh6e5sC+4ZHIPrP2O737uNUawDMTUQkLeTVqZo0dxhNNhloW7NKcuujSsRz1ifRjcr7UgLy5m+yfEdfit5bVdcxOT/HBorE241pinFIUdIQRJgyvP68a0g1Jbvu9NOea8t4mwFOOJnv2k4W60gepmyYGvUQFDlLbwmLJ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugN2wtOYmT0EdZgvCGuLkXVkES482TlPcYmXGdb3L4k=;
 b=wYkb+48H2FGZPz//H6e5Kou+fQFqXgyAU7UwlpTivIC1TYbgsESgJim2wlDBdUD7ysmgFXqnCRTbTH40vCUvyZT23qhSTN9MspchWhk3isdeZOat+C/XtpXeNRl7GHG9wcsCsr/BkxoGlKlmri9g+hOwdUUIjuli+tBEAOL9EkY=
Received: from BN0PR07CA0026.namprd07.prod.outlook.com (2603:10b6:408:141::26)
 by DM4PR12MB5103.namprd12.prod.outlook.com (2603:10b6:5:392::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 11:42:43 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::6e) by BN0PR07CA0026.outlook.office365.com
 (2603:10b6:408:141::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Thu, 1 Dec 2022 11:42:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Thu, 1 Dec 2022 11:42:42 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 05:42:40 -0600
Message-ID: <da91aa37-3807-a9c7-d072-7855f858adf5@amd.com>
Date:   Thu, 1 Dec 2022 12:42:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] i2c: xiic: Make sure to disable clock on .remove()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Michal Simek <michal.simek@xilinx.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <20221019202808.88779-1-u.kleine-koenig@pengutronix.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20221019202808.88779-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT015:EE_|DM4PR12MB5103:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fdf2d51-b908-40b5-0606-08dad3912851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZZZnOybOwbIRZJ94WrndbqlDTYYxQ3O6BqeFCYWf5gdlKyox8FgB5As8pVDGeUccJlA7xp5+92UVN8GAN74iuJOTZYWqt6opRUbqvzagL5w6w6VZzuPRJC3S5u6ud/Js0qK1X5v21/7J7uBjV1jJIPPwFuqoMJ+I3fcC6Uy1Z+pIGQGLm3pqMC1Q4PoDi8fOErq8Q1QH/8zOBdOx6mgjQ5MVdDPoEvFahIxuIJwPDzaI935XIpYZfPxVgtZS2ubTJBsAO2OinaTgBFBk9nNPuvnvg8RQUZhBzVyIEsXzNvtSjh64y8NdIduj6XwPTtIguNHZbg/hlBmw3MWV5gtREdiWZKbTG2IB+z1o7FkjWsAGMvqOt8TTLbFgiFR/bXk+AE4HU/wOYXG74Dd9x0tIKsSV1YGYXFuLcvbR07nDDZ5/Z36a8nUmcYwBKuaD3AJnNfY4GrRj8gQ5fQpWBAdATV1BZT2Pndws1BWJX5bHhuNNl2Eq01K5bEbYlVZxwQrdIYlBogeFyK5RiIkekdsks5WOdUg20qbbdPtMVR1sh65Qwipy2dME1Pf07pqhfd8Z7lceAGQYmVvxA7SIPRhFuvq6YHekNMAsWJ5Hjzo7HKnTNW34o8q5x/K4ZaJN2ZzR89OTrtsdOsgU/39zum27XPGHK23+w4uBDr99Gq+b4AuxQk2/859qRjOyj2WIzCnS0KtYv4fU9UIr5qxcTmW9nt160olO1Sx61kj39oEifkkwlRGlCKscZJEzOz9tQxDTmeZBrN05UkOBLT3hhCWYBCoBW55IBOitvke7MSeuKT4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(36840700001)(46966006)(40470700004)(2906002)(31686004)(44832011)(36860700001)(70206006)(54906003)(41300700001)(4326008)(186003)(316002)(81166007)(8676002)(16576012)(110136005)(8936002)(5660300002)(70586007)(36756003)(2616005)(82310400005)(26005)(336012)(53546011)(16526019)(31696002)(478600001)(40480700001)(356005)(66574015)(47076005)(40460700003)(86362001)(83380400001)(426003)(82740400003)(142923001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 11:42:42.5995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdf2d51-b908-40b5-0606-08dad3912851
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5103
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 10/19/22 22:28, Uwe Kleine-König wrote:
> 
> If for whatever reasons pm_runtime_resume_and_get() failed, .remove() is
> exited early, the clock isn't freed and runtime PM state isn't reset.
> 
> The right thing to do however is to free all resources that don't need
> HW access after a problem with runtime PM. Also issue a warning in that
> case and return 0 to suppress a less helpful warning by the driver core.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/i2c/busses/i2c-xiic.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index b3fe6b2aa3ca..809d6eadae2d 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -858,11 +858,14 @@ static int xiic_i2c_remove(struct platform_device *pdev)
>          /* remove adapter & data */
>          i2c_del_adapter(&i2c->adap);
> 
> -       ret = pm_runtime_resume_and_get(i2c->dev);
> +       ret = pm_runtime_get_sync(i2c->dev);
> +
>          if (ret < 0)
> -               return ret;
> +               dev_warn(&pdev->dev, "Failed to activate device for removal (%pe)\n",
> +                        ERR_PTR(ret));
> +       else
> +               xiic_deinit(i2c);
> 
> -       xiic_deinit(i2c);
>          pm_runtime_put_sync(i2c->dev);
>          clk_disable_unprepare(i2c->clk);
>          pm_runtime_disable(&pdev->dev);
> 
> base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
> --
> 2.37.2
> 

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
