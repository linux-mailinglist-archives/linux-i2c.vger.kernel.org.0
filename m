Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF68E30A41E
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 10:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232735AbhBAJLy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 04:11:54 -0500
Received: from mail-eopbgr60125.outbound.protection.outlook.com ([40.107.6.125]:5543
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232813AbhBAJLZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Feb 2021 04:11:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvTqjkx/1UHj9i6cOsslQ2hNamv2uDEIxDM4D/3wGHP7nbrQlkJkUeXXXmvXKTb7G/CkwCYS1CCQGBFYnVx2zcOwpv+PwQLAS8WfLJD8nJYLlPBka7vxSXAPaB4e2mPUPzWG8qDvNYTCfd6e7bm7ZZZyIOkmSoArQoQVue+sZgQm4kXexKGSrH9yz0E4ngXkuw5y+/toLw6VB0SJaUnvnodEtARLjwer7s+efqQQFpEib7OK47HRP2uIpzjaAV+ELn5rSY3UNzn3QNPneFd5h3ni/X3swgiX9Fa/diD3c8RF13cKViRHU2jjdm3G1N2eZiMFU1uDrI/w4H4QUftfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWtigsOJzgnQ0DH4f1VIRes9lUNt/JmlkP99HpcyXM8=;
 b=nRGuGodnBUdboK16ee+tsdt/+ZmMZ1r/h7sR9IZAJPM5jVxvIttyM6e1c+2AqRQRNPBXcm1yHyPoqCb4cIcYzloXpRQXSZHChfZkknS5kDaPgYYvtpUadag8OQO84cv/yTWrMrJcNT68VZqi5FRi6rsCP0/S7Ow3+772euKWvVyBlPaooKY2oc4Syqg0Ttc4TIlMOFY/6FVWOr3Lqp2bO7WyhgSp6cVqU0aUwVC+EBhhQTsVt70gHNXaOQzdW/fNE9E8bDypn2Sp2dvOt/UKH+Ub2lFhk5aOF5WEmXqwkj3pIAq1IK3cLEjSdNkxtPmNuh2vh63wKpSSLgjfVFY78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWtigsOJzgnQ0DH4f1VIRes9lUNt/JmlkP99HpcyXM8=;
 b=Avi3rcZyeV0oq4eqM9a4pGzo0ch84dw8LSm9C7LOMIvL9fHpd5xHz5DWttViv5KxfXLljIKiH8cIIiDflYs2mMDxCv/3GZqXqU2fbuSIeFUg7DZALUhc31DL0aClShH891TqQjDvjE8Rx4gWL/fdFGxXrfsYrN0ZA4ekAStNqw0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB5001.eurprd02.prod.outlook.com (2603:10a6:10:33::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Mon, 1 Feb
 2021 09:09:41 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3805.026; Mon, 1 Feb 2021
 09:09:41 +0000
Subject: Re: [PATCH i2c-next v3 4/6] i2c: mux: mlxcpld: Extend driver to
 support word address space devices
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210130173447.26328-1-vadimp@nvidia.com>
 <20210130173447.26328-5-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <fc483753-7587-6e16-4ee3-2dbb9182dddb@axentia.se>
Date:   Mon, 1 Feb 2021 10:09:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210130173447.26328-5-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR08CA0062.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::33) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR08CA0062.eurprd08.prod.outlook.com (2603:10a6:7:2a::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 09:09:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8233a3b6-a7a0-42b6-bfbf-08d8c6911be1
X-MS-TrafficTypeDiagnostic: DB7PR02MB5001:
X-Microsoft-Antispam-PRVS: <DB7PR02MB500125093E121F8DE5F0D039BCB69@DB7PR02MB5001.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x0QqDBqhzivcA2tAuwqpC+9KDj+jxWoOHprmSoV0RMPdFR+xA1NvqycwdamoOOgNudgvVu6L2tyupqE7THAvHvq0ye0PHGq/zKdu7UIggb7orXtWPz4VN15hGM6JCb8b08D5/97z3kB9oUQov4l5N0e9Td3Q1w3xy4EMj1FoPPCXkSz4AlKUjUMLK5UOVkhdP6EAjXLHwwWPHpHzVx8Ek/vx1JLrBSoU0I85lnLNmqcJnC7rW43b6vL6N1glvBbIEO2qY/bNR3YeQDp2yupGcQU1AfmQXLT2PKL3D008qkPlld3I1+GUlKUnA+uAT2WrjqDsZXR6zW12bLzdGRyw7pmyHi6IIcuuzXIsj/v2bQZxjiJ7r7vwyCknOC1YRCSiqtRLW2j8g9AStIxtbdp4E5WoKJElt1LwdDqqwa8yDT0pwPmWL+nKc7MGUVDYfr0z38P9oLHWj9yRQTBa+a6p3y/24MpCAJiiyyKMfsjB2G15upoENiskE6CrjXJiD9jCi/u0kuqO1MA5Eyx5JT/g4I+RWk/b2JF5DM5+3SiHmTg8tw/xgFG0f/CxVpGzLPJiEX498t4/5mfZhSyzE9fCtajhgBq1H8ww2sq3IPm8EJ65+/XvUirb+mHoI5iz6UVIHZRFkWYJLYgn1Ymi1UoWVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(376002)(346002)(39830400003)(186003)(86362001)(31696002)(5660300002)(478600001)(16526019)(4326008)(6486002)(26005)(956004)(36756003)(2616005)(16576012)(8936002)(83380400001)(31686004)(2906002)(36916002)(53546011)(66556008)(316002)(8676002)(66476007)(66946007)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T2dDN2R4MTIreFJJeGlQRW1mOEJyZWhoeEVpYTFBdW0vYlRybEVlQmlPWkd0?=
 =?utf-8?B?YmZKWGJkY1UyaUp4eDFOazVFZ1lRc2duMWdpRDZHREg5MW8yRUlTR1lzOHhB?=
 =?utf-8?B?UXVQc0tnMXUrd1FaSmN1bUd6bzlhYmZTRTFFcFJJbXNwTmFLZ2pqYUo3S0ha?=
 =?utf-8?B?WEZpT05peWdWV3FieE0vekZIOU81aXc0NFNoaVIwRkVoYjRqZWJnSFY0MnZn?=
 =?utf-8?B?a1ZiZmpTQllFZU9JRU8wMnp3TUpvdVFYZDlvRTFESWJHT3JVd0R2RkJXT3Az?=
 =?utf-8?B?QWptKzNHZmZyNHk5WlQwVUtkaEJzWEpmQVExMXV3eXBESUxjVTgrRTJuR1JD?=
 =?utf-8?B?UmZFUzVqOUkxK2JkMEYydVBMYzl2aSs1eDc5QmZHUEFJZGg5emVVRVB4NFY2?=
 =?utf-8?B?SkFuY1V5ZDBvSXNnblFzbVFleDJQQ0x3enlmMWJFdHFZR3FUNDUxQm9VbEJq?=
 =?utf-8?B?ZWNDa1phNzFIc2NReDV6aU81OHdNR3dzaTRQK0VBeEJnMVQ3MFZyc2kyTElD?=
 =?utf-8?B?SVF3V3FQS09tcUVQcnVkcUljYWlZWEhWQnJicUJWWHBuRk4xcndBcXVGQnhR?=
 =?utf-8?B?enc2eGFreXF1d0FWa0hwWGJPZExMdmtzVXVJTWRlcE56R0FpSEpFM253UERk?=
 =?utf-8?B?cmdNMXJHZlhtL3kvb1l2aDMyTU5MOTVWUmxFOE9aT1FWclk4VjhTK2VzS3N0?=
 =?utf-8?B?blR3VWdZd0FJOE1iQUUvMitFQmo5SmM0YVpMZ2ZmaDRQWUVpcmpiU1RXQk52?=
 =?utf-8?B?em9tdFU5OEJWYXRhVnJNekF2Yk1Dck50bWRXTi8vd1dFSVFyUnVUYXpkYzRI?=
 =?utf-8?B?eHJMamw4WklIaXFSd0Z5OW02TnJVTm1tbUpQejNwdXBrWlVMSDcvTVBSNjcw?=
 =?utf-8?B?UzFZWWVtckNKUUljTEd3K0NyZFpzTWZZbFZydnlpN0FtUWU4bldIOXFCQ3Rq?=
 =?utf-8?B?MHVlbkp0b2VGNkhGNWtNbllhQlpqZ3BGY2cwbVAweDU0Z3ZTdmNjV1MwREJ5?=
 =?utf-8?B?dXJlZ1NmM3RWdUdGRk1HMTJmQmoyNEk0NjYzK1JJTEV1MEtuejI5UWtJdE9Q?=
 =?utf-8?B?cktKMFI0RmcvLzNxOGoxVXRkNnNodmdLNzVldFRqT0o5c2pxa3lTdm9nUlpR?=
 =?utf-8?B?QmZqQ3ROL1FDZVVFWVdXNEJQYUZwV0cyR1ZPTEpLZDhZVFdjVnpzSENEeXAw?=
 =?utf-8?B?OEtmTEIvNGVzQTNEdkRjN21rM3NNbkZnYzk4ckNpQjBkT3Q4dkVTWHh6RERy?=
 =?utf-8?B?VXdoY3dzYU5uSmd6azRoWXN4MzBPTEhFVklDTUpaNjQwZTI4Q1BKWjJscmJG?=
 =?utf-8?B?ZjRXME80Y1YrbjlYU3Z4SGhHMktKZ0ZYS0F0YnZvbEVkQ2l6YUZYRWM4eW9Q?=
 =?utf-8?B?bklUa01UeGFTK2ZCMzZGak1ST25EZk1FdU5uU2lOcFVWdlRBZnhPaXpwRWVt?=
 =?utf-8?Q?ZXxJX0Wm?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 8233a3b6-a7a0-42b6-bfbf-08d8c6911be1
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 09:09:41.4331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWYpDvArNexpbGvICHhLyaNIO1WVxzN5mxDrzvTyw0E/CBcH2CwujI53AApX+OPc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB5001
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2021-01-30 18:34, Vadim Pasternak wrote:
> Extend driver to allow I2C routing control through CPLD devices with
> word address space. Till now only CPLD devices with byte address space
> have been supported.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> ---
> v2->v3:
>  Comments pointed out by Peter:
>  - Do not change mlxcpld_mux_reg_write() argumnet "val" to "chan",
>    since it is misleading for the one-byte case.
>  - Drop cpu_to_be16() conversion from mlxcpld_mux_reg_write().
> v1->v2:
>  Comments pointed out by Peter:
>  - Remove data buffer allocation from 'mlxcpld_mux' structure, do it on
>    stack instead.
>  - Do not use array pdata.adap_ids[] in mlxcpld_mux_reg_write() for
>    channel assignment.
>  - Return back 'regval' variable, used for channel assignment in
>    mlxcpld_mux_select_chan().
>  - Fix functionality validation in mlxcpld_mux_probe().
>  - Fix comment for 'reg_size' field in mlxcpld_mux_plat_data' structure.
>   Added by Vadim:
>   - Change type of register select address to '__be16' to align with
>     type in assignment in cpu_to_be16().
> ---
>  drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 47 +++++++++++++++++++++++++++++------
>  include/linux/platform_data/mlxcpld.h |  2 ++
>  2 files changed, 41 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> index 9e9d74bd1059..71d4b8813704 100644
> --- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> +++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> @@ -63,19 +63,39 @@ static int mlxcpld_mux_reg_write(struct i2c_adapter *adap,
>  				 struct mlxcpld_mux *mux, u32 val)
>  {
>  	struct i2c_client *client = mux->client;
> -	union i2c_smbus_data data = { .byte = val };
> -
> -	return __i2c_smbus_xfer(adap, client->addr, client->flags,
> -				I2C_SMBUS_WRITE, mux->pdata.sel_reg_addr,
> -				I2C_SMBUS_BYTE_DATA, &data);
> +	union i2c_smbus_data data;
> +	struct i2c_msg msg;
> +	u8 buf[3];
> +
> +	switch (mux->pdata.reg_size) {
> +	case 1:
> +		data.byte = val;
> +		return __i2c_smbus_xfer(adap, client->addr, client->flags,
> +					I2C_SMBUS_WRITE, mux->pdata.sel_reg_addr,
> +					I2C_SMBUS_BYTE_DATA, &data);
> +	case 2:
> +		buf[0] = mux->pdata.sel_reg_addr >> 8;
> +		buf[1] = mux->pdata.sel_reg_addr;
> +		buf[2] = val;
> +		msg.addr = client->addr;
> +		msg.buf = buf;
> +		msg.len = mux->pdata.reg_size + 1;
> +		msg.flags = 0;
> +		return __i2c_transfer(adap, &msg, 1);
> +	default:
> +		return -EINVAL;
> +	}
>  }
>  
>  static int mlxcpld_mux_select_chan(struct i2c_mux_core *muxc, u32 chan)
>  {
>  	struct mlxcpld_mux *mux = i2c_mux_priv(muxc);
> -	u32 regval = chan + 1;
> +	u32 regval = chan;
>  	int err = 0;
>  
> +	if (mux->pdata.reg_size == 1)
> +		regval += 1;
> +

I can only think of one reason to keep this offset between chan and regval,
and that is if you need to be compatible with some old one-byte case that
absolutely must have channels 0-7, that can't be adapted to channels 1-8
instead. If you are able to change all cases expecting channels 0-7 to
expect 1-8 at the same time you update the kernel, then I would simply
drop this conditional offset.

If you can't change that, then I think you should add a comment for why
this offset between the channel and the regval exists. It just looks odd
and convuluted, and it begs for an explanation when the offset is only
there for the one-byte case and not for the two-byte case. When I see it,
my brain fires up and I start wondering what the ?"#%& is going on :-)

Cheers,
Peter

>  	/* Only select the channel if its different from the last channel */
>  	if (mux->last_val != regval) {
>  		err = mlxcpld_mux_reg_write(muxc->parent, mux, regval);
> @@ -103,13 +123,24 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
>  	struct i2c_mux_core *muxc;
>  	int num, force;
>  	struct mlxcpld_mux *data;
> +	u32 func;
>  	int err;
>  
>  	if (!pdata)
>  		return -EINVAL;
>  
> -	if (!i2c_check_functionality(client->adapter,
> -				     I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
> +	switch (pdata->reg_size) {
> +	case 1:
> +		func = I2C_FUNC_SMBUS_WRITE_BYTE_DATA;
> +		break;
> +	case 2:
> +		func = I2C_FUNC_I2C;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (!i2c_check_functionality(client->adapter, func))
>  		return -ENODEV;
>  
>  	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, CPLD_MUX_MAX_NCHANS,
> diff --git a/include/linux/platform_data/mlxcpld.h b/include/linux/platform_data/mlxcpld.h
> index 04d93c563c04..a7bee798d991 100644
> --- a/include/linux/platform_data/mlxcpld.h
> +++ b/include/linux/platform_data/mlxcpld.h
> @@ -14,11 +14,13 @@
>   * @chan_ids - channels array
>   * @num_adaps - number of adapters
>   * @sel_reg_addr - mux select register offset in CPLD space
> + * @reg_size: register size in bytes
>   */
>  struct mlxcpld_mux_plat_data {
>  	int *chan_ids;
>  	int num_adaps;
>  	int sel_reg_addr;
> +	u8 reg_size;
>  };
>  
>  #endif /* _LINUX_I2C_MLXCPLD_H */
> 
