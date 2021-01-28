Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E97307371
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 11:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhA1KLm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 05:11:42 -0500
Received: from mail-eopbgr10139.outbound.protection.outlook.com ([40.107.1.139]:60996
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231468AbhA1KLf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 05:11:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXofU4b6+UC5Koy7DOCMCv8T1MCZ1AjoxGxyc7f+5Hgs5e/otnEzJeaNEijY5DY8w4hC4CT2Y5MCk7q+lRkrC8hNjOOEkD5HXjew2mWuEXktHw71KK+ildJ9CvhakltAzLn8KY278VUm9awVChgPoXa8973oznnF1CMt/u4pNtiaMISegfEBCVyT4UyHLaI46os8bTEWOUmpU7+bBB9TTjacgEOLwZCAUmDE1XFMWxTlKOsyqsNMP4xzT+iJ1YKyApY9xQuYFdtEImIJWsvoAWi9UVBq+5p/SrBtB+2EVOvHSu5pbzFWHd7HcLgg8kwWPedmuCdZn6LA7xnSRp2W2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Opt238zB/7gS6KYma6h8HDJJDU25QCTd2AIfKbgo4pc=;
 b=Pz5CBg7VOe0to9ijk8qcrDUlZt12Hd7cy7TclVh88SXPO5AWHq175dEssFq85BwU2J3G+rV9Cbw5CZfRLWW/8t8RxFU+42zQ1Pgt5jjIzjPfn5jyh+TmTZMHgJpz90lRf0A1fb3QBZGV2G/5pVxAAb/zPDCk4V6AfkzjCyxIWE/bMlYSS5ECOy+gEmAysmq840t6+h5SXhQ17vi5CqcPycA3ea/+kHr6SBcZiyNQHue60yfM0uGWKiHzUA+ud3UUW5pHHxuXBq96IBaZwQrgKHwBisi9SqtDqJANRZSK845nbwmvE3n8CoHotUazJwGZnuw3L/M9Q4datoZ789Eaww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Opt238zB/7gS6KYma6h8HDJJDU25QCTd2AIfKbgo4pc=;
 b=RTzC2nfqiskMY9zMq4jBtLuSPyXlH1mPGfKGaDV3vjGWMmyVIUUHd290oZvSclr9MwJWa49zeti5La/m18G019BlmFzcuNSMnWMdvqE4CDlivdoL/XO9VY0ldU7qh05ErBp0wgQwhXdoO8Z+Q0BteoUTWdYFkU52CCZROTKw6oo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6248.eurprd02.prod.outlook.com (2603:10a6:10:17e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14; Thu, 28 Jan
 2021 10:10:46 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 10:10:46 +0000
Subject: Re: [PATCH i2c-next v2 2/7] platform/x86: mlxcpld: Update module
 license
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210122192502.17645-1-vadimp@nvidia.com>
 <20210122192502.17645-3-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <6d23cba3-ac6c-f209-478d-18bcb8d843c4@axentia.se>
Date:   Thu, 28 Jan 2021 11:10:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210122192502.17645-3-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR08CA0050.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::21) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR08CA0050.eurprd08.prod.outlook.com (2603:10a6:7:2a::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 10:10:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a3930fc-5330-46a4-2cd5-08d8c374fac2
X-MS-TrafficTypeDiagnostic: DBAPR02MB6248:
X-Microsoft-Antispam-PRVS: <DBAPR02MB624834D1A1750A6F0CF1D347BCBA9@DBAPR02MB6248.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZhuXdsUEeCU8CcS6Tup1sQlK519ol+CXb+cO+ImIAxb7QnSo4c9BOAyeSpbeVVUDmek3VmHbtihV1PZ2gOWgF14tvw4H8opZ6vuw6ytN20yRsrFF50co9d4IUbrpPB8cl99SWv+fOyg0kT2IxfMKvc6+2P3WaZ94VP4rYu8wN5V7+dpvuXSaafVlQWs6lCrsmQbJoGq3KI33XBLZAWeKc73N9tyReSO4wVlDNXce52sg+dh915/CxRvQOsKyqSVVcrIROduH++5syXvGs+tYfp2KRPJjlJ22fVE4jLBetduEdvp84nU2/rvmE5Iq6ZBRwhoXKsXuDpJo+Kj9G8grmWWslK2HmTaUGPI/2FQKjpSKeaSPenzvAHBBDHgLD3YCKd9PV9hGHk64hw66n3zb+t09/rCb3s295aVcbrblKpor5gd2rS9P0xa5st1zf6aLR1BHpgpeYofF1yywywf4rioKN9wKck5af1vBuosaHEOCVZoXWlbO2uparcbZnm4KBhtJOQLyNXF2fibW1S8DQNWuwOx2xYAWjdixJ7BXFekF1A3xcCVooBGr4cXRH9aYTtJWWTMKiPID4DFE0jIASVQ+49ygqbeIKn4KSEhjJht++o9wbaQTXbgGnZV4Ba1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(396003)(376002)(136003)(366004)(346002)(26005)(31686004)(31696002)(5660300002)(53546011)(4326008)(186003)(86362001)(558084003)(8676002)(16526019)(2906002)(15650500001)(956004)(36916002)(478600001)(36756003)(66946007)(8936002)(83380400001)(66476007)(66556008)(316002)(2616005)(6486002)(16576012)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: +Pj8xitvwzzT+aN1b6oNIjZ0cuAlounp7FgnaXGKNdXnNgMFO4R2vU92sPc1nWGPYkCGXELEQBrWFOCpCjr7E7q7FhDW8ooQ9DbY/zW3Q9vHyP3Wvtnj8HsnBiLzQS4gpCc/TiRakt8oL/9vqhylNxmh8h5mP0RU0QIo5Y0GDcei4SCD/TeOeHES6zHMsR05BQXRQ4norxZLtOChO6y4evVDFr0VwNmFKNWea9uWb9bzCaZm5qJq/wA0aEdABQewyKzDyqmkhFZ/TxfoZ2+fFpMZQkQMCWzjtFz1lVdYtPMzT05cmvFdrR7nX6iQ6qCsrV+W9vWKXp21YuRhC45PKiiaIbGWSMm5UkF1oyxZTgtt3V6f8I2O83iud9qGqII0FirvUYfsckdFqb4G8otF0PZr126QClwZsKs4R6DVT9OkYBmTy5cSSB3O8XqFuZ23DTziV8QbPyV2pPWLCZ0XbIpkN4WirDcNB6OqZgv5ZijaudQwH9+amImln5k/7CpQVQ/1aQLvti/8YHPmeMzHZH9sfjAcvuwO8ioOPgDEYSBURwJ9JaAHZ7OMU2t32uMUIUVz/4ADsJR7+0YOxmKEWfIr3OCf17OeEMvBNDjGt24NDcrtRHRQXyPGnRCy8KOEgDFtwQKVszaYuTFZfqNkRqi1bZmGPQABEXclPY+vqCMYmoJ432RsTUBZECHk1TnePqZE4kqkFNNww/AOYKIqfTnePwiniPaiClQ+Wz41AtuwIVAfSU5JUiIXxUI+3IoI
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3930fc-5330-46a4-2cd5-08d8c374fac2
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 10:10:46.6875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJwclcTt/iJbBfPrS/jMvMPDApJKUSliuK1oawLjmagDoG+5tKDWD75QLqCObcWs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6248
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

