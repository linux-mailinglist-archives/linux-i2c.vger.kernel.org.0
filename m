Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC2B24C67C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Aug 2020 22:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgHTUCP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Aug 2020 16:02:15 -0400
Received: from mail-eopbgr150092.outbound.protection.outlook.com ([40.107.15.92]:19682
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726964AbgHTUCN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Aug 2020 16:02:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWXJs8BngXhpJQTdcp7wSpRmlnZy2a+SNQFf5lSTkuHa+WIyO0kd9zZEb4ZyCS8ou1hAjptVqpHq01wG5au6eC9RMqdp7NyTFz2SpgPgd9FZRqh8dhtyTdHZUt/7OeuvXz214GqjJ2Slv5Jaw4+bTeJDUqir1I4Ml/V6elb9xzvStC8oDcEvh8R7yjVzsiKd+Wb9mHIrUTkv+5j/S906wHBRiKyO7AzGcI3I3NYyMG078FjsIZpOVO18Om5KYi1fFT5kyXDb4sVVnwikgAXnN6bCGboEskApHNHfRw2lEX/mImjO8v+jzStSpNMdDGdHUOTjt0WqhAwqSojuR22sZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rIzOH591RLzTfwORSBhj9C7dQXBky3lEOhQdvmhBxc=;
 b=NachQp23uzMZNITdfiZGrNdmasXDT6hqut3G0hUt892yRixqEhi+vjMV8tA4ZxXHWi5hXLvWuOWvW080fEabHRqrGq7FtFEP/5OHJS5GHLO4wEx3/qxKCPI+4MmHvdrZttQmGPemmOxsN/x1KRwRTPXdLdMLdROAsQVZexq7g0WnUYnXF1M4AJ6YZtz+OugMEUWzf0ssy32BCZWJh24JtspH+38bjn1fKLN/wxIwzVtQpmlFySk4uo+4T/eYJ6+p7oGfCYyiwXlBsD3HE92y9osMCur25SPAM1wWT6OLCnNffRI8n4TrPewb9/N0UZUixSlD3JpibRtoGDUgxNwapQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rIzOH591RLzTfwORSBhj9C7dQXBky3lEOhQdvmhBxc=;
 b=CzPgPZP5jIlewpe3rPiyYcZzp/p94Yze1mJM0N88ET0iOk7IQJJtb11BaCIcMiZ1/4z2scvgFnNxlL/X/xcJObKSLwYYDlq0ZHbEZZlheLlKyRvWiefhse6lxaA5FJuoYBtyoss8GObHlfNMakT05BYH5rGOzcQufAh8QI2daeM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR0201MB2168.eurprd02.prod.outlook.com (2603:10a6:4:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 20 Aug
 2020 20:02:08 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47%7]) with mapi id 15.20.3283.028; Thu, 20 Aug 2020
 20:02:08 +0000
Subject: Re: [PATCH v1] i2c: mux: pca954x: Fix trivia typo: busses -> buses
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Biwen Li <biwen.li@nxp.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20200820152729.74944-1-andriy.shevchenko@linux.intel.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <44d27a41-9dd3-d8ba-eefc-da518df98ff8@axentia.se>
Date:   Thu, 20 Aug 2020 22:02:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200820152729.74944-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0802CA0014.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::24) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.226.217.78) by HE1PR0802CA0014.eurprd08.prod.outlook.com (2603:10a6:3:bd::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 20:02:07 +0000
X-Originating-IP: [85.226.217.78]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f1292b6-833f-417a-5cc4-08d84543ead7
X-MS-TrafficTypeDiagnostic: DB6PR0201MB2168:
X-Microsoft-Antispam-PRVS: <DB6PR0201MB21681485801E3AAF9CDEE2BCBC5A0@DB6PR0201MB2168.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hmm6d5Ar2+Kne8mZ/xWlBmsKLjLJVm3cdKqYdP3HBEb4Hib94nQBot9STAPteCKswqAqXuYza6m6YorBq9F+J08yLDXK7eZBY1ubNuqLJ11ozeTK2QoM40sYgMxFtcXIhGRIA2FZ7LxWS2aLTvqkDXRS2VBrMXEE6IBrD3SKysdIsqAcR7MYJ7fhV0s0FTGjXSO+e1/ryV+kwGPB0+2ZuSnI2rgdANJGdqxGVrD6od52fApwtl9UvqiV3mBUuCRYQE9zMPRY5ZGmnR1Jbz/0FMRIWgugT3BF9O6yh0jHzHxK2tkf3TwcfGp+psGIWHZ8b82560ohdRke4ZSj23h2eO+BU4LEBA2NHDNmdQFeuamv00e9tKaPZz3jdXiFW11W
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39830400003)(346002)(396003)(136003)(366004)(8676002)(83380400001)(26005)(53546011)(6486002)(31696002)(8936002)(36756003)(86362001)(66556008)(66476007)(66946007)(956004)(6666004)(186003)(16526019)(2616005)(2906002)(478600001)(52116002)(316002)(5660300002)(36916002)(16576012)(110136005)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: zKWi4u5El7ptYxC54BEjXsAL/qot6twm03lI5N2dClui1F9Ed7gsboxu3J3fd0rhw1oG/het7btZJ3GFo85CYhP6k9Lo8AG3gtq7xub8qrNrkFtR8yYXHAhSiZp0mwOw5oY+dW0jmgjqUExQchtV4iXRSQMgX+nohDPpeP+8b2MOhylYjvitbrY3UK9Wx7IcCFvwtq1iSg4G2oCVagvEkwFfFabLdv3bpil5yiy/NWccU798u7jNRwTPph1E3XC25M4XpXuCjsV+sJhhnp4aFPUfPpq2S1WyziM1/HvfiysJZs0d2UGj6VCRwAVUXEEBq21WPDkN/TWDip043lFggL0QxB6sY/OdjOOCK0EWB5zvOZFFaOK8yNN7CEgdO7ZZss3vbKlt7CtT5H9z96Nn/wGyANUhkKeqUMH1AfjrFEYS0DJjgLxj33fP4pgVYvHjPvLOM7UvAYVwV/CLXInnvHzx9FVKuMrTWdPVKNCQZYywOnizvxgV3zHaf5g+TDqOdeO9F8sQ1naWWl8KtOGlIXWhuDK6vOzZXc93MEvl2NdGc1BYMXQWHufpaqREAyqj3+cXSQILQE9JFqPLrNLYqkKJgWhdwvBqyjT4tKB6YDqG7kIFA8vCBEB3MJefT3bC+1VXkfles2Rq5h9yIJ9g7A==
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1292b6-833f-417a-5cc4-08d84543ead7
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 20:02:08.0881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gd8qGtOSkZhQ73OX1j1Y9Bgbt7xOB/u6yBApl+dpHPMfF1QqjGrBQWTpGLv4lq7k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0201MB2168
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020-08-20 17:27, Andy Shevchenko wrote:
> Fix trivia typo: busses -> buses. While at it, rearrange LOCs

I don't think it's a typo at all, it's just an old spelling. Not worth it
if you ask me, but then again, I'm not a native speaker. Anyway, unless I
get more input my call is to change this whenever drivers/i2c/busses/ is
renamed...

Cheers,
Peter

> for better readability.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 4ad665757dd8..dbf98d0aa656 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -510,9 +510,9 @@ static int pca954x_probe(struct i2c_client *client,
>  	 */
>  	device_create_file(dev, &dev_attr_idle_state);
>  
> -	dev_info(dev, "registered %d multiplexed busses for I2C %s %s\n",
> -		 num, data->chip->muxtype == pca954x_ismux
> -				? "mux" : "switch", client->name);
> +	dev_info(dev, "registered %d multiplexed buses for I2C %s %s\n",
> +		 num, data->chip->muxtype == pca954x_ismux ? "mux" : "switch",
> +		 client->name);
>  
>  	return 0;
>  
> 
