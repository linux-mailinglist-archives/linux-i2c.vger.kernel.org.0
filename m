Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 052AF70B960
	for <lists+linux-i2c@lfdr.de>; Mon, 22 May 2023 11:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbjEVJuW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 May 2023 05:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232413AbjEVJuL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 May 2023 05:50:11 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2056.outbound.protection.outlook.com [40.107.6.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9701B4;
        Mon, 22 May 2023 02:50:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FskJaK6fZyJ62XqRYKUUJUtkWVhdZABTsGJo+WBdMD6hPc7Q/nytc7RZUREpL7lk6ftgQ+pycUV4YB9cBgXnH2Az+rTY+j0iSpos+DQDyHf3T0uupQY3CmEqxrEHRXoWE6cXM733oFsZwaCjMRePQiBMn9myGMXlXNCF5LFN5eTgdseWyq4am1qtBnLpq5d4BwE0CqGa7QE6VrWZVuAsk/6NTVEVkvEZBX6I/gcBFi0F2hyBifgTgQJesupt5SSNNC9xsGmn/EJd3/HyxdsTf7e0PROBnT0LFVYNgoGBnbn8eEVM/RmO6XgsUoaZkoRlvs9zJdsah1Ux4PdgcGhfkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hm8v6igCyemc1JX6DqN4n91hySYry3hW1N1IMTZVrRY=;
 b=UEungqVV89su8oKtQPOcEk1wqQVMbkCacnv+HUu/vYux5I/EPL4XgA/0/GfIslQXY7HWTrXfcxs1C7k5E4N8SaV2xwqDLei1U3q4DyiVlSg/urlcdy/qOwTObx7T+zw2omrGc8muXkjQpU2SrdiX8AIPZu9C/LjNe7PU4dNFPqlj8eM9akJGt85QODLVW1sgkj1R0VGTiI0mP02C0dZKZVUoiCbNLgLlh9D+U0exRKmE5/XtM6XlZWY4UizsYAUIhnzeYjxNwR/mW24YbRXA2+6qEQof9el/7PcBADm7pG176AY2r2BfIjlRlXbU+YesipNIYBxO2wxUc/nTwJD+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hm8v6igCyemc1JX6DqN4n91hySYry3hW1N1IMTZVrRY=;
 b=l6Xj3ZVSJHBRtprRTOg6Mjw4SKy31AiILErQmn4v82PbnD0mRQTU1RJjTrCkxyTMp+er3O2V71+m3pSfofNueM2txytFIvB1N6aXqEJrXdAgE2tAZ7ttTdom5fQWFORgULcfFbCZEJFMvP3zTgKsKchFDLxvq+Q6DYjcSpf+gQV9/N9lVFq7lx8DXmQWmbSHr8iDmosUpT3GmlsJ0OPyfMwyAFkny9WUD6gJSkOiXwLQAA0fpr7cfezawcoRiMkNrUK6ZJN8JYp5nuwtp9qNcYVVsR+yObxW1+X2EYa2c3pb73OzyOaat4hmQk7h3k015/LiJW6xu8oOwDdiwT2oYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS8PR04MB8596.eurprd04.prod.outlook.com (2603:10a6:20b:427::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 09:50:07 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::6c14:307b:6fd3:3bfc]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::6c14:307b:6fd3:3bfc%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 09:50:07 +0000
Message-ID: <a33654a6-71e0-07ac-a612-b1f7aedebb36@suse.com>
Date:   Mon, 22 May 2023 11:50:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v8 5/6] i2c: Add support for Intel LJCA USB I2C driver
Content-Language: en-US
To:     Ye Xiang <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
References: <20230511175844.185070-1-xiang.ye@intel.com>
 <20230511175844.185070-6-xiang.ye@intel.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20230511175844.185070-6-xiang.ye@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::11) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS8PR04MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: fdac58fd-3cda-4c07-bb6e-08db5aa9ec9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qg1HgY24uA6FjtKtR5waa0oonCvUS8Bru0IoNCx+TI+9UFqfsLf7ddXlf23hvTx24uzALVDzVDR0Srx8AOy3MQFuzRHgkMapnK4iSTgzQIl3/eN9nBj2mFRh4rxEugDq1UMqWUbIwIT462T0JLHP8uHDgQr7RcBcLBZBRmZsnWkFoMUUdEibEUS09lxPdUfEGQbp+6+Sh5X2WWInslXjYmbHRym+vNhdSWHFUelUusH5UUAMZ5p2rBXa8R93l8S/IKlRh/DGUdDzzwZgOvNe4FltNEXFqm2Y7bk0NuYGDuGUEnivaIw6CokM2WXqzHOWTbOIDipiwCRdQrnucX/FC9i2VXeqXfaxMy0jEHxTSQc7catX/L2XsoufDoiDwV1GtF78n/Mdhfq6fiat9xi2g+6NO17zHZRLi/6I+1UM/YRQg4xxgm5zv471CAbdvBt3XSayUO8wS6xaWG7RYUxYJQFOuHTz8z6+EDkw/Qvyf9spOwv/L/rOqd8K0CJ4aFhFKC7VxSt7otPsOTn4NdDslx34NGiD1n2muGJdaEPfpqFK/xK9a2iB0OkijIGD1/q//mSJklhJM3uEo7z8mh19xzqS3e3MsWF/I9zk0XMWo0jnjLOnQ8tACvPtbtUx346hrIr6zNLmRTGbX6rK1QECuJEdBG4fu46vTVR5EdnT84s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199021)(478600001)(186003)(31686004)(110136005)(41300700001)(5660300002)(6486002)(6666004)(66476007)(316002)(4326008)(6506007)(6512007)(7416002)(8676002)(8936002)(53546011)(4744005)(2906002)(2616005)(66946007)(66556008)(921005)(38100700002)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnI5S0pFNE9XNUFHT09NNG1FTEZPTndOYUF1Q3NUVk91NjlQczVEUmo2S3cy?=
 =?utf-8?B?OG5oNUc4YWFNN3AvRlJvQ1JPREd2OVBqUGZlNUUzSEp3T2ZtcEVFZnU2eWhR?=
 =?utf-8?B?bEZrTERHdHJkeHM0RXp1TUE1bkFrUWF4T05MOXA1eGQzQnRBUml0dTRSVFFp?=
 =?utf-8?B?Y1NVQzB4SUxUTkk2SGVpcjBKSXRyc0VNZ3lIM3ZkUk1OZmZYOU1FMGZoYjFW?=
 =?utf-8?B?QS9sUTFzYWlGeGlsRXRudjUyOUZIZlNoYjFBekl2T2ljSkJnMnNSV2xZb3Q2?=
 =?utf-8?B?V3RMdFZnK0RLeXB3SlJ4aFJWa3FmMks5SEdkaXVvNFBZeWtTcTAyRnpMc2k4?=
 =?utf-8?B?NVYyTS9qWHhiRGVKQTNQMTRsdHFNbmZLNFRhTEgyTlRMZ2x2UGN5WnhCME42?=
 =?utf-8?B?d2Y0NkQ0bnZWYURJdlZXb2ZhUC8rWC9CRkp3djhiSHFUNnJFYXhhU05kQW1P?=
 =?utf-8?B?dEl3RWU2V21QOHFYc0NidkxWSVZFWUdFcDdrR2RyWWlTVDdES041Y1B4VnhH?=
 =?utf-8?B?ZWFCd2JGSlhhZ1AwRFFCWVYzTXB6SXo0NkJoZ3NvTWR6YmhPUEZMKzBFa3pl?=
 =?utf-8?B?UGZtZWZzY3VqdnNtbzQyZllicjN1Uks1VGxmdFhsNmdTT2VlQnlIV0U4a1FY?=
 =?utf-8?B?NEZlRDhSS2RqQmNiR1pzOXk5eVk0bWFob25FMkpUZFBJcUJJVTF3OEZFaTdJ?=
 =?utf-8?B?RTZFZytOeC8wVWh2N2g5cjhhMkc2SnN6UzE0NW5JTDdHdC9hNklqbXM4Ykt3?=
 =?utf-8?B?RWczaWNwczFlNVllWHgvclZGTlR2NXY2YW85K21EUldVQ1UydmdxR3R5dDB2?=
 =?utf-8?B?Z2JPcXJEcjl6SkwzaGFoL0VLU2VhQ21zcHZNeWh2MVhDK2Z0UWVqMUk1RzA2?=
 =?utf-8?B?aFhSa0JoSFpWbDh1UC9hQ1RDZEZhY2pNdlRNeFRIbndycTdlMEhuVnZjRjhP?=
 =?utf-8?B?M3M1TU54VU83Z01UUlQzeFROeFphRFdvcTFwclJ0N1oxMVNFRzNtdjg1d2Z3?=
 =?utf-8?B?d1BjdWl0YWRmdE1HaXdYSDJkK3Z4RnpWdG9CZWM1eTQyL1g4VnZkQXIvUUFM?=
 =?utf-8?B?WUFVMm5KcDl1Q1lMbmswVFJEUnQ4WUpMMmpkOFBkMHRtVyt1UmFDbU9iWjJo?=
 =?utf-8?B?S2p4RDluSCs3SjZ4NGt2cW1tRlI2ZUpaYTNGQ3hYYmUvSFd3ZlV5emlPVHdj?=
 =?utf-8?B?elA3emZudEg0SnZqaUlDc1hHcWRXQTBkQ1JnK0tyZ1lTQTNqTWZLRmdLcFlL?=
 =?utf-8?B?TUdzekN2cTNYUkt5bkZCWTkwVGxYVzVnTmdvYkdsb3BxS0ZSK2ZMMzlHQ0ZZ?=
 =?utf-8?B?TkNHZzl0dHZzYmtJUDl4cnpJZDN6QXMzWWQydHR2N2ZRQ04xZy94d25OQ0Q3?=
 =?utf-8?B?akRqOXdnTWtTSGVFRHU4czEzWXVvRUM4NHpkVHNxV1B3MjV1SDM3Njh1YkNY?=
 =?utf-8?B?Y0ZIbWtVTVhLa09rYkJpTXNJdUZCTTV1NUcrd0dseHN1czNaN29BaTZJZ1k0?=
 =?utf-8?B?RVAycmJtS2RHQlJqaHZ2aDFpbWdIZ0lCbVN1NUpLdW4rZHhBMTIrZStNTkYr?=
 =?utf-8?B?OG8zR0R0WGhLaGg2WnE3cFlSZ0hBbXpQOHcyQlZJNysxanhocWVYaEwrV1Y1?=
 =?utf-8?B?c1VTY3RUL3QzR044TDhiRFdiMmQveWNxS2IwZ3lXNk9IZ3Y4clpJWVZHbmtU?=
 =?utf-8?B?UFJiZXAxSTRQb2JMOHQreG56T0RLV1ZDSHpnc2lHTlJpdWhOUXdhamFvWWgy?=
 =?utf-8?B?bnVNRVBqVmVZVTRTWkErNmN2dklSbC95Nnh0cWhIYnNlV0ZzRnp4a3FOc1dw?=
 =?utf-8?B?anU4T2N2NUcvN1dEOTkxemlwUmg1cmpHWkc4Ri9jSjhaT2RaWEFPcW9JQlZB?=
 =?utf-8?B?aDJublRTWEJQRG1BbGh3VmI4L2xQNHNhbE1rU3RRNFc2aDNjcFpveEZkWXox?=
 =?utf-8?B?QytyWXFpSXM2V2ZUMzZpbGxNdll5blphcjB4OGJiNk9Zcnk1VFpCWGdvL3VH?=
 =?utf-8?B?ODI4Q0FWRWJjYVFxemZOeEpNa0R5VnZEcm02T2xJakNBSmtwTTBreC9udWNN?=
 =?utf-8?B?TGRFRXdOMk9ZdlFSSWhBbktOdDlvRzNaRzZLUC81R3ZUZHpMTlc5ZllXUWkw?=
 =?utf-8?B?ZGpjTm5JZUxaV0Q3V0l2emJ2ZDQ5amNxNHlpbzc4cGIxMlJEYzg1WUU5VzJh?=
 =?utf-8?Q?ZpsDJC9CCV2qcvtHGJXB/Po=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdac58fd-3cda-4c07-bb6e-08db5aa9ec9e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 09:50:07.2066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1eVfl3h16v6WUaoPq6a9nP2ZEEosAuHBE0fUmPJ8wP80Ag6rIqfQiHl7XO26skWvK8zXwXEhDhGV/JO7yZszA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8596
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 11.05.23 19:58, Ye Xiang wrote:
> Implements the I2C function of Intel USB-I2C/GPIO/SPI adapter device
> named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA I2c
> module with specific protocol through interfaces exported by LJCA
> USB driver.

> +/* I2C Transfer */
> +struct i2c_xfer {
> +	u8 id;
> +	u8 slave;
> +	u16 flag; /* speed, 8/16bit addr, addr increase, etc */
> +	u16 addr;
> +	u16 len;
> +	u8 data[];
> +} __packed;

Where is this needed?
Why is it defined __packed, yet the internal endianness
is not declared?

	Regards
		Oliver
