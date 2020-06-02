Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C73EA1EBEB4
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jun 2020 17:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgFBPFk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Jun 2020 11:05:40 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com ([40.107.8.91]:20737
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726073AbgFBPFk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Jun 2020 11:05:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gau3skRLLVMIC2pATzfIwHfsknwBQ61rq/7BsgpqQTJ3mZn1i+BIT0j3ZDIKwrjw4KX/1gDIyZn0J9Awss3HhDKdVPlHpdsf4r298rvnOZLOnEhQPXrWE6Q8+YMKOsvuXd49t1NTZAQ0buBZ8kzrI8wFjhAn1fcgUoATwaU9kqtOAavgPCrv7pinh2shKl0Q5c6qjGknGxMOgLc682xRN4+MKeANrHtNykfBEgzrZg1qc31AhbNwnO7vBfgLY+vkPFywyLS0M8hq7P1cprnHbIt48NJtI8N4fpjlnr2w9KXbwK9xzKcZZAbFmnbKkrHw8DyLvFignuvb49cWa7vf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmpoA4vL7CKSGZUinjwHc/3liT6xHC8viqPCBaAs2V0=;
 b=G73TZ4Z1/sgp36Xb06Dg/L0SB8Mw0dYT8BoAE0viuVE5Thd0OjXADTeDRGj9aQW1rQfIBVFTkra+ebotwUJyEwDDu8DQb4IqQG6UK4ytVasQidsSZfELKWp/BAXzvGxT0KPJWBeJQcWldMK8frthwxBpFrKQE9qotzJ5tzSt84kUec52XRmklbpkeFzOzJh+4FFtSWO9LJyf1LKsA4iFhpVNb4rdPmIMVj7EutU8dm14tK2Rm3XqK+XNl9Q8khXgitQDjyeAhpL0rbrAr3GAPYNTxwBAOYJhwaWI/QJ4Df9pDdBU/sa7PjIM4JG1mUQFtbN+pd641ZMPMKpjwS/FmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmpoA4vL7CKSGZUinjwHc/3liT6xHC8viqPCBaAs2V0=;
 b=WQJQdg2IHH8nRdBwi3PnJrmDjdsXm58j62v4YUW17L2tw1cnXActd2j0S18sHITijjCF5GreuB10BRP+9pAJdF/vJdxFzO0jBM00S5O0/TtLwxw2BTnr52eCMI0yOS/4WwF3HWhIXfBrmTxz6LfAyOmKqbGcYXrxZpLIzk2XGHw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5884.eurprd02.prod.outlook.com (2603:10a6:10:118::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Tue, 2 Jun
 2020 15:05:35 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::ccd1:96b3:48dc:c5d1]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::ccd1:96b3:48dc:c5d1%7]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 15:05:35 +0000
Subject: Re: [PATCH 1/2] i2c: mux: pca9541: Change to correct bus control
 commands
To:     Quentin Strydom <quentin.strydom@bluwireless.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1591099969-30446-1-git-send-email-quentin.strydom@bluwireless.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <2e2c3b98-20a6-2671-ad74-a0f171073bd0@axentia.se>
Date:   Tue, 2 Jun 2020 17:05:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
In-Reply-To: <1591099969-30446-1-git-send-email-quentin.strydom@bluwireless.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0402CA0057.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::46) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.138.116) by HE1PR0402CA0057.eurprd04.prod.outlook.com (2603:10a6:7:7c::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 15:05:34 +0000
X-Originating-IP: [213.112.138.116]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8eb43fc0-34ee-4917-bf05-08d8070666d2
X-MS-TrafficTypeDiagnostic: DB8PR02MB5884:
X-Microsoft-Antispam-PRVS: <DB8PR02MB5884E67728082913DE5BDFBEBC8B0@DB8PR02MB5884.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eVD9cKCsw/+jHy5mwohlaBdcKmJI5oASr+YcrgB1m7mo7v94W/41F9JtboNk7QWxgl6h69B4TbHO7hHXRVSZv+yHpd33KAOxoJOjrmF8Ui2F941ZcXeTOSqmXKpkez7VMPoWQbgHFKSnyqWjzXtibIPbDcuVfAD7xOciepxcuJCTG+WvB8PRye/6w7Y9PA7EYrG/nOk5tpS3jFpUIJ9QnbkOkaQNuQPq8gDy7Wc7PJhxEQmGQ0/kzgvLQmepKUN2SnkajLSSgmW8t6Tgf+LsQmNtcUj2GPLZgdLrvgugsWniMgYIJm8Ke4AlFiWr2xav7TxPGnT/hTbQp8Kq0/0spfKTA7Prr6QpTxcVGJdTrn06iqm6+ZpR1dBsicNPDTx3PaNj4cxwoVpN+tUS25oF0vIZyS4xcxYvdyGAKJ1KyTPHURHm4AQ3tsDKNH5sOAto9eQD8ZbgDLlMxWpE0tgwag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39830400003)(366004)(396003)(136003)(83380400001)(5660300002)(316002)(36756003)(26005)(86362001)(31696002)(6666004)(186003)(66556008)(66476007)(16576012)(2906002)(16526019)(110136005)(66946007)(53546011)(6486002)(36916002)(52116002)(508600001)(956004)(8936002)(2616005)(966005)(31686004)(8676002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: MGdmsFe6bqEOEbIwbjxW0/PVs+6OgzfpysS55zTcwe+xrduIFDCQ7/tyvpf3TOjqonHBMCvB7+OBy311f6tg7dhx1fd/gCS3IP/rdUy66aQosmoUD9LZcc9Vsa4h1UcrWWw+jp2ZCJ4UckG4MYnTHjfd27BYPUQxEGNMRC2hGOenH7YcybcMtbEtiPE8goH7jCgvQQVcSZSsVzO9XaUoZ40FQ+9MJ+2ZesccNiP2cH20gcq2OuqlHK4S6EjPwoHgInSwizcWxF0SdiOzTmyzyBKzNoxY4dFkrLNhqNP9ZNmaTw8KBntHPaaEco9Vg1hQao6F/0zLk2GhAXwzAQXFGAW+w9Hv195BCjGtR3LI+lP7OSy+6F7/VvQFDMzsop/0GRaUMCDq4I5x5UZbSQHM6v8o5KIQnMQop3/SLehyqB7TzP/Gu5gu8cbkBHrGb9seGTa9Maj35ditOhWUgbhS7st6CPXlX2HXPgyiLO20tMw=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb43fc0-34ee-4917-bf05-08d8070666d2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 15:05:35.1449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxScoJ950OxqcQGkiBx79i91lft3I48wSKP1wKk7h7HKp2UvD/IFHOeoMqMHmrkp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5884
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-06-02 14:12, Quentin Strydom wrote:
> Change current bus commands to match the pca9541a datasheet
> (see table 12 on page 14 of
> https://www.nxp.com/docs/en/data-sheet/PCA9541A.pdf). Also
> where entries are marked as no change the current control
> command is repeated as the current master reading the
> control register has control of the bus and bus is on.
> 
> Signed-off-by: Quentin Strydom <quentin.strydom@bluwireless.com>
> ---
>  drivers/i2c/muxes/i2c-mux-pca9541.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
> index 6a39ada..50808fa 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> @@ -211,7 +211,7 @@ static void pca9541_release_bus(struct i2c_client *client)
>  
>  /* Control commands per PCA9541 datasheet */
>  static const u8 pca9541_control[16] = {
> -	4, 0, 1, 5, 4, 4, 5, 5, 0, 0, 1, 1, 0, 4, 5, 1
> +	4, 4, 5, 5, 4, 4, 5, 7, 8, 0, 1, 11, 0, 0, 1, 1
>  };
>  
>  /*

I found all your mails from git send-email in my spam folder. They probably
lack some headers that have become increasingly important... [Don't ask me
for further details.]

I do not have the HW to test this. I'm only going by the datasheet.

But yes, pca9541_control[1] and [2] indeed seem exchanged with [13] and [14].

However, pca9541_control[5], [7], [8], and [11] are never used AFAICT.
Trying to write 7, 8 and 11 also attempts to write various read-only bits
and makes no sense. So, I'd skip those changes.

All that said, I'm a bit skeptic as to why this has worked at all if this
is incorrect. I would like to see a more detailed failure description that
could explain why this change is indeed "it".

Cheers,
Peter
