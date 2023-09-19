Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8997A632F
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 14:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbjISMis (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 08:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjISMis (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 08:38:48 -0400
Received: from smtpout30.security-mail.net (smtpout30.security-mail.net [85.31.212.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED627F7
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 05:38:38 -0700 (PDT)
Received: from localhost (fx305.security-mail.net [127.0.0.1])
        by fx305.security-mail.net (Postfix) with ESMTP id 7873230FD0E
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 14:38:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1695127116;
        bh=0KNd/SzfKkUzNeUQROUGbCqiZX51fqW2JALsE17nvSs=;
        h=Date:Subject:To:References:From:In-Reply-To;
        b=Twsq02r8KkzWdCjEO0GcB7mBoNuEJPJHXPtk+wV5IdIK+qUSkZ3sLqC45kKkLWvfr
         Hh9MXVaThAvu3Xbzk3ICgjE3a3Jp4Nt7R8XVXbiB6z5fZ2uI2OdDY46pOUCn12FTeK
         d6HnG1G/2+QNJvjqlEsqMWSSGPj+ZF640imMculM=
Received: from fx305 (fx305.security-mail.net [127.0.0.1]) by
 fx305.security-mail.net (Postfix) with ESMTP id 3A44230FD06; Tue, 19 Sep
 2023 14:38:36 +0200 (CEST)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01lp0107.outbound.protection.outlook.com [104.47.24.107]) by
 fx305.security-mail.net (Postfix) with ESMTPS id A3ED230FC56; Tue, 19 Sep
 2023 14:38:25 +0200 (CEST)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by PR1P264MB1567.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Tue, 19 Sep
 2023 12:38:24 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2a88:7ccc:780c:c9f9]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2a88:7ccc:780c:c9f9%5]) with mapi id 15.20.6792.021; Tue, 19 Sep
 2023 12:38:24 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <213b.65099641.a2b8f.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5ZOIotBzI+nx1BARwyAIHg8JiJbmiNfcLY8ztw29mFC7MV+T3jtMMWkwkiwZxBmNhRI/MvE1B7d6mf6/2HFs5WrXUj2oDN314rGQDULjpx+9e+kRTSgcmmFq1WOSnIoFxp7iVAvhW9vr+KCpATvS7LnhMTZQmWksCL0CtPWHaoJgkzj2tvSoLl/5l36lmNXVpRGTqdeCcJk3vwswaYuW6zjNGPLny5S2bQVat1avvGd2EM6OA8dNgWDGkioz1ywAdgQbyI16UNpv6wxHmvamx2GXujYENHlGeL6HRog3IeJUjVMCWM/OkT25niiy3NgS47lovLTHuMKP4zpMe4tug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDJ5C+BeH75bdAl/DjRxtdExNTQr9CkaHIx9D/HknK8=;
 b=CKrCKP30bID4pbxd0J07ytRwpz7CrkX4FCd4cWVOQGKxXim6UeZLNcd0OlRfXIBGpe/fsXYxwx5v0dSmfQqw78wBmpjO3AqGDs5Wk7ncMCbGBjojJ3XP1lhzwANlrYXxPxJt80S42s7KiXeOxBbsjhDPi0/FP/pMp+AyStLGLAxMHzrwaz4KISixE0Y9dXg4SwsVFP/amhs+IR4KUCUU5ZAkzp07bZF1ilQ/KmqwWD8wSm2p+hA/4ZhBvv6rYxWfv8UAUbc3jbHKCUimcZ5OS5GHmWppzxNbI/Czlzkc//BhbnCITR0Lv8X6VbNGmvNYVsw2bnMA/k73qg3Vcu4K3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDJ5C+BeH75bdAl/DjRxtdExNTQr9CkaHIx9D/HknK8=;
 b=czvWsvfNQdNnIdUecvfyxhrhCcx+4NdiA6M4gyLS7dZVik2xF0FwYILjUgwqUK7/veND+qaqtkfpsn3nFEimSWwHbWsi/1xe5kK89TontYMBExavq69TYOIPqcekcK2/dk1TuKUZzHoe5qsnOlF3/oxKzWzpoRx686nLziQURL/pbSnXGB4imbKtEwhA6p9NY1FiaElVqhqwkFclUgyHilngQWwSOjghtO5a8e8rSjoZKArIMo+rIHaL/5A4cG+ozBSs6xgUHNc7iprki/hEAgOSEoBVQGrrDGYNLZqcVb44fjc4UJmaLqL7ARDYjlIDY3Ux9INgiphnzNr8sDklpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
Date:   Tue, 19 Sep 2023 14:38:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the
 ISR
To:     Wolfram Sang <wsa@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jan Bottorff <janb@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
 <i6h72feyrvo6pajo67b346masyxt7ycpfj46mvrfp4o7suh4ud@xuv5lu64s75m>
 <a7a85428-d40d-4adb-8f84-75e1dabe19c9@os.amperecomputing.com>
 <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
 <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com> <ZQl1zwVkx9n2MPvr@shikoro>
Content-Language: en-us
From:   Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <ZQl1zwVkx9n2MPvr@shikoro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0456.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::36) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|PR1P264MB1567:EE_
X-MS-Office365-Filtering-Correlation-Id: 475df8a4-3006-44d5-5953-08dbb90d505a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: soqqxzge3dsm8gyu26TJt3myuTmWXt4F+0t+BvjdoV0F6RL4wuk49ENfcoPRItSlJlI23N6Og2UtXjzB3uN7SwOyBIgZC4eC6Xf2wJNVW3q0zwGe+VtjZNAQQ8AivU/moNAG5qq4EnJmZKWPxAWhlZLJp6f4sKpGL0mzmuwFOTrxRWA6cO8A78DuJ3mXbZOM2lToPYzydIqgQGR74/6k47oj7uni1gLnOL48M4fptQqv8Ef/imbdoe1ubk5iMbgcLvXS4wOxSq0fklpJpDu7ptB4v27CSndiaKua+ym24fzoPx03/3MflJ3LyTRT9KbY2ASN6k4C+raWFQufRHXEj53JDgE6qvl15tj3/ufU6nYXMkq5XhSxmFBvTg+NJcfY2EyDTMklScIdnnVVnjva8u00zPXN73Dzj0EIUu1jGY9UvFZwLiukv7s+a3lnL4Tv9NPzsolZnv0XAvMLEWQ4xblMMOncMr9090GlVeH8X5VF0wnYebCRtsg8qwmsh9bAVegVtjv0HUacKrvqPOFXOt+vF6IO1kESpsUZI0QAbgbokjBbmil4b34ecl7xsy0bo1jusq7pQ426tjUgFyTas2+u4Hedi8YJawMyjwkENS59wNd7H0zWqx1ZDqvjt3z/aYFlaBwm+W8bhCk9sZ3b26mSkSR0XtcC2EjsCP5QsaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39850400004)(346002)(186009)(1800799009)(451199024)(5660300002)(41300700001)(8936002)(8676002)(66476007)(316002)(66556008)(110136005)(6512007)(66946007)(83380400001)(38100700002)(2906002)(921005)(6486002)(6506007)(53546011)(86362001)(31696002)(26005)(966005)(31686004)(2616005)(478600001)(36756003)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iFKU3b8a2Na4X3LLw0PbAE6aaF8ynYEELNp9HYCZt4YZ5sMZ/w/gTDBwr7YoR4/11wqpC0rX61rGpwepcQ5YSAf0K4MAhm4tS01Y09HSrHhiHLLMFiClBkcD5o8hbzFiPhHdJ7EDZCKbzO7/QEFs22AqhDvOw8CrynUmAYuo3n7Lsf9nPGLFqViytSKCJ5wXysNHvq4W+He6DoC9AQXDBg/Qr4YclTlP+V6lbfZ7zuccvWXCOfVgV0Au3pMCalECpHYOuOqYHUPsIA6sldSlkevXpACyCXl9oconKT9hx3sJtps1UQzTi6c8+4nkxAoWr9iEqNiAsrYRB60LVjYrIlnQ4/OSI1V8Ri+rOy+Th4xmd+HTClGT7hud7QunWco+0PIhhGtYEWgHtGdVwJDhNTYBDRD/RP6AaAkAhIBqwDSd3sZ5bMQrbAhsCxBmwYhT5tgqbRQf0loylnqljP8pp7ko/LybXiQuG/rEMOXyRsK/Asb5+OTuUYUAbBxWd28VME/KDnCfFpJNpgiXIs0sYOiGj3Wo0vtNzWYrS+3fTyUf5ubkLygJBjb52xjjD0PyJGIs8aVcyBCoB11R/tT7U6imnskMpFj3gn0f1wJ+uHVPP1TQ6OYuYTrUaYGj48rtdNl6Tj+6z/MBjWnH4bLbyN5XdLkQzQhbkyp53f2uOPgzIptt/rWzcC8i7b2/dDHMLvy2bdwH5NcM5vn6Bq1/11UZ0Ok8GdmGbiHHH2GBCUQq9Iif9LhDjvBbxOLRumUMthrG3CJuM6dBXMuCYl73cRjMu6nISX+CJijUrA7p5oHYbMTQmto19jtIgQMhhNbYMXMzm4nLVA5uPpOarX8tDCY1Wa4V9bQA+joXsDffaEyG+5qv4ocdtUaXUTTzCefSQpaUZrfz0GbPMRNvA5SCNhWFsStAVMFC0+vsZ4vWGJXq0r+5C2XlDnLO3NPwtdLq
 425B63N5wUjAi7qDPSB17MEQuexpaueb1i/NBpyIwyfwTpARrzpGhnL3DCDpe9KY0WnD0pFkNscFJoGhe0XKc0E1IMyITQnoF8gU4aN7vv9cODO0xvq0l4f29a9uHt/v5pLcd3KuZf4L/l2DzRmDggU2BbJwDaO2p78JQ5YIsYKIuEw4pJwpWPueZ0XdoxKKejY9aM0BD54FUHlK8w7t+tmFAoE/2VEk7tuLnI9UOrEijxMEHLTKne3iNX+6mejJBqkmg2FFeFn2s998jH2W/kC3weQ7sg0lchv3PCVjgYOGPIfQ8e46i2d13po+NyTCtBFlyDCv77+P3n1InVGWVnqj+K9eYV6UIVqlb8d+L5nBbtxBahgbD+67aMMZVft1VR9vrlypgtWjQdD4R7rsu0B/3atHCTJ1JaQh47SXHMt9+myGVh3DOlBOgORYFvZO8shjvNYxiR7iFMwEl0eQDzqjhg7Xqt9XsEWT2Htitp1aF46WIilvENAFpTNDPG/omnS+iik5ceGbrQoKfczex2NPbON4eBdrubTqKgWn1NFeVReaO2A0GeY5/wcuWqJDJBqaydaAJYLkQj/eTuF6wcJ6nM/o7hHNCg0XAnu80O+C/c3rrJBTIiXQ9cZRed05ovDf95vYi0M/BVMOw5i2qw==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475df8a4-3006-44d5-5953-08dbb90d505a
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 12:38:23.9698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJCZXzmrLc3wNd93961QIA+ZiVGZkA2g9cTkWStlodWaXhKQ7aZ4dXVsR248bit70bW62++q8sfJz1cUh+bn7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1567
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,T_SPF_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 9/19/23 12:19, Wolfram Sang wrote:
>> I also agree that a wmb() in the i2c driver is not the more elegant fix.
>> For similar reasons, we hid barriers in the write*() macros, drivers
>> need to stay architecture-agnostic as much as possible.
> Exactly my thinking. I wanted to read this patch discussion later this
> week. But from glimpsing at it so far, I already wondered why there
> isn't a memory barrier in the final accessor to the register.

The regmap accessors used by the designware driver end up calling 
writel_relaxed() and readl_relaxed() : 
https://elixir.bootlin.com/linux/v6.6-rc2/source/drivers/i2c/busses/i2c-designware-common.c#L71

Those usually end up just being volatile accesses, making some kind of 
compiler barrier preventing the memory mapped register accesses to be 
moved/removed/merged.

I kind of think it's OK. It starts not being OK when you want some 
ordering between those and some memory accesses in DDR like the problem 
discussed here.

In those cases I would say the smp_* barriers are what we are supposed 
to use, isn't it?

Regards,

-- 

Yann





