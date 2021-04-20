Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0267A3659E4
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Apr 2021 15:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbhDTNYR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Apr 2021 09:24:17 -0400
Received: from mail-dm3nam07on2075.outbound.protection.outlook.com ([40.107.95.75]:39691
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230479AbhDTNYQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 20 Apr 2021 09:24:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8WXiIQdpSviNq8OCq6Ic9racEPUC4g/Y/wKTrfu1dfaCQxV24ClAEBWUPqaNRVe23nbgkaql42C7ll4ZeomPK31HlYFEPVHC2KfuBg/db+P+6EDJctgzNxqCaKyRGPZybNQojPhQZ1KwEiFm7zmx5RGspw/LqyAnE+TlUeoyERhbvSymTZIxt8WdFhlpuTOqiZgzepbM7BOFtppO33Z67qgA4d/gjjwIN9gWJqy0Z09uW26ch/DD/KWyYk5EowRwwtmgSz0l2odWxPmcLL5BhHrpuo6fSNpF5TqpH4zdtMhAX9yvHCxfcnTyxuIPQKgiBke2AfGNIW0DloBTk9BgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kufzEhFuXE77VO06a9cGj45bqJ0SwW7UZJEUgmPPo/I=;
 b=KdAwinT1T/IBWlVUVMPPl5mDrXW4UrVSA1vdqAAJUDXLT2fIP9Yd8sfxxz+NWfJwiRInDn5CNvK5n7jkcn2nlu40iiq/5pINXUr0DglwBmZdCH9/1cIR67WeaqedHxgmILFVt3hMc1bfl4atPyhrWFobNzrAeLF4gYtfOXlbHZ0NWs5JakA/vUMj/Pa+lCipuJtodRLPO+IBkEMSFs2gE4cWg8xWE4XaDv67fH8KOPEXT126FhoAAUzmPzgvU1Kgxl6jFxAttlh7CAlYFR1Cg7/mc59PTuu4t58+xJCt3Iq2HeMa+zN5QnX8Sxn8SCHkDPdaHwGJRtoFmw0keSNiBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kufzEhFuXE77VO06a9cGj45bqJ0SwW7UZJEUgmPPo/I=;
 b=YiJuBCqp79tQN92XzE786eAVKKcL8yzKBYupaNKRyePjdXIXJColweVvr+682HAByvV0b0d9RrxdmlRF6EoE806zOyQg3Ze5d/knuk88aCc25WOKgUNnOC51GcdsQ4dgK+mG1Ganf8XivvowY8x2KufSN8k6RhiCMx50XY8KemY=
Received: from SA9PR13CA0144.namprd13.prod.outlook.com (2603:10b6:806:27::29)
 by CH2PR02MB7046.namprd02.prod.outlook.com (2603:10b6:610:8c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Tue, 20 Apr
 2021 13:23:44 +0000
Received: from SN1NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:27:cafe::b1) by SA9PR13CA0144.outlook.office365.com
 (2603:10b6:806:27::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.7 via Frontend
 Transport; Tue, 20 Apr 2021 13:23:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT034.mail.protection.outlook.com (10.152.72.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4042.19 via Frontend Transport; Tue, 20 Apr 2021 13:23:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 20 Apr 2021 06:23:36 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 20 Apr 2021 06:23:36 -0700
Envelope-to: linux-i2c@vger.kernel.org,
 robert.hancock@calian.com
Received: from [172.30.17.109] (port=57626)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lYqLo-0008H9-4t; Tue, 20 Apr 2021 06:23:36 -0700
Subject: Re: [PATCH] i2c: cadence: Add standard bus recovery support
To:     Robert Hancock <robert.hancock@calian.com>,
        <michal.simek@xilinx.com>
CC:     <linux-i2c@vger.kernel.org>, Chirag Parekh <chiragp@xilinx.com>
References: <20210415232532.4070366-1-robert.hancock@calian.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <33112554-474c-0740-27b4-42b2f8755daa@xilinx.com>
Date:   Tue, 20 Apr 2021 15:23:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210415232532.4070366-1-robert.hancock@calian.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56aa08d7-5f3c-4232-268f-08d903ff8567
X-MS-TrafficTypeDiagnostic: CH2PR02MB7046:
X-Microsoft-Antispam-PRVS: <CH2PR02MB7046DA786BF274D724B31569C6489@CH2PR02MB7046.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LP4iH3xvsIqCoXIMnbfzfcBOOg9gjDkffvzEmITBJjVCq55E6J+Dl6/Of3DM6ON/1j5zFS6yJGkdw1MbHA/Kdqo7G6cqcS9YGQr31JzXU0OV4mNA10dxJLHj0sRAi2o+IBVD/NHJlPTU4cd5f3qb+ycAq5SyYysjtzIkw7KKUvuCIh0Gu+nHlHaVVVkAWd4tyJY0hZmjH1qwxDV94TYNFEIqDHijKcGV0knOOp3/gCjWnC0uXW9yRftg9GIzo3oED46oFYA3qWrGP5boUzftW187DetiwKxDmex/+l9efSCY/ujgjrGFAPwQGjLoaj3Z4AZohUEzFZNHKEyWzvqQmfa0oPcqJuaUyVk0TMQize1RspDTWY3XZpTya8KhGbawG1EmncObO/hOwZO6JW1n5nIAU/NytCiBGw7jQQUwdj/YdwmZm42uCa5VSkwN6hoipy/jQKSdUtUQQ94x63Z7Aaa+uQUzfZify/UuxAki6XS6XP2qpg+H5UTt8tHggoW34B9B+2p3zx2YrNsGfbg86j94AnonvvljoP7e89mxhSa1BK/hhXVFWpfyAPcXuUluBM1ExV6+Zk88EIfNrl0jZg71udN6x1KQAlZEozpyqADrGn92Rpt+t0BmYyszi9YABNR2m2Zh0ca4RXn1gAsY4aWJvvDRe9VREYYPQph0JnRn2eRTb5RHDU2Cbosz88kKrSx00ckyXuF5Ai7WRBNWsQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(36840700001)(46966006)(36906005)(47076005)(356005)(36756003)(54906003)(31696002)(478600001)(9786002)(5660300002)(7636003)(36860700001)(2906002)(336012)(107886003)(83380400001)(110136005)(8676002)(70586007)(186003)(70206006)(2616005)(26005)(426003)(82310400003)(4326008)(44832011)(316002)(53546011)(82740400003)(31686004)(8936002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 13:23:43.8490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56aa08d7-5f3c-4232-268f-08d903ff8567
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB7046
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 4/16/21 1:25 AM, Robert Hancock wrote:
> Hook up the standard GPIO/pinctrl-based recovery support for this
> driver.
> 
> Based on a patch "i2c: cadence: Recover bus after controller reset" by
> Chirag Parekh in the Xilinx kernel Git tree, but simplified to make use
> of more common code.
> 
> Cc: Chirag Parekh <chiragp@xilinx.com>
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>  drivers/i2c/busses/i2c-cadence.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index c1bbc4caeb5c..d017bc64e759 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -178,6 +178,7 @@ enum cdns_i2c_slave_state {
>   * @clk:		Pointer to struct clk
>   * @clk_rate_change_nb:	Notifier block for clock rate changes
>   * @quirks:		flag for broken hold bit usage in r1p10
> + * @rinfo:		Structure holding recovery information.
>   * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
>   * @slave:		Registered slave instance.
>   * @dev_mode:		I2C operating role(master/slave).
> @@ -202,6 +203,7 @@ struct cdns_i2c {
>  	struct clk *clk;
>  	struct notifier_block clk_rate_change_nb;
>  	u32 quirks;
> +	struct i2c_bus_recovery_info rinfo;
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>  	u16 ctrl_reg_diva_divb;
>  	struct i2c_client *slave;
> @@ -752,6 +754,7 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
>  	/* Wait for the signal of completion */
>  	time_left = wait_for_completion_timeout(&id->xfer_done, adap->timeout);
>  	if (time_left == 0) {
> +		i2c_recover_bus(adap);
>  		cdns_i2c_master_reset(adap);
>  		dev_err(id->adap.dev.parent,
>  				"timeout waiting on completion\n");
> @@ -1212,6 +1215,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>  	id->adap.retries = 3;		/* Default retry value. */
>  	id->adap.algo_data = id;
>  	id->adap.dev.parent = &pdev->dev;
> +	id->adap.bus_recovery_info = &id->rinfo;
>  	init_completion(&id->xfer_done);
>  	snprintf(id->adap.name, sizeof(id->adap.name),
>  		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
> 

My colleague sent pinctrl driver for ZynqMP already. This driver can be
used on Zynq where pinctrl driver already exists upstream.

It looks quite nice.

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
