Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E0B1CF776
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 16:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgELOlE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 10:41:04 -0400
Received: from mail-eopbgr60123.outbound.protection.outlook.com ([40.107.6.123]:13141
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726055AbgELOlE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 10:41:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/0UGDXqqixPOJn20EQcFzI3+uwxGunk9G3bKamRb2pDGxSeHJuJyspqisfI5UYysi03yEV9Nei7hOLbidJ1EUsHBEDpmdqr9TDdYYI5kanVlrFzIprzQeiu/IvRtF9INq1xgyDEGt+M6sIi/34pe4cHONby3i0JYE3GNLOfSXvax1RqaHD+K8JemwYYpCly7RUwg2NHwVMbg4/rdYnx/pqGA561MArwP+7UaIWRpIxl9YuJFB7nM9RAuJjRU7HbNEPJl5bpUs8CUJ+T5AtXRBidtF+nXc8PZATYak5VeTuxx2cP7LBfIT5VraiXC3pELy3PcqQVIhLCOL8dWUNrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAZM/PV5fhmZJC/fhqPCjYhOsuARpNS7JrSmXcMsqWQ=;
 b=lu7zKYOsnNjLrKrn97dHbZcclPiUOiaoJLTHRGnLhiYrg3Qi52hZWtvCu3FOx3yyeVbuIqA0089e5eIII5gy1Glxbkgq7Lwr8Kt+JIOvHrVbkjx5osqY6bdWQivMeN61ZvYJNn/1JsDP4ugybDggceSSJ2OSVvaJ7z+MiltE7Bl9PGOfEFyKsjA/Lqi5YlMXfGns/hqdPBCatF6J2jBBbKSex06VxIO5WJk8UGVpwJKT/ZhCR4NH4J8fRzn0R9U5OF/kjwi8TY/tRAg8Hz0ISyGmVu/FcEsudbH52oR6JfEMSThIZaGar4oL6j7V2VvcHUHM3vdLRJlLyyeGqdmGkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAZM/PV5fhmZJC/fhqPCjYhOsuARpNS7JrSmXcMsqWQ=;
 b=SSYc5hDZwCMbdFzkfnHssAvBqzfl8qLk9zkH3ZSwZHkrQP9e2pMwsUHJh5OQOvnyWs9BNUuLLM9oLKvhPnNrz0Vk+MOOLaeLdFphclnN6hMEFJ+djOmNfJpQTWz8e6ISnBk/ZUOEFT36hPK3lV6lt5JOtyAi03TmeQC7R5giP+w=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5452.eurprd02.prod.outlook.com (2603:10a6:10:e3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Tue, 12 May
 2020 14:41:00 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a%7]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 14:41:00 +0000
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: Fix an error handling path in
 'i2c_demux_pinctrl_probe()'
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     robh@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200506192100.194821-1-christophe.jaillet@wanadoo.fr>
 <20200512130802.GC13516@ninjato>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <3e1f4c56-c590-8121-7129-9ebbf4db773d@axentia.se>
Date:   Tue, 12 May 2020 16:40:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200512130802.GC13516@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0501CA0025.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::35) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.138.116) by HE1PR0501CA0025.eurprd05.prod.outlook.com (2603:10a6:3:1a::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.29 via Frontend Transport; Tue, 12 May 2020 14:40:59 +0000
X-Originating-IP: [213.112.138.116]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5904adcc-5d05-48c6-98d1-08d7f6827cfe
X-MS-TrafficTypeDiagnostic: DB8PR02MB5452:
X-Microsoft-Antispam-PRVS: <DB8PR02MB54528EA548F04E4119E00DF6BCBE0@DB8PR02MB5452.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7t9CFHVxrGaE9UuABFPdaUJQxtT0g5HXwqqPAO1TEwhAgzO3SKGwniSCjP1VOFaawXOYPoRb44wiQ3RrTw/LYZgn39BbotrMhLLYl/JTzYTQL/pR27jHmZbhOzykCvsLBXdgmaGPLL3KdLB3D8E2gAV8RHrqJHby9P4LaGEEKnVCDblE6bSSKvUMHnTk/Fj2hUekzjhsm+pfGUZ7XOJu6hABwGa8u0ngCd6N4sPbe+hovyo3f8fO2+Af2xULEZrFuJGbPgM6XaMvL+zgTa/lM6Q7HvXMrq/sJejEJ7XpN2naETu/h+70ENaVWKoljoWq++3beNFXQ0Ixye3FnpUs2ELEuKOA+EhkZboaLzRhynExnAIHcFOxyEhpdKh467xw8qHxXzvnycPATY4iIfH3bHuK05avinJPfWyDuV7QQtaIH/CxiGSyFJjCL1npDBv9lZCss6+Zy6dCH8k1nx0JLnzzYuI8yT1ETgMhmEwU4NwHpwvd5l3BJ8qixkR3PLBDplHScebP+B9m4LMPX1RMYSBMt43B0PLJoEEpwrnGnw2O2luu20AM+7zIOJYQrqFw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39830400003)(136003)(366004)(346002)(376002)(33430700001)(33440700001)(956004)(4744005)(8936002)(31686004)(6486002)(316002)(16576012)(5660300002)(2906002)(110136005)(16526019)(66476007)(86362001)(52116002)(36916002)(26005)(2616005)(66556008)(31696002)(508600001)(4326008)(8676002)(36756003)(53546011)(186003)(66946007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: a5hAuNjkLSuP/6gmi0meGfsZ2gzcKanbN4c4AuYvS75R5FO37Nc3H2B8fO5SEzaM6rqnBBAHPUWVN6rRRZBxJbBPIhahqylP9RvBhMyeIBSH7Wy28XmS9mfEXboptzSlKyNRc3Ghr2IZRNnv6z5jSsBNVrBTJd00YN1L8QftRCJrfVHFtWUDifkyooZGS7xPJM/1LPuFa3CUYZbGNruULSn5ImMZfYUvfW5QFCqAcpUUfD9T3rzJJV/S7CJUgUQI+mkRhpmgX8I6TtNiRKzvo3mWQ/TpjwW7D40Ok2E3ydeSdoRk6bC8kfj1YkYu1oDyS3D5qpWA6UqkCvakTwCIQpohGVCXAty4/RNUkKkn40L+Ror/VDR7aWVMq4I2kSQOsmZKR1/GmptVciqCSRDdCU9DPatMtpCsV4Gscreqf0WKAQA7r8FqA8judwasxTlmNCTD7pD+vkKi8V3aB5hrHqEJS4ma0nHZGHMGjDVkwek=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 5904adcc-5d05-48c6-98d1-08d7f6827cfe
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 14:41:00.3283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AoyiZajFrwgx0yWGVYJFVFJl5xN9yYChm7Fkt8o11ApaN04397fvxXz6DdAUA39L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5452
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-05-12 15:08, Wolfram Sang wrote:
> On Wed, May 06, 2020 at 09:21:00PM +0200, Christophe JAILLET wrote:
>> A call to 'i2c_demux_deactivate_master()' is missing in the error handling
>> path, as already done in the remove function.
>>
>> Fixes: 50a5ba876908 ("i2c: mux: demux-pinctrl: add driver")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Applied to for-current, thanks! Peter, I hope you are okay with me
> applying patches for my strange driver directly.

Absolutely, you have always "owned" that one. I prefer to stay out :-)

Cheers,
Peter
