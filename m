Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656461C75CE
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 18:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbgEFQKn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 12:10:43 -0400
Received: from mail-eopbgr40131.outbound.protection.outlook.com ([40.107.4.131]:7137
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729414AbgEFQKn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 12:10:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7e1v79DAe3dUZx6hTFyEfzirtqQ3tCGA1RjZAe2E5r7gCUP6eCJIRts/kwf4vjJQg/+bVQTJIMQcQF55bGE54S6f1JhXztvZtexjmhug71t4tKqLLO0t9PNv3VqeC1PgKseANCWnjWgq0okysbun/jG2yHTnwQVYMP32BPBq+hKMKgeEf6tKQz6BB6RJgqrfnWedUl4WZMqaJ28mzkwQ/IL2JHajH/WHEy4kPl1LoO3fzuiu3qIb7OvwixDNR8pMKiXoeCwHyro/bNxT7Yr7HgYfOx1O/50onISOR2Oo53GtTlo92dZeE7SjHQITUcge8IMgY5b5qdKcxUlazVNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wAwivR2yhJoSd8IsRTcbGL877cNEV2/FxpnnvjNEqo=;
 b=JSxrSLZWMYUIJ7mBVqgJzxlop7k1Qt2RB+eOWn8Q2FwPZb4JKciPf7N+go/0axtQO+nX9E2NxF6bhO4QIrE431kJ8rEVVMZR2j8mDyz7vKeMzjJ0HOxojSBi8jvmIlQmckaKS/Nnj0YtVmG5/me6XOn6aEvtniI6sELXeo52doXGYF5Do0w88IvW9vU6NbkD4jUSmnhQvhUT+iLkvs70feWVJQR9AhCXIIsDKpVkzG9qQjQF+QZgAamH67g9ITXmHItWiWYy5ZuvnuuzMtQn6FZMQkk3jY9eWHM67Kmz2FTXjmIqbTs2AdsNKZ4zriiGd1MQHRYkK7v64S9U0+GyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wAwivR2yhJoSd8IsRTcbGL877cNEV2/FxpnnvjNEqo=;
 b=ihsc1aH9dFB4Q9ZbhzbpkJx0tIO7NKjC3whwAts7y8JliSShrU70DYbEc2d3YGnQwPVaTdZwWaKBNwd3UeQ2ZtbV6jmsyC99VXDVTbuXCJU4xJhARLVodRU5VVFeP7/ZUkETuzMfWLWpT1zJkeYvrzScM2YgqkeiLE5k8LIhfJk=
Authentication-Results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5500.eurprd02.prod.outlook.com (2603:10a6:10:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Wed, 6 May
 2020 16:10:40 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a%7]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 16:10:40 +0000
Subject: Re: [PATCH v3 3/4] i2c: mux: pca954x: Move device_remove_file() out
 of pca954x_cleanup()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
References: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
 <20200425115152.29475-3-andriy.shevchenko@linux.intel.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <9218b72a-06a9-65e1-1558-c4c29b231b8e@axentia.se>
Date:   Wed, 6 May 2020 18:10:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200425115152.29475-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0102CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::29) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.138.116) by HE1PR0102CA0016.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend Transport; Wed, 6 May 2020 16:10:39 +0000
X-Originating-IP: [213.112.138.116]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f0641f0-4fa6-4ff0-fe90-08d7f1d8054c
X-MS-TrafficTypeDiagnostic: DB8PR02MB5500:
X-Microsoft-Antispam-PRVS: <DB8PR02MB550065BD712A6BEF4B25B564BCA40@DB8PR02MB5500.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9AXf+vk4yBFc+cFiGafwrc8iP7SKhs20S7BQZZ/nbS/EAFlRj1tIDlSU49LmKmNTfvyC6PQjVd57+zRFbwW2AGGwT0xXU8iQCoPLU16ZNZ+KQCPLbQftBOf26cnmyCZql6vW0soEf3I+udvvE6G3Nok+mOjEPxM0ssPjz1Cy7uDmx+9RzWho1w6i19DoKcFVScV9+d7+UpqDPnLQAfqCeS0jXg7ETbumrQwUmmkbLFMbr61wvbGxQoHwTkfGER+PYosggitkY86XAkDGCICQvbVJNJbZl1d0Rv5ddNosAvyeqs9HKbnB5AgE8I7buGzPo2SPmH1T6ESPfC0M/POBmJd4AWFsSzCAcHLCeLb1NGxtf4qwI8W84i49tpEi7jwWCnnt4CSo/NaDGM7+tqXFKL1ZBmJGkzVwGWU2Fu+Ywrnz8prBGsUo5r3oWJhpTgi4GvKdhDSsieeM2pzlmMZB3LSBrGg+EcgIGMALVhpWnCyr+n1rqaM8MC35c5eoKXdgIYc9UoGzJMesSDFP6IEGzh/w8beU1M9vuUzXoN0po5DRvo+1BouSq4vyby5K7I6w
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39830400003)(366004)(346002)(136003)(376002)(396003)(33430700001)(33440700001)(8676002)(186003)(2906002)(6486002)(31686004)(5660300002)(31696002)(53546011)(86362001)(16526019)(26005)(52116002)(36916002)(66946007)(956004)(66476007)(8936002)(110136005)(316002)(16576012)(508600001)(2616005)(36756003)(4744005)(66556008)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: LGIQqKGQhHbOwZ5R4TVISdtJ1uc3rQaxDnpaXf+sR99ArQOOCVYq2X/IjZV/N8zUY2F9NJzUgwLPT9usONumQgMFTVXpWjYxDkIpzthBT9eWaCvSElNRRvstMdjq0XvfxL8tsOTpEVe8SNSqFjUHHnSVlvX1bQa2dPBbOgzxceFavexhNKBYMMJv50z8WJpZB6AwjWKFjDVcz2tbhDbj0jBs8gPs+gKcMKF73OFeqa6oJC6ghNQPvErPeYrsAelV3VCxd3F+6dfprPDZYXXWktgC58eo99ml+Z5kjgxDJUZYq/FrW1JDM0murx0swtsZ9vZTv+3nwpfahwWb8feT3wfatQ5HQmNX8ZjpmTjqfecn7DXh5xZSktDMmvdT/F23J2L4p330Kc6K3e3c0zCyygarGCvZFdZVbs3EYexios4sXyA4qDKScKTk68FYPZGNEiZ1ebQZXmW+AxgOcyApnX/i/g1ojfbSW0KPD/qHQYMsmHaZSEoVhgCnv9f7v/cE73rH9yRuu9hmHBCkJODczy1tjXi/ULxXqvBix4p8M1P92dtlECi0YYtjuDBq1L++Yw4M20nmmuJHvfriNguZ1n6YgngzHaKpGwnfrmohPefU/qU1XUXd9/OVYPEK0Mfcvr2f9A+pRbZVrqdfi8jH/lhaCZMuzh+Hyo9ea0LbQXTEc1CUsjfN6VMfggYCqGDKh+J0lJBgg53Alrvm4pRY0fQCtQfeymrXR3/op1tVWmT65kp7Mezp4avMXTeGwyhQzRZCWeaKj6AS/8IX5lIZuNYQyBsMjeNkkhcVs23vmiagRTZLbllaZfmWuvwx/EXq
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0641f0-4fa6-4ff0-fe90-08d7f1d8054c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 16:10:40.3004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: US0SI8fK09Gx8HB71gWf6vJlRYbuLIIeguw9Za6cw1Jc1rrsEKTQq8b0yYoYTH+q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5500
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-04-25 13:51, Andy Shevchenko wrote:
> device_create_file() is called the last in ->probe() but pca954x_cleanup(),
> which is called earlier in error path, tries to remove never created file.
> Move device_remove_file() call outside of pca954x_cleanup() to make it
> slightly closer to what pca954x_init() is doing.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

