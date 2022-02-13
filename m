Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC1B4B3BA0
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Feb 2022 14:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234956AbiBMN5f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Feb 2022 08:57:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbiBMN5d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Feb 2022 08:57:33 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam08on2083.outbound.protection.outlook.com [40.107.100.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B6E5F248;
        Sun, 13 Feb 2022 05:57:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtImw4cEjgC3XsuiR46JtdHpvk/FUrjzS58sEjKHMYrI7M8h+m+HqW5dp/HdGDKti3APVcy7ZsPto9D+9jm7uirLQtNsWZC31AJ+VlgkuOiyQ1VBjzwWfg3FfxytrWm0KSFJgvl6ZBdLTGawTilF9QqUxElm8hK8yNy5/jeW94nmMfHtvIWKrJK50fT4WiLosxbLaAXSnWkqrWlSqGjVm4CEOpxYZCO/x92ixVepUgF7mgpfhshlA8p+Z/zx58fqx4kNLNAg7/kPkXczHU3KXR6gxDm5gHmui5/QUeQx+rOOa0lLz2fRs1JmqRug7+74mEPDrKECD39LyU0u7TCprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTJppIFz5R52BedZclbOaAG/SU5lv0s2VWPACGcEWZ8=;
 b=n0cxw+qWx0l5w3Gb2JMGoganRrn5XrUVNF89bKy+JbnO3XWOpnwfuGmxCoYgODIWDZFGcXN/1v48NZLS3KW4G8+iTYIJNw/YTrp9ggThcwgEjCMjEeMXWOYH2OB7dv8bzzT/tPS95XUosoThqCFkBK+Z8P7kKVL/vvRK8XOmGwh7aLkIor1ushU2RsNFaVSGTd5L2BnskaWCC8aKu1Dad7RiOmnuqNYB7dsIjHUImYJvdyTVnapwJZ8Y11gBMyiO8G9jjNR7mjD01i69IXwWESsHiQqBSGDOTxmn+HRJwQpqYE+p47Xc2AX7slXDuzxUif7zFHRLCVrlamABmRv3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTJppIFz5R52BedZclbOaAG/SU5lv0s2VWPACGcEWZ8=;
 b=nQdgQFtXS/s779hl1s6fRnNVFmAf4gk8F6DzbtlM5hKDN/Of5nzfiFNyd2+Ztbfa3Tn5lZsWF6saaE2zFPrBcG2KMb8W4VKUZMjclzgmwtl2VFjCFCzzRsNqs27v6qHl+EAia/6zxyxSUiPzTOENIYnm548iIb+wbcUb/CYJkO0=
Received: from DM6PR14CA0072.namprd14.prod.outlook.com (2603:10b6:5:18f::49)
 by BN0PR02MB7952.namprd02.prod.outlook.com (2603:10b6:408:16b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Sun, 13 Feb
 2022 13:57:25 +0000
Received: from DM3NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::7b) by DM6PR14CA0072.outlook.office365.com
 (2603:10b6:5:18f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.13 via Frontend
 Transport; Sun, 13 Feb 2022 13:57:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT016.mail.protection.outlook.com (10.13.4.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Sun, 13 Feb 2022 13:57:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 13 Feb 2022 05:57:24 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 13 Feb 2022 05:57:24 -0800
Envelope-to: wsa@kernel.org,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.254.241.49] (port=40910)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nJFNU-000A0y-K1; Sun, 13 Feb 2022 05:57:24 -0800
Message-ID: <03d29b22-e332-18d2-f0a0-4121dbe28b35@xilinx.com>
Date:   Sun, 13 Feb 2022 14:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] i2c: cadence: allow COMPILE_TEST
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michal.simek@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20220212194549.11021-1-wsa@kernel.org>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220212194549.11021-1-wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6371745-e7fb-4d61-a9d1-08d9eef8c3d2
X-MS-TrafficTypeDiagnostic: BN0PR02MB7952:EE_
X-Microsoft-Antispam-PRVS: <BN0PR02MB7952269DA87735685AD15181C6329@BN0PR02MB7952.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pvKWfrqkvQnBsKF8QfHk1mn2/6LST5WwIVouiCRWVhg7XG3eWxhpSmoIZSAgVSjWwv/TX8qT2p05fLuatDxUNvUIGAnxSqoL+mvDDbfU88MtAf5hHBxogFmz0VITUe0wx9oF+XbKuSqtKgBBWESg47zO+7QQF3CbBxDE++JwlDfa5EfBiakUC0tkabRE1ChWXzqCoj0wSgc8ma6ddtM8Gr9npQQs0iAg7V+gGLfoVHaFmCyrbkT/OOavmIbx629tgctpF8u4P98h/qA1JRZFHgtzkiYHFkGWTpZyFDTCgnrNBjdYbmeY4ed1he8Qdi5egWK8igy9i5NsCILmoJ1wM9/bkGsha+/bH1EK6KtsAAO5mqoRAnmd5o9P6XYyB6A8aHqrg+TbTZEHjwqjfAQ5bBv9SPlT9iCgT/xpzEiCGkvGSRtXXZObiUzg7N2kAhy31Dh1lcboSHLkmsQ0mHUZoeM1pI8XsrtKT6B6rpHlOlCG5wmT2iXbjNv6eYmvi9oNNc9rK1oWmWyI335YkPkHmZUbQeFJ5TBUWRKFh2vO41IqznWNZ9zD+sxZOmLNAMwWeYZgxot/cizq4dwQiJiLDg8v9MvNiA1lgGmZo3OSVdJhT+Q2rX6bKp09RJzXP50xY2NXK4aR1d2BQfDJ11dkXXYNVKvt8nboTnO9S3tsO8M/ayr/8JJX4kBFiktcxNEBDxep83q+FUYmNN+Nm3zTSw==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(4744005)(7636003)(5660300002)(4326008)(36860700001)(2616005)(82310400004)(8676002)(47076005)(356005)(70586007)(70206006)(31696002)(508600001)(9786002)(316002)(54906003)(6666004)(44832011)(110136005)(36756003)(426003)(31686004)(2906002)(336012)(83380400001)(26005)(8936002)(53546011)(186003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2022 13:57:25.3361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6371745-e7fb-4d61-a9d1-08d9eef8c3d2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB7952
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2/12/22 20:45, Wolfram Sang wrote:
> Driver builds fine with COMPILE_TEST. Enable it for wider test coverage
> and easier maintenance.
> 
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
>   drivers/i2c/busses/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 42da31c1ab70..bad2fadc94a3 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -488,7 +488,7 @@ config I2C_BRCMSTB
>   
>   config I2C_CADENCE
>   	tristate "Cadence I2C Controller"
> -	depends on ARCH_ZYNQ || ARM64 || XTENSA
> +	depends on ARCH_ZYNQ || ARM64 || XTENSA || COMPILE_TEST
>   	help
>   	  Say yes here to select Cadence I2C Host Controller. This controller is
>   	  e.g. used by Xilinx Zynq.

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
