Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB99D1D496C
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 11:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgEOJY6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 05:24:58 -0400
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com ([40.107.21.133]:9185
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727116AbgEOJY5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 05:24:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gT+70p32PfFB1fj+77eDXO8sSRRUz2frwLaU2wHaMYvms+Gp/+m7m+0tZaT7m2TYShqAPPtL4Uupj/jv2ptc6CXXCOWH9X0dXAaLUZt2tU4iGppz+gbK3Oqp80ERz+Q2wsJoog41Zn3TmEqEjkBTlzVViSqT6a3SPLtMLSDAAqEIWJKjfGJJ/j8hLAzPy/F5mkjMoYlz7RuWa23S6u07UpKPQFbIDX1k/pNZa68m5/WYM9d+IVC1ejfxq4w2jobtp5CS8q8gDPGviZZqxxc9Wit7K2VE8swxtcy3DQcGh2jRHEjplEAqw+Hc5e/h3vHGrNh/8dtuljHiYawcSdhhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/9VB//mTiJYBDVK9TgICYTFjB++H3VJ7QTBOFRCJ5Y=;
 b=foraJwmyiOXvS6Zya2baqniGgG6xHulLxC49jqs0njgOKnQIZkraSJVDQVRmaNw7KYNPrQVaVrxYGz1ExcwEqnAp0XbH/q6x1925F0/ahPPKZP07FLVvXzbhgtpgioZy5WISriQc1bcM8yYYYGqwZOHwq63inaJ0SfBGL/zmsV300EfNJBGjA92SHu8qsBgyssKzRrfrePQELBW18XmmLNbb1Z3ibiFUKL/D/prcUrJTw5i7ql7hjflyy//WZKpp2/+6SN9xvNdJLqaLdQu96oug40RkPNEK/n734wmo67muYaV8qqLu/FFa0hwfmA6d4b6exx11oQxIpuQWvYqB5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/9VB//mTiJYBDVK9TgICYTFjB++H3VJ7QTBOFRCJ5Y=;
 b=DUxZZPOeYrrduPrwGTkWjw2lw51nVj5gNV4hFG483bWOPhxsezNw/bxoyunQ+y5J7x+Pd14Me8VGgjUubfXp03TebBirRlScgcObATFa+/MojGBG291zlIfXCNkTBcNCoKLU1NggSgsIdMxauBQEs9zDB3MOvkjz5QPEGWzc5oE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5964.eurprd02.prod.outlook.com (2603:10a6:10:11e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Fri, 15 May
 2020 09:24:54 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a%7]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 09:24:54 +0000
Subject: Re: Two separate i2c transfers
To:     Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?Q?Adamski=2c_Krzysztof_=28Nokia_-_PL/Wroc=c5=82aw=29?= 
        <krzysztof.adamski@nokia.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
 <20200514145005.GC1589@ninjato>
 <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
 <20200515075303.GA1083@ninjato>
 <820e15e2-9267-1bbb-0809-4e9dc19d566d@nokia.com>
 <20200515092042.GA2077@ninjato>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <ec8ed2fb-710e-29c0-8c27-340de0bacfa6@axentia.se>
Date:   Fri, 15 May 2020 11:24:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200515092042.GA2077@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::18)
 To DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.138.116) by HE1P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Fri, 15 May 2020 09:24:54 +0000
X-Originating-IP: [213.112.138.116]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 114a35ed-4fc4-42f7-10e7-08d7f8b1d3eb
X-MS-TrafficTypeDiagnostic: DB8PR02MB5964:
X-Microsoft-Antispam-PRVS: <DB8PR02MB59640571DE335835D2334152BCBD0@DB8PR02MB5964.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oep3rkUteNnUm3TS0mZIEUgIk4ugfO0eXckYGCc/UAsjMZqi2q2wU9jILp7ZP5lr/O9WWq6yjKW/4TNLJ8JVNKyGy4RfGKHnC5Z7mdm34bNcsLhlPDTc++NeB9z0n12YWl5uz6+u/0I5bSFVtRgUWrp6onVr67pON6ZadgsybjqpbxzEUNdDmoxXeQNeSOTmbB32KXQVBjdzG15licBajywMIlwHTXgsnmQGCOmGyETf4lTZH8y1j4lVCeZi/JyWs4f/YLLvTs//mHLkIuBgNJS81RQCgYvsAvMPEJQGpTutLHmHGgVrAiiI1NqGhT/J9WHj13mB1CKnxuhuQkKWwKgKz7ZLOXIaS7yjesEJ74yx8QA7bKOIAE3GOJqKI7xVpWZ6df4llhom1CEb6oUtk1n/NjEKDXgHXqVl/Zm7UNXiXu9NlJwS6gPGT0Gw39nhX2Tb5lNzmeshWHb0f0cNiE2gxETEC5x7FwYmwKhDsArDb8jXP2EaJhjw1EAjkv/h
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(136003)(366004)(39830400003)(346002)(396003)(8936002)(956004)(110136005)(2906002)(66946007)(186003)(66556008)(16526019)(52116002)(36756003)(36916002)(16576012)(4326008)(66476007)(8676002)(26005)(2616005)(53546011)(316002)(31696002)(6486002)(508600001)(4744005)(6666004)(31686004)(86362001)(5660300002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: y8u7Iqr9BXFFnFNGWQpVBKLpaw+ll6shUFil0FMF+6ALJt+TfEgOR5QddaJ7duGYlf//nhdIvi1lIk10Ru8vvC/z4stFj+7S9b3YU9quEHVpcvXISay4iPIARZO+7q0d3NS9iBJU9wrqGQPH68xzKgQMQJpbxCb7+AWTAkv/i2ywMId2+KgHq9PWxVklhsZPHjzq4VkyqitK+EzQVOFxRZOsRNWljEjIUpGFtfu9ykqWQsRv99PN2ebf4tKyaHJ6vKsrdVhQhDBlg6sNFWWl1FqVRNM87ThoEpjnVtTlto8g7k4RdJob16mGiwRBlke85K6KnY6xv9y3vGYQJ+nY2oy1M+5zNUsBptLLS3i7U3M7xoSaLgKkX/t2HjIzuvPZNLuzkpH+g+x50CnqQ1k+mnvXR57ugRcovrqPtPRvmrlMgHq6laY6Ol9P5eomAxkeJMzDE02Vj5rcaH+tIrYL5BIvPVwneyUphO7d+XDbLlwG/By9TriA8qSiNZ7miHYv
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 114a35ed-4fc4-42f7-10e7-08d7f8b1d3eb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 09:24:54.5551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5vQaqx9jahTkDdYiVO2PBwZHy9bYSUODW866qglmtBtHgvCAjGAS+xvhVgHVyfQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5964
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2020-05-15 11:20, Wolfram Sang wrote:
> 
>> So this does not really solve my problem - even if we do get the lock
>> by calling select(), we will simply release it as soon as our
>> i2c_transfer() is finished (and will let the other master take it,
>> breaking atomicity of the two operations I need to perform on target
>> device) and this is exactly what I need to avoid.
> 
> I was assuming that once you have the lock from the arbitrator you can
> be sure that the other master is not active and, thus, you maybe don't
> need to read the status register at all? But I am probably wrong here.

You are right in that when you have the lock from the arbtrator, you
lock the other master(s) out, but the issue here is that the mux code
releases the arbitrator lock after each xfer. Krzysztof needs to do
two xfers with the arbitrator lock held over both so that another
master cannot sneak in and change the world view.

Cheers,
Peter
