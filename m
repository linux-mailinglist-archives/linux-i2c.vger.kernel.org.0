Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788241D469E
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 09:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgEOHES (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 03:04:18 -0400
Received: from mail-db8eur05on2126.outbound.protection.outlook.com ([40.107.20.126]:62248
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726434AbgEOHES (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 03:04:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iANFkyH4mWW/yqZ9GP2ooqphqF6LlqhFqt01JNEUhbXR/jpupMsjNGwwAuybpIxGEoI6hlTEJ6U+MMOCGczyLAcsCheJpY+d4bwda33jTimfv1NxqTVbN6gfJh0Jm7PyHrUVV/KHjCTQad1z+raIpWASqW3ncM8f4b0Al7LqiYEU6RflFVnUhMxEVd9GX5HZQavu/tABMM2U4upcXSp2mG4iu9eFkACc/rutpoZXKCs/EgmKZS8sTsdZ7kH9BLxRV4wqT/1d1bE5R9jqhE5fOx+l8ehKAW9MLk+MfRH6OW/j7NCbV5Cgkcvlh7zr7W0V/vV4sbhoLovOWPa4XBfyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBwR/7sRpzGNTiFL+iK7S2S1FzxN/+C2wJGLgP8hm4c=;
 b=gJfN3GBGM4ZHR8UU/ARisaAri1ICE42sA0hJ2xAd8nFTU5Dt7lDbs+N1K9fFeEvsAmLKB72620vKOCgUcZQaiLLzzVZyi2J0EA1c3rduhWoRqxLGEc/Wi+ums+lOtA2Cv4AlLJaH4rBge68l9SLyCyvslaqV2/J8+Q5cVgAJYCMW//kxCw0zDE62QeYxxNXk5PZ236OlRj/08XMXfnjIldFp6st5FVWkg0r9bxZ5DywxfvnoybHIhg6yh0znrdp2kyVkDdc2ddLvverCCPmS4Ab6c8Bs06Kmg/bdh+cT6L/m/L1xCoWj7PeNsMwaALJ1auOVQJjzuSsC5AIHKDFKuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBwR/7sRpzGNTiFL+iK7S2S1FzxN/+C2wJGLgP8hm4c=;
 b=SIIeBG5tmNj+kQSsqYRhXnudU/j/JLLSwDneXBu7O1hlUY4Tmqp2NksMtKhRVA6oQao2q/E7EvoB0bhiYyuybRYSlo8VqOwH5j/6XH5eeW6SDAUqYgihVccpkAVe3FW1VGirEjZft96ZVQsKD3SEcjou/j8916MwnJ2FtjwYy70=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from AM6PR07MB5957.eurprd07.prod.outlook.com (2603:10a6:20b:90::18)
 by AM6PR07MB6120.eurprd07.prod.outlook.com (2603:10a6:20b:95::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.15; Fri, 15 May
 2020 07:04:14 +0000
Received: from AM6PR07MB5957.eurprd07.prod.outlook.com
 ([fe80::74f8:a2fd:d0df:8ecc]) by AM6PR07MB5957.eurprd07.prod.outlook.com
 ([fe80::74f8:a2fd:d0df:8ecc%2]) with mapi id 15.20.3000.016; Fri, 15 May 2020
 07:04:14 +0000
Subject: Re: Two separate i2c transfers
To:     Wolfram Sang <wsa@the-dreams.de>, Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
 <20200514145005.GC1589@ninjato>
From:   =?UTF-8?Q?Adamski=2c_Krzysztof_=28Nokia_-_PL/Wroc=c5=82aw=29?= 
        <krzysztof.adamski@nokia.com>
Message-ID: <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
Date:   Fri, 15 May 2020 09:04:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200514145005.GC1589@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR07CA0018.eurprd07.prod.outlook.com
 (2603:10a6:7:67::28) To AM6PR07MB5957.eurprd07.prod.outlook.com
 (2603:10a6:20b:90::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (131.228.2.7) by HE1PR07CA0018.eurprd07.prod.outlook.com (2603:10a6:7:67::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.11 via Frontend Transport; Fri, 15 May 2020 07:04:13 +0000
X-Originating-IP: [131.228.2.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9cbac6d0-5b11-40e8-a2eb-08d7f89e2cee
X-MS-TrafficTypeDiagnostic: AM6PR07MB6120:
X-Microsoft-Antispam-PRVS: <AM6PR07MB6120BB1F642ADBE5F89AA1AAEFBD0@AM6PR07MB6120.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aOs/ceaTpAk7mjKD7k5IVUSXQp4bjLS1sTLA3hUtUnGf5OoCHHEp3OTW5vW6AueQpSscOGOqwfdcgylcIji+YL9OkSEpEgTHSGOMcfnoHfDtQi87PTr362Q6HQu/+ziiM/iaaCOmuAp7za6T6gszom6Yo5N8g05yQaoR6SInLGmz1odvH7JVjtOF6wud1bg4es/ZE1bvo/dlOfHgczDPBP8IPnGO2R/fsk3ktc/VQOojLlQ4ZPBx4HRF40uOb6RcbvRJKWyvFTP0VVzUea7g2BjmPwRkxJAUfXHj8348jytumKGNgSl31Fx8CHvc5QGi5YI3JXioRxfdKue+d3SP9EQoID1UQlE5zrTP5ePoK0JojJJ6aS7quGGnKzplksW5GNZ0k43FSYVG5D27WbFurdupjoueKdmModqcAEObAQVipX6X+PDXZZkOD6lCzpTOG28xRnyMAW5jnNPJuSHA80kxX7pZGKXY3cmGxbus3VDfzujaU6e/NW/84aQA0Lq2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR07MB5957.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(478600001)(86362001)(2616005)(66574014)(8676002)(316002)(8936002)(110136005)(31696002)(956004)(4326008)(6506007)(5660300002)(66556008)(16526019)(52116002)(2906002)(36756003)(31686004)(66476007)(66946007)(26005)(186003)(6486002)(6512007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: lRe4ttj7pMBtZvBz8WHs9F3uYRiuyS1G1egsNK0euHxe4vSKe4RVPY8knGb3zg9Renkv1NTtLb5s4hFw7nJ3TkXrHhpOtPh4F3k9dM2XcJKfIfgUhs1haxGn9GXmwrYwy5fBDRBFFLYgqRa1pZaOK5y/cEUx7BFpaZdDb5CLApGg3u3LjIMWotYqC6CcZmA0BTawcHI3mK6GtY0QqnvE1FyH1yEU6y44ks0r7oh+3ksl4HUQyA7MWKY+DZ0mT4VPlf5nLHIP+i8NOs5aaIrfed20IhwIiXs4q7bUemhT7M8tSjAWR60C/H0Tg0HstZzGNtPkEYUYggYVcU9QDGj858bRJLzxD2jG59qCQJmraekInYmZ3J6wnG8z6OFJ3iCe9tL72l1IEjPCrt+pgUAOiJ5BA4R5kngfSWTY05p/iEy/bI7vRWWanFrj6CFqpdGtSxn0z8771nE5Oxu6x1h0YxVfahOCfBKaRQpJWs1UbMk=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbac6d0-5b11-40e8-a2eb-08d7f89e2cee
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 07:04:14.2350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYh0p23myH/a03QrnxW6HOi0Ap1iZuiQEAPVStBTNx7RAJ8xbLM+xYJ+OP59NIKnjrKFnArqhRqNYOg2Uqmw8dKzwl4bnSE1LHWxa7m1/dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB6120
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram, Peter,

Thank you for the quick response.

W dniu 14.05.2020 o 16:50, Wolfram Sang pisze:
> Hi Krzysztof,
> 
> On Thu, May 14, 2020 at 02:41:17PM +0200, Adamski, Krzysztof (Nokia - PL/Wrocław) wrote:
> 
> Adding Peter as the mux maintainer to CC.
> 
>> I have a problem that I think cannot be currently easily addressed by I2C framework in the kernel and I'm seeking for an
>> advice on how to approach this. I have an I2C device that can be accessed from two I2C masters connected to I2C bus
>> master selector channels. Both masters must do such a sequence before performing long operation:
> 
> I need a diagram of that setup. What is the BMS? A chip? Some software?
> Can you draw a graph and give names of chips etc...?
> 
> And, of course, why on earth do you need to access the same chip from
> two masters within one Linux? :) (That's how I understood it)
> 

A diagram might be good indeed as it seems to be hard to explain. I don't use two masters from one Linux, both masters
are own two separate, independent systems and each of them needs access to the target device. BMS is a commonly
available chip - PCA9641 2-channel I2C-bus master arbiter but the problem is not related to any specific arbitrator
device. The target device is also a physical commonly available chip and it is designed in a way that the operation we
are performing might not be interrupted by other transfers except reading status register. The arbitrator device is
there to temporary block access from the other system if the first one is doing its transactions so it gives us a
possibility to do a mutex lock on the bus.

Here's my try to draw this, hopefully this clears things up:

                          +---------------+
                          | Target device |
                          +---------------+
                                  |
                      +-----+-----|----+------+
                      |     | Upstream |      |
                      |     +----------+      |
                      |   Bus Master Arbiter  |
                      |       PCA9641         |
                      |    +---+   +---+      |
                      |    |Ch0|   |Ch1|      |
                      +----+---+---+---+------+
                               |   |
+--------------------------+   |   |   +--------------------------+
| System 1   +------------+|   |   |   |+------------+  System 2  |
|            | I2C Master |+---+   +---+| I2C Master |            |
|            +------------+|           |+------------+            |
|            +-----+       |           |       +-----+            |
|            | CPU |       |           |       | CPU |            |
|            +-----+       |           |       +-----+            |
+--------------------------+           +--------------------------+

I was thinking that maybe a lock like this could be expressed by i2c_lock_bus with some special flag that would make
sure no deselect is called in i2c_mux_master_xfer() (and would be ignored if our parent is not an arbiter)? We already
have the I2C_MUX_ARBITRATOR flag and the i2c_mux_core does have an arbitrator bool so it is just a matter of allowing to
do this kind of deeper lock on the bus.


Best regards,
Krzysztof Adamski
