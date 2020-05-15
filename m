Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B911D49E8
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 11:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgEOJqh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 05:46:37 -0400
Received: from mail-db8eur05on2096.outbound.protection.outlook.com ([40.107.20.96]:62432
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727861AbgEOJqh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 05:46:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZQ7SlP+OvQ7+zzEi3oHkQQoIllMK+KVHnbZ7dH2QzhDZp/twhOSpzsOpfmzz+OlLOD3k1Ombc1KngsvtJ2wBvcbggKWfi9FwFqxppOsO51Ks251mosfsYyGHZILJpQISKunxnjZF+uj/MBEaj3E/PzEywA1TSB8DR/4MMoALW8xN0+0zuzVespBNKK5tp3YZFmz6MywhHuhoGaArI9s7p8OgVu8LvYJG9BbG+reXlzwsmjaA4xkS1KMM4h8FYwZYwIYSw8NK8igVxhahn9kpKS5JIRpE/JbZHSaLnVvkPeEaty4YvGuRHhIDmP14d7e7f0tujMgNkWUrYlERbqJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpMg7u37kRt4Zjb0sYUpnIQ9BkAc3MRHo8nC1/ON4xw=;
 b=fkukPLX/RuttKvWAHd4Td0TNj9za12nhsK3pZKEec+UUoaa9j6YMzZgsg7wDtIHATzq9O/YS5myVSXBTBRqRjI2b4ISIzVHvU/lG4MrAWOrGbJXkyoUzn3epFa7SBElh4txbQXULYWSIt3hh4Qwq1hSQVKdDL0AgVNDaFrM4ZEOMXBXDud6AfeH+sabj1eL+AmMr9HreecU7q/yolNStAMTgk5HpLfTSFI7g94SIBcpoW6KlNBNe69tQYaLhD+rDWlieviRSeWDq93oHD6om2gk+zMN9oqV9100DCGF3LXUbl0NnoOyBOpw1FQUxRBScwR9HRMfYd5efAFGi0z/HKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpMg7u37kRt4Zjb0sYUpnIQ9BkAc3MRHo8nC1/ON4xw=;
 b=RAsiTuzrNwHFa1e/RCXk5z/3RamvPFbOtaQBWZYZ5+l6zxDVI6d+hb1svhCzjiq2t1tYawaONB8sl5tWMZYXONQaFHve/x0Zel1mnCU7OKRs924yd0gBMo4mraT1lOHmGu2UPbGOwMyWIWEYfuNJ3qK3Gy8CVYHC4eBACvw0fkE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from AM6PR07MB5957.eurprd07.prod.outlook.com (2603:10a6:20b:90::18)
 by AM6PR07MB4929.eurprd07.prod.outlook.com (2603:10a6:20b:35::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.11; Fri, 15 May
 2020 09:46:34 +0000
Received: from AM6PR07MB5957.eurprd07.prod.outlook.com
 ([fe80::74f8:a2fd:d0df:8ecc]) by AM6PR07MB5957.eurprd07.prod.outlook.com
 ([fe80::74f8:a2fd:d0df:8ecc%2]) with mapi id 15.20.3000.016; Fri, 15 May 2020
 09:46:34 +0000
Subject: Re: Two separate i2c transfers
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
 <20200514145005.GC1589@ninjato>
 <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
 <20200515075303.GA1083@ninjato>
 <820e15e2-9267-1bbb-0809-4e9dc19d566d@nokia.com>
 <20200515092042.GA2077@ninjato>
From:   =?UTF-8?Q?Adamski=2c_Krzysztof_=28Nokia_-_PL/Wroc=c5=82aw=29?= 
        <krzysztof.adamski@nokia.com>
Message-ID: <e2681cda-d609-428e-4752-24cd0962a740@nokia.com>
Date:   Fri, 15 May 2020 11:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200515092042.GA2077@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1P190CA0027.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::16)
 To AM6PR07MB5957.eurprd07.prod.outlook.com (2603:10a6:20b:90::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (131.228.2.19) by HE1P190CA0027.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Fri, 15 May 2020 09:46:32 +0000
X-Originating-IP: [131.228.2.19]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0f2b7615-55d7-494e-be30-08d7f8b4da9e
X-MS-TrafficTypeDiagnostic: AM6PR07MB4929:
X-Microsoft-Antispam-PRVS: <AM6PR07MB4929BE0BFEFE59DE2B43C913EFBD0@AM6PR07MB4929.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c/YAI9enzqwAmbzS3VyYExwlqLX9QN0krg7sjDzOrT9jFJ7zOOJ4Okedb/LZqZVKIET9dQV1zuOuIbjwqKKRxY1rmgAQauwEuAWETWdVtAE259Sxok+CHplJcceGxoWIfciNXzJSwYHvOTLqEx+YEjbShbiCfVXxXrJGKv7O6tBANNR1126u3VUPbCRUZmqv0uXnM8GkvoRQP7L3Fe4dSMbkXvvc+z2yS+KwUK6zoEhh3oefEO8qcJ0nyvCto1qQYsj53CFndUooCSt2nyaZRm9Ic1tajrqtoqC9cV3dUEClsvUjpzKp9MDWLBU7Xvi8bvAk2/Itm0P2ZT4APshv9ewROlqeePIKrwrZSOcXfKGnvVEvduTf9H1uhlGPSAfD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR07MB5957.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(4326008)(6506007)(2906002)(6486002)(316002)(6666004)(186003)(6512007)(16526019)(8676002)(54906003)(31696002)(8936002)(52116002)(36756003)(66556008)(66476007)(66946007)(31686004)(478600001)(2616005)(26005)(5660300002)(6916009)(956004)(86362001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: qvukioGyAi3LGUe5aQVGdNodeBQuhcSvYxjPo7LSqaTLYZrqdgrFE/QSx0pt9TCsztjN10y1RSUU65h6I9rIrHRIiFgDI4sQ03FCGUIVa0iT2CibueZ3F/jqFMelbxy0ZvX0mO4Uk4Rg0thQLnl7G4Y++ezS5bss9rraK848b5WouBgp3/0vb/9ArPXXDhzNM1pRxIPISx2SRnKEBcPHRW/GNpEFqDJwQvpTXcctzUe8nw1J++vJRoNOct+dCsz2ENOwjuEZEjw9pxSCzfG65In18Q4aKF/p2CSEzKDeML/9bX8AXCh0BnmOVbAMiRI/wKS/l23x2NReZjkyNKLS3/navNTYoBCv6i+Bv44G9UE0Y4AZCRQiKg8iEzPQrtOUcVPv9YOkXNGfO6vxRhhHEtohOMSI1PEESL1vND4MH5KBGob+DKLQWDSdIep3LuBg1FplsIGw61a1NR/shaC7MaWpl0IefQPRelcXNXdnMU8=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2b7615-55d7-494e-be30-08d7f8b4da9e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 09:46:34.3131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2ehaRzcQve4COWgWFCm3lI5yC2vZqpEZbMq3CqHub/SCVw+niiVS2RPCxGgUyIHXQJbjQcQDeJ+ss7swewCS3qPBash7o+MGiKl5UJrlGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB4929
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram

W dniu 15.05.2020 o 11:20, Wolfram Sang pisze:
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
> 

The problem here is that the i2c-mux framework will only take lock for one transfer i2c and will always drop this lock
after this one transfer. We can send multiple messages in one transaction and keep the lock for the whole time but what
I actually needs is to send multiple transactions, not just messages. We are programming flash memory of an target
device and we have to poll for some status bits before we can send more data, for example.

So there are two possibilities:

1. I could lock the arbitrator for the whole time the programming is done. This way I could indeed skip reading status
register.
2. We could lock the arbitrator, read the status register of the target device to check if programming is already
running, if it is not, then start it (which will set the bit in status register). Those to operations have to be atomic
so I have to hold the lock between the two transactions.

None of the two options can be done currently as mux layer will call deselect (releasing the lock) after each
transaction and we need more than one transaction (as described above). We need to use the 2nd option, however, as this
lets 2nd system still talk to some other devices on the downstream bus while the 1st one is performing the flashing of
the target device for example while we're waiting for target device to be ready for next page of data) but this is not
that relevant in this discussion.

Best regards,
Krzysztof Adamski
