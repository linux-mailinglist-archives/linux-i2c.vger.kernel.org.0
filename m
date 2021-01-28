Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C90307372
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 11:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbhA1KMM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 05:12:12 -0500
Received: from mail-vi1eur05on2102.outbound.protection.outlook.com ([40.107.21.102]:41952
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231322AbhA1KMK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 05:12:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dpw5suRcwpYLiCTNfNCY68KPbvcPFTNYhm7L0tmLRxncg4Dlcht2E0avY+Yf4a5k/i7swqIVqa+3U7t9UqHVASU50G0mhonCN89c+G/AmfAIUiL/bK/xxfpnmA1F9hp4VKG72l4z+10v5oGY9CuigXJz5e6N91IA7OpKLjjg1Ua6CL7y9BhT4JQE/4RBcBSHqpLUCyBMCGoxGoMCSCmZrtpgxGEBSTe+AzXjIQb+0xs9Tm2EBoOtJZy8mcKTOWtplzeJCnXles5Di0Ke6MwVyZlF6sEaltDqHDgQVzdRnXau8i6eNbgIbriZ2svD6v1Ji2dpCVE+Fb0zukYXly0hIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIqzbibFkOACUGy5DmccmAc6BQdTBd07XjqiRwQu29E=;
 b=M/RaeODSfmV+AILa39Bg+pMOzb3wJR+SuI3ZH3ZQZv6llWnfg1t+gj/KmiZvdpw8o0ORaQAXULND6hNxl6Iou/ccjg5dZpYn2ygJlLwjQJOX6n0rFDD7OTXCR6A/oabSjNdZdtouPE+TtyCRtfJoqIe0jXqR9OoWEVjTojbcVtKUDGKSlQPpSGn5hHKIWgbKXQSJBZtOCtsaEIOqQ2/C/SYx5kFyPkTP8T8QFNAVZHM3R+sS1eUGnNYDcKP/2vIsVe8w4MC597pnzZS9jPH7voUXpXkjXRozgiFgs4XOxyPZf/q0Nqp2fQv/aKVDYoBJCkSSIxI9fIY4Cn7L3+0zwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIqzbibFkOACUGy5DmccmAc6BQdTBd07XjqiRwQu29E=;
 b=OPtby5Qf+vyPjn46j0i8sBDqZngyw+6U4lx3TbUTkzgXU+AghVbIleeBtumSU49aljlxA2OXSfjSAUwRFTkgn5P7y5O3AJcgSf0awdx8BPM/a75Qxl8zzBqWedmql+JaAGtgzMMKrPVf4lUxpO2Icfl/B4V/CMijn0V/6ljztzo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR02MB3061.eurprd02.prod.outlook.com (2603:10a6:6:1e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 10:11:23 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 10:11:23 +0000
Subject: Re: [PATCH i2c-next v2 3/7] i2c: mux: mlxcpld: Move header file out
 of x86 realm
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210122192502.17645-1-vadimp@nvidia.com>
 <20210122192502.17645-4-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <f4b8d2c7-49ca-374c-309f-c12ab9b6b9e4@axentia.se>
Date:   Thu, 28 Jan 2021 11:11:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210122192502.17645-4-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR0101CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::32) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR0101CA0022.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 10:11:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0ca684e-8245-440d-57d0-08d8c3751091
X-MS-TrafficTypeDiagnostic: DB6PR02MB3061:
X-Microsoft-Antispam-PRVS: <DB6PR02MB30610E97419D4A353B12EC12BCBA9@DB6PR02MB3061.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 98QOsKVrno4cpFwOOI7KDwFdnscARXJtrDzkmScK6LLWVEm+ny+C7nCJWSCvs0vO09iHhIE2WSa+mHCwJ0hL/195ECLSHwpb/IpUXPolPQVRDlpa40RFoM+KUDf9oCOv7ROHlrDLdGJFZPkedvupYcLxLDXLeZuNFWf8NBMFP6/lkcyaHLV2Y8NKiqSu/NGasA57xCdW3XkyVG+jzTJfLFSlcHMiqUm5Kw3oo+OqjPM0+EbnVQ5n3G09FLhxzttKxsfnlZjhhEQVYaCP/kTWWrTeeF2A77Z4ZWvSQD3azkzxoSYDe7V4t8nkwShCTdwYiccs+eE+qdevp4K0GqBwlBaWnO6K8p+L2pg5rwX+654cAMFBNeHhy7BDV7Wg8DrGugl8t5naqOCDkvh7zxiAEWj5vb3V5lWmKVsmOIT1Y0gSYe+tNn9NsW2hRRSkPNKGaskHVtkxpjHGhZxyH6RWx6axhSsGyhQtIL5fUuJ2wXl7XVtqnyx0YopmMrKpyPEkRHN8lp9D9ga1EHzLt7oFnUw8gIL1xlMr4xXmiyV8UETzBwRvbGBm+HgPjaWTqxD09yBUztZ9Yy9+13XJ/vusgu3z5z704CKecBS+aYUsZ40=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(396003)(136003)(376002)(346002)(366004)(16576012)(66476007)(4326008)(86362001)(26005)(8676002)(66946007)(956004)(478600001)(2616005)(36756003)(16526019)(31686004)(2906002)(6486002)(31696002)(66556008)(8936002)(316002)(4744005)(36916002)(186003)(5660300002)(53546011)(133343001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: HtrC+fQEseoynbYq7FhgtF/9BwkHgvwXSklgxpTkhJNsOb+yQNl38H1a49yaknT+rDymtZL7gYwdQiqqRCQnvWrqSMTf4qP00qhei/ZsKpF5sQHoikuh3bC7TSnKkBLjVDLDfAzGct4xV29am5YpGBQyAXev/qgw6f7ICqbL7YkzF8IsMjz/Env8o4fwEpC4F79xciCOF/m1+mI7S2yS8DxnZdvy1/pwa4HNa04zQQDSjxCtObhtlDiwL/FlXSAV2XpnJcsZ0L9LhVxcTFoiqalH2ViqALRSolJowY4TUT5bKplHuOKGkIT8LD0J0hhhc/DcS6nxl8dLQqksiE1gNCdfDLINrTa5xQvgIsHTNMzPEM1k/7/xBhpmnZDOHELXutFKomwt0IWDSnzb23Q/cNdH0ClBlP5h4DNUKoTVra/HssjgF1OA027t/7Wl1VfjBAGEOhCZCFQ8yDUqXLHExJL3hS1g5bvFOKwYEPPnwlmcRd5Mj2cCnsGJRYG4rj2UjyUlegXcdegMEj0qD7VALti2jx+eELtof16HMsoX78kPr0+fv9WiH5Tl0LqE5jG4qILSrLFbhYmW7GYrB7oR/JRbC5z/wHxQcQYBCqGZ7n96Yf1pGQ+RyzD/PKW7i9asSRb+nTpeKCZP1zriB9GxMYGsq0zFRK+UzQGk6ZQy8UXgNMCPZP7apqJJZ8jHvjMI4KfRup5P8EXqnHjEY2qZYKliZue/OxH55FgiTNkOKsjKxhPU6AlUughlz2DTBMJ3
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ca684e-8245-440d-57d0-08d8c3751091
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 10:11:23.0655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVg9PGfLxuoOBrJ0MlqZPKFYsoxRep72zmsML17+7bq3MMYTw5wsrBA8lVnyyI2h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3061
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-01-22 20:24, Vadim Pasternak wrote:
> Move out header file from include/linux/platform_data/x86/ to
> include/linux/platform_data/, since it does not depend on x86
> architecture.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

