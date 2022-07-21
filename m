Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78D1957C772
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jul 2022 11:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiGUJUv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jul 2022 05:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232805AbiGUJUu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jul 2022 05:20:50 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150104.outbound.protection.outlook.com [40.107.15.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8182B3D58D
        for <linux-i2c@vger.kernel.org>; Thu, 21 Jul 2022 02:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJUPhSgMFkLgVsxQw/WD12sjr2nb+5042ZoGr8UB/vstpus9YJhee4zRYQCVHYm/pc0cvjC4YeZrRDN1MeARLJnXANYQBfnfx7Zh9QqSkfoA8AgwqaKy8M9aYfv/IaQfn2cNzZKx25/o8+vctfeiII0gVTC32FN784H9/nA4pw6l3BSYpQ/3xB/+Vo43iyUcJNIhpWokT/d1NcjiWn/G3ORwhs0o18aL2b+x0uJtY9gNRv0RwIO7onkC1kU5G0Kn2J2hkURl1GmgbeZ2PBJZakU1PNcoDxCPUiq89p/z1v7UqUhCzqwsSiQeqc3kk1pcJwzDNUx9sdjJ7SLS40vgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hw4J5CHDU3ZuEyYmErAoWT3iaJgYP+K536b2IjZ7ryU=;
 b=mdSdKsZ4a7MS7aS7nvJSdLsQ1fW27aV8lEtCXGOxoNHu3upR9Ka/JrOMXCCfkvpVPSGNW81rrXvgCnFf/v0CMm7C/Si74slLHlFzpMvFdWCbMICYNu3NSeHu2afheZDW4NBsS2eaUacXUZciZmhFV6zw1dZOvEPFsuy9mPZohOyFxJRzKFaaYImur0V/1i9RULedIheTBjDN8RqHC5JTKU+PfJ+Sqp+RrsAw1OZSEkd/sjJVsBiohfUPxuVjRpHEj+gRUcPh1j4CV9LeehOiRMKQzNlEUJpQBPU42aXZN3v34D71EjRGS9/tpteqscJQPSFeRLyU3LqJ3qzBNlKwXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hw4J5CHDU3ZuEyYmErAoWT3iaJgYP+K536b2IjZ7ryU=;
 b=dCI6eA+mfOcYD0dGH05bpfbnr/aXpx4/2N4n6On6cZY2EURB4Fp3kvcpMep7CCCfg/k5fqieRplQgt1crE/istKyQ/F3zXUudL//fqcEHqALhjNc5WatUcxr2/kEcGg16kJowwdomXygiDoLW2s6CT31KxPLAY1VMlII+D8E3ao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM6PR02MB5174.eurprd02.prod.outlook.com (2603:10a6:20b:86::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.26; Thu, 21 Jul
 2022 09:20:39 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::11f2:df70:b231:2b45]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::11f2:df70:b231:2b45%4]) with mapi id 15.20.5458.018; Thu, 21 Jul 2022
 09:20:39 +0000
Message-ID: <ccfb8195-7517-aad7-6b59-c0af7652e5a5@axentia.se>
Date:   Thu, 21 Jul 2022 11:20:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] i2c: i2c-mux-gpmux: Add of_node_put() when breaking out
 of loop
Content-Language: en-US
To:     Liang He <windhl@126.com>, linux-i2c@vger.kernel.org
References: <20220721081202.1300071-1-windhl@126.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220721081202.1300071-1-windhl@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0023.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::24) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c304f2ec-7fbe-4cb4-d132-08da6afa473b
X-MS-TrafficTypeDiagnostic: AM6PR02MB5174:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ul14Wv9yCHs3TZyK+06kf47WLT9Jk8YxSZWAFSCZ7oSVf7mB/JWMYqhA925QaMAFIMADTmWGXonTkDSKpmUiBwg2dRTkO3S2YtsFLcJIqKcA/DMzwBWrPr5Nf1ZBXDYUUfTl499pMvJM46Nb4Mo+aBf8O2+nJhV8fBGMs2O+P7QVnlaF8qtzmyFMtiNZcBE9R48u1S3tHhFejs0va4wTSL87tGRVOoWEXAJVIslstj9xjBLeMzYgtRoHe9O7FD8Mph4DCFoESwPn+rKb1FZNZn8faXiHTGB+0XsIBclACozRJ+yTageCwLs2vHJQjofPEmo9I3QzNOJTT2sLvQ/iF3D5mTw4/r3/X+mPt8Y45nFdMLv+Z6cUYTG5Cs8zzxpMqdeXU/V6qtU+SsfTlQpsPSfe2xZvquG3cMXLf7D8Q8zUhfGPg+Uq89O/QOGHg39ejw+WERjvXznmNZlfTO0DWQrq2e/wFCuZC4sj+vwjX+UMJ5dtS6IyD8jLHuXdpTXMy5ml1xpkAYaS/RJP9Sr0NzMdt6BQIvXVdbxyK4FS3ECqKwcTW+T1407c7M6p1jlEHgEBXCVGQ3z24+DtEwwRTV1bXKBxw2bEZr5DtCnWZtfXijmn2R2OHgz/4DxZhliBOc/TJy4Z0GxNy5pWMtvio3IO9zaT2yGT8PXsOsAYUGwjj6b8K++Y85hQTFKAUsQLLRJEqgTsC0B9+PGBWU1W4Dz5DACcPgpWm1McGpbhyB7UAGhPUAJP7TCwhaZZU0dBMlU+vPTF1XvV+iIwcJ2/z36PT4/phlSJlSlALzyebCN8wh5fkwOdSYRh+6rucJSqY9D2+gy4GJvKvkduu3R+bTSkQWHRzrD3SsTD7YWQ5jk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(396003)(39830400003)(346002)(376002)(38100700002)(86362001)(31696002)(8936002)(41300700001)(316002)(5660300002)(6486002)(66556008)(66476007)(66946007)(186003)(478600001)(2616005)(6666004)(6512007)(6506007)(2906002)(31686004)(36756003)(26005)(8676002)(525324003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enNvdWM3NEpnc1FHWFAzSFk2UGZpQ3JzMnZwV3BxeGFqRHdPNGYzRWkxcnZl?=
 =?utf-8?B?ZEVJYm1oMkN3dWlmSG1ZQ01XUnBIRFF0Y2dUdExvVk1WU20wOUpVN0VEMDhk?=
 =?utf-8?B?RVlDOVZCSFgwMitoZDZQK2dQQmMwT2tUNFlxdXNQd0IvSFpnRzBDcXUvY1l4?=
 =?utf-8?B?R0Z3aE41ZXZMbWZmVmJyakE1VmdBZy9KdlJ0VmorMjdpS2VWUUdoOU9JaWtR?=
 =?utf-8?B?WEhlRTNZNmZSaXlCNGFoMWV6OXVOa2l0TXRCSTBDblFHbm9aNVhaK0QzNEpR?=
 =?utf-8?B?OUMxb1BFUlc4VU1sWTFscmhiRTBoQmNLMUNINGZUODF1VVgrMHh2cGVGbjA5?=
 =?utf-8?B?anFFYURHNkpabG5mZTdyU3VWNGpBaHBuVWtrRk14M2ZINGRDRTFwZ250dVZm?=
 =?utf-8?B?TU5WVVN0MmJSRWdtVkRjcURiNU4rRnhnYXdRQkR1Wm1CZGRIUTZGd3ZsN0xU?=
 =?utf-8?B?bXZFMzVWR3p1WGtyTHdiTEtLTnNqMkdiN3M5bXJGamttY2RpZFB4WU90NmtU?=
 =?utf-8?B?emt3VGRWUnJDVFoxOHduK1k5di9OV2JUZ3llOE43cHVScnJ2aTJmWUh2K3Nk?=
 =?utf-8?B?b0RQWDRjZ0xxZHg4T1c1bzh1b0NPd1VWVVUzdEZTSXFWa25aRDZGOVpqSmhY?=
 =?utf-8?B?Rjc5aTl6MC9RcmZPcmt2cmlIem5JQVo0Q3Y1THFJSnhGV1BONW55Q09xVEZu?=
 =?utf-8?B?ZWtJZjRMVkpjaVdWVGxScWJDT1ZzS2pqR0Z6SVRsV0w3V05YYmJZdUlETmZS?=
 =?utf-8?B?enlBSHlwRWl6VkQ1VGhvRC9EY2JOY2NwTUtIUjFFTDY1THBxdkdmU2U4Mzhx?=
 =?utf-8?B?Y1lML1E3eWdTNEhmZWc1WVljekRDNUJjdTUxYWdVNkV0L2dQVGgvMjkxMUtQ?=
 =?utf-8?B?UW8xUTI1dU5BdlNIb3lKYmMycitvS3ZqOVI5RHBxWi9IZFcvMlNWYmUwK3ZC?=
 =?utf-8?B?OTZYUHRScDUxeE9xb3NsK04ybDZ5M3FMMlNuQzVFRERnMVNmKzhHaHJoWkF1?=
 =?utf-8?B?Nmp0Mnpxc0FZcWJpanJValhCaUtsTXFzRzRQTFZ0ckxONFE3M3VsQitPMHU1?=
 =?utf-8?B?VmZpTHBaWDMvN2Rnc3lFMEY2Nm9pbmQwM0lEQnJnU2VVankzYzRQcjg0VGZL?=
 =?utf-8?B?V3EySzNoV0dyeko5VDJNRThYU0JtQW9PSXE2SnR4YXBYdlkyYnFyUWRzMnRV?=
 =?utf-8?B?Y0Qzakp3Wkp5bUdKd2o3bnErUFVmRzVLa0Nqekg2MDVISytMcGY0UjMvVVBE?=
 =?utf-8?B?dElKQ3VCWnBYaVhCSU9OSUFyNUFudzdHa3RNa1psRW1uc0E0Uk5xRmNtb0pD?=
 =?utf-8?B?Y1NjbXcyK3RndWpyWG40Ri8xUVVVWXR5ZlFiK0lNYlJLSVRjUHRMcHJYRnZO?=
 =?utf-8?B?Y01kS0QrZEJ4YkdRU2pYSTc5TkJpYktNOGp5cUduUUZKYU8wampHM1lGSXRH?=
 =?utf-8?B?eEZiUGRzRi9pSUVKcmx4VGNrTDhNQlZqcXVXSCtMdEdrRndXd0xOWWRsSzI1?=
 =?utf-8?B?emJ0UUZRVFY0U3VOUHp3dE1BcXFtVllOMGtrMllNeU1kNUlpKy92YmtqOFdE?=
 =?utf-8?B?Z0RsS0ZzZ2d1K0poeUhoQUtwYkp5Zm12Q0VTbmVxUXM3bUtUK0lYd2k4dTNs?=
 =?utf-8?B?SnlnQVJMZDNtYkJBMEdlVW9sN0k4eHFWVzVmNlJEcFRJUGdYam4vYzRMa1V6?=
 =?utf-8?B?enpPbW1sMXFyZEc0T21ITHdyWFAzbzZFa01zMXNwT0szK2tlWVl0ZzFJa3U0?=
 =?utf-8?B?SHovZVBEMnpwMzFkVU4xZmJ3a2VnYW5qVmxyTWNTM2VESUxjSVZPTTNDVkhx?=
 =?utf-8?B?OXcyOWZkbjdQc3BFNW1Cd0lxbm9DVnA2VElrZncrWnNVSmJJYnorbXl1cU9O?=
 =?utf-8?B?Ym5HbDN6VnZERSs1bExVa25VQ2p1WVJKekJjWkZnaFIzK05hQkx0cmlXY2tw?=
 =?utf-8?B?WmY0Vzk1WjVlK1k4L3lMTGJweWh0RTRvRjJoVlRXbXgyeFk0cDJKN2o5MzRr?=
 =?utf-8?B?ZndLMHZWNUdaamVXTUdWa2lDWVdTL2xxRTE1Z01qcE9KbzdhR25BdG1QRDZD?=
 =?utf-8?B?UVFrb3ZIbXZwVUJPbUtDY01MTkRyMWxQcndaalEvc2hVaDNYRXpDYjZTSXZO?=
 =?utf-8?Q?zoILw3Ve+8KiIQHuokJvMtgaH?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c304f2ec-7fbe-4cb4-d132-08da6afa473b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 09:20:39.7223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+WPyipRZS9NSTUF1CCTcL/BXSKXxXXEPqHVyij9dGQVFsHx7mo57zoCYiJSzyty
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5174
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,T_SPF_TEMPERROR autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2022-07-21 at 10:12, Liang He wrote:
> In i2c_mux_probe(), we should call of_node_put() when breaking out
> of for_each_child_of_node() which will automatically increase and
> decrease the refcount.
> 
> Fixes: ac8498f0ce53 ("i2c: i2c-mux-gpmux: new driver")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/i2c/muxes/i2c-mux-gpmux.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
> index d3acd8d66c32..30ab2fe88c8d 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpmux.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
> @@ -115,6 +115,7 @@ static int i2c_mux_probe(struct platform_device *pdev)
>  		if (ret < 0) {
>  			dev_err(dev, "no reg property for node '%pOFn'\n",
>  				child);
> +			of_node_put(child);
>  			goto err_children;
>  		}
>  

Right, but this is obviously incomplete. What about the other two branches
in that loop that breaks out?

Much better to have the missing of_node_put(child) statement below the
err_children: label (i.e. before i2c_mux_del_adapters) so that it is not
forgotten in any code flow. child cannot be uninitialized at that point
and if it happens to be NULL, of_node_put will be a nop. So that's safe.

Cheers,
Peter
