Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A725F252D1B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 13:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729249AbgHZLz6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 07:55:58 -0400
Received: from mail-bn8nam12on2040.outbound.protection.outlook.com ([40.107.237.40]:8544
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729277AbgHZLzv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 07:55:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAUkkRRobKa3F7BmXL+TXs9HW28DeQcKWwOzmfWW8q0IofgbKfps+20+FYS9PL/Qw7x1QJyk0sEgTH98KmE50aAW/l15yHEoSA1krPa8lZ6TxDPUTdI8mhE3rhV1fYlHmlx+QZZNkoVBoCdP9dYMQ4vxSvPzrVOZTS9P6QPBFRvHXeKj+kgv/7q35nYKDq/qGoqQbvMhxZAmkDX/5yTPnJZzjE89Ad2Fn/V2h7XaL3a1aMZ8lPX/Q+KKyJE2xqHpFLcDBPQQYqEN+9AxpV1n8puqV6/09c1GjqXgDFy9WK438u2KNEoKr+Kh6T+PiQHRRCsIuBGWqzlWz4SRbkrRyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4XK/S376tspGxWh2nQ3EiLb7639hLoJBZBXWFeA9dM=;
 b=XKoywVy/EaLw3nk5BuvXCbRgfXyPal2Xu/FW1cO5BIDrzOsf3oeCFPcXLB7aXx4fw2G5tZLhocmcu0neg1d7DrhLRgzasl848MZ2H/UNX5C6a3TBySmr4kTrm7Aw6kwCLppfKBEKDDIRWP9Jd0TOz86RBSVNmL+zOTis1UpWXlDboRHCYBfRRNyyvTnES25WgFKiDsDSRhgIEqLNi6cejTTuu/e5o/P3qcUHpxa6Y448Mfsjtwvzw3GuaTjTQpX0tgWm3Q/hGN9om01m3dT2nR1h7cG3w1kDo6Gdr8wyj7+Lr+1f1FKoKdp6DHgf8WI2GRIfpiSPYNW3osf64RBi0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vaisala.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4XK/S376tspGxWh2nQ3EiLb7639hLoJBZBXWFeA9dM=;
 b=o0Qq5ZSKouk0dO5fZoSiDkfBjia3zAKxCJhKhB9mKfkGC6PWfoL2b/f5qQowECh3nfsOG/5f8UqYHju3NjQ8t7fSFVQiR7Br9/4ipWwSFi9wOxbyMzhr5sjw9SeL196PldZghY/AM5SWhTR1gBpEKPLZ4uI33e15991Z4dXuCLM=
Received: from SN4PR0501CA0088.namprd05.prod.outlook.com
 (2603:10b6:803:22::26) by BYAPR02MB5893.namprd02.prod.outlook.com
 (2603:10b6:a03:118::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Wed, 26 Aug
 2020 11:55:48 +0000
Received: from SN1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::69) by SN4PR0501CA0088.outlook.office365.com
 (2603:10b6:803:22::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.10 via Frontend
 Transport; Wed, 26 Aug 2020 11:55:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vaisala.com; dkim=none (message not signed)
 header.d=none;vaisala.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT025.mail.protection.outlook.com (10.152.72.87) with Microsoft SMTP
 Server id 15.20.3326.19 via Frontend Transport; Wed, 26 Aug 2020 11:55:47
 +0000
Received: from [149.199.38.66] (port=37155 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kAu1M-0002Fa-HY; Wed, 26 Aug 2020 04:55:16 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kAu1r-0003tY-6r; Wed, 26 Aug 2020 04:55:47 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 07QBtbP3009981;
        Wed, 26 Aug 2020 04:55:37 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1kAu1g-0003ro-Il; Wed, 26 Aug 2020 04:55:37 -0700
Subject: Re: [PATCH v2 2/2] i2c: xiic: Support forcing single-master in DT
To:     Jaakko Laine <ext-jaakko.laine@vaisala.com>, wsa@the-dreams.de
Cc:     shubhrajyoti.datta@gmail.com, linux-i2c@vger.kernel.org,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
References: <20200820100241.96866-1-ext-jaakko.laine@vaisala.com>
 <20200820100241.96866-3-ext-jaakko.laine@vaisala.com>
From:   Michal Simek <michal.simek@xilinx.com>
Autocrypt: addr=michals@xilinx.com; keydata=
 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
 0Z1MQlmNcq2bhOMzTxuXX2NDzUZs4aqEyZQ=
Message-ID: <4d6b11e2-1af4-e7b3-5ede-7de723300a52@xilinx.com>
Date:   Wed, 26 Aug 2020 13:55:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820100241.96866-3-ext-jaakko.laine@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 785ac2d2-4a64-4203-f6ee-08d849b6f89b
X-MS-TrafficTypeDiagnostic: BYAPR02MB5893:
X-Microsoft-Antispam-PRVS: <BYAPR02MB589389948C4891A76247D9A0C6540@BYAPR02MB5893.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q2lEchd6rUOauqqGeIjBOPOTIgr0RKftpxBe4FCzfwfoQTAFqUMIQPgmS5Hpq7LdfQRnz6CxzJDAYWcN2JPPAPjJ9KncNI/dr748g6ANMj+Nny7VhVDuJVMxKUsXVd0JrowpHQ55Ec1WYN+i/f3rBFWdCebauZp0ikf7yZXzdcZ5gwYrkI8gSgzJI36uMz0pj8SHCeRhU4z6slMl8BxEDbRaVLEhm4Nd8gnYWEZqZWQaJAXr+nXgaVpBGMarAUdJZ5PVtgC4qJIa8iax5w2rYdi5oAxnqFDDoXMVEs62je9Sz7k3AJBPykY81wrI5pp9jrYMryw45CfaWfnDJ+57308POOTUrXm8Hk0D+uZRAHswC6KtkQ5+FemLqNUilm2G+6m5EAXOvJeQ6gYS8t3R4/HyCr8nfZE2kpD/EC+RbkaYh/6hERps+moyN7sesc7d
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(376002)(396003)(136003)(39860400002)(346002)(46966005)(9786002)(31686004)(426003)(4326008)(2906002)(2616005)(44832011)(31696002)(6666004)(8676002)(70206006)(186003)(70586007)(36756003)(47076004)(82740400003)(478600001)(26005)(316002)(82310400002)(81166007)(83380400001)(8936002)(336012)(356005)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2020 11:55:47.6701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 785ac2d2-4a64-4203-f6ee-08d849b6f89b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5893
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 20. 08. 20 12:02, Jaakko Laine wrote:
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
> This patch adds this support for detecting single-master flag
> in device tree and when provided, improves I2C reliability by
> ignoring the therefore unnecessary xiic bus_is_busy register.
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
>  drivers/i2c/busses/i2c-xiic.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 10380531d45c..5d06e6cc5d5c 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -58,6 +58,7 @@ enum xiic_endian {
>   * @rx_msg: Current RX message
>   * @rx_pos: Position within current RX message
>   * @endianness: big/little-endian byte order
> + * @singlemaster: Indicates bus is single master
>   * @clk: Pointer to AXI4-lite input clock
>   */
>  struct xiic_i2c {
> @@ -73,6 +74,7 @@ struct xiic_i2c {
>  	struct i2c_msg *rx_msg;
>  	int rx_pos;
>  	enum xiic_endian endianness;
> +	bool singlemaster;

I would understand if this is placed above rx_msg to fill that 4bytes
hole in the structure. But this location doesn't make any sense.

The best would be to move state to the end and add this bool behind it.
To have nicely packed structure like this

on 64bit system.

 struct xiic_i2c {
 	struct device *            dev;                  /*     0     8 */
 	void *                     base;                 /*     8     8 */
 	wait_queue_head_t          wait;                 /*    16    24 */
 	struct i2c_adapter         adap;                 /*    40  1032 */
 	/* --- cacheline 16 boundary (1024 bytes) was 48 bytes ago --- */
 	struct i2c_msg *           tx_msg;               /*  1072     8 */
 	struct mutex               lock;                 /*  1080    32 */
 	/* --- cacheline 17 boundary (1088 bytes) was 24 bytes ago --- */
 	unsigned int               tx_pos;               /*  1112     4 */
 	unsigned int               nmsgs;                /*  1116     4 */
 	struct i2c_msg *           rx_msg;               /*  1120     8 */
 	int                        rx_pos;               /*  1128     4 */
 	enum xiic_endian           endianness;           /*  1132     4 */
 	struct clk *               clk;                  /*  1136     8 */
 	enum xilinx_i2c_state      state;                /*  1144     4 */
 	bool                       singlemaster;         /*  1148     1 */

 	/* size: 1152, cachelines: 18, members: 14 */
 	/* padding: 3 */
 };

on 32bit system.
 struct xiic_i2c {
 	struct device *            dev;                  /*     0     4 */
 	void *                     base;                 /*     4     4 */
 	wait_queue_head_t          wait;                 /*     8    24 */
 	struct i2c_adapter         adap;                 /*    32   508 */
 	/* --- cacheline 8 boundary (512 bytes) was 28 bytes ago --- */
 	struct i2c_msg *           tx_msg;               /*   540     4 */
 	struct mutex               lock;                 /*   544    28 */
 	unsigned int               tx_pos;               /*   572     4 */
 	/* --- cacheline 9 boundary (576 bytes) --- */
 	unsigned int               nmsgs;                /*   576     4 */
 	struct i2c_msg *           rx_msg;               /*   580     4 */
 	int                        rx_pos;               /*   584     4 */
 	enum xiic_endian           endianness;           /*   588     4 */
 	struct clk *               clk;                  /*   592     4 */
 	enum xilinx_i2c_state      state;                /*   596     4 */
 	bool                       singlemaster;         /*   600     1 */

 	/* size: 604, cachelines: 10, members: 14 */
 	/* padding: 3 */
 	/* last cacheline: 28 bytes */
 };




>  	struct clk *clk;
>  };
>  
> @@ -521,19 +523,26 @@ static int xiic_bus_busy(struct xiic_i2c *i2c)
>  static int xiic_busy(struct xiic_i2c *i2c)
>  {
>  	int tries = 3;
> -	int err;
> +	int err = 0;
>  
>  	if (i2c->tx_msg)
>  		return -EBUSY;
>  
> -	/* for instance if previous transfer was terminated due to TX error
> -	 * it might be that the bus is on it's way to become available
> -	 * give it at most 3 ms to wake
> +	/* In single master mode bus can only be busy, when in use by this
> +	 * driver. If the register indicates bus being busy for some reason we
> +	 * should ignore it, since bus will never be released and i2c will be
> +	 * stuck forever.
>  	 */
> -	err = xiic_bus_busy(i2c);
> -	while (err && tries--) {
> -		msleep(1);
> +	if (!i2c->singlemaster) {
> +		/* for instance if previous transfer was terminated due to TX
> +		 * error it might be that the bus is on it's way to become
> +		 * available give it at most 3 ms to wake
> +		 */
>  		err = xiic_bus_busy(i2c);
> +		while (err && tries--) {
> +			msleep(1);
> +			err = xiic_bus_busy(i2c);
> +		}
>  	}

I would prefer to write this differently.
	if (i2c->singlemaster)
		return 0;

Followed by origin code. Patch will be smaller and you don't need to add
one more level of indentation.



>  
>  	return err;
> @@ -811,6 +820,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>  		goto err_clk_dis;
>  	}
>  
> +	i2c->singlemaster =
> +		of_property_read_bool(pdev->dev.of_node, "single-master");
> +
>  	/*
>  	 * Detect endianness
>  	 * Try to reset the TX FIFO. Then check the EMPTY flag. If it is not
> 

Thanks,
Michal
