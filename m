Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59C4714A281
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 12:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730192AbgA0LDR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 06:03:17 -0500
Received: from mail-mw2nam12on2087.outbound.protection.outlook.com ([40.107.244.87]:10081
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729154AbgA0LDR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Jan 2020 06:03:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFGcpbJcJ88abxxedtjrYOBrA9uajU3/K7SICe1H9asyGgzk6DyH83QgJV5djZ/wQWr/2cu4lMwsOzlhbBwhlwVqxQhDZCQOLNCfOZYiQH/evJrnBTCbgdDN1SKDJWJrj6tXqTUvs0TSq0OJjQr/1SYGd/FJXoEjssN4jUOV0qUkyrzBX6KJh3CKB0aNjJpZh0D57eNn6PhHVr599V8vsvGKuUFXrlfot4Iz9b8TKH+w47CToahiSwH9H2rPahGDMZt4qjxuUNLrlrBojOamvGP+SFRqVloqj9C/UDMP3S+Wn6sCcJWvB0jyPyYtAYIcIdqhZxTnfPGW4sXfXV8y/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yqPztloZmppVt9Hi6ktff4iJeI6Sd5afmyTsEES3P8=;
 b=SFFxMrLSZn+l1aARj0TiDgx2Ma3AazB/yARG5SIc8S51x39Ea/2h6MCqIRPjRgWTBygkBVQcK/ARMiFcdo2YnyXx9Ej5gVvniZZg4iN5C2BbZiMQ+8FctgJVAJWIQrwtvHe8VUOtM6zjWcCfu9bKW4Yl6djqgnRs9juv4iaX1W39qrc26elUFoHk825L8pZ6LEeMxK/Azr2tHFIHkCZ9gQRIKLGVAKyOejLRyVGqzVzYAuxh1jTg5BZ59gQ31X8QYox8TOwfmTaZwhRhanq8Xo0xDfe+tmY4L33+D7FZ8hj04+0Ag/Gx+6Wi7T5oDEhHKoPc8KF5Qcc8sRNozenxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yqPztloZmppVt9Hi6ktff4iJeI6Sd5afmyTsEES3P8=;
 b=CR0MHc9uRgHFCGgL4kZKlEfr44L0IMW72Dz5YfXP5BzzXC9uKPPC1ZM4Vh9Tfj7p05BlByU3xtbRGhlRvvfgk3sMBegt8lWNmzYFbgKHkzGLrGrtOpQLNnQflc6+HhLSmL1aGnygc2FWZMTgH31fJfMk/sm79LX7FSf9QgPE8aI=
Received: from MWHPR02CA0024.namprd02.prod.outlook.com (2603:10b6:300:4b::34)
 by BYAPR02MB5430.namprd02.prod.outlook.com (2603:10b6:a03:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.22; Mon, 27 Jan
 2020 11:03:14 +0000
Received: from SN1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::204) by MWHPR02CA0024.outlook.office365.com
 (2603:10b6:300:4b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.22 via Frontend
 Transport; Mon, 27 Jan 2020 11:03:14 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT023.mail.protection.outlook.com (10.152.72.156) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2665.18
 via Frontend Transport; Mon, 27 Jan 2020 11:03:13 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iw2Aj-0000cJ-H5; Mon, 27 Jan 2020 03:03:13 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iw2Ae-0002VD-DQ; Mon, 27 Jan 2020 03:03:08 -0800
Received: from [172.30.17.107]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1iw2Aa-0002UC-GI; Mon, 27 Jan 2020 03:03:04 -0800
Subject: Re: [PATCH][next][V2] i2c: xiic: fix indentation issue
To:     Colin King <colin.king@canonical.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200127102303.44133-1-colin.king@canonical.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <2dd84ab2-a7a3-fdd8-6bd6-07f1b3d5cd00@xilinx.com>
Date:   Mon, 27 Jan 2020 12:03:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127102303.44133-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39850400004)(189003)(199004)(426003)(26005)(186003)(336012)(44832011)(2616005)(36756003)(31696002)(2906002)(70206006)(70586007)(31686004)(478600001)(356004)(81156014)(4326008)(110136005)(8676002)(316002)(81166006)(5660300002)(8936002)(9786002)(4744005);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB5430;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34c96d88-7001-4ed7-d3f7-08d7a3188156
X-MS-TrafficTypeDiagnostic: BYAPR02MB5430:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5430C90234407F056070FC08C60B0@BYAPR02MB5430.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-Forefront-PRVS: 02951C14DC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A6mf5Fsl5b0gjZvcCwaI8XRDHtt3IA28RldYB+/d609QkvhXZDFCcBIuJn7s7AT+x1BsuHEDyLf8qtcP3mwHUmWNolxXrTcJlnS+QnGWJtaz76iofuU5g9+9EfXNXVgBGu1z1fh5oKFbmXkLegxOiZ2idFT46DxIXoSOn4SkbmduvmFxZL7cdKs1rPKE44rDgChmRgRK7/0j8fW4GqC5qzmP/LdpVpryRvR1MtK2m1Lp+1kzZlc+oSIQqon6YS8p7B7IEuVJqTrwnYGBOKaPaQwTDuRQ4RZ6WikorPurAv13onkLjy8EliOeCNMj5YygEtz7dWpYmgejVmUehXFjh2OFgGdspFJR6sOp1WfLdY5yMILiRb3zMAakKkM2+ywg0KbHDBEvBo1jKmOJGYiNtMBgKuAgdwkP44wRRgKeAAkq8XgUWkVyNfezW2Ft44eX
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2020 11:03:13.9337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c96d88-7001-4ed7-d3f7-08d7a3188156
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5430
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27. 01. 20 11:23, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a statement that is indented one level too deeply, remove
> the extraneous tab.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> V2: fix type in commit message
> ---
>  drivers/i2c/busses/i2c-xiic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index b17d30c9ab40..90c1c362394d 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -261,7 +261,7 @@ static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
>  		xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
>  		if (time_after(jiffies, timeout)) {
>  			dev_err(i2c->dev, "Failed to clear rx fifo\n");
> -				return -ETIMEDOUT;
> +			return -ETIMEDOUT;
>  		}
>  	}
>  
> 

As was suggested by Peter you should also add Fixes: <sha1> ("patch
subject")

Thanks,
Michal
