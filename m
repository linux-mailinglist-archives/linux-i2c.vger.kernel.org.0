Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166131C9EA4
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 00:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgEGWpe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 May 2020 18:45:34 -0400
Received: from mail-eopbgr150092.outbound.protection.outlook.com ([40.107.15.92]:8262
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726437AbgEGWpe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 May 2020 18:45:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZDc8P+fWb5HwJBUSQAkpCL06WeY1uRQhJ8ABdoAqA4IGHt6eV4k2TstyRS/l0UdN6/Os4dvRhGP8Zbp2gXoeoOG0ygF6bNEmhHhQZR7/j1ldV3JPdu5OSognQ3neHhjjluNtA955255P/if+avADlHcG1OvxW1lcpHVVRiupddyoGJ+RKgAwHqKy4ExP6sX+D3l9wYeTr/LfvQ/pSw29PAycUgLdjfXiYZ4eU6xr476tJCIeRia3i2YNe2CrtU3WtiL0qkOcKwjLRWmHHTREZE/BH0iJf1iEpe6p2LY5dyIUKjv8bsydaZnRMw54Ff84BABCfg/JpRXLx9e4TVNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p36p+AhKbVS7HzPX/JzWfDMQdO9tvi+9nlGeamozMqg=;
 b=caHKq9MlPDWYsqddrG7UQCkuPxGIJscapQZ4BNon9V2gC7sST2KXbPWyi3NPHX8qLhs8eOHxAiJLpOTyDKvARiwg1wCY1LanzlDb64ZbR9Zfw2+t2te4Cq9jNzs3L3mGJGOVfiqBz8fsZSPw98B4bUGGTLmEDZVATC33czVCMa01bzdpz/majfe4oRXWQNqEZQuU06b8OV9BcFDpg4fGDRxdBNZ2SduoYfGBoaaLVMsxeBqmmZzEoM6Pg+gWkAqCx6PEesPey38UTysiul8YkIiAj1fBwMwdoTIZLSdIWV6BfGwLK5BBveXJyCZJOB+38SfaEn5jYlCo1ejaMjv9Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p36p+AhKbVS7HzPX/JzWfDMQdO9tvi+9nlGeamozMqg=;
 b=Kz553Df3mPaHoA0gwzNM3ua17wbrnmCtI9DP7K5Ac0JqvkHMn2v3cqAGDr0JjOtmLuD5CtO/rW7XtvTLjROeeVvkvprxtJFtAxkv/Z9QllcCr0wXSsWPvHlTRthMD1d6KImPRZ6XlfkI55sFbi5oZPObUTjRb1E5OvG0M2nkxMI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5755.eurprd02.prod.outlook.com (2603:10a6:10:f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.30; Thu, 7 May
 2020 22:45:30 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a%7]) with mapi id 15.20.2979.030; Thu, 7 May 2020
 22:45:30 +0000
Subject: Re: [PATCH] i2c: mux: Replace zero-length array with flexible-array
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200507185329.GA14436@embeddedor>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <f4496efd-f888-56bf-c678-1bb203052aa1@axentia.se>
Date:   Fri, 8 May 2020 00:45:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200507185329.GA14436@embeddedor>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR07CA0038.eurprd07.prod.outlook.com
 (2603:10a6:7:66::24) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.138.116) by HE1PR07CA0038.eurprd07.prod.outlook.com (2603:10a6:7:66::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.12 via Frontend Transport; Thu, 7 May 2020 22:45:29 +0000
X-Originating-IP: [213.112.138.116]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 765a091b-4a36-439e-7ad6-08d7f2d857e9
X-MS-TrafficTypeDiagnostic: DB8PR02MB5755:
X-Microsoft-Antispam-PRVS: <DB8PR02MB5755A063458AA855D27B542CBCA50@DB8PR02MB5755.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: unMc+wAaHKNvG161RrsVtFXJXHHnjrGBcjBkepDuxYe1/kJo3DiKii5eVqD6Dghiv+tthqrSxcCNlTr7rn0kRMVC+ktJbAPAZBhlysAF4wr+bP6RTrkKWNiA21un5w+klsRuciCJ9/Dk1OJlabp/LX3WcSICNDbeO55pOEsaHt+Q3o/cGZ67wxqGmOGQ1lmoTvHxIxKnOuJdYYg3A6NkXJBjrToJsE1h2Q/iVm5QQV7Yj3mWvmENnXMsEYCzT2XY5F6gzitnZxQBo3dSfB7atbAKwK3yA5W8nkXl7PtQ+AEjFhSFjscy76oPaXjVuy0lO80SeRZG8WVs1dv3/DGO+czjioogr5KNwZCksz6vLjN1iOlxbp/Z/PG4rUsI3VU/iEr/bHnHQYUK4DQ8v/rw8v2GDdsuDZseI7uB6fKSW+Z972ENw2Y9LQbc/msa7NqejQ0d07FPpuoD987zGYHDRhY8DEJEyIzQ+YL356zzQ1G/1vmsEGo2rWP9VM29CKUiKR5yrLrdhxbeXHhVJ6kDVkNH5OjwdS8l5r3QgdP6FRdDEWi5uhxh0+ihOdxZLKcu49xDe5N8yncdeteuArVcL+AGMpgI2WFohiVz6FRw0IcNqfxMCnYQIu2tCsmWBcD3ap2rx+Zk798SKx6kpYbqrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(366004)(39830400003)(346002)(376002)(33430700001)(16526019)(16576012)(86362001)(66476007)(966005)(186003)(6666004)(26005)(53546011)(52116002)(6916009)(36916002)(4326008)(36756003)(5660300002)(6486002)(33440700001)(66946007)(508600001)(66556008)(2616005)(956004)(8936002)(2906002)(8676002)(31686004)(316002)(83280400001)(83320400001)(83290400001)(83310400001)(83300400001)(31696002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: lhRoM2rJjPLwZRUOfp0lOrXgfd2JR9yLBdMintXuFlCDaVmFRQf6G1ZBgrUT4U+lf6N6d2kelTK4mW5s+rdG2ydHnb8Ms/UxH9Pv11+DEjmA6glgCY2P+3+f5jMV6Hno8QdTxKovNziFRy1XSGV879KKMnaTeXxS2DUlHsJvR6eVJSpCFABMy8bu8sblak3NuQeHBkc4BvX0Z7dEdyxSAoJhfN9JvSxURDb0XAnSTWZ/EJXSEeRLGldltpwFXbEbCIBFUrWfQQJB+aCh1E/w/2HX54sBP/cVNgqTJAME2nWVe/vRakJLLAnRSOSt9anuGSFFpdTs+XQhcXPYIlceLyKddi5kJUAUdRm50AVdLJxFcqaYFTjO9OeHY5jAKE5ZubC7a2CX2QnpJAaT03kmll3H5ycLmA92mbH99F4x9ov0Ya94N89ZWn5v633hWpLo1wSe2LJnE6YWw3coGPZa/mkASDzV8BseHDvvIxAr/fnLFP0iioICHgQSUehIBnN5JnxV4mjXLfpkV0tcAZ87pa9DTBXJlyhoNvZaign35qD6fzTpqt9G2vIdkTi5i8v5+jyIQ3qrzU5/jF9UbvA3aoEmZSeWqRfAIwM9v8stIuI4FoaemkJE1/m9IDX+eaPURlsof61D2FGm95jbieveOzW1tK4sW3OA8OPkDNbJvnc4x4OdeW5tz4uXTOJKNjJt7ROMLQK2GBoACnmG5BJVsOZpor+JThoWEIAR/sUL249yfaCf7z2Cz5cjtw6+vhfpeSm06fZp9dQmQzxXoJ+Y7VBLrPt+Hc3MyHXFw5tJhCEO4Ey1XaYNlzEm+lMPZPHS
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 765a091b-4a36-439e-7ad6-08d7f2d857e9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 22:45:29.9860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5sX7BAeQ9weM89yynlYtNB4WwmY3kwNp7Yn/1T+d+wAFdwhCeyMM+Txl8tV4o9U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5755
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-05-07 20:53, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> sizeof(flexible-array-member) triggers a warning because flexible array
> members have incomplete type[1]. There are some instances of code in
> which the sizeof operator is being incorrectly/erroneously applied to
> zero-length arrays and the result is zero. Such instances may be hiding
> some bugs. So, this work (flexible-array member conversions) will also
> help to get completely rid of those sorts of issues.
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org
Reviewed-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
