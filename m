Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032021FCCD2
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 13:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgFQLzI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Jun 2020 07:55:08 -0400
Received: from mail-eopbgr700056.outbound.protection.outlook.com ([40.107.70.56]:21795
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725967AbgFQLzH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Jun 2020 07:55:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2YfbLHPPy0vORNIakSSERhFAhBF5dSisIYq/W96/PFTKRNoV11dUvQCgNsc3tUX2U++n7DrISo1i0qVaXKbY7eNT/MGVph9Kyaff+cCa0GUzZ8ITiYLy65skdNbyPilEDqgjKLoZ1T8GKhWkFkjJtGCcrpUHVmdU7yhPwKRADG5zdnS2uUhg88UA04uslSXUIQf2oBpj8OPFaEE07EGEJZH4HlyRH4lwWOlvWDjXw+m4q0AvOcu1UIvCUU1tXVSiCNLK6JlrxdyYFDU+65WSttsRAEwLN+LhGi8lQMG++ZnfvSBTSm7yZXvfZfhSDaSbbyTeGQAR+r9bAkfXHh7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6LPNmgI/5/KX8pfb12SUhecY11F1ewDhqLYVWLoAys=;
 b=PW09+S3uzupnNBdojsrIAufkKE8TDNUGt2kadA2QXEuUYBrIycI0QXkT192Hf/olrcFaRoRw9lW0VqmtsgG4CjLkoxSwFQ6DIawSPbSVoUxm+OnXWiDqBmgtkbQGUi1T1pTvszmHj1w+/hNdH5qf0GSFjkycP7ld5O7GOuR0Z/zoIziLjYZYGeFYZNde/hVNskl+20Bu+FcRytw6Vft95OH6hwl7eCCYlJTc7DkTsq6vx+EFgfUzVOWOWFzO20VvV+li6Eg6dwQsLXCYkIVB0xtRC3wtSunfMNsPOEHWy4yekn3Tpf/7KZVWcfqI3mv3LPFQNJQKKLvQ33k914rP5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6LPNmgI/5/KX8pfb12SUhecY11F1ewDhqLYVWLoAys=;
 b=J43SifkNS88WQosGuxTgiHSvHTv6ll9dkzb4wCPbjX74eUIDxZmkKRB+DOj2X9nqjJWcwVqysxNssnAxmFj8+Di+2jrWevDTnNJPhYc5OvJeM7bSGRsJoh6Gok6OTVR+S+yYzKpgfly2BcuCLBS1LEjGm31oBejGNT+2de7+7RE=
Received: from MN2PR14CA0014.namprd14.prod.outlook.com (2603:10b6:208:23e::19)
 by DM6PR02MB4345.namprd02.prod.outlook.com (2603:10b6:5:28::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Wed, 17 Jun
 2020 11:55:04 +0000
Received: from BL2NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23e:cafe::8c) by MN2PR14CA0014.outlook.office365.com
 (2603:10b6:208:23e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Wed, 17 Jun 2020 11:55:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT012.mail.protection.outlook.com (10.152.77.27) with Microsoft SMTP
 Server id 15.20.3088.18 via Frontend Transport; Wed, 17 Jun 2020 11:55:03
 +0000
Received: from [149.199.38.66] (port=44167 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jlWdj-0001ZF-7Q; Wed, 17 Jun 2020 04:53:59 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jlWel-0007dA-He; Wed, 17 Jun 2020 04:55:03 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 05HBsvG6006088;
        Wed, 17 Jun 2020 04:54:57 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jlWee-0007Uh-HS; Wed, 17 Jun 2020 04:54:56 -0700
Subject: Re: [PATCHv5] i2c: cadence: Fix the driver in interrupt flurry case
To:     shubhrajyoti.datta@gmail.com, linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com, git@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        marex@denx.de
References: <1574332651-17308-1-git-send-email-shubhrajyoti.datta@gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Autocrypt: addr=michals@xilinx.com; keydata=
 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
 0Z1MQlmNcq2bhOMzTxuXX2NDzUZs4aqEyZQ=
Message-ID: <ae974c91-720b-16b1-353b-5d152affc8a8@xilinx.com>
Date:   Wed, 17 Jun 2020 13:54:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1574332651-17308-1-git-send-email-shubhrajyoti.datta@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(346002)(376002)(396003)(39860400002)(46966005)(83380400001)(8676002)(4326008)(36756003)(47076004)(82740400003)(356005)(70586007)(8936002)(81166007)(2906002)(82310400002)(70206006)(5660300002)(9786002)(31686004)(26005)(44832011)(186003)(478600001)(336012)(426003)(31696002)(2616005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33282fd4-7a92-4978-9fc4-08d812b545a1
X-MS-TrafficTypeDiagnostic: DM6PR02MB4345:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4345ACB5A59A06DC4C0F5609C69A0@DM6PR02MB4345.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RtmCTsmS9VEaHTeBjMJFRZBsD2bikwFpJo1BEu+w5IWt1jWtnXW42O0/exrnNFqvCBQuQNSvUQitN7G17C6ruofXGB+v0P62OpsHT5rriUvbfmYD+2NVIFt7BwRDYZJH7Xejc2Pg4rPOghw4VpMPIHXBRYvRws1x9sDhyEKqWwNFlqh481FvgvdYL2Lv4qbHGpNYkPpPmAjwJ3uJNRryCMTqcTbjenTirUay1c4IPyzGszwThp5PG+Rt1OTUxSXEkGo6IdPs/xIzAPR0gkftW5P6xbRQTwXCYOI95KWwPye/w19eNs//MkbBcf1dLJw3ycgHE/higYpY757RoIPVEarK/u3jT3rwAsKk80757C8ig+NTo8IPyH9+/s9FbPexPguFuxR9Ivv9LjVYOZ3FUaJOQN/ebg0I/o7/j5+MaMSDTjX4tF5qpK/iNFP1F9BK
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 11:55:03.9475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33282fd4-7a92-4978-9fc4-08d812b545a1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4345
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 21. 11. 19 11:37, shubhrajyoti.datta@gmail.com wrote:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> 
> In case there are a lot of interrupts from a non i2c peripheral
> the  clear is not released and the timeout is reached, then the hold
> bit is not released.
> Protect the code by making it atomic by disabling interrupts.
> 
> Fixes: df8eb5691c4 ("i2c: Add driver for Cadence I2C controller")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v2: Update the wording
> v3: Add fixes tag
> v4: update fixes tag
> v5: Update the description
> 
>  drivers/i2c/busses/i2c-cadence.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index b136057..92829be 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -365,6 +365,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>  {
>  	unsigned int ctrl_reg;
>  	unsigned int isr_status;
> +	unsigned long flags;
>  
>  	id->p_recv_buf = id->p_msg->buf;
>  	id->recv_count = id->p_msg->len;
> @@ -405,6 +406,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>  		cdns_i2c_writereg(id->recv_count, CDNS_I2C_XFER_SIZE_OFFSET);
>  	}
>  
> +	local_irq_save(flags);
>  	/* Set the slave address in address register - triggers operation */
>  	cdns_i2c_writereg(id->p_msg->addr & CDNS_I2C_ADDR_MASK,
>  						CDNS_I2C_ADDR_OFFSET);
> @@ -413,6 +415,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>  		((id->p_msg->flags & I2C_M_RECV_LEN) != I2C_M_RECV_LEN) &&
>  		(id->recv_count <= CDNS_I2C_FIFO_DEPTH))
>  			cdns_i2c_clear_bus_hold(id);
> +	local_irq_restore(flags);
>  	cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET);
>  }
>  
> 

As Marek pointed out this is not the right way how to do protect the
code. local_irq_save/restore just disable IRQ on certain CPU which is
likely what it is not going to work on SMP systems.

Thanks,
Michal
