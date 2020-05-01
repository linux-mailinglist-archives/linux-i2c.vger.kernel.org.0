Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1D11C0DA5
	for <lists+linux-i2c@lfdr.de>; Fri,  1 May 2020 07:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbgEAFLP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 May 2020 01:11:15 -0400
Received: from mail-bn8nam11on2059.outbound.protection.outlook.com ([40.107.236.59]:6099
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727922AbgEAFLP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 1 May 2020 01:11:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYg01N2zcKc0k+aRJAB9QDWZuQ1PZ9HnVnyqJF+cBm37lQYGDKRRzZCXStGkhBEoxqDvWNWyiFzTIh9Wbmfq+5TNzmxPWCrsieKXNRJ5pno/sAem2RUQyi2uyEcp53VErhru00XBCSI/n1dNYtLBLV3JhPagkjb11CekF7D3spC6lcUArA6iWiNdnOSlBHYT/c/X8NSfDoTLl3NJaIDxa6vOcjuIfej1lIsogNntAACFA9bSV73A6xvAy8SGivTYlILphM8ptu4fymEv+VaFDJBpW+8AuuX6fPM8BIBg63MuSLmteIWBH9hO8g6tHOdba5//V+Xw76YB487w/NZZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hry53N75Gy6BYKu3XC4JFObo8tCpJIEIoDo/79f8QAo=;
 b=grahmKTt0ySt9lMF6kRbPkvOIMjB3Mb1qDC/jrlJX8VKaD7FWj+ifxFpx4aX+En2sRPoOJ49lG7w7k9q5tBBacHJRHClMMoogRiWTkteEmlSThZE19YnhrPYgIBU7EozQSi1q3V2lt4LSERw2kBXDjIjBtegvVOY+PXg1FZRWv5bcXnxkCf+vKUF2biemWoAa3V3k7vtWG2Hzm2ZMsfD7BBSShroESxVcLoNXpPEvEagEtqzdbng2I02ckImfz/94j1dm0uY75ne32HiOR0+qfKty1WmPeTdOa7hg10Ac4AY5fHl9xv5HdRCbjRLlkUqA0xyqj15edqgo1KHsvgtvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hry53N75Gy6BYKu3XC4JFObo8tCpJIEIoDo/79f8QAo=;
 b=M5CaeyL35eR8mLm07XbW5JYKCBc9PEJwZXHmwbr1Dlf8ReMzToCTKU0pOxUBz2IZwfU9dUHMZEiEbAia3uMUFY5N43+jW3cy8wSJ9U4HPFzhpuwt4teEcAKE6wueXyjnwYQz24jQ2czV73QLiFviD5IgnV3uTUm2vSc9SlVBi7w=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com (2603:10b6:404:a7::8)
 by BN6PR1201MB0242.namprd12.prod.outlook.com (2603:10b6:405:57::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Fri, 1 May
 2020 05:11:12 +0000
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::8daf:74d4:cbe4:759]) by BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::8daf:74d4:cbe4:759%12]) with mapi id 15.20.2937.028; Fri, 1 May 2020
 05:11:12 +0000
Subject: Re: [PATCH v2] i2c: i2c-amd-mp2-pci: Fix Oops in amd_mp2_pci_init()
 error handling
To:     Wolfram Sang <wsa@the-dreams.de>, Elie Morisse <syniurge@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <CAC_JBqofuyRiSmK0mFqVLaY=5k9MYmjGaVmggx2dn_YjN8VOmw@mail.gmail.com>
 <20190910134242.GA6620@mwanda> <20200430141050.GB3355@ninjato>
 <CAC_JBqo4x0KBdb3j3VFrZu5sG2Mfx3xpbDzFk68h3TU99ZVj3Q@mail.gmail.com>
 <20200430200659.GA19155@ninjato>
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Message-ID: <383303a1-b326-a37d-0a2b-e6ce4f945b74@amd.com>
Date:   Fri, 1 May 2020 10:40:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200430200659.GA19155@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PN1PR0101CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::19) To BN6PR1201MB2467.namprd12.prod.outlook.com
 (2603:10b6:404:a7::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.104] (202.62.82.154) by PN1PR0101CA0009.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 05:11:10 +0000
X-Originating-IP: [202.62.82.154]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 069145be-911b-4958-8e4e-08d7ed8e1100
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0242:|BN6PR1201MB0242:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0242E9F39E54574BFDC70EA4A0AB0@BN6PR1201MB0242.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-Forefront-PRVS: 0390DB4BDA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB2467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(956004)(8676002)(2616005)(54906003)(31696002)(110136005)(5660300002)(2906002)(8936002)(26005)(316002)(16526019)(4326008)(186003)(86362001)(16576012)(478600001)(31686004)(66946007)(66556008)(66476007)(53546011)(6486002)(6666004)(36756003)(558084003)(52116002)(55236004);DIR:OUT;SFP:1101;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7x/szZvq15H5V1vkXEj8XA/ksKKIok2g0DRqTPDD760eHwQwKLdTLsdKaqnFYICPMNOLGwqx90+l6iOEPy67Sq9YtV0o4vz+fBiDAaOMbXWevHDKQE/6svN498xZedhjs8udCXLbEXi1HfpVgePkDGz4ANvPCG0F6+PqDCEJi996HCSBJKNyK1Vh3Ly7Owr0v0uMG5X9TL5Zd8gNIZrU2+5wO4WKftV5jRdGVeQl4SNuDquRRWqc2QqBdjHSie3o735DUoDiJrdqghoKllAKyateqJdV4VHbKVQ5JdJaV96NfU+cbnBMoMDxkLfh3U713ef2Ndnwh1gF+ctThR2lbCmkhb8bKx4pg1MZn3pufDrF0LrpUZjK7C683A8jC77powBJAHJs/kkIJ64cUbLdJgAa4RxUfkPAtCpmlHfAa5iy9Q6WCirdJ/dxNP8yCd/O
X-MS-Exchange-AntiSpam-MessageData: XTPkJk3LlTaCflnCaZbTJTE9uLZfakjbwGvNY2TCHFUj6mXGUqgJXTJJk8W/9trdVwZkwqy11+fcRGhK+PtRmAtclXEFNzGK4fTJYvm3rhGEC8YnbEW7OAowWfVPeWKa3P8aK1QZ5Ds0IlKTC9zOZtDIq084Lf2cSzTPDQdaP1i9J87lK5mBA11yyPhYCkPmaW84MPLlqCjg6aVM3uLQ7lCc7oglWUOzUPO8w23cksTzclLFwk998flI37IPNo9aHheYpHdykXgmGk89j3I8kHZTeYfmlFhM03JkDEnfmpunZgvU+XO03AKVXO8vhZQ+WTVtxqZMDhWrtrkrbCCE7kz1WAdMjtElrxj2yE7zR3ac1GZVyPCcI7Ihe4eluR7I7+EwLV2ENx3X1dHlAIwGJjjS3scJ1P5S5itsQwz2OtyH4JRDjG/DnduBUvQy2XWgVSSsdfNROkOj+xAkLRjXie8UoyFRyxW17Lej5ZRdHRa82pGb+34iYjAcAzjj+jzbEk/6unl3Excq/01bVX8eydsoIqLwg1xYblTqYHErHhNBxhjP5lYhF4pCLycZrHbAusmIfBGcQyjMUP/Zj4TXaYlK7x11aZDZLiGLNzjc2G3jwJJiNZV7diecjdZutukwDClWKDoXrsmXIlOnPhxJvYnn8IEDdLrSbi1gf46koaCDKuzXK6CGR84IkPKzch5gIotfj7IfrOUsh/sH/uR5JAN164FIfZuSwEKm4NVHh4evMtUtihyHTuuSID49zAZ7asaKxFiHf9Jy/NcOUOJ4RGi1PmXnt3hqfJdsCbXy4WA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 069145be-911b-4958-8e4e-08d7ed8e1100
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 05:11:12.5881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVtI15fJmCs/yGEsbCgaZqe9rR5lKx+B8Ok+S8QqJn9bsFAlc6bFuars0bOXNlL0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0242
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi wolfram,

On 5/1/2020 1:36 AM, Wolfram Sang wrote:
>> Yes I'm still here to review patches.
> Glad to hear that :)

Shyam and myslef also are here to review the patches.

Thanks

Nehal


