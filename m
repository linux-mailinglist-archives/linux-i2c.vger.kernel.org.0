Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC32923DE86
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 19:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728168AbgHFR0y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 13:26:54 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:59616 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729792AbgHFRCC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 13:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1596733320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y9kBOOdZEEej7ZEMsqH+ctYfRfzHs9cxAnplDiFJTdY=;
        b=ewk9s43PDkdkEvY2vzM5AtkqBUlEuLqJ+f9lOzD2LO7aR4OWIvqy6jXPDlSk2/El34BUgt
        5xFi9UF3Y0FdvtPQCJW+FH96qLZLU3s042mv4NW4WpBKKh6pY7dw3U7U3zqifofvDs9HMX
        E3h/NiRfsJY4OK286c3PB2t41O/C1Uk=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-hcpBO9YnP6WiSjWmpHCSUg-1; Thu, 06 Aug 2020 15:35:05 +0200
X-MC-Unique: hcpBO9YnP6WiSjWmpHCSUg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHtNTC/LRi/KQq3xeuhnxPzyqOWh6wd7L2eKLdTlTvveL4U/xCp4hUA8FlTEeWkKOoO6SeK+k9kgOQqencv+lLHLWjmTcZp/QI7yLOao0f3mSQljdOTa31DSACJMhNW0IrepEXOEfDkKRZ7G4/AvLtE5nWSB0vSCcm6CIqsrhCu3ZgFEU+pteT25kCAaw8IqG9fP/3MkXsBzcj+aBNXJYo9HD9ELER+GweuwYdwE/d+Yz24zgvX2Lmk7h7B0VCH1ub8wT9f9HH86eSCfTWQjiPrq0tEoEUwTfxiRLvu0kvUviCJ93G3Y4xslcZvjl4ebQeRMXNURige/+dGuIgonZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9kBOOdZEEej7ZEMsqH+ctYfRfzHs9cxAnplDiFJTdY=;
 b=GBZuBCuwbgohQG3feJMXudne/aGqQt8iNVcfQtguklFwbvgjhkUU8O4EdYJSUkyOSwhcRSVgAPL6pqVT6KvTSE/jV694ZrAAzpJS1HlosRd768xrP0bzAx07w7c3fQM6w/cJ/xXWb/vYT40j0GMle9pZmyNK57lVaMwddgcMQ5lJ4a635xCnbkMmssuTgTvAROBEjfQbqKm1gxzrZRemNp2xUhEgb34UTJUIRUb13BtgMXeFQhGJ6rgSyT0OgnWdxusmj33pKOQgba1g6wVEyR2wCzhnLOAi8EdSl8IZCG/uIYsIgkTD+egrYUG5KHhUMrqJZQ3/QaVUIkATPGC+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com (2603:10a6:20b:9d::19)
 by AM7PR04MB7141.eurprd04.prod.outlook.com (2603:10a6:20b:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 6 Aug
 2020 13:35:03 +0000
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::3050:e412:7b95:de7d]) by AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::3050:e412:7b95:de7d%7]) with mapi id 15.20.3261.019; Thu, 6 Aug 2020
 13:35:03 +0000
Subject: Re: [PATCH] i2c: mediatek: Fix i2c_spec_values description
To:     Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     wsa@the-dreams.de, yingjoe.chen@mediatek.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <c410f784-7b51-0d65-7a41-3845214dd273@gmail.com>
 <1596712005.8263.4.camel@mhfsdcap03>
From:   Matthias Brugger <mbrugger@suse.com>
Message-ID: <6e029d96-6171-0006-a5bb-01d0d5a7391b@suse.com>
Date:   Thu, 6 Aug 2020 15:35:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1596712005.8263.4.camel@mhfsdcap03>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR2P264CA0156.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::19) To AM6PR04MB5366.eurprd04.prod.outlook.com
 (2603:10a6:20b:9d::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ziggy.stardust (213.195.117.232) by MR2P264CA0156.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend Transport; Thu, 6 Aug 2020 13:35:02 +0000
X-Originating-IP: [213.195.117.232]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fd860f5-0d0a-4f68-dd8d-08d83a0d860a
X-MS-TrafficTypeDiagnostic: AM7PR04MB7141:
X-Microsoft-Antispam-PRVS: <AM7PR04MB7141881A84DCD725D45EFFCDBA480@AM7PR04MB7141.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqjE1z8u6le7vfVd+Z82bTP//L7ZcsRrIPJZH7ABJEyx8cPZwgHiWs9AIZyVWwZoAzfKu7TYDi7y+Enqc3m40XyePa9CQDezVLv4uBpqFc+rjZKTkrt9GLayfgnvZNbJH67dp/SoD+M2XqUuBHRG4NGzxO22f7R+kMLNXPJ/lXw8hsYWHjYi1mymKbTe588lu28NCyO+gC8t5A6hjT2p6E7OoBJlsAy4OIy9Y1padcJpHdA4+yi+TK2NAKgtc3owPSvwBTvLww9alF3cuMvxxZXQM2nUmYt8rFJXVGw3jrKdsuS0MEVHVol+elO4GeHCNVHJU1zuEFeBeszIS4+fujtiwj5EyacDoVVot+wXQ7jnUh6vcwDgpm1SGBj9Fh1L
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(396003)(136003)(366004)(346002)(376002)(5660300002)(66556008)(86362001)(2616005)(956004)(66946007)(36756003)(66476007)(16526019)(26005)(186003)(6506007)(83380400001)(31696002)(52116002)(53546011)(478600001)(6512007)(4326008)(8676002)(31686004)(6486002)(110136005)(316002)(2906002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 6t68Zh/YCIxYkAcg1OYO1zrAEF0ZjBuOe381HV1tZ9s0bALfwANkibiTOvC3CyfPAjUkJ5/y8bXvizmAY8nFlPdjjgOZ4Y1ina0bIClGVrnNqPU8gD6or5aC8l0QJApvpjeimkuROuGuJWhB8X2fton9TeBrN3aiEXTWul7fTenen8pZHSPaDkIowVS20xMcrhC2rgXHO8qa1jSjfNnfx1llzg3y1HyifEXDBXonF/dr0q69kLeaHPAVV0kmzVS9X9SuT6t3qpZZqqUp+ocYaxvwSlFXOvI6AYsx3+5NqlVUYJxfEeVgW0HfIF1Cr7wd2dkPR7GjmGosM/7hP7zm51a21LlsrrnWCDBwM4Y4Mg52NrOYHvmCiDO6jkCZ3pDRn8bBnJZVOLv7XmjNYVbKqtfF8F5qpI8KLotPpQGZSzbTqtTshqZavt1a2ZG77GzkJbgixYe1TA8m48r/6Q7aSLwMcgjD9ssg2tQQqxFpgqFEPBFVbhpJnQrHOxWg0zK5Ll12KoJkzpnNcRfqnydyPYAzuB7L22ASwxicCC93rw/Elca3eImvji/0vJ8hYJuaj5fxdoZOX8zIEIjPpRSSd9NFle167QZm2FljT9EZud4nDXDKyZde7A57N4FtGP3jMVxl/rcazwmZIMbvySTfCw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd860f5-0d0a-4f68-dd8d-08d83a0d860a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:35:03.2718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Rd09f+lJJ23Hn4x+zDtD+YCaLi2e5ZHcOeB4n359Ul6JG/azXeMO8BmtVlkngudAK9YGABE6pUX7/4o3NRV+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7141
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 06/08/2020 13:06, Qii Wang wrote:
> On Thu, 2020-08-06 at 11:48 +0200, Matthias Brugger wrote:
>> The struct i2c_spec_values have it's members documented but is missing the
>> starting '@', which leads to warings like:
>>
>> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member
>> 'min_low_ns' not described in 'i2c_spec_values'
>>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>> ---
>>    drivers/i2c/busses/i2c-mt65xx.c | 8 ++++----
>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
>> index e889f74703e4..f51b35fc400f 100644
>> --- a/drivers/i2c/busses/i2c-mt65xx.c
>> +++ b/drivers/i2c/busses/i2c-mt65xx.c
>> @@ -253,10 +253,10 @@ struct mtk_i2c {
>>
>>    /**
>>     * struct i2c_spec_values:
>> - * min_low_ns: min LOW period of the SCL clock
> 
> Can you help me add a description of min_high_ns. As
> @min_high_ns: min HIGH period of the SCL clock

Right, I forgot about this one.

Actually I don't see any code which uses the value, so I think it should be 
deleted from the struct.

Do you have any thoughts on this.

Regards,
Matthias

