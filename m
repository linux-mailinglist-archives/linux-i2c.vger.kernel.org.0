Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49CEB5BD735
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 00:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiISWYS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 18:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiISWYR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 18:24:17 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9702312094;
        Mon, 19 Sep 2022 15:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hclPZbVPO6jlIVXs+Mc71QEFyAaFECDpSQDgIWYu6AYDTwCvnf9ZwONDlwZ1hx1xTtL6qhRUO/1OM7VxEfZXBSly/KcenqF0XWQfPjrnfDi3jPgHUWcpcijfJUbnBMuyfC8UgshrX9TCfEKa5wTyChJseDKGo8dm7JyvxiwnbeR75lEje2kx7IprLRmBGYCTIfIKqxZpfeseotWBZzY2QYuTJgJ2mBzmRuyix5UTFqZcOE9Sd8tFC8UBDdllW7TyTfcfsBCmTz1mtIAvzFrpmJvRv8vAatv1kLZAm/hpSriJHAXcrB3EBOgzo0kHpIgA2fTahPJE/O+rFe8i6xMQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OG6saexF//jz//AOOdvogUQHs0fiabov3/mD4ZcoxT0=;
 b=aI9ALbOZscGqu3nn12fnXRsdFQI9OrVHkcMSF3XptActoJc9AWoz3YUoDjRFfxVxxRNabx96uba1J8layjTcRfC+3H1AM7sDn6QIJXmB1lJZN2GFrSXTy8DSgDMGolh3JH4g+HXPrfQ1LfzUaMAITXgVDHIrqh8vHZy7nesATeo0MsuLmRW0hMZoYJccZZvBLNHe/0SYp1L3kOFKrSLuiZP8cnUTKzQ2ASQmWoLellLbeT+sIL1k06Z/XaZ6Cn3GWMPe61msNG2W+JJODMimimpJZjgdmIxouN4jwWCLbgSoXfJC5G2lwrVYnmI1x9eh5ReENzlJwIxZcfvzMB4TsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OG6saexF//jz//AOOdvogUQHs0fiabov3/mD4ZcoxT0=;
 b=K0QUUiLiJNBuLw82XxEyUhLt/tt5CGXk4LlSqVF7sLKvl7XnEeJgiZcvCpbnNKvuIjnG6JRAhxXbpLjLmkcVmiy+zgBHfVMP6nefFSKjHg3aVjNIlVPHoL8V3db44iJhVfqU4eEV+wGzA2iRdHLFvvu56sObWK0tkzvqbSolXgV3UrO6+ydAQOxLo95tFFW0NW9IHQab0UG94Ooon/z863+medWDOhIv/3ulNAshZUfFc63Kx35j5T0l8N75Wxlc72e9pBzW43HLVEH2IW8bThnopdOwsIW5iCPrhQ/h2DySMmlLs3qfEqbJV4Gs964dh4QCVKi/4TNegpYXR3wOBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB9512.eurprd03.prod.outlook.com (2603:10a6:20b:5a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Mon, 19 Sep
 2022 22:24:12 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 22:24:12 +0000
From:   Sean Anderson <sean.anderson@seco.com>
Subject: [BUG] ls1046a: eDMA does not transfer data from I2C
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, Joy Zou <joy.zou@nxp.com>,
        Peng Ma <peng.ma@nxp.com>, Robin Gong <yibin.gong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>
Message-ID: <38974aab-06d0-f5ff-d359-5eedd2f3bb3e@seco.com>
Date:   Mon, 19 Sep 2022 18:24:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0029.namprd19.prod.outlook.com
 (2603:10b6:208:178::42) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AS8PR03MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: 48dbd31d-0cf9-44fe-8974-08da9a8dadd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EANEv8b2rtfql7Bd/GRQtSxKrHbecR4s2ALs3Bn4H4H349YyNjiajR0FPd8PBRxB4wuwntDU28YcnglwCeHUNH9myGU+QnEYvUAoz7LJpwUE3/Szu01+4XNCAvdsD6kGj8u/d9aWMwrVlYR5XwXSlyMbukOPif9ZLLHY9NnRdG7lhqZ8NYYQk2tOz06D2fK7cJQwDTopgSpPE+XwnOACBSZC1nzin6YXF81rTpwirvMFeU0IVfi8+6NGbEtMryNIygwb+oYkAEU2kzx0HKK3+USMiCGhnf7xaCy1OfV0P86/1ix7yarHoZbbE4FfasqkrWc0zNlk0kztXz2dhQzs9Wdqomsqy/FUlRk5bnC5NLl6UnlDcxMEMjsEnG1dBnCpdV8nqm7cwLwCnNCqDZaSBgpBVHP6zWFBfuQ9kFSagvAj5Pb3toq7wh9+KiLPCM2tTj0SVnxamOJZLy7q3RzK3qcvO6a6DND8MERHKtQ6SC4t5CjTSxqRMfkCOoVBWzNHZzNU7iirdOwZYvkRll9e3ZCTo7pXyutNr4ErrxEOuFzbEtHf+lkPDl/XRMiLGnpnWGyRaW6CHH7RDK6QgwM2i7M00jaCmw1Dyxxglzp7KOB0RJZtDFPm/IzuMtLXdzpWg54z+ynsV0Yf0Cxftkxvj0WSuobDxAS7PgyZ03lF8NXpGXd/Fj8m+pwdiPITuv7+ML5AUZqHWxRCowsZIhiaI1N8Xc7M75UvdRNcIomex+yqq6WTQwspUfvmy4sT3fki5x74T4O+IAxvgB7CBZpH+Wq31Qxi4dVbteFtaBhw8e2lAoit+jduxziSZK4+P7IQ03Ei5UsmTw23A8REyiXQN63ZY6KRvFmG/RYXdap3l6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(396003)(39850400004)(366004)(376002)(451199015)(36756003)(86362001)(31696002)(38350700002)(38100700002)(44832011)(7416002)(478600001)(5660300002)(2906002)(6486002)(8676002)(66946007)(66556008)(66476007)(110136005)(8936002)(54906003)(316002)(4326008)(6666004)(186003)(83380400001)(41300700001)(2616005)(6506007)(52116002)(31686004)(6512007)(26005)(45980500001)(43740500002)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3JqL1BGMTBjNkkwZDhpK0xaUmt5RzJYNnVncDNOck9BRHNhR1Y0aTZsaDlN?=
 =?utf-8?B?YURweHAyWVNEVjBya1dGMklFMDVNYzVkckx1eVRuMmZJY21URmVBcklmUFhC?=
 =?utf-8?B?RGdoemxJNHBQbEF5SUZIZ1Jtc0xSRS81eTZoOEhzS0o4WHB0QWxUVFVGcW0r?=
 =?utf-8?B?U0hENmxBaHNEL3M5c1RUb3VUd2NheDZua0IxMGh3Z05HUUYzY3FoRS8vUjJO?=
 =?utf-8?B?aXdVYWM4UUZyTWZhY0svcDVjcVBnc2pJT2pDRmFxbWpCY1ZUN2FVRjk5YVZa?=
 =?utf-8?B?NFNzRm03M3EwcVhtdHRUeUNHdDR1RU5VUjYreDRPZHpqWG5BT2dqNTY2aVpq?=
 =?utf-8?B?cEhBV0NNV3hXcEU4eHV6a0Jvb3JZd2JaNUIwbDZwdDBkaFhOVjFXVWhkM3gx?=
 =?utf-8?B?TlBJamdISTM3dUl5RmxvandlK2pLUFdNY25VaFBLbFU2RDZpdHNLUmozT2JN?=
 =?utf-8?B?UDE2QjRXajBrN2dFMHJmeis4M1EwMlJZL20vVUFtZStBL2NSYnRJWkxEOG1o?=
 =?utf-8?B?MG82RkhtTkJmL3YxR2M1TkNvNkJzY2g0N3ZZMjNRMy9HellZbzQyRW51SDBC?=
 =?utf-8?B?d2tFVW5RSzhLbEhHa29zNjBBZmcrSTlpMFIrSVcvcXQ4bytSWlVFSDF4U1hs?=
 =?utf-8?B?cmdUYlc2WGc1dEsvR3ZPOTNzRWZ3ZWdlVzRkYU9RR0EzNDlzeExaNWJXeFNp?=
 =?utf-8?B?eHo2MHRRRE8rWmlNUXByb1NTSjB1R3VZVlE5K1BsSHl1Q3VjbmV3ay9UckhS?=
 =?utf-8?B?bHBRNDhQYm1jVmdOYTBsRExWN0lNczRjWUVQanluVXhCSEpEb1JaU2xYZy9a?=
 =?utf-8?B?WC9BMktOdXh2dGVobEo5Sk9Ca0tlbDlUYmgxUWRKRmwva1c1cDZIUUx5elpn?=
 =?utf-8?B?eU9mdnBHNmNlZzBxTzB2Y3BuaUtvUFZaSWYxclQrRTl2bWhvREUwQUVPTVBz?=
 =?utf-8?B?V2IwK3JpZTRmUXNvOEJOcmtNeE96UEFuYlFJbzQ2MVlmcXIyWFp3VVFpR0NZ?=
 =?utf-8?B?Z0lnYkRINTdGeHAzZUFQUThJaC9XUU03ZmxvNUFMcm5lRWgrbUc5MTcrTXRF?=
 =?utf-8?B?VVNlWjBEVkRuWGFJQWFORFIxbTNtZUVOVlBYcEptcjRJOVl3TWswRHFYc3lB?=
 =?utf-8?B?SmUvU1IrelhpOFN0dEFlSlNxRWcxREpIcjZScWZacXlGL2pYNjNXbWxqWHg5?=
 =?utf-8?B?cEd5ZTgzWFEwbVZ4THBWekhsZVFNSHhFQ3U2aDlnWkRMamt4TmlyMnIyY0g5?=
 =?utf-8?B?dkFhbTlVWHpJQ3BqaTZCMytmNlZ2QUlsR3V6aVNHb1BqZTduQWRxZnNibVVi?=
 =?utf-8?B?UGhkVDdUZExXb2gwa2ZURDQvZmFUamFkc0VUWFNsSThud3BRdVFRUk5xVjBp?=
 =?utf-8?B?VkNsa01ZNUNPbGpOSDQvajE5a1MzZkxNYnUwTHhuaDBDTGdDUXdZdlJ6a25W?=
 =?utf-8?B?T0FZS0NsaFdjN3BVa3lPUHVQTmVpcityQ2J2c3hVeGJqWWdudWRwUitYaEpN?=
 =?utf-8?B?L0dIVW9NMGhYUzg3MVd6Tm1KNkp1QUNTa0F6SlptM1pMUW9HaGxyT3I4bk1a?=
 =?utf-8?B?MGV0RU41MEwvVzZRSU41M25ESmtaL2UwQkk3V0FOK3VQeEtyaWFxRzhVMFBr?=
 =?utf-8?B?ZXR5eWlBNm9xSWN5cEVmYVJYV3F5b0NwMHA5Q0kwVDF5YnVzMTQyZHMxV1VR?=
 =?utf-8?B?TURRK2hKTzNKaWZXejNtcWxQWU5vMHNkV3VVd21aVmJWMVVwWDhxVXJXbmlF?=
 =?utf-8?B?YXFkdGgxN0Fjc0NnblNFZXJBekYvUm9NdHZzQmgvdXZWRlRRcEJzTGJncXQx?=
 =?utf-8?B?N0g5VHB2R0o1bVludlJidmVwZGFTeFNkRitWWmN2aUpLdCtMU0xZK09LQTRx?=
 =?utf-8?B?M0NMWVdFOWRUeFUxTUxFU1llaStUMjhPem9EZWQ3dTFPTmxhUnovWHpTcnU3?=
 =?utf-8?B?S0Rxekc3ZVVNRUhhSmYyRTZnZG13Rk81UlpSN1dFQWhvbWVxSUhvUG81bGNN?=
 =?utf-8?B?ck1pU0JhdkdSaVNFQXp5Wm4ra2c0cDZ3ZFJ3YnA2RmFWL2MvM2ZDWDBLN2dz?=
 =?utf-8?B?clJybWlhYmxpWXFCcG9aeXZJeTk4ZUJ5dVU3RExCSGpzSlcySDh1OStyMHNr?=
 =?utf-8?B?R0hYdHkrVjNZK1VlK0NZNUdwMG9uMEwxdnZkL1B3UFZzbXNRSGJIczhKMHhX?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48dbd31d-0cf9-44fe-8974-08da9a8dadd4
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 22:24:12.4737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkuxltOPzcMIWq8d/hsMp79H8LJWWBhrdDF4oVmuDAZavc2I3Thn4P8pKChXdLQoByCM22ui6yN4Jg0n+2snAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9512
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

I discovered a bug in either imx_i2c or fsl-edma on the LS1046A where no
data is read in i2c_imx_dma_read except for the last two bytes (which
are not read using DMA). This is perhaps best illustrated with the
following example:

# hexdump -C /sys/bus/nvmem/devices/0-00540/nvmem 
[  308.914884] i2c i2c-0: ffff000809380000 0x0000000889380000 0x00000000f5401000 ffff000075401000
[  308.923529] src= 2180004 dst=f5401000 attr=   0 soff=   0 nbytes=1 slast=       0
[  308.923529] citer=  7e biter=  7e doff=   1 dlast_sga=       0
[  308.923529] major_int=1 disable_req=1 enable_sg=0
[  308.942113] fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd 00000000d9dd26c5[4]: submitted
[  308.974049] fsl-edma 2c00000.edma: txd 00000000d9dd26c5[4]: marked complete
[  308.981339] i2c i2c-0: ffff000809380000 = [2e 2e 2f 2e 2e 2f 2e 2e 2f 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30 30 30 30 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34 30 00 00]
[  309.002226] i2c i2c-0: ffff000075401000 = [2e 2e 2f 2e 2e 2f 2e 2e 2f 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30 30 30 30 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34 30 00 00]
[  309.024649] i2c i2c-0: ffff000809380080 0x0000000889380080 0x00000000f5401800 ffff000075401800
[  309.033270] src= 2180004 dst=f5401800 attr=   0 soff=   0 nbytes=1 slast=       0
[  309.033270] citer=  7e biter=  7e doff=   1 dlast_sga=       0
[  309.033270] major_int=1 disable_req=1 enable_sg=0
[  309.051633] fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd 00000000d9dd26c5[5]: submitted
[  309.083526] fsl-edma 2c00000.edma: txd 00000000d9dd26c5[5]: marked complete
[  309.090807] i2c i2c-0: ffff000809380080 = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
[  309.111694] i2c i2c-0: ffff000075401800 = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
00000000  2e 2e 2f 2e 2e 2f 2e 2e  2f 64 65 76 69 63 65 73  |../../../devices|
00000010  2f 70 6c 61 74 66 6f 72  6d 2f 73 6f 63 2f 32 31  |/platform/soc/21|
00000020  38 30 30 30 30 2e 69 32  63 2f 69 32 63 2d 30 2f  |80000.i2c/i2c-0/|
00000030  30 2d 30 30 35 34 2f 30  2d 30 30 35 34 30 00 00  |0-0054/0-00540..|
00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff ff  |................|
00000080  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff 5b  |...............[|
00000100

(patch with my debug prints appended below)

Despite the DMA completing successfully, no data was copied into the
buffer, leaving the original (now junk) contents. I probed the I2C bus
with an oscilloscope, and I verified that the transfer did indeed occur.
The timing between submission and completion seems reasonable for the
bus speed (50 kHz for whatever reason).

I had a look over the I2C driver, and nothing looked obviously
incorrect. If anyone has ideas on what to try, I'm more than willing.

--Sean

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 15896e2413c4..1d9d4a55d2af 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -391,6 +391,12 @@ void fsl_edma_fill_tcd(struct fsl_edma_hw_tcd *tcd, u32 src, u32 dst,
 {
        u16 csr = 0;
 
+       pr_info("src=%8x dst=%8x attr=%4x soff=%4x nbytes=%u slast=%8x\n"
+               "citer=%4x biter=%4x doff=%4x dlast_sga=%8x\n"
+               "major_int=%d disable_req=%d enable_sg=%d\n",
+               src, dst, attr, soff, nbytes, slast, citer, biter, doff,
+               dlast_sga, major_int, disable_req, enable_sg);
+
        /*
         * eDMA hardware SGs require the TCDs to be stored in little
         * endian format irrespective of the register endian model.
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3576b63a6c03..0217f0cb1331 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -402,6 +402,9 @@ static int i2c_imx_dma_xfer(struct imx_i2c_struct *i2c_imx,
                dev_err(dev, "DMA mapping failed\n");
                goto err_map;
        }
+       phys_addr_t bufp = virt_to_phys(msgs->buf);
+       dev_info(dev, "%px %pap %pad %px\n", msgs->buf, &bufp,
+                &dma->dma_buf, phys_to_virt(dma->dma_buf));
 
        txdesc = dmaengine_prep_slave_single(dma->chan_using, dma->dma_buf,
                                        dma->dma_len, dma->dma_transfer_dir,
@@ -965,6 +968,9 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
                }
                schedule();
        }
+       dev_info(dev, "%px = [%*ph]\n", msgs->buf, msgs->len, msgs->buf);
+       dev_info(dev, "%px = [%*ph]\n", phys_to_virt(dma->dma_buf), msgs->len,
+                phys_to_virt(dma->dma_buf));
 
        temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
        temp &= ~I2CR_DMAEN;
