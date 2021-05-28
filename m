Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7685D394849
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 23:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhE1VWG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 17:22:06 -0400
Received: from mail-eopbgr00092.outbound.protection.outlook.com ([40.107.0.92]:16416
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229585AbhE1VWE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 17:22:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKmMLZvsjhA/+sqshJyTTqD3hjAQDg1AQ7H4mEoe1YXavi1vcGO2Ygaf6W5WpiRQsOMxszqTdfxHZ7wgKwhfTo0slfY9YbJIuXgZdGjhO8yalnDfo/A6RgNT1zhsKCwHw9iXQBOhrcQjT5eEe+7v+ZFtZ3ZwA8E0+py+TvzPRza39j1AQSrhlH9beyTzYXrB85OsREfOsKYSkRGhzEbX1Im78IdD6SqSgqa3xPA8SsEkA/ltzS9XsWsTm49vkII/xb/FaOQOiAkvKvvQeUrxwb7dE1AZLfF681q0/0SVpqglb2JbgaqwyFluPFBqK2pDHLN7UzEh37V2klTAKIZ4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4y7TM9e08SRr35E00Bnkg/FsMVDCAsaoyon68p9Aqo=;
 b=c/MuYikcPVEkAIbuz2RZb6KNMFW2NvYDT0shInF5qonU//VVell//O5eirk6WjT+HJhAEbI3NHz1aPmEJ/KbeZUHbqNv2NaxS231AdSIFQuGdRmtnW0eQgxbwiXXyGlZCZ3NVqdrIKj4luutbaaHivt1/7Wb8sdKITlmUB/6uPEwdI1M50+zOps7hSkYitTm3GMynApqgU3/1+5LfxdazMbINpbsvOHxasmxc1eMD59KGbg+uaeweoVFlV39ta8Tc0SulGOKostOilarWY0rVEXUsRa9qBNOShhWu779AOmkbTses4a0uOjBcDLL9fipWs0FTvfp28IlulZScQ4t9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4y7TM9e08SRr35E00Bnkg/FsMVDCAsaoyon68p9Aqo=;
 b=HlUENQPTB9XdUeDgEGIe8mNLx0yhQ5pr++Xfsa9CPPiPZ0OLAFbE4XIq8PjFb5UWPtWxakQkcmXSN7c2GWEXnuwwJ4cn2DkkpH/I831jo053NbOy45r6GnajxQ5Xa7uV1UaCd6r6uY2nU66RRd/RtSuEHTzLh+0dKQjnnFlAyY8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB5098.eurprd02.prod.outlook.com (2603:10a6:10:74::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Fri, 28 May
 2021 21:20:26 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::d47d:ca8c:4fe6:3908]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::d47d:ca8c:4fe6:3908%3]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 21:20:26 +0000
Subject: Re: [PATCH v2 0/6] dt-bindings: Convert mux bindings to schema
To:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
References: <20210526184839.2937899-1-robh@kernel.org>
 <YLCtlG7covuCWbC4@kunai>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <1cc2b5e5-0901-f615-0484-f56427ccb9db@axentia.se>
Date:   Fri, 28 May 2021 23:20:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YLCtlG7covuCWbC4@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: AM6PR08CA0036.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::24) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by AM6PR08CA0036.eurprd08.prod.outlook.com (2603:10a6:20b:c0::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 21:20:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea8faf59-7041-457c-274c-08d9221e69ac
X-MS-TrafficTypeDiagnostic: DB7PR02MB5098:
X-Microsoft-Antispam-PRVS: <DB7PR02MB5098C1D4B283B7453A9F6D7BBC229@DB7PR02MB5098.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g1I0vgI7Alc+iDnafy4J6cFfwn/KC5YPbPLC8nSYTXmGYoyT9t6GLGsv0UeYAU5jh3/BlRM9oFQ0IBFI1FCk8OflcepoWEUt2e2OEPUH9qwSLUoBQ0uF57Vxge7qw6Kj7YIPx8dw20s9JSAUR0RdJevEbGta80Kjx5xaqsnJU+KZpctgJACCAa6eQih7XCdn9Lj6uFNaNP/WtnnL1Fke/P68ROx40O4j+45J9FVl45V/Gi/zo9/BwDgJLXw+Hv6HJCJksrAr4H3yh5jujaI+8dq5pvkTPdnDmBmBaiLKb//Uv6JFS14kq/GuDyWHjj4LqpP7OSqWtsxKfXNKI8s+laqIb4qnoQcLdbWyCi1sd9aXYXdgowAGFqcJVrnJYgbqoi6cvkUwrBC/8BACSBAdB82gBbnrYBzp4J7MPsBqfZxmZ4weFv8H4o2mBbxl4chs9B+IOp7wFgX097Ypee7luTfVYwbUi49duiqex315L/WF5jVIY86XVE+o61xUyiPwDKr1AuyEaWzPjXHZv2TOOapZPOVTFkEJ6UFTSyp7+WQD5vpeHb/pIhas+H9rMCXX05X9tFNB9KbKpmfdzIWdWbQfmmsvxKXVvo07lrm8ef5iC/OGBctN8B1GSWfWkhp+B5b5AyoHWwPURdlNMyn1hLvb3hB+c0BYs8gfgwAMS65QLeKEYJewGYO6cAa2O1LypHv6KkiYiUi/0SYYeLRzQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(346002)(366004)(396003)(136003)(376002)(2906002)(36916002)(5660300002)(31686004)(53546011)(31696002)(921005)(6486002)(8676002)(186003)(86362001)(38100700002)(8936002)(26005)(16526019)(316002)(16576012)(36756003)(2616005)(956004)(7416002)(83380400001)(66556008)(66476007)(478600001)(66946007)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?xTWosg9yOpaJFADvbZHYkHgtRt/uznsHeUXVM0G3tYeqwe51fKnXh4kN?=
 =?Windows-1252?Q?jjAUbOq5/ZgLW6zYFnpFu2rXaLcvC2GTyM6wxDa8p8/TE4h5TKXYe9Zb?=
 =?Windows-1252?Q?wCstGZkN7xq5QUOUdUzwVOziPNSzaTj22BT+BzZFmP79ohRnesx177ZZ?=
 =?Windows-1252?Q?XDqXYuUfTh/IfNGyAJSQJiKcG7AOCN9uyjm5++Pwz4++wnqt3pUompXr?=
 =?Windows-1252?Q?8QjF6h40qYFuzUXhukmScwLRSvoTSDjR6gXq5sffz52UHaDq38ZEvSu5?=
 =?Windows-1252?Q?ebMATpHsNBjL/oMA6oLRDQGvIHZCGmSNZ0OFYxC86Kfl2XUpoLyPasjR?=
 =?Windows-1252?Q?tCura9LpsTqIhAeuui77R4QuHvc4sT9sZ4JEUgtNdIOh0Ol0ZhlE2IRA?=
 =?Windows-1252?Q?Am0uHzgaUD7jPvFfAF2NITOc5G/rfRIHbJ8JZYaYr+RYw7m1T2lgS+Ft?=
 =?Windows-1252?Q?rVX+fhXEfIblZjlhLPDFcTzNUq7CNt6askh+MoU38SvSl7ywRna4INA1?=
 =?Windows-1252?Q?b1ymDGP8+j8kMwrfH4Y6C0cL/Xgkg9f0kuN2W8JVTI01a7Ux+y9pmWmJ?=
 =?Windows-1252?Q?gnNspqthbb1W/KWLlmO94pi/K6jUdO6hZ7gB0UqMi1w2T5KaFvifGiqH?=
 =?Windows-1252?Q?yk15Lqp5aQ2OlY4s8mVAvhe7gMLR5anGUBdGS5RNHt//xoLrfWtJxBjX?=
 =?Windows-1252?Q?oPqkNyXUexYEtj4uOLVMweoWBuuJqDg1B59DB9+lprD/CIGwzo5mvCc0?=
 =?Windows-1252?Q?06+7+fxpQ7aQ6L/uIhRlWJ3Pw1JxM8a8KBn0EJViiDsZKsDQMj433AZ0?=
 =?Windows-1252?Q?sAA4eT5B++QTExUN/fEL6bEcMDKrStlyTuQXyyAwbkfyFM3cRLoOlAm4?=
 =?Windows-1252?Q?bdJVehqAseOJDnKWNyRUFkRf1im8e8sG8jAKfDXisMstiM+IXPI/cneU?=
 =?Windows-1252?Q?+3rfex5XRwxxtOXhjRkZL/t1FmWjs1JqCga8J75B5vRJYo18CWazdveh?=
 =?Windows-1252?Q?KwvlMQDKU1TnKfKBcN3YiKZCuTUvhauCMdZKQGt+s5uJ0HTi?=
X-MS-Exchange-AntiSpam-MessageData-1: IrH4miI9P8pnvD7ZcML7/vYMfWOe+0bRfFiFyl4egkMnSQsXPU9LOfS9QBSL7+Y+8mfQawVz5aF3dhvWoUvZr0Xi09xydqdFwDRAGmpWhSVpBaZg5D6zuOojhvKIDrfHnBLpUr7SXO1R6zqQ0ZU8UgLHmGZghH6Cz1AI7Mog5KxJSyjsYsBk3J0a5L1z5TAU6X9lW1tmJXQn/LqqeVlh+BvGqkwhaitzz4n2PNN+WX06GaW7HMAD46UWLllbN4Cm+/60CAIOlgINLRNA2NiM9s2s+HfHvgYZWccVj6jBAbi9lK54wk7pAgdEab1w+q+7SuyilTjeNIeRJTbqDPEUSQsw
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8faf59-7041-457c-274c-08d9221e69ac
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 21:20:26.8687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zz7fcjZBi6z3aWguun6+MTMODMGzqY1/7VwcBogA0VIXjHTYU4vl5fJl2zmZUVqi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB5098
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-05-28 10:45, Wolfram Sang wrote:
> On Wed, May 26, 2021 at 01:48:33PM -0500, Rob Herring wrote:
>> This series converts the mux-controller and some i2c mux bindings to DT
>> schema. This was a rabbit hole of trying to fix undocumented (by schema)
>> compatibles (enabled by setting DT_CHECKER_FLAGS=-m). So this is mux
>> bindings, and then a few others that are used in the mux binding
>> examples.
> 
> So, I assume this should all go via your tree? That would be fine with
> me. Maybe Peter has some more comments, but for the procedure, here is
> my ack for the I2C parts of this series:

Hi Rob,

Thanks for converting these!

I can't call what I have done a review, because the details escape me, and
I don't have time to spend at the moment. However, from where I'm looking,
it all looks splendid. Ignorance is bliss! So, for patches 3-5 (where I'm
the maintainer) you have my

Acked-by: Peter Rosin <peda@axentia.se>

Interesting times, being a maintainer of things I don't understand. I need
to fix that...

The main worry I have is the comment from Laurent about the intermediate
"i2c-mux" node, which also applies to i2c-gate which has been converted
to yaml before and to i2c-arb which is still in .txt format. I don't
remember exactly what the issue was that made me add the optional level,
but hopefully it is as you say, and that it is only MFD-type devices
that need them and that those can specify the intermediate level
themselves. My vision was to always have the intermediate level, since
I thought the bindings looked clearer that way. But that's just a personal
opinion, and it doesn't really matter...

However, I also worry that the information needed by future authors of
MFD bindings is lost and that they will have no readily available source
of the information that the intermediate nodes should be called i2c-mux,
i2c-arb or i2c-gate. The info was removed in the i2c-gate.txt -> .yaml
conversion. But that problem is not present in this series, since the
info is preserved in i2c-mux.txt -> .yaml conversion.

So, please go ahead with this series. Thanks again!

Cheers,
Peter
