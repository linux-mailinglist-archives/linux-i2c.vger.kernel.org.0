Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F04569D4D
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 10:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235382AbiGGIQz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 04:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235242AbiGGIQd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 04:16:33 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94F85071F;
        Thu,  7 Jul 2022 01:15:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCfy89G6St4rg3UyMtbJ5233E89rdMegUUdR3qN2woCwzWsidsLP7H2AnITbseI4Vtdj5518mDcF78mIyDrnvx/rGVQujtemouCVWaJES+gLaCiKayR85rOQiOo86LaZIRkCqDJWEYdWsMmeGCiHKYEpBMex2vUOtCyrkY92ZRRPxkUbDMeDk3pznryEeKBGlaOSP+Ai3Fs71bBO7+6RLAeDlb72Dy6rGIhyc9yup+hDHMdp9YF83eF9jXB36s6ccsr24DtI49b7cZcBZKzJIw+Fd6+p2D4Vibz+ncUY8Wcl5dTYkQzK65X5Xv7BRipcz8GSKTun6ZFiHOa2brslOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSwIO1DfwDsTU2l4JOpoy0+t0fI2cpe+Jn3IrS/ssTA=;
 b=WVFIe6kP6CXvWj9eKrQgMiWBzu1MFInfqJl20ojTXkHymK0EemlnF3zChHy17NAabFxxEBi59jQCwVcWs3als8DYb3uHpBMeg4EZKZ2ZiL5xHvx7AcrWEbPlTx4pL0MGeP97MagLHmaBgc7vapNOLdv7p63MTo9x6KoTM8xsOV9p7G2t/QBnguxrj4/IgOnzH927WNp4bLCTUFrfnYO4MbjNvr9JFSrthBAQmdsjjjEcvuePA5KFrxA6z6FLhbIrbD3hwDdWoKINbZodchP5hUN+p0vvULt4YRgad3u7uK/ZKb3OCa3zuPamigKEytkd2M6YHDvlWfzTtPf/RJ0MBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=getcruise.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSwIO1DfwDsTU2l4JOpoy0+t0fI2cpe+Jn3IrS/ssTA=;
 b=UfCx1DYwZbcOBjG992eARdSw198/VHiFCUXn3/ce9laykrrqwKcObqJPIKje3tz8f2wKwHRXAYrq1SWHSDHr/lERZRvOjOWqN2Wd56337L7yVqurUd8O8J/t3o5O/rW6ZhPWb+mpR92UVFyeqpMHoIA0v2Rb1/f91TXVM/3J5AA=
Received: from DM6PR11CA0003.namprd11.prod.outlook.com (2603:10b6:5:190::16)
 by BN8PR02MB5809.namprd02.prod.outlook.com (2603:10b6:408:b6::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 08:15:00 +0000
Received: from DM3NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::da) by DM6PR11CA0003.outlook.office365.com
 (2603:10b6:5:190::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 7 Jul 2022 08:15:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT059.mail.protection.outlook.com (10.13.4.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 08:15:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 7 Jul 2022 01:14:59 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 7 Jul 2022 01:14:59 -0700
Envelope-to: satish.nagireddy@getcruise.com,
 wsa@kernel.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 lars@metafoo.de
Received: from [10.254.241.52] (port=57320)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1o9Mf5-0001sp-Jh; Thu, 07 Jul 2022 01:14:59 -0700
Message-ID: <588bf9a5-a2c3-b5bc-3ef1-d5ef3405d005@xilinx.com>
Date:   Thu, 7 Jul 2022 10:14:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] i2c: cadence: Unregister the clk notifier in error path
Content-Language: en-US
To:     Satish Nagireddy <satish.nagireddy@getcruise.com>, <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <michal.simek@xilinx.com>, <lars@metafoo.de>
References: <20220628191216.39459-1-satish.nagireddy@getcruise.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220628191216.39459-1-satish.nagireddy@getcruise.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d87a6cb-efc0-4dc7-931b-08da5ff0c99a
X-MS-TrafficTypeDiagnostic: BN8PR02MB5809:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Vf1eYQV528ecEgIQxUZNhlXliGrGGb+IAxKtSHrJm/kKDVxw/2J+dxDA78pW6yatEcJC637zEbQVL4xeDy+82kB83O80oIluGYOQeHmzUZRISETLZa4lH9RrgghgRSZQeapZhoMJ8pwL8e5ObVcCs2lOUOXwlwwiemEVHYcGU+DOjgwmwsmk6NYYoBXKZJB7jdoFvCH6dJyBU5iiQMUkBzHAOxnuZA6G0XkDkjEJ4iVjHYXg7RN6V7hpfMwDM9NZUMahETG3exZHZI17vJvfmcyNUnP3VOpZ9dUDmo2H6/Gzkz9qDNIkdYi9JV8omExE6vC+1lAApOmNkppXyMYJzhCw6zkk01aSS399sB4u/vvxnPKnzsVI3X6AFNyNnFkjcR+nxWJ8Kz8JR4UsoDrVIAZoyQ8xiCxNkhcXvum7l1a4tI4X3Rj45hcRA6aWClO7XXaaNuktLofvJNa0QSZMF2xF8WoNGLpd5JhXHmhXJiTKi4+BNS/JvPNZaX8d5SjIxeLZ+qa7At5BfkcOsfTgxS4Fjz5XK1yXZnxrLloiIV4ayMivKkK5vs9hBdM/y+GlK+LGm+E4Q6bT1VZzFta4MF2ji1saPnft1+U+tkribSp7IBIMMjYFqMrM4RG3NaWWtIagzBLHZQlRx2La45hPiawarC6v/918JHWreMBnImBrChzpaA/G9aS9ZAMw7lkA0bm2nfS8ZCOZraI2mUsaRkrGKVElWGITY98qWqvKytwLzzoA/aqF1+kBG2lp636lKtbaHea3UNIwZ53jWb2UZTV74ONbbX6H5mKv9QdCAJHnm1HW09ktJw/sKrCUiRxpgGvAm1yX5Q7Prw7zyZ5nSyAUw4q5Nowy7pYmAKXR6W+NFJAvGJt45q8YL/e3YGj
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966006)(40470700004)(36840700001)(2906002)(478600001)(83380400001)(82740400003)(336012)(82310400005)(40460700003)(356005)(47076005)(31696002)(426003)(2616005)(7636003)(31686004)(41300700001)(4744005)(70586007)(8676002)(36860700001)(53546011)(36756003)(316002)(186003)(40480700001)(8936002)(44832011)(4326008)(9786002)(70206006)(5660300002)(54906003)(110136005)(26005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 08:15:00.4549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d87a6cb-efc0-4dc7-931b-08da5ff0c99a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5809
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/28/22 21:12, Satish Nagireddy wrote:
> This patch ensures that the clock notifier is unregistered
> when driver probe is returning error.
> 
> Signed-off-by: Satish Nagireddy <satish.nagireddy@getcruise.com>
> ---
>   drivers/i2c/busses/i2c-cadence.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index b4c1ad19cdae..3d6f8ee355bf 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -1338,6 +1338,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>          return 0;
> 
>   err_clk_dis:
> +       clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
>          clk_disable_unprepare(id->clk);
>          pm_runtime_disable(&pdev->dev);
>          pm_runtime_set_suspended(&pdev->dev);
> --
> 2.36.1
> 

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
