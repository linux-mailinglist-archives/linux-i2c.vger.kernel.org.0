Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998AC3581D5
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 13:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhDHLbL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 07:31:11 -0400
Received: from mail-mw2nam12on2065.outbound.protection.outlook.com ([40.107.244.65]:20160
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229803AbhDHLbK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 07:31:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnU0tBJnG9J/Dww3qIndkvLcDgoJ2FDcwY2VRy/NCrws5VGpE6tFbs/qY0azmoFIz5PM0kVkwGh9ehhfAJP7QymGInd2cnwSvC2RQooMRKa+uu9abJpxzlBFFpuef5LcAL58l8kbyhAfYZp/2O8bBec2djKXI2l/kCMHOd6MWJvTumx8sYf80ZR5JmIS28NzHhx6SfF0J5hFITKF185ncHPK2wHdAoJhYRs8rB5XLST0phVBBsmx6/HZR/oS1XhbLEtGCRySdn6mjIy3m4T0M9agM7Z5XXgY4hm04848IoHBtcNcOz4T2gjKP7+KusjCSP56WS5c7/FFtVOPAH8zug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j48InzVZ9nW1zYVm/WqxF0hKWUERA6NzYhfbzx0nvoE=;
 b=YT/HHYf+Esb8MOz/RuJX06lKPsL6Bl8h2uoUKtovOrGnNia6wICgr3+ctfcexR9aPYNoI64lsd2Y0pqKZNhLqhn9yQWCzrAoHhcDayluIrfOA2WbVKIpNPs1Q+o2FeWF7Z2FApVYv0wAQfLwxr6pJX1U9d3HY3d046dVhe90OgAEbolMcFZPALIjGP1L0KTwBD/xcuweDEVKdxXaybbS9M0BGhDfSkqJulpLDuZ6bJqOHHE7SQBipdiFhzRxoj09gJ1zYCYTsQ1BoBQgVCl3CLZwIhDIQjeZgi8h5N+knfnUt8KZuZKX+aXAvy4c1EtzL4V8Y/Oko6Y3VEgou1ihWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=huawei.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j48InzVZ9nW1zYVm/WqxF0hKWUERA6NzYhfbzx0nvoE=;
 b=e5AgUpMnOXmttGhTUFRKEl9h9ePoq0mQyUFH+P58yooo+BimUviHWUunBfqPTShlDFAd5QpI/ZvnAQ4xJo/MJTPiQ+KbsUc+PWECInvTnIS+688Lj36ru8KsZe4tI1fs/bJjt/tdWCGcrSuD/520MFJD/g+ggaPKWtMAPvIabhY=
Received: from MN2PR16CA0016.namprd16.prod.outlook.com (2603:10b6:208:134::29)
 by DM6PR02MB6618.namprd02.prod.outlook.com (2603:10b6:5:213::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 8 Apr
 2021 11:30:58 +0000
Received: from BL2NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:134:cafe::e4) by MN2PR16CA0016.outlook.office365.com
 (2603:10b6:208:134::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Thu, 8 Apr 2021 11:30:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT032.mail.protection.outlook.com (10.152.77.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 11:30:57 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 04:30:56 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 8 Apr 2021 04:30:56 -0700
Envelope-to: zhangjinhao2@huawei.com,
 yangjihong1@huawei.com,
 linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 pulehui@huawei.com
Received: from [172.30.17.109] (port=41448)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lUSsC-00084L-Al; Thu, 08 Apr 2021 04:30:56 -0700
Subject: Re: [PATCH -next] i2c: cadence: Fix PM reference leak in
 cdns_i2c_master_xfer()
To:     Pu Lehui <pulehui@huawei.com>, <michal.simek@xilinx.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yangjihong1@huawei.com>, <zhangjinhao2@huawei.com>
References: <20210408112352.211173-1-pulehui@huawei.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <1132644d-4cf0-a620-3adf-08245dd890ba@xilinx.com>
Date:   Thu, 8 Apr 2021 13:30:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408112352.211173-1-pulehui@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31a1a72d-470d-4702-c569-08d8fa81c7a9
X-MS-TrafficTypeDiagnostic: DM6PR02MB6618:
X-Microsoft-Antispam-PRVS: <DM6PR02MB66182D9DFBC30DC6DA93D32FC6749@DM6PR02MB6618.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wPz/toRAJE16X1eorqS3W9ITRipG/+k4ReZStKyEQdR1mXoFJX/tfCf5nJ09HK6hQaeSNYUUi+9PZsPf0Zx97Esy/ZROUWZVoZgKwBeYv2QTmXdg8gIG9jmirlHK0ep35ZurihfnhODTXr+To5zNpJCmbrXRdPbmvayCPhY8YuHe83MgZdpBuURLoAUkLDDrwYshGub9ffHmHDvYhe6h5+V9LM+f23Sf09kSxOezqbjdFqCRFzM47I29GbsvNYFT1f11RbggAiXeVIw9GsJj3HPT8jgGWYctjwYGIxRu5gGUvNvskQksTmPfKFzHAe34SbMstVqcsqPZJ5roTO6Yw9A9vyLEnWXFXiaOWbK6CjAexbN6qUaa1D4A6t1RAqBmXfaK/oEoC8MlLC6vY7+L49TAQ6iNmj197GqREp04h1uFTlOfFpxwhCyU3ZJxP51knyqAnEC3vBZqhuqbYl9Ufd8N1FG6T09BY+YqR0kbfjYl75uw7xLMjorL0msweEKc0lhws1HOHqW/cRwS/TXo0hs3rpyAgyECdxf86DNHzAHn5xxHhbXSB4GKkV7QcxY4ztdg9xyi56GM5fGz5TKvThM1c/vN6zwRQlJquaRVtYYFtt41HllwmnSX7LfPF4aXc2p4yRHGwftXVOI7phFwSzGBCCtX7JSszCt6pNhIA4BK1U0thSUnuEUaDscbmroCGNusCrGUY9fgY/nWvzsMn9xl5nWuY069bPlgS86Oxxc+9Wvr4w8FsYsE70Tr1kWD
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(36840700001)(46966006)(31686004)(316002)(110136005)(2906002)(47076005)(356005)(36906005)(36756003)(7636003)(54906003)(31696002)(82310400003)(53546011)(6636002)(6666004)(8936002)(82740400003)(5660300002)(4326008)(70586007)(478600001)(83380400001)(2616005)(426003)(8676002)(36860700001)(26005)(336012)(44832011)(9786002)(70206006)(186003)(70780200001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 11:30:57.9049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a1a72d-470d-4702-c569-08d8fa81c7a9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6618
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/8/21 1:23 PM, Pu Lehui wrote:
> pm_runtime_get_sync() will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get() to keep usage
> counter balanced.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>  drivers/i2c/busses/i2c-cadence.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index e4b7f2a951ad..e8eae8725900 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -789,7 +789,7 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	bool change_role = false;
>  #endif
>  
> -	ret = pm_runtime_get_sync(id->dev);
> +	ret = pm_runtime_resume_and_get(id->dev);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -911,7 +911,7 @@ static int cdns_reg_slave(struct i2c_client *slave)
>  	if (slave->flags & I2C_CLIENT_TEN)
>  		return -EAFNOSUPPORT;
>  
> -	ret = pm_runtime_get_sync(id->dev);
> +	ret = pm_runtime_resume_and_get(id->dev);
>  	if (ret < 0)
>  		return ret;
>  
> 

Ravi/Shubhrajyoti: Please take a look at this.

Thanks,
Michal
