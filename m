Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 210096A3FA8
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Feb 2023 11:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjB0KrG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 05:47:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjB0KrF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 05:47:05 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::60e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AACC11E9F1
        for <linux-i2c@vger.kernel.org>; Mon, 27 Feb 2023 02:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3USm9uI+fbE2bc09/uJXifY6C8KYN3rkL66BR+1YBIUCGJWgqY/CzjJmSI+VjzeRFuetQUyXqfK5xk3Vp1+NtRdxPrBLjPBIyj94E7Yl8nSomLqDqCGxDuu2mN8ChLnft11I+3+XvrceOlqlSgLFLYqJohoAXQT6p9zZFc/OhyE4y11LOh19D6mbQaTGisn4NlurcCsFGWMsDQwbzCTU7TyLMGwB1N2BoXYK17DJjUWvzgZ/ZRCLlI77Mvb5KhU9ENiKSWE8tO3jtKt1M5XCwIHx4S7N+DMKcz1OZCxfzK07G+si4pAW4hGPok8jC09e/60HHDSwiUMFer6LjR7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRhMwqXEj1byM5FEavQgCJYi4dMr01p38qJb7CKznuo=;
 b=k9jrOOIUuke0EO2YPqeTic/lZTKpC7fbgLQ3HkLtpH/1ogiZoH7n/tsdfgnj9OT9fmLSfH2jm8HqwHgeLJvk/T7DOssK9Z1cAx36uycToyIdMxV6jJql23eRKeuMMUgK54mtUGwP0LmjFUqwODECbQVufmdPgfq4Zph+dBkVm0Ttm/XaLDn3k73egdp7iOyDeBMPRPOi+b5NRIgd7QAXLzYae8RAPRvGNumLCWnPl8T9ZWP/eZ46mlOxb0a1YoA1vQp0NaRKpR995Rv900SCoTx8kPSssHKWbxaEN+JZ7A3NxU4YEwhBlKZZRL8S0x3IMBKMwqAaqYVIH6sWJ/i4Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=metafoo.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRhMwqXEj1byM5FEavQgCJYi4dMr01p38qJb7CKznuo=;
 b=A1YggEg3Z/XwNjMOu9MMHJec5Kd9OIMYa2nRW7iT4jlIei6aJXz9vgi2kRsq+WafMrfp89YkNXgYFoCiKx275nOjD8Imer3hmQ/GTFxiVB+8BZQQudX0SI/eX2gyDCLpS/R8J/+qU0dXsljCRlDo+BPX8bL8nbZtcysSZs4eAGU=
Received: from CY5PR10CA0021.namprd10.prod.outlook.com (2603:10b6:930:1c::25)
 by IA0PR12MB8695.namprd12.prod.outlook.com (2603:10b6:208:485::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.26; Mon, 27 Feb
 2023 10:47:01 +0000
Received: from CY4PEPF0000C980.namprd02.prod.outlook.com
 (2603:10b6:930:1c:cafe::58) by CY5PR10CA0021.outlook.office365.com
 (2603:10b6:930:1c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29 via Frontend
 Transport; Mon, 27 Feb 2023 10:47:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C980.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.12 via Frontend Transport; Mon, 27 Feb 2023 10:47:00 +0000
Received: from [10.254.241.51] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Feb
 2023 04:46:58 -0600
Message-ID: <81a4fd58-ea26-2460-267e-32a91eb37d90@amd.com>
Date:   Mon, 27 Feb 2023 11:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/5] i2c: cadence: Remove always false ternary operator
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
CC:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        <linux-i2c@vger.kernel.org>
References: <20230107211814.1179438-1-lars@metafoo.de>
 <20230107211814.1179438-5-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230107211814.1179438-5-lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C980:EE_|IA0PR12MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 083dcbe8-bbf4-4ad4-671d-08db18aff4d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TVqzxD028M6XImuvFXbVPVyRkiqokJSLO06y832oz8bRe8lvc/0rKwyvvEsQmUfsKwrVtJ4OcyrVpY+I64uurvB0bTUyZRQpenM6N2tXgzHRpA575B5QMrDt6+5WdlBacIB0vGhUcNiqIz+aexpbxljFEgEXGNTeNKLkmJiylRBkF+CPPBgrxWGU3/9lkcBQW0+u8Bi1k12C+i7m4V0z37Lc3vTw9EIoXVxgL8+J17NpKOvaDyI8CNkCkoV8tDz538nOMZVoC80dH3m+VtgVD3BHksG98qEc33tienWePykr53XTRt/Uy5U+hJaa5cTF4ag/GbiplvCnOvD26UdyrGf9Syf0f8Ak2hOlGGzmOuvhXUafp4gvca+KZ3WKGSpyroUvHE5slIIc0N1xwH5yP7Qc/t8zaZVKsyKuqSxrmN9ANykU0bto3k1XEnOgLaP54jX9koNB1OgsBXW8aF/HP/dBtXVnlEYd4LbBKr6GNWO+0pTkxrmEsPCR30mLANVTyhlZP1K5JxVAcJT9Wlt6at34B2I7wrB8wsAvfXHpHJcubGCMkj0B5HrRadD05aTvVw7dKZ6t9w2iUXEN9Igntt3yAnCDG0Kfpn/GqdSiz3MUEMgZapQwor4S8qYvO+K4n2dsfR3w3EMpekXbrivqnDOdlSRmYvsOPntTxTuA7oAYU0zignmVWVlUyzGBRMDSgjJ7lqOyoKE7yplIimSj/wft5UuOqpwi8BADmOTBQvM3qZU0J9vciOOigQNHiRNvti0+i5WhAKfSH4hVatGihA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199018)(40470700004)(46966006)(36840700001)(40460700003)(16526019)(186003)(336012)(82740400003)(2906002)(81166007)(356005)(83380400001)(8676002)(70206006)(70586007)(426003)(4326008)(8936002)(44832011)(5660300002)(41300700001)(36860700001)(40480700001)(26005)(47076005)(478600001)(53546011)(2616005)(6666004)(54906003)(16576012)(36756003)(110136005)(86362001)(82310400005)(31696002)(316002)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 10:47:00.7605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 083dcbe8-bbf4-4ad4-671d-08db18aff4d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C980.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8695
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/7/23 22:18, Lars-Peter Clausen wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
> 
> 
> When selecting the clock dividers the Cadence I2C driver skips settings
> where the resulting I2C bus frequency is larger than the requested
> frequency.
> 
> If the resulting frequency is lower it will compute the error to actual
> frequency. When calculating the difference it also handles the case where
> the resulting frequency is larger.
> 
> Since the resulting frequency is always smaller or equal the computation of
> the error can be simplified by only considering this case.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>   drivers/i2c/busses/i2c-cadence.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index b5d22e7282c2..bec50bfe7aad 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -1030,8 +1030,7 @@ static int cdns_i2c_calc_divs(unsigned long *f, unsigned long input_clk,
>                  if (actual_fscl > fscl)
>                          continue;
> 
> -               current_error = ((actual_fscl > fscl) ? (actual_fscl - fscl) :
> -                                                       (fscl - actual_fscl));
> +               current_error = fscl - actual_fscl;
> 
>                  if (last_error > current_error) {
>                          calc_div_a = div_a;
> --
> 2.30.2
> 

Mani has tested it that's why
Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
