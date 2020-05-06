Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7E01C75CB
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 18:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729418AbgEFQJv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 12:09:51 -0400
Received: from mail-eopbgr40136.outbound.protection.outlook.com ([40.107.4.136]:60420
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729414AbgEFQJv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 12:09:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfQkWX/ytmMos5BdVy881j0P3eRCIHtUjnsJPE6cXl7MIF2H+d065U6VvisXaObBNzrIZb8uyiRmkoCFhkwENxvESq1EdrEHDjZCPJTk+yIUhMinYayW1JAwzUR7FLIJDCgQ7bYGfB095GBUBRg8RYRBEf71c86762N/trffbrlbmjKAdF8WEjQLQRrbwzkvBtZLG8GLwqzEKtzwU3Tbhi7DdON+Vblwo5YYCZOIr0DjbuWfAU3ICfL0TJd9Ed6AuPtBpw6lEyMrZ0hY8tUXGkFfiQVM1W4nAXP7YSgNMzuLgZidlYtBih7DsJcQ6jWOzkFxvyIbzBBv48dNUeme0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOV/VVZ/Q09/80ltWwnoMxhHjF1FA3AwU+WydmeS84s=;
 b=Zc3GdzSWTK9crq+6nrYGB/F0wpvQXOc3To/+v2f6RP2ub035zUiYor49BkkSI2qQAv3bRv9yNLYtZx49II3vMwoR+4i3J/Q5ZUMCMi0S0BxUIZ78NimIZf/Mbm+48TOBNQMg6c+ubs6TXUHTCKEDO+2O9rRRcQfxOubSspWFuoJmPbKh37o24mJ6/FXzDrWCgXqMF2MEoLUWoT0Fh6cRRfiWzsrHicVBnUqpir3gCxyZ87BJ/w7acz7+kRivgSer1ZB6xYEHSpiDk/RkNsEw6ZA9HijpnAA9yLZdMw1ODJ2gjvolgvSYmVlnbod9w5/X6ZfyWzMDUA65A2Owjbc8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOV/VVZ/Q09/80ltWwnoMxhHjF1FA3AwU+WydmeS84s=;
 b=XojfUzsbm+r6mGZFXT2XpaOx5r3oZf49vpmSbwmamGOYegI80wUccfWZxAjSplmr4tOMhwqj0NZK5F7qz6RQm09FNJKeHxGjHRYzzBWsPLrMdmVGc7pWIYqQ9m19QqhJyJ8na/Oz5xOvFO24IEWcF5LA6rFp+4Wud/p+ePSXQ3Q=
Authentication-Results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5500.eurprd02.prod.outlook.com (2603:10a6:10:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Wed, 6 May
 2020 16:09:48 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a%7]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 16:09:48 +0000
Subject: Re: [PATCH v3 2/4] i2c: mux: pca954x: Make use of device properties
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
References: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
 <20200425115152.29475-2-andriy.shevchenko@linux.intel.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <8b3788e7-963f-adfe-0427-bad3bbcc8c4a@axentia.se>
Date:   Wed, 6 May 2020 18:09:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200425115152.29475-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR02CA0119.eurprd02.prod.outlook.com
 (2603:10a6:7:29::48) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.138.116) by HE1PR02CA0119.eurprd02.prod.outlook.com (2603:10a6:7:29::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend Transport; Wed, 6 May 2020 16:09:47 +0000
X-Originating-IP: [213.112.138.116]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb609f54-d1be-4819-169f-08d7f1d7e652
X-MS-TrafficTypeDiagnostic: DB8PR02MB5500:
X-Microsoft-Antispam-PRVS: <DB8PR02MB55000604162179ED15FCD238BCA40@DB8PR02MB5500.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lEHHl6h/6R/jPzLXKyoIS0tr2eWri0xzWgnmHV9ciuTBaVMUxVME4SQYT7+3zfzjEYalizdmpiL9CixO5G+R8mT4hm7YnJTYL51+OJlpCXbbo44CNtRbmC7fO4q+HuoteFQ0ssqieUuB1JD0lPrOHjU1oFX2hXr8M/8RbGx7xzxUfOZJraGxlkIgWdlNSHgjMj4PcSErvv5kcBP6LdZTcf5Zi3jjyv/Gf+N2bbZX4zbPhe3wrgqTCkvGMIeSzQgEqXsRbeQDjYt7iYjbMAo1zLhyCIY96KGkevg8dvFjpD4yEBva+rsBlfgnt6dg3R0G1IclsovNtcPsw54D4WPIxHw42SPzKLzxThywEuVAk6c5nPWRtp9Mx2iBShmVWr19Ht3uH82JP5VtaYC+aJzK+5xG+/cUMMWxP2DOum3e3NolmHvNqTz7YtxKtd6HgAc36kgWLx8IuhiScbpzEGMVfmwHXPpvRrksAiaygfDrttCrrDy07+gN7RXwlR51ST/UQDdRYStcPV74kHnHm4617jOcO53mWGq5ytiEk0j2WsLXTIq9qhWGsWyVSPcfEcye
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39830400003)(366004)(346002)(136003)(376002)(396003)(33430700001)(33440700001)(8676002)(186003)(2906002)(6486002)(31686004)(5660300002)(31696002)(53546011)(86362001)(16526019)(26005)(52116002)(36916002)(66946007)(956004)(66476007)(8936002)(110136005)(316002)(16576012)(508600001)(2616005)(36756003)(4744005)(66556008)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: i11/0zrBzoXkPbCCiXtmjuEG+/+sNTwTCvjtsQKvAR2adqF0fdxnfYrcl+jUmxIay/KqJGWeBu28LPnPc7wP26YTArhNMwkQ7krWCYebgm79sOhXafRmYhtXqv+0T86ZvpzqEhtzrccNRtQJJltEfkSH7QNlfOR5+ElJSdCeML5uk4AyAQjAiK2SPblcaKAOPSTmfW/zWHethPXtJOpHDU7HCbv4p0W/FLKsoN6EYwW0ocIQn9OolqXfFuC9TbgiJU0vcpHINBH68mmfeWbeCz8LczJgFkZax8mQEav6OmwFK0yOyAZswsuZStHl4rQi9VFPIY5gaHGHkI1EWmZ/K3cpwwzwlqXfG70k1iINbYpEhtKxhUjiTIEX/hZ7KTYdbCce2EnrEUVNmjn040QaHPx/yxy78ZVIlXJITWO0GNgtxI2V0g1JLLnJGJechufY+G/xzl5vJu4beA1YZp6O0Sn/njH7lCM4+heSC8htqqrUscyzdsnQZaRdR3eA2//ERnODEP7DUbHk4nVptiKi5/0sdB24tcWmulQZKligU13LKqLqT7A4s2Gs7fMSw36wau1Vr65LV36+9UyaxplNS/MswbJMjhEjAFe3LilTiggKexCKRiOqJoW6y1ResxkeZNp8bR9UVs/MQAMOBp9k2slp9/neb9TPBF2Tbl1RE0DAzAfKBZ1dgbv+Iv5WaASWaLCENegxT37lEscnhHS27ioNxHl0kAC4GJyd91HPCPJTpL0HW8rKoiIwoD+7Drg9jj1doYjn6+VwTlrRf89QhEEKzdVgRNQnlF4C1Liy6IrPD4mzBKSK9uNyFq9R234x
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: eb609f54-d1be-4819-169f-08d7f1d7e652
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 16:09:48.2985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiR+5IR4n9OGzaCMGB6Lc4CVMF2gG+H8zgcmofAblcQHbx/qJRroPIGt6oaIbdaG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5500
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2020-04-25 13:51, Andy Shevchenko wrote:
> Device property API allows to gather device resources from different sources,
> such as ACPI. Convert the drivers to unleash the power of device property API.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
