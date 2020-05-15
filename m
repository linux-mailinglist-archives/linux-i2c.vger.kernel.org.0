Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5550E1D48D1
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 10:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgEOIvo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 04:51:44 -0400
Received: from mail-eopbgr60115.outbound.protection.outlook.com ([40.107.6.115]:6183
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727833AbgEOIvo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 04:51:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZG9MiJPIw3aGOdmGDZzk4L+teGYA6XMTHl3p3TwzfsWfC8aDXciLRNSyf+qyRzt7wEfcCgr3KRR7ZCEVdBS8NFFNaPV4xjsqUJTqtwwe0CnQOYiXV2/HxeqJzbmDxCOkqbzNFDSEwSJnb7z5j6PeUhsB3I7WkYFGd+4Aj1KNAsyCbcy4eYPPROGFcD7hwFgFSQttrE97CBMVaCUmgR9fS7+h5DevwwAWwTONXkd4GdFGFvvRjULH8jyoI34RV6/mlvi019dG/807CP7jtyrmv8HDFaOu2C+s0ctytWNV5/xDS6R+n/9htf//B2YxptjC41CB2awM58NfeZwpzGNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVwt4IYm543ql6RzensvJ7ZXJyvNc7DpgaEpFdsPzAk=;
 b=nbpHSJjk4+qsJfIvbyp5bENbqUvFt5fyQICl4bDRtyAf5dzeCoPhBIPL2aU0NWyNmiBOO+whVQqkFHqV5efoAJ2ZAznnr5nQb1jO6nxGlUm0OdDdTgGo9Jn/fDRFsadIr/XVDzMHkkawX0DivXdU27WVRdEtSpEWvNKT9J52DWpr7lv5oUQegrPvORzhRZalKhRxBcLBHsMxKKq6N2mMorvZVn1zhOiKd27GUOp241g1WKq1690mbCoEDUDOT2psU8ICOqPQRg4q6elKJEhQh3u5roRwdRJ2V3NE5xNnWyOCz0B4Sai9m3EoCe1FqeD++eaNttnCQTFfsSDQv+1dSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVwt4IYm543ql6RzensvJ7ZXJyvNc7DpgaEpFdsPzAk=;
 b=rgjEwe/DtrKwYt8IXmKnMGWzUpVFL+Tyr15cfsWtiTXwwF72qPelYcfCU/5oztTd6xMzgyFIWa9IF+LDTjVjc/amrnjgfVaDujxOwAhWQjL+UCgF+w++aWNXMr3Xlla9RU7nOwGiKf1/FkPaR0jczPL0amklJr3aszD2jN6d6lE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from AM6PR07MB5957.eurprd07.prod.outlook.com (2603:10a6:20b:90::18)
 by AM6PR07MB4549.eurprd07.prod.outlook.com (2603:10a6:20b:16::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.12; Fri, 15 May
 2020 08:51:41 +0000
Received: from AM6PR07MB5957.eurprd07.prod.outlook.com
 ([fe80::74f8:a2fd:d0df:8ecc]) by AM6PR07MB5957.eurprd07.prod.outlook.com
 ([fe80::74f8:a2fd:d0df:8ecc%2]) with mapi id 15.20.3000.016; Fri, 15 May 2020
 08:51:41 +0000
Subject: Re: Two separate i2c transfers
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
 <20200514145005.GC1589@ninjato>
 <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
 <20200515075303.GA1083@ninjato>
From:   =?UTF-8?Q?Adamski=2c_Krzysztof_=28Nokia_-_PL/Wroc=c5=82aw=29?= 
        <krzysztof.adamski@nokia.com>
Message-ID: <820e15e2-9267-1bbb-0809-4e9dc19d566d@nokia.com>
Date:   Fri, 15 May 2020 10:51:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200515075303.GA1083@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR1001CA0021.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:3:f7::31) To AM6PR07MB5957.eurprd07.prod.outlook.com
 (2603:10a6:20b:90::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (131.228.2.19) by HE1PR1001CA0021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:f7::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Fri, 15 May 2020 08:51:40 +0000
X-Originating-IP: [131.228.2.19]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0007cb74-064f-42bc-5623-08d7f8ad2f88
X-MS-TrafficTypeDiagnostic: AM6PR07MB4549:
X-Microsoft-Antispam-PRVS: <AM6PR07MB4549C32C75A91FDB8768B673EFBD0@AM6PR07MB4549.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/Se6DAvifunndfDO46iOljTVtMxXZ+ZROZ56IZvm/xh39jLlB7kB5O1g0X4HCKsL7uWlnhI0ASPsNoGS8CjmMrnO3oIp1+i71HRwWc2N6V7Fn1s/jNpeJheCqQzrWs2w+QhwDCxDFHhCzq3+BS8j/Ji5VulpH20G1Rk1z0RX2FWdOKAgvCT8qSS9MStek2J99ash5IbNbA8vXf2BqYDJy/4bdOLB0Bz3/GnSn2L4YCiRgqeuHlFfCA8f5bIiV3gv7ri5zxnz2aCyRk3B1Gc96EEks+eK51inwBordyUm6X7tu2zmhkrhPd4bYkpPL8h3PROcGQWmVNymTZbh8KA00ra68PQcSbkfZNcIAWzuMzPj26RaiavSmCy0F0KryYV2pcb3h0JEK4dGWhhu75vgHBFXWcdPeMHGXSryc7J7VowQ93LOIi3P9RKdQJlDhM4xPAIsnx1tE82nXG6yjhBTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR07MB5957.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(31686004)(52116002)(6486002)(36756003)(8676002)(6666004)(8936002)(478600001)(54906003)(4326008)(966005)(86362001)(6916009)(31696002)(6512007)(316002)(5660300002)(26005)(16526019)(186003)(6506007)(66556008)(2616005)(956004)(66476007)(66946007)(2906002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: TvSzeAPlxmBkGNobZSFkjng6QBFZDdKWiA/CG+cmPdHpmvMzI9pY9o2vM+px1LR3NfIhf5jnn/NBQB8KLr0r+dOwClr2uGU2EfXYCucpBkLqt/3n8ojwVPY3ZmX0Vsy3otUvoHrQx7iVmHlEqb5PH1543/78uZ/35Pa3G56xPcu2TmKFpDOp9jhk5s2xpXiTSUEnAuW5CBa0LaHLy5nlUZAdp9pm1g+lnkvhKBMSUb7YizPbpGmVwd+B2onYcaz8ZS2qsmmOM9YpK2yZr49OnZFI0bFc9BKEw4qI/VJpKFV9pKraalN/KDzQyiMfNC4y0gPHsS3E76QneOhzFT9fRFDb04mWBB5CGUVs81qktqF1a7fhfq8xB4k7ewkCEHoxOww2cXbSd3LRgMG5pipBVqC9BDrMnyP/pPSw/P2ndimeLPfKJ6DRA5lHod8PUpUqrdwOhBIpm5suOnEJkh5egOMc2LDGjC3z3qfjQLs/eoU=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0007cb74-064f-42bc-5623-08d7f8ad2f88
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 08:51:40.9407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRCOnNygyc8Sa6J1TOn7pT+SiDdmIJpTfWv0+DN1DIvHQcT8hx/gPVuYyxfolMbykIaG8oI1fx2Ayh1sH1Pk0COYz1FlNa+Og0a7DEoCJ88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB4549
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

W dniu 15.05.2020 o 09:53, Wolfram Sang pisze:
>
> http://patchwork.ozlabs.org/project/linux-i2c/list/?series=95793
> 
> (Do you use this driver or a custom one?)

Unfortunatly not right now. For historical reasons we have a custom one but I would like to move to this upstream one in
near future.

> 
> I'd think that the PCA9641 driver should return -EBUSY if another master
> is active, so we'd have the lock on that level. But I may be totally
> missing some detail here.

That is a good point however right now the logic in i2c-mux.c is like this:

ret = muxc->select(muxc, priv->chan_id);
if (ret >= 0)
    ret = i2c_transfer(parent, msgs, num);
if (muxc->deselect)
	muxc->deselect(muxc, priv->chan_id);

So this does not really solve my problem - even if we do get the lock by calling select(), we will simply release it as
soon as our i2c_transfer() is finished (and will let the other master take it, breaking atomicity of the two operations
I need to perform on target device) and this is exactly what I need to avoid.

BTW the deselect is called regardless of the return code of select() - even if it returns an error. I'm not sure if this
might cause some problems (unbalanced numer of select/deselect operation) but I find it a little odd. Is this deliberate?

Best regards,
Krzysztof Adamski
