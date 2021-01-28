Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246BD307370
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 11:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhA1KKm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 05:10:42 -0500
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com ([40.107.21.95]:4672
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229834AbhA1KKk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 05:10:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoqHCGtVKHTYBElUcBVOC5EDLgTbr1WOP50KRlF3tg0y67AilIIwoOCoCEHlQGLH70OL9PSX0rQ9xsHFmNKjBXkc7xXGaYe9awYKolNtKA3DHMw15ZpjggG1+qW8aiZbB4Mah5kDFRbecdwx1KRZUdY8GX2icNXP88IS0WjJ0Jrk5w5r/JTvv1tI/ZhgTC5H9MHgwBzUs7G7RcFcysgSl0vsMhsY2sW1FdhPdEdgfK7NExTpmpn0WzZsGStwidtXURu3PS/pvB5NOZ3uLHt2NBLZHB6C5lrqM4I7G49MGecHF6aF4x1pupIOwjS8VIJ4AEi6I8pHvMNCtEsDkjb6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Opt238zB/7gS6KYma6h8HDJJDU25QCTd2AIfKbgo4pc=;
 b=iRBGON/RciAC4/HhLcxzBGDMIJ4ScGnfFx5QmBH9XdFGSgeLA93PRLT/OFJx9moJunobon2v6yfXQNZJWllsyMo7CyQgxsFfQNVoL/9Vm7IDpiYSUGw1zBRtu+3FwsnOX6k4434uuMwTGZNVdw83yPL1CdPBf+KVGp1ofzbSejJ4VmeIOrW6xTY4+pfzA8d+vGyXZQWo/Q2QXDcTGfknBDtcSwg/g+3ycbU39/VhaZpy8+zCaE7fGGGrhaMa9koWJfzomgLvc5aKzEEmCmrZN+iUFyHmX/Hdl9iGWf85fCmjSOhPkNQbN71lFMbqwAhh0StHinW8PNQfjwNDrkUk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Opt238zB/7gS6KYma6h8HDJJDU25QCTd2AIfKbgo4pc=;
 b=Xtz6Nn+AZl125HwYbhxXyRfG3c/DwBQBKC+wr6rJCXxtG1FUO1vTngzYLMTWwSP6EM//vYV78Iyc/vPuRMtZMXLEa8O4MB0/9PprqhUqjt5+BIE41qS3eoiHKrF/KaXeete4ToYF6LphLjwWAn8gz67Z4gbBS8ubt/O18ou02eQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR02MB3061.eurprd02.prod.outlook.com (2603:10a6:6:1e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 10:09:50 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 10:09:50 +0000
Subject: Re: [PATCH i2c-next v2 1/7] i2c: mux: mlxcpld: Update module license
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210122192502.17645-1-vadimp@nvidia.com>
 <20210122192502.17645-2-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <8c5783c8-fb8f-8f53-3777-c1bd5fbefeaa@axentia.se>
Date:   Thu, 28 Jan 2021 11:09:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210122192502.17645-2-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR08CA0067.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::38) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR08CA0067.eurprd08.prod.outlook.com (2603:10a6:7:2a::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 10:09:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3fcabcf-4e61-4dcf-435a-08d8c374d992
X-MS-TrafficTypeDiagnostic: DB6PR02MB3061:
X-Microsoft-Antispam-PRVS: <DB6PR02MB30612133867C31F8F3A41039BCBA9@DB6PR02MB3061.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G6vDfpxemxsR4zO7xnvVEgh2+9Men8bR/PYeH7AiXnBMAoQ0AhnpBzh+yrey2XAf9/Vu8rwmyjsDGqEwMGkcndF0CiT0xgS4Eq0V/eseyqsqYCoxnEfHu/3q+9zsWQO//B1iIVhlF8zB2+TNAgNl5gYDbf3kG3wC+zVL0pFR9vkPkwlQy91Ef/Roas2XIHJRIq0w1zdR1uf9g3hHNvsHfyQj9qGXfEI5w7JDfwJgfsJsuMDPzQs9beeYTGT3q8F5xc5Qx+EpHVuthwMS9vRBRvhNYRdxpvbUFPvp+xDx6LCBfpEG9N9UcAWD+QalydbB3lxxKwuZxsO7Fku2JHc1wUvOWgWOFuEOmz0odhQ+WcSAvUbrW7xZBsK+vuTuX88nYcdZqTa9TMA7HKO18Xy/IFCWsveM6gTyijk0B1Cgl4IWdrD7syKa2nHApOkKFXim/a1GgvMJQIjdO7frQF1qJ5GOmAqMfKUxt+rH+Zk5RVwfQ51n8wCZT3O0LJLC6EPvQ9zIFlMGjSIUe66h9PsFIR4V/Y43n6S8BtggQBD/jPLAowf7DLjEhZhoZePM37RBnZxmM/c2gY0CDm4l2dlPEvqIaEsw/dei/pPAdliiTJBkwT4tSurcuV9DJwoOumoL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(396003)(136003)(39830400003)(31686004)(16526019)(36756003)(316002)(186003)(53546011)(5660300002)(36916002)(6486002)(31696002)(2906002)(8936002)(15650500001)(66556008)(86362001)(26005)(83380400001)(16576012)(4326008)(66476007)(956004)(66946007)(478600001)(2616005)(6666004)(558084003)(8676002)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: o9cCQXtq+hqaMS6sLEBUSeF4w4e/ZExAE2hx5ZxoQtuFVBzbAZel4PKshDTK6N/e2+e/gojXmeis4IVciZtVZZqfxzr43Dw2GDpka23h419v+lIo3PejJzmey0NehMLpjAea3QlIQAVtPt9oJM2Mir85CacC8zbf8yVoi0W1rau1o0ZseDf/6uvwppewbT1XHB6zhNZoeKWHmflYvVqLhkEL64TbAc9ad/v8fdWLOrJwKU80j31sytZScxvFrLudMGw13NRIeqthfbZVzguxJqqujzZ8atuTPPoJl86w4CsQqSgwtogknbHEL9zLH7RrR3dV2jk2Tt0DKDRy4sp6cMt2TbKaE0G0on0BpzitUjRI7SkHoanhcMCTQvl80pMevt3/FS7i6JJ06eWrmc8BTASNkN6BbMlTuMP5csvi7GswWHujichUbg8AWv/+VH0naqQrNU7qLaoz85WyieYs/SFaw9LZ6DA4kAO3bMLfiBHqRW0htoOnSS/tEqtyKTF06NnG3g84l2emf6L/NCsUU7Z3IiIKvMRAKo/exH2/nsIyni1NkQ86YMcNajqYRwfMCDJ3YYS41bDG0qvPDAlwy7VeAOerl1oR6fDxkQFRxO47rTKOEfNitOfNBTHxSE4WlkwkdfJD02Sj3YffLSqZe3FW+/7AIztjavcI7fM78c6HjfNU3DLWJsyR4yxZIx5MR/dCKN77NLlc+h1d1coxvv9xoqDsJgEVB/n+sIj2UdWGXgoDkQtGCsquh6w7wkdI
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a3fcabcf-4e61-4dcf-435a-08d8c374d992
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 10:09:50.7798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7AxhRY4vXryRfn+nmvwv1QtNxpPcvBjMnB3i+smjswdyOpLnRXrl5VqbuJuR+cW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3061
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-01-22 20:24, Vadim Pasternak wrote:
> Update license to SPDX-License.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
