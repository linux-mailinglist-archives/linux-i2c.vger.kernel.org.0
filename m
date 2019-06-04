Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29F6F33EF1
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 08:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfFDGWz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 02:22:55 -0400
Received: from mail-eopbgr680085.outbound.protection.outlook.com ([40.107.68.85]:29313
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726595AbfFDGWz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jun 2019 02:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmQE9gjXsfgo54l5y1C7O063/zDxInvt8HEJ3Wa7qMs=;
 b=ISW8pfQYNkxwqW+s6dI91Rpjn1JHwVTJNBKpkRHtgTCAMimuXZbDcwqjd/tJt0VI0jgBfwtZ3HQ3uVtvLxEkkgqMrHy1u7lpBNMxlPAV52187Yubo5hFlcRK1nQrOTTzvcPsS8cxGZvspvtBdZwCsWkGug5f3MLAzTv7lsC1bJE=
Received: from SN4PR0201CA0003.namprd02.prod.outlook.com
 (2603:10b6:803:2b::13) by DM6PR02MB4937.namprd02.prod.outlook.com
 (2603:10b6:5:11::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Tue, 4 Jun
 2019 06:22:52 +0000
Received: from CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::207) by SN4PR0201CA0003.outlook.office365.com
 (2603:10b6:803:2b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.16 via Frontend
 Transport; Tue, 4 Jun 2019 06:22:51 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT014.mail.protection.outlook.com (10.152.75.142) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1943.19
 via Frontend Transport; Tue, 4 Jun 2019 06:22:51 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hY2qR-0000AC-0b; Mon, 03 Jun 2019 23:22:51 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hY2qL-0001Mq-TW; Mon, 03 Jun 2019 23:22:45 -0700
Received: from [172.30.17.116]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1hY2qG-0001JD-5e; Mon, 03 Jun 2019 23:22:40 -0700
Subject: Re: [PATCH] i2c: xiic: Add max_read_len quirk
To:     Robert Hancock <hancock@sedsystems.ca>, linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com, Shubhrajyoti Datta <shubhraj@xilinx.com>
References: <1559604825-23517-1-git-send-email-hancock@sedsystems.ca>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <abfb762f-115a-7607-f228-923db07f551e@xilinx.com>
Date:   Tue, 4 Jun 2019 08:22:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559604825-23517-1-git-send-email-hancock@sedsystems.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(396003)(346002)(376002)(39860400002)(136003)(2980300002)(199004)(189003)(356004)(81166006)(81156014)(8676002)(305945005)(107886003)(4326008)(36756003)(230700001)(106002)(47776003)(76176011)(2486003)(52146003)(23676004)(36386004)(316002)(65956001)(9786002)(44832011)(65806001)(58126008)(6246003)(486006)(64126003)(2616005)(336012)(446003)(186003)(8936002)(77096007)(478600001)(2906002)(26005)(229853002)(126002)(63266004)(5660300002)(476003)(426003)(31696002)(31686004)(65826007)(11346002)(70586007)(70206006)(50466002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB4937;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdea28d0-f5e4-42bb-5c53-08d6e8b51279
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:DM6PR02MB4937;
X-MS-TrafficTypeDiagnostic: DM6PR02MB4937:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB49379744CDA8838748AD929EC6150@DM6PR02MB4937.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-Forefront-PRVS: 0058ABBBC7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: o59pmgJLC5Md2C8PA3eUGIEG8rdWL8W6bqr2jG3ldT7EHkm7eSB2kOQG08UCG5SyR8Lc3BGq8gW2inOONgGFGpemFLE6mlMRGHa/OuOePDrWT6gI6PjDPFQ0LwP1LUrtErtIQQ5NVR7sB73R52DIfHj+mgiigv7mDLlA3EvGIYB1vP7ayy/hCxH6eLwCw3U4MyagR0IrBmBJNipsrbTXu+Je+gzs7uXGwws28pCP8VN5yOTtja1EhRpMWw+doACXJpaB6mPDlyeHLIKtxM4/9p7IsLSev10txQWYH0gvowsgYVbkBTRZeTqUgngFzjljgweVN3hRidlOEp2rTwzfxnH5ihKwaFtAg+YwUYpLwfpz1cPJjISqJ2wqcxTA1ewGTqcVNP+eBdy/D3i8AbzZDBQivpPM6VOjxIMdnrdmkTo=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2019 06:22:51.4498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdea28d0-f5e4-42bb-5c53-08d6e8b51279
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4937
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Shubhrajyoti,

On 04. 06. 19 1:33, Robert Hancock wrote:
> This driver does not support reading more than 255 bytes at once because
> the register for storing the number of bytes to read is only 8 bits. Add
> a max_read_len quirk to enforce this.

How did you find it out?
Any particular issue you have had that you were looking for a solution?

I think there is more things behind which should be described in commit
message.

Thanks,
Michal

> 
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
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
>  
> 

