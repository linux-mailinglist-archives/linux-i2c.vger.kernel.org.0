Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3167F1C75C4
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 18:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729431AbgEFQJJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 12:09:09 -0400
Received: from mail-eopbgr140127.outbound.protection.outlook.com ([40.107.14.127]:13734
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729418AbgEFQJI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 12:09:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+ilGYOXhV5Ycbg9HN9J1URWPJJ1opslc0kNsxNYyQRMdMqfblpH5nUjN9Tdy5HooZn7sl2D/InQLnFrW5J74LMifuYeUrMGn5anlSuBGbUY6se4X1Oe8niCLpcqifuNRhfzFH6Zn+JX8t9BdtNDinjSEKR87i8q7Ymt4jX4qsmUbI9spNjnoZK9TjoFqHtR2ZVOFlEvKkNPXo8sjXbYeWHMqm3hDdg8zTxYUgK3ig7jOo+nrTgoLbhQ3fHRjSzUCcDEYyEsF/OMdcDMz663pVCrnrR7hAfJQEa8MNkhem4j/tZLNXQQRU4ZrP9bM85v/IYg/rRVahNib65rZG/LKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bd/+b43l6NnAq1JbzSiU4XsteTi9KKVZ+GnxceEzFPo=;
 b=iELZBjzGr012AmLNrKKtk2PFrtx/HeGEgklf4YLKnyz4TUSRlErUOXczxp9ieaft/r0t6nY47T6FWAunp0RWwzu8WB6JUKUBbHfUYlB0dBdt3lmnDNasS0lBXE7zP3HszpSCX+dPcBYqW7cU20w92pRnqsO6eGkga2pRDc1Rh1IZvYNcyxbn3ce85RBkzXf9ObtDCJsdK2WQPA89CUTI1bRsBNoGH5QOnMw93rVM4MXTi08Xh9hCSBM0f8SPwiDau7ZMFtOeYddl7VRlh0WanXy/fqzKJRD7KGzfGT8zYwOdj8d3gDS8lwWqTpORno+RqbMJpHY0Bxkqow1wRXSc8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bd/+b43l6NnAq1JbzSiU4XsteTi9KKVZ+GnxceEzFPo=;
 b=EiM0k1QuT0WDxKH8LCHXwtySUQKGyblKfyuGjknB5RwtiqyIQ6tl7QD4B0dsvTxvN5jeBPDLMvyQ0DWcS+glLZaZ0uy7XYdNE+zFF7JZeuCQyBNA6bqMhdatwNi77b9zrAuCskTEXWSfzXoeqm55tHIp9uBfLSpLR05PT9QDj5U=
Authentication-Results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5708.eurprd02.prod.outlook.com (2603:10a6:10:ed::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Wed, 6 May
 2020 16:09:04 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a%7]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 16:09:04 +0000
Subject: Re: [PATCH v3 1/4] i2c: mux: pca954x: Refactor pca954x_irq_handler()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
References: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
 <20200506124242.GH185537@smile.fi.intel.com>
 <5f4f3714-e37c-d2ec-51eb-8cc3c9dd57de@axentia.se>
 <20200506160609.GN185537@smile.fi.intel.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <9192c5a8-5ce9-2454-1a2c-be8f20e59f55@axentia.se>
Date:   Wed, 6 May 2020 18:09:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200506160609.GN185537@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR02CA0109.eurprd02.prod.outlook.com
 (2603:10a6:7:29::38) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.138.116) by HE1PR02CA0109.eurprd02.prod.outlook.com (2603:10a6:7:29::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend Transport; Wed, 6 May 2020 16:09:03 +0000
X-Originating-IP: [213.112.138.116]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c40aac4-d77c-49ae-586f-08d7f1d7cc2b
X-MS-TrafficTypeDiagnostic: DB8PR02MB5708:
X-Microsoft-Antispam-PRVS: <DB8PR02MB5708DA36448A4E0159560E35BCA40@DB8PR02MB5708.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jVX4DGHCXbiW7r0eX2415T34X+hUS40+HSHF9uLyyl1znJHCTsfXh/lXk12LPnoKmJlPRtHQjCUcQ3KbhPS9QfNV46gFnri95k80oBU5FFa3sIiYwB21fWp/59tAz9pepoPXHOPJSzr3EN5Nlf95Xs9bMqReOZlT0eP2PymadSLaT7SJ0+Do13PB8YyKflX3AZzDo2Tl3ckkCYyoEViHzgX+0d8W4qbfxOYvUq3hTkrHnhuGgWQZkrsRtE/yCjGB1DDaN9q66uC3Sv9BasnL/2PpzvIcAvrraiR7Au1654W0nriQutzi3qW5Mnd3m2rWfoN+076wt1NaNP1Rm7q41d8J9W0pXnM6HBHpTFs/2FDGS+jRQIgl+FwMAzvwF4mBcM/Zv2EfOIcaBJJL4VqbXmqnaGaL8Tjj3EhI1FhjQAFqRzAZB7iinWxXCh8LILFwMjkFv73wTFkIHHd8l0m1XLLibnjhNQUDSD37nDcHsF5jAz3z8CF2r4sBQsqfnJ+/aXMMVB3nKDf29Rd7w/aSu6xqaxAZUXCGUf15fOMaqZR1o4QZKyaiwpQO9ZJChbVQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(366004)(346002)(136003)(39830400003)(33430700001)(31696002)(316002)(5660300002)(956004)(2616005)(8676002)(26005)(33440700001)(8936002)(16576012)(4326008)(53546011)(186003)(16526019)(2906002)(508600001)(31686004)(36756003)(36916002)(52116002)(66556008)(86362001)(6486002)(66476007)(6916009)(66946007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: BOL/56TgXx3DG1DhhDVdSQBHAwXq3HpVaMW5a09L3gkJBC2YkNLg5XbORKhj1famzlkp6Fd4MoFx6VYugnOHbuY6facCbAy7pYjCwyFfOyEwHnCywm49d1wBDQNnu/ACvqh058su47Qw5eXavgYauuaucRXJsNnZOawwRp8liMf6VaL80uu75GaFUIFTQkZZSstAnSGSaVImoTPOfZlviMaUlJBANE5/+2d+/ma1R215iRBHWGk/ScBweb/uF7wWu6+zxWTz2+HnOIAtXwLayTV+MKwEgIyieOfCIpT7rHtgQHbfRKMZdwi01fdKYl5P6xzQpdNCH2YT+4olN9I25aTC0AnnyWVY7zTb5KLwdRTU2Z7eQMRujjFOPcM27ok6Gb5rXgYiRG6OaMgLHgHB/CvbD1rqTYjkaZaqp2kxSG13oE4qHXfbDjS0WIZ/sT9wo+UwihHnjuWFRQzQnSuLxmRVqJczfewAgLun0SlmnHCngbu8N7ZsQYMDZkTQ9VSFGbvdA40YRveFjENElRI9pqNr9p1LU/IxN8p3QNSB7vseQbgjTyMY1dTP0+eXvI906WPkpVvm8LdvnQ8dZs31BuWw49GuC8a4/SV3ec7cQKzJAceS1jIxN8IvxHdyE3RcErOV2oSc4fAYvPOPW+u4HuJBdJz4Dk/AU9Mfh65yYyXvbRLKrf/y/LAH2X0AZ7cYydx9suc57TCvO6HS7fb3hq4sA/ukSA1ubf5q1YwYxyf3mFnAkGrzSCfpglacL9Mo8oxLODMbGvdsCaTEIYLwBfBFhuWjn7JpvFYm9Ayfk7kcECBAKolF5v4E2TvNia7B
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c40aac4-d77c-49ae-586f-08d7f1d7cc2b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 16:09:04.3079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pS6suCQmZlRb7Lv/9uwsn6vHfQaEn1wmAnWyo//XGjsYEzYnX2Ic5l1d2QBbfeZI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5708
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-05-06 18:06, Andy Shevchenko wrote:
> On Wed, May 06, 2020 at 03:19:29PM +0200, Peter Rosin wrote:
>>
>> On 2020-05-06 14:42, Andy Shevchenko wrote:
>>> On Sat, Apr 25, 2020 at 02:51:49PM +0300, Andy Shevchenko wrote:
>>>> Refactor pca954x_irq_handler() to:
>>>>   - use for_each_set_bit() macro
>>>>   - use IRQ_RETVAL() macro
>>>>
>>>> Above change makes code easy to read and understand.
>>>
>>> If there is no comments, Wolfram, can you apply this?
>>
>> Perhaps that's best, I have had the intention to get to this for a very long
>> time and I'm very sorry for delaying. The number of patches for i2c-mux is so
>> low that I have not bothered to automate the process, but that also means that
>> I have to sort of rediscover how to do it a few times a year. It's simply not
>> effective...
>>
>> Wolfram, I think it would be better if I just quit my i2c-mux tree and I
>> instead review/ack patches that you then take. Would that be ok with you?
>>
>> Again, sorry for being a road-block.
>>
>> Reviewed-by: Peter Rosin <peda@axentia.se>
> 
> Thank you, Peter!
> 
> I hope this applies to the entire series?

I'll reply individually now that there's a plan, this helps Wolfram's automation,
I think.

Cheers,
Peter
