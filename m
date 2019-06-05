Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E468D35F05
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 16:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728181AbfFEOTF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 10:19:05 -0400
Received: from mail-eopbgr770077.outbound.protection.outlook.com ([40.107.77.77]:52450
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728127AbfFEOTF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Jun 2019 10:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfJQTLP8DF/gl6bBIV0D9ozEbkU4mvSVbKau+uAereQ=;
 b=KKKTiDMO33eaKPHC47PMrYoYuyNJSJRgN0k/M9KsaQqAYzyBiNGvclHdLWXXkpSKFljB6yZyzDlDoHHnGNzJJq1iI8PwUxy9yA4uLLQ/dNggDJwREePbG7V9IPclfkDoYnpmI9Pd5OzB7FRD47IfFKx0HNCBh8LUbjjAsZCxk7Q=
Received: from BN6PR02CA0044.namprd02.prod.outlook.com (2603:10b6:404:5f::30)
 by CY4PR02MB2677.namprd02.prod.outlook.com (2603:10b6:903:11a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Wed, 5 Jun
 2019 14:19:02 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::201) by BN6PR02CA0044.outlook.office365.com
 (2603:10b6:404:5f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.14 via Frontend
 Transport; Wed, 5 Jun 2019 14:19:02 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; sedsystems.ca; dkim=none (message not signed)
 header.d=none;sedsystems.ca; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT034.mail.protection.outlook.com (10.152.77.161) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1965.12
 via Frontend Transport; Wed, 5 Jun 2019 14:19:01 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hYWkm-0001lD-TH; Wed, 05 Jun 2019 07:19:00 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hYWkh-00073h-Px; Wed, 05 Jun 2019 07:18:55 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x55EIpek027850;
        Wed, 5 Jun 2019 07:18:51 -0700
Received: from [172.30.17.116]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1hYWkd-000735-Af; Wed, 05 Jun 2019 07:18:51 -0700
Subject: Re: [PATCH v2] i2c: xiic: Add max_read_len quirk
To:     Robert Hancock <hancock@sedsystems.ca>, linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com
References: <1559685351-25249-1-git-send-email-hancock@sedsystems.ca>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <f1a679b1-71e7-c260-0f38-c617d906b7a2@xilinx.com>
Date:   Wed, 5 Jun 2019 16:18:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559685351-25249-1-git-send-email-hancock@sedsystems.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(39860400002)(136003)(376002)(396003)(2980300002)(189003)(199004)(229853002)(64126003)(31686004)(356004)(50466002)(107886003)(2906002)(65826007)(63266004)(6246003)(230700001)(4326008)(47776003)(76176011)(65806001)(336012)(126002)(486006)(65956001)(58126008)(9786002)(52146003)(44832011)(316002)(23676004)(36756003)(476003)(5660300002)(31696002)(2486003)(106002)(186003)(8676002)(70206006)(11346002)(446003)(26005)(81156014)(81166006)(426003)(70586007)(478600001)(8936002)(2616005)(77096007)(305945005)(36386004);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR02MB2677;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cd7453b-235b-4225-faa2-08d6e9c0c1ef
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:CY4PR02MB2677;
X-MS-TrafficTypeDiagnostic: CY4PR02MB2677:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB2677D7CF002570EEFC86672FC6160@CY4PR02MB2677.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 00594E8DBA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zwAE7rH/f18kpn/nPWNsq8DdereNqvB1n7CBiNJeg4S3wYjLkJnR9jV3fS+2syFaIsfJjbtEwPe9J9GpIcdZTU9r238t0H0EeIZLLSpFN1kt3SJEGUnGCnXV8yO5ZfLxk02ZK0VR4w7/6aio02WBZfskEBzfuUBdvjcGxMGkRbWWuw7kt4u/B0msfMCp1045P4pTxpyGZfs3EPufLCzhVJ5vXwzvMHbCnX+UHVCRxcu+c7UmO8Vz1LPi6iEPpfE190HGacwWVBeaarIqbizOBi9idM3rKhgV6qFHS6AeLODWQTc9FRoKv87GrHtp+d4Rm9T+yJk+qiZB57ZMeFx9Ws3UVtYcrt2yGv+IdmN/K5KWA8JXELMlAbl9l65DrniNchohWn/GnNm9zl1xSq+fico41LXIeZ4a+/1s+S4OR8Y=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2019 14:19:01.4515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd7453b-235b-4225-faa2-08d6e9c0c1ef
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2677
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04. 06. 19 23:55, Robert Hancock wrote:
> This driver does not support reading more than 255 bytes at once because
> the register for storing the number of bytes to read is only 8 bits. Add
> a max_read_len quirk to enforce this.
> 
> This was found when using this driver with the SFP driver, which was
> previously reading all 256 bytes in the SFP EEPROM in one transaction.
> This caused a bunch of hard-to-debug errors in the xiic driver since the
> driver/logic was treating the number of bytes to read as zero.
> Rejecting transactions that aren't supported at least allows the problem
> to be diagnosed more easily.
> 
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
> 
> Changes since v1: Added more rationale in description.
> 
>  drivers/i2c/busses/i2c-xiic.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 0fea7c5..37b3b93 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -709,11 +709,16 @@ static u32 xiic_func(struct i2c_adapter *adap)
>  	.functionality = xiic_func,
>  };
>  
> +static const struct i2c_adapter_quirks xiic_quirks = {
> +	.max_read_len = 255,
> +};
> +
>  static const struct i2c_adapter xiic_adapter = {
>  	.owner = THIS_MODULE,
>  	.name = DRIVER_NAME,
>  	.class = I2C_CLASS_DEPRECATED,
>  	.algo = &xiic_algorithm,
> +	.quirks = &xiic_quirks,
>  };
>  

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Nit: The same limitation is there for write. Maybe worth to also set it
up. Anyway this can be done separately.

Thanks,
Michal
