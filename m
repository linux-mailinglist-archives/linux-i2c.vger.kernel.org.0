Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACAD7ACBF1
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Sep 2023 23:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjIXVB4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Sep 2023 17:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIXVBz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Sep 2023 17:01:55 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2137.outbound.protection.outlook.com [40.107.241.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AAC7EE
        for <linux-i2c@vger.kernel.org>; Sun, 24 Sep 2023 14:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PodeasJlpndhjoRb5K80UWJVYfZ+k8RhY/E02emEzgFpAS6Oce6wkMqxL1iCkeY0UD4Q97eka86bGVAIVRxoY8djmXNRJtbWSGkXnaH39N0g09tJMkn0aoF2owg0/GJrMHjTnh0lyYmOEooBlRsNDK9NB46vAcKDyThf04qUj+2mSmSHpPcjH8/M+wNFhLwJTSDZX3rF2mtNx87LRbPYchViXo4jFgBqWAApDICeFtATlV+jfZXSwOI2PkbUb9HGfRnIneStl5qvvGiSQ0kF18E6nqTF92JInGJDAmgtxET4rA6cmqXPGDJ0zdYOGMKOkFFjRlHyJaXYA/d78dK3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWjMX2W4vPQ1uXOj9EJBRXcD/iHR7R8H0g23c86iPn0=;
 b=GbF/kfsQMjjLiKac68CiVWxFLyVl75qkRykccpHn/8hqY7eanhVznjV2bEUEBNYcmUJEOY+ucaRst/2pKkRLCl6XdFuWJilZ9aIfMV1tsFQoVUILkpm5MXAdLtVDPb3K5W+3LKmauLPcHLo3ppUIp+tC3JwpZsghvtM1dJdknx4LyDjZ/fSDcTpzOI0qVnJUYJRpOMg66bjNN5nkorQdwAV10RIyPSjYw6Jb2Kb6BMgAsUgTuP6uRp8zFQuVpEUmYqsbENCpuPhDZ0kXEqV0hzLLF/jFtPrMAS4+0WP7OeTYZZCh/hktzoWfrgPq0eR7zzM/edm3mH43FIKM4T/Wtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWjMX2W4vPQ1uXOj9EJBRXcD/iHR7R8H0g23c86iPn0=;
 b=S8Nr1Q0EF10iC2F87yv7MB5J972HzfELBqKaDioWOJecGKfNWBqr/xqWylaY4joIULT8VRqKwwnRGsZOg+XHm2skiRM6Ya53hBNS8oyxdqTah3QSKw/qlhN0hFLxW1qcn3SOHhX5YuGf1xxvtJ5+Etjxwa5DJsqfhjUNEwJGNRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DU0PR02MB8979.eurprd02.prod.outlook.com (2603:10a6:10:473::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Sun, 24 Sep
 2023 21:01:44 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c%4]) with mapi id 15.20.6813.027; Sun, 24 Sep 2023
 21:01:44 +0000
Message-ID: <bb1f22d2-98fa-b703-a19c-c32e84a486eb@axentia.se>
Date:   Sun, 24 Sep 2023 23:01:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] i2c: mux: Avoid potential false error message in
 i2c_mux_add_adapter
Content-Language: sv-SE
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e4aa66a4-898c-4583-adf8-3f934f0893d4@gmail.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <e4aa66a4-898c-4583-adf8-3f934f0893d4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0107.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::9)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|DU0PR02MB8979:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ea86df-0484-4f60-e0f8-08dbbd417515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wSn+/wjK/3qv1mQHmTikqZM+lQ+eB2KwWa6hi8u5N7hPvfQPeSvON9dWGTS2X5zaya0CNkLh+F7gzyIWmONasRVp0vtRQlI2lQcJayfFcF1GieqeH9IwMVrqb+sqlA1i+VwA32asnjCNn/akHxO6vX56mrQ3JpC5ejv0GGEPQP+4SeLp/dwv5glLAu1ZawZpsNLt34LqqeSJOaxMqmhhE6doGxT3NNmT8WI0jpp9kPy/3VWkoghP5d1fLFD2UiWk8LBPZwZvIPz/feNERQB2mxafk7Fe+HwOL+1K+ujPvbKmnjhIFiC0wcjsrpxS0BgX+6Go3dyIoEWjQHkmenEOGh+1f9o5nalOI/2MnigKVOuq4Vzo0m0pvfL7MQ77PUR7V0G0iM4LDZjJqOaLouZWhTd+XnQVcfbiQLMg8vOqYFZsi2vsP9dR7xSlST+hcVBLDm2qe54XYeWtkpG8/Yk5H7KxlYBx3FVaAxnnfRi7JbPvVBlYAyUUSQ4YzKULlk4f2xsDAXX3p2ektB2cykNrdg25peu9zJTIQ6+z2J8KcuCg0GzCbxL5F/8KHPRoAU0PqbACiaFRxr0LMTBjs1N4e0c2KWsxAbZsUFb48rD0opveAQOe2vc66xfzFJt6TieRnuRmHSf5S45oShPH6KaGiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(376002)(39830400003)(396003)(230922051799003)(186009)(1800799009)(451199024)(2906002)(4744005)(38100700002)(66946007)(66556008)(66476007)(110136005)(6512007)(6666004)(6506007)(6486002)(26005)(5660300002)(41300700001)(316002)(478600001)(8936002)(8676002)(4326008)(2616005)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHVKRTlNQURKM3o5cC9hYnJwRmNQMzN4b0ZEb2kyQzRDNWE4TFVRTEs4RmUz?=
 =?utf-8?B?cjZlNDBuU09hb1FVUUsrVnQ2dkdKZUM2U1FnSkpIbFBwb0FiYng2VngwRVA2?=
 =?utf-8?B?UWNSZTBiS1VPeWFLR1ZKc3VaeGhoeUxHOTN6UWdOMkpucU9tYjBsUFZaL1pv?=
 =?utf-8?B?cDliMmlKaHlnR3V2dnRISDF0WWZ0VFA0dENYcjlBR0tTM0J0VTluUDBZall2?=
 =?utf-8?B?ZGUwdjVTU3pYMDBRczRoODB3SUlmQUZ0VmE4NUFOSm01cVZycnI0N1c4OU4v?=
 =?utf-8?B?RSsxK3NCekNUalhsY05mM1cwWkw0Q2JwMlVsMHYzNlZIZFJXNkdlS2lyTEdw?=
 =?utf-8?B?d2l2aGpiTStSb2FmeDRZQnFHM1NtbDcvVjdEY29XTkM5eDl4U1d5M1h1QkZm?=
 =?utf-8?B?YkROMkorQUwrelRmUFhIaTBxa2hmbWllSkpOdTRTdU9MbDFQd2tqYmxsZ2xT?=
 =?utf-8?B?L21haFNBYnpQeFI3aEFtUWFrMWJwNUltbmtKdnVBc2R6S2tOemFTR0VBQ2Jh?=
 =?utf-8?B?TVpwME9KTTg0VGxTUG82Z2hRNVh6WXUvUEFaREVxaVgvVS8xNXdWNldoWjQ0?=
 =?utf-8?B?UmhzWkhYRFBNbExqSzlvRkczU0xNL0hEMzFjQmxnZnA5WURzQkRQeXk2MVdj?=
 =?utf-8?B?amlldndkcktiY0lEaHlSUC9zYllJSVQzdzNCT012ZkZRTXdDWTY3d3lWbTBJ?=
 =?utf-8?B?ZE5peHAwdlVta3NPYWdqTi9BWWttZnNtVFE4S043UEYwcERtWVFmbXYzYnA4?=
 =?utf-8?B?QllLQVU3Z0ZmVEFpamJ2bFNURjdEMVBDejVjTlhaTVdvSjEzbktTYVZITThW?=
 =?utf-8?B?Q09CbFNRNi81dVd0aHp4TmtOTTYxdEdJQmEyeTRFbGZrbTJYVlFQcFBZajBu?=
 =?utf-8?B?ZDlBNFJoOG8vVjBkZldqVHo4NW11d3VNMlFTR3hJZGR6T3BQbzJhWDREdy9H?=
 =?utf-8?B?Q1VCYVNVQTF0NzZ0YUpieVNiSHdXc2JSVGpObk9oeDJxLzJBUnpXVXdDbEdF?=
 =?utf-8?B?TURIY1pFTm45d0o0SWthSWhlOEFremhmek1UdUozR0k5aVd4OFZCQjhranFo?=
 =?utf-8?B?dzFYK0ZnR20yaWFHZzJPRHNWcHJWV296WlZRdXh4ZEpqaUdHc2tmamlBQisx?=
 =?utf-8?B?U3Erc3V0SkYvMFp3VHNkUVd6Sk1zcnUvVGk2cTJHRTFTNmRTQnJETU1mQSsv?=
 =?utf-8?B?RE5sTlBacyt2LzBmQzdyZTJDWlc0L1RYVlRKdVl1TkM5UDM5Z3AzS2FESU5z?=
 =?utf-8?B?VURHcUtnc25DTkRraDM5RVNrU21rSm8wMDFmWE5jZHNiMUVkVGUzSXhBMm96?=
 =?utf-8?B?K3BDMkhvdDQ3SkRQaFhOVXJ5NjJXeWphbnVzWTZoTU1LZEFTY3ZHYUlBU1Vi?=
 =?utf-8?B?VjlLa3o4bHhQd1QxUXNFWk9KTE1jS0VDR3NYemUyY2FremlLMitrRktoeXhR?=
 =?utf-8?B?MmgvYjVPOTI2WTB1QkVlRzJyeDlRdVRtS2hmNlBWS00zbC9GWGJINXpYakhl?=
 =?utf-8?B?RHlJS1lFWmhyZkxuU0QvMmpzUVZtL3VNaEhzNXhLSlNPL3ZPR1kweDVSdUdL?=
 =?utf-8?B?WENDc3hkYjk4SVhabElRTWlmRmJXeHBZbHNlZzRWeHpwVGYyME9mbkp6ckcy?=
 =?utf-8?B?eGE3eDZtR2tiL1BYY1NlZnhpN1hnMFA1SGFjcTFrbk93NDMrVytXNStFNWV6?=
 =?utf-8?B?YmQ4MVRmbFhpNHVWMElKSE03K2FWaVk0MVlwRFdkOXEwaDhVTUhTMytsUHJy?=
 =?utf-8?B?K2tTRzFJcXBwbWFsOTdxMlkzRWtKWlNPcXhGOUlwNkxNT2V5c2JnMm1KMFFP?=
 =?utf-8?B?TEp2QnhSVHlaRjk5YnRqc2ZRWnlKMHZKcEpKSHdkeHdCUW9HWFZhcjllVmk4?=
 =?utf-8?B?aHp1MTBmY1hkMXQ1RnQrZzVseFJ4VmxBZ0owb1NRWUYvK2U0VW5JT1hUWTc5?=
 =?utf-8?B?OXgrK1lxYTlrOUxJcERMdTJrQzd4M09ITHJEU1VhODdtaGxUTXFhaDF2Z1Ry?=
 =?utf-8?B?SG45TlluMHAvTlB3dTNudTVQNCtsdE1kU0VoeUVTSjNudE5yZzRUYlJIclM3?=
 =?utf-8?B?eW8rMWxkWEZheW1rUDJjQ2pncEdWYW9rWStKVloxaUFzQkpuSE9hVHBSRjQ2?=
 =?utf-8?Q?7QB+Bt/sLCEc6qbSIx+Zyu/M1?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ea86df-0484-4f60-e0f8-08dbbd417515
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2023 21:01:44.1226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhj6jZ8rjVlrmWH6onaEGmWG5HfzFsCqsaKYfCayn/fxc4/IgwhOKg9HmvH4Kdgd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8979
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-09-23 at 23:54, Heiner Kallweit wrote:
> I2C_CLASS_DEPRECATED is a flag and not an actual class.
> There's nothing speaking against both, parent and child, having
> I2C_CLASS_DEPRECATED set. Therefore exclude it from the check.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Looks sane to me.

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
