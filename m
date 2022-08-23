Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6AD59DD9A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 14:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242042AbiHWLRt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 07:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357792AbiHWLQk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 07:16:40 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70113.outbound.protection.outlook.com [40.107.7.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B7DBD1DF;
        Tue, 23 Aug 2022 02:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROCPDGpmkeXDTW9U5NE8aPMBz1vVTx1NR+A7+IYI4bd36l1ZZ+OHCP2A6+do8dGk5qT0oD63KKD21vYdjKnUG2NP5bcgBdAWR1u+d7aA9UBSdVX3q8qubiemhUCMxh3jMbaoYytyOGt/2AV9oNbiTOiUHJNrTsLCyqvBbyy+kGbb0FRJcMUn+VeaWrLFNBh186JBUL/PbwxIQnJEVHnaS9qPSlWn6izRlT52pjip/39XZNCPNFi1CVu+o1FLPczuK81im7anS5HQm1aFAKRaMGfwgCktXepmPZy47BNwhkjH36E6X/BOjOUjPIRYdq5YRUsYkV5mMnkKb+4SJWSxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87yKDbYUF6l1HuPdbQ0/CgLflPaZLVl+ZfK5v2ZoLtU=;
 b=WbPL5KJuYjjtcDSIF6FrixaMrj0xAwmaxJ1tFvPJ2TNvFPSMo0tunb5Ox3nAKdJSJCZFurneuo8DSH3QDtIusO2D/5gX4hARlYKSncA391j+wmmhTeb9JleaGX8OSxeUl0iJznrCpgVkbwtYjgHevoXOpbxQqNuyjMgWS1JiVs+iO9RfuyAe7OztvSfmDYJDE17ja60lCQoOaTfM8ua7WlEHkP7KYDizzORsMBgw2jChDyh4NVbOBdsvi1UKNpXc3/uU6GpSYQnKjiYAk0fX+3PXNfSJIFHKXR6aoT8ZdgtoEV8ihn0JLG1e4PY/CFrJ6exxmpeW4haOecgGypU1Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87yKDbYUF6l1HuPdbQ0/CgLflPaZLVl+ZfK5v2ZoLtU=;
 b=lqUx8sEQy/NRlqYyEUukGcWR66PISBhBj6IYnGXsvkVX+uH20pp9MYCbUdm2/gCpBc16yJuHRu4+Z0QyOuiDboXELJPDQPjDhwhWOUWG2KG9bqxwj0WYcNHHy3rNyxEL2q/n+zAZ9sGHMwHCmxedhldlJJo1fwbmnaQBi1Wb9Vo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by PA4PR02MB7101.eurprd02.prod.outlook.com (2603:10a6:102:bd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.24; Tue, 23 Aug
 2022 09:19:47 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 09:19:47 +0000
Message-ID: <66c525ff-1835-b4c7-c7ee-469060826ad6@axentia.se>
Date:   Tue, 23 Aug 2022 11:19:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/3] docs: i2c: i2c-topology: fix incorrect heading
Content-Language: en-US
To:     luca.ceresoli@bootlin.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
References: <20220822091050.47099-1-luca.ceresoli@bootlin.com>
 <20220822091050.47099-2-luca.ceresoli@bootlin.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220822091050.47099-2-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0008.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::9)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37ced4d5-4839-42d5-93c6-08da84e89f81
X-MS-TrafficTypeDiagnostic: PA4PR02MB7101:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qIWzwS/2lbz3SultEIK2wnijoM0KATCjhG/n5+/q6brZjhc2QnVPjy5EVCCQ4pq8FftTHhmaBafBwxNt/lSFtNRcx/TsJZlBLh95x35Ws18rPfo7TzxkoP2fePkxfTa7+ifvZ2rd1YbcZdFP7we/y73qk6K0Ky6iV+EO/XiE/8ofY6U9OliPXI+2r9X/FqIO9XSLlP7MFeFII8YIWt31pyn957vvcH14Y7Duzy3AkG5/IZRDSLpg1HJpMYM8+l0gboJG3ZxTXRN0jpq67rc5gY+OHtdA9MLwmeycqGaU4WJicKRJv2BMuzZlRqHSX7LMeVTOfEHVJltf+0y8UrV2DrVrQuhFStcs2/GBOLwMzY7ZISyDslzKsWMrVmgisnHN+STlRerswzz4LbsMhekesfAW2L83GL4bdrk4TpPWXceYCJT1pJgjWwWmvAwsEChBsR9iKk7cs/+2UxGVE5by06jGfbL8AJYeH8AOA3etf4tG0lkXZ/TPhrZSIiMz1HRRwQTk1EF+EpXJwtIZckFXcJpOcB50ntgWbk03uyBz4uJzz6p/2G5EMiIKnEVFm+EZ0oArv4bW2uEgAFzy800hkaIFArUwjQGlQ4kRtYqHiKDY+bd0FA+L+sueCKzIxz7Z4Q4ik3Jmk9Tbk1zJQCakCybyop5RlVVlML9/ZgKQwtLbZLjbONiiH1HZ8dSf6LOyd7DdmCh2IVEoYDf5Z7fDfOh/k9nnBmgI2oshkFddQo6gR/8agbntDS4yA01BmKJMydeqFCLs7KiTYfisEuYqT//CNtJ1DWq2Xv4KVNsKvVg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(346002)(376002)(39840400004)(5660300002)(31686004)(41300700001)(8936002)(316002)(478600001)(38100700002)(66476007)(6486002)(36756003)(66946007)(66556008)(8676002)(4326008)(6506007)(6512007)(2906002)(26005)(186003)(83380400001)(86362001)(2616005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3prdURrTTZuWDg0SWZQVUI3UzJKN05lUWZsa0l5NmpXZ3VEbHdzNzZPajdJ?=
 =?utf-8?B?RXA1Q3krQ2FXZUwrKzlQNGtjRmlZOE9ibTZQVldHWXRJMEhDSHVkWFExdVNa?=
 =?utf-8?B?MURNWEw1anF6NjZKdXpwNXFiWlVPOVdqd0hURC9NV2JBbnNsaElGeHY0aUNw?=
 =?utf-8?B?N1N4UnBqaWM5bllObXBhQ1lLNmdiUjVVanViZ1RtbklKaGdZZUVPM0lVbFNN?=
 =?utf-8?B?T1A1Zmw3ZkpPQVBnaXdSQ0QwUWFJc3Y1RnFoTzRLeGVEVHBPQ2FiaHhtUlA0?=
 =?utf-8?B?SXBrYjMrOVNmMVpJVTRtc1BqdXpUQzZVUmdjVDAzbldzb2FCdVRtaEVQRkVa?=
 =?utf-8?B?K3lNZ1ZhVUVFMm9veVlRcGlzRytvRjJuOWdJdHAxSkFFQzB6Tko5anY4bEtq?=
 =?utf-8?B?OFdmR2xvRWgrclpzNHIxSDBBVjludDdkMEsxVmpXWE5sZ1RsSHRyWWl2VDdi?=
 =?utf-8?B?MmV3aURXamtuL29iSkt3ZXpxdzkyS3JvWTBrVE1BSEE5cStCT2ZCMVhpaTVt?=
 =?utf-8?B?YUd6WGJJRm9zTEJFMDJ1akoyS3FiaXFGTWYvampFZUxWeWwyVjlhSGJUNHZK?=
 =?utf-8?B?SVhVYXc5UzBGRVhmenBEc2FJTWU5ZlVxVzZUbThSa2hBeU5mdGo5SUVQQmY2?=
 =?utf-8?B?UHFRZE9hd21tWDJYR1B3RzhibVZ0VHJscjVtL3Q0NXJvckVKeEVQNm9RV0JK?=
 =?utf-8?B?SlArc3NDbUswUmlFTDN5N1ZCNFlnd1lhWUhSS0lWUWUrZFVEZ3V2V3c3eWxa?=
 =?utf-8?B?QS9IWmR0NXNnc0JQVHZIWVduQWVwTjJCVWVFbDU2RFdKNFlrSFBvdld0c3lM?=
 =?utf-8?B?cndTTy91OUlNVlhWNjA2Qjc3SGtldEpxRWRPbldvOGtxakEyb2wzQUxzRVRW?=
 =?utf-8?B?KzlRRGdzaHhDc1hnektHdXlZY0c3ekRLNjZFZnUvSkl3MEowaWIyakRoY0xN?=
 =?utf-8?B?c2ZmOHZrc0U2NnJZQUgzeG0vUDdtNHRORmd1SE1jMzZFN1E2M3E2VEdTN2pM?=
 =?utf-8?B?MUlCemlteFZTMXZZVGhwR2JxUWNVWXVoejBvWEtjMjNZNmIvbFhKZThSeG5v?=
 =?utf-8?B?RmlzQ1ZpTjdxNldGQXFNa0V1UTljTGRuWVJEYUtTQ0xLdzMrVlJqd2I1Z1E0?=
 =?utf-8?B?SGo4NGJkR3h3b2NBaWI2OEJFaHRNTWRZSDY0dm5Sb2JkYWw1ZmRSVCtGUjN4?=
 =?utf-8?B?WFVCVUhGcTZRNDMxMGhVV2FremxBbHFoZEZLUE55a3BtWVhZSTRPZkZuYXJx?=
 =?utf-8?B?UTgyNFlHRmN6aWpzZkN6ay9Bd1Y3MHpsb0NkSTF5eDAwT09UN09uNTRHTmRr?=
 =?utf-8?B?V2o2WHdaOC9yZlFjemRIbkFZeEFLY1BGTG94cDIvZi9NeVNOOXQ5TE0vVjJu?=
 =?utf-8?B?ZmV0dFdSN2VOZ2pRV1V6NmM1akxKRVIzOHE0eENkQ0I0UEdkZHVBbnFvV1Q5?=
 =?utf-8?B?ZjhRNkt6d1ZvaHlvS2pyL08yRmNFRnhxMWwrRjltSjRLamwzYy9ZQ0JJRzRX?=
 =?utf-8?B?SStNYy9WRG8wZ3FXOXkrVTRWVnA2RTlwaGhqcWhqMXMwamRXNWV5UVJuUDlj?=
 =?utf-8?B?d1VxTVJqajYvMnRQVG43SFBMM09OY1NzRmhoQzFUSHkyQjFXV0ZPWXphQ1po?=
 =?utf-8?B?enA3VlFFM2lSM1BNL1VyejdLOTJzZHJCYW9SWjRMYnF3cUlhcWVXSWpKSDJS?=
 =?utf-8?B?U3JhbmxXTlpZTU9YMHp1blZsaWplaWt4ZGs0WFJ5TGRjb3lrUlZmSXdjRVdB?=
 =?utf-8?B?NksydnFOd2dWTHEvNGJvbm9nd25PVVVRWmpsSWptWWJvNlQzNUFvb1NaRGdD?=
 =?utf-8?B?MksydnExcnYzRUdsRWRxRFpROTZRT0c3TGM1TzZZcjR2bXUwU2lXb1RvaklS?=
 =?utf-8?B?bjJuWEFMbEROSXExVHdJYnBIM2FLSlNCSlh5M0Z4NUltZHRUZ0dtckVQendY?=
 =?utf-8?B?TDRmRzJOMitsZGFCeGtwZE1nc2FVc0xuMUQzT1pvd04wWUdMNzlMQXdkOSs2?=
 =?utf-8?B?ZG1ObnRSa0ZMUWJjVnJRU1gvU04yMG9JYTVuVXdKSjFCeHlwSU0zUXlVU1FK?=
 =?utf-8?B?emNqTkxTWWpLeVNwVzdOaEJMZ0FFVWhBM0V2THFFWXc2NXgrT001VHBLU2tR?=
 =?utf-8?Q?ytDkNL1uAF0TlMzInrhnnxpEp?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ced4d5-4839-42d5-93c6-08da84e89f81
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:19:47.1726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJ81qy5Y3asHssOOVr/ETUY9m4AZ52Ji2oNQF+qBOxgZg71S1iBebjc+j05xLJDy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7101
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

[sorry for not responding to v1]

2022-08-22 at 11:10, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> "Etc" here was never meant to be a heading, it became one while converting
> to ReST.
> 
> It would be easy to just convert it to plain text, but rather remove it and
> add an introductory text before the list that conveys the same meaning but
> with a better reading flow.
> 
> Fixes: ccf988b66d69 ("docs: i2c: convert to ReST and add to driver-api bookset")
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

> 
> ---
> 
> Changed in v2: none
> ---
>  Documentation/i2c/i2c-topology.rst | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
> index 7cb53819778e..1b11535c8946 100644
> --- a/Documentation/i2c/i2c-topology.rst
> +++ b/Documentation/i2c/i2c-topology.rst
> @@ -5,6 +5,8 @@ I2C muxes and complex topologies
>  There are a couple of reasons for building more complex I2C topologies
>  than a straight-forward I2C bus with one adapter and one or more devices.
>  
> +Some example use cases are:
> +
>  1. A mux may be needed on the bus to prevent address collisions.
>  
>  2. The bus may be accessible from some external bus master, and arbitration
> @@ -14,9 +16,6 @@ than a straight-forward I2C bus with one adapter and one or more devices.
>     from the I2C bus, at least most of the time, and sits behind a gate
>     that has to be operated before the device can be accessed.
>  
> -Etc
> -===
> -
>  These constructs are represented as I2C adapter trees by Linux, where
>  each adapter has a parent adapter (except the root adapter) and zero or
>  more child adapters. The root adapter is the actual adapter that issues
