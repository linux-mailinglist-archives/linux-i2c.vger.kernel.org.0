Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E682E2ECD70
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jan 2021 11:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbhAGKEt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jan 2021 05:04:49 -0500
Received: from mail-vi1eur05on2125.outbound.protection.outlook.com ([40.107.21.125]:61932
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725974AbhAGKEs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 Jan 2021 05:04:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eY9cR4WqAglgWe/r6ds/3b8AnF/w9Q0PVAdSOX4S6wNIRgmBmZRab0WQ6E1jRG5/jPv5QPwcVDMqrdl3MvJNHxdtWivfL9zFfcNd/CxhFQNXK4GlUSmV0/kEzpf12QdGVZM2DcjirUsr4VRNA0bzpRMPYbiB902SLMCccsCyzy43BZ5A8y+LEhZ2IxClgEYw4q6Iv0tNkgz0Zzq3BZJq0xGDAuYlWuEoBPfebnQ63xUqs1uNeEEp20WRRWOEEhwFg/ggvmDBfajS0DWr8RsT57rhsaKbp/8dvfcuZrNrQPFzi6QV47STxAvtSU9NYeXgsVvnxLlE+fHwldudvvut9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flDEBC9UjL9BbCDaPQWQS/cV2y9CWFBA90FYjN7iv5w=;
 b=I4nJDWIjl7AoHCkN52mCnmRWXGWpKCIkSkst2X3nGojmChn5BCC0yPBv2GQWKb+Eqo+ZpH0GZY0wkkirktJIgDcO07hmqblPnVNmOWXAwpHOQNyX+GhdyYLij2t7n+75FGha/hf4O8eejTvWaRtNoTuKSfguXV0699JJnsFQ8AcLbDQDv7n2NGnSjO6gaUZI6ZN8i2pf2vue3BK4JgskIKMDdSIjZFLwWfZiMhjY4lufbak2ErI+NU694q31AQwjn7G2vr8g/FqLmlJr1IiLlsBRJ3mVNxnKHkqsQwvnBr4CwZ3B9DKGkdCq9vShiPP8CHN6Rsq4w4QB/YtaJM7IJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flDEBC9UjL9BbCDaPQWQS/cV2y9CWFBA90FYjN7iv5w=;
 b=n/Vu+WaMfQk3XGHmlDTeCNEDIKUqZomXUTh5RYa3g6jNWYyBAFvxCoy7vwPBRt6f9wOAdl7cgaFq+WZJTElBgYi2Y5XJDBM80E+C+qGJDnw0QHJJvbJH2P1VTs9erUGVby+1aXnew39b0U7uMkrpSufyCzIHPc4bRUGTzYhblJk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB9PR02MB6747.eurprd02.prod.outlook.com (2603:10a6:10:1fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 10:03:57 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 10:03:57 +0000
Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver to
 support word address space devices
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20201118144416.184120-1-vadimp@nvidia.com>
 <20201118144416.184120-6-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <b1e3b52d-ddb2-ac56-665c-7500c939a55d@axentia.se>
Date:   Thu, 7 Jan 2021 11:03:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201118144416.184120-6-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR07CA0039.eurprd07.prod.outlook.com
 (2603:10a6:7:66::25) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR07CA0039.eurprd07.prod.outlook.com (2603:10a6:7:66::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Thu, 7 Jan 2021 10:03:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53b1463e-baa2-454b-0bcc-08d8b2f38c1e
X-MS-TrafficTypeDiagnostic: DB9PR02MB6747:
X-Microsoft-Antispam-PRVS: <DB9PR02MB6747A1F1BB8C4EA35F278B06BCAF0@DB9PR02MB6747.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yD1Bba/i/BNaZ+Vw7OfBQFlSLaG/Sl6ZD/3MlKsYWFjL9F/URENTls5T7HKj+e4jrWZZjdLNNvK0cC053mvu4eloy9j9VYkd7Ow8q88pjoLsHtQnqPp2ZTnk0JrCy5q2V9pQ+u2hxeIxrIguta8S4iorXWS2EVF5mmvvevjguPC4+VGmFaJsbe1+O190RqCBIUOxW+IdDgI+zb9xmrEQXyRhsUKzJ+Wd25xw4RIcMidCrP9YrUarufrj2fkOGHpD7d5gAyM5oLgAcUQhQAeknebW8wsdP4CzZzo/EPGDy1A1sFdziTBQ27nFtqNAI+T6Cui+EsJN/6G+Akljd5yUfLvvJiwlOqWWWtYb8Mg2Mt4HtgP/apCpKtAoJl5jDxY+l0/WNYVNQmWPO3RZv5WzehZ2/OCB6VHvbhOM82Aq1LRQD3thTvqbPUy8vFL/NObNsWW4fhTkRGB/a1sDWKpvv8BAxYrE4mbjlGJ3QUyqv/tX9xr5aGhnoZmMO1qle6xo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(39830400003)(136003)(346002)(376002)(16576012)(66946007)(6666004)(4001150100001)(86362001)(2616005)(66476007)(66556008)(956004)(316002)(31686004)(31696002)(2906002)(83380400001)(478600001)(36756003)(5660300002)(4326008)(8936002)(6486002)(53546011)(8676002)(186003)(16526019)(36916002)(26005)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OVkvQ0ROT0hKVlJleDZMcDhHM0VnVVRJdTJacU5mMTJTRnhuNWRSMTF1OVFN?=
 =?utf-8?B?ZWpPL3ordTBNYm9FdzQ1Q1EvcjFTSHdlYnA5Z24xblR5UldtbDQydGQyMW1E?=
 =?utf-8?B?UWFlaWtHUWs5ays3VkRLMzE2UmpGcGhNaXdxRE92S0tGRnh5NXB0R2d6UUNQ?=
 =?utf-8?B?SG1tUkdjelExbnJMdmMyZmE0bXFXMGNjWGQvYmN0NmNjK3NjSlZWQlJ5ZExV?=
 =?utf-8?B?SHBBWU9rU0dhTU55TXp2RThKUzVGTU45RWhpSDNIZlhKeHV2UzhCRmhOclJ1?=
 =?utf-8?B?MGJlbWhaenRHbGYxZFJNK3U1eStDNVVVT0Z5L2dsUStYZWV4Y0paY1RjSWJr?=
 =?utf-8?B?S3VYdUxnN3ExblNESjljWkRaRDQyb1Bad1EvWjJ3RDFXQXJ4amE3Lyt4ZWlK?=
 =?utf-8?B?VEFzQkZHVXBGaWZpL2FxR2hzajRLNXRKOHNrTTdteVBaQlpRSnluNDhMRDBJ?=
 =?utf-8?B?Y3EyNTRNM21OT0hDVThEaGUxeVlzSStnWFpWMXhONXVYVjdKZlBaYTF5SFFV?=
 =?utf-8?B?L2xiWVBOOHVRTVRjdXpNcTl1NXNhbmZqWFdRM25SWHJHK1lkZlZTZzV1WDN2?=
 =?utf-8?B?cmtOaysvbkxURmM3WEJ6eWpkYTNubFN3bTVNSWlpTWtkSDY5T0d6UC9aNUlJ?=
 =?utf-8?B?S3orb3hHTjFleWN0TWY5QlVMM2NQZFlvQ3RNQ1ptd0ZlZU56bXFGU1M3czhO?=
 =?utf-8?B?OUxINm1hSmZKQndyekRmazN2QW9kV1pHTU90RnJJQy9EdHN0azZYV1N0SWdh?=
 =?utf-8?B?Zyt0NU8wL2ZKcUd5R0I3SXozbG9vM1V0azJlbnBoQ04wamdmWVZ4dmtMR2tv?=
 =?utf-8?B?b0ZWK2wxaTdZQ1VxQ05oL3BPemp4VkpXQWsrcGdtclJNWHRVdmpSOTY1OEFY?=
 =?utf-8?B?c2t0dHpsQW9VcVovSFY0ZDhVTUJRbnRaaksrQVQvUnlrazRVaDBYeFp5cTRI?=
 =?utf-8?B?WUcxZ3k0bk1QVnJYMVRDand2c0NxZkUrWDlPbEYyM1JhM0x4REF2SWZJYnR4?=
 =?utf-8?B?Z2w3U0FjcXo2dTZGMWVSKzEwNWJxOXZJWlE5anZDMGRYYzJZM0ViOTNoZi8x?=
 =?utf-8?B?MzdqZTVXbkxYMWhJbXZIM01IT3BLRjRONjF4L2twT2hWN1hwYldFcWNleGJB?=
 =?utf-8?B?MURNTVI1K0t1S3VSVzJxdGZvTXdOaThHSkFiQi9XWW5VVlQ1Z00rS1lTSUdn?=
 =?utf-8?B?U3pMYjVJdjFUZzhEK2pmbFJzMWo5alR1R1RyejNJMEttUWxpY3FiTUhBS3R6?=
 =?utf-8?B?THdUZkhFOWkyajZXTHo4Mk1LM1FpQnBsbjR1UmQ4SWd5STVRTzZtYjhVT09o?=
 =?utf-8?Q?cLW68AXA1zfZzJaEGzT7vO5MdX1+wPTn1E?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 10:03:57.0061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b1463e-baa2-454b-0bcc-08d8b2f38c1e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QnBXww3P0LXhbIliJW6RPFe42coRopk8J1OQ2EMiR5kfnv8D57df+Z6ZmfOh3QS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6747
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

Again, sorry for the late review.

On 2020-11-18 15:44, Vadim Pasternak wrote:
> Extend driver to allow I2C routing control through CPLD devices with
> word address space. Till now only CPLD devices with byte address space
> have been supported.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> ---
>  drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 57 +++++++++++++++++++++++++++--------
>  include/linux/platform_data/mlxcpld.h |  2 ++
>  2 files changed, 47 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> index 6bb8caecf8e8..c76180919fc3 100644
> --- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> +++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> @@ -21,11 +21,13 @@
>   * @last_chan - last register value
>   * @client - I2C device client
>   * @pdata: platform data
> + * @sel_buf: I2C message buffer for mux select 16 bits transactions
>   */
>  struct mlxcpld_mux {
>  	u8 last_chan;
>  	struct i2c_client *client;
>  	struct mlxcpld_mux_plat_data pdata;
> +	u8 sel_buf[3];

I think it's a mistake to have this buffer here. I'd rather create a buffer on
the stack in mlxcpld_mux_reg_write() and fill it with values for every xfer.
Sure, I bet there are external locks that prevent any clobbering of the buffer,
but it's so small that it really can be on the stack.

>  };
>  
>  /* MUX logic description.
> @@ -60,26 +62,42 @@ struct mlxcpld_mux {
>   * for this as they will try to lock adapter a second time.
>   */
>  static int mlxcpld_mux_reg_write(struct i2c_adapter *adap,
> -				 struct mlxcpld_mux *mux, u8 val)
> +				 struct mlxcpld_mux *mux, int chan)
>  {
>  	struct i2c_client *client = mux->client;
> -	union i2c_smbus_data data = { .byte = val };
> -
> -	return __i2c_smbus_xfer(adap, client->addr, client->flags,
> -				I2C_SMBUS_WRITE, mux->pdata.sel_reg_addr,
> -				I2C_SMBUS_BYTE_DATA, &data);
> +	union i2c_smbus_data data;
> +	struct i2c_msg msg;
> +
> +	switch (mux->pdata.reg_size) {
> +	case 1:
> +		data.byte = (chan < 0) ? 0 : chan;
> +		return __i2c_smbus_xfer(adap, client->addr, client->flags,
> +					I2C_SMBUS_WRITE,
> +					mux->pdata.sel_reg_addr,
> +					I2C_SMBUS_BYTE_DATA, &data);
> +	case 2:
> +		mux->sel_buf[mux->pdata.reg_size] = (chan < 0) ? 0 :
> +						    mux->pdata.adap_ids[chan];

I get the feeling that you are desperatly trying to get some specific numbering in
user space.

The adapter id is one thing.
The mux channel is one thing.
The value in the register is one thing.

Often, it can make things easier with an easy mapping between the latter two,
but you program the system global I2C adapter id into the channel selection
register of the mux. That is problematic. Just don't.

> +		msg.addr = client->addr;
> +		msg.buf = mux->sel_buf;
> +		msg.len = mux->pdata.reg_size + 1;
> +		msg.flags = 0;
> +		return __i2c_transfer(adap, &msg, 1);

Here you use I2C xfers for the 16-bit case...

> +	default:
> +		return -EINVAL;
> +	}
>  }
>  
>  static int mlxcpld_mux_select_chan(struct i2c_mux_core *muxc, u32 chan)
>  {
>  	struct mlxcpld_mux *mux = i2c_mux_priv(muxc);
> -	u8 regval = chan + 1;
>  	int err = 0;
>  
>  	/* Only select the channel if its different from the last channel */
> -	if (mux->last_chan != regval) {
> -		err = mlxcpld_mux_reg_write(muxc->parent, mux, regval);
> -		mux->last_chan = err < 0 ? 0 : regval;
> +	chan++;

I question the removal of the regval variable. See above.

> +	if (mux->last_chan != chan) {
> +		err = mlxcpld_mux_reg_write(muxc->parent, mux, chan);
> +		mux->last_chan = err < 0 ? 0 : chan;
>  	}
>  
>  	return err;
> @@ -103,13 +121,26 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
>  	struct i2c_mux_core *muxc;
>  	int num, force;
>  	struct mlxcpld_mux *data;
> +	u16 sel_reg_addr = 0;
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
> +		func = I2C_FUNC_SMBUS_WRITE_WORD_DATA;

...and here you setup to check for SMBUS for the 16-bit case. And the type of
SMBUS xfer is not compatible with the xfer that is actually taking place.
WRITE_WORD_DATA is 8-bit register and 16-bit data. You have the opposite.
So, this check is broken.

> +		sel_reg_addr = cpu_to_be16(pdata->sel_reg_addr);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (!i2c_check_functionality(client->adapter, func))
>  		return -ENODEV;
>  
>  	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, CPLD_MUX_MAX_NCHANS,
> @@ -122,6 +153,8 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
>  	data = i2c_mux_priv(muxc);
>  	data->client = client;
>  	memcpy(&data->pdata, pdata, sizeof(*pdata));
> +	/* Save mux select address for 16 bits transaction size. */
> +	memcpy(data->sel_buf, &sel_reg_addr, 2);
>  	data->last_chan = 0; /* force the first selection */
>  
>  	/* Create an adapter for each channel. */
> diff --git a/include/linux/platform_data/mlxcpld.h b/include/linux/platform_data/mlxcpld.h
> index e6c18bf017dd..da4f7e8f5721 100644
> --- a/include/linux/platform_data/mlxcpld.h
> +++ b/include/linux/platform_data/mlxcpld.h
> @@ -14,11 +14,13 @@
>   * @adap_ids - adapter array
>   * @num_adaps - number of adapters
>   * @sel_reg_addr - mux select register offset in CPLD space
> + * @reg_size: register size in bytes (default 0 - 1 byte data, 1 - 2 bytes data

The reg_size isn't in bytes according to the brackeded info. Missing end bracket
as well...

Cheers,
Peter

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
