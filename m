Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1618D5BD796
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 00:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbiISWpZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 18:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiISWpX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 18:45:23 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80077.outbound.protection.outlook.com [40.107.8.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E772E1008;
        Mon, 19 Sep 2022 15:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjHSH9RAuulXGl90ZmiEgInmDsFjIpaWeaWWX4dKS4dnhXOlQU6QrNWq1amGBdVLdxjtPj9os1KGiBbaL2APg/LEVcwBFcvMhshmckxPLYrmR36w2E3imRHV6omISqMOW5c7ngi6C3f8LZHF2g6laK4VXXnQiCTnz9vU2327GmudIG8BDLMPIa3gwI5Iv3XHGX2SSrIPB1P/eHmAWQuFAFoqv6ix9It8YsrQt15Kof+EsJq3i6drdjVqosSm9aAD79WN3Vi7kY53R9JNZ/bodwUuQYaPnC6COpD5lYIab6pijpYAI1I3I+w5sJCmv3U3Vn+A0Rt0T6AWSGNdPN69Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IkBvMfMgiVT6zXCE9Hq9Xw/HGe+KELbF/kV8PIKnR8=;
 b=IpD6L4oUMkDJAN4XDy/1ruJe1cJnuLFktLaoWM94BWRlMxDj8z+dCSOnX2KF1TK5ddnWhIZY0VPp6LlwNhE9cOnp1sMKsKpOlWpS+fG4pmnipH/Fy0o95kJD/Jkn90mHQ4vNFauaVyRcnXV1jzsCXpt6+as4xSmHd3VB9e/XJo4pFop4rJ/uzZXfuRyTR2kU1Uw82d3G+IaUFl32P4HiPz8lneCkgE68dUI10uBgFi9YFKCY0f9Tdi5KGpCx1mmyBX1R5gduIAlnArvcNmw99qewil1mx30p8Ewo1KDgfyQXDEawrTuOTTQKtqsYKnXMSYVQ9QqiG/rW/2FtMTHBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IkBvMfMgiVT6zXCE9Hq9Xw/HGe+KELbF/kV8PIKnR8=;
 b=l9EOH/Js2+qD5hzX881EswGRxjI4KzAtMjYCIatLqoW9vmbWAI8C0NnxJgjSo8PuNUlae0iCW0yvuWTd9/tI7T9ovIQmZq7xs0rdLvS1pgzZRFsM0ziPWC0Gy/WVO3R8qqkKLacEP8VWxLyJDAN08OTfR4aSZZRn5MOvQTlS746QT5rWqVehGVIOGMEsV+P5Geg2LOEuvGEsaARzlavcVaXvOmh3PyHbRO3OO3CRplknWc0TFnAF/TOUOTUmy8uYd3h6wghWQi9Y+iPxbOUdvdd/Xw6Oo6xcJaA4beBl9R6Jb4nQBQlW3CUVkGb9ilKEh0hMM/vj5/rcF9SQQFuPMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DBBPR03MB7082.eurprd03.prod.outlook.com (2603:10a6:10:1f5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 22:45:18 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 22:45:18 +0000
From:   Sean Anderson <sean.anderson@seco.com>
Subject: Re: [BUG] ls1046a: eDMA does not transfer data from I2C
To:     Leo Li <leoyang.li@nxp.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Vinod Koul <vkoul@kernel.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        Joy Zou <joy.zou@nxp.com>, Shawn Guo <shawnguo@kernel.org>
References: <38974aab-06d0-f5ff-d359-5eedd2f3bb3e@seco.com>
 <AM0PR04MB62895815596165791DD59DD38F4D9@AM0PR04MB6289.eurprd04.prod.outlook.com>
Message-ID: <9fc5afd3-7595-fc56-9b7e-209b0b08036a@seco.com>
Date:   Mon, 19 Sep 2022 18:45:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <AM0PR04MB62895815596165791DD59DD38F4D9@AM0PR04MB6289.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR22CA0026.namprd22.prod.outlook.com
 (2603:10b6:208:238::31) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DBBPR03MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: c059e07c-2571-45e8-e5ff-08da9a90a047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mnOsw7nMc8EjP9tIuOQTsUzyUqht/fnvfxGzSataKPdbvhMitLc8rUjT1bPb7G9+9gJbCXhm7kVQnCdze/9rg4bOTdFG4U8n2m6EewkrPBJWMO93fY5YlA1rhfHBuhPzD1OaDsUlglNGI0NQB9FQ2NThvVhJ3wsUKRU8yOBsQC9rU4yxc6z2N7u0GxSL9qvSIOipLrK7BISJZE6u9HCYRDjJsHpDKTH81LyhNMsJaZcFknjF4An206cP2cDQ4aHZ6qTHy2PAxxYDuTz0v/C97NlNsZZk+aWCJmzYnlZ+PuSfrOF42BbfQuZbW2O7dAC7rwrBVXCvDuHySTlIKSsFxUG1JaqhZB9YU24xXEzHvpxO4QbTi5yHVihWIFgx2JzM3NUCdHbFxCDUW+Y86ZFV65PgjFlRy+g0MTkOIErpxUdBUErI8bY5wtOpUR7EIurnqI8CP/1J2JucBsb+xPq0Twu3FrSldw1aFT75zqzpKojYGE/KUvSnwnBKFKGL5rwg5b8xdo1I+Uo7TpMHSmEHINytBNJHz5kBChVqfZ2sHch3HIZBp4FMxHDlb28G1IB4C6oUcg0rthq2JV5O39i5zm72vCHt5gN5uFcBbWG/dDVP4yXn5YxtjS4WtV3py4rqc4+AjXfw1asdBG65CHjQj7dl59RZ8U0eS4vWN5ffLpiRvaFfpZCuFYbaIVyUWw95omOtXWF7iiIZgABO1BY/750WzbJiAVOk6hkzvcsxDbijJHFj5g65SbjB4uBBFRS2r5Tq1zVHetpBYPKQYb4dxFVDZ2X95LOfH/ijDRLlIfdjQkyh6khYymS32dTj1R4SRCwONRi3c3EAcOqWgYl5uw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(396003)(376002)(346002)(39850400004)(451199015)(66476007)(5660300002)(66946007)(66556008)(8676002)(4326008)(7416002)(54906003)(31696002)(110136005)(86362001)(316002)(8936002)(66574015)(38100700002)(38350700002)(83380400001)(53546011)(6666004)(52116002)(41300700001)(6486002)(6506007)(478600001)(2616005)(186003)(26005)(6512007)(31686004)(44832011)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2E0c2pyR3hYb25JbXJIbVlVSXZJT2pjcnJJbWl2bVQ2UkRsMDlGeXdFdTlI?=
 =?utf-8?B?dktDQ1FEWmR2L0xRYjJBc2grc2d3R2hCNkZDTTZUNndUT0hyaitpUWFaL25n?=
 =?utf-8?B?TmRuczZCb1l3TDZncWRaMHJQWTdXOU9KUk5sVnFIaGd2WUhIeEdvdnM0T09U?=
 =?utf-8?B?djBmdUFJWFFtMkQ4T0hmRloxQVVMQnpUajlIa1Q5Ykx1MVBPalZ4VWp0dDNY?=
 =?utf-8?B?ODMxYysyVUQ4dkpXbHNOcGNsVFhiMWN6b1hqVnNUeGc1K0N3QVdVRStTSnVM?=
 =?utf-8?B?bGJLVVRYWXJSa25SajZPTndDYk5PSTFFMzhmRTNKeFk5cCtDYlYyWXQwQWla?=
 =?utf-8?B?RUNpeW9PbHJRbEZua0R2ZERuWWJwVGxwV1BlOFVleGRmeDJQa3dFVit6K3JG?=
 =?utf-8?B?czd5UkJhb1I0QVVXQWxlT01tVzNZcjhIZGNpb1kyY3VmcEhYdWhSeVBObWJL?=
 =?utf-8?B?MW1jVEJjaWdZVlNPUnhDUStHR2NvM3BnRmhUdjdDWEpyR2paeHA1ZTI4MkFz?=
 =?utf-8?B?c0pndDcrYnhKRm4xS3VPZ3dON3BFQ3RDcnJWSXZ6R1RISXhzem03K2RWUlky?=
 =?utf-8?B?Y2xVM1ZJR0hFQXg4RGVQQXFYTWJuSnE5NHgxYUFJVlhRZXZnOWZmQ1lnUmZx?=
 =?utf-8?B?eFhCNS9Zd3RMVENnM3k5dVM4dERvVXg5Qkcrek9GT1AxQVNhdXdobnpmK1pk?=
 =?utf-8?B?Q0xnWi9zbEpYRk8yb1BISEkwK250WExyZmx4ZmFVbEVyS1QvMGFVTnVvc1ZD?=
 =?utf-8?B?Tm81c0c3VFV0bkVUMTVoVjA5YjY5WEZXSjBTZVZ4N3dHd2FpM28zUUJNbHNF?=
 =?utf-8?B?enR3ZmdjWERDNTVINnJDUm1qd2t4di9CWitaSHNsbDhDdmt2TjBCVzJ4MzNB?=
 =?utf-8?B?WlRnL3dCWkpYc0pXdTVRL0doWFlteEdYalhreHpEVVhsL0g1NXg3QkFRZ21y?=
 =?utf-8?B?a1gxSU40UzYvcUR0UG5NTUQ4OXcvU0JFOWUwa3p1QzQ2M0p6YUxwdHdqcTJ4?=
 =?utf-8?B?ejM0eE1mM010RG5Hc0RSZGtUeFdVc2toL01WUldHTVNtSm5neGIwNmFTSUVk?=
 =?utf-8?B?RUdpTHBxeGFCYkNyVDkwUVZSL1BDRytrRzRHdU02dUQ5c2ZGUXF2NFFsR0g4?=
 =?utf-8?B?bDk0bmhrQjdvVC9sUHJPUE8vRDhlUUs2YnJwU2VFdnR5UVRka3BqL0VlWVZr?=
 =?utf-8?B?dTdiUUlYQkZvSHhCc0xyQ0RIR1g0eGRCdmRtd3VWNEtHOTRzRGNXdzZwVnlo?=
 =?utf-8?B?S1IzZ0ExOVpjVDBuZWMxS0lmbkZHZmhhdTFhbkxKM0dQa1ZXRlV5VFhVa3Mz?=
 =?utf-8?B?a2NENFhyQmhNOHR0UFlwa2R4MTZ0cnNhN3VBQmg3TDVqN3ZENzkwaDgxTmJK?=
 =?utf-8?B?Wi9iUml4cE1qcEkxVnZNamJFMlJPUTN0ckwrRG8vcG5DWVVDMFN2dGlPVmhl?=
 =?utf-8?B?SlE0Tnl6NTYzYVpmelp6RHN3S1hZeHkyVHRQVmJNc3hLc1NGMjVQRGg0Zm9y?=
 =?utf-8?B?em4rVlF1ZWRiU01EaDBrTTduMDhWblFHWkpRQXRydWYreWtlckI2RGdHcXpp?=
 =?utf-8?B?ZXBqVWowRHhwV05mT05DZ2krU1U5cG02cUhGM0V0RWYxdDBvSllkQzg5TDBG?=
 =?utf-8?B?MThMTHcyL3VYOXp6TEU4TURRK1F6MVVNZ0RZbUFWMzlkL1FldWowUjZ0SnVv?=
 =?utf-8?B?T3RnaHNDL2g0UlY4SjMvS2FML3hVSkRhMjNTZ0dUdG1rS3l1VXdMK2U5OXNI?=
 =?utf-8?B?QmdLWG1EY0xDWEMzWndrcWlSWmlHcEVXQXlGOU45c0Z3VHFlWlYrV1RrelJj?=
 =?utf-8?B?ZE9KMkFKMjFabnU4YWhaRnZibU5tZVBvR0ZieDZlY1BFUnkxWDRBa0hvdzdP?=
 =?utf-8?B?ZDU2N2NIL1R2M1Zyb1p6RTBHOUpsTHpxc010RlVPeTVlUW05Q2NCNjQ0Vlh2?=
 =?utf-8?B?MjNjU3B4cTRRbWtDdG9BTVROWEsvNzVqWnNxTGpSdW05N2hxYWFKa1EzemVV?=
 =?utf-8?B?OS9lS1pwcVM1ZTJmUzlQczkxQ1VDSTBQcENyc3hVV0VsbURJS013K3dXTGFF?=
 =?utf-8?B?ZEVuZTVjZG9FQ1g1bTVHbDNLcmQ1SXl6VHlmWnJZdFliajBFQXRBYnYxaDBX?=
 =?utf-8?B?QVNGdjdFZVljNExiM3RaMGZIeDRXWVZ3QUV6NzIrWC92alVQa1BhVWRKQVNZ?=
 =?utf-8?B?cmc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c059e07c-2571-45e8-e5ff-08da9a90a047
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 22:45:18.2474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VOcz0pm7KTvQOtaBf+b+pdAsAYZZV+WoCi2PZR5w38xvFSW3lDOqudRgWzv/WWn8PumE4fyWPlr82Vct6ADBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7082
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/19/22 6:40 PM, Leo Li wrote:
> 
> 
>> -----Original Message-----
>> From: Sean Anderson <sean.anderson@seco.com>
>> Sent: Monday, September 19, 2022 5:24 PM
>> To: Oleksij Rempel <linux@rempel-privat.de>; Pengutronix Kernel Team
>> <kernel@pengutronix.de>; linux-i2c@vger.kernel.org; linux-arm-kernel
>> <linux-arm-kernel@lists.infradead.org>; Vinod Koul <vkoul@kernel.org>;
>> dmaengine@vger.kernel.org
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>; Christian König
>> <christian.koenig@amd.com>; Linux Kernel Mailing List <linux-
>> kernel@vger.kernel.org>; linux-media@vger.kernel.org; dri-
>> devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; Joy Zou
>> <joy.zou@nxp.com>; Peng Ma <peng.ma@nxp.com>; Robin Gong
>> <yibin.gong@nxp.com>; Shawn Guo <shawnguo@kernel.org>; Leo Li
>> <leoyang.li@nxp.com>
>> Subject: [BUG] ls1046a: eDMA does not transfer data from I2C
>> 
>> Hi all,
>> 
>> I discovered a bug in either imx_i2c or fsl-edma on the LS1046A where no
>> data is read in i2c_imx_dma_read except for the last two bytes (which are
>> not read using DMA). This is perhaps best illustrated with the following
>> example:
> 
> What is the kernel tree/tag that you are testing with?

5.15.40

Sorry, I forgot to put that in the first email. I can test with
linux/master, but I reviewed the different commits and I did not think
there would be any difference. I also cherry-picked the eDMA memcpy
commit, but the dma test passed.

--Sean
