Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1602877FBF6
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 18:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353623AbjHQQW0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 12:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353655AbjHQQWM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 12:22:12 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2128.outbound.protection.outlook.com [40.107.249.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA4A35A4;
        Thu, 17 Aug 2023 09:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3YyFAp9RECl0YIg1UXXkOA8nlwDx/4UfqDelTLyBWUm9sD5yLIM3vwqtpjHX8z7XGgbz3hxuMsDf2wo08M2Uc1zmgEEtXokPYNO2FF1qXjIEMkRiNuKGnRBq5vBO7TEz4inyhcJbyfEI4Diw5/UCuTgau1XXR0e9wOCB3yg+n4XJ0PIvt4Y6VcxkFByBcJJzywzVVBXYdrh5wGtlfWI8cXFati/UkdxS4H4Szs2bxm1cNoeGtFyIwGAJjK6PrsvsV/54lUarnD33d75lrV2RSfrFX5WMWcYVSECnOnSOmPvA85EJk0wPxJuWzvw/07/cBvOu8lgeqzhwVSDeNFTzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voUTloa8JK771xvwNmQEi9MkGKX9fsBiQTQPA+Yz+hQ=;
 b=lrr5Fm0RddaRUVrO675Ev0M3FC+sBa1ytXX68Ve9oAL5Ns1yFbwDH5geOrL11soQrPqOL4ZCAihq+P7QXDfb7D//aFoZaMeXW7eqFIV7CAgduGHzIHl9K7cTeoEpJWKMQqZpwNxNPsU81p+9Kc4Dh3xA2ZgStFYf+Y6fUnww+838Kwb1gSsBIZQg4/BTXpgFq7ZxjdYI1smsRq2fWloW/3qjwN9YDmsKhFb0iOsT6dT4blbkPykeltNM+r/evErN9TmgjYWwjwNfkxvYuY6QPumwO4VeJvBk06Z/LiWhiYcNjanQFMQRE0AaNK45Wr4xd3ALM73SVEirgcY4bUxpLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voUTloa8JK771xvwNmQEi9MkGKX9fsBiQTQPA+Yz+hQ=;
 b=QdoARvuh2M2TDpi6pS1eXI9oitpRF3jmNiY443MDqn7nvztSCfN1kI8S7Uh7ShOPMT5KFjzt7tp1s3xPY5IA3UdR05lMQP6JDm5+rOysFKeFazVd2xdWGk5rIUozFPdQ/Nyrw7Vlo0ioU1SPxk6V3XUMNBmSlwrjIPLaY01maqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB7318.eurprd02.prod.outlook.com (2603:10a6:20b:3b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14; Thu, 17 Aug
 2023 16:22:04 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c%4]) with mapi id 15.20.6699.013; Thu, 17 Aug 2023
 16:22:04 +0000
Message-ID: <75fcb4b2-54ae-9b53-071c-3dde84237fa5@axentia.se>
Date:   Thu, 17 Aug 2023 18:22:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v15 2/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x
 variants
Content-Language: sv-SE
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     naresh.solanki@9elements.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
 <20230817071056.2125679-3-patrick.rudolph@9elements.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230817071056.2125679-3-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF000000FA.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:17) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS8PR02MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 0717ab33-b8d8-4588-12b5-08db9f3e17fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dUQmPWeQphf0NPJKxChNeF2iKfld8ck7gvD3Frs7WUhXIG/oYPU5qtO2Imk3G8r+ICyURKu4mtf38OgSxc2thacikDbtWESIUnVaAC8ZvnNDfl3BQ+4Ei7m7yYqrXuPCNYNisWMFKXCYjYikvDJSf9ba85TY6qCWFQgr9F+c29QpkU830rEME6XrFTedkInld7AAK70uSbBy3UPpc/V1uWQS7CskprmkV9AZXWnRyKgozV5VHD9CDOIWhurggNOTKcd6UvvcHoM4InP5Qmtp21vIJnhgjhMFuqJNF882Zb0hhSItWiUno3O2g3mX/xK6dmWBXGob0kUec5dLa+YkplFJw/NthajBvHdlpJy948oKsVV1LD908gmqX3FN4z6+AnhjYw59+2HfGP9sWQAVrvKiuurh0hQ9qVGuJlCDQaDZe4GKtTTD3KavOX+OIEu1Rw7sY+4kCAvn8EOLJD+FgN2qJZCpuKAEF1PMuRjCn36BDYdrOWiChW7bxBtXLpg8KFUK6ITLKchwQEivFajVhUKy1EPtL2DyRVeN7TtYw/Z248+ciA/4HWuLkldD7t02mg+hUGWpd+niJGEt4/4XslNBrqdmkx9VppV5hbjKDv29qdzq2+bo7bSE4HRbJVD64oJday+G9sQ3YyjrornAQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39840400004)(366004)(346002)(451199024)(186009)(1800799009)(2906002)(66946007)(110136005)(66556008)(66476007)(5660300002)(8936002)(478600001)(6506007)(6486002)(83380400001)(4326008)(316002)(54906003)(36756003)(4744005)(8676002)(2616005)(38100700002)(26005)(6512007)(31696002)(31686004)(86362001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWpEeDBvaDNkZEVxTzVnTUxQckZiM2JPQ0VlWDhsY3hoSDNuMkd1cXhNUWg0?=
 =?utf-8?B?QTQ1RUpXZzZjZnBKd3JlZk5EeVhTRzczUTFkZXlBSG9FQU40RXkvVkxHb25O?=
 =?utf-8?B?bDY3a0NiNXVzc1RaaHFMN3RWRGZ0cE01Y1c1dnZ6RnNKeEhsczRyUkRSWG9H?=
 =?utf-8?B?WnZXSzNQeUJEL3Fjd1NFS0tKQTNPM2dJYjlTdHFXS0k5c2pCUjNnNTlaTlIv?=
 =?utf-8?B?Tno4NE1NMW9ZeE5zQkdBTGQ1ZWtvY0lCOUxHNU80SzJRSGp5MmtaNmRabUdy?=
 =?utf-8?B?enA2RHcrV2p1Sm1YSVpXLzkvOWRMem9VQ1BQZFE5WUlWNU1tUE0rMnlGUGgz?=
 =?utf-8?B?V09xZ2dVcHpYQTIvbEREb01uQTQwN1lFZ0pPaTZjWUhHNUtsdndOTkpQRlhr?=
 =?utf-8?B?eWtXUDNmc3A5K2x3T0xtN3lkNmFHRlArNVJUVTlsRXlJckVxN3NaTjdTS3VJ?=
 =?utf-8?B?MGE4SlRNLzQwbVdmeEt1ajhSQlN6dkRWdThjcDlLNVFFZEQ4MzBucExRajUz?=
 =?utf-8?B?QUt0czVCbndRVEppNUw2R1ViMGJ4OHkwY015QzdPRjJmT3FxVEVEZ1p3RTNX?=
 =?utf-8?B?d3NwbHoxOSt0T1NnZC9qSWEvMENpK1VGaURTc2Z4WDdKM1Z6YkJySkZqcUlk?=
 =?utf-8?B?bjVUKzIyZG9MQ1JiOWVSU0J4TXdIUUE3Z2cyS0xaYUtMS2szNFlLMWUxaWNB?=
 =?utf-8?B?d3Z2cy9zV3ovVjM1SU5KZ2VWQllnVVFLUkxTUWw4MWFVRVVrK1RhU2dRTjd4?=
 =?utf-8?B?KzlQY1VMR3l3cDJuNmhrQUpwOER2SkoxVDJDcHZFTnZWY2Q1WXZKWjRrUXJh?=
 =?utf-8?B?L3ZKYzMrN2pmeW4wSHZQWDNPeHpVUzRCb0VDY0xxQmZRN3YxdFl2M2Qza0F5?=
 =?utf-8?B?aWcvRTlLWnhYb1lzamVKS0xXYlhDTisvTHBsRHE3LzIvckdHbXE1NFZSVExa?=
 =?utf-8?B?L2lpLzJOV016cGkvVEQwWTJOanFqc1F1bUxreVBSWkpmbUI0WVc1RzhnTGYw?=
 =?utf-8?B?TUcrZHA3N2VaN0VucTRmUngrUkdWU3lZLzFxbDlVNFQ3UG5wNzc2bUx4RWNW?=
 =?utf-8?B?WGplM0tpdE9BWEQ1OGhiazZVWUx1ektpNFc0T0hRVm8wMmFEbTVhVFVremFa?=
 =?utf-8?B?NWQreXBCcUpnemJYb3dtcEJOaWNlejBydzVtM1lySlhGSDAzaGpiSHk5MWFn?=
 =?utf-8?B?SkFHMnRhaEY0K1hrV0F5WXVtbnZYVkFVVVB2cERhOVF5WVRSU0pNVWY3dEVJ?=
 =?utf-8?B?VkJiR0FjeFRxbVlyeFFreEc5d3B4OHc4TFN6TnFtWGFuUEd4RmR5b1NPUm96?=
 =?utf-8?B?OFM2TGpQM0NoYVQrVzNqQU5vMjF1WWxHYTJyN3daaXJ0Z2hoa1FoeVY2V1BH?=
 =?utf-8?B?YUNwNkFsampuNXUwZUtGbi9tOS91UkFIL3QzbHlyM1ltYUpZdUVKTUt2ZVpM?=
 =?utf-8?B?aXUyR2tKcXBHbjRkMXFyMGlRdkZDYndlM3ArblpRbWMxVytSODNGelVkSVZN?=
 =?utf-8?B?R2I5YzN6V25rczd2WlBjU3RaQzM2YUJiSXE5RVBoMGpuSjdvbVNxeEhySGpR?=
 =?utf-8?B?Q0ZxdnhqSmhudXBZMS9TUEdGdWJMTStKTm1ZYksvby9sZzdSODFjTWJOOURw?=
 =?utf-8?B?TWJzeE55YWo4WG16QUNYMXZqSHhJeWxkM0lRQ09leGYvdW1uaUluZDF1emVQ?=
 =?utf-8?B?UC8rZmpNM1dIeWZoZ1dvMlo2WTNvLy81c3ZYTU9yNFdZU1Q3c2IvMlNuWFVQ?=
 =?utf-8?B?OEpPN250TjV5dytwbTUzNjZmUXZBNlpObE1LVlNTMDIzT2w1M1E4L0RBcW1w?=
 =?utf-8?B?OWNMcVR5RGMya2xJU1IwNHBEejcxUGljOWlVRVJ6L2J2V00rWm9oeDlmTkRp?=
 =?utf-8?B?N05EeFBiQkNjRVY5SFNTS05YcnIweERnTVROTW5xY21mc0dCTG5HcGp4YTdr?=
 =?utf-8?B?cHRsY1dXSzJMM0h5dXlSTHQ3bFExcEhYTUxaR0tIRUptWDNwYlJOVk8zTU1X?=
 =?utf-8?B?aDRkUlptdTFRQU1aRjVXQm5MNWxkS1FHZ0ZYZWxFeGRMVnpLa2F1ckVRNEo3?=
 =?utf-8?B?RzRRckxIMG11Vkp6dmpmR2RrczBTSCt4MFRuY1U5UFQzUmU3Uk1LUXBPZVgx?=
 =?utf-8?Q?D73KBBEhv1Ph7lfueYD2A11Fm?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 0717ab33-b8d8-4588-12b5-08db9f3e17fe
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 16:22:04.3723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LAN941mtEhkc8pL3VNffy8vn/0QAhYiXckRsdLbaMSzkOjMU7zQRfsXN7NSeDmu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7318
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-08-17 at 09:10, Patrick Rudolph wrote:
> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> chips. The functionality will be provided by the existing pca954x driver.
> 
> For chips that are powered off by default add a regulator called vdd-supply.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

