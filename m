Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A04C1602B42
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Oct 2022 14:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbiJRMH6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Oct 2022 08:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbiJRMHZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Oct 2022 08:07:25 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874239DDA8;
        Tue, 18 Oct 2022 05:07:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLkeObu5eOrhQnQ3/uvHJ7FXowRn5nRqjOPqhQWPNGm0O1J2Z60qVXS8fWUUAWZsOTnv0tTJ2iviPZvyQY8SjV2nP3Nuie09eez319gh4p6/eG6zBq5yixT/EuxEJJVXFTG44u39PjewOyurUTEySfKNvc4YRWhETAxLKbsELF7Zhow7bwQKlRaALEw8TlFo0YU+zhEayGLiOCd8vpcBswlqj5PaPkEVjbJxjVWPNkgizA5CPc02lzXJ+CRzt8b0mE+klxn2YxSqTWtfFygQwFNxl6Q5BAhuHN7fXKie32hoed7e+5rVsm5W+PV/3JI0VHV2lQakDIz9baJxG0QPyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXmJrqNiI29EbdjyfeTjg5CVGxaSl7EJKDXGtYEp0QU=;
 b=ndY5xUE9E/YIyKoWBkRw5hb8dePieYQi39QOK1QePy5Q+OLYynxd1FZZcHwzqzDe2ZPVM+EEZMN1knK2PFRx9U8Ag9bDSvPECwqWlra4zLgzjMCnCW1mZSexChRkp0QqBz2FNjuj1lPeXALO7GB6Se3C9SO7d4528/dMnIu7BBv45DXwqBKhfl1WtDos1hdrdvgXBncD1qWqMEw0p+RfCJaE+oVJIOq4FZpeAbh5+6Ar69KAh/hLMkk2rETs86PTke0RVAxiMIKt5b9PrZJHCJW8A6vO5WoH8JsOXMIVccHxuEqMb5ujdW9Nn+eZfNK95K4FbbT8yAYPTVSgurfEWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gpxsee.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXmJrqNiI29EbdjyfeTjg5CVGxaSl7EJKDXGtYEp0QU=;
 b=WIz1DcrweUqntzMsujGRmvAv0TYMJ4S4DhxXsfjXaXpBPJ5mKwTQn6w8jPapo9YIhhj0gVs6uFz7pbTzYC1pWFzZu4an79EvrO0UV8pbZwvQiHdlcb2+lc9DyfgG99HzvDtRkWPZXlm1rl7AK8A1J6l6jGCp2Ono4hqmSi2U9ws=
Received: from DM6PR12CA0001.namprd12.prod.outlook.com (2603:10b6:5:1c0::14)
 by BY5PR12MB4308.namprd12.prod.outlook.com (2603:10b6:a03:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Tue, 18 Oct
 2022 12:06:42 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::a8) by DM6PR12CA0001.outlook.office365.com
 (2603:10b6:5:1c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31 via Frontend
 Transport; Tue, 18 Oct 2022 12:06:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Tue, 18 Oct 2022 12:06:41 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 07:06:38 -0500
Message-ID: <611cd6ff-e6f1-ceed-b2eb-7dcbbf18b36b@amd.com>
Date:   Tue, 18 Oct 2022 14:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 1/2] i2c: xiic: Added platform module alias for the
 xiic I2C driver
Content-Language: en-US
To:     <tumic@gpxsee.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Michal Simek" <michal.simek@xilinx.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Lizhi Hou <lizhi.hou@amd.com>,
        =?UTF-8?Q?Martin_T=c5=afma?= <martin.tuma@digiteqautomotive.com>
References: <20221018140338.7080-1-tumic@gpxsee.org>
 <20221018140338.7080-2-tumic@gpxsee.org>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20221018140338.7080-2-tumic@gpxsee.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT058:EE_|BY5PR12MB4308:EE_
X-MS-Office365-Filtering-Correlation-Id: 223c56c5-3505-4ab0-cca6-08dab1013812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uWvqlcBSvg3u9RNl5ps5xrHc0ib+QizXqzgMYV0MYyaTJxGWRsokxxjPl9+Z0EU9q1mcVaxFHo6qvjNHUDSqlvjME7RuPd8dKCvN4gXcXxCXfu31AgIzaVGbrOCZnCk/x363F2vBYcDg2ThYY6twtM+zp9+Koe9Xq6Evcq7mN+eaGH5RbFxgZUB8LhJrAR8HXxjFLqXAGXzGZIEQQUW2CZEwttQFbMMntADYdRz6RscYP+qH3+Zp4P/GJ6b5wCVV0zMX098M91vbSErEwR9PppwfKLybVXrBe5N39ldH/jD9M+jzJLVStoLj9l5h3Ox0Vu8/CiBUmv5PRoXmo1x04qNaKeG1bv2kqiPP13o3X0dvPQdl5UQjO2RGZQ2floXWtB4h0GLg8P+YcctSyJ/Kc5ytHMHq+rGf9uJt+X0wq9o+5uf9HcLkN3tdwF7aCAajnYASjpVgbxCwaCExZNLvTkpLqFuiX1gLg/ilo7dukesGP5pNAI7zXvg1g68WpzjEsmKWsno0u6oKgDTX9oPZtFGfW8u+UD41JjrbC8FIMDSX0xXTZId7rO0ZivcaTfIFuCIE3ibGA2YV7SUn4iJXXXnMlC+dlt5PFS6ORMtFLAhW6YwGpnlbIjKXet1zH4ie4gHFvSa9Kpp4g6ciVz2RDUt+4f6Z1eutLcFYkIiq2Lj8BhfBlyfP0UzI3v2hv79ZJELTm8WZPTKZE0BW76NcOMu7wfRTYM41xQPXJEoi72NDcMh0ZcbKkZ8mNDk4uvoFinMKDt7TiStfkQ4dOTQJqhelf4LFntXeuMWU0H4v9lRLPRAk5Ou9mTWlJz7UtixCH/3ieW2vb/jOGzmD99kdhA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(40470700004)(46966006)(36840700001)(31686004)(54906003)(44832011)(5660300002)(110136005)(316002)(70206006)(16576012)(336012)(478600001)(70586007)(4326008)(53546011)(26005)(8676002)(41300700001)(2906002)(8936002)(16526019)(186003)(2616005)(47076005)(86362001)(82740400003)(36756003)(426003)(356005)(81166007)(82310400005)(36860700001)(31696002)(40460700003)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 12:06:41.9405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 223c56c5-3505-4ab0-cca6-08dab1013812
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4308
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 10/18/22 16:03, tumic@gpxsee.org wrote:
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
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
> 2.38.0
> 

You should likely send it separately because this will go via different 
maintainer tree.

Not a problem with this patch.

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
