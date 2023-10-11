Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026F07C5796
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 16:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234751AbjJKO6e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 10:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbjJKO6d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 10:58:33 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2122.outbound.protection.outlook.com [40.107.22.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA2D94;
        Wed, 11 Oct 2023 07:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+/TG8bElq2fRRJDxebspd/vrqJsSfcQm7xcFjBb5EFAgEvFRpq3zA3SsJ/USqQy9jAZN120vka8JtFqDbP5sM4xZ19WxEIJeINgU6per6kXYLNlU3/bYSzb1J0vw8c372MmTAloHguuYnGJOjR2RJNQRDC2tw5zm14shg1p1n/BprWMS7ncIIkvMg9+WXdWkQrXzS36ZBjDrrZDyWcVwd9CpLr5qr1T4zdMSBngks73W+mM6gkbcRl87pQKC4eKfPTwwbdf8XJDX/GuLualZwWU0r2/Q3/ZVjkZtyE7IEwbboF369kKTT/0zH0rVGpk3+QVcR2k1qSaCdSUyKjr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgCb7OKQPi7ei9PzD1hzGy9DQW7hUyTSNmPN4Jsj7Sg=;
 b=PcPoKyq4ACqkgOHjWTkrCn19nRQEHrNbcEw1k5MGLwACv78Rck8pxDEMQhsd9qC0V8xi8rl4CCJN09cwjUSFSEjJCLmKfpSclf4pCTRBJIVPdHyoosq9PyQD8NPCm/irv0T9ubQWFJauzcKWuEcFbuOl9EJmzPGYLbJfhSrxGetdYcv1mn5vX31VCKzUokHxy+afo2SJvus66CPS88joXiNs6VOwDJWihXHdmQz4KRWPr24XdacZGfIPr5gkOG5H0yqozTzD1/CNdQ0bXDq3eUWqMw8rwoWr9WVkCDuXGaY9cFzXsCJ35GzzX+j1GFYZSjvWbuc7+Hp0RJRwBlyc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgCb7OKQPi7ei9PzD1hzGy9DQW7hUyTSNmPN4Jsj7Sg=;
 b=eFPKZE0Md9JKFoosz0HBtA24jV0CFs9/QJfsgISrQs6idweI+AzpctpJx13FDEQ9+nDQofqzgZzfXmlenVDw2kqSskDB+tIlVmVX4ZzyBdhtxw7wwQaJadALjKfDhz1HQ/Etu+SnTZ4FieU/lPGHqOLdzPkbX8DNOCZzso4JeWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS2PR02MB8913.eurprd02.prod.outlook.com (2603:10a6:20b:544::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Wed, 11 Oct
 2023 14:58:30 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d%7]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 14:58:30 +0000
Message-ID: <aff5fdc6-ebc9-8e58-9fb6-bac47d00e9fc@axentia.se>
Date:   Wed, 11 Oct 2023 16:58:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] gpiolib: provide gpiod_to_gpio_device()
Content-Language: sv-SE
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20231011130204.52265-1-brgl@bgdev.pl>
 <20231011130204.52265-3-brgl@bgdev.pl>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20231011130204.52265-3-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0094.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::35) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS2PR02MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: bd9bd801-77a7-463e-e223-08dbca6a87e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SbbrKMFVg9DGNg4uTWJ2S7z5Ct7Vcj6S218p79rGQdmSWWBrxkv91yvPboXMdL6vRGI9tHkSDpRfQLiwRU9joHILAxAKiZhcFYD2A92g+vrn+SkJzwwcRDAhOQ5PfQLV36fB/LusMtjcnQvYowg+CWG6MeGnX1Lvwd1gqhNYJARRcbrGxRwh8iiFYzYGivhjOC0wZFaU4qDoi/6KAR/lH48t71UY4WjgL7mRXzd/LTRA+4J6Crq4Jt2D4nsfThEAqAIQqpqB61hMCtDEaTVkQFoi8lle2oo9wxsV1JGemDLsz0pMgb30PNw+R0IwdwesTMzd/dSFbgkllzgq1mb3ndDfG2dYpRI1gM8JuB0K9rbKtaoqC+DDUxC8uaGELGUnIxQpafpmMMGlRQAknmdH3G+G+gEc+D8YRZLKC1N4kudEmma43V5FktawDEXlOp9cojob0F8iCevE1JTiFK0oBZOqVQsT2lwKZNoE/NW2ICFjtnPFQHmUcJavtyoIqfFl3DzRJf+D8doKwRs/P/eE4aFxleLXwo5Ehm0Yw/58PSi4WMOi2tOWHu03pKNw0xlWbpXuL/Wp5DCjjhFa5Ss9VPjnCRaUt9fIrfr+nlMGrjgCxZiI15Ob/QPdC7zCbIdoGKTXDDqEgZqxp0ITV11WYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39840400004)(366004)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(83380400001)(316002)(26005)(2616005)(66556008)(66476007)(110136005)(5660300002)(4326008)(41300700001)(4744005)(478600001)(6512007)(4001150100001)(6486002)(8936002)(8676002)(6506007)(36756003)(38100700002)(86362001)(31696002)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUFMQ0wvTWhpNElVODN1OXlPeWZsa1JkUXdDTUpqL0kwZ1h6VkRyTDlrRDl3?=
 =?utf-8?B?UXh1Lzlqb3NvL3ljUG9GTUFUWmtUY3BnS0lXemhxUW9yd05lSUtHbUNwN3Ru?=
 =?utf-8?B?OE96aVBVRnYrZXN1ODM5ZnlBZjlLc2pMNUZmeWtxRXowWlhlcUFCZVgzS0h3?=
 =?utf-8?B?ZnNLQS9xVXN4L0hmc3BINkNhWXA3MjZua2FJclFpS20ySGNmRzFjOFhpOVp6?=
 =?utf-8?B?ZkRjc0VoamFRL3FqbzFONHZlQVdNWTZ2QjhEdzdVbzBzaUJuR1hZOWlmSkVE?=
 =?utf-8?B?d1RZU2NndlBSeDNxQzdKMk9pbmJTQzl0ZEo0OFlQQkV5NkxJQllkTFE3c05K?=
 =?utf-8?B?WHhicVhPNGwzbWw3RWNYWkNIcGM0RllsRjU4Z1JQWUlyZ09PUlFDaG9EMEJJ?=
 =?utf-8?B?Z0dXK3hudzRhZGF4NHZxS3J3bEhxSGFUbHF1Q2l3OXZkYzlyeGlwUWlyTG90?=
 =?utf-8?B?VUNkTnNlMGhHUzVqaTF4cDk0bFFYTU8wazZhSHlWNVY1b1lWTFlaQkdWZm5S?=
 =?utf-8?B?YjBSbHEzalN1YmRrMXpOUi9vQXNrYnAvNzBhMjBFS2hCZW5NT2tLV0VWOXpT?=
 =?utf-8?B?Q1dad2ZBV1ZNQ1JnWXBDNS9VMnBVaDIzNEdqckVWODhkYWZ3MHJFODZUc2o3?=
 =?utf-8?B?OHRJQVV0VHVCRjVLS0V5ck5jelVCQXNFM2NNMjZwZTZWTWV2dkVuSUNnblVQ?=
 =?utf-8?B?cTVwODc4R0xMdlVXWWhrQmpHNmJra1JvTStlZjVtZUxQLzF1NWpoVnpBRFl0?=
 =?utf-8?B?RlYxY1dGM1lEaDZnNGJ1aVNyeXN6anNKekZKa2lRYVVVWFJsQWV6cjlDaWg3?=
 =?utf-8?B?bWxTc1BQMG1HaEtXN2daZUNaeGJuVWlrM1llbCtHaG9yZW9ESlY0d1c5Z29x?=
 =?utf-8?B?NFYvSXJjL1VyeDA5QkxpT3hpSm5TS3ZEZG9aSlExTnUwL2VBcUhSNHpBeG5I?=
 =?utf-8?B?aTNoUjBlVEd6cU4vUUJsd1F1dE5scFYxYXMwMy9adW9obnVMZlVpWWxhQ3RN?=
 =?utf-8?B?amIwdktsdCtaVFErdXV5dnpRVzc2bTVEdmlpMWN3Qnp2cDhnRnBORDRzRUdJ?=
 =?utf-8?B?Mm8zaUkvWjk5bU9mTzdhUDg3cW83NjJCS0IvTllyNnFsNFNvT2RHQzE1T3hB?=
 =?utf-8?B?NjQ3aGt0S1NsVTZ3VXJNc2dydTNTMDZyS254L2VMSDVWN0N5K09PclBhM2wv?=
 =?utf-8?B?M3pOdnU5Q1dEaTNqOVR4TStmaFU2VUtYNVBvTVJKRFg5VFFiWCsyYjFUUjdq?=
 =?utf-8?B?ZngyUTJkT21CelpnZUE0ODZ5Um14cldJaTk4Rm5JbEZvZW16dHkrZnk4cmNi?=
 =?utf-8?B?U1pzRStQckJCL04yWlZRNE9paWJVczBJTUZ3K2psbUFObEE3T0RDeVpQN3FE?=
 =?utf-8?B?RDlpUUNwZHFKQkZ6RmRqRGpDVmRTaGtoOG1iRGhTSy8yd1p3RWh6OENJVk5R?=
 =?utf-8?B?cWxFOE5XbGFXODNjYldoNDVLR3VXRkhxOUFWNlFmZDNzWThDc2JPeUpnNlcx?=
 =?utf-8?B?OWdnQWVocmRLS21KTU96MC9LdWlCenk2QUN6bXdINjkvK1VjZllsNnl1OFJZ?=
 =?utf-8?B?YWxGeGlSN09NYmFoeXFsTW9rV08xRDI5TkxReUJMLzBrSTFyY21pK2c2RTJP?=
 =?utf-8?B?RHAvNGdWc3llTkRjUFg1a2NwMjJDOGcyWDRlanc1bWEyZEw5TkJHbnVNbysv?=
 =?utf-8?B?TkVodExkc2U2bWU4VnZUTzBqS1Z5d3hEV1d6Y1RZcjlGTTV4cnliRTVBdmRt?=
 =?utf-8?B?c0NxS3kvYVVWd3VMVXVSUmd2NE5GT2haYTVJd2N0cGIvSGxQQ2puWXFFYXov?=
 =?utf-8?B?QmJ6bFp2Uk53MGM3S3ZBYTlXY2xCZUxrTnJEWkpCaHEyTTE3NHJqMC9PcDBh?=
 =?utf-8?B?TmhPcDRTSHUzSmZJeUhQRFRsOGpjV3YzaEtYY1paSWd6UGhwRFBFWEUxR2Nq?=
 =?utf-8?B?TStOSWZ3T3VYd1ZnTUhsWTB4dHFWVktEYjlVQWxUYnh3VzFQZm1uVzdrZDY5?=
 =?utf-8?B?b3k4V3BPMG51YVNQNys0MkkvRndNMG13UGhSU3ZNK2pWWmRnWXg5N2ZqTFI5?=
 =?utf-8?B?ZWlvWGFadkFzalRKWElETHQyQVNxUG15VDlvUWpSK0J3Vjl3TGdCTTBtQms4?=
 =?utf-8?Q?fBQUeL3Y3G65jPAnC/9GRp0JX?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9bd801-77a7-463e-e223-08dbca6a87e5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 14:58:29.9925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNK2HXiSF0g8vZj7NKHkSogeqxbeIYVz2rnP25bUIXicnC4o9xgcMrz/O+Ehi5ta
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB8913
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-10-11 at 15:02, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Accessing struct gpio_chip backing a GPIO device is only allowed for the
> actual providers of that chip.
> 
> Similarly to how we introduced gpio_device_find() in order to replace
> the abused gpiochip_find(), let's introduce a counterpart to
> gpiod_to_chip() that returns a reference to the GPIO device owning the
> descriptor. This is done in order to later remove gpiod_to_chip()
> entirely.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
