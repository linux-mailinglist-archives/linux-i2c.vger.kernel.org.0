Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60D6255FE1B
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 13:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbiF2LCw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 07:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbiF2LCv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 07:02:51 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2092.outbound.protection.outlook.com [40.107.22.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FD63E5D3;
        Wed, 29 Jun 2022 04:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDcQpCKBC0gatWRFP1UdfFJaCUvFEJXJkGbEW8uNRDjZd8Xsb8eQTY5u99pWWlaeqJ0hWryVz5TOvtOrbIahGIxwgRWs7UseTQzvcKtv78qO3MJCdbmfbk67iR+y3DJa995q0ITAFhRxKGN8CjZHqi+XD4Iq3lRtUkSA7JxxLNA+XqnjLOpgTKdm14VGYc4zFB87R9NteuFaXOi9tKdna4b4nqR+bHcXvOudBhiUDbWmYSb4Ifgqpg85+uZ2eUYD8NVEqqN/WEHEtbi429egt+u58vtetZY/wbr6o2ZzqQqMM2lFakMpTWKqizIwQ2FxnR9sAeKNOnvBJuBRd+hfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqYiDYV2Q6T8F/LDHnflgRnR/eYTY97f4On93O44Fxw=;
 b=OgV5qWkDZG8EiZVfZo09iCeEnlbTzkeQe70Rqk+GP/7RoMSIhEiOyFaR5H71ti5f2g0c2mXXsbWHxyvYAhNiPLhSaI2Lgg4VZO0nzpJvK2iPEMSEbBqJb9bnXnK1X4tUy8VpHmRWrbGxDDuEC89Ew+aLF1UUYfbq9t+TQ/QygYoeSMn6AgrExWzHZ4PrBoyMFWDl6t6VwYdF8IDQLEJJCJIpKQvjA6xUsYDC2MPWShgmSbHjJYV6xU1B3H5ROsqc/OH0AszBsl4FeDMcwp4o9sU0OeB48qJIhLLPH24DIBq04j8DK8BCjenBqmGdXGAzKjZC7E2Wiv/y++99x38PzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqYiDYV2Q6T8F/LDHnflgRnR/eYTY97f4On93O44Fxw=;
 b=h+gc37mLqhTpN13Iday6ABYttLRQuN0m4HlL9gjUDnvvEI2rv62XXa8WSOBuJSEZV+97fd8UFqXCGt+SD92FAjnycXGXOF78MP8WpbSc9Xodj9tJnzThfa4mwe1UbSPNZDupzN+L/bL5aKBmpSrA8aZYfK6bb3B6G13x16SWwyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by PAXPR07MB8889.eurprd07.prod.outlook.com (2603:10a6:102:248::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.11; Wed, 29 Jun
 2022 11:02:47 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293%9]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 11:02:47 +0000
Message-ID: <c8d4faf1-5f0c-4adb-e52a-92d46179ffa4@nokia.com>
Date:   Wed, 29 Jun 2022 13:02:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
Subject: Re: [PATCH v2 02/10] i2c: xiic: Add standard mode support for > 255
 byte read transfers
To:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com, marex@denx.de, joe@perches.com
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <20210626102806.15402-3-raviteja.narayanam@xilinx.com>
Content-Language: en-US
In-Reply-To: <20210626102806.15402-3-raviteja.narayanam@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0241.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::17) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be409b72-4e3f-40db-fd84-08da59bee65c
X-MS-TrafficTypeDiagnostic: PAXPR07MB8889:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EU2//vCYwA2kt93vwr5FOaMmzHGLr4t8/v4V4qdo9+42BPlyV44v4oF8GoxSp9Yp/XIhXKfyrSWmeQWdll64i4PyqIepMPiuxvqPJErcB0tLbjN6jo84q+YhyBy1XA2R3BYCXmJOt5/nzKbkP8/reggJKj6s/+Ap0tau6uzbp/TefpWim7G4G8csVCKn6KDBL9MDHnGnrivg6KofzVs2YrwZ+Yk85R3WoVjaF/VdbgXLm7KtEteLM4g//IqbrEiCegKY2cVClEOSa436nk0uU3x7mLlxo/k+TBnzMSD/1Zgfmi7sAPuNTGW3bBqSPcgWVvwrq7561lXCPo20+Twvvyf2GGT2aNiVvJxbY+jMhJCM1xm3wrtICLNkcpxBXFtHJQWIAd3Uq752Qa531LnVjBaz0ft8NTJOwARlJEcHzF3niipknOs1yGJn/W6EH9g3LrwXpE4IrCVSTkBGddsMMB+wpsbJIFbyY9Iz3Xs0LGzNvUTtZJKunABbsFqq4KYBZ4BpLX9vPVDedT8DiTIq4OJVDYn481cnkAJjOCLjdXTtlaP1PbwIO8ZLqC/rOdkP+wNMzbafAByKYoGWrOhDqc8MRriuzMXBwp8c9CIbosOxnWFJh1fNZynTquWN3mnoXQj8xGM/f6wqbseBx5bGkT2F1DLknbbHiniaEv8r8VOJa7puojLlnZKmllnMUtPM0oE90OlOaJBp2rnFrFL+8H2rwxNFki39UWKMRGit20CIKxj+C6434AoywekqsA+XuXzwirX0TLyI+Pb1B3X6Wmsql7FqdgTQMKXc58ELXxBNqWIyEE9juYima8Tku5Vd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(4326008)(31696002)(86362001)(2906002)(36756003)(31686004)(8936002)(6512007)(26005)(186003)(6506007)(6486002)(82960400001)(478600001)(66476007)(2616005)(66946007)(8676002)(66556008)(83380400001)(6916009)(41300700001)(316002)(5660300002)(38100700002)(30864003)(44832011)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L21GeFhjeHRERFRjbzJzdlNBU1pQbVVpZUJkWU5tbjlGcGcxakNXMUpDeWQ1?=
 =?utf-8?B?MlNiSy9qektQaVJMaXRCc1JMTy9Jb3BrN1hKSmlPOElmSHVYM1RsOEdkdnpF?=
 =?utf-8?B?MkZ3TkM5b0V2V1FiSnh2OHZreVFQTTJhcExMUU5GYnhrazljakVRb2VQdDFp?=
 =?utf-8?B?NXVGbFNUNFJRU2lpTFc1NGpxS25tOUlLUWxUNXNKZzF2REhmd0c5YU9Zdkox?=
 =?utf-8?B?dHFvZ1NTVEx5cldsVnBSYStrREVkcjdSbXE5OGFNYXU3L0k3Uk1Od05iV0Y4?=
 =?utf-8?B?aWJ1TzBpUTBiZE5qQkdEZ2dMZ2NBY2p3b1lJaGowR2thdlpPVkhTd0NvY0cr?=
 =?utf-8?B?cTdvdk42ellLSElQWnRIdUwweXhEM0hURGRhWWFZY0RQOHIwMXUrM1pLVExh?=
 =?utf-8?B?L2Q2SmNuV0g3WVZudGQrbCtjRy95Y0pPMEZlOWtCNjJleHMzM1RHc1dIUmFw?=
 =?utf-8?B?bkpxSHIzUldkZjV3OHRJd1NFWTRiNzY1aWhVZ2dKWU5NUitXN0p3V1lTbVdm?=
 =?utf-8?B?cjk1NWt5WmNUeElmSHIwaHI0SUJONjg4M2ZNekYyek5Yd2FIQkxJREJpQmRo?=
 =?utf-8?B?MkhKTmlpRzkyV2cvL2Y0blVxRUJTTy9yWFBOTVJXelU2SWVPamNDaXFVOXd1?=
 =?utf-8?B?VlV2QVVHdm11eXlTQnBpRFkwSUxKUWF1NFRSS2p5R2c3cXJzM25iZW5KUDQz?=
 =?utf-8?B?YzZvT240N29VYkpiQi9rVGRPdWErbzdUY3lBaWx3b3VaZHJVMUZzWTljdmU4?=
 =?utf-8?B?MlUweUIra0huSXVjWVJmZzFZSjJJR3ZpT2gzeEx1S1haVnJzeHdpL3lQdjFk?=
 =?utf-8?B?MXZPSFkvZVRiaVM4czBqRFlHbXBXMnZ1bXI0eUcxNHhIS0NWaTlZUmNLa3I0?=
 =?utf-8?B?K3M1dDIxYVRqYVlBNktFWmdDWEdVZzZYenpaUWhiSndmZzFtaTZwaDhsN0g0?=
 =?utf-8?B?QWJSb1gxOFF0S3cwbDRZTVBwMjZYZ04yN2VWbEpQR214QzJ3UktmejdBcWRv?=
 =?utf-8?B?SzErZTkyZWFaOC96UDlXdm9YQm1XUklsa0tjWXlpRHZ6ak9yNDI3N3FNWnUr?=
 =?utf-8?B?dDFmQXZlL1V5N1lJL2VjNytyZndLTTduMENwRVR0M3Ztd3M3aFFGRXRxTG85?=
 =?utf-8?B?VFB6NlNmdWM4YXUxMVZnb0xNL2ZtRit5SGYzUTc4cnJzaXJyMWNkNmt5cjMy?=
 =?utf-8?B?R29UNmRIclk4R0FqS0tDSzlwLytVNkJOODFCcnJ1N1Y4TW5uNUhGbUdxVVd3?=
 =?utf-8?B?L2ZVeUg2emtyQXVWa0drNFJFL0tUSmU1bFZVN0FtUG1obk1uanp0MWhZYlI1?=
 =?utf-8?B?b0cwc0plQVBneS9NSXZ5a0R2cGJBZW55bGJteG9hMDRZdUtoR1Nvc0d2YjVD?=
 =?utf-8?B?WmNrV3FJU1FzS3RWN2xXNlB2WHpoQmlhWXFhRkUrcUFnWTMwcGt2ZkFYMmVG?=
 =?utf-8?B?d2V6VEc0N2xsaUJLU2tjenVycG1WbXY4Ykg2OVZhVjFqbExMUTJ0QlFDNGht?=
 =?utf-8?B?bTlidjFYMWpqK1JUbXI0amV1TmxvSmM3aHV6VVhzSnRDSEY1Zm9reEIvbzE5?=
 =?utf-8?B?UVFXMStySjIyeXBCZ0ExTlhoVGJlSk1ENGJlazIxNHJUNlFHc3NIMllBdzd6?=
 =?utf-8?B?Yk1yY0pVWFhKbmljVHF2NTd2YU5WbWI0NVR2UWtZdGl5VWd6ckdjTFJvOWc4?=
 =?utf-8?B?cUJHZ3VmeHpCU0owaC90WU9tYTVvT0NDQitHUkRqVkt3Q01EcnhueDdjakVm?=
 =?utf-8?B?cU9hSVBwVWtla0d2UTFaVmhyK3Z4TFp0RUZhbzhVUDBoemRqeTJlc2N2SStX?=
 =?utf-8?B?SlkvcjZNRXJwM2pPa1VUZ1FBRWw5MFhxY1lDREVTb2p6Y3RnZXJycTVDWlFH?=
 =?utf-8?B?ZFNxV2MxVGNUaFF5aytiWGNjbFdBUUlOekFhWmRZNGhCWGYzM0xOSy9FK3Bo?=
 =?utf-8?B?L25zY25NdjhSeDhCSmd4Y1F6QWVhbzlrdC9FU2F2aGV2a00xMVU2NnlmOTlZ?=
 =?utf-8?B?RHBMdEZoNk9DOUIyZEwwRUUrN2NVWGdwbHNqb21ZVE1pb05reEFpM2lTakxh?=
 =?utf-8?B?SDZydFNBVnhKRi82UFB2MzVHdURBbXhhTU5NVkZPVEdHaElEbThVRXJLb3lE?=
 =?utf-8?B?ZTR3YmZoRytFNzBYbUxRejdaWXJ6SzhpS0dLNU1xa3RGay9Tc2ZtMHRaYy9p?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be409b72-4e3f-40db-fd84-08da59bee65c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 11:02:47.1889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LuSlNwGln7K9nqqT9d4KbFbaDlsP3K36nhSiS6uxWYmrigP0EKmHziHSi6rw4WlIcnJGWqo55epvrYhbGkFpfWcwzO4BU0ZTHvu19t4dRG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8889
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

I know this patch is quite old but we need the smbus_block_read
functionality, which depends on this one, so I would really like this to
be merged. See my comments below.


Dnia Sat, Jun 26, 2021 at 03:57:58PM +0530, Raviteja Narayanam napisał(a):
> In the current driver implementation, there is a limit of read
> transfer size to 255 bytes as it is using AXI I2C dynamic mode.
> But the IP supports this transfer through standard mode.
>
> So added AXI I2C standard mode support to enable read transfers
> of size more than 255 bytes. The driver scans through the message
> request from user space and selects AXI I2C standard mode if there
> is a read request of more than 255 bytes. Then the whole message goes
> through standard mode Tx and Rx paths.
>
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> ---
> drivers/i2c/busses/i2c-xiic.c | 367 +++++++++++++++++++++++++++++-----
> 1 file changed, 319 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index b0cfd9d15467..004103267e9c 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -60,6 +60,8 @@ enum xiic_endian {
>   * @clk: Pointer to AXI4-lite input clock
>   * @state: See STATE_
>   * @singlemaster: Indicates bus is single master
> + * @dynamic: Mode of controller
> + * @prev_msg_tx: Previous message is Tx
>   */
> struct xiic_i2c {
> 	struct device *dev;
> @@ -76,6 +78,8 @@ struct xiic_i2c {
> 	struct clk *clk;
> 	enum xilinx_i2c_state state;
> 	bool singlemaster;
> +	bool dynamic;
> +	bool prev_msg_tx;
> };
>
>
> @@ -144,6 +148,9 @@ struct xiic_i2c {
> #define XIIC_TX_DYN_START_MASK            0x0100 /* 1 = Set dynamic start */
> #define XIIC_TX_DYN_STOP_MASK             0x0200 /* 1 = Set dynamic stop */
>
> +/* Dynamic mode constants */
> +#define MAX_READ_LENGTH_DYNAMIC		255 /* Max length for dynamic read */
> +
> /*
>   * The following constants define the register offsets for the Interrupt
>   * registers. There are some holes in the memory map for reserved addresses
> @@ -270,6 +277,24 @@ static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
> 	return 0;
> }
>
> +static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
> +{
> +	u8 isr;
> +	unsigned long timeout;
> +
> +	timeout = jiffies + XIIC_I2C_TIMEOUT;
> +	for (isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
> +			!(isr & XIIC_INTR_TX_EMPTY_MASK);
> +			isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET)) {
> +		if (time_after(jiffies, timeout)) {
> +			dev_err(i2c->dev, "Timeout waiting at Tx empty\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> static int xiic_reinit(struct xiic_i2c *i2c)
> {
> 	int ret;
> @@ -311,13 +336,14 @@ static void xiic_deinit(struct xiic_i2c *i2c)
>
> static void xiic_read_rx(struct xiic_i2c *i2c)
> {
> -	u8 bytes_in_fifo;
> +	u8 bytes_in_fifo, cr = 0, bytes_to_read = 0;
> +	u32 bytes_rem = 0;
> 	int i;
>
> 	bytes_in_fifo = xiic_getreg8(i2c, XIIC_RFO_REG_OFFSET) + 1;
>
> 	dev_dbg(i2c->adap.dev.parent,
> -		"%s entry, bytes in fifo: %d, msg: %d, SR: 0x%x, CR: 0x%x\n",
> +		"%s entry, bytes in fifo: %d, rem: %d, SR: 0x%x, CR: 0x%x\n",
> 		__func__, bytes_in_fifo, xiic_rx_space(i2c),
> 		xiic_getreg8(i2c, XIIC_SR_REG_OFFSET),
> 		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
> @@ -325,13 +351,53 @@ static void xiic_read_rx(struct xiic_i2c *i2c)
> 	if (bytes_in_fifo > xiic_rx_space(i2c))
> 		bytes_in_fifo = xiic_rx_space(i2c);
>
> -	for (i = 0; i < bytes_in_fifo; i++)
> +	bytes_to_read = bytes_in_fifo;
> +
> +	if (!i2c->dynamic) {
> +		bytes_rem = xiic_rx_space(i2c) - bytes_in_fifo;
> +
> +		if (bytes_rem > IIC_RX_FIFO_DEPTH) {
> +			bytes_to_read = bytes_in_fifo;
> +		} else if (bytes_rem > 1) {
> +			bytes_to_read = bytes_rem - 1;
> +		} else if (bytes_rem == 1) {
> +			bytes_to_read = 1;
> +			/* Set NACK in CR to indicate slave transmitter */
> +			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
> +			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr |
> +				     XIIC_CR_NO_ACK_MASK);
> +		} else if (bytes_rem == 0) {
> +			bytes_to_read = bytes_in_fifo;
> +
> +			/* Generate stop on the bus if it is last message */
> +			if (i2c->nmsgs == 1) {
> +				cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
> +				xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr &
> +					     ~XIIC_CR_MSMS_MASK);
> +			}
> +
> +			/* Make TXACK=0, clean up for next transaction */
> +			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
> +			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr &
> +				     ~XIIC_CR_NO_ACK_MASK);
> +		}
> +	}
> +
> +	/* Read the fifo */
> +	for (i = 0; i < bytes_to_read; i++) {
> 		i2c->rx_msg->buf[i2c->rx_pos++] =
> 			xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
> +	}
>
> -	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET,
> -		(xiic_rx_space(i2c) > IIC_RX_FIFO_DEPTH) ?
> -		IIC_RX_FIFO_DEPTH - 1 :  xiic_rx_space(i2c) - 1);
> +	if (i2c->dynamic) {
> +		u8 bytes;
> +
> +		/* Receive remaining bytes if less than fifo depth */
> +		bytes = min_t(u8, xiic_rx_space(i2c), IIC_RX_FIFO_DEPTH);
> +		bytes--;
> +
> +		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
> +	}
> }
>
> static int xiic_tx_fifo_space(struct xiic_i2c *i2c)
> @@ -361,6 +427,62 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
> 	}
> }
>
> +static void xiic_std_fill_tx_fifo(struct xiic_i2c *i2c)
> +{
> +	u8 fifo_space = xiic_tx_fifo_space(i2c);
> +	u16 data = 0;
> +	int len = xiic_tx_space(i2c);
> +
> +	dev_dbg(i2c->adap.dev.parent, "%s entry, len: %d, fifo space: %d\n",
> +		__func__, len, fifo_space);
> +
> +	if (len > fifo_space)
> +		len = fifo_space;
> +	else if (len && !(i2c->nmsgs > 1))
> +		len--;
> +
> +	while (len--) {
> +		data = i2c->tx_msg->buf[i2c->tx_pos++];
> +		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
> +	}
> +}
This function looks very similar to the original xiic_fill_tx_fifo. The
only difference is that it does not decrease the len in case of
repeated_start (btw, why?), and it does not set the DYN_STOP bit. But
this could be done conditionally based on i2c->dynamic, instead. No need
for this duplication, in my opinion.

> +
> +static void xiic_send_tx(struct xiic_i2c *i2c)
> +{
> +	dev_dbg(i2c->adap.dev.parent,
> +		"%s entry, rem: %d, SR: 0x%x, CR: 0x%x\n",
> +		__func__, xiic_tx_space(i2c),
> +		xiic_getreg8(i2c, XIIC_SR_REG_OFFSET),
> +		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
> +
> +	if (xiic_tx_space(i2c) > 1) {
> +		xiic_std_fill_tx_fifo(i2c);
> +		return;
> +	}
> +
> +	if ((xiic_tx_space(i2c) == 1)) {
> +		u16 data;
> +
> +		if (i2c->nmsgs == 1) {
> +			u8 cr;
> +			int status;
> +
> +			/* Wait till FIFO is empty so STOP is sent last */
> +			status = xiic_wait_tx_empty(i2c);
> +			if (status)
> +				return;
> +
> +			/* Write to CR to stop */
> +			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
> +			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr &
> +				     ~XIIC_CR_MSMS_MASK);
> +		}
> +		/* Send last byte */
> +		data = i2c->tx_msg->buf[i2c->tx_pos++];
> +		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
> +	}
> +}
> +
> static void xiic_wakeup(struct xiic_i2c *i2c, int code)
> {
> 	i2c->tx_msg = NULL;
> @@ -391,7 +513,9 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
> 	dev_dbg(i2c->adap.dev.parent, "%s: SR: 0x%x, msg: %p, nmsgs: %d\n",
> 		__func__, xiic_getreg8(i2c, XIIC_SR_REG_OFFSET),
> 		i2c->tx_msg, i2c->nmsgs);
> -
> +	dev_dbg(i2c->adap.dev.parent, "%s, ISR: 0x%x, CR: 0x%x\n",
> +		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
> +		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
>
> 	/* Service requesting interrupt */
> 	if ((pend & XIIC_INTR_ARB_LOST_MASK) ||
> @@ -465,7 +589,10 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
> 			goto out;
> 		}
>
> -		xiic_fill_tx_fifo(i2c);
> +		if (i2c->dynamic)
> +			xiic_fill_tx_fifo(i2c);
> +		else
> +			xiic_send_tx(i2c);
>
> 		/* current message sent and there is space in the fifo */
> 		if (!xiic_tx_space(i2c) && xiic_tx_fifo_space(i2c) >= 2) {
> @@ -554,35 +681,113 @@ static int xiic_busy(struct xiic_i2c *i2c)
>
> static void xiic_start_recv(struct xiic_i2c *i2c)
> {
> -	u8 rx_watermark;
> +	u16 rx_watermark;
> +	u8 cr = 0, rfd_set = 0;
> 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
> 	unsigned long flags;
>
> -	/* Clear and enable Rx full interrupt. */
> -	xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK | XIIC_INTR_TX_ERROR_MASK);
> +	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
> +		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
> +		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
> +
> +	/* Disable Tx interrupts */
> +	xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK | XIIC_INTR_TX_EMPTY_MASK);
>
> -	/* we want to get all but last byte, because the TX_ERROR IRQ is used
> -	 * to inidicate error ACK on the address, and negative ack on the last
> -	 * received byte, so to not mix them receive all but last.
> -	 * In the case where there is only one byte to receive
> -	 * we can check if ERROR and RX full is set at the same time
> -	 */
> -	rx_watermark = msg->len;
> -	if (rx_watermark > IIC_RX_FIFO_DEPTH)
> -		rx_watermark = IIC_RX_FIFO_DEPTH;
> -	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rx_watermark - 1);
> -
> -	local_irq_save(flags);
> -	if (!(msg->flags & I2C_M_NOSTART))
> -		/* write the address */
> +	if (i2c->dynamic) {
> +		u8 bytes;
> +		u16 val;
> +
> +		/* Clear and enable Rx full interrupt. */
> +		xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
> +				XIIC_INTR_TX_ERROR_MASK);
> +
> +		/*
> +		 * We want to get all but last byte, because the TX_ERROR IRQ
> +		 * is used to indicate error ACK on the address, and
> +		 * negative ack on the last received byte, so to not mix
> +		 * them receive all but last.
> +		 * In the case where there is only one byte to receive
> +		 * we can check if ERROR and RX full is set at the same time
> +		 */
> +		rx_watermark = msg->len;
> +		bytes = min_t(u8, rx_watermark, IIC_RX_FIFO_DEPTH);
> +		bytes--;

Do we really want to write 255 to RFD if msg->len == 0? That will set
the compare value in the RX_FIFO_PIRQ register to max value (15) but I
don't understand why we would like to do this.
Also, bits 31:4 are reserved so I think we should not try to touch them.

> +
> +		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
> +
> +		local_irq_save(flags);
> +		if (!(msg->flags & I2C_M_NOSTART))
> +			/* write the address */
> +			xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
> +				      i2c_8bit_addr_from_msg(msg) |
> +				      XIIC_TX_DYN_START_MASK);

When reviewing this patch, I tried to understand how the controller
knows if it should work in dynamic or in stanard mode. My understanding
is that in order to start the dynamic mode logic, we have to set the
DYN_START bit in the TX FIFO when we write an address there. Is this
correct? But we don't do that if I2C_M_NOSTART flag is set so how is
this supposed to work with this flag? I mean, does the controller really
supports doing I2C_M_NOSTART in dynamic mode?

Or does it support it at all? After all, when we skip this, we will
still write to the TX_FIFO register 5 lines below. How is the controller
supposed to know that the len that we write there is *not* actually an
address?

That being said, we do not annouce the I2C_FUNC_NOSTART support so maybe
we should not care at all and just remove the code handling the
I2C_M_NOSTART flag?

> +
> +		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
> +
> +		/* If last message, include dynamic stop bit with length */
> +		val = (i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0;
> +		val |= msg->len;
> +
> +		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
> +		local_irq_restore(flags);
> +	} else {
> +		/*
> +		 * If previous message is Tx, make sure that Tx FIFO is empty
> +		 * before starting a new transfer as the repeated start in
> +		 * standard mode can corrupt the transaction if there are
> +		 * still bytes to be transmitted in FIFO
> +		 */
> +		if (i2c->prev_msg_tx) {
> +			int status;
> +
> +			status = xiic_wait_tx_empty(i2c);
> +			if (status)
> +				return;
> +		}
> +
> +		cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
> +
> +		/* Set Receive fifo depth */
> +		rx_watermark = msg->len;
> +		if (rx_watermark > IIC_RX_FIFO_DEPTH) {
> +			rfd_set = IIC_RX_FIFO_DEPTH - 1;
> +		} else if ((rx_watermark == 1) || (rx_watermark == 0)) {
> +			rfd_set = rx_watermark - 1;

Again, do we really want to write 255 to RFD if msg->len == 0?

> +			/* Handle single byte transfer separately */
> +			cr |= XIIC_CR_NO_ACK_MASK;
> +		} else {
> +			rfd_set = rx_watermark - 2;
> +		}
> +
> +		/* Check if RSTA should be set */
> +		if (cr & XIIC_CR_MSMS_MASK) {
> +			/* Already a master, RSTA should be set */
> +			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
> +				     XIIC_CR_REPEATED_START_MASK) &
> +				     ~(XIIC_CR_DIR_IS_TX_MASK));
> +		}
> +
> +		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);
> +
> +		/* Clear and enable Rx full and transmit complete interrupts */
> +		xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
> +				XIIC_INTR_TX_ERROR_MASK);
> +
> +		/* Write the address */
> 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
> -			i2c_8bit_addr_from_msg(msg) | XIIC_TX_DYN_START_MASK);
> +			      i2c_8bit_addr_from_msg(msg));
>
> -	xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
> +		/* Write to Control Register,to start transaction in Rx mode */
> +		if ((cr & XIIC_CR_MSMS_MASK) == 0) {
> +			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
> +				     XIIC_CR_MSMS_MASK)
> +				     & ~(XIIC_CR_DIR_IS_TX_MASK));
> +		}
>
> -	xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
> -		msg->len | ((i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0));
> -	local_irq_restore(flags);
> +		dev_dbg(i2c->adap.dev.parent, "%s end, ISR: 0x%x, CR: 0x%x\n",
> +			__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
> +			xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
> +	}
>
> 	if (i2c->nmsgs == 1)
> 		/* very last, enable bus not busy as well */
> @@ -590,10 +795,17 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
>
> 	/* the message is tx:ed */
> 	i2c->tx_pos = msg->len;
> +
> +	/* Enable interrupts */
> +	xiic_setreg32(i2c, XIIC_DGIER_OFFSET, XIIC_GINTR_ENABLE_MASK);
> +
> +	i2c->prev_msg_tx = false;
> }
>
> static void xiic_start_send(struct xiic_i2c *i2c)
> {
> +	u8 cr = 0;
> +	u16 data;
> 	struct i2c_msg *msg = i2c->tx_msg;
>
> 	xiic_irq_clr(i2c, XIIC_INTR_TX_ERROR_MASK);
> @@ -604,22 +816,71 @@ static void xiic_start_send(struct xiic_i2c *i2c)
> 		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
> 		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
>
> -	if (!(msg->flags & I2C_M_NOSTART)) {
> -		/* write the address */
> -		u16 data = i2c_8bit_addr_from_msg(msg) |
> -			XIIC_TX_DYN_START_MASK;
> -		if ((i2c->nmsgs == 1) && msg->len == 0)
> -			/* no data and last message -> add STOP */
> -			data |= XIIC_TX_DYN_STOP_MASK;
> +	if (i2c->dynamic) {
> +		if (!(msg->flags & I2C_M_NOSTART)) {
> +			/* write the address */
> +			data = i2c_8bit_addr_from_msg(msg) |
> +				XIIC_TX_DYN_START_MASK;
> +
> +			if (i2c->nmsgs == 1 && msg->len == 0)
> +				/* no data and last message -> add STOP */
> +				data |= XIIC_TX_DYN_STOP_MASK;
> +
> +			xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
> +		}
> +
> +		xiic_fill_tx_fifo(i2c);
> +
> +		/* Clear any pending Tx empty, Tx Error and then enable them */
> +		xiic_irq_clr_en(i2c, (XIIC_INTR_TX_EMPTY_MASK |
> +				      XIIC_INTR_TX_ERROR_MASK |
> +				      XIIC_INTR_BNB_MASK));

Before this patch, interrupts were cleared before the call to
xiic_fill_tx_fifo(), now it is the other way around. Was this
intentional? If so, why?

> +	} else {
> +		/*
> +		 * If previous message is Tx, make sure that Tx FIFO is empty
> +		 * before starting a new transfer as the repeated start in
> +		 * standard mode can corrupt the transaction if there are
> +		 * still bytes to be transmitted in FIFO
> +		 */
> +		if (i2c->prev_msg_tx) {
> +			int status;
> +
> +			status = xiic_wait_tx_empty(i2c);
> +			if (status)
> +				return;
> +		}
>
> +		/* Check if RSTA should be set */
> +		cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
> +		if (cr & XIIC_CR_MSMS_MASK) {
> +			/* Already a master, RSTA should be set */
> +			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, (cr |
> +				     XIIC_CR_REPEATED_START_MASK |
> +				     XIIC_CR_DIR_IS_TX_MASK) &
> +				     ~(XIIC_CR_NO_ACK_MASK));
> +		}
> +
> +		/* Write address to FIFO */
> +		data = i2c_8bit_addr_from_msg(msg);
> 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
> -	}
> +		/* Fill fifo */
> +		xiic_std_fill_tx_fifo(i2c);
>
> -	xiic_fill_tx_fifo(i2c);
> +		if ((cr & XIIC_CR_MSMS_MASK) == 0) {
>
> -	/* Clear any pending Tx empty, Tx Error and then enable them. */
> -	xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK | XIIC_INTR_TX_ERROR_MASK |
> -		XIIC_INTR_BNB_MASK);
> +			/* Start Tx by writing to CR */
> +			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
> +			xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr |
> +				     XIIC_CR_MSMS_MASK |
> +				     XIIC_CR_DIR_IS_TX_MASK);
> +		}
> +
> +		/* Clear any pending Tx empty, Tx Error and then enable them */
> +		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
> +				XIIC_INTR_TX_ERROR_MASK |
> +				XIIC_INTR_BNB_MASK);
> +	}
> +	i2c->prev_msg_tx = true;
> }
>
> static irqreturn_t xiic_isr(int irq, void *dev_id)
> @@ -703,7 +964,7 @@ static int xiic_start_xfer(struct xiic_i2c *i2c)
> static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> {
> 	struct xiic_i2c *i2c = i2c_get_adapdata(adap);
> -	int err;
> +	int err, count;
>
> 	dev_dbg(adap->dev.parent, "%s entry SR: 0x%x\n", __func__,
> 		xiic_getreg8(i2c, XIIC_SR_REG_OFFSET));
> @@ -719,6 +980,21 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> 	i2c->tx_msg = msgs;
> 	i2c->nmsgs = num;
>
> +	/* Decide standard mode or Dynamic mode */
> +	i2c->dynamic = true;
> +
> +	/* Initialize prev message type */
> +	i2c->prev_msg_tx = false;
> +
> +	/* Enter standard mode only when read length is > 255 bytes */
> +	for (count = 0; count < i2c->nmsgs; count++) {
> +		if ((i2c->tx_msg[count].flags & I2C_M_RD) &&
> +		    i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC) {
> +			i2c->dynamic = false;
> +			break;
> +		}
> +	}
> +
> 	err = xiic_start_xfer(i2c);
> 	if (err < 0) {
> 		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
> @@ -752,16 +1028,11 @@ static const struct i2c_algorithm xiic_algorithm = {
> 	.functionality = xiic_func,
> };
>
> -static const struct i2c_adapter_quirks xiic_quirks = {
> -	.max_read_len = 255,
> -};
> -
> static const struct i2c_adapter xiic_adapter = {
> 	.owner = THIS_MODULE,
> 	.name = DRIVER_NAME,
> 	.class = I2C_CLASS_DEPRECATED,
> 	.algo = &xiic_algorithm,
> -	.quirks = &xiic_quirks,
> };
>
>


