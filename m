Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B0D2ECB37
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jan 2021 08:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbhAGHxu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jan 2021 02:53:50 -0500
Received: from mail-eopbgr00138.outbound.protection.outlook.com ([40.107.0.138]:64417
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726793AbhAGHxt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 Jan 2021 02:53:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcrOE0B+//FCp71dNlPoTQIG5TerxSpRg78DOCibL4DJGpNOR4JmaVA+JzqUo8tj4IAtlBZ/gMiZZz6tqrwlhndqFpieJ9DWit/X3DN33xbGBTY8CVlyK2RSPvFTAZzAZnJHBZbOkn80cTbAvAvJnfqBydZIVs2yld40wfkdPqvlemZeCd3PRj7W5OpF13hBgwhbCxNGUZuGu3J7FI4nIbD5P/RT6PzaeEBEd5psEbh3Qg1d5VkrpfIoYoC0RoH3Lk2z+YZFn8qz8wg0TK05BDayagp057bKQlYGCx1HmopF5b+fdu7j/vQ9dTV3gL//qvu83WtM17Bc8NxF3Sytrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDuaJAvyT186SYGxWSTjrgCqJr+3WG1Hz036XT8qq+E=;
 b=OYyhUKMF+NWvW7CG05KzSGo3lzT2Yy5WEF9ecot6v5exyURBGSPQUwOizuQj08Tc5jSe5n+n6iRl0Po+Pie2hRcCtVw53bgplwJK6YLcWKfRRPjhqdt0Sz/txd59v22vMKuwXCNg1TN1+cl3/wkoItjmtQEN7Ty+fsZ+P41fgpfNwm/OcBA0qb9+eYN8ZGDme2+57ivew8GnGP9G9EzaLKDJyYHlxl0+nsSyNfbnHYnCqHaTFzcbA6Qotr08j45wyP3CJ8t6HZ/MZ8SaolKfcfaqOShOHlz5yUKXKc2LMFKckKuJEm49F/QIWQlhU9s3isoPlKT/HJIJZBpUx99lbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDuaJAvyT186SYGxWSTjrgCqJr+3WG1Hz036XT8qq+E=;
 b=TYQ8s19v5HP8RA8h4SoRrm3SeqbQs+e8Z2kDXrfVoskcuMgkc7gCxzC0Ka1u8wNL03iwA81oDuZE+xN2SEXDpcuSFoC+jzEoJF9t3mPZfv1+MMjXVYKKeEVewMhv6in30iIMpLbCWXqS8yWwmxUvbx2QQKtThv20jKaCyOIR5cM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR0201MB2167.eurprd02.prod.outlook.com (2603:10a6:4:44::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Thu, 7 Jan
 2021 07:52:59 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 07:52:59 +0000
Subject: Re: [Re-send: PATCH i2c-next 4/6] i2c: mux: mlxcpld: Convert driver
 to platform driver
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20201118144416.184120-1-vadimp@nvidia.com>
 <20201118144416.184120-5-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <110e5fe3-f515-d0a6-05bc-380756b86e9b@axentia.se>
Date:   Thu, 7 Jan 2021 08:52:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201118144416.184120-5-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR08CA0044.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::15) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR08CA0044.eurprd08.prod.outlook.com (2603:10a6:7:2a::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 07:52:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6945d1c5-0747-4d09-f496-08d8b2e14099
X-MS-TrafficTypeDiagnostic: DB6PR0201MB2167:
X-Microsoft-Antispam-PRVS: <DB6PR0201MB21672118A3101C010FFF95F5BCAF0@DB6PR0201MB2167.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z+L6KCNTZe8v2WlNuRu4z6grTQYdzyEo8PrSSg2Xf91kPfTcnuYL2235Wx2pMpw1UKEgEAVsvfFbmIZbkD4PevxnxtJcZkP7X85PvgByDdDcO/wBw+bng3ZI0vg7v7lbv4tSwvb3T1Mi83mI8e/ZwjzdTo7gEFcjD2nLA5NT+66QyrPr2h+TUqeBxRKmpiJPk76P/kNnDk1cOS6Bq9LaNAPBtB2rVefhqOP5OiHeee4hCbAspKYsbd3CHCadNJZFz4TgeRj+woYrSUVwLcgiXZ9xIn5sIeC+VZOQTT5vqM9uPfUjUNw+iP3xsXMk1rqs8/U8Uz1YEJvTObgNt4paUxpoDEHkmgD6CGu50X0y6UbnH6DRniW5+yF/nyOtQitGpY3cnrCvnQLKvZHRvQPUftKEHBuJhDPeWewjgPvtiXBOKjodGS/3TFOWto5BjUZpNgAqnhRzujgENlpIiIWA1q6kixS95uovs4zCETT4EhFEXb/b/oOJ9Gvs6DTUNJ53
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(346002)(136003)(396003)(376002)(366004)(16576012)(53546011)(66556008)(83380400001)(316002)(5660300002)(8936002)(66476007)(186003)(956004)(2616005)(66946007)(31696002)(478600001)(4326008)(26005)(16526019)(8676002)(4001150100001)(2906002)(36756003)(36916002)(86362001)(31686004)(6486002)(133343001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y1hxQ3gwS0paSEY0SHgxdGkyTTV0bS9iUndudUlobzAzYVorOHp4eXN5cllZ?=
 =?utf-8?B?MEdBVkhVTTJlNlVGRGtnVnRvVk5aZUExOTcyWFY3bVErdUQvUGVJWGNEc29x?=
 =?utf-8?B?bnZnWHo3T1FwY1h2UHMraGVwTmpCUmxIZnREa0thTHZFTytZVDJiSUpadEps?=
 =?utf-8?B?aTJ0dUNNOFZTMjFMTkIzZThtenVHOXNDUHc4TFArdzQ4ZnJWTXBsZnFWMWV4?=
 =?utf-8?B?QlNZRWdwUjR0Q1c4SnA0QnFGaG5hRkcvOU82d1hzeFFubldsSUtGdnVCR2tX?=
 =?utf-8?B?bWdoUnF5YlJXb0dJS2VZTmV5YWFJZVlDdTV2NEN5c2tXd2xMUUF5WEErUlRW?=
 =?utf-8?B?R2tSMmdVOE1lc3d0cVVQcllzL0JwU242NzZJaTFYSmplSEVWQnM3QXdEbzZT?=
 =?utf-8?B?YjQ2enB4eUlNc1lYb1pjRWpWMGhUaDk5cjRTS2N1U1RqM3p3SnFRTHh6aWRh?=
 =?utf-8?B?K0dMenNxNjI2YkFMdnZEdVlQd3JwM1hpU0p4cXVGak5hNXZIRDNoZ0hLU1dW?=
 =?utf-8?B?VE9xeSsyMUQ4NGtiV3A5Q2tnQzg2cXhxZDRPSEVkK21NL2h4TGg1L2x0Sksz?=
 =?utf-8?B?aENnb3NYMjJKNHVOTTd1eVJkMWdpdS8rMk1sSlAveWRXcE1RUFNCR0lkMlFN?=
 =?utf-8?B?U2ZzVlZxMFJIVDZZSklBYnhmUGFxcUFWeXpMTCtCd2dpV2hNc0ZiaEk0enh6?=
 =?utf-8?B?TEgrL1REVitSUmtWcFZxS05hNE5PNkFqTXFxREdlZ3pxbDRiQUIxSk4yNWlQ?=
 =?utf-8?B?ODdlQlZEN1NkLy9zcnhZVDllRFJHY2JOT1NrUXJJOWEwd0NyWlVzdDJsZlVl?=
 =?utf-8?B?bDNlOUtQdG40Zld4QkNiSEVsQjdETDNDbWJpSC9LK1ROamNGU2tkbTB2YmV1?=
 =?utf-8?B?VjlKeGYwbHZidWRJelBoUXFiOFlkbWpJdVNxWjU3aFU1OGwxQTBqdEhxdXFt?=
 =?utf-8?B?UGJZOW9WRkpXQ3FiMmtHWCs3OFJROFFSUXk0QmY1a3JpQTBPZHRLSTVPS1lh?=
 =?utf-8?B?dnQ0ZU5ZWUFLaG9ydSs2SkFIeWdUZFJKOXJSNm51VEhsTkc1aC9OQUp6dU1E?=
 =?utf-8?B?Ti9rU2ZRQVV0ZGdSbGJubUxwVkJzWjlWNHB5NFROcWU5NnVQQlY5bVpLQzE0?=
 =?utf-8?B?d3VXczZrKzFYZlU1Snk5akxJKzBiZ0c1NjBDWE9OeHdKWHgyWnVpVzJMUUJh?=
 =?utf-8?B?RFQxZTJETGc1cXVZNHQ1V0F5OVFQL3hoeXdoWE1qRTliaThELzE2d282Rlo1?=
 =?utf-8?B?RDhHUkxpZER0NnN4c1J5d01uZ1psVXZxK04vWFpaNDAvbXNyR0VYZ0pndUwr?=
 =?utf-8?Q?ctxm+430tX677XUKFyQI2CziIxNSGcvhQv?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 07:52:59.3003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-Network-Message-Id: 6945d1c5-0747-4d09-f496-08d8b2e14099
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UK+4eNqz42ESvkHfvMBxrD9zCEWwrn5HcYb25enMMmxL/rRhnvimhsf//DhumtO9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0201MB2167
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

I appologize for the late review. Sorry about that.

On 2020-11-18 15:44, Vadim Pasternak wrote:
> Convert driver from 'i2c' to 'platform'.
> The motivation is to avoid I2C addressing conflict between
> ‘i2c-mux-cpld’ driver, providing mux selection and deselection through
> CPLD ‘mux control’ register, and CPLD host driver. The CPLD is I2C
> device and is multi-functional device performing logic for different
> components, like LED, ‘hwmon’, interrupt control, watchdog etcetera.
> For such configuration CPLD should be host I2C device, connected to the
> relevant I2C bus with the relevant I2C address and all others component
> drivers are supposed to be its children.
> The hierarchy in such case will be like in the below example:
> ls /sys/bus/i2c/devices/44-0032
> i2c-mux-mlxcpld.44  leds-mlxreg.44  mlxreg-io.44
> ls /sys/bus/i2c/devices/44-0032/i2c-mux-mlxcpld.44
> channel-0, …,  channel-X
> 
> Currently this driver is not activated by any kernel driver,
> so this conversion doesn’t affect any user.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> ---
>  drivers/i2c/muxes/i2c-mux-mlxcpld.c | 62 +++++++++++++++++--------------------
>  1 file changed, 28 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> index 3d894cfb19df..6bb8caecf8e8 100644
> --- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> +++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> @@ -20,10 +20,12 @@
>  /* mlxcpld_mux - mux control structure:
>   * @last_chan - last register value
>   * @client - I2C device client
> + * @pdata: platform data
>   */
>  struct mlxcpld_mux {
>  	u8 last_chan;
>  	struct i2c_client *client;
> +	struct mlxcpld_mux_plat_data pdata;
>  };
>  
>  /* MUX logic description.
> @@ -54,37 +56,30 @@ struct mlxcpld_mux {
>   *
>   */
>  
> -static const struct i2c_device_id mlxcpld_mux_id[] = {
> -	{ "mlxcpld_mux_module", 0 },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(i2c, mlxcpld_mux_id);
> -
>  /* Write to mux register. Don't use i2c_transfer() and i2c_smbus_xfer()
>   * for this as they will try to lock adapter a second time.
>   */
>  static int mlxcpld_mux_reg_write(struct i2c_adapter *adap,
> -				 struct i2c_client *client, u8 val)
> +				 struct mlxcpld_mux *mux, u8 val)
>  {
> -	struct mlxcpld_mux_plat_data *pdata = dev_get_platdata(&client->dev);
> +	struct i2c_client *client = mux->client;
>  	union i2c_smbus_data data = { .byte = val };
>  
>  	return __i2c_smbus_xfer(adap, client->addr, client->flags,
> -				I2C_SMBUS_WRITE, pdata->sel_reg_addr,
> +				I2C_SMBUS_WRITE, mux->pdata.sel_reg_addr,
>  				I2C_SMBUS_BYTE_DATA, &data);
>  }
>  
>  static int mlxcpld_mux_select_chan(struct i2c_mux_core *muxc, u32 chan)
>  {
> -	struct mlxcpld_mux *data = i2c_mux_priv(muxc);
> -	struct i2c_client *client = data->client;
> +	struct mlxcpld_mux *mux = i2c_mux_priv(muxc);
>  	u8 regval = chan + 1;
>  	int err = 0;
>  
>  	/* Only select the channel if its different from the last channel */
> -	if (data->last_chan != regval) {
> -		err = mlxcpld_mux_reg_write(muxc->parent, client, regval);
> -		data->last_chan = err < 0 ? 0 : regval;
> +	if (mux->last_chan != regval) {
> +		err = mlxcpld_mux_reg_write(muxc->parent, mux, regval);
> +		mux->last_chan = err < 0 ? 0 : regval;
>  	}
>  
>  	return err;
> @@ -92,21 +87,19 @@ static int mlxcpld_mux_select_chan(struct i2c_mux_core *muxc, u32 chan)
>  
>  static int mlxcpld_mux_deselect(struct i2c_mux_core *muxc, u32 chan)
>  {
> -	struct mlxcpld_mux *data = i2c_mux_priv(muxc);
> -	struct i2c_client *client = data->client;
> +	struct mlxcpld_mux *mux = i2c_mux_priv(muxc);
>  
>  	/* Deselect active channel */
> -	data->last_chan = 0;
> +	mux->last_chan = -1;

Why do you change from 0 to -1 here? That change seems totally unrelated and
such a subtle change deserves its own commit with its own motivation.

Cheers,
Peter

>  
> -	return mlxcpld_mux_reg_write(muxc->parent, client, data->last_chan);
> +	return mlxcpld_mux_reg_write(muxc->parent, mux, mux->last_chan);
>  }
>  
>  /* Probe/reomove functions */
> -static int mlxcpld_mux_probe(struct i2c_client *client,
> -			     const struct i2c_device_id *id)
> +static int mlxcpld_mux_probe(struct platform_device *pdev)
>  {
> -	struct i2c_adapter *adap = client->adapter;
> -	struct mlxcpld_mux_plat_data *pdata = dev_get_platdata(&client->dev);
> +	struct mlxcpld_mux_plat_data *pdata = dev_get_platdata(&pdev->dev);
> +	struct i2c_client *client = to_i2c_client(pdev->dev.parent);
>  	struct i2c_mux_core *muxc;
>  	int num, force;
>  	struct mlxcpld_mux *data;
> @@ -115,18 +108,20 @@ static int mlxcpld_mux_probe(struct i2c_client *client,
>  	if (!pdata)
>  		return -EINVAL;
>  
> -	if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
>  		return -ENODEV;
>  
> -	muxc = i2c_mux_alloc(adap, &client->dev, CPLD_MUX_MAX_NCHANS,
> +	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, CPLD_MUX_MAX_NCHANS,
>  			     sizeof(*data), 0, mlxcpld_mux_select_chan,
>  			     mlxcpld_mux_deselect);
>  	if (!muxc)
>  		return -ENOMEM;
>  
> +	platform_set_drvdata(pdev, muxc);
>  	data = i2c_mux_priv(muxc);
> -	i2c_set_clientdata(client, muxc);
>  	data->client = client;
> +	memcpy(&data->pdata, pdata, sizeof(*pdata));
>  	data->last_chan = 0; /* force the first selection */
>  
>  	/* Create an adapter for each channel. */
> @@ -149,24 +144,23 @@ static int mlxcpld_mux_probe(struct i2c_client *client,
>  	return err;
>  }
>  
> -static int mlxcpld_mux_remove(struct i2c_client *client)
> +static int mlxcpld_mux_remove(struct platform_device *pdev)
>  {
> -	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
> +	struct i2c_mux_core *muxc = platform_get_drvdata(pdev);
>  
>  	i2c_mux_del_adapters(muxc);
>  	return 0;
>  }
>  
> -static struct i2c_driver mlxcpld_mux_driver = {
> -	.driver		= {
> -		.name	= "mlxcpld-mux",
> +static struct platform_driver mlxcpld_mux_driver = {
> +	.driver = {
> +		.name = "i2c-mux-mlxcpld",
>  	},
> -	.probe		= mlxcpld_mux_probe,
> -	.remove		= mlxcpld_mux_remove,
> -	.id_table	= mlxcpld_mux_id,
> +	.probe = mlxcpld_mux_probe,
> +	.remove = mlxcpld_mux_remove,
>  };
>  
> -module_i2c_driver(mlxcpld_mux_driver);
> +module_platform_driver(mlxcpld_mux_driver);
>  
>  MODULE_AUTHOR("Michael Shych (michaels@mellanox.com)");
>  MODULE_DESCRIPTION("Mellanox I2C-CPLD-MUX driver");
> 
