Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153DB1DE54C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 13:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728705AbgEVLZH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 07:25:07 -0400
Received: from mail-eopbgr690043.outbound.protection.outlook.com ([40.107.69.43]:42414
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728281AbgEVLZG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 07:25:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrnFJdmqQ3gGZvzSL1/WKpEp1u+BZDbv09EUzrUMq4QyQMLO8N3ozey08/cDM6ytL2Ha/XM++JWp8Cs3QlJpKG95JpVhjCAnMmlY3pPYIC9f3l8w8QMbL+d9QfRoEJu6VeO1yxrbqJSEMHtLkPSz/885DGBDV3m8oRRTzMuiL8/RTV4Jp8kI5zSu3bzxYc2l97XKR1qQ8VGXqOLULtdcWOFv0/JwsDiW4puHJyDccklyhRjPHZkeQNeFIrivZKpFKfVUa7dMm2845WIKZ2WIKYP3cBKk52JJb3AD53a4wv/vlSV1Qok40B3LVSlaJsPU0t74D8n3+sgrVjg2jfFVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ra4HqrdzQB2RSWlV1sHNFCuOXsxxzUFvmVwh5UROu14=;
 b=liJ/p/7CsaCNwv8fOaCB6UXJHlfY2/5yr2MubmaGb0c3XS1JBS+K/eC3gXYLbvh42B+wnZ+UuW/sMOL0TEi+zbTvTXtw0SyyJ9rhibQZVjz/B/dSBUFgMbCuzB3KSgxF7V4wgk0bukeVFSaWZNWVUdivrdpr1TsY/KNx8/NM1p0nR3E7VDLvoSkpUhLXSFghyxeEAObn91fGBrPkkMXdHAQAmrMNEP80jlUB6Hwayeffppac1oHD3MvofqN7KYDErrAA/nMKagsfXIh5ADYtFuwLWR9+fKq3hmb0NzDmsD0mz9Hfzi4bmp7YkgciFx2fFP3YZpMSmtRLjm2uZUhNHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ra4HqrdzQB2RSWlV1sHNFCuOXsxxzUFvmVwh5UROu14=;
 b=n2KMs04rDG1XrkIDrqA3HCJ4tW4Ujp9gW4c58IF/nwss29pyluOMBQXW26ruIh6O78VeiWFY5AN/wIWA/+BRn5tgH2/5kd4DhCorsPdHruB8AqQNVAE7ZvnnUAZAzHCRqyX03TyKU/wbJvP7OluQar/jKfCTeHj8xUUQkoQll44=
Received: from MN2PR05CA0009.namprd05.prod.outlook.com (2603:10b6:208:c0::22)
 by BYAPR02MB4312.namprd02.prod.outlook.com (2603:10b6:a03:5d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 22 May
 2020 11:25:03 +0000
Received: from BL2NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:c0:cafe::fc) by MN2PR05CA0009.outlook.office365.com
 (2603:10b6:208:c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.7 via Frontend
 Transport; Fri, 22 May 2020 11:25:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT035.mail.protection.outlook.com (10.152.77.157) with Microsoft SMTP
 Server id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 11:25:03
 +0000
Received: from [149.199.38.66] (port=39480 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jc5mz-0001mz-Dp; Fri, 22 May 2020 04:24:33 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jc5nS-0006tH-TT; Fri, 22 May 2020 04:25:02 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04MBOx4U006430;
        Fri, 22 May 2020 04:24:59 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jc5nP-0006mv-Fa; Fri, 22 May 2020 04:24:59 -0700
Subject: Re: [PATCH v2] i2c: cadence: Add an error handling for
 platform_get_irq()
To:     Dejin Zheng <zhengdejin5@gmail.com>, michal.simek@xilinx.com,
        wsa@the-dreams.de, harinik@xilinx.com, soren.brinkmann@xilinx.com,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20200520144821.8069-1-zhengdejin5@gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <2d99f043-f854-8975-86ee-2f0ba1382275@xilinx.com>
Date:   Fri, 22 May 2020 13:24:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520144821.8069-1-zhengdejin5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(39860400002)(346002)(396003)(376002)(46966005)(2906002)(70586007)(81166007)(316002)(9786002)(47076004)(70206006)(336012)(8936002)(44832011)(2616005)(36756003)(82310400002)(356005)(4326008)(5660300002)(186003)(31686004)(82740400003)(31696002)(8676002)(426003)(478600001)(26005)(42866002)(43740500002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50ca25e3-7031-4ff1-2363-08d7fe42c5a7
X-MS-TrafficTypeDiagnostic: BYAPR02MB4312:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4312EF697B5F547510B19AF7C6B40@BYAPR02MB4312.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UIuhwoDpIkfA1vvfUuSgOuR9yqJEFmDaS80dc7ct6kLY92YOBMHsEVdnUDCtmi0AehTNkfN2E9OguKe1Y15zYOJ5r5HlREFzNGulOy4Vph7/bpN7ymwRaAF7Dy3H5pQx7KyX6noKikOYqmzc+j8321JFIg6l28mhYqx/HjnR3LuaVbhLE5KYzz63rAGarlmgc339NNRAFWUX1sdEgN7KnRWGSdFCZYTJp+f4lqP5eVlvJ2W6wlnUSeN0bZYdHUps3E8mcS4oXLiHKV2437qkKRU6KYPboDFXG2OpNuFA+aGWcM3u1r5F4iAo3pa1YmeiX4xI/p+pbu+zKgSNUV0J7sBlhSBDaj07eWgMR2zHRzCMt8tjrSkIdlm5dQuXejWYoR1e/HrfEGu/WeweY3QfXVVGOAf+F7xoZDNdAactZS30/MBkKrzl9RGaCPJQKdpHP9a6culQ8e8baiXeVJtHew==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 11:25:03.3446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ca25e3-7031-4ff1-2363-08d7fe42c5a7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4312
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20. 05. 20 16:48, Dejin Zheng wrote:
> The driver initialization should be end immediately after found
> the platform_get_irq() function return an error.
> 
> Fixes: df8eb5691c48d3b0 ("i2c: Add driver for Cadence I2C controller")

I wouldn't really consider this as bug. Driver is likely not failing
when irq is not defined. It should just fail later on when
devm_request_irq is called.
Or is there any other issue with it?

> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v1 -> v2:
> 	- add Fixes tag.
> 
>  drivers/i2c/busses/i2c-cadence.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 89d58f7d2a25..0e8debe32cea 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -912,6 +912,8 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>  		return PTR_ERR(id->membase);
>  
>  	id->irq = platform_get_irq(pdev, 0);
> +	if (id->irq < 0)
> +		return id->irq;
>  
>  	id->adap.owner = THIS_MODULE;
>  	id->adap.dev.of_node = pdev->dev.of_node;
> 

The change is valid but the question is if make sense to do it in this
way. Some drivers are using devm_request_irq to do do job.

For example:
 	id->irq = platform_get_irq(pdev, 0);
        ret = devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
                                  DRIVER_NAME, id);
        if (ret)
		return ret;

But I am also fine with solution above where you fail in quickest way.

Without that Fixed tag
Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
