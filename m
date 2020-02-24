Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF6616A39E
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 11:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgBXKOI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 05:14:08 -0500
Received: from mail-eopbgr690044.outbound.protection.outlook.com ([40.107.69.44]:15342
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726452AbgBXKOI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 05:14:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYZri0V4VH7cRjcIS2MgrL182r2zdRR6k0+hB3GjyaAjhopOu5ugIC1k4cUKgo9KFbKWdy47nlWDayHdXpgLIudk4H9CazMfAh15NSXug77xu2G7KH3Xe2t3Flt36GIITSuY14eE4MyRH9MEROAM0mFaWEJAT8u8HATZ74AzHDcQNnL+ZcMcFEhg8jS/Z92gCsuDpO4/f6GdPn12k5jtN1f9Ig95AVVVMexaCY8WBAaG7BPwX1lkiu4qqqBqRqQiqse63HnHeYa/atLAhWdPqaw3GRfOqkyjsf4eOklMjW+lOEgz3WoVN2jYXy4faPfWa43a/yVzeEedK9WF9Mr1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cn58yo2QU5DYqiOAekmL7SfahA4VfYPp2zbGklzQqi8=;
 b=ATyAUCEvAPlu71h2JF8yeGKr6+hCdk0IJ+/JfqqyV2AYr+iX0Ez0Y3jBQPE3/3i8LAnMfdfUYJHpeNTfIcC2amny0ZnX0rG6jZKufxsVYgKdnm6xjDMhTlxhpZ5NbFk5dDmnkrq1NxIXaF3oMzbAZK+1gzsIuujkCwrOEa7VzN2vWItuIIh9R9Vv20day47oVt4aDwLh5EAzEkNSR0IsCsaaGOndEe6lPEktcnwKDhn7r8nRqh+ZFZ67UocbqCNuAvpx0w/g5Z6LIMBKomovlGpFA0exYnj+F03L3lwmjYnr4DUAVceThrNVcPpDI5Yzkc1BkAR9iI+Os0Q1NJxkGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cn58yo2QU5DYqiOAekmL7SfahA4VfYPp2zbGklzQqi8=;
 b=TvS60+xtNY4tNrtQdoO+OMqbnfAKbmA8e2iGNVykFZ3UeFZqpwuJJwWcC22/8yVWMwzKSVrvTttx2ecjYyHVaIGglmv9G5e6nHVWKSiO6Cl24bIpTnZlQaMXDYYvMszCFvpBWzQUux4JcAURKVU4dY2R4zGGxYojLD8r/iJsQIY=
Received: from CY4PR02CA0035.namprd02.prod.outlook.com (2603:10b6:903:117::21)
 by MWHPR02MB3165.namprd02.prod.outlook.com (2603:10b6:301:6c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Mon, 24 Feb
 2020 10:14:05 +0000
Received: from BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::202) by CY4PR02CA0035.outlook.office365.com
 (2603:10b6:903:117::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17 via Frontend
 Transport; Mon, 24 Feb 2020 10:14:05 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT009.mail.protection.outlook.com (10.152.77.68) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2750.18
 via Frontend Transport; Mon, 24 Feb 2020 10:14:04 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1j6AkW-00049Y-5Z; Mon, 24 Feb 2020 02:14:04 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1j6AkR-0004gY-2d; Mon, 24 Feb 2020 02:13:59 -0800
Received: from [172.30.17.108]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1j6AkG-0004f7-QV; Mon, 24 Feb 2020 02:13:49 -0800
Subject: Re: [PATCH] i2c: xiic: Support disabling multi-master in DT
To:     Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <481fe028-0ec6-eca3-7436-ebbb8527f3d8@xilinx.com>
Date:   Mon, 24 Feb 2020 11:13:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(346002)(39850400004)(396003)(199004)(189003)(110136005)(54906003)(356004)(426003)(8936002)(6666004)(336012)(478600001)(81156014)(8676002)(4326008)(81166006)(36756003)(31696002)(9786002)(44832011)(70586007)(31686004)(70206006)(107886003)(2616005)(5660300002)(26005)(186003)(966005)(316002)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR02MB3165;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60ddf30d-9284-4954-56b9-08d7b9124717
X-MS-TrafficTypeDiagnostic: MWHPR02MB3165:
X-Microsoft-Antispam-PRVS: <MWHPR02MB316549AD03FF5FC525060EACC6EC0@MWHPR02MB3165.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 032334F434
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZxibxhWz0uWgJKch+i7DLFhGTegclqPk7iT8dBrkiC4wlR6omfBjUtnofjAzu85L+wjrQt9Vv6dGFraCj9dz3IfdiDMwoMd9t2Pr10/fsG0Ix7wPQRp9SdFwnbw+DAvs0YBwxlvr/N1dmR9rhMSSrKsi2pD7AgRX2D7XaPlVMZ2INxs6/JrHtRg/qVqYgbPuPTuyT5rgxaiFnukcfjET+WjvYDA8Fkc0G3eg0VpXRLjPvBJIkfqwX4j2TTKfniOKwZlt+bs4vTsyQlLkx4DOcB+V5DmnAThDLwEQwZifxDKqS53+ZiezfH3YM3IN283f9pJA0m+cSW9FgiZanNh/UT7ksqf4T49g8aUXGxfuktDtgbQw9+sodDbcvx0Kr2EkN4pgd6K6NHZzMox2bPB2jThI21gNH3wcgG8dSFW609BObQa3wUDcq4g6LBfyLAXYL/MElqzaC2rg63RpHp6bG6VWo16EX/p80kkH8HhyNN1h5e4vihzq4Oi+LYshW8NqTfW11oJGYk7FtHyfkYVxpA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 10:14:04.7054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ddf30d-9284-4954-56b9-08d7b9124717
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3165
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18. 02. 20 14:58, Laine Jaakko EXT wrote:
> I2C master operating in multimaster mode can get stuck
> indefinitely if I2C start is detected on bus, but no master
> has a transaction going.
> 
> This is a weakness in I2C standard, which defines no way
> to recover, since all masters are indefinitely disallowed
> from interrupting the currently operating master. A start
> condition can be created for example by an electromagnetic
> discharge applied near physical I2C lines. Or a already
> operating master could get reset immediately after sending
> a start.
> 
> If it is known during device tree creation that only a single
> I2C master will be present on the bus, this deadlock of the
> I2C bus could be avoided in the driver by ignoring the
> bus_is_busy register of the xiic, since bus can never be
> reserved by any other master.
> 
> This patch adds this support for detecting multi-master flag
> in device tree and when not provided, improves I2C reliability
> by ignoring the therefore unnecessary xiic bus_is_busy register.
> 
> Error can be reproduced by pulling I2C SDA -line temporarily low
> by shorting it to ground, while linux I2C master is operating on
> it using the xiic driver. The application using the bus will
> start receiving linux error code 16: "Device or resource busy"
> indefinitely:
> 
> kernel: pca953x 0-0020: failed writing register
> app: Error writing file, error: 16
> 
> With multi-master disabled device will instead receive error
> code 5: "I/O error" while SDA is grounded, but recover normal
> operation once short is removed.
> 
> kernel: pca953x 0-0020: failed reading register
> app: Error reading file, error: 5
> 
> Signed-off-by: Jaakko Laine <ext-jaakko.laine@vaisala.com>
> ---
> 
> Applies against Linux 5.6-rc1 from master in
> https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
> 
> I would like to point out that that since this patch disables
> multimaster mode based on the standard I2C multimaster property
> in device tree (as it propably should) and since the driver has
> previously supported multimaster even when this property doesn't
> exist in device tree, there is a possible backwards
> compatibility issue:
> 
> If there are devices relying on the multimaster mode to work
> without defining the property in device tree, their I2C bus
> might not work without issues anymore after this patch, since
> the driver will asume it is the only master on bus and could
> therefore interrupt the communication of some other master on
> same bus.
> 
> Please suggest some alternative fix if this is not acceptable
> as is. On the other hand supporting multimaster even on a bus
> with only a single master does currently cause some
> reliability issues since the bus can get indefinitely stuck.
> I don't think there exists a I2C protocol compatible way to
> resolve the deadlock on multimaster bus.

Wolfram: I don't think this feature is used on this driver a lot but
clearly this breaks compatibility. Not sure how to handle this properly
and I am fine with this solution.

Shubhrajyoti: Any comment?

> 
>  drivers/i2c/busses/i2c-xiic.c | 52 +++++++++++++++++++++--------------
>  1 file changed, 32 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 90c1c362394d..37f8d6ee0577 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -46,19 +46,20 @@ enum xiic_endian {
>  
>  /**
>   * struct xiic_i2c - Internal representation of the XIIC I2C bus
> - * @dev:	Pointer to device structure
> - * @base:	Memory base of the HW registers
> - * @wait:	Wait queue for callers
> - * @adap:	Kernel adapter representation
> - * @tx_msg:	Messages from above to be sent
> - * @lock:	Mutual exclusion
> - * @tx_pos:	Current pos in TX message
> - * @nmsgs:	Number of messages in tx_msg
> - * @state:	See STATE_
> - * @rx_msg:	Current RX message
> - * @rx_pos:	Position within current RX message
> - * @endianness: big/little-endian byte order
> - * @clk:	Pointer to AXI4-lite input clock
> + * @dev:		Pointer to device structure
> + * @base:		Memory base of the HW registers
> + * @wait:		Wait queue for callers
> + * @adap:		Kernel adapter representation
> + * @tx_msg:		Messages from above to be sent
> + * @lock:		Mutual exclusion
> + * @tx_pos:		Current pos in TX message
> + * @nmsgs:		Number of messages in tx_msg
> + * @state:		See STATE_
> + * @rx_msg:		Current RX message
> + * @rx_pos:		Position within current RX message
> + * @endianness:		big/little-endian byte order
> + * @multimaster:	Indicates bus has multiple masters
> + * @clk:		Pointer to AXI4-lite input clock

nit: I can't see reason for these changes above. I would do it in
separate patch if you want to align.

Thanks,
Michal
