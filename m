Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB65D553AE6
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 21:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354159AbiFUT50 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jun 2022 15:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233189AbiFUT5Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jun 2022 15:57:24 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE674289AC;
        Tue, 21 Jun 2022 12:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBC+BcGMgsdN0lqFIZJvehIvYKkWlvizKufKGS199wFi7f+sSPQ/TQ6bd3FDqjaGmwGtK5N5rfnlSVIneE+aCa61tY2JN3aVrKFSCU6PHFoxs69p9YFiZo4YS1+4whO4YgVyy9zTeOXhdK+hC2/MU0sWBvfdafalS3jqokk/z3hCdB9vnq758eQ9e5n0ln8k09nrQ1Np8PFCqNKqeZegIuNFchsKno694cXwgdCyTzLgl2veMzpv1UGq3e2rzF0vJ8GyM5xUoby5wswnJqmB80PD4lpqtimEP4AUsOvyF/uD7UeWL0oPKLwVZE9qka1brHJi3e1LAugSZwTn8iVIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oZRoTt05MQ7arT2D81+PWOby02esOSL11Vk3uorcGI=;
 b=fExceUOIoXNc4dyKAm5p02z4GqLOtvcTOVmbDbknVyNDdp0i0hP7rLluDQC+gdQko+DKj73ytpi11rQDQw6mQrVkddPT0AYRTByNbNLCVskHy0Sq/ZIE2qqcShSkMa9hJBswap2scepxrNPs6QmQIIKLgZHDR5Nka9dPxTaquM17dydZFmKxSRrd8YDQeJx0muhQlxESa3vSX28mFO8a/j2gWMq4MIZOQA56DgNsPr6zQsVV4tLQR/135uwczqbmjVBntHem+CTbFGSr7uKl3224h1GWl31Tb+D1Tl+OanNVrOt76DLlH/hhutACRYNSt1qs8Sr2zxrxArJMRtYSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oZRoTt05MQ7arT2D81+PWOby02esOSL11Vk3uorcGI=;
 b=gSBC0N1jWkrMpGPv9zWDTakYuy554zWXWfn++i79T9xMfQnWKqg7EDVrwBgH6iGNwn9PhnjiQKARLYiULhP1wvG+FY1xn5oHLvhysKwCylGMaWdAhFqy8H5WmrmMXFjleD2jEyvSJan7IntHgtmvZLLIpfJRFJz2eLbA1WgxiV3mc8AabuSGdBjVeYtd15ZGt4rdX6TROryTAgJ7WwjFr+v5fmzH53wMk7B+NPg0wrOv7J9gzLFWJT63G0kTIU6VUjPY3R6xX9OqIgIl/U8WjBx0Cv8E5K2nbjwDFJKPpMwUD9CBn5EToWZApuOHhinrAsjd5TnULHaAKs1mT4tYew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17; Tue, 21 Jun
 2022 19:57:21 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f%4]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 19:57:21 +0000
Message-ID: <d6b890c8-bfb5-cfa5-c6d8-ee245701c077@nvidia.com>
Date:   Tue, 21 Jun 2022 20:57:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 01/16] clk: generalize devm_clk_get() a bit
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Vladimir Zapolskiy <vz@mleia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        =?UTF-8?Q?Andr=c3=a9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
        Cai Huoqing <caihuoqing@baidu.com>, linux-iio@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-mips@vger.kernel.org, linux-rtc@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>, dmaengine@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-2-u.kleine-koenig@pengutronix.de>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20220314141643.22184-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0072.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::10) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4df4ac9-468f-461f-45c7-08da53c0406b
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_
X-Microsoft-Antispam-PRVS: <MW4PR12MB5667B5F9C7A2A89F161F3BB6D9B39@MW4PR12MB5667.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G+oxFppXKRifZMTYz4pwUVZ5DDZFz5JZmSOVislurHy2hCr0H0J2ApxS9ZyOykzZJIMORhX55V1zJRKjxutbESQE65b3KKSVd5Od5mHFbJoebjSL71KG2acWpgL9HAH1jM9f7SD99cA2VZD6A7VGEXTvadLsqP1qYxjjPlvweJB4O1dHJ7cH5h1gQhhbyoMOO/EubjJfwBcLdAdYLsHul9BjAy58+g/t+/VcSjb5FPm4HkLxnNM6j2PA7wAE1WMjZv/3Toi20k2sl7X527zuITbEsKIHWA+A872H3A69ui9Mgn5fqtS/7ASnW4NCzBbsOeiiZ4Q6EEsWHGpVJZp6rOvtoWJMTDKvxEzBcHl2viYiZcv+fYSLuCT3NPYf2JWH9WXMh49KeYi8QOJCJAcIQdQA0iRptAa/mfIjfZpL0RCc0oHmCBJHYVt5H8gSZLyDcArgyu4R6ym0hCpmz8cFe39Y/VQpuySGtfrbcYWMzZHhTC7gZpnggHUkFTPZuC7OAA4/5w8CKSCO6Sk1l6xhOddSPvZlfz2A5OPG56YXZ246BvQDwOtqQpgFplSYWRV2pCMOLNqP3L99Lun24wmXwRFLffA4jy3xy2stPE5d3JvG7Ror75yZBBwiOpGKGve4E0w/YdvqYL9yTlzovtJyJNCk+kKAlL7iBRVrT+fR9wFutosj5fs2fCqk4lQASbT2vF8WBGo4avdxPjdONtt4qQ4v71nP7MSQwy+yu5wVAps0gn36uHwoKwbAlKni4WGr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(26005)(6486002)(36756003)(6512007)(31686004)(7416002)(41300700001)(7406005)(8936002)(86362001)(5660300002)(478600001)(8676002)(66946007)(4326008)(31696002)(7366002)(186003)(6506007)(316002)(2906002)(6666004)(921005)(45080400002)(83380400001)(66556008)(66476007)(54906003)(38100700002)(110136005)(55236004)(2616005)(53546011)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm5mbnVZV1NqTFBWV3hoNW41WVpoU3g4K3AvN2JWbnY4L1loWkxOaFp3RDZ6?=
 =?utf-8?B?R2h1OU0rcU5lc2hiT3lXR2l0UDR6QWFMMk1RVXV4TU9JZHJHMmJ1SmVETnht?=
 =?utf-8?B?cXRyNzEraFhNSmxYZVoraytRTllKM1RiYU9TMFlpelcwQW9NQk9HdkdQUEpO?=
 =?utf-8?B?ZzU4R1RDOS8zOEVJUmFTSzZiVGliVlFJQXJwSzQrV09PUGgrMVVjRDJkZlNl?=
 =?utf-8?B?cWVnR3VXNUYxOTQ2cyswT0JXcE1WQVFCY1FFZFdKbTlVcDhIYVFPTU12c1lI?=
 =?utf-8?B?dGNhem12YVF3RXN3NjQzQ1FOZXlxc2tTTktISUJ3SllSNDhvSXE1L0Zxc1VU?=
 =?utf-8?B?UVNnRGY0dUpMR3o1eGo5Yy9sdHRnM0daMmhZMUpOVUp1NW03N0NRTVpjN2x1?=
 =?utf-8?B?V1F1ZjlKY2xIOVFLOXlXNGh2WnlFK0dlTDBCc1hpa2p2Z2pQc1k0TFo5N0xV?=
 =?utf-8?B?MC9BZjYzT3BBeW1DVkNURldncDJ3bGZSbUQrRnE0Y3lCZlA0cHF4WWhFUWQx?=
 =?utf-8?B?SXhBMTBHWURLWjBUVHR0WTQya2paZGRFb1ZrUTNMVHl2bVFnaWZqZzA3Nkp2?=
 =?utf-8?B?MHZDUjNxWEZhS2k2dnhQU0pFb0JBVHNsSnI0eC9WUTBCbjRYMnNmYjRkSUdQ?=
 =?utf-8?B?a1dnM3dEWmUxSm5mSDBJaUJqL1oxbzF1Mml4UE5iSVBHbzQzajdIcGdYMHNH?=
 =?utf-8?B?VkNZR0NnbmQ4TkhEQ2FnZjM1b1ZaL0YrUXZEQlVzcjNZYnhYVTBlZUplNk5K?=
 =?utf-8?B?anpORjBwbDVIa0JCcU03bUxYeTN2WUFNZWswYXYrankyZkVMeWgxalprUU5m?=
 =?utf-8?B?T1lsckFaTEV1UVFlRnU0WWVNcVp4dm1CV01GSzdZL1RVSzUxVW9wZkR2LzAw?=
 =?utf-8?B?Rys4dVBYTUQ4VEZHZGVCaWhta3pxYi84MGptMXErQU9uZmp1elBMQnRyWnZy?=
 =?utf-8?B?dzZMMmo5QXhhNVdwUEtMNmpsMHVMUkRTRmxvcHNBd0JVSGFFUERMSXBNcTB1?=
 =?utf-8?B?MDI2dGdySkxqZUhoOFNjYTJLZ3lYejBkeGxETUZpekU4cFJQeG80bmlUc0pR?=
 =?utf-8?B?MVM5K2dvZm5BK05QWTJlcVZkTU4vT3pSTzRhbUhiV1VXRjNFYURzNGxDWUV4?=
 =?utf-8?B?cHdweFhheEQ3NEhPME00SHBXZjg1T0JvdTlDRDJpRmtaNndUT2N5SGFYREJT?=
 =?utf-8?B?UVNpWUttOU9xQXdjZUJCMUlvdEJlN2JIelZ3RG9Jb3g1ZWxuZlB0WTUyZzgw?=
 =?utf-8?B?eE9jQlZaTEQvREh4NnNSSGhOSHFpakQ0MHZER29nNWgwaHdnSGFlbFpuMzBZ?=
 =?utf-8?B?R3N6SEJKclZiWFBwbjMzUlg4dmpwanB3SWI2R3ZoS2w4TFFTK2p0dnZveURT?=
 =?utf-8?B?UHBwd3VSa213dEJGZDVCRGw2aVJVUnFJYW5Eb3NHTlA5cS9wRFFwZTErVCtL?=
 =?utf-8?B?S1hPWTRKMHU4R1A2UHpGdlFIUldHMVhzLzJaKzFlVHRweWRudk5BWERqVWUy?=
 =?utf-8?B?NDkwR0htMzY3QUU5QkVMcHArcEFtakhrYzQ5LytMbk43MWhUM0EySmkrRHhH?=
 =?utf-8?B?aXVzbFZSY0tTRTBJN2oxZjdRL28zYU1PWktSTWFxRlhSMHR0eTNMMGdBVXoz?=
 =?utf-8?B?UUVncVY1a3BENlROODdCZWVKZjRHR1BBbldjMWJ0WlpVck5TTzRheWlqaE5G?=
 =?utf-8?B?ZVc4V01YZldQRFo3eFlqU0FLaGhhazd5NHhXSktwbysvR29HcHdGVERFUmUw?=
 =?utf-8?B?MkZNbFgzTFEyZk5mK2pINHJVemZuSVgzVHBwazJYRFVMSUczdTZaY3V3Wmlx?=
 =?utf-8?B?MmJEVlh0NCtxYytmNkxjd3NLb212bFNMd1BpdzlUMU1mZ1Ztc2x6N2wraXNl?=
 =?utf-8?B?MlIwV0p2YytsRXUvZW9FdG9JY01xU2FMNFBRMWozRDdUWXVHajdxbkNiZTVj?=
 =?utf-8?B?U1RZUzFDam9iVFpTM0dvdXozdVM5c2tKZVJYWU41NmF5Vm9jY2hON1B6Qmd4?=
 =?utf-8?B?Z1diM1RkSzBLNGROL2hWZHNDVEx1OUFyMXFaaVd5UU1EQ2hwenJNTm9QNkU3?=
 =?utf-8?B?a3hvTUJzbStNWGNDYlI2S3lPNktDZGlhbEw1Rlk2ZDVCVENUdEEyMTRaWFdM?=
 =?utf-8?B?cHRuNUgweTAvdGd4MmR6cisrams2ZVdGN2sxeGtLMC8xb0pmbXdtdzRDY1dt?=
 =?utf-8?B?a2wxeW15am8xdkZySVFnWkF2c1NqTHhnbE9YT3V2bFFQRVl4K1BGQ0NJbklW?=
 =?utf-8?B?bXdYblJRMnJaMUlWbFA5OUwxa01mRlN4NXorMU5KcmhCNmExQU9wbVZBc0U0?=
 =?utf-8?B?cDNhQVAvL1BtbUdCSXY0N1RSMjdGZ1N6aDluQUp5M3pzOHR5Z3p3R3AybnVo?=
 =?utf-8?Q?99Y0w/HU52o/zH2o=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4df4ac9-468f-461f-45c7-08da53c0406b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 19:57:20.8615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXs+bOjH+4fOcuUWH70+RIveqnT0/Pq+8iyEigO8EvDRqJuyQL3UfJlXcd7Jw3A0Y26l6aYWfs6KfHQHmotPlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5667
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe,

On 14/03/2022 14:16, Uwe Kleine-König wrote:
> Allow to add an exit hook to devm managed clocks. Also use
> clk_get_optional() in devm_clk_get_optional instead of open coding it.
> The generalisation will be used in the next commit to add some more
> devm_clk helpers.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/clk/clk-devres.c | 67 ++++++++++++++++++++++++++++++----------
>   1 file changed, 50 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index f9d5b7334341..fb7761888b30 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -4,39 +4,72 @@
>   #include <linux/export.h>
>   #include <linux/gfp.h>
>   
> +struct devm_clk_state {
> +	struct clk *clk;
> +	void (*exit)(struct clk *clk);
> +};
> +
>   static void devm_clk_release(struct device *dev, void *res)
>   {
> -	clk_put(*(struct clk **)res);
> +	struct devm_clk_state *state = *(struct devm_clk_state **)res;
> +
> +	if (state->exit)
> +		state->exit(state->clk);
> +
> +	clk_put(state->clk);
>   }
>   
> -struct clk *devm_clk_get(struct device *dev, const char *id)
> +static struct clk *__devm_clk_get(struct device *dev, const char *id,
> +				  struct clk *(*get)(struct device *dev, const char *id),
> +				  int (*init)(struct clk *clk),
> +				  void (*exit)(struct clk *clk))
>   {
> -	struct clk **ptr, *clk;
> +	struct devm_clk_state *state;
> +	struct clk *clk;
> +	int ret;
>   
> -	ptr = devres_alloc(devm_clk_release, sizeof(*ptr), GFP_KERNEL);
> -	if (!ptr)
> +	state = devres_alloc(devm_clk_release, sizeof(*state), GFP_KERNEL);
> +	if (!state)
>   		return ERR_PTR(-ENOMEM);
>   
> -	clk = clk_get(dev, id);
> -	if (!IS_ERR(clk)) {
> -		*ptr = clk;
> -		devres_add(dev, ptr);
> -	} else {
> -		devres_free(ptr);
> +	clk = get(dev, id);
> +	if (IS_ERR(clk)) {
> +		ret = PTR_ERR(clk);
> +		goto err_clk_get;
>   	}
>   
> +	if (init) {
> +		ret = init(clk);
> +		if (ret)
> +			goto err_clk_init;
> +	}
> +
> +	state->clk = clk;
> +	state->exit = exit;
> +
> +	devres_add(dev, state);
> +
>   	return clk;
> +
> +err_clk_init:
> +
> +	clk_put(clk);
> +err_clk_get:
> +
> +	devres_free(state);
> +	return ERR_PTR(ret);
>   }
> -EXPORT_SYMBOL(devm_clk_get);
>   
> -struct clk *devm_clk_get_optional(struct device *dev, const char *id)
> +struct clk *devm_clk_get(struct device *dev, const char *id)
>   {
> -	struct clk *clk = devm_clk_get(dev, id);
> +	return __devm_clk_get(dev, id, clk_get, NULL, NULL);
>   
> -	if (clk == ERR_PTR(-ENOENT))
> -		return NULL;
> +}
> +EXPORT_SYMBOL(devm_clk_get);
>   
> -	return clk;
> +struct clk *devm_clk_get_optional(struct device *dev, const char *id)
> +{
> +	return __devm_clk_get(dev, id, clk_get_optional, NULL, NULL);
>   }
>   EXPORT_SYMBOL(devm_clk_get_optional);
>   


Some of our Tegra boards are not booting with the current -next and
bisect is pointing to this commit. Looking at the boot log I am
seeing the following panic ...

[    2.097048] 8<--- cut here ---
[    2.097053] Unable to handle kernel paging request at virtual address c216c810
[    2.097060] [c216c810] *pgd=0201141e(bad)
[    2.097079] Internal error: Oops: 8000000d [#1] SMP ARM
[    2.097088] Modules linked in:
[    2.097097] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc3-next-20220621-g34d1d36073ea #1
[    2.097107] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    2.097113] PC is at 0xc216c810
[    2.097123] LR is at devm_clk_release+0x18/0x24
[    2.097150] pc : [<c216c810>]    lr : [<c088cb04>]    psr: a0000013
[    2.097155] sp : f080dde8  ip : 000006cf  fp : c18d4854
[    2.097161] r10: c1501850  r9 : c1a04d10  r8 : c1c4efa0
[    2.097166] r7 : c216c810  r6 : f080de1c  r5 : c2737680  r4 : c26a9680
[    2.097172] r3 : c216c810  r2 : 00000000  r1 : c2737840  r0 : c2082840
[    2.097179] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    2.097187] Control: 10c5387d  Table: 0020404a  DAC: 00000051
[    2.097191] Register r0 information: slab kmalloc-192 start c2082840 pointer offset 0 size 192
[    2.097216] Register r1 information: slab kmalloc-128 start c2737800 pointer offset 64 size 128
[    2.097236] Register r2 information: NULL pointer
[    2.097244] Register r3 information: slab kmalloc-1k start c216c800 pointer offset 16 size 1024
[    2.097263] Register r4 information: slab kmalloc-64 start c26a9680 pointer offset 0 size 64
[    2.097282] Register r5 information: slab kmalloc-128 start c2737680 pointer offset 0 size 128
[    2.097301] Register r6 information: 2-page vmalloc region starting at 0xf080c000 allocated at kernel_clone+0xb4/0x3e8
[    2.097321] Register r7 information: slab kmalloc-1k start c216c800 pointer offset 16 size 1024
[    2.097341] Register r8 information: non-slab/vmalloc memory
[    2.097348] Register r9 information: non-slab/vmalloc memory
[    2.097355] Register r10 information: non-slab/vmalloc memory
[    2.097362] Register r11 information: non-slab/vmalloc memory
[    2.097369] Register r12 information: non-paged memory
[    2.097375] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
[    2.097384] Stack: (0xf080dde8 to 0xf080e000)
[    2.097394] dde0:                   c2737800 c0a72d38 c18d4854 c0530490 c216c810 f080de1c
[    2.097404] de00: c2120000 00000005 c216c9c0 80000013 0000017e c0a73d68 00000008 c2629e00
[    2.097413] de20: c2737880 5640e141 c216c810 c216c810 00000205 c1c09dd4 00000000 c27375b8
[    2.097422] de40: c2091700 c0a6e9a0 c216c810 c0a6f288 c216c810 c1c09dd4 c216c810 00000000
[    2.097430] de60: c27375b8 c0a6f3c0 c1caa8e0 c216c810 c216c810 c0a6f450 00000000 c216c810
[    2.097439] de80: c1c09dd4 c2120000 c27375b8 c0a6f850 00000000 c1c09dd4 c0a6f7c4 c0a6d4c0
[    2.097447] dea0: 00000000 c2091458 c2286434 5640e141 c1be7f08 c1c09dd4 c2737580 c1be7f08
[    2.097455] dec0: 00000000 c0a6e484 c1615714 c1be7c50 c1c09dd4 c2120000 c189a99c 00000000
[    2.097464] dee0: c2120000 c0a701a0 c1c494e0 c2120000 c189a99c c0302144 0000017d c0364438
[    2.097472] df00: c16da8bc c1626700 00000000 00000006 00000006 c16554c8 00000000 c2120000
[    2.097480] df20: c15105bc c14f9778 c2091700 c20917d9 00000000 5640e141 c1a88930 c16da8bc
[    2.097488] df40: c1c59000 5640e141 c16da8bc c1c59000 c1953b4c c18d4834 00000007 c1801340
[    2.097497] df60: 00000006 00000006 00000000 c18004dc c2120000 c18004dc f080df74 c1a04cc0
[    2.097505] df80: c106bbf0 00000000 00000000 00000000 00000000 00000000 00000000 c106bc08
[    2.097513] dfa0: 00000000 c106bbf0 00000000 c03001a8 00000000 00000000 00000000 00000000
[    2.097520] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.097528] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    2.097542]  devm_clk_release from release_nodes+0x58/0xc0
[    2.097575]  release_nodes from devres_release_all+0x7c/0xc0
[    2.097596]  devres_release_all from device_unbind_cleanup+0xc/0x60
[    2.097626]  device_unbind_cleanup from really_probe+0x1f4/0x2a8
[    2.097650]  really_probe from __driver_probe_device+0x84/0xe4
[    2.097673]  __driver_probe_device from driver_probe_device+0x30/0xd0
[    2.097696]  driver_probe_device from __driver_attach+0x8c/0xf0
[    2.097713]  __driver_attach from bus_for_each_dev+0x70/0xb0
[    2.097729]  bus_for_each_dev from bus_add_driver+0x168/0x1f4
[    2.097749]  bus_add_driver from driver_register+0x7c/0x118
[    2.097766]  driver_register from do_one_initcall+0x44/0x1ec
[    2.097784]  do_one_initcall from kernel_init_freeable+0x1d4/0x224
[    2.097803]  kernel_init_freeable from kernel_init+0x18/0x12c
[    2.097820]  kernel_init from ret_from_fork+0x14/0x2c
[    2.097831] Exception stack(0xf080dfb0 to 0xf080dff8)
[    2.097839] dfa0:                                     00000000 00000000 00000000 00000000
[    2.097847] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.097854] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.097862] Code: c2288680 ffffffff 00000000 00000000 (c2288680)
[    2.097872] ---[ end trace 0000000000000000 ]---


Let me know if you have any thoughts.

Cheers
Jon

-- 
nvpublic
