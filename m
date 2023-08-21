Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDFA783435
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Aug 2023 23:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjHUUjZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Aug 2023 16:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbjHUUjS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Aug 2023 16:39:18 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD979136;
        Mon, 21 Aug 2023 13:39:13 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37LFxipF013579;
        Mon, 21 Aug 2023 20:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=O/qTogwPF8Qr3rMYufS2Eq5EpaB9TQgHNk+8IwZl9So=;
 b=dLf2QlABkHvXVgdCuRTXe31b/Z9QPK6Qrp319WSNxPGmCBXd6SVQOmPGVYvbfhb+9HR5
 WYKwhdaeJGCWctiq/CzU+cMvYnTonWx6fpcoOtyCKH8W7FhiIfezuDXQU+Rl+GQIZO2p
 QIO1UPlHarX0iBBNTU6+0UpxBKoMUDIPbl0TbCRQARiAtL31hZVs+J+bqchieuTLopkM
 A2wFof+epRG9RImHb5Y8xB2xt3bxNVUSI8WmbTMZoWlJZOsWd2vkDXs4JFYv4ib+u+Ov
 Jo2/tmrJ7SEmzGsqjVzYX+MEcHXw5gPFU7KmL4bhuFutyAUvokSO7PNLFwFizt0A0Lfg rw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sjmb1uv48-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 21 Aug 2023 20:38:44 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 37LKOtj6030392;
        Mon, 21 Aug 2023 20:38:43 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3sjm63y5e2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 21 Aug 2023 20:38:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLyKdji0jg4SI8nfiVAFpVvjnTri+e4DhnhcIrJgpzDP5kaKBx684prD77VWY/+nf5KP0AAxCPor04Hp8yyBGq12fPaEgh7sbNwotnQxPjDk12g4YYdF1ALCJS5fiu/R59DV3N6Q2eiLLCfGioNEo7aeMTMgnob6h54U6cK0eKtBU/tVkPtk/4ccLf6eQkOATgiQCKaaNQBqPLYeOAwL4mcQsii4MUVR9kyQgRnvO7Bcml7F+uF81yTR2eVHHJFlMz/EsbmnJIw7pWXKCu0GGwAxQu34ipSCqYJp0EWw9XX2SrbiQ1302Pyd4NiYYhI3gEJltLiO7EMimDfX9lKxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/qTogwPF8Qr3rMYufS2Eq5EpaB9TQgHNk+8IwZl9So=;
 b=XaKRMYHhuxcXaLoEIslsdnsZXt8fVbEtPXreY3jwOlT2QRtYacoOJGTmTyas9DkXwvq2qB1cl4gfCk9MdpsCmml0rJ54Ybeb+Of5dbAmhxfaOinqtcKwAf6fNxYCI8W2hCqYdCE+BtC0aYDWkiwFo/5Y3dy6pOMHpE4gf7WhBjuWfogCIUBDb2JxvGLEhv4o6qOMpXucl3/LXYhvhfFDSzwl3Tl4QyM4SD8rIq+m8l6Cm2Jyg/TEjg8HSJciC1dR6FCiDdDm93JtdRNhEKT8pJYt0IbXeFsKiXdLcqi6rIi4sy4VpmQ+FvZVuH/3uNg1jUm8vaCKHJ3vDr1vOqYpfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/qTogwPF8Qr3rMYufS2Eq5EpaB9TQgHNk+8IwZl9So=;
 b=bLtCNUcJfYRAU1VcBvB28hYqEzBmVXPLPI2/g6CrYQlS1WR52Jkf7mt1eBfOz4TiC1JEVcN1hAr8J6zp81fYWeuAAyG+DwgpcGFB95mZURBGRTCxFvNt90OlW40S0ZOLaXuYxuyzJmMob222Dn/ILXzz9FaEE/nYxINt69GEu1I=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by BN0PR10MB4824.namprd10.prod.outlook.com (2603:10b6:408:12f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 20:38:13 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::3ec2:5bfc:fb8e:3ff4]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::3ec2:5bfc:fb8e:3ff4%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 20:38:13 +0000
Message-ID: <c23be2ce-052d-4320-220e-ed471769b09b@oracle.com>
Date:   Tue, 22 Aug 2023 02:07:57 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 5/9] i2c: qcom-cci: Use dev_err_probe in probe function
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Liao Chang <liaochang1@huawei.com>, andi.shyti@kernel.org,
        florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        yangyicong@hisilicon.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kblaiech@nvidia.com,
        asmaa@nvidia.com, loic.poulain@linaro.org, rfoss@kernel.org,
        ardb@kernel.org, gcherian@marvell.com
Cc:     linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Vegard Nossum <vegard.nossum@oracle.com>,
        LKML <linux-kernel@vger.kernel.org>
References: <20230728013148.1720978-1-liaochang1@huawei.com>
 <20230728013148.1720978-6-liaochang1@huawei.com>
 <e87b35f9-f585-4a3f-bd31-9ebeba52f66b@linaro.org>
Content-Language: en-US
From:   Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <e87b35f9-f585-4a3f-bd31-9ebeba52f66b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCPR01CA0147.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::12) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|BN0PR10MB4824:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a775bc-a877-461e-6b0c-08dba28689ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z6hXHyHfh9Gip4oeS85eEmuxD26DXs4yq9af1oPpW+lw5OL8slNb8S5iLWfMNV3t8uJMyy4Pzgohv2jgieScjuuAEtHrTbh5liHm53cxZ3atsosXpRFX8IzkaUcrwni8r1nEP7rH/HiSRxA3VOF/pQ5w24LIOl6U+cAXyK9ZFoHB66KYQpV8LJaW6xe6x5umtbWLlZSWWQp6JgTkdgWdUW2BixqAm/IbNh5EvVf+GgNyB/zwRZbpCoQZBBR+k91/k5iR2adNOFXJXvZkh5OTkoy0mqYH+ZYECsLq4GgMYEV2GApBWVjfnMVbT1pe8OXxlWIe8b3sUXl8bjq61R4Rc7a/HH91axRponSo19QReIGdwrlMPKoqZ6nOou33qjD1eJgIM95H8FFfUbYP0HsQ6ucm6X6aB46zpmuorE8DbP+/ca068q85TvQ9dWwol9UWUIWhLn1vnb9bWGNR5f2EmRt4EUPW+donYnVr7lHW8yDByUoajts8W9y34OAgM4XN1ldCUXJZVj/JQs8h8j3lNhOun7oIOHjAFGErTjASz+RPyJuWVXmZeqSG4YWGRkCDeOmgo29Bk6835BN7OOPsVbxYy7ZM1tjGk51Z2plw5XavHjErxMwKmJMBsvN7J+k4aVt+Ekl7KoMThdOJpQfyfUUewf+tp/sXcjxzfcMArtY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6290.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(54906003)(66476007)(66556008)(316002)(66946007)(6512007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(7416002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2ZRck5BelhDRTVWNWQ3VnF2VmluQUgzMlVhQ0dPNUhqOXE1Z0s1d0xaQWJC?=
 =?utf-8?B?VlNZQ0FxSCtzWUhENlhWMWNpZ2xkWUl5WVBMeHlQTUN4RWNhc0hxcndFaDgr?=
 =?utf-8?B?aFJiWjQxZlNpNUtKZDRSMWc3ZEp6d3NjbmUzditGTmh4bVJUdzdITkhROXY3?=
 =?utf-8?B?bzhmU3VxeFpCdTJ6VjZtOHJQTkRuS0VncnJ3cnBVdnBhWWFGL2t2NlNqdWFw?=
 =?utf-8?B?eHNMN3NjczQzNGFqMHhaNkZqeEtiNHpXU0Erc01NSEQ3Uzc4M2tOWDRXYWdS?=
 =?utf-8?B?UDVaRGV5VytsaHlDczZUNDlzS0U2bGVGcjBoWlo2Wkw0Q0JsZ1Y2RjdqbFFI?=
 =?utf-8?B?b1FLV3MwMmpIVFpOam80L2M0N3BPVHlveXBEN3RHTGkwSkJkaVQyVVMramQ4?=
 =?utf-8?B?RGlmYXBpY1F0Rld3VndEZE94ZTd0OHkxMGJZUlYraFZremRhbksrWW9KYUdo?=
 =?utf-8?B?Vnd0K1RvRUlWSFdtRlFOYitlSVNTT0E1alRVdFgyby9ZMElLVXJaK2V1ZkNq?=
 =?utf-8?B?R0d5bnAzOEYxOFcvcHN1OUFrZGxrQnBLbndVTE05RGZTcVFVTkphNnlaUkky?=
 =?utf-8?B?OU8zbUdhWUNMQ0NjOVQ1Q2YrZVdScUFPd3V0TEFqSTQ2clk5SlpsdWpWSCtj?=
 =?utf-8?B?NXBQbVMxM0Y0cGZJOUVMRFVqTkNMemNmeU9PcW5QV2dTbkkrQzBvcXpyZVFK?=
 =?utf-8?B?S2hxRThmMFFtc08rQUw5YW92dGVLOWJCaGw1VXRvd0xBMUJZeVpHTVJCY3Jn?=
 =?utf-8?B?QTdkYXMxRm9BZ0hpVm84aXBoS0svQnU4c283RHpUTEx1SDZ4VWZ5ZG9COWVh?=
 =?utf-8?B?VE1IOTIzTG12eHJsNGVZditFUHpaQ0ptNCsrZkxHVEx1LzNvUE1qK0lWYWZL?=
 =?utf-8?B?b0NKWGtKUXFORFUzbXpCMzdXRHhQL1FEZHpwbzhnUVZ5Zkw1MDVVcTMwTmlK?=
 =?utf-8?B?c2VhZ1FoOHAwWUNnWDNIaVpYV29Bdjh5RWNXYVJBWGxicTk2cWVOREhJUkVP?=
 =?utf-8?B?QzEvczRTcWhDaFh6SGphaHZkbDJ1VW1tWHo1TCtuNUhiaVNSV3dOcXBQdjN4?=
 =?utf-8?B?TThaU1BqNUdzbVBCdjRMOE5zZk85aGZwTm90QVJpZWV1dnNZNVZRc2FHZkVU?=
 =?utf-8?B?cFJGTk0zRFZzbGxSMHIyUmJFNS9heEZnNC9Cb25JM01kSzBLUUVxbFBIQWxm?=
 =?utf-8?B?Z3ZyOEIzaWxkTEI4UzlZc0dHQThFUWs5Vi8wZmJFMGpMUm1SZ2pVcVJFajIv?=
 =?utf-8?B?ZjRjcnpBWXlrbGNqdXd6bTFLejgwRGtUckJ5M3JicVVLbXJIaDJxSm54V0pM?=
 =?utf-8?B?K2JGL3g4VkxBUDRQWFMwZnNSKzRFaU0rRzhHSzlvOEZ0T0VhbUp0Q2NGamhG?=
 =?utf-8?B?UC9taVRpT0Zwbkt0ZERMRGQvV0ZFb1o2Y0EweVVtWFRpT1JDYmhFRUJ6R1lD?=
 =?utf-8?B?WndUS3hWbkxnY1hXU0k3ZnBvV2QzKzkzdGVkNmEydjgrdkM3OGFwRDlOYUUx?=
 =?utf-8?B?RnFhb1pXQktjSWFMY25xV3k0akhPQ3NtSmEzZWJkdVdiV0x2Z1JHV1BIUUNn?=
 =?utf-8?B?dW9xYkxDV3FURG9rZElUNDJNVTVzT1cvUUZiVnhxMXR5dTIzRXVaVytlcDZa?=
 =?utf-8?B?SE1uZWdwdUpvSEc5ZkptOTlFMkdleWFESG1tejBmNjVzNHBLNXpDZVZwRnQ2?=
 =?utf-8?B?RjhDVGo0LzJtblk3RHIyNTdNcE42aDV1TjZSTjRRUmYybnBEZmlGMXFRc3Mv?=
 =?utf-8?B?Q3VjTkVDcnNRdVpuL0tUWUFZS3FWbHBpR1E4bm0zc3lVV2tmM1JZY1ZGbmNB?=
 =?utf-8?B?NGxRL2NsRWVXTGpyM3poRllRQUkvZFQ1eFZXdVR0aXVYS0Y1aWFVbitkWDA3?=
 =?utf-8?B?UUtma0RwRjhpUThhWC9hQ2dnQ2RkeGEzcmpKRUx3eGlRQnNBOWUvQllZYU0x?=
 =?utf-8?B?RkoyWHF0VDFkMWgzWEZEellGRStjdytxS2k2Z2xOVU4yWmJPKzRIM3cxOEpQ?=
 =?utf-8?B?VXdWRFVpUTJRTkNBemhiMkp4dU96alZlNVdDdFBjd25EMU5YYTlvR3NaeU12?=
 =?utf-8?B?WCtsVzlURm9CVVhuSjhRdEtMc05YdjNMSVJqZVFhNFo2Sld1RUdWRlVJM2dq?=
 =?utf-8?B?b2VKVElsZ3RwUlpEVGNZalBEeENUNjNIYjEveGcrQ0VmRHhOSURZTEJpY3JF?=
 =?utf-8?Q?g8HiYsh6eiokyhnoETdCYT4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Uk0vMWNmNDFQYnFKMk9Qb2JYL3I1L21qcW5Fa0dDMURRNnI4WGlISXY3Y3Y2?=
 =?utf-8?B?UkRqOVEvU2pDRHB1b1c2QmZpSmwyN2ROYlhvV0pWaEYyUFJJM1BSMit3Rlc3?=
 =?utf-8?B?ZVFTQW9laFNpd2dqMW16MmJoK1ozZnN4TDhXb0YxMkhIZkZBOE04aGhuZmow?=
 =?utf-8?B?VGtSMDEyVEI1OE56QzVNNTRSOG84SEE2YVQ5VDJTb3ppSjdWbzFzWTBybFhk?=
 =?utf-8?B?WnhYSTR5QkwyNWU5YU5raDBmbHAzQU5yWnZRTzc1WnFReUNrUnI5d3BwOURU?=
 =?utf-8?B?emFmS3VVOGZyQ0w3QWpWeFAwUUdmZXhSSmc5T0IxVG9pcnAyOEtwSzJJMVpq?=
 =?utf-8?B?dG9aczYwUjRlZ1oxbTBGblpNaFBxdnRPQkdydWloTk5sanhzLzE3cG0vZXNK?=
 =?utf-8?B?UDEyYlljNTRBYjBKM042NWpzOGlxZGdwT2pBS3U0NERLdmRId3UxVndwcGlQ?=
 =?utf-8?B?VmlnMVRQLzdXNEhmOFo5L3Vuc0IxZ1dBR2VJZkU0bmhhZlByT2YvR2N0YVAx?=
 =?utf-8?B?QlZWM0tZek1yZUk4aWo1L3FZdDBzLzJNL3dqTmVhVlJtL2M5S1hFQUhYZkFN?=
 =?utf-8?B?TFptZzNHUmVFKzE4eGZjc2JyQmovU3lUZFc4ZlpSTnY2NXVNQmdLWnd2NFJq?=
 =?utf-8?B?b0M0MTFqS0RtdmZkemVleCszQkt3UzNUTlFmcU1saEgrdURHNnprWTdxWlZ4?=
 =?utf-8?B?cFM5L2gyZXcwYU9TVExlc043cFJ0TVRJRUtvTFZNRHQyN0hLR0Nrd1JVUjNz?=
 =?utf-8?B?T1prR3hIM01uUk9Ec1ZWS2IrYWs4WTFkNlBXV1V2OXdPMVRuajgvOUJGc3hZ?=
 =?utf-8?B?SDVudGxHTnIxc1VVWEd5ZXREY0c2T0JqNXFZM0dUbVpPMmlSakQxbTVHV2R3?=
 =?utf-8?B?cHBud1JmMDR0c3FlUDBDUnhFeGRWLzdmUmpERW5SM1Z0WGMvbGU4ODBmOHNk?=
 =?utf-8?B?NTZ0YXFEQ3NBNGtVR1RtbXhEOUJsQS9ZUmZTN1VmeG5mSW8rSU95OG5qTkxq?=
 =?utf-8?B?L2hvNW1nTUoxZFNybHBpdmNWOVI2d3pJTkVENktDaDlQV2l5YmI3UnZIYWlB?=
 =?utf-8?B?VWtpTWJ5SU5XV3JEbHZNWXZ2bEdhbHJUeURHSVRMTXJEOWRMRSsxeGJlOTNU?=
 =?utf-8?B?VFJydUxFeGlFVEYyaGlQRWtwVDN1RmZQOW1BT1hOZnhWY2tJdnNubG5PTkgv?=
 =?utf-8?B?VzVYVitDem5WbjBNaWV4Y0hDb1FpdFI4Y1VYQUg0SVBKbzd1eWdpWWhuM016?=
 =?utf-8?B?b3JGL1MwR3lvcXpxNzlYT01QdytOd2ZYWFZLZmVHMlNqUHJ5Y0xWelljbE1P?=
 =?utf-8?B?NE80M1pDd3lvOVQySEt0N0R6UFVaU2VmTnZETGZzVlFFSVg3cEE0K2xvdi9q?=
 =?utf-8?B?WktQNVdTa1pJZDlwa3pEN01zY25ZWmVkSzJuYlhjTjlDbkJSSDNIbDdRQmVT?=
 =?utf-8?B?L0xjRnRlTHZjL2xLSTJhSVBvNGllcDN3Yk55ejBmSU1aQzlYWGdKZnQrVEFq?=
 =?utf-8?Q?aYVdZYDYObNjthysQeWQt6vHu2r?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a775bc-a877-461e-6b0c-08dba28689ef
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 20:38:12.9907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoAAI9tFl2PabmWuicTTAsBWUoymzG1EVJfipi7gWNYEbPvhyjXveFYccWQMuO7R2JDM08ZXyrejmoEFvI09YLq+ja1BR0to1vlKtaB53JLDIL/xleJcK/dAlb3I5pJp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4824
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_10,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308210192
X-Proofpoint-ORIG-GUID: Fzps5ObJMhWBe-DrwYHemIiIIi4rt_mr
X-Proofpoint-GUID: Fzps5ObJMhWBe-DrwYHemIiIIi4rt_mr
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 18/08/23 4:36 pm, Dmitry Baryshkov wrote:
> On 28/07/2023 04:31, Liao Chang wrote:
>> Use the dev_err_probe function instead of dev_err in the probe function
>> so that the printed messge includes the return value and also handles
>> -EPROBE_DEFER nicely.
>>
>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-cci.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c 
>> b/drivers/i2c/busses/i2c-qcom-cci.c
>> index 622dc14add9d..cf13abec05f1 100644
>> --- a/drivers/i2c/busses/i2c-qcom-cci.c
>> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
>> @@ -588,10 +588,8 @@ static int cci_probe(struct platform_device *pdev)
>>       /* Clocks */
>>       ret = devm_clk_bulk_get_all(dev, &cci->clocks);
>> -    if (ret < 1) {
>> -        dev_err(dev, "failed to get clocks %d\n", ret);
>> -        return ret;
>> -    }
>> +    if (ret < 1)
>> +        return dev_err_probe(dev, ret, "failed to get clocks\n");

Description:
-----------
  * devm_clk_bulk_get_all - managed get multiple clk consumers
  * @dev: device for clock "consumer"
  * @clks: pointer to the clk_bulk_data table of consumer
  *
  * Returns a positive value for the number of clocks obtained while the
  * clock references are stored in the clk_bulk_data table in @clks field.
  * Returns 0 if there're none and a negative value if something failed.
-----------

When ret = 0;

"zero" is passed to dev_err_probe and we are returning success(zero) 
from probe function.

Based on other instances of devm_clk_bulk_get_all() API, can we fix it 
by changing condition like this?

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c 
b/drivers/i2c/busses/i2c-qcom-cci.c
index cf13abec05f1..cea6f70d2b8d 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -588,7 +588,7 @@ static int cci_probe(struct platform_device *pdev)
         /* Clocks */

         ret = devm_clk_bulk_get_all(dev, &cci->clocks);
-       if (ret < 1)
+       if (ret < 0)
                 return dev_err_probe(dev, ret, "failed to get clocks\n");
         cci->nclocks = ret;


Thanks,
Harshit

>>       cci->nclocks = ret;
>>       /* Retrieve CCI clock rate */
> 
