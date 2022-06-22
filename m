Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B81A4554F44
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jun 2022 17:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353708AbiFVP3H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jun 2022 11:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357891AbiFVP3E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jun 2022 11:29:04 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BF7205F6;
        Wed, 22 Jun 2022 08:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C24J7vJxooAMSwTnD/z9fqxuXAmEGvFBab7umMdE/cGKidw9dRDajKx8h3ObqhrJ8DVb7SinmCPt13AneiIafm4mgJn6lvVysJTxNrsoBiUIZmBEUFXnN1TgBJLnuiE7GqacgoO+Y0IMxgT/wcQIdhizWQWbomAUIzILGkU+4Z25NbwWDVbRydF8E+7zI9wNxop+WkoqAp5XVr4PP+84pbyuvKI936foW1/x1imgGJfmH2JiUdZvTDwOqo4+qxAiFB23wFgB/TQXFy57qxGX4beycREp6oa+UM8Bn5rb9+a5AxrJoh0W43ITc9WjtfUnTtZ2LakQgo7XpnF2fg/SXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZWcOeWrYxr6YLyWmgFGQ0usbfmRPd+QgP9Yi/PkTOY=;
 b=PluHj0JM1p4KPsq7p80GtzotCwhN69SpZ+PxWc4rCJ/A6O+Si49LBlEBJslU1TeC7xNZdeR4XUYFRSGiAhEmSMfdJUHzROGdiDmRhh/4IS3g5q6erXfQiTzSoimwnwoaZshvR5jNfBe0yf+vvLJyGJMAp8KPdj7S8TN4XU0XK+Gor13wRq/PkI0bVGUTYpM9lnvE3ae7hOG3Hy2RCBBajaBrx+2CdBGIs9JgOTkFcP7wBAgHpW1/o9Zp8f1BEHbPoGv1OM4Anus2OfQhlfPxFOJAaOAWWfqS+Hnf193KggTecaOMkpOUUJFlduFqaa1TStKbW1uSW8GB33IyKx5lbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZWcOeWrYxr6YLyWmgFGQ0usbfmRPd+QgP9Yi/PkTOY=;
 b=T1p4sQaZ56OwNSwP5EhR6yDAOKRoL/38KKjDmmbE/Wsea6oBqs0hwPncDLSFFy+QaW5zic2xZh47CJQASRG7tYGQbfZTlFMJmiUxq5c13GWCzmQmKh6scUS4pH+zxC1R9P3qzwCSNpmMOB9OWL45D8HnhwLWFAxBHYLWFr1seGPZ5qZyHHixkefLuayPnCJrwyf/2iUb/pZyelwSlP29S9KhBURJlDmdqGrAPQm6ibNgggdowMuGJt0jpawTBBCMNrPqT8Qwrp1jmEgNgn6QorMcbF8DAiBiqao6LOVsTH8EVTLs2Z/ygoN0wUGLFWV8sbmReTXcJIAOQyqxAZzORQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM5PR12MB1754.namprd12.prod.outlook.com (2603:10b6:3:10f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.15; Wed, 22 Jun 2022 15:29:02 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::190c:967c:2b86:24a8]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::190c:967c:2b86:24a8%4]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 15:29:01 +0000
Message-ID: <04d96f89-cd87-945e-d603-637d8a0d34a0@nvidia.com>
Date:   Wed, 22 Jun 2022 16:28:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 01/16] clk: generalize devm_clk_get() a bit
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
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
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-iio@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-rtc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Andy Gross <agross@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-pwm@vger.kernel.org, kernel@pengutronix.de,
        linux-arm-msm@vger.kernel.org,
        Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
        Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
        =?UTF-8?Q?Andr=c3=a9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        linux-amlogic@lists.infradead.org,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>, linux-mips@vger.kernel.org,
        linux-spi@vger.kernel.org, Cai Huoqing <caihuoqing@baidu.com>,
        linux-crypto@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        dmaengine@vger.kernel.org
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-2-u.kleine-koenig@pengutronix.de>
 <d6b890c8-bfb5-cfa5-c6d8-ee245701c077@nvidia.com>
 <20220621204914.byokkrxiznvod7vq@pengutronix.de>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20220621204914.byokkrxiznvod7vq@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::28) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b22ff68-c897-4cca-d5f4-08da5463eefa
X-MS-TrafficTypeDiagnostic: DM5PR12MB1754:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1754A36ED3B94A9A89F66CA5D9B29@DM5PR12MB1754.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GGuym/fWf7mWMJhH2Gd4Gu4q8k2jhy6IkNEWFqyIO/T3Q9oP+OobPuVFWWPCFsV40TZp8z+NNc4PTd1rbIycZgWp1WqL3KHGg5/TU+ttkqQnYQdIObyfpj0ewu/VN4uioUM+Wjoutd/8GoDM7xqtTw9IVyceOocrTUU03pTGVhvCEQi0kmF5YyYRqqmK6LBTC7mecgoDsZ7y2cMoWJ1+AmJaSq/Ol9LsI09uBR8l2XIbLEcZ94r+u5X/STF8T1rjd5iSuf4QXcVNiwSHx7LmJQu0uDHw8naav85Xrtk2X/S8DjkZMzIu5CC3qQsPCrWcVPAnlXGQMbsoQZPh1HgnR70aPKgjMGDHPXh/BN0HcKnvvDzVZH4FRYeX8zgenzPtOYnZnLt8ADu5Gv9gxDEjNPg1OEUEfgesir20Zq6CdQJeXrkS1HarVOYk1j20OQpDoZL03eHovZD7TUQpUoQQNAGmvDenPyME9c8g0u+Fju0ooQbZnFlVp2DCb53dWUovarLc6w6qUPibQSxZhVETaiW6leHOQRSCvHoufrFB91/4kKatKqWd5Ix6AsN4NVlLEKB/mAsfcc3PZYLs4Y0RoSgnYlvctY1Lt4BmCBvvpVojr5fIISnqPR5Eed8Lu9V561cA6pG5ft+XxjTaw84rLMSDC1UtGcqwNLTAqsBjDkdCR8A/C4C99UZr7jA8BmXtEPCPdTTqjV1kAMY9/APMtH1m+zGgWhV2H0889epMmvI8Xpp+kA3deDmZ3HRM8Jc5z6hKu0ehzxXepWZaq2rytjg+ikt5EC+CEPQGmDSQ8BsQ1iR2hD7dL+EtpVikdqXFerONzmtZ42Tf4f4i9Yr6tJfWUHP2TOwWltRJChe2Is54jv74hI6kT0hvF48mNt5c
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(4326008)(66556008)(26005)(6666004)(54906003)(66946007)(53546011)(6512007)(8676002)(66476007)(66574015)(31686004)(55236004)(110136005)(83380400001)(6506007)(41300700001)(2616005)(966005)(6486002)(7406005)(86362001)(8936002)(7416002)(7366002)(2906002)(316002)(31696002)(186003)(45080400002)(36756003)(5660300002)(478600001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlM5SE44akVVZU51OUVtYUhLdGxVckhTMmtlbHFpVzN6dXpqeVdXdk5PeXpV?=
 =?utf-8?B?ZXZiMTVGby8vUFpRTG9xUGdZUi95c1krRllJc00wRE82V3RXV3B3ZkVqOFBh?=
 =?utf-8?B?SHVpeWhsdngyb2YvU1RBdjNsNGJyRWZnYlRnMFE2RktYSmJMQzcyNnJrZnV0?=
 =?utf-8?B?bmdLVDBKZE5xbXU5bGJZWkZGL2dUTWFiNWtsNWZzSEtZWkhuSDFra3JrREg4?=
 =?utf-8?B?ZFNSSjdKcUpNT2dPSW04N2JlNXFFYjlSRWNuVzFMVlYxRVZCU0MyV3JNRm92?=
 =?utf-8?B?T0RsTXFUV0JZTFJmeG5TalBOOXlBRklSc25BUitCazhRL1pMUlBHR085cUVP?=
 =?utf-8?B?MzRjTXN0aHQyVDkyWHlJdzFtMmV2aHNUMWVvbGRKZ25qNFJBKytJTTdsNWNr?=
 =?utf-8?B?Vm5WOGVSdWRMNmFGMGNhVXBEamVZemtzOWt6VGcxQTRWNG4xNGVNTnZWK2Yz?=
 =?utf-8?B?SE5UeGM2WXRrb0Uyc1IrU3c4a0cwZlJaUER1TS8zTEkzTzJ6NFRTZ3NwY3Jj?=
 =?utf-8?B?aWVUZExPQk1KUmxpQkN4VXlUSVdhNlNIeDBtQjBXNWt4cXlTb2JzRGNSVms0?=
 =?utf-8?B?L1hicWJycFd1d0dvdjdib2E3a3lLUFNOR1JVRklkN0dySjg2aUxmYUk5UWZM?=
 =?utf-8?B?ek1reWZMb2xkYzA1eExLMHh6K3NuWFJEdnNxME5PTWI4RXJ3VUEzaW5EdlNB?=
 =?utf-8?B?cnVsS3cveVU4M3dOQk1BcVkxQ2NXV0JhaGV4bStzTVpJYVVhVS9SMzdWZGEr?=
 =?utf-8?B?Y2RxY2t1cU9RREJYTWsxTXJ6MUR3OUROdE9xWmpzSG9NNDJlbTRObEFHNnNp?=
 =?utf-8?B?a3FqU2dWZnZIQUhCRnVzV2poV3JUcENZT0JCcW1UMWNqeFRydE9YRW92Qms5?=
 =?utf-8?B?Z1ZNd3NjWU0zcGlUMWdNUlo5ZkpMZXdGTTJnRlBsSnlZaWRBeDRGb1FXT1Y0?=
 =?utf-8?B?N3R1NlU0ZFlYU0w0eTl1d3FGMXFSNm5UMXhhSHIyZVZlUnM0U2pHQ3JnMXNB?=
 =?utf-8?B?YXl1Ni80THdhY3Z0ZmVYWGdRQ29sdi8ydlhPWTNpNUJ1QTl3SXlaVzFqQ1N3?=
 =?utf-8?B?dHRVUDAxYTM0cDh6R1p6RDdDbXlIYTM5YkcxaWJydjVPRi9xMGhKTWRKem0x?=
 =?utf-8?B?bTBxOVNhd1YrRThGNEROeGM1cDRENk5CeHVWWENwakRMVmlVeGdwVWtiNU43?=
 =?utf-8?B?ekErcWVrelNuVTdnN092a1hJQjQ2V1hQRjJoK2VvdGxzclY0WUl3dmJ3U3g2?=
 =?utf-8?B?aEpEQm15ME92c1BMQmFrc3FGcnNvOUZoY0ZhTnBLcGtqOXQxRnBUTU9WK1dQ?=
 =?utf-8?B?amVETmxxTDNwaysvandKUGczL2VtRnRJaGlJMXpDaXp5bkQvb0I2UFdDN3My?=
 =?utf-8?B?NTJVTTVSNlE3cmtuR3A1L1g1bTFxRyt2MGV4ZVI3d01UQ2IxUDZtYmVDNkVD?=
 =?utf-8?B?dVRCTHFDcndxTlluSFZ3bnVQZEp6djNpZ29GcnQ2TFFXbHdQakx6Y0dudTB2?=
 =?utf-8?B?K2FnUU1LUW5maWh2d3dVM1BWMDY3a2NoUmtXMTFNNWkyb1BtdmtUNHpvRHAz?=
 =?utf-8?B?RWd5dHZNUUFrYVpMdnpMQkxHd0JTZ2FWMVdVU3AwcEFuQzkySEhyRGF6WFl6?=
 =?utf-8?B?a1FvMUJ1ODh4YVpkak96OGxjVlMzSG9PN09SOWRZOXJJL3pLbC9meEVSc0pq?=
 =?utf-8?B?amU2MnQrUDliaHY3dHhrTXpWcXRXNnhiRWJUNmZVa25NWURhUTNJWEkyZ3Ev?=
 =?utf-8?B?Yk5na3UwMXMxVHdweVRKRkwzRlI4NVE3QzVRejdFdHlxNEo5cm0rT3lWa0hv?=
 =?utf-8?B?ZGVtdkswWEtFNktKREdzN2hGd1RFaENZby95eWlpbVBoS2RibFI4ZlFCQytj?=
 =?utf-8?B?K0ZVc1NDWW5FQ2hpRzFydVhtYTJhZEtobTZyQURaWFhkZ2Qrb045ZW5RUCto?=
 =?utf-8?B?cFZCanZBYzBnNVJTRytrZk9GVUllNWtjZnRNTGhjUFJmVjNyU2JuOUhHK0VG?=
 =?utf-8?B?RURkZEh5a2p5LzBqcURlZ0E1ZDJzSG5XSXZSWE9nczh2bjd4aXJ5UHV1Mlo0?=
 =?utf-8?B?SWZjUmcyQy9nZENjVzMrdTM4SzRIQ2tEUWN3bC9uYWhPQ2NpV0FPN09pWFlt?=
 =?utf-8?B?ZlZtV0IzSGxKRFVEOWVEMlpXQWplL1NlYUFHZk5NQUpkYUZzU2RCeUpDNjZY?=
 =?utf-8?B?U3dGaFVSdTVkNVpLejNyQTFRZzV2MEFIZzFPaTJlKzFiQUZuTlh0R2tXU1BU?=
 =?utf-8?B?UVBNZEJYVGNWRTc3eFEwL0JoOHIxVlVqdEpqS3g2RHdSMGZLcitiUWRxamVY?=
 =?utf-8?B?emIzWUJJd2d5Wm1qWmdKa004NHpZUEpyelduWUMrVFgrWW5wK1B2anZmUmUv?=
 =?utf-8?Q?0E66pJxcpUhIoOvc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b22ff68-c897-4cca-d5f4-08da5463eefa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 15:29:01.6903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnyvwKwSQAW1n7ZE/7QvOrkpzQ6PxxiI6TskPkXk3rBMFzyuo7mHYyfWUYBKHDbb3b78ugHIJM4NSj711PHzbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1754
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



On 21/06/2022 21:49, Uwe Kleine-König wrote:
> On Tue, Jun 21, 2022 at 08:57:00PM +0100, Jon Hunter wrote:
>> Some of our Tegra boards are not booting with the current -next and
>> bisect is pointing to this commit. Looking at the boot log I am
>> seeing the following panic ...
>>
>> [    2.097048] 8<--- cut here ---
>> [    2.097053] Unable to handle kernel paging request at virtual address c216c810
>> [    2.097060] [c216c810] *pgd=0201141e(bad)
>> [    2.097079] Internal error: Oops: 8000000d [#1] SMP ARM
>> [    2.097088] Modules linked in:
>> [    2.097097] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc3-next-20220621-g34d1d36073ea #1
>> [    2.097107] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>> [    2.097113] PC is at 0xc216c810
>> [    2.097123] LR is at devm_clk_release+0x18/0x24
>> [    2.097150] pc : [<c216c810>]    lr : [<c088cb04>]    psr: a0000013
>> [    2.097155] sp : f080dde8  ip : 000006cf  fp : c18d4854
>> [    2.097161] r10: c1501850  r9 : c1a04d10  r8 : c1c4efa0
>> [    2.097166] r7 : c216c810  r6 : f080de1c  r5 : c2737680  r4 : c26a9680
>> [    2.097172] r3 : c216c810  r2 : 00000000  r1 : c2737840  r0 : c2082840
>> [    2.097179] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>> [    2.097187] Control: 10c5387d  Table: 0020404a  DAC: 00000051
>> [    2.097191] Register r0 information: slab kmalloc-192 start c2082840 pointer offset 0 size 192
>> [    2.097216] Register r1 information: slab kmalloc-128 start c2737800 pointer offset 64 size 128
>> [    2.097236] Register r2 information: NULL pointer
>> [    2.097244] Register r3 information: slab kmalloc-1k start c216c800 pointer offset 16 size 1024
>> [    2.097263] Register r4 information: slab kmalloc-64 start c26a9680 pointer offset 0 size 64
>> [    2.097282] Register r5 information: slab kmalloc-128 start c2737680 pointer offset 0 size 128
>> [    2.097301] Register r6 information: 2-page vmalloc region starting at 0xf080c000 allocated at kernel_clone+0xb4/0x3e8
>> [    2.097321] Register r7 information: slab kmalloc-1k start c216c800 pointer offset 16 size 1024
>> [    2.097341] Register r8 information: non-slab/vmalloc memory
>> [    2.097348] Register r9 information: non-slab/vmalloc memory
>> [    2.097355] Register r10 information: non-slab/vmalloc memory
>> [    2.097362] Register r11 information: non-slab/vmalloc memory
>> [    2.097369] Register r12 information: non-paged memory
>> [    2.097375] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
>> [    2.097384] Stack: (0xf080dde8 to 0xf080e000)
>> [    2.097394] dde0:                   c2737800 c0a72d38 c18d4854 c0530490 c216c810 f080de1c
>> [    2.097404] de00: c2120000 00000005 c216c9c0 80000013 0000017e c0a73d68 00000008 c2629e00
>> [    2.097413] de20: c2737880 5640e141 c216c810 c216c810 00000205 c1c09dd4 00000000 c27375b8
>> [    2.097422] de40: c2091700 c0a6e9a0 c216c810 c0a6f288 c216c810 c1c09dd4 c216c810 00000000
>> [    2.097430] de60: c27375b8 c0a6f3c0 c1caa8e0 c216c810 c216c810 c0a6f450 00000000 c216c810
>> [    2.097439] de80: c1c09dd4 c2120000 c27375b8 c0a6f850 00000000 c1c09dd4 c0a6f7c4 c0a6d4c0
>> [    2.097447] dea0: 00000000 c2091458 c2286434 5640e141 c1be7f08 c1c09dd4 c2737580 c1be7f08
>> [    2.097455] dec0: 00000000 c0a6e484 c1615714 c1be7c50 c1c09dd4 c2120000 c189a99c 00000000
>> [    2.097464] dee0: c2120000 c0a701a0 c1c494e0 c2120000 c189a99c c0302144 0000017d c0364438
>> [    2.097472] df00: c16da8bc c1626700 00000000 00000006 00000006 c16554c8 00000000 c2120000
>> [    2.097480] df20: c15105bc c14f9778 c2091700 c20917d9 00000000 5640e141 c1a88930 c16da8bc
>> [    2.097488] df40: c1c59000 5640e141 c16da8bc c1c59000 c1953b4c c18d4834 00000007 c1801340
>> [    2.097497] df60: 00000006 00000006 00000000 c18004dc c2120000 c18004dc f080df74 c1a04cc0
>> [    2.097505] df80: c106bbf0 00000000 00000000 00000000 00000000 00000000 00000000 c106bc08
>> [    2.097513] dfa0: 00000000 c106bbf0 00000000 c03001a8 00000000 00000000 00000000 00000000
>> [    2.097520] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> [    2.097528] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
>> [    2.097542]  devm_clk_release from release_nodes+0x58/0xc0
>> [    2.097575]  release_nodes from devres_release_all+0x7c/0xc0
>> [    2.097596]  devres_release_all from device_unbind_cleanup+0xc/0x60
>> [    2.097626]  device_unbind_cleanup from really_probe+0x1f4/0x2a8
>> [    2.097650]  really_probe from __driver_probe_device+0x84/0xe4
>> [    2.097673]  __driver_probe_device from driver_probe_device+0x30/0xd0
>> [    2.097696]  driver_probe_device from __driver_attach+0x8c/0xf0
>> [    2.097713]  __driver_attach from bus_for_each_dev+0x70/0xb0
>> [    2.097729]  bus_for_each_dev from bus_add_driver+0x168/0x1f4
>> [    2.097749]  bus_add_driver from driver_register+0x7c/0x118
>> [    2.097766]  driver_register from do_one_initcall+0x44/0x1ec
>> [    2.097784]  do_one_initcall from kernel_init_freeable+0x1d4/0x224
>> [    2.097803]  kernel_init_freeable from kernel_init+0x18/0x12c
>> [    2.097820]  kernel_init from ret_from_fork+0x14/0x2c
>> [    2.097831] Exception stack(0xf080dfb0 to 0xf080dff8)
>> [    2.097839] dfa0:                                     00000000 00000000 00000000 00000000
>> [    2.097847] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> [    2.097854] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
>> [    2.097862] Code: c2288680 ffffffff 00000000 00000000 (c2288680)
>> [    2.097872] ---[ end trace 0000000000000000 ]---
>>
>>
>> Let me know if you have any thoughts.
> 
> Yeah, sorry, there is already a fix at
> https://lore.kernel.org/linux-clk/20220620171815.114212-1-u.kleine-koenig@pengutronix.de

Thanks! Works for me.

Tested-by: Jon Hunter <jonathanh@nvidia.com>

> (Pro tipp: The commit in next has a Link: footer. If you follow the
> link, you find the thread that was actually applied (i.e. v9) and where
> the fix is also contained.

Thanks for the tip!

Jon

-- 
nvpublic
