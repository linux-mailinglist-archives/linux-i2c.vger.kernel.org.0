Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37630307378
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 11:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhA1KPu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 05:15:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhA1KPq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Jan 2021 05:15:46 -0500
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-he1eur02on070d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe05::70d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450CBC061573
        for <linux-i2c@vger.kernel.org>; Thu, 28 Jan 2021 02:15:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHsusyW+XzFdKfOc0uqiZZ/JQ0dVu6r4AMAwWD069+vLeMxUKlqL92a5p2pLLX35hbAImiXCaPy7q+dYdv1Gv+4J0wea5/uWhplB1O6VKoW+uwXdvTA5LMQ8udICzfUVU1psXlvYUb+6JUcvPlKB+5v/ojadDHwdhUcOhaSiQY1ixZycAbSeVjzF5AVk/ECX2jgN1YRoVZMLrL3E7i1Pr8FlILO6j9Vg7XoWKkfQot8rIKfE8nQgsTkuBhUcrhOjrnbYu5F6rkxCZUPqGVCUytFvo2ThwnmAYlwc9jV8UXzNW9D9TLhC/sNmnSc9PrBFMEesoL7lajvz1gTBbrvhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zotK7Ow8WFq4R7xJmLpEooKSrtR95Mo8KwV5y7hTKUA=;
 b=bpfYU2caeQxSZFn2/Z7vhWGQpWBelkWOXcABfVTlpTrKCNyps3c9XdsG009EdkWbz3ns8GrMqBL3oNd103nUavZW2cy/b6EBs/aIvz+6qCT66VcxLV4nDQy2icQVAA2/y/ozkVNzktEAe7lLx6FVMr9bL0/sEnDTLykNPg2P2lK9oHi2PMVBKkAb8r1UegD/H737+YR2pgF9dn4i1O6v9EAMS7BpXnxKL3eyRS3jFfAk/XuujeQfJtLZnti9mVvoEYVkaeetL/CgYX84jSWeZ45OWwwLQvAzPrqd4bmLljRmZ4StkFchfClpcOqlRbFxg4OaLSBp8bZMnhSUCI2row==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zotK7Ow8WFq4R7xJmLpEooKSrtR95Mo8KwV5y7hTKUA=;
 b=oT3pKtAQbCA3aodmUj2YfIVs4D7TGT1U//3WBnvh299GVTnfFjQpRIN9UO0yomZZaP1wYzVeqOtG/WPzLrjRfeQcoDSCGOoCf8u+pqG5s/h8OAs/M23c5+cIdKoPAFZ9C3GFOy0Oah/Cf6Vuk+RUcsXfDAxFYkViJ4Eilwf/wxc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB4792.eurprd02.prod.outlook.com (2603:10a6:10:5a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Thu, 28 Jan
 2021 10:14:54 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 10:14:54 +0000
Subject: Re: [PATCH i2c-next v2 0/7] i2c: mux: mlxcpld: Extend driver
 functionality and update licenses
To:     Wolfram Sang <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-i2c@vger.kernel.org
References: <20210122192502.17645-1-vadimp@nvidia.com>
 <20210128085305.GC963@ninjato>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <de1c882f-ecdd-a40d-28d6-ca22efe6733a@axentia.se>
Date:   Thu, 28 Jan 2021 11:14:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210128085305.GC963@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR0701CA0061.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::29) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR0701CA0061.eurprd07.prod.outlook.com (2603:10a6:3:9e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Thu, 28 Jan 2021 10:14:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee443c10-2e05-4849-19be-08d8c3758eb4
X-MS-TrafficTypeDiagnostic: DB7PR02MB4792:
X-Microsoft-Antispam-PRVS: <DB7PR02MB47925E572686FFB91E33B0E9BCBA9@DB7PR02MB4792.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YgNXQhq2KN3dwVHaBlxn8ep5hDzQdjt1/yGWfjJOAAT0HaQQqfybrH0HLFCXH3fIPfAHxEgsF1TaI00roXIMSLvmIreIoK4HCgVHNqCRPBWeKertMozIc3qZFT88MmekaH6eJFw0omtl2IMpi2o8P2oTQ7hatHRKPmSPTXV+dXKhSYm3wC+/ZWYddIaRHrnBp7PP+aXzj+pyrlvZii8CUbqy+L4qsaIsgrnippEMXb/ipTmWwAc6CCE6N1I5HY5OeuRzjhSNJpyOcKz+lS1N/M38oW0RPyrfh/dVxjoirx8jvpaFetlGMsBTSecR1Jx8eb/3Bp0ZKvXX/fic2GQKjLXgIkd5WAW1DLuug0uYWLAbxCH5OkIjUtbfxxV85Zhx6oxcVuVTnxyCm89ddlB7kYprLwlrWVjaeKfXeZRTen/XMu0vD6+UC8uV9vKEOv6opJZEAdMy0G8ma321HDyzJ+eoHcrzEY/TwYmIsI162/3DoA2NeEkVBqOPWqHj4H0RmtkCgBILrgHFitnjPRBToKx0afnPlC1D5lkguabRPpfyxcAKFrXzRFnqy1doXBu00QjzT/Dhh0AmLhIEVUbwsWP+1aB+fQk7rXgUlSvA6gWmLhTZ8m9C+R3HYa3/Ywff
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(39830400003)(376002)(366004)(8676002)(66556008)(6666004)(8936002)(16576012)(16526019)(36756003)(186003)(31696002)(66476007)(956004)(2616005)(66946007)(36916002)(31686004)(15650500001)(478600001)(83380400001)(53546011)(86362001)(2906002)(6486002)(5660300002)(4326008)(110136005)(316002)(4744005)(26005)(133343001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 5ijGdZdRwbMIBF0Dp/BzreCyEIfvo099+6+M9Hle3925Pv4b2FBOaDGlKvXxafZsx2HnueZX2rKcKuhpKxt7pV//mZWH/0XxKbiWisgacWU+zjwgk572UccqVWOzNWLG52BuWcTlGqaKKIBznjJQnMHMJOaJoqq/ktwsodymSfecyoUtQ+hse44hbR20djLK5FXagSyFnwDSHORVzjdwJdl/3f3i8NpkGwfxkuQTrMW0RaHDeyti15CBeJaj3D4Jz+sfrjNcDvgvihBDuYyRqEDRRNFONvwQBAdOEDDoF+wbaX4l1rjuenklrxo02NGxmZt0zXUGV85kLccfAqD5dz2ASaoDGPNBK3nCx7/+uTlvDO6LDMKMCfKjtFifxJk9KvTVKCwaYdqPwYU4xUiccFR/G2QmBWy1eXWsHzcm9WT6v13twTxQGa5G1t/FBFAk4iMY+oSK25G5r5L0x2Jkjti+9YKGjri+IEb1lxAMUoK+KOKBVcH5Z1iw2JuVwdozJulkQ9uw2LBuADrzLqr0A7wTn5E89dGFTe8jVDb2Dw4nMDQYWPQx625FE4Kc9GFk6sfm3pkTZiS+pevkUZBRG4RXExFXJIR9t3d1Z27FXRFOpo03kUe6N3YWGgl3nNYe08NEmAr/HyXiw+AmMUD1+hTHNqB6+MQNbclXdQLzxuMoJ9P4ssWkzgGkH6Kpc21V7TriDxvihNpUyMk+yxvc4tGwzUtRr+tLxjI6nmo87mds2L7iSN4az0aoYfQP0rWY
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: ee443c10-2e05-4849-19be-08d8c3758eb4
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 10:14:54.6762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKimx57v3l5pg9KWw1+8wWmUFXWCBFpRH3uxUPQ1+kIk1fc0sIRomVBz+dxvwvxY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4792
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-01-28 09:53, Wolfram Sang wrote:
> Hi Vadim, Peter,
> 
> On Fri, Jan 22, 2021 at 09:24:55PM +0200, Vadim Pasternak wrote:
>> The patchset adds new features for the existing Mellanox systems.
>>
>> Patches #1-#2 update license to SPDX-License.
>> Patch #3  moves header file out of x86 realm.
> 
> I think I can add the first three patches right away, or?

Right, go ahead from my POV!

Cheers,
Peter
