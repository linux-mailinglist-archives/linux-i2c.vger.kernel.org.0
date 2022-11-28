Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E24E563A684
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 11:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbiK1K7e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 05:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiK1K7a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 05:59:30 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DE3DF81;
        Mon, 28 Nov 2022 02:59:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MB07fr9Hdw19dON9gPv5os5w3/isXGhLmRR1HMFUEzAmM/BNz1Q1sk1Tu8j3bZOYOOSFFrNmSZs8AURKiJzVQUZo5VNilqVYGJlvrIDA8gZlu6rJt8ei29U2kqE/u7kzDJ7brA8iqy+jF9Cjcuyu4NaYDeUP5ODJAkN0j7FHE6w/tiiqjc5is7dz8zr0tbuC84EEDQPY6ebszSiO1c1naJy9hI9jhXlWe0szvbZAd1pDDmzh6Sqrq19cYMfwky5i9tNSaO5rtFMMAEjDuPcn52faQRljzLUQdY9suIGF1kUcW+TPf6bvSwpnn+S4y2uBAPW9WKjiWsRzmkzytl0iBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AL3p0jBC1PTvUM8neMFN/j8zbiHZz6cBVYB5Zd+FU/Y=;
 b=C/8qOPDV47lEAQmD739HMJTd2CPjzmNFx2LCOl17SzekqvNYn6jOjdnqij8KVJX1GF0PbVb5/1d4jBj4G9dz4tmlJJfL3x+7pahUAlF2XE7I9wwFRbMjDlDiFWcfm9ccCc+Oq4Du8frKFYzK6iRVgngxeZsLsGLFTvPJS2Lo/+/uhPdR5UmubLAsW3D2CZ0KiRJ7RfOIAYmbmtxOYGUN0doaMB2I3K0SA6AvmbesWSIFWm/qRL7B6QqH5J2bYd+cdsXosUVGHPGmpgFl4tA45HAnCsDlDnMdv7BZUxad2Ol0iOCnitEp1agH0nh5Wj7rEsqO4NIbw0EFT27aAePLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=foss.arm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AL3p0jBC1PTvUM8neMFN/j8zbiHZz6cBVYB5Zd+FU/Y=;
 b=l5hYiJh7/08m3UmMKuG07q6uX4tr1qHiIqD3EUIwlRewDfHBhhtfKm3D8pqK6o5rxv/3DnXasCa46XXLim9qq0K3hpBfHj8oWxqHnk+IoPpl7/R8wYluw9fyqzYXkbfLI18EbBAXfTg1LErsa98LLNReA5uxJNg+YVVOXezeObc=
Received: from DM6PR12CA0001.namprd12.prod.outlook.com (2603:10b6:5:1c0::14)
 by DS0PR12MB6557.namprd12.prod.outlook.com (2603:10b6:8:d3::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.22; Mon, 28 Nov 2022 10:59:27 +0000
Received: from DS1PEPF0000B074.namprd05.prod.outlook.com
 (2603:10b6:5:1c0:cafe::49) by DM6PR12CA0001.outlook.office365.com
 (2603:10b6:5:1c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Mon, 28 Nov 2022 10:59:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000B074.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Mon, 28 Nov 2022 10:59:27 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 04:59:17 -0600
Message-ID: <a885977a-bfdf-fe1c-8f33-732b18f5abec@amd.com>
Date:   Mon, 28 Nov 2022 11:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] i2c: cadence: Fix regression with bus recovery
Content-Language: en-US
To:     <carsten.haitzler@foss.arm.com>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        'Wolfram Sang' <wsa@kernel.org>
References: <20221128105158.1536551-1-carsten.haitzler@foss.arm.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20221128105158.1536551-1-carsten.haitzler@foss.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B074:EE_|DS0PR12MB6557:EE_
X-MS-Office365-Filtering-Correlation-Id: 03059821-effb-4c08-0371-08dad12f9e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Im/sPZcmAna0+ljKr+gXXpX2dmwsERd35snwJiC/0e8sjIdO4RzS3bILPDn84E6Zk9NDQDLt70DOYsfSEs+6wPBaUQmIcUFge6UHlx5uvxrdbfiJsWz1qrkjbcC8iOAh4ZUX2xzKqlYQ9RvxCzd+dmDCu/KI4+7oq/qlrLpK/FMvqWxRSbiLpuGVCAYWDXzIBV3iHyc5XWt65Fx1aaqcTpv1SbFYwiljKz4qE5Nstq4GfqPuzN3n3bnKyrwSdR7iDgmp00qrxE1vAP913H7u9ShTTO3llB+Q5350/l0CUSClIPPTm69CzhcOLtfp67VafQ9SdKeNozOEtYYZJjhLrvX+f5Lml3vR7dpnmYPCf3hKNqClTVfq42XkqpkcXQ689MTY719oK6QzbwJIxoyTo6LYIf44iEawyZLAFdaKDh4BSqy22LESsslGhH2xxfi/moTvE5C11nI9mm+AWOdgDcScG+UTyWKe+MLYGA2mlpjtM80cp//Bdi9hPWNczQ1xRqpOlaN8/1cHwXkKwauoo5oiKwWjzpQUb8e2Urowg0vhM3CBRMSUkH2rSuYlIrd3RZGG5f1GKdXLXTkNqxFk7d/5ikP2C5FvkFBo7K40Zpti6N4QB3yVvYNgrhbBgNar7bkiyO6WxZg1ltXExQCrW8HQbVDEbO2UiIH8LD7P0gG5FDYYmWawrmmxT3TQ+shXMakwYga1wLa0eZVc3LpSrdJv8I3CKpm9q0l/UTyjXKCh5Fit5QpEFTSxmA0xEfkHZEXT4gbyKRgndtjLLH8gizeQfwvvvbpSq3YM9YCtXu4MFMOXymXGcnip2uopOcW
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(186003)(81166007)(16526019)(356005)(2616005)(41300700001)(2906002)(966005)(82740400003)(40480700001)(36756003)(8936002)(83380400001)(86362001)(6666004)(31696002)(44832011)(40460700003)(110136005)(426003)(82310400005)(47076005)(336012)(316002)(16576012)(53546011)(31686004)(26005)(8676002)(36860700001)(478600001)(70586007)(5660300002)(70206006)(36900700001)(2101003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 10:59:27.1934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03059821-effb-4c08-0371-08dad12f9e1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000B074.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6557
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Wolfram,

On 11/28/22 11:51, carsten.haitzler@foss.arm.com wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
> 
> 
> From: Carsten Haitzler <carsten.haitzler@arm.com>
> 
> Commit "i2c: cadence: Add standard bus recovery support" breaks for i2c
> devices that have no pinctrl defined. There is no requirement for this
> to exist in the DT. This has worked perfectly well without this before in
> at least 1 real usage case on hardware (Mali Komeda DPU, Cadence i2c to
> talk to a tda99xx phy). Adding the requirement to have pinctrl set up in
> the device tree (or otherwise be found) is a regression where the whole
> i2c device is lost entirely (in this case dropping entire devices which
> then leads to the drm display stack unable to find the phy for display
> output, thus having no drm display device and so on down the chain).
> 
> This converts the above commit to an enhancement if pinctrl can be found
> for the i2c device, providing a timeout on read with recovery, but if not,
> do what used to be done rather than a fatal loss of a device.
> 
> This restores the mentioned display devices to their working state again.
> 
> Fixes: 58b924241d0a ("i2c: cadence: Add standard bus recovery support")
> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
> ---
> Note: This issue was discovered during the porting of the linux kernel
> on Morello [1].
> 
> [1] https://git.morello-project.org/morello/kernel/linux
> ---
>   drivers/i2c/busses/i2c-cadence.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index fe0cd205502d..09acd2d399d5 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -852,7 +852,8 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>                                           CDNS_I2C_POLL_US, CDNS_I2C_TIMEOUT_US);
>          if (ret) {
>                  ret = -EAGAIN;
> -               i2c_recover_bus(adap);
> +               if (id->adap.bus_recovery_info)
> +                       i2c_recover_bus(adap);
>                  goto out;
>          }
> 
> @@ -1263,9 +1264,13 @@ static int cdns_i2c_probe(struct platform_device *pdev)
> 
>          id->rinfo.pinctrl = devm_pinctrl_get(&pdev->dev);
>          if (IS_ERR(id->rinfo.pinctrl)) {
> +               int err = PTR_ERR(id->rinfo.pinctrl);
> +
>                  dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
> -               return PTR_ERR(id->rinfo.pinctrl);
> -       }
> +               if (err != -ENODEV)
> +                       return err;
> +       } else
> +               id->adap.bus_recovery_info = &id->rinfo;
> 
>          id->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
>          if (IS_ERR(id->membase))
> @@ -1283,7 +1288,6 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>          id->adap.retries = 3;           /* Default retry value. */
>          id->adap.algo_data = id;
>          id->adap.dev.parent = &pdev->dev;
> -       id->adap.bus_recovery_info = &id->rinfo;
>          init_completion(&id->xfer_done);
>          snprintf(id->adap.name, sizeof(id->adap.name),
>                   "Cadence I2C at %08lx", (unsigned long)r_mem->start);
> --
> 2.32.0
> 

Acked-by: Michal Simek <michal.simek@amd.com>

Wolfram: up2you if you want to take it for 6.1. If it is too late I think it 
should be labeled as stable material for 6.1.

Thanks,
Michal
