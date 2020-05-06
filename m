Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9356C1C75DB
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 18:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729403AbgEFQLQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 12:11:16 -0400
Received: from mail-eopbgr60098.outbound.protection.outlook.com ([40.107.6.98]:33157
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730105AbgEFQLE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 12:11:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V28dprQq/q6ssB5SNRxbBa+9V+aEumf6zD75skUhZcGQ0N6Lgw97b5wFqYFlsYJmZLbQBWbaHAF4Zgmx9fnvzQjtUMka/+xq/oxpOvunnrphjD7S5hRHfhcELZSRlGsVtKBIxk49mxCU0pAZInBKCoRryTqM2xTw//oaiZyIsu8tnd9e0LeAehPsHbp3BD7rUkA6i9ZZylfjcffxatG5wh2ekHHuxoJGQvCPPEyCSpFpUY0KvzSxyeho9p7DYgxX2TwBVTJiI5lr4LRSY/Up6JlVwqvvuKAmD9RY1FDpz+GvPAgFBS1xzfDkCNGFa28YQ7OH7QdHa26iFwumLu7hpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfiqjqTBnPaC471eE+j2uRKJg4wk+ozFSqol6uEvc0Y=;
 b=a/wtzUNzNbfCQG2moPUpx1ATBg9d+mrptk8XOTr8WODY8nT/dNwJOQMQ0CNkuXIgLG/4jGwPYbvVjAOozUONGYT8mDPenpquJ6cGzVSWxNWfE/T7CnlNN4xyMZrHh0xnpgNbzPTKMgHyqPpsmU9vP4F5aTEnhdOtpL147BDRROQ5DPnQxEu1Y6AJ+CQVGpw7R88bgB7756Pt6Q9mquEhSdjhun2DU5aG8t0DDPTVs6Pcw7bRJA1BGABIHub6UMo+Y1N6LCNhc4QypcG95Qn957/UPsOeCoAwi99x7Rt7JUkBmA4t1iyKv+e8r95tVL5XCjojZw9lrrxl3kHKN6HmCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfiqjqTBnPaC471eE+j2uRKJg4wk+ozFSqol6uEvc0Y=;
 b=Xolb+a/N4MEJl+E721OJf63/W3XMghCkemQcmbU9sS8u8fZwXA/+iC0aLVZgDcekmixjFfywJ53qWaAdq3rxOUWGxcN732/gLisBa7yza5DxiE/VW8AEZObjnFryEwznHR/bSpnFOD/yjdbLy/vxtPrlOhci6toqY/99KPx4/Ag=
Authentication-Results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5500.eurprd02.prod.outlook.com (2603:10a6:10:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Wed, 6 May
 2020 16:11:02 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a%7]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 16:11:02 +0000
Subject: Re: [PATCH v3 4/4] i2c: mux: pca954x: Convert license to SPDX
 identifier
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
References: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
 <20200425115152.29475-4-andriy.shevchenko@linux.intel.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <189d57d8-f471-8d6e-917a-e00e07ca0fd7@axentia.se>
Date:   Wed, 6 May 2020 18:10:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200425115152.29475-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0402CA0052.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::41) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.138.116) by HE1PR0402CA0052.eurprd04.prod.outlook.com (2603:10a6:7:7c::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Wed, 6 May 2020 16:11:01 +0000
X-Originating-IP: [213.112.138.116]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a665192-01a4-40f1-f67e-08d7f1d81250
X-MS-TrafficTypeDiagnostic: DB8PR02MB5500:
X-Microsoft-Antispam-PRVS: <DB8PR02MB5500E5C2639E0E26981CA1FABCA40@DB8PR02MB5500.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1pG1xJdE97kx/0hm6oU9epGfUyxk7Hs1wsUVDUfNHOBzvOSampYWAxkM76bsBII8b28yqott7ORxjhGujkoqTXS94o5xhgjVmabP8fU1j92VWy7p+oh78GU8C1CX+9IUG9sXywZmelhAxdyYQ2Keo+FyIrXWci4ehNErNfAk+EUACWkbYWM/3VqSJoBni26Vky2felMpdgA718ujRsVil/KK9TXBd5uy/YJHSzHPrZNYUAhKKYXwheAZUTu1h5/no0oWfF/7wJV1T4a9UqvrSZE7p2ULB8A9215zsnycxNFmGJvVs2hfC58y3hBWfF9TlVjA/BUWE2CIH7Az+3s7QUeh0Ssq/Lv4w/zPTZM3aRm57j7USR1vcI80gxV3Xe59tNXRz91jK8skRVco7HLzbHlmVhiGE190pOzGFqcp3EWdNx5JvLdcTNzu1kOt+qJeWaeokbPsWKeYKIdBPl9WEz6uZp04BwBIBEGjk392D27lkbpd3woQuALiScKMLQsYx91vmHwY9471G5XwDvvegFSJjdKqAFJNBWmGnykTWE5JbHIDsKmnxtZJSAOHEVLN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39830400003)(366004)(346002)(136003)(376002)(396003)(33430700001)(33440700001)(8676002)(186003)(2906002)(6486002)(31686004)(5660300002)(31696002)(53546011)(86362001)(16526019)(26005)(52116002)(36916002)(66946007)(956004)(66476007)(8936002)(110136005)(316002)(16576012)(558084003)(508600001)(2616005)(36756003)(66556008)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 1ZSJnWDlUirCWnLLlGi91zkwXGokj4bSHh8B8rDEpC7pzS+qdmUqsPByoE0aapLYtow4PKDmRgeZopS2xCUgO1LCBRLOsK7NHQdXgreylvDEIBz9S186K2fiODc4TTc9p/oSt92IaVx9/82Zh1sbKopXqKfBlgsakcjAJPPuaSlT24jQM3E7EOg55Sr04qGt0tbF4T6JYK+1XISja1V6/dZv/h6SJaXcsUhjf2eHNkFkpZjRrNY2eO36GN1uM2cYgqp9TM/h4+g6mpz0t0jaBzwVhxiRPgqoc1PZVnyUUjAizXJzQusgnZ7zGk3WhS7oWu9udW0qHI8UQMTfxtEknpwtXOarZ88qN1f46LYr6N+6Ue1OiGjWVx25LkpoPQLrGXOcSVYR/JcB7XGQNfmFmMVY9QR5h4l48U8x5hk6g8VCtCMQ1TbB20flEqZxtSV+MZr0oakK15hsT8PAIL2hKd83WCa7YQ6UyZnCTDee1zJxun8ZO1pNWC2Idl3+LQeW9AhB5rlptgZxaD1yCMDbSQwCInXTyOBsI40pEHss8Ygs5drJhMuw4smIGuouSUBWl/gP5jmXj1Vuhd/lARppjuuQ/mC7NFp+sbkqBDwysLaIor9Wpne14sa791V9yTOtbtg5iaVAoNfFN6FwRtBvNBJRUUsiDhuaXMsCB5Nb5R5epj1q72ik9OezzWOn30mM5r7B/Pqt9AcMn2fgS/TYStlOsaoeUyP5r+J1sYJPe0uUSpXAj5iyAKnfa2hDWp1PGr90h5ahaUAwsN8EUN7QnUYttMCXn1IaOEZjlzVC+2uyk1rRTY/WL+d8MHT5ZzOq
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a665192-01a4-40f1-f67e-08d7f1d81250
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 16:11:02.0019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvYSTR+ZseE3woL7w2I43BRLhkbmudSHLDjLFeLKh1a9jWxdI4rFdyBXzd/3rjyu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5500
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-04-25 13:51, Andy Shevchenko wrote:
> Use a shorter SPDX identifier instead of pasting the whole license.
> 
> While here, replace duplicating PCA954x with PCA984x.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

