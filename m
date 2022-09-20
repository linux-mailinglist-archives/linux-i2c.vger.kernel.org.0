Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7F25BEA16
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 17:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbiITPYc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Sep 2022 11:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiITPYa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Sep 2022 11:24:30 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DEC265574;
        Tue, 20 Sep 2022 08:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wk7hcj/JDfaH1ZmFQLdY0BlpK5GusoAB2YBwAvyyzhjOWLYWdWxXUHi/QLFj/CyU1ies+rKi/5zavb4P7kBNiYCMvCdjcgZU8MHzdAh/MzFhQKuNuIVgRXW0NsoshTF7c4M6iYK/226r/GWEZCT4+BfgELvMasHuNk4ohRsceiPO+EmpbTWdrYPTEdOAfMD7ZwMNoHWVku5Vr2xHHnRgtXu5qyK862U6lQuecEG404q7Mvk6cMzQEKB8zX0mbzXgtocfUmAxNHLgqai45E/cTK6dMN2aCF9oPO4PrjuCA3LlzdyoXsDWua+Vb+ZMJJuE7yeWnOx8VexRkw0SgZekOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qp79CXTcO5jzEx6nwaf7NzPTMiz4yh8xhLo9IF2q/io=;
 b=G8v1eXbwceiZCighPy9ZtIPA9rPzIxx8rm3ZlmGKZFPizmtTkVstz6qj/+XKImsnYZfc7+KVV+k8c7u6BtPHpLQOi9iEsg3mJ/4O2rm9OcnIFtJnWTYFH+7ChhxMjJtQjZbz6Ooz8gh4ZbrQaswTkzLwbO7X1c3pSQhEw3xSzKEiOELu3nnahtw1Z0UiXtU7F7FAyH9yOP9i1/1wJ9Vqo7vlP3NyG5FvsXkz2ntqy4OHAH2hK/pvq688sKfvOvlRIcAZtMY1dMfNg4dR1ozdRwiqh75L/KTIwJl0j0usviRtqBzy8Ix7jTDemw7bFbFQF+R/AbaLWJbxNWukH83J8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qp79CXTcO5jzEx6nwaf7NzPTMiz4yh8xhLo9IF2q/io=;
 b=qvX3GBi+eE5MwfCprezdjbK1aK8ZjTyBiByQ9I2gLFHdw7TZAnqegU4rtDGdIfY0FbbuNmdVjo9WOHIO92LVhUkzRcSTZ/I5vcJ5QtljHho06cNlal1GmjbJwlNtl2Me/QP9z6m2K1ttoTqOaWf18Jm7nv0FhUKmVww3mNcO34gCqGuQJCBBJ2dhSRZlveocnWjP2OwRvVz/k0oq8PsKylgHYYKTZ3pefVNrTz+H9N2fZDi1bpE+XqxcmhGLnHyyjI1HFU2Ju6rcP6xY7KToyKe6hscsfLlvKf3U9ZK2pAMBeXWwb/MAs0eySzW96z+Njtub01I/5Xif8L5dPxOViQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AM7PR03MB6387.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 15:24:22 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 15:24:22 +0000
From:   Sean Anderson <sean.anderson@seco.com>
Subject: Re: [BUG] ls1046a: eDMA does not transfer data from I2C
To:     Robin Murphy <robin.murphy@arm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc:     Li Yang <leoyang.li@nxp.com>, Peng Ma <peng.ma@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, Robin Gong <yibin.gong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Joy Zou <joy.zou@nxp.com>, linux-media@vger.kernel.org
References: <38974aab-06d0-f5ff-d359-5eedd2f3bb3e@seco.com>
 <5ef51421-e6b0-edd5-6b6e-439b47b794a8@arm.com>
Message-ID: <9b20569d-7855-0031-3552-090ff7880cec@seco.com>
Date:   Tue, 20 Sep 2022 11:24:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <5ef51421-e6b0-edd5-6b6e-439b47b794a8@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:208:329::26) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AM7PR03MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: c6420254-cf0e-47f0-295d-08da9b1c31db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HzbYi7pHGfVfqtHMYyHlxz4IHWOrC66Hop92JBqj4cXjvVTuy3DiNhQIhLB/aCFZCTmtppWW6Na267gJPFy93Z0HjgAOAYWkr3Q3wiKpp67LnI1O3TspHnXPbmWFlhEpRstgJtzRcJG754Pc0Mnn/614JPH3Z6wZiLryj48oRv8p3GVXROTXj6nHEkvdaWo8VRYrU4HiCI9JC7eXwBW8H1yz3YoDds2sEWIZjK3azhwzCKnKB9zAjqrRiqAjVAncvwiqhhKuaHfHmwWvJY8Q7gakAuZWqIQ6ULgn47r/5ml89UtymPMDfgWroNgtCHm/4NkYmLhDMZ1Sud6WjkvOnyeS+DUPfGCXQ+tvCrfR+8ZEgoNcgjcQFqzUPUpbEbWmyMRX6rtyNDpGNCVZR7E50mhhevazDhAyZOfKEHAgwrsTX2RNKXdiyIQlU8Fx+wEiquYs8mCma1aUVtlr1N/9Jugkm+wepMOwX/c8IEnFQAIOJnnxiLwkdUXbxaeLABuezs77ynlR4JpRU3hzfaMHy430/UXcYB8umsTB5Si0mjqYyNI7YdqK2ylUBQ7udZOXSEOmMpcK/0x/P6B4SiQG5LlCxUKUhTGyuscjA06MVWUDIsrkPXMLKUlu/gbkXPd3HyHqVeH3hpO6Yb9WW1CesTxoTeIvAg1rIA+Kclsfr8FstBx1q2ULlObrgRC3KFixc+3RsmRMEpWWkHVooARcfH56mL0Hetvnhnv5e4FeCgk50jykd5Q0WEUiCznoXedDZmkaZl78Oev3T5jN6eZtPV9JoBn6T8so1joPmgVr3mpMVnheC/shcR0e5koiGLd9c4/tt58+P9vhlb40p4hzCHZbKHsrYhLrcs3eEV+k6Q6qyUb226gnslq6CBsY47af
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39840400004)(346002)(396003)(376002)(366004)(136003)(451199015)(44832011)(31686004)(36756003)(2906002)(6666004)(54906003)(316002)(8676002)(38350700002)(38100700002)(4326008)(66476007)(7416002)(5660300002)(66556008)(66946007)(31696002)(8936002)(86362001)(110136005)(186003)(478600001)(2616005)(26005)(6512007)(6506007)(41300700001)(83380400001)(52116002)(6486002)(966005)(53546011)(43740500002)(45980500001)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0JHd3NlZ2x1L0NsQ3lWUzFNRUJYaXYxUlQ3VXMyRHZSK0d1UjZyZDNSajVS?=
 =?utf-8?B?UFVjODFPSW4wTnZudUk5VS92bSttdkdQODFkN0lXSnJERWdqWXZJR0R5UTds?=
 =?utf-8?B?RzNzYzh5N0RabndseklzcWIxNmIyVFRlN1hRYUZnb3cvNFUyK1Ezby9JU2My?=
 =?utf-8?B?bTBEbzlKcmFzU2dDN0pUNmtvcFFTck5JanZTZkJmM1RXZnB0MU1zdjczNFpB?=
 =?utf-8?B?SXdMME5UNDNUNndPVVc5UTdDQUZUZ1lwZllqYzVQRFRHMXRFUGFtRkRLMDZh?=
 =?utf-8?B?bDNuQzZjNjNWZUhhRE50WTJKVWtGNEh4Z2ZHcmlYTTFDaERGcFEwVmtJOEQr?=
 =?utf-8?B?WWNsei8xeXpFL3oyZmN5eXNzQUtMeXhyZzcya0J5d293Tkt3S0FaN21lYmgw?=
 =?utf-8?B?NWJHbHM0TExLazhsb3puVEt2aDN4VWdYMzU3S3dHZ2hMNENPaG9xZzRIRUpY?=
 =?utf-8?B?TnozZXJYRkYxZUJvaHpqVmhyZU13am8wUjUvY2c5MjFiNHd4OTVwdEtVTWhv?=
 =?utf-8?B?RWREcVRCYzRjaDBPN2wySWxyN2tOTTZ6Um42UzdRNUsxMzIxbS83YVdJcmVK?=
 =?utf-8?B?cTJ3VzgvdytyREhuWGxTVGg1UnBpWG1scERvSzR3M21VWm5VZjNXei9ieXdn?=
 =?utf-8?B?bEJRM2txV3VaOFdHUnVBcnl2U0Jod2ZmdDM2YXdpN211NWlnb0c2aUYzUU5K?=
 =?utf-8?B?QUwrUG1jV25TQTVBN2poUDVDYXozamo3elNScUFLL3l1aG5EOURaNWcrVmJE?=
 =?utf-8?B?dUlKQmdrbENRNUJlN1FXem9YUVFjenVMak9aZVVPa3V6QnZReTRkYkFkTVV2?=
 =?utf-8?B?N3ZsYlZHeUJaamNmRlJtZDFESlRoOFp4bTJrbTkwZmErOXBrbGMyeEVCT2Y3?=
 =?utf-8?B?THpqQittbFZoQmJWWUh4UzJML0lBVWdnOHBwVTdKanIvUE16UXFndmhzdGhD?=
 =?utf-8?B?b3FTdHkyNDAzdVlRM08wUEIwZSt1MjMvd3I0dWJRWEI0UG50UHFFMys2d0w3?=
 =?utf-8?B?aW5zaFZhZHlCTTY4RVlTd2JBbldmbGFLLzRUUmUxbldRa1IxQW53SFhUVzNK?=
 =?utf-8?B?MktpeVNZSlk1OTQ3TXg1OThQRG5YVWZpUEtXa2hpYnM5NnEyTkdPM3R1Tklh?=
 =?utf-8?B?UkJpWHFsamliNklFZncycWNRK3lKTnZ2NEt5RlpPUll1QnlTTlYwZVVzV0hR?=
 =?utf-8?B?bVFheEZIWDB0Ynh5UHBuRmNBY3M5ZjdHVjZoZ1J2cXhneFoyaTZINzlaMUFE?=
 =?utf-8?B?cjRUVFo4ZDVXOXpUM01XbHRhSksvVlc2c0hQNWc2VVB4Y0Ruekwwekt3RjVn?=
 =?utf-8?B?c1NvOGdIU0UvcTRadkdMMjNmY28xaHI5bXdyQTl1MUtEbUNmcG4rZ1loOE1t?=
 =?utf-8?B?VXBJdTZjUVZ5bVgzbEd0Z0o3cXI0ZGZVNGNpUTJVbmZkVllhdlFMQzczRWJG?=
 =?utf-8?B?ZTBLajZmOFFUVllKaTBRZVVrRmNwQXFYTzVhb2JYMVcxS2ZNVlhZL1p3dGhx?=
 =?utf-8?B?WXhMVW16ZFN6Uk94RXRYdjczZzdqVDg4SG1sUUpqRVV3NERTOW9oNml0enAw?=
 =?utf-8?B?MWptY2tERlJYYkJXMXdiNXdqODgyVEVrQmh4anhmbnFBbU9idUszZDU2RFdr?=
 =?utf-8?B?WStDM2k2aGlSZlJuYysyTzU0aTlKRGltQjVRRGhIR3lEYkUrbHVhSjVmZ2xR?=
 =?utf-8?B?ZFB0QVQrVG9lVXFlTU1GNGs3Rm82U3VFR1VyTU5xUDg1OWMzeVl1K0ZyRHhx?=
 =?utf-8?B?ZTd2OG5sNGVVN3h0NGV0ajBjWVhBWlhSUDBhUnNEcUZrSDczeERCS29DTEEw?=
 =?utf-8?B?VFdYZGJSb1VIVHhiZDUzQmx1dlE0Q0d2K2lEeXJWdG9KKy9TTWtpZFJncWpr?=
 =?utf-8?B?RU5iY3Q3WThtditKVTdmNE9vc1hQWmdLUmNmWkNUbzdib2k4NitOQzNlSmJL?=
 =?utf-8?B?clpxQi91OFowMDExUCtKVUNaS1gzS2lsM0prRkFhMk84WHhyb0l1SGwwUmx2?=
 =?utf-8?B?ODZtMXExSmpqT3FtejFCNHNldGNZbzZqWk1hZldodHBva1VHSEFvaVJaRFdq?=
 =?utf-8?B?QUU1dHpxU3VRTENSS2M4R0tqdVJxUWhlbXQ2RFY1cUl1S3pmWUt4Zm9yL0VK?=
 =?utf-8?B?RmtlWWV2SmNhVlhaODdUblplQThNNW52dHhiWTc0ZVBmL0RYNjZGMmIvOUpO?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6420254-cf0e-47f0-295d-08da9b1c31db
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 15:24:22.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJH6ilmHfdqv9+tridiY1bM72uxXY/WzfDUkVkk4Tjy9Zx3Ywj51hrZk0KB4gigbfc9Wefrm4nyINL39kpPsaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6387
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/20/22 6:07 AM, Robin Murphy wrote:
> On 2022-09-19 23:24, Sean Anderson wrote:
>> Hi all,
>>
>> I discovered a bug in either imx_i2c or fsl-edma on the LS1046A where no
>> data is read in i2c_imx_dma_read except for the last two bytes (which
>> are not read using DMA). This is perhaps best illustrated with the
>> following example:
>>
>> # hexdump -C /sys/bus/nvmem/devices/0-00540/nvmem
>> [  308.914884] i2c i2c-0: ffff000809380000 0x0000000889380000 0x00000000f5401000 ffff000075401000
>> [  308.923529] src= 2180004 dst=f5401000 attr=   0 soff=   0 nbytes=1 slast=       0
>> [  308.923529] citer=  7e biter=  7e doff=   1 dlast_sga=       0
>> [  308.923529] major_int=1 disable_req=1 enable_sg=0
>> [  308.942113] fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd 00000000d9dd26c5[4]: submitted
>> [  308.974049] fsl-edma 2c00000.edma: txd 00000000d9dd26c5[4]: marked complete
>> [  308.981339] i2c i2c-0: ffff000809380000 = [2e 2e 2f 2e 2e 2f 2e 2e 2f 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30 30 30 30 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34 30 00 00]
>> [  309.002226] i2c i2c-0: ffff000075401000 = [2e 2e 2f 2e 2e 2f 2e 2e 2f 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30 30 30 30 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34 30 00 00]
>> [  309.024649] i2c i2c-0: ffff000809380080 0x0000000889380080 0x00000000f5401800 ffff000075401800
>> [  309.033270] src= 2180004 dst=f5401800 attr=   0 soff=   0 nbytes=1 slast=       0
>> [  309.033270] citer=  7e biter=  7e doff=   1 dlast_sga=       0
>> [  309.033270] major_int=1 disable_req=1 enable_sg=0
>> [  309.051633] fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd 00000000d9dd26c5[5]: submitted
>> [  309.083526] fsl-edma 2c00000.edma: txd 00000000d9dd26c5[5]: marked complete
>> [  309.090807] i2c i2c-0: ffff000809380080 = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
>> [  309.111694] i2c i2c-0: ffff000075401800 = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
>> 00000000  2e 2e 2f 2e 2e 2f 2e 2e  2f 64 65 76 69 63 65 73  |../../../devices|
>> 00000010  2f 70 6c 61 74 66 6f 72  6d 2f 73 6f 63 2f 32 31  |/platform/soc/21|
>> 00000020  38 30 30 30 30 2e 69 32  63 2f 69 32 63 2d 30 2f  |80000.i2c/i2c-0/|
>> 00000030  30 2d 30 30 35 34 2f 30  2d 30 30 35 34 30 00 00  |0-0054/0-00540..|
>> 00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
>> *
>> 00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff ff  |................|
>> 00000080  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
>> *
>> 000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff 5b  |...............[|
>> 00000100
>>
>> (patch with my debug prints appended below)
>>
>> Despite the DMA completing successfully, no data was copied into the
>> buffer, leaving the original (now junk) contents. I probed the I2C bus
>> with an oscilloscope, and I verified that the transfer did indeed occur.
>> The timing between submission and completion seems reasonable for the
>> bus speed (50 kHz for whatever reason).
>>
>> I had a look over the I2C driver, and nothing looked obviously
>> incorrect. If anyone has ideas on what to try, I'm more than willing.
> 
> Is the DMA controller cache-coherent? I see the mainline LS1046A DT doesn't have a "dma-coherent" property for it, but the behaviour is entirely consistent with that being wrong - dma_map_single() cleans the cache, coherent DMA write hits the still-present cache lines, dma_unmap_single() invalidates the cache, and boom, the data is gone and you read back the previous content of the buffer that was cleaned out to DRAM beforehand.

I've tried both with and without [1] applied. I also tried removing the
call to dma_unmap_single, but to no effect.

--Sean

[1] https://lore.kernel.org/linux-arm-kernel/20220915233432.31660-6-leoyang.li@nxp.com/

>> --Sean
>>
>> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
>> index 15896e2413c4..1d9d4a55d2af 100644
>> --- a/drivers/dma/fsl-edma-common.c
>> +++ b/drivers/dma/fsl-edma-common.c
>> @@ -391,6 +391,12 @@ void fsl_edma_fill_tcd(struct fsl_edma_hw_tcd *tcd, u32 src, u32 dst,
>>   {
>>          u16 csr = 0;
>>   +       pr_info("src=%8x dst=%8x attr=%4x soff=%4x nbytes=%u slast=%8x\n"
>> +               "citer=%4x biter=%4x doff=%4x dlast_sga=%8x\n"
>> +               "major_int=%d disable_req=%d enable_sg=%d\n",
>> +               src, dst, attr, soff, nbytes, slast, citer, biter, doff,
>> +               dlast_sga, major_int, disable_req, enable_sg);
>> +
>>          /*
>>           * eDMA hardware SGs require the TCDs to be stored in little
>>           * endian format irrespective of the register endian model.
>> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
>> index 3576b63a6c03..0217f0cb1331 100644
>> --- a/drivers/i2c/busses/i2c-imx.c
>> +++ b/drivers/i2c/busses/i2c-imx.c
>> @@ -402,6 +402,9 @@ static int i2c_imx_dma_xfer(struct imx_i2c_struct *i2c_imx,
>>                  dev_err(dev, "DMA mapping failed\n");
>>                  goto err_map;
>>          }
>> +       phys_addr_t bufp = virt_to_phys(msgs->buf);
>> +       dev_info(dev, "%px %pap %pad %px\n", msgs->buf, &bufp,
>> +                &dma->dma_buf, phys_to_virt(dma->dma_buf));
>>            txdesc = dmaengine_prep_slave_single(dma->chan_using, dma->dma_buf,
>>                                          dma->dma_len, dma->dma_transfer_dir,
>> @@ -965,6 +968,9 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
>>                  }
>>                  schedule();
>>          }
>> +       dev_info(dev, "%px = [%*ph]\n", msgs->buf, msgs->len, msgs->buf);
>> +       dev_info(dev, "%px = [%*ph]\n", phys_to_virt(dma->dma_buf), msgs->len,
>> +                phys_to_virt(dma->dma_buf));
>>            temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>>          temp &= ~I2CR_DMAEN;
