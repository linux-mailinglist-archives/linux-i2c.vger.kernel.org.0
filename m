Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618C7302E50
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Jan 2021 22:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733039AbhAYVtA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Jan 2021 16:49:00 -0500
Received: from mail-am6eur05on2112.outbound.protection.outlook.com ([40.107.22.112]:21646
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732841AbhAYVie (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 Jan 2021 16:38:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtYF6BISgAKDDxwVFQgKRgDxicVwiIG1FLg86DuL/ZQ9O4EJjXKmLaz5150MPN5Sv+ARvBjCglIZmH+4UWL9fjvpKhFzCPWi5l/v01Q2KyAouGbd/o4L16zPNJ0z7aO8jBTSJ3GGaAfl5m4XcNF/Si8DGA04KuwdK0dfVh7EuANqZRTZPiFAFARUsZ8FRIZa4Y6mkF87Y4vYQq4XI/giVexK5RX46CF14nLs3BnsKzJNSeN/BxShvClLdayohnlkJZEbn5lbJlSoyGLABkHaEtJsewdTWbsviLuPugS/sziSNbyRFQG7BxinVSXewX60teHo6wiqW+DrSXFZIxMsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fpLckI2d/MGpVMaDKUW+8iAlVBOdJ8Yv050XkDKIsA=;
 b=ZNE73oZLdmfLsKVc+80Nw61li3ptcLw89JTmfOVCU8cLFHDZ+b48u6wgx9jpp/XnRGx3RO5SHi1RU6mXhZV2zp5E4CxYMX5nvP+RLhoWULxDLnRd5oevDEs1XFhE/6WhUCIV9XMtEFCkW7HRFUhKGOHbvr7kUOUjIQPVR59BAR4xl5p8Haq7masRmt6jhBpgVGyiUpOcJWQ6LbZMHlF4gxbLyCgRF/xg9QsoqyKROgVbACFPRwuq+fUR55P4jbTgupQ4Qn9+JbMgc+5vwxsC87f04PGCA8rcUPsTy7F1mTB6RfkfI5LkB9SIxseRYgTh4wv1FesVQNX4S8bVnbGmrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fpLckI2d/MGpVMaDKUW+8iAlVBOdJ8Yv050XkDKIsA=;
 b=o5PCxjsBoOaA040F8jGBq63r83rfuuMhYYBVd+U0P31bnhdZSnZzw523oPi53W6OYE3P/sx6Nz2NPsUX03ijv2leyAz9RshH8d2zQvZCpkgyjeEHSjl3kaZ4QE8T22X7aqWj3QSp9uV8GghWGhrYfoSAHd2CeXubVkUZa+eKTqc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5610.eurprd02.prod.outlook.com (2603:10a6:10:ed::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Mon, 25 Jan
 2021 21:37:43 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 21:37:43 +0000
Subject: Re: [PATCH i2c-next v2 5/7] i2c: mux: mlxcpld: Extend driver to
 support word address space devices
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210122192502.17645-1-vadimp@nvidia.com>
 <20210122192502.17645-6-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <c8dc2abf-023e-d8c0-7f49-bc0ee228fb1d@axentia.se>
Date:   Mon, 25 Jan 2021 22:37:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210122192502.17645-6-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR02CA0095.eurprd02.prod.outlook.com
 (2603:10a6:7:29::24) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR02CA0095.eurprd02.prod.outlook.com (2603:10a6:7:29::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 21:37:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffad8711-2993-4491-4481-08d8c17972d4
X-MS-TrafficTypeDiagnostic: DB8PR02MB5610:
X-Microsoft-Antispam-PRVS: <DB8PR02MB5610B4ADD6FA11F6C73FB7E6BCBD0@DB8PR02MB5610.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dtkX9+thUUdx/aey5o5HBHykiDfiOkozLjXE4n2MyzGv1XA/6jtdlX1/AcbwcqjBaw9/OCHFyjxCQ01YSgRRZC/GuN7C5fprtVFKSnm5tBkLGVIQvO7sPqUT2yDaA+JW/aCHloBs8i/C4CUpF72qum16ED3AyhKxGqhA25FmHYnIW4G5z7UVUCFxL3pZJDa7n104oi5xwVOVRXFy3NuPDRww0PSnkaNK82TBt2z8X0coKEikLeKkbKafq1DOWk2DSscQi4DweRzY300h1Ywj/2cLL166ssNI13fkxHczzoYctpw7vbf/01mARtV5zKY80hUAuRM1pXy9aWMMqcnvyFIRMJH/VH8yj7Ks93mqY+Eu9l3WjJg4V3mnK4rSvqeBBmBbuRn7hh15s3guNyHD5wvwuyZs3yOIIexk8EUCRF5v8zeEv7TO7nrSCwmghHFVlYVMtGbImeMGAIhPhg/vgOFLYyOQn33Zg5TO1wSB4sxJMt050Mb4QRa5XumDIvZO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(366004)(39830400003)(396003)(956004)(86362001)(83380400001)(4326008)(66476007)(2616005)(16526019)(8936002)(186003)(6486002)(31696002)(66556008)(2906002)(53546011)(478600001)(8676002)(36756003)(5660300002)(16576012)(316002)(66946007)(26005)(31686004)(36916002)(133343001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFhLcWlDVkl4U29XNlpqZnNQMlEySDFjL1NmdVVrNkNrcTFYbi80Z3dva0pi?=
 =?utf-8?B?UXV3THhzb3pIUGRXRk1zWlVjRUpqNW9BS3RQcUVYYzk0U29QY1ZFc2t1Q0g4?=
 =?utf-8?B?d1NnOTI0WVQ0Uy96Sm1HdHZrSTBpZ0czUTFuTy9HNDc2eXUwbFVyd1pPMTR5?=
 =?utf-8?B?Zy9JRTU0K3c3OGl2d0MzVE1MblVYcWVvWnlYYjBPSmlIRDVFaEI2eG1nYVhF?=
 =?utf-8?B?M0dScjVWUEdmcS9EeEFQeElveFRNc0tXUEdwM0dkcEdLTWNkWVRIU05FY25q?=
 =?utf-8?B?WnFlSXM4OVJMclI4V1ppMFZVblBJN3plL2VkZXF3NEJzc0hkeDNZWEhsMnJE?=
 =?utf-8?B?QklWYXVXeEVlcitYL29qaUoxNnhCd0l4U0dIUjk2M3dGdHZmV1BkanRqRnZk?=
 =?utf-8?B?SHFDVzZiNUhWSVUxTG9vRVNQVUFuWG94OC9WTy9HaW5ib0tnM0pUbXdHWlBJ?=
 =?utf-8?B?YmRkc2FRRVRmU1FMa3lFNEdPelJRZm5tQVJ6WCtEaU9NQ09MRkh2WnVVSVNp?=
 =?utf-8?B?ODN4L28wbmJlUTVkSGxvajhnbldjQzcvMlU5cEtUUDIrSnZnWFBhUXVuaElh?=
 =?utf-8?B?RGJCLzZ6ZiszK3lSMFlMdm9TekRUOUpsYlpDVDRGUnFBcnFoZWh2bWxwNUxa?=
 =?utf-8?B?aElURzM4Y1JnWU9JQkVUd0d6YS93UitiejNnaEJwTW9CTlJUTTIwS0xPNExM?=
 =?utf-8?B?UkhYTjhuL0hTcUpGSXcvYlF2Wi9wS3FPeFNpYVVWelFZbzRRNEkxSDMzRGRt?=
 =?utf-8?B?VmxjZWs3dER6Y3ViRUNvUVNvL3FqNVp2UUc3TkF4blUwcDRyL2QzcGxpTmZI?=
 =?utf-8?B?WVFobCtJcmVvUVNoajVvTFg5QWlYZzY1SEFRMEUzdDhlbTBNRTgrVlpzUXh5?=
 =?utf-8?B?aTlEbjBNa3lXTWtlNDJpbFhWd2ZTZGFkT1BibW9lRDBxdHF3Z1NrUkxXZ2tF?=
 =?utf-8?B?M1dNNEF0dTBVdk91SnIxZlpEbnZ2WUxxcDFNMVFrY2h1YTByQWNaU3k4WTZl?=
 =?utf-8?B?R1djVG5yL29zblRhNVl0cExaaTY2YjZ0TUpVYTRvR1dFeWJueXp6aFZHY1hW?=
 =?utf-8?B?bklmVko4RURqTkIvMGY1VmI2alg5MjJKQW5JY2JGUnNQWUloZFcvWGkwZ3NR?=
 =?utf-8?B?U2p6aUpubU9YQ2JmU1N3UUZPaUtUNHRuQUplMzBnNXNSQnBXN0tFb3JFQTVz?=
 =?utf-8?B?UEd6QmhoOWVVWFhQaEVrZFpkYUY4aDhLY245SHI5RTNtbFdEbHdiTmxsNGhX?=
 =?utf-8?B?YS9TWU85TjJtRmpjNEZvemI4VVJMSVNKVWdMbjJKQi9QZVRWQWVqbVg3YWpK?=
 =?utf-8?B?UDFpVENKaEhMU0d5dDAyalN6eWV3ZERrT3ZCZWRoT1RRWHF4SUUwV1EwaW1m?=
 =?utf-8?B?SzY2YU14ZlhrMWVtSnFFeWpGVEphV2dGdjhPaVM0djBGV1liRVVmTnpDd3RX?=
 =?utf-8?Q?CwpI0au+?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: ffad8711-2993-4491-4481-08d8c17972d4
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 21:37:43.6601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: od8/UhYR1M5CSu7mhH1iU6yD6//j9lypmlqWm17Pp9mJ9UlP+gg2NaDNS44+uw/K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5610
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2021-01-22 20:25, Vadim Pasternak wrote:
> Extend driver to allow I2C routing control through CPLD devices with
> word address space. Till now only CPLD devices with byte address space
> have been supported.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> ---
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
>  drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 54 ++++++++++++++++++++++++++++-------
>  include/linux/platform_data/mlxcpld.h |  2 ++
>  2 files changed, 46 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> index b53f1479272d..4848dd4ff41a 100644
> --- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> +++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> @@ -21,11 +21,13 @@
>   * @last_chan - last register value
>   * @client - I2C device client
>   * @pdata: platform data
> + * @sel_reg_addr: mux select/deselect register address
>   */
>  struct mlxcpld_mux {
>  	u8 last_chan;
>  	struct i2c_client *client;
>  	struct mlxcpld_mux_plat_data pdata;
> +	__be16 sel_reg_addr;
>  };
>  
>  /* MUX logic description.
> @@ -60,24 +62,43 @@ struct mlxcpld_mux {
>   * for this as they will try to lock adapter a second time.
>   */
>  static int mlxcpld_mux_reg_write(struct i2c_adapter *adap,
> -				 struct mlxcpld_mux *mux, u8 val)
> +				 struct mlxcpld_mux *mux, int chan)

Changing val to chan is misleading for the one-byte case, where they
are not equal.

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
> +		data.byte = (chan < 0) ? 0 : chan;
> +		return __i2c_smbus_xfer(adap, client->addr, client->flags,
> +					I2C_SMBUS_WRITE, mux->pdata.sel_reg_addr,
> +					I2C_SMBUS_BYTE_DATA, &data);
> +	case 2:
> +		memcpy(buf, &mux->sel_reg_addr, 2);

Instead of precalculating these two bytes with cpu_to_be16 and storing the extra
copy, why not just write this as:

		buf[0] = mux->pdata.sel_reg_addr >> 8;
		buf[1] = mux->pdata.sel_reg_addr;

> +		buf[2] = chan;
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
> -	u8 regval = chan + 1;
> +	u8 regval = chan;
>  	int err = 0;
>  
> +	if (mux->pdata.reg_size == 1)
> +		regval += 1;
> +
>  	/* Only select the channel if its different from the last channel */
> -	if (mux->last_chan != regval) {
> +	if (mux->last_chan != chan) {

This is broken. last_chan doesn't store the last channel, it stores the
last regval (or 0). I.e., you should keep comparing with regval.

If you are not comfortable with the somewhat strange name of the last_chan
variable when it in fact records the last register value, then maybe you
should change the name of it to last_regval?

>  		err = mlxcpld_mux_reg_write(muxc->parent, mux, regval);
>  		mux->last_chan = err < 0 ? 0 : regval;

Note that 0 is used to mark a special state of no selected mux, which
ensures a write to the register on the next select request. That is now
broken if the next select request happens to be for chan 0 (because that
channel now has a regval that collides with the special state, i.e. 0).

Since you cannot avoid chan 0 until patch 6/7, this is broken at this
stage.

Also, after reading this and 6/7, I wonder why the one-byte case is
preserved at all? If noone is using it now, and apparently never has,
why not just ditch it? Or am I missing something?

Cheers,
Peter

>  	}
> @@ -103,13 +124,24 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
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
> @@ -122,6 +154,8 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
>  	data = i2c_mux_priv(muxc);
>  	data->client = client;
>  	memcpy(&data->pdata, pdata, sizeof(*pdata));
> +	/* Save mux select address for 16 bits transaction size. */
> +	data->sel_reg_addr = cpu_to_be16(pdata->sel_reg_addr);
>  	data->last_chan = 0; /* force the first selection */
>  
>  	/* Create an adapter for each channel. */
> diff --git a/include/linux/platform_data/mlxcpld.h b/include/linux/platform_data/mlxcpld.h
> index e6c18bf017dd..9cb2c3d8293e 100644
> --- a/include/linux/platform_data/mlxcpld.h
> +++ b/include/linux/platform_data/mlxcpld.h
> @@ -14,11 +14,13 @@
>   * @adap_ids - adapter array
>   * @num_adaps - number of adapters
>   * @sel_reg_addr - mux select register offset in CPLD space
> + * @reg_size: register size in bytes
>   */
>  struct mlxcpld_mux_plat_data {
>  	int *adap_ids;
>  	int num_adaps;
>  	int sel_reg_addr;
> +	u8 reg_size;
>  };
>  
>  #endif /* _LINUX_I2C_MLXCPLD_H */
> 
