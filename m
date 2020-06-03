Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBF1D1ED822
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jun 2020 23:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgFCVkK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Jun 2020 17:40:10 -0400
Received: from mail-vi1eur05on2128.outbound.protection.outlook.com ([40.107.21.128]:55777
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725961AbgFCVkK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Jun 2020 17:40:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hjc6e17T9ETgQtRpdR8dvvMojvMrJYH25rXnjwYfkaUec5ReOWYZJFHFFUTKV6kSKIXFMaK1f5POZv0k0CefdhkVNm0mkHa7ejrDdBIbRM5jb3sVhEV6FnCL0CV6mDv0rDS+PCYfhm+vVk6tydMUSKGZ08x8bia4sbNOiX7AQ36uXo6V/ljMMWUi+QrlLbEyzZmJ3LcG5hqXu36j9uLjIlu19xRRst+KXN2qspkbP1m0zWBFl+tlaHTbIj2ApR45jHQU5q9YGDmZDM6wzVs0z5L220LkL76o1WqLUH9+5xg2a+tJsIVCc688nZ+q6lKA65gFyJ7mvUOVCmo7YUCBqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZAdQ9mOrogisVRM+z7EwxiPuob/6LiZkpF9sttyfTc=;
 b=e70t4xJXMi3aq0dzdPAOeAiyd+17vrZMj4fW/o1okMzvgliSalMI7QIjHH/vGxCQcFjMMgg45XqofE4MZSYDzFqnkM6yZyq178FqirjN67TTM4gOB7YyWCxNggAdnUC9MKViPo4IYKoBHZf/JWvjzW9JIj7aTG4PB+fm3cVuzO/S+NV2EHFxqWwFR48qIPlFz00CR+VVAeNeizfQmq51slIhzGHBzrao9w2DqZzYpo/22Cb7nSFVdo3V3Lsnsk/bGWS8Ll+lyDxKJPEY9HQzoQURudo+vENdaDxsKK8K+RF8oW9lk7bQa2Mi6LTypATdj1Pxa+Zu4o+2R6YG6zBYBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZAdQ9mOrogisVRM+z7EwxiPuob/6LiZkpF9sttyfTc=;
 b=gJi4wBBh2J1pYG/G03FKo914fcLMe12MkzNg8974N8nXyjYh2/ys7fuuWpwPevooy68iCKbWGv3F3DH9Ru9tbAidq4ops5HZlORpHmAywxpauu7WGjdNPnMH/2SF/RoT71IG4XztPkOcDw64ebleUwaEQpZHkDGi69SQsH9n4iQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5419.eurprd02.prod.outlook.com (2603:10a6:10:e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Wed, 3 Jun
 2020 21:40:05 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::ccd1:96b3:48dc:c5d1]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::ccd1:96b3:48dc:c5d1%7]) with mapi id 15.20.3045.024; Wed, 3 Jun 2020
 21:40:05 +0000
Subject: Re: [PATCH RESEND] i2c: mux: pca9541: Change bus control commands and
 release control of bus
To:     Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Quentin Strydom <qstrydom0@gmail.com>
References: <20200603191426.GA20270@workpc>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <ef9f8070-98f2-6aa9-d6a5-23fc91e2d26a@axentia.se>
Date:   Wed, 3 Jun 2020 23:40:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
In-Reply-To: <20200603191426.GA20270@workpc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR1001CA0017.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:3:f7::27) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.138.116) by HE1PR1001CA0017.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:f7::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 21:40:04 +0000
X-Originating-IP: [213.112.138.116]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3515dd08-92c3-45fa-5246-08d80806adad
X-MS-TrafficTypeDiagnostic: DB8PR02MB5419:
X-Microsoft-Antispam-PRVS: <DB8PR02MB541939EF78710103BA270531BC880@DB8PR02MB5419.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r/E374Clo2UX8BHjwO5F4qO4VVUiX6TNgwDKwWdMJNAUPurdujN72tl+RZpPV8AA39GlT7X/Fh703r5pn918qtQESXF+Cj570qWs8pecHfHnqzC/vlSOTJ5rlqv0VDMNWbNp9U0qOzRxNZeurquLIFllZhkqsfqfFDzyzl5IGerea+ZyX1Koiup4BUWNDXW0m428/+mB5eNZUn+Oi8AyVJVWvXu1e2FwPrVtgzgKJNAQIiyvIWlhFM/y+0qsiyguUIEw2Z4txZfv+t1EhnsaTiQouW78Aiq46PI1ucyOeh161ZeBcQcYW1eBBuBZYfGeuq2+XFDDfK6DyyBzplZb0D3/ejmPCdsQX2xV/PqsMudhDLOHleuRCG2H08o2Kd1iSJS6e+nxkscxsw9lDkhFjpp5OL9hSL8hGYU8uP8SOlYLGsUaokiWfrvU2xxyZLjWY3lUeaZmw+KfSgqQg7y5Rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(396003)(376002)(366004)(39830400003)(136003)(26005)(16526019)(186003)(5660300002)(53546011)(31696002)(36756003)(956004)(2616005)(66946007)(52116002)(31686004)(36916002)(83380400001)(66556008)(66476007)(86362001)(8676002)(6486002)(316002)(966005)(508600001)(6666004)(2906002)(8936002)(16576012)(110136005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: rD9cct8Y+YM000Y3sk/9xlCo6Lsz2O47Fv5irAIAVSkr6BCOpGsxq4NSPookg/SiCkX5GiuVxgk03sceZesXai5odeXQFqmuU5xvLBpYAt+nffJ6W//LT6OJbAPirMiKjuVhZF86A2BIShVCn+XcvqGPQpbGzE+sKswlJk9uB/pWwMmq+MQrvSGg6nl/yGSTz8GXIEKRVQQx28SGJLCexZOzAUFvPgKEjdGVW5Qv3gkUB8R89touiLOZn1GBqMQ0UnMSqJpAsnFYJEEsrVozSfTO8T3cndv5PqfCRm0CaNRnl4tVvwIntv8H5dfPML8RfxOn6AMFtQbrhgdsy4HbvTU+u26j4L3F2ZeL8dqg1F+CH/fgn3jXq4xavCMV9SnnTBh4IuOpIzXkOJB6L6rzVsY6MkFUrLQt7qZlLOd8HwT40SWfy7mktUBZzNOUarO43j07YXDYwt+brcKQlAiN0LV88JOJa3qDzHEXUh6fCMY=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 3515dd08-92c3-45fa-5246-08d80806adad
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 21:40:05.1557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXMLh9n6kxVcwYKBUvZV+pMZE37rTQ+FoCrsfybvUyOhS4wNQ+vyzjbfiMWw1D8f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5419
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-06-03 21:14, Quentin Strydom wrote:
> Change current bus commands to match the pca9541a datasheet
> (see table 12 on page 14 of
> https://www.nxp.com/docs/en/data-sheet/PCA9541A.pdf).
> 
> Also add change so that previous master releases control of bus.
> 
> Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
> ---
>  drivers/i2c/muxes/i2c-mux-pca9541.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
> index 50e1fb4aedf5..eb2552fbd0d0 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> @@ -134,7 +134,8 @@ static void pca9541_release_bus(struct i2c_client *client)
>  	reg = pca9541_reg_read(client, PCA9541_CONTROL);
>  	if (reg >= 0 && !busoff(reg) && mybus(reg))
>  		pca9541_reg_write(client, PCA9541_CONTROL,
> -				  (reg & PCA9541_CTL_NBUSON) >> 1);
> +				 (reg & (PCA9541_CTL_BUSON | PCA9541_CTL_MYBUS))

Hi!

First, some nits.

The initial ( should be aligned just like the removed line.

> +				 ^ (PCA9541_CTL_BUSON | PCA9541_CTL_MYBUS));

The ^ operator should be on the previous line.

However, this is also a quite complex argument. Some kind of temporary variable
would probably help clarify what is going on. Like so perhaps:

	if (...) {
		reg &= PCA9541_CTL_BUSON | PCA9541_CTL_MYBUS;
		reg ^= PCA9541_CTL_BUSON | PCA9541_CTL_MYBUS;
		pca9541_reg_write(client, PCA9541_CONTROL, reg);
	}

>  }
>  
>  /*
> @@ -163,7 +164,7 @@ static void pca9541_release_bus(struct i2c_client *client)
>  
>  /* Control commands per PCA9541 datasheet */
>  static const u8 pca9541_control[16] = {
> -	4, 0, 1, 5, 4, 4, 5, 5, 0, 0, 1, 1, 0, 4, 5, 1
> +	4, 4, 5, 5, 4, 4, 5, 5, 0, 0, 1, 1, 0, 0, 1, 1
>  };
>  
>  /*
> 

I'm sorry, and I know you're new at this, but this is not a "resend". A resend is
the exakt same patch and exact same commit message etc, and the only difference
is that you point out in the subject that this is a resend so that we maintainers
can spot things that we have failed to take care of in an orderly fashion.

When you change things around like you have done, the protocol is to mark each
new version with [PATCH v2], [PATCH v3] etc. If you have a 2-patch series, the
patches might be [PATCH v4 1/2] and [PATCH v4 2/2]. How else are we going to
know which patch/series *you* think is the latest and greatest?

When you do a new version, it is also extremely welcome with a description of what
changed since the last version, and why this was changed. The why part is very
often much more interesting and revealing than the what. But maintainers want
*both*. At least I do.

Also, you should usually allow some time for maintainers to react. I for one do this
on my spare time. You are the one wanting some change, so you should make it easy
for me to follow your reasoning.

I believe all of this is documented in Documentation/process/submitting-patches.rst

Drilling down in the specifics of this patch, I very much preferred it when these
two completely orthogonal changes were two patches. If one change is problematic,
that makes it much easier to undo just that change. And since you have now
presented four(?) different versions of the release hunk, I need more data on
exactly what was problematic with each of the previous iterations and what made
you send each of those versions out in the first place. Otherwise I'm just going
to expect a fifth version tomorrow, so why bother with the fourth today?

I would also like details on the testing this patch has received, and that
description fit nicely in the commit message. It's small one-liner patches like
this that require the most documentation, because it is so hard to believe that
this has been wrong for years without anyone noticing.

And I don't think pointing to the datasheet is enough in this case, since
datasheets are not always in line with reality. I'd like further descriptions
that details why the new way of doing things is better. You indicated somewhere
that the current code leads to double arbitration. That is exactly the things
that you should put in your commit message, with as much details as you have.

If you have looked with a scope, please state so in the commit message and add
some description of what you saw. Things like that.

Another example, I fail to see why it is a good idea to invert the PCA9541_CTL_BUSON
bit. The naming indicates that the bus is off, and it sure looks like inverting
that bit will make the bus go on. Why would you want that when you release the
bus? It's things like this needs explanations in the commit message and/or
comments in the code.

Gunther stating that he did lots of testing and that it was hard to get this
working originally also raises the bar for you.

I hope I'm not coming down too hard on you, and I do not want you to go away
or anything like that. I very much want you to push through with this! Please!
Because I do believe that your are correct in that the current code is not
right, I just need more information and I see no other source than you when
Gunther no longer has the HW (and datasheets cannot be universally trusted).

And others following this, please test if you can!

Cheers,
Peter
