Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8483D5BEB0B
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 18:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbiITQWF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Sep 2022 12:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbiITQVr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Sep 2022 12:21:47 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054C62B19D;
        Tue, 20 Sep 2022 09:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGzHvwlDK1I7THOfC23lb4B61g0GKDDmlPhPyzm19UiSBlFORHLjdSbncloPEJKjX+/xPfxI2qWSn4kFaHwhee9Ot8UbBUEqvBqUo3s5eqFPIE/inUXyLG/CaLY4mcXWr7FcvBc2sYX0Kw6cxfkvYJnUyx4fvbOz2ZRJ5MlTxw7O0PyKDe09/y9zq8MrKv3z9Qwjl6w0Nfc2Q0VDQv5B48kixnRUeNuzubPIz5t45n11n6xcTROmdK4kmHZ8NgJ/rNnlcume9oD1DdRHBvFNwE7rvzZq6zyezi6vvjYMJz0K8vqmdtBTks29fbqZAWq19Cul67rnnkZHdUWriuwk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VOXmbFv4dI9xd/2yl1mZJhNCxflNNPe/kgCwLsgCDQ=;
 b=L2OJE5MBHB3dqrxbLi3sfgIfj0HmsCuMx3BTp2wYDzOscNhjEdWvOE2v2P8uKdyDE9CMxMZQH3WIks5CQUwo2c5flBAwp2ChB8c86g86vM518Lfaq5z8Tjf9WSkC2ha4k4k1Mz6AtTTMczEyzGxnNt0QjVG/Lu8vzs2HVqBiSsf8TqDZ7IuO0FG5fE3ldF4dSxBkQ8j5O1XeeQtb9qoUlz7ny+c0+Q+TFaFWYr/qw8XakoW6Kcw9SAV+WAOkp+5FAdSFYIGTwMtD43G/kYQvU/cYZOwgO++Qqg/UAxMoPqLAP7wILPq6x1XNnDTJiotkdGDh3p9ySa+v5i+VB5QOgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VOXmbFv4dI9xd/2yl1mZJhNCxflNNPe/kgCwLsgCDQ=;
 b=vKG5q3zNxFXPT6U8UU6vp5ssIo+qotNLyWp4A5NVKqozZlnr3hVvUxhe8Pw6JGn29KeqGBBJw/amuAOGuxSG/Io/qrxE7e/wCIq1NzXx6aR1tUdmlnhJCorQQebUF7oBwTmEuy7odVGCxxq/dyWpAaFqZ+398ursnWEHGw5C2b21pxt/TvrQeKzXkjeaopvAiujQmIXgbhoCbE6Kd7eBjV8jcYPfhpFzM05lQhoUZ6uPk4Jpp7scPV7t1utSnjnJmdjd/KE7VeQOMWr/Cly9GkvNaHjX8JFRWEujUCWRl7BG4p2v1b2A1n/vgnI201PYsNu3lG4btZWq2/N4ZLlBMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB6904.eurprd03.prod.outlook.com (2603:10a6:20b:29c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 16:21:23 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 16:21:23 +0000
From:   Sean Anderson <sean.anderson@seco.com>
Subject: Re: [BUG] ls1046a: eDMA does not transfer data from I2C
To:     Robin Murphy <robin.murphy@arm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        Li Yang <leoyang.li@nxp.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, Shawn Guo <shawnguo@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Joy Zou <joy.zou@nxp.com>, linux-media@vger.kernel.org
References: <38974aab-06d0-f5ff-d359-5eedd2f3bb3e@seco.com>
 <5ef51421-e6b0-edd5-6b6e-439b47b794a8@arm.com>
 <9b20569d-7855-0031-3552-090ff7880cec@seco.com>
 <afc8b784-25bc-5c52-7377-ea901a908ca8@seco.com>
Message-ID: <50a63241-1ee3-e0c5-1faa-2f2734774874@seco.com>
Date:   Tue, 20 Sep 2022 12:21:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <afc8b784-25bc-5c52-7377-ea901a908ca8@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::8) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AS8PR03MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: af152b2c-e67c-482a-718c-08da9b2428aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fcA1PXeKlQQdflT7CvM61MUGMNP7NCIHxOXo3Cp/dDAzA0pdzECwdVg2t8Xp1QnpoGLWZytxz8pT2WHaMPq0WIcoJSwuUe3WndBIE3GjlWP+naHKPuAZIKWIxGfLQ6tZLAu7FdNq/VGsOlB9Bbqt4NOC6fVWWFu6foVoZXWpFnwHEtSqe1Y8UrM2z2QCNILPEbppd3k/09lPEHw2esu88z1yA8cxLUWRRWk2+AVCYtzgjA5PWkzVQrds+bDKaru4UdX71ptXCKj9F8FICb5+fguV+Yij0dRMIgmVOgxGPp7R/bxtKuFoW9yAoC5fTkRY2Mmes8kdUeIyxh9n13WODvs2VFnvdv/d5oU/kZWwn6MiGIJdfICmEwtro27wGIfj73W0YFFHoWwRbZ68WGp9iCBV9Czb0x6H5CLzqZB8a6K34Xb1DSW6UZ8Z/mJkOCduWajOX7ieFYQS2Itn0xtIAwFY1N0WQjZEQS/hOO27JHjk5T2aqkEzxn0BYKAmjuXvemzZoHuJ15BCXeE9VCG+VWvsiX2oUYo9j/nE7t6gTDuBzF5r3r2HpiXpx5oW/lNjRy0BzalODljqQYC/Jl0UbWvCtNYZFTSRhXu2e3V0rHhQVzsoh2HfOZCFOxucN5EvCC6ccfYu4WPzZ62MTJSlsKAOl4yR8lW3Pjpx3iPYaaJ2Wwjd6p2GKTU1WVzRXA4bHXU0AX2guqU1rrqftIboKzKSvWEfRaeSFBhy+W42EWeMrgV/QFHQt6IjJSayW28Qn9TvsxwHClYKMxZOAX5aBG1vctCuhOK0Fj6RA+IZLRXMqNVIrY+ch/asrk9GkMp6xncavWz0Vpa1i+bVjg3WidTDsR0BfEL+cO2Bnk+ZQBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(136003)(396003)(39850400004)(451199015)(2616005)(66476007)(66556008)(26005)(66946007)(8676002)(4326008)(6512007)(110136005)(52116002)(6506007)(36756003)(31696002)(53546011)(5660300002)(6666004)(8936002)(41300700001)(83380400001)(38100700002)(6486002)(38350700002)(478600001)(44832011)(31686004)(186003)(86362001)(316002)(54906003)(2906002)(7416002)(43740500002)(45980500001)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmZNU0QvbXAxV3JYYTZDdXpwdjdGTWVnRTVlZnJPcEV1ejgzRHl4MWczRTMx?=
 =?utf-8?B?WElMYVlSNUkvUG44NTQvb015bFVaMVZmZWJXRHNUOVZaSnh0dSttNThYcjh2?=
 =?utf-8?B?c1NDVU1UbmhkbzUxQjVQdzRiV2FSZnVYZGYweDE5ZWhuRWFEMGJCcnlkMVpt?=
 =?utf-8?B?Wm1CTlZ1aGFEUDZ0NUVyWU55K0xHMS8rK1ZyNEdNblF0QXZPZnVLM2FzUTQr?=
 =?utf-8?B?M1BXa0IzcERIUnoyY3JqOVpFbVFpWWdJYmxIWWtMQkNxUC9mRUNoZXVIeWE2?=
 =?utf-8?B?N0RXUEdoZ2F2ZHdTSXdWMVN0Y053d2hKM0E4YnRRaHhzOG95TXEwVUl4QTVS?=
 =?utf-8?B?OHhWUm55Mm5sUExYZXFkcUg4eERneTcxV1BKNFpnUHoya1BUdERzUlVFL1VU?=
 =?utf-8?B?WFZ5ZG1yWTJUcjJ0MldQMDhFVnk2VVRIeEMzWVhMN0Fub0FFOFZwQmszem40?=
 =?utf-8?B?MnQvNXFJOU1xUVA1UjluZGtBNGYwaUlraCszTzkvdUpFUnRpVnhIVWhUZnFo?=
 =?utf-8?B?V3hhbEw1ZWJVbDZHWERTVWY2NHYwTzk4dmVXZGNBSHZyVUw3N0M0M0REbTQ4?=
 =?utf-8?B?VGlnTWRTYVRoVmJtc1ZBSGFWVGR6WmVVSWIvdkg1RGU0djdzVDB5RGhOMEh6?=
 =?utf-8?B?QlV1b0hIMjBMVlREUlhPckd6SlBlTzBXS3JvSm1KZC8zZkt2VWxvUFJPNWNZ?=
 =?utf-8?B?M1ZNbjZTMGpCLzc4U0M5c2RGdGU3S2dnckNFSnF5dlNWRENWSDcxRmk0MUZM?=
 =?utf-8?B?d2dpeDhwMWlHVlpheWpqS0tQcmVkMUo3UGk5QlRXWGNOVWp4a2JDbklIaHBu?=
 =?utf-8?B?Mi8vOXROdGEzVDV0UEVNRVdESitOZThuRlF2T3pvV0o3WEUwd1lTMU5QU3hL?=
 =?utf-8?B?bitHVVp5R0pCWHU5Qllxa2NWa25DUThJNHpkaGxEYU5xcUJNVUFCMDZNWFNi?=
 =?utf-8?B?NkRkUVpLZWQrTFBSMkpoODFXUm1TcExBYTdpT1lrWjkwdXNuVnpXdDlIczc5?=
 =?utf-8?B?NVIxSFU5c0Naa1hvT0Y5eUNySldIT09JVllBem8vNjdTYnZVRTk4MGVGMkxC?=
 =?utf-8?B?ajl5SVlURS8zUVk1YlJJVy9VOXZmNTQrSkFhaGhIQ01heEw5MFFxRzU4akE0?=
 =?utf-8?B?cGpEcE9GaG5VeXlMbzhwOFdUMkxHK0JTQUFodjB0OFIxMDBGQkJWS3paaWd5?=
 =?utf-8?B?U1U5bytVZ0RQN3ZWV2hRVGZjTG5BR3ZCUVM0TmhtSURGZy9UblZ3OUx1c1pZ?=
 =?utf-8?B?K1o1SW8xZzgrVzZLbWFJTjhjUm5NaEw0clVxcWsvWE11UmZQMzNoRGt0bzVN?=
 =?utf-8?B?VkpzQmNwdVg2b1Y2dXgzOUpTUFNDT3FkOCtrK1NnTUMxTnBwREtWNWNiaGZz?=
 =?utf-8?B?MGtVUXEvUGl6cnppYWlFWGFjZEd4VmVOaFpGbWlUVXJGVENYQVpRZlVQTGZy?=
 =?utf-8?B?OW83WU5LMDgyRElablY2ZmtUSDgwYlZ1R1NuNzZDWHV2MzZiUUdOcEtVL3VB?=
 =?utf-8?B?NlRxUWZpUTdBdGRuTzcxNGUxcHBEUmVMc1B2eDF3RWFzL1ZCMFZuZjBpY0lx?=
 =?utf-8?B?dTl2MzBET1BqYmlqYUdiSm1YWWY4K1JIQWFodXN6a2VIeWJDNnJwZjFJdzdk?=
 =?utf-8?B?UWhsc3M2Yy8yNXc0d29ualh4SEgva0hBZE1lRk5XSllxbWZhQi91cVliYkZS?=
 =?utf-8?B?Z3l1VU84QW9CdlVPQzNjL1AyK0M1aXpVMmVWRUkrQVBTeHNuVy9LYmE0TElj?=
 =?utf-8?B?dzU0L21WWWdCeklBOWlScDJKaHhPR0xUQWF3RTk0WkRiMXFYSDlLS3VWUmt5?=
 =?utf-8?B?NHdXeWpjVURSSmlqUEdEYUVkc29QOXBGd09QTWZPbkNGZDBMZXFYVGFQbmNQ?=
 =?utf-8?B?V3RtSmhEdEpXVXZKT3hudEhBcG5VS3VzaFVtK2ZqaDBTS3dSQWtkajhwU2pX?=
 =?utf-8?B?TmtXRTBERUkrYkVzdXpZOVVZNVlQQVpDNll4Sms1eVRwSHhSRjN2emZWYUR1?=
 =?utf-8?B?MzZpK1dNamh0dUJ3Tk9ySVBYWkgzV0Q4S0k2RGNyNnhCMzVtd2VIRFJkcFZG?=
 =?utf-8?B?MGtmNWo2NUx5QVN3a05jMTZaZGhVSEtZbkNYc0gxcWxKRTFrYldCUVQ5My91?=
 =?utf-8?B?ZlY0RTlUcXgzeUN4WWtSVnRHaWN5YkhTbExYYkF3RTFESk5ZK0RLdERJVzgz?=
 =?utf-8?B?RWc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af152b2c-e67c-482a-718c-08da9b2428aa
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 16:21:23.1451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YA1JJhxCoawxF2W0i9MQurPHIypBPcF3rUkw/x/KaJs3pIKvAe8oMyxRRglwzMNmaiPXvXLNYryoUvsr6IXl6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6904
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/20/22 11:44 AM, Sean Anderson wrote:
> 
> 
> On 9/20/22 11:24 AM, Sean Anderson wrote:
>> 
>> 
>> On 9/20/22 6:07 AM, Robin Murphy wrote:
>>> On 2022-09-19 23:24, Sean Anderson wrote:
>>>> Hi all,
>>>>
>>>> I discovered a bug in either imx_i2c or fsl-edma on the LS1046A where no
>>>> data is read in i2c_imx_dma_read except for the last two bytes (which
>>>> are not read using DMA). This is perhaps best illustrated with the
>>>> following example:
>>>>
>>>> # hexdump -C /sys/bus/nvmem/devices/0-00540/nvmem
>>>> [  308.914884] i2c i2c-0: ffff000809380000 0x0000000889380000 0x00000000f5401000 ffff000075401000
>>>> [  308.923529] src= 2180004 dst=f5401000 attr=   0 soff=   0 nbytes=1 slast=       0
>>>> [  308.923529] citer=  7e biter=  7e doff=   1 dlast_sga=       0
>>>> [  308.923529] major_int=1 disable_req=1 enable_sg=0
>>>> [  308.942113] fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd 00000000d9dd26c5[4]: submitted
>>>> [  308.974049] fsl-edma 2c00000.edma: txd 00000000d9dd26c5[4]: marked complete
>>>> [  308.981339] i2c i2c-0: ffff000809380000 = [2e 2e 2f 2e 2e 2f 2e 2e 2f 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30 30 30 30 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34 30 00 00]
>>>> [  309.002226] i2c i2c-0: ffff000075401000 = [2e 2e 2f 2e 2e 2f 2e 2e 2f 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30 30 30 30 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34 30 00 00]
>>>> [  309.024649] i2c i2c-0: ffff000809380080 0x0000000889380080 0x00000000f5401800 ffff000075401800
>>>> [  309.033270] src= 2180004 dst=f5401800 attr=   0 soff=   0 nbytes=1 slast=       0
>>>> [  309.033270] citer=  7e biter=  7e doff=   1 dlast_sga=       0
>>>> [  309.033270] major_int=1 disable_req=1 enable_sg=0
>>>> [  309.051633] fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd 00000000d9dd26c5[5]: submitted
>>>> [  309.083526] fsl-edma 2c00000.edma: txd 00000000d9dd26c5[5]: marked complete
>>>> [  309.090807] i2c i2c-0: ffff000809380080 = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
>>>> [  309.111694] i2c i2c-0: ffff000075401800 = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
>>>> 00000000  2e 2e 2f 2e 2e 2f 2e 2e  2f 64 65 76 69 63 65 73  |../../../devices|
>>>> 00000010  2f 70 6c 61 74 66 6f 72  6d 2f 73 6f 63 2f 32 31  |/platform/soc/21|
>>>> 00000020  38 30 30 30 30 2e 69 32  63 2f 69 32 63 2d 30 2f  |80000.i2c/i2c-0/|
>>>> 00000030  30 2d 30 30 35 34 2f 30  2d 30 30 35 34 30 00 00  |0-0054/0-00540..|
>>>> 00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
>>>> *
>>>> 00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff ff  |................|
>>>> 00000080  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
>>>> *
>>>> 000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff 5b  |...............[|
>>>> 00000100
>>>>
>>>> (patch with my debug prints appended below)
>>>>
>>>> Despite the DMA completing successfully, no data was copied into the
>>>> buffer, leaving the original (now junk) contents. I probed the I2C bus
>>>> with an oscilloscope, and I verified that the transfer did indeed occur.
>>>> The timing between submission and completion seems reasonable for the
>>>> bus speed (50 kHz for whatever reason).
>>>>
>>>> I had a look over the I2C driver, and nothing looked obviously
>>>> incorrect. If anyone has ideas on what to try, I'm more than willing.
>>> 
>>> Is the DMA controller cache-coherent? I see the mainline LS1046A DT doesn't have a "dma-coherent" property for it, but the behaviour is entirely consistent with that being wrong - dma_map_single() cleans the cache, coherent DMA write hits the still-present cache lines, dma_unmap_single() invalidates the cache, and boom, the data is gone and you read back the previous content of the buffer that was cleaned out to DRAM beforehand.
>> 
>> I've tried both with and without [1] applied. I also tried removing the
>> call to dma_unmap_single, but to no effect.
> 
> Actually, I wasn't updating my device tree like I thought...
> 
> Turns out I2C works only *without* this patch.
> 
> So maybe the eDMA is not coherent?

It seems like this might be the case. From the reference manual:

> All transactions from eDMA are tagged as snoop configuration if the
> SCFG_SNPCNFGCR[eDMASNP] bit is set. Refer Snoop Configuration Register
> (SCFG_SNPCNFGCR) for details.

But there is no such bit in this register on the LS1046A. On the
LS1043A, this bit does exist, but on the LS1046A it is reserved. I read
the register, and found the bit was 0. Perhaps eDMA was intended to be
coherent, but there was a hardware bug?

If this is the case, then I think dma-coherent should be left out of the
top-level /soc node. Instead, the qdma, sata, usb, and emmc nodes should
have dma-coherent added.

Li/Laurentiu, what are your thoughts?

--Sean
