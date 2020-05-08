Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886D01CAE8C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 15:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730095AbgEHNKu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 09:10:50 -0400
Received: from mail-eopbgr1400045.outbound.protection.outlook.com ([40.107.140.45]:27345
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728787AbgEHNKo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 8 May 2020 09:10:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emvXQly0zuAomSLJnSeK347E4ZB1P7G+WZ6S3GPq++xcIok/gzk3nupxP8Sf/uKO0emLO8MqvQkHEmva8qnxPiNc/asQqHJBb+rEFtu8vG4AloGVyxy1+MvmiAfCLIBlvFV+tSufroTfZSm9TxrxiKjX37bNjPvOytQP8/ZKoh6gzg9KPlK7lX383He4l8UzhjiUX7FdoP0+J840ve9afipU6paL6qYPCSlcGA3pH8RI7x/UzvRSkZDm7QXgffqzOpQyphaIpYut4mv6EGurl6FCSt6d1LnYxKmKAvXEYbYHOA0hbK7oFHDG+9L224K4ty3LfdnREbQ23y0mBl/gDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rtn5/3FzOcsnzXfElgZXF+MJi/+Wqlh6/zgl0IasPLM=;
 b=KQPSbS+XmrQ2chYHAZvLn+rnqoHGpRaS7ctEEhrq4r3l9PEgwc6ccmcwiqIr/kZL5L1iYfg9VEBPo6hzueMfiIun/kgBySnIERraxEiMDMrmSnOYKvMzyJiXarhk8en6WTXhf3Fn1MqPiAMzaXdrITnbzFlRXYcTRxkwUCPVdplWaJX6H9kQiaCVKt5hDf38QiEvs2Ennvy+sZHEssCFmsJLZBuqgnFdzQumsdtTys8gxu9sRSciGcneEI9M2zdMdC/cv5X7eqAzfc4fP1H51Ha1rolQMmqWZQqLCYWUXr047d3aoxxo8ZzcWiHevkpCDz8XoJ4bfPN2NA1aKXAkoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sord.co.jp; dmarc=pass action=none header.from=sord.co.jp;
 dkim=pass header.d=sord.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sordcorp.onmicrosoft.com; s=selector2-sordcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rtn5/3FzOcsnzXfElgZXF+MJi/+Wqlh6/zgl0IasPLM=;
 b=PWcdH+q7ryOm9vEgF/VCZUkIF0iLLuFz7VlYqTEIROoggR3lhmo2KS7PfMXrKbf/R47OPtGGSDj64plg5PcaqMB8cM6UfAs/Ub/pYQCqhiLWmfvVf6U1ElsZRl2gEHJjO4gdcjVJvKN68SwTcm6MYOniTCF0Wa0xkwp32AxtKM8=
Authentication-Results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=sord.co.jp;
Received: from TYAPR01MB2224.jpnprd01.prod.outlook.com (52.133.178.16) by
 TYAPR01MB5039.jpnprd01.prod.outlook.com (20.179.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.29; Fri, 8 May 2020 13:10:41 +0000
Received: from TYAPR01MB2224.jpnprd01.prod.outlook.com
 ([fe80::3925:b98a:c278:1605]) by TYAPR01MB2224.jpnprd01.prod.outlook.com
 ([fe80::3925:b98a:c278:1605%7]) with mapi id 15.20.2958.033; Fri, 8 May 2020
 13:10:41 +0000
Date:   Fri, 08 May 2020 22:10:40 +0900 (JST)
Message-Id: <20200508.221040.2079821779096674388.atsushi.nemoto@sord.co.jp>
To:     wsa@the-dreams.de
Cc:     anemo@mba.ocn.ne.jp, thor.thayer@linux.intel.com,
        linux-i2c@vger.kernel.org, tomonori.sakita@sord.co.jp
Subject: Re: [PATCH] i2c: altera: Fix race between xfer_msg and isr thread
From:   Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
In-Reply-To: <20200426.193916.2256641485530997030.anemo@mba.ocn.ne.jp>
References: <20200410.100640.1949609603287475131.atsushi.nemoto@sord.co.jp>
        <20200426083030.GI1262@kunai>
        <20200426.193916.2256641485530997030.anemo@mba.ocn.ne.jp>
X-Mailer: Mew version 6.7 on Emacs 24.5 / Mule 6.0 (HANACHIRUSATO)
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0147.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::15) To TYAPR01MB2224.jpnprd01.prod.outlook.com
 (2603:1096:404:4::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (61.200.21.62) by TYAPR01CA0147.jpnprd01.prod.outlook.com (2603:1096:404:7e::15) with Microsoft SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 13:10:40 +0000
X-Mailer: Mew version 6.7 on Emacs 24.5 / Mule 6.0 (HANACHIRUSATO)
X-Originating-IP: [61.200.21.62]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d299f2fd-99a4-48cb-e0b9-08d7f3513567
X-MS-TrafficTypeDiagnostic: TYAPR01MB5039:|TYAPR01MB5039:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <TYAPR01MB503955FC2D87EAB91F859AABBBA20@TYAPR01MB5039.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D2OuMsSDeN5E0IZ1y61JkyH6xpQ2X1oJ69o30C7a70whExjaZKs4PPsYLLpkNTEpy5/NqgRfWg7oPR8KsxYODHi4tyY7CHj6Fu6OsZXZFCgriEX69Cti0ueH1x5+1ywlJHrIjIrRzoHvqUxzECSff5AaWIr/DvuK0lj/S7rKurBeffXkFpiuovwZsXXnqa0IYu8aLCdTGbnrkNb0dsne2Yl04qNKpWQlYkyoa/vDL/qTPFiTn7BBB1/QcqV8zfGHUWW6Iqk59l8/ukrBYMOse4eRaY2wJYJEZ5nBYGTdR+rj6/f0ln06lrE9lXV4GsWJ0JCQT69uk0r0kgJ9cu+zNbM9zPAUiOQ+KV3BZiDHPqJDDONYRQ2VUCVWvJXvETWuwrL0+JDX9Doz2+9Oh8rFFs3yUDbC63UBb/jyHGIiPQD0WAjd7wah6GMCzstku7n81heH05EL4/5C+YeL8x2CIsBARCVHY2VXHhEjyvm8PzYLSzDV6c5ZiRF3i627FWilVWENjKryfxWj7TYJHPp9TA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB2224.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(376002)(346002)(136003)(33430700001)(508600001)(956004)(36756003)(6486002)(186003)(16526019)(44832011)(6496006)(4326008)(2906002)(316002)(103116003)(33440700001)(86362001)(6916009)(66946007)(26005)(107886003)(2616005)(83290400001)(8936002)(66556008)(52116002)(83320400001)(83280400001)(66476007)(83310400001)(8676002)(5660300002)(83300400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: hFoThUUVld24avWOFPZyIqt5xN/WhXFM4rXrgaegfMFBhYDvM2dYYSUwSbjRKtA1hZ8FPF6XqhvANLTh8OpyUApWjRx00QzJdOioURMVV8XCA3q3mny89+z8jTqTlRh8MJn/fkRM7DGfuYMn4tWe7n8ACNM+W/m8Bnx3sOuqxsXLbrINiq/zfRZw1TSS6KeGrg+c/AQY5XsYfd17Yu/4W63ys+Ok/RZiTnffhI2A3yvNmJwSqglY2KBGc1LzJatJHkegTCX9IK4g/XsfayaWCc4ZZSiP4xao2SzzXnqsv8bdrMtuMw/k50ERxhNWDP08YxGDpRHNYm1qVzxyxIjy4850LE1/emo8qJffVRPk8hEKqbRH0+nd7K/VB2sKvyJABFdaH3GCCUuTD9FAm8kGHufvueCy62WaoRYORpnlWAXLezXdCgv5COyZMooEjrdFkDGRohD8hVI27lkKUyM4t170xQXqfCbakYpP5C15raE=
X-OriginatorOrg: sord.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d299f2fd-99a4-48cb-e0b9-08d7f3513567
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 13:10:41.7341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: cf867293-59a2-46d0-8328-dfdea9397b80
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mizyXmWFlfMwHNuVaax34XhdebRDi9nBCJDbmWGNyPmJuERDrryCW4lqpkOkZys+CeEAHmdfNg9U+lzk10KvC+IReyiTxMUu7gUlOUNO3+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5039
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 26 Apr 2020 19:39:16 +0900 (JST), Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
>>> + * @mutex: mutex for IRQ thread.
>> 
>> I think the name 'mutex' is too unspecific. (Same goes for 'lock' above
>> which is not part of your patch, obviously.)
> 
> Then, how about 'isr_mutex' ?  Should I resend a patch with new name?
> 
>>>   */
>>>  struct altr_i2c_dev {
>>>  	void __iomem *base;
>>> @@ -86,6 +87,7 @@ struct altr_i2c_dev {
>>>  	u32 isr_mask;
>>>  	u32 isr_status;
>>>  	spinlock_t lock;	/* IRQ synchronization */
>>> +	struct mutex mutex;
>>>  };
>> 
>> Has it been checked if we really need both, the spinlock and the mutex?
>> From a glimpse, it looks like the spinlock became obsolete now.
> 
> Yes, but just dropping the spinlock will leak two code pathes unlocked:
> 
> 1. altr_i2c_int_enable() at end of altr_i2c_init()
> 2. altr_i2c_int_enable() just after wait_for_completion_timeout()
> 
> We can kill the spinlock by adding some more mutex_lock, but I think
> that is not a _fix_ but _cleanup_, so I would like to do in another
> patch.

I will send a revised patch renaming 'mutex' to 'isr_mutex' (with
Thor's Acked-by line) and a patch to cleanup the spinlock.

---
Atsushi Nemoto
