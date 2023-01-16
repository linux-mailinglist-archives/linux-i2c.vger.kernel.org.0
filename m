Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32B8B66C2B2
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 15:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbjAPOwV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 09:52:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbjAPOvm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 09:51:42 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7CC0166C1
        for <linux-i2c@vger.kernel.org>; Mon, 16 Jan 2023 06:37:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzBAeeWgmQSWQipqh7CSjvY+lix6fya5sdaA/qqQb7WOXTTUi4OraCEo0oyd2Lns01EykG9PWgg72B7VwIj+VwIbPCwkhxY++PJpMQPk7YJcNzF3wD08eFQx9Qdlr7glKto3Z1r18M48XEaQJaHDmueupzNWwJMFg1HT39zXG4W7GZLBHbK4WcqZq5xsO5kQ7yckzUD2CxSmE9c7zKk1jlzlNVl5LmE0YSzLLvJuTPMFhfPeH1Bn3UVUpTWsEGfiCSByPQfd34H0LIyz5INxSYqkg0cbSHB5ZeHYvCHzrlW8Nu6gbqaxrkf7yufNaCZwfQzm/gwKN1MwU3K78US6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tPOQX1WafcV7UdgOflbOFLtjnHVdl0T9j3krzyHvAg=;
 b=n9TNJ27bemWje/E+BCh3tEw5NdMAo7Crdp1+RXdNjGcjGObaT3gxF/cLTgsRqZG7ZDAFcz2noh8UOtCh+cGntKHMl9ivpm2gkPBLLRiVC45+lz1mZz2ARLb6fpL0rm2Cf2pV5Ugkl90ygd6eFcVZyBOZSzTmsFtq/VuDjqRK+ywfGcXDyCloqASxKBVdz23K4IDxxMkqcld9cU4pD0QgQ5NJwapoEJi8x2Rg439rFLfKuWpWI7WlWmj8fxCbSyVI+AND9f13f0B6nr5fbR1r0FI+tq3PP9rbW0Jl/hurgEzfdTTRS6Cbtfd30WbVovaw14iB7twZC0g7I1O4QO07gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=metafoo.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tPOQX1WafcV7UdgOflbOFLtjnHVdl0T9j3krzyHvAg=;
 b=UjDsDlGZEosa/z6pOUKco9ZOIvmNzWVbWJi8IGsL84f6/6UHfqQAqLV5e5rZZ6IvZkmjtG2ZwF7aUDmkTp4XWSJl3zvCab7juHudgXSKC3gbNxV4bD0sor9J6FhIMWDLEI1uH49L+nDhExP6VrHgTQFA2nsc+h7z4TZs2i8+8bc=
Received: from BN9PR03CA0371.namprd03.prod.outlook.com (2603:10b6:408:f7::16)
 by DM4PR12MB5151.namprd12.prod.outlook.com (2603:10b6:5:392::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 14:37:25 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::5e) by BN9PR03CA0371.outlook.office365.com
 (2603:10b6:408:f7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:37:24 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 08:37:22 -0600
Message-ID: <1a7c5204-d1a3-9339-f361-a0504377d103@amd.com>
Date:   Mon, 16 Jan 2023 15:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] i2c: cadence: Remove unused CDNS_I2C_DATA_INTR_DEPTH
 define
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
CC:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        <linux-i2c@vger.kernel.org>
References: <20230107211814.1179438-1-lars@metafoo.de>
 <20230107211814.1179438-2-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230107211814.1179438-2-lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT024:EE_|DM4PR12MB5151:EE_
X-MS-Office365-Filtering-Correlation-Id: 602cdd2b-c73c-41a1-fd05-08daf7cf2f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ow95NeUNcJpqD1EVPHkcFspnftCBeZeBYEhIb9v1jE+FqV1YW4Ska8Z+q5GPfUfVvK1cH5Tc1wohZz+jfb/R0JihjKIC43Lp2i6Q9pcxlvlCvEWgatXrDSzKUGqp1ly4z6GN7QxFeVgZ9dQ8FnJUcAOaa5ip13dAd//AhL58V58SoMvgitRmhvyk6GDl+vCGOq30tc9nvfmRZvpWcm6oR2WDiqp3wSPogen/jhVpdsCgh3N6kSH9y4KSjCdmMjUIQgMBaD8yQpDKpNCdHpJrpgeEz563HibnrNW3BFHLJSXukGh+BF6jfOogHy23OmudrlhY9jabW+aF2MyPSWclK7Z08ddMor7JvZt8QfA9VomFvsn1Up/nsznYqI5dhGo93P18+xHWfNZCua2E7NaJQAOwzLk3coometQnw2YegM7ZS1GfOti7Z+g9th92EjCFq6h2p+pTp60A/f1KuOAGrbBLw5D47whwQOId/m8hnSXbTTAWbg2PAsKCp+Q5D8krmASFSCLiRNo3vqc81VXSxwYu/mF3AWHuF+XFptXDgMjjGHAl5XpbzMvMCdFYvBN2L9W03TrAJ0173KbsoY4ijg0cQzLz+jOWL7GzHFvV1Cn3HgLM1hUzG2D2JYPU1lbN0jA5s6+HES8/kRa5BwM3nmNt0DmSfcWhKTN7/LUm0q+xRnFJPmRhzVNbJaDaFC5PlnuMtPPsYGCnggvZxW6ik+9yISquq2BEwXD0yKQE8TOTCbByWJ65hmIAkO5l1haxaNmj9PROUWevq1spALiN2WRwk2jOxmLncOh15LxUUlYarYj8dagJodl2g8KNPGob
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(31686004)(36756003)(8676002)(356005)(86362001)(44832011)(8936002)(4326008)(70206006)(70586007)(4744005)(31696002)(2906002)(5660300002)(81166007)(82740400003)(83380400001)(478600001)(40460700003)(110136005)(6666004)(54906003)(16576012)(316002)(36860700001)(40480700001)(82310400005)(41300700001)(336012)(426003)(47076005)(16526019)(53546011)(2616005)(186003)(26005)(70780200001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:37:24.6753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 602cdd2b-c73c-41a1-fd05-08daf7cf2f1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5151
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/7/23 22:18, Lars-Peter Clausen wrote:
> 
> The CDNS_I2C_DATA_INTR_DEPTH is not used in the Cadence I2C driver. Remove
> it.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>   drivers/i2c/busses/i2c-cadence.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index f58943cb1341..71ea658f4bd3 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -115,8 +115,6 @@
>   #define CNDS_I2C_PM_TIMEOUT            1000    /* ms */
> 
>   #define CDNS_I2C_FIFO_DEPTH            16
> -/* FIFO depth at which the DATA interrupt occurs */
> -#define CDNS_I2C_DATA_INTR_DEPTH       (CDNS_I2C_FIFO_DEPTH - 2)
>   #define CDNS_I2C_MAX_TRANSFER_SIZE     255
>   /* Transfer size in multiples of data interrupt depth */
>   #define CDNS_I2C_TRANSFER_SIZE (CDNS_I2C_MAX_TRANSFER_SIZE - 3)
> --
> 2.30.2
> 

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
