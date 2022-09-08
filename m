Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED605B1FA2
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 15:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbiIHNwH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 09:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbiIHNv6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 09:51:58 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2134.outbound.protection.outlook.com [40.107.105.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3076BF6B81;
        Thu,  8 Sep 2022 06:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ikm9CZL/TYDRuINr0DdX7nWbDlvoMnYOmnI10Z1afgwnPLQTAv405JaJ9UcPSJQzQF4KWSKYISRzdBCcwxXXRps+fs6t27lc12QBW/2YwB0Ot/Mz2mRUyPJcENEW1dtVHwS3nBTY9YIQ+SR90z69DXfRZ94lyXzUELmjuG1lSf9aW/v9iHsbM4aJyT5AGjg3hH8Wi3oxXFpO+tfpylklY/huU/wJwkugQGW0qx6u24uqxnNAfug+K7H1fFyfUE1uy/QHA5TS+yWJ/GMvPlavJRmEP57HaesH15x/rmyrsR7RpG+R5m/IqVqCBWIGghFbmLKr6LpYOQTpN5zxpptXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNzlC/Z3nSBhKCLeuNgRAsjqefRVsiEXMFxlPws2rKY=;
 b=UaHWT4AmCW4lTkuRrmitTZ9ERlNhgpqFnVHO3pHwXYMufeaNxnPJXvPGNsRG0ocCgF5aDs0HPOyvoMiOw2URmiH0HrvMx/1wj5ZPwhOtkpmItiwHg1lEPAKynH2mvCUSwcybMONd/ZIwCZhIevl+bIfLVNks7RcmpQj7v+Xu9AI77idPOT1/u3bpF7gUcGGykK7OY1JXtVt1Wb92JU/SEsdnv4xD7fF7TuZmqpnDfdjCzN3B43N49ZmN2N4Xkb7o8ECAYayxdvCj1QA2xS3fHdmtq6kH+rktWBCgelQmmk1HdG3iG1tZsczcsyUYO0d7E78rqN1ZERnL5xQD2AMbXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNzlC/Z3nSBhKCLeuNgRAsjqefRVsiEXMFxlPws2rKY=;
 b=g2hnIkJiRpgq8RzBYrlA7yqFVGONuY6nSxhkWbz51gjDT6Kjz0R4VXRaAj8SJlhbX9HZWTseGrQ5rCgBXq1hEUWlGkTLRfWBBP2mzzHY/XK5doGgxGJnJMQG6mNrLjlCT/lSGbtJgQJsaS5M9mDMNlL4ZGfgFIcfX8M2dwJTyFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM9PR02MB6674.eurprd02.prod.outlook.com (2603:10a6:20b:2cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 13:51:53 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 13:51:53 +0000
Message-ID: <a7e51c63-a7c1-9acd-128e-02942737e726@axentia.se>
Date:   Thu, 8 Sep 2022 15:51:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] i2c/busses: fix repeated words in comments
Content-Language: en-US
To:     wangjianli <wangjianli@cdjrlc.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220908132148.42995-1-wangjianli@cdjrlc.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220908132148.42995-1-wangjianli@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0011.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::33) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 587f2cf1-3c00-47b9-7a98-08da91a1496b
X-MS-TrafficTypeDiagnostic: AM9PR02MB6674:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oO+u48PdzJE7VbVqQ6TrvNfkXIt5JO0zjCURvGuc1DOBldbXBNT+MWV+xmmhdwTP9q8OxoooCEM4q13TdTvbE+fnDLFglsT7L7C0s65ua/IK5q9dvY8NrZbWZSSWo7grOwaggm8me+LYhhi5pLFG6rFwSR/svoNnhoaEXtY8lIe1xAgJjRy5UAH7+r/uxSF+X/CWyIgjHV8icIDlqJawdg5/IuLioE6ApjkYPxjUOszWmYaZZOZpR+UpWsmKUVXouwvP3vhP3slZhtVFjksVDUgz3nh0SFOLHIPqpyADljM8g1Wk1fWmYRh8MwsZTYhl5HICnVaFT+R0zKxxiFJUkK74WD+sADgYN2lgA883fau0ZSBAG2KYCXWuHYyyOrGoaaUI0BNrZwj0J+enZL2Z/ypS28MMLedLudpssCQcAmqL0XD6sxgzWTAEcff88bJCuZ+5QyhWBWp462iRESn4dWbAc0/ZXtA1//DI4CichbqNV+S0kiKhyieBWw36uIOlmH3vQqWMmvniz1/xVjPkU9LzlqPX3Woj0P3PwtbPZrH+793aEfXNl3h2cShIv8CZuJ1AJJkEy1oBVX4mqStqiRa+EvNILT81L0+PBu2M5M6RkBCbIrs9Z193mK/gHdGncCRB/S4uPI7fE7iaMhqoph071aWgihj1MWly3tr/9NE4SgTJHreJ8ld9iXtbH4YEZXQD/tquzQ5XH8mGfIREpDIfYSlW/Ko0r94oyqPhg+NT15dOidTbU0KrxZxP4no/wPwohKr/smvA7AzHShRwU1j2gV/dZvXqsAi0JzoJiTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(376002)(39840400004)(396003)(346002)(2616005)(5660300002)(66556008)(8676002)(66946007)(4326008)(2906002)(66476007)(8936002)(36756003)(478600001)(31686004)(6512007)(41300700001)(316002)(31696002)(26005)(86362001)(6916009)(38100700002)(186003)(83380400001)(6486002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2VkcGVadkVVUmpzcXJ2RTVIZHFkWUVSYTFMbThENWVua05sL3kvdXNLTlZN?=
 =?utf-8?B?dUpnZEV6aEFDc29nNzU4TkgxSVRKVjAzZTUwYmhqQmFWOW1mSzF5V3VHbWVK?=
 =?utf-8?B?bEhoNTVmVVQrWFE5V3hqdUkrNXBja2ltVy9UcmdTZVRRN2c4K2lTUlBOYjFC?=
 =?utf-8?B?Qk9UMk90eU5mS3NkQVJCSGlQaldlV1RhUHlwMGJoWVprTGo4c3hBNmYyYUtj?=
 =?utf-8?B?TUR0aVh6S01qRWdjdXByaTVpQWdoVjA4Njkya2hTeTFJdWJNT2d0c3graTho?=
 =?utf-8?B?aytLSE5nVm1WRUJEQ0FDcmtwVWw3bEtoSVJDd3kxVWdHQVVzS0doNElBbkpo?=
 =?utf-8?B?d3ZsUm5ua3ZteDVSUUIwd2xVT0pFOGtNTmRHbVRRSTlNcFkrVGxuMWtIeWJS?=
 =?utf-8?B?ZmZJZU1yYkJJYXI5endCSUtIckUrVlh2SHVScThJQUZmMVkwOGdVeUlDeGdH?=
 =?utf-8?B?ank5M1k1WVV5UkQybHQzYWMwVXlYSW5xbTVWbjZUMkVmZkpiTW5WQ3RDdE03?=
 =?utf-8?B?OGVkK2xtV2s0V0FxL2c0cHRHakZPOSt4OWFNaHY1SGFEc2Q2U1EvaWFKMWw1?=
 =?utf-8?B?NDlRN09PT3A2L3IwRmUxSlYyQldNMmI3K2NQOVEzQVQ1N2FGTVhvdVRSYlVW?=
 =?utf-8?B?OXdaeXliZFdJd2pmd0FwdVF6Y1lISzhuVHNpZndwbHBodzNJNzFnZ29vWWE0?=
 =?utf-8?B?SjhGS1lVSFV6UFZWb2dZMjkrRWljZjBiWUo1Y3lBSWtnY05MdkZYSTVKNnZL?=
 =?utf-8?B?ckN1ZmN5SXdRRDdxWVZzYUhEOVdIRkRLN2w2b2k0c1FSRitXaHM4R21kZDU5?=
 =?utf-8?B?SThQUjE1S3FiUHRlTTVOLzhqbzY4ZTRobW1Vc242UGlsSGRaTUhwOFkyUTBQ?=
 =?utf-8?B?YW9udGZWOXNWS1NuVG9LN3RMSEdSZTNJMVR5aEdwaFd6bzJlL2FiQ1lGcnN3?=
 =?utf-8?B?eWJXNnhoWUV6Qkp1OXUzWENoa2xFTk12NFhTeHo5QW5oREVWanpSd05sU0lE?=
 =?utf-8?B?QmV2SDRwT25nWjMzYkkxQWxWRm1McUxNODNhdkdMWnJrdTYvU2hJU1c1OVFI?=
 =?utf-8?B?VUMwMjVuaS9zT3ZTU2tFUFhNbUJ6alg4cmlWdzBOdzJTaUdyOXpZcmRzOG15?=
 =?utf-8?B?cGFhT0tremZ3VDI0Qi9KcFdCL2l5T2g2UG9JMHc1VmQ3NVlSbU0vN3RYUnlG?=
 =?utf-8?B?d09uNjVKa1p4UHExTUtZdFNJRDhySENtTjBqSyt6N1JYaDFjS3VMdmlXV3NR?=
 =?utf-8?B?OGxjODVRNmJ0YXZiWGpoeDMwQ0ZhT2lBRFlGL2Iwd2ZqS3J3Vzl1TDYxWFMw?=
 =?utf-8?B?Z2hWa3EyV0RwQ2VIejFtSHhRNHB6VThBcFlqWmJQN1FidFh2dkF1Q3VtazBX?=
 =?utf-8?B?NHo0OCtuMnJyVmZSUEhLenZSaU1JUlIzU1RMWDdSWG80N1ZoVVkvZzNKZmJG?=
 =?utf-8?B?UWE4YVk4eCsrMXBzZTZyeDQrdjVJaTMvYVpqRGtLL3ZsRXNKNGZjUjZkbXNt?=
 =?utf-8?B?c2tqbUY1Y3M1WnJoemVUalNvZjNReHU1ZXNseU9xb1FkcHJwTFhlTzlxQkpk?=
 =?utf-8?B?a1h6QnJhdzA1bjV1ejlXSUxwNzVrNlNsZmtDZ0xaaVRzZHpzWmtFejhrTlo3?=
 =?utf-8?B?bkZLYklmbnhEc2NXNVkwMXVYR08rNUdTSUNSRlVtanhKMWo3eFNYWGcrR0Mw?=
 =?utf-8?B?Q2ZpUVhQcmV5T1hFRld0aHhVeUpMZHE3b0FoZmp6end1T3BXY2lVWU42Rm1S?=
 =?utf-8?B?QjVKQW0vdXdNOHcyeWJSUlRzMUVHWUh4TTRTUEkrSDExNVhNVlUvV3hwd01o?=
 =?utf-8?B?anBlTWVvcDNRaUxjTURJZWtFQjI2WVdYVzYrTjE3aWNYdGowUDFLVC9IaDNH?=
 =?utf-8?B?b2FGT21oWml1NW1vMjZkU1lneSt2T3IvcTJOV3g1T2tuYTFlS2NBZk0vV1V4?=
 =?utf-8?B?WDdmTFYwMW8vRGdxYWcvMXFxaHBGcXFoTjhCK2pVRURGNDQxUVBhODJrMVJt?=
 =?utf-8?B?djV0ZnVvQTV6d2RBR3g1cExNV2szYmlvUURmSkhsVXh6Z2JsZWtaaVF4Vlph?=
 =?utf-8?B?dERXbll0RmpSOWU5UXFKWWxCRFQzdWdEcHlrM0E4WXN1dDVzWFRCRWU2ZnUw?=
 =?utf-8?Q?x7divzGqBACIVkdmaD2hI8Wtu?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 587f2cf1-3c00-47b9-7a98-08da91a1496b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:51:53.7951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGhkTsgXVO/MUEXLWGAjL9tTv48zQEfhXcoD4Opncohu0Akrd0b5owt++jstPmdh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6674
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

The subject is the wrong, you are only fixing one comment and
you are only fixing one driver so you could just as well mention
that driver explicitly in the prefix with "i2c: viperboard: ...".

2022-09-08 at 15:21, wangjianli wrote:
> Delete the redundant word 'to'.
> 
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>  drivers/i2c/busses/i2c-viperboard.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
> index 8b5322c3bce0..8f87394abbcf 100644
> --- a/drivers/i2c/busses/i2c-viperboard.c
> +++ b/drivers/i2c/busses/i2c-viperboard.c
> @@ -318,7 +318,7 @@ static int vprbrd_i2c_xfer(struct i2c_adapter *i2c, struct i2c_msg *msgs,
>  			amsg->addr = pmsg->addr;
>  			amsg->unknown1 = 0x00;
>  			amsg->len = cpu_to_le16(pmsg->len);
> -			/* send the addr, the data goes to to board */
> +			/* send the addr, the data goes to board */

I'd change it to "goes to the board" instead. 

Cheers,
Peter

>  			ret = vprbrd_i2c_addr(vb->usb_dev, amsg);
>  			if (ret < 0)
>  				error = ret;
