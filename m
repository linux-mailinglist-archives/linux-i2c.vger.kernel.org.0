Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0D2666C362
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 16:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbjAPPNU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 10:13:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232097AbjAPPM7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 10:12:59 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BB132536
        for <linux-i2c@vger.kernel.org>; Mon, 16 Jan 2023 07:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5x0c0QVVpefDb32lvPVEjaAHCP6Jqfamtgbjnhtkr9chCwou3jqCZGxji7C3dDGf6+KJOZoLa+rpxdJncZdVszyeiNeJbEAf/bqDAeaAOYXkCLmOzy0iqrLn6AFsVQSR3FdnKc+W1Ij7jz2BAoNMZauirmltX8O6CUfOYVVdU9eqknQUkwZRUFkAmQYUF/t0vHuGotRqBkZRi81YbtWsfG6CnmZ+EU7Aio/CZ8bSScrhQYBZ+v+sBtEqqwM+VSo2qsWPmVnLxd2JNELBhF51gjZwzw10dp+RuM3ehUHfSz4mirXlIlWezpoh5qbRbewr5qcVkPZKv3iENv9SNNOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uqervbWgaWPjSG7Qsu9hFn0wYk2vDkSDtY2XBaPpng=;
 b=XtU1+8WaLg9c4ECSL2mzEfOkUDmlT3Sa4I1sdUUrfRIoinPFNUSkcVtlRUdOOtF94iguq+UNHOyvbHpuPiuOTeF6WllYp3ahHGhTBmUWrIeeP5yLdOww99YpmLXKDipMjm7i6aDATY4Qvn1dVMlzVEYh7sM5C4ZW8R1I6V7I6lPb+p0OP8CPAf6cSDoGWSdtbMKN6tlKlr/BeZ6fGyfaJaAwZPiCg1VWZep83/IlodHFGmH5R0mT5WTVtbCyqrpt4w+2Jjblh3b144y+ccYL9VReNDx6RVwLb6pR34oW1fIMmgaIZirXG7vDxptQysfxXiIjZfagFbcHv5yT52CO6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=metafoo.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uqervbWgaWPjSG7Qsu9hFn0wYk2vDkSDtY2XBaPpng=;
 b=og5hXFBih7XQtC+FWoOtwN6RDHKaSh15joKv1Ocu6mdyzvyKR+VtRnPFt5NCJW1drpyuaSpYkND8E3mTJzJkIzkdqi9myy1JvVLcL85jPa5NEWoBYtO1+8jL8FNnHqK75OI6C3Zx1mBUIyxj8oEIKRS1nStPUuHZuOfckbyWTnU=
Received: from BN6PR17CA0051.namprd17.prod.outlook.com (2603:10b6:405:75::40)
 by MN0PR12MB5930.namprd12.prod.outlook.com (2603:10b6:208:37d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.22; Mon, 16 Jan
 2023 15:00:41 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::cf) by BN6PR17CA0051.outlook.office365.com
 (2603:10b6:405:75::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 15:00:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 15:00:41 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 09:00:39 -0600
Message-ID: <ed2d4a4b-f67f-dec6-5476-959d21be1923@amd.com>
Date:   Mon, 16 Jan 2023 16:00:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT024:EE_|MN0PR12MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f7bdaa-ecaa-410a-5b05-08daf7d26fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D624TBxoMcrC47IBCLjZxvA01xqyh+GwQAfATFUosg5euSB6ESmxMoxjgclsYfCXYbIXzaaWulDBRV0R/Uwdr8OJhoVA6cve7J4r4eJ35rqrrCESF3TrfZv9/VnFKQqcnEHG7642YPsJaBoaJYmPHFyliGliXtHM/BREWOXZfIRI8xUWQI2bZ7xi0J+1TgbdukkoPLs6BIsjyuwFq542+LDN+MfqrZK61lvfYNZ2tg/D/+pfl+bHGpOHCetEMpkPN6OfqkUlsO6EFSJZQ7eb6c/JuDN9bayM8v9elDzkp2QtiJhWgfTfpHZ73tzZGCUULzX64BVNat5wA+WzCgf8uCwXu1xUyuzg2r6llqv3OmCGPhelmeh4u4WvcW2immqIz6JRZ2nwQ6yreLJC4jZERdlbiuHpNHZzFFUx+SrVt7ZiJhAYHLyfD+KK/dhbMEq/q54xnN122Wko+FEBxfpCMMOVJwsaBqhjF/9qDOF5vAcy+4xb9fVYWz1SJnRo9ZuPzNevxEyiD1uqcOfKWZ+iGM6NJI7aQhLUyvzZp+f6xxA0GgSxID5IcMiNGAqeOSnW2lW59SHCyvpwOUL1Mz9pZKGAB/Ed0WQoQRc1rhheEEKZSFZTxuVbXNW1/f2nE3XBFArIkoRvEQdYE3j5399+0UNa7yPutMsR8Rxgk2EozemFYSNoJm+PjBGVdzo6dUuOaav1GJ9ITMcVnWxq2UbDSxQ6mrbtLWTcgYkYrr+dMv0Gh0t/HrhV01tmYQR7sRC2b61tWu0WlEoTOhw7A0ke2w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(36756003)(336012)(8936002)(2616005)(5660300002)(53546011)(82740400003)(426003)(47076005)(186003)(26005)(86362001)(110136005)(6666004)(16576012)(54906003)(316002)(82310400005)(478600001)(81166007)(40480700001)(70586007)(8676002)(356005)(70206006)(16526019)(40460700003)(4326008)(41300700001)(31696002)(31686004)(36860700001)(83380400001)(2906002)(44832011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:00:41.5095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f7bdaa-ecaa-410a-5b05-08daf7d26fb3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5930
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

Shubhrajyoti: Please check this patch.

Thanks,
Michal
