Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189112E895A
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Jan 2021 00:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbhABXlx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Jan 2021 18:41:53 -0500
Received: from mail-vi1eur05on2132.outbound.protection.outlook.com ([40.107.21.132]:27361
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726822AbhABXlw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 Jan 2021 18:41:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1BwrkwjYa3kbf/ju0lhtQPW12Ex7CGvBh6yIXDamZ1Gd/wQJBEfXe7nGYrcWVQ9xkgwJ5F/LgnUbpNBwXSmbnZ4lR9OyH88LlAsyKYj4CG8y3D3ewkKaJHNeGYwKZJ0qBja/jckm2pivzMciztaxc6TQw4f5/CWalMfVzCBndsJMPY6INafVryg1JL+UW6zkf4Ob2yApjaXHccKRHKqMsVNo/CW4cCBJXXtHxM0Asu88reBhZCT3ZfoaQgsc546J0RZoeWsYOSNmLKYsRYE+bJyA1wbL8kqLSssuEKiND/of3siQ3EQ+JB+zafCJi0G0NTQ22iyoZ54W9MVLIU5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c0GLhvnL+a2w3M/3jbAw4waVNG5d8NJ92v+JJIm1Eo=;
 b=JGbDsAFwgba1w5qDJk5apz/yqyFFQ+tZRkArBUtFkR/QgtbRM9tbwbLatYOTs+Q7M0SLcNP9jqHseZdqBOHsQlTGSuu8ESByvgK5+WY1kh64ir6g3l7kYvf0I9Hr1GFaGcqQDbqgsJ90pvGUow7sk2wDE0npRPD6uYn7a15n84e3mcnh+3htGfRHAZ2tNgvWiPaVdr5kecnFgbrPdAq95yKPwPlYXDWfG20TMSw2op+xgTa42nZIgV0nIBHKiNJuQwXwAe2lnxDr6qxhbcFvIqRHiIuMV6fBdr7Hghv3y9RE0PHl63vL7gyd2XiTddrtkRrkWhqw/161hSohCR3bFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c0GLhvnL+a2w3M/3jbAw4waVNG5d8NJ92v+JJIm1Eo=;
 b=KceMB5EAIaxmj6FKbiwZLjD3aqCe48hSImIRxzPLSWgEHLSiuIc9zrcXT5S7+T1FZwOCoXdokOzuQaEqlvETQ4vdPifVdwOtEVGp4xupTtwsqdnHhVxUctTu2kg3NM6RfVkolUBQC9kRrK5KwKsRGAWnTFnENLxIVK+7E4xW5+w=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB9PR02MB6890.eurprd02.prod.outlook.com (2603:10a6:10:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Sat, 2 Jan
 2021 23:41:02 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3721.024; Sat, 2 Jan 2021
 23:41:02 +0000
Subject: Re: repo update
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>
References: <CAHp75VeTO1RR-tGhz-uN+bOMRphAcHpe95GrRrQTtrEs+itK=A@mail.gmail.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <73fa7ef3-8f29-b7a8-803f-a6da1246d3f9@axentia.se>
Date:   Sun, 3 Jan 2021 00:40:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <CAHp75VeTO1RR-tGhz-uN+bOMRphAcHpe95GrRrQTtrEs+itK=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR06CA0154.eurprd06.prod.outlook.com
 (2603:10a6:7:16::41) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR06CA0154.eurprd06.prod.outlook.com (2603:10a6:7:16::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend Transport; Sat, 2 Jan 2021 23:41:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 426c8dbe-a4f4-4c00-d16a-08d8af77ddae
X-MS-TrafficTypeDiagnostic: DB9PR02MB6890:
X-Microsoft-Antispam-PRVS: <DB9PR02MB68909F0163F9689F01DADF31BCD40@DB9PR02MB6890.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uxLGCOUC1L+/t3QNsQMCIeC5KTSDDsiP4C1kOSr4UI+33nH3ah6b/VNoJLRw41NvWNam8UbKZNENcWHWCHV7aUDyFH/HhUDM/+0DdrnCre0dwpJuAABuNg74Nab7iqW8r/p0i3SilX2YpbCyDux+v6aeMz9JTxnQ8K2CVc2rtGkKAJZAVX1jVKfDCRzvJalm02Z9Q0bGc0BlU+/QDpp8F+uVhPStnJrCvbasVubfCJo3KPWgCu/FOoiP9v/B5/pDiaITCzlFAxm98QnLfrxHD+xDNPsQzBNhm+/Ml8Ua4eMUw101zxz9PjKFUwrVdIf36WkqJxLuuFkYTziYffZm9xq8NpUfWes2ZBNsVSeD6LFgwR6JJNXIaa5zzVuR/Mhps2tMOoBHX32qjJlcI1NXrDLAJS7oaetFTFHMZjB1Dyju+gG/tB642gEDzjLj4yEiJClS38ALo11EUwk/leIxMVC70RJ+huyWP/PzzqTMRdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(136003)(39830400003)(366004)(31696002)(8936002)(508600001)(2616005)(36756003)(956004)(3480700007)(4001150100001)(15650500001)(4326008)(186003)(16526019)(6916009)(53546011)(36916002)(86362001)(6486002)(16576012)(6666004)(316002)(83380400001)(7116003)(26005)(4744005)(2906002)(8676002)(66946007)(5660300002)(66556008)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SFkwc2RBcllPMUxaLzNRQVpkc0NYSUdhVG50bEwxalFYVlNZZ256dVlINlEr?=
 =?utf-8?B?d1c0ZkZ2N1NucjFDZi92YldkS0dxODJsWGZUa3huRmpUM1g1QVBRWi8xZDRV?=
 =?utf-8?B?dThHNENPVHRqc0k3NElyRitTNkk0aDRkKzBPSWVzU3dSaHI1TnliVTlhTGZ5?=
 =?utf-8?B?YnJLTU5OZnA4WWlFYlVFZnd1THBPMUZCcnR1Y1VBYlRENGhmeUZnSlNiejIv?=
 =?utf-8?B?WjZtdXF3c0NTcnRTOEJ5aDZWN20rK3BLUnplZEtNVm5HWW9QUDlscEtYUUZM?=
 =?utf-8?B?SElzY0F6a2dWWkwyNnppYWVSblEwSmtvdklSR2tLcTA3aUJ2cDBGQTQraGtr?=
 =?utf-8?B?alI1Z3FyN0crZ01oczJld1BkMjZ3Zy9vNU92amdJeDJLS2RqV0lNclhaT2Fk?=
 =?utf-8?B?OWVEVFpOVmxnMmh0ZjhsMVQ2QUtmT2ZRRHhQVXNHb01XODJKem5zYU94d2ZX?=
 =?utf-8?B?c0oyMjE1UWJTZjdtR0ZkMzVXdkxjOGE3YTNFVmM2bkJNWWh3QkZpYjA2WHZw?=
 =?utf-8?B?akJHQjBIL0tSNkptK2VidFRMVEVlbUJ5TGZRUXF3VU9PKzZxNVpwbzNUVTFK?=
 =?utf-8?B?UDZ3Qi9CTXhYU3JBc0RLa2J3ZEtBM3RwNmxkcXlkRFJjeno4bmt4dzQ2bXJ6?=
 =?utf-8?B?aUdZRWh1RjhDMXliRHBVT3dPMlRGVlI0UVE2K3RjaWMzU0JSbUhyUWo5cVFM?=
 =?utf-8?B?dWVKQi9nS09kZldPRTJhd056bWtGN1pNaS92UEJlR1c5a1hpOUZBQ2N5c0pt?=
 =?utf-8?B?ZWdPZVdMNkpPY3ZZTTc3NHhCVWJFUklLY1E1bzNPdWpZakpSZ29DbUtGQkw2?=
 =?utf-8?B?MFY3UExISEhoeVV5WWNrUGFleWZyaUNlOXhLUVZjMkxYakVQQmVEZ2h6RC9k?=
 =?utf-8?B?Ykd2Wi8wRXlvTTBOSklROSt4Yjc5eUJubCtVMkZUUnBQeEhlSFEvbnhRWkpw?=
 =?utf-8?B?aWRtM2hNcmx6R2ZlaytPZzZrUUQ2UkwxREp1dTBqek1rN2RKTEFEVUo2ZFNa?=
 =?utf-8?B?TEErdE9NWlhUVERtVGU2RTNkL2VhaHpnYWprSy9ZT2s1NmRtaDVuYkErWFBx?=
 =?utf-8?B?N0ZOamFaYStOZzRuN3Q2cnE1VGFjSUJwMTZZb1F2UURHYXRJTlE0N3dNZHV0?=
 =?utf-8?B?WDA5NGJZaGd3WGdIeWkzZjVTdFR6S01NMkRqQzFhaVQ2Y0JPK2JHMitXZ2RW?=
 =?utf-8?B?Y2IxNHZ5ZEY5Z2VFZXJONC9KRyt0L1FZVnpod0hrem1mWERFY01iZ0VIUS93?=
 =?utf-8?B?NjFIQXp3bnExYTBDT3RSdHY3SDBjNUQxeFhoMFRUU0NXbW1iRUkyeEJYNEQ0?=
 =?utf-8?Q?GZ8BEqp+lslzw+FtZE55BhZJpG+WgjCsYH?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2021 23:41:02.7336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-Network-Message-Id: 426c8dbe-a4f4-4c00-d16a-08d8af77ddae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9Lt3cT78yG3OdEKnNiB0nDCujeR/njfLDSyO2O6WeeSvTNnZw/NrqBrO+hGZ2UK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6890
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020-12-14 16:05, Andy Shevchenko wrote:
> Hi, Peter.
> 
> For a few releases I have been observing the mux patch ("mux:
> adgs1408: Add mod_devicetable.h...") dangling in Linux Next. It seems
> that one of your repositories hasn't been updated to one of the
> vanilla rc:s or releases. Can you align it so it will not linger in
> Linux Next anymore?

Hi Andy,

Updated now, sorry for the inconvenience. Not much going on in
drivers/mux...

Cheers,
Peter
