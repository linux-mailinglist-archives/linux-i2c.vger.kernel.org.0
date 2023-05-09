Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A80D6FBF0E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 08:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjEIGLc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 02:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233835AbjEIGLb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 02:11:31 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2093.outbound.protection.outlook.com [40.107.20.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B38A277
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 23:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPMbInTZG5x+5YkgKv1TLY6vXw+J/IlCjUxsxiq3AUeVTbXcVsieHkQl9CJBm06VGo+/FJjQAq7a6KWIjll1mz94e8dG8ohD0dtG1C7OcpMzSt71+4FHDWWwgJIBIjxLG5ma+VB/IQOiModkJidPJkoE6K7cIhcBft2Mm/g0hdqGF34ul/PHa23OYbzS8f0gOayU2vaDhteIzXFMfNcVxjVK8eN7BeAaflTxbFoONbEBFiFrxJyG4GUoIIXEovt1JRj5uuUShwd4AxmMwoBkI4s2Hu0GXIQfcUD3HRxqaZUmtPyOHKJqMyxlgBWHEYe+3dYo/zgxx9HEgFo9ybDEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=RF3aIT3bt2vP1ufjwQkpUhJNmg0o6ISPi/n/+mmQ0RIN+5YGksF9h+53Omk6Eg6AZLVrZwm91DIdU/77kx/azLB9bV9Ir1cwgqYhD5wAR+kcmcMQDENbkSCHdQF+HA4jBTVAhl2oCSCxxqbQa+eHMktT/i8qzlmN9UkwXiwhpw0CdNdrvkLpDbmUdDRwuQTR9zlafWiOl9uRoDrzv0HvDuDogebE5jDbkuBGxT41e9NyW892uayI4tLoMhHjQ54cVGwdqONFSGbv4Ht7OJJ3Cqg8mtanZ5MgnanCmlrsnVvHES0yp+h4J7iSwwpndSiNEFWlOoz37ah8KWit+I1tyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=LqMsz77Bjz6m1OmkEMl/rY1ESFTt9h3EpAxzFEdlQJiPJNGOCUnv+GGAbOnHRkodDeY+8TCwc7In5nJgUZUacSwQNXdlwtHOs+qDSlztE5VClIlwosDycKf4vPZDqLwY/9Dw0u7UdXn7rmCeequ4/157ppEyXHh/UoUoVU2S4Nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS4PR02MB7855.eurprd02.prod.outlook.com (2603:10a6:20b:4c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 06:11:27 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa%5]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 06:11:27 +0000
Message-ID: <5c88233e-a4a0-9cdf-330a-d5740a204160@axentia.se>
Date:   Tue, 9 May 2023 08:11:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 88/89] i2c: mux: pinctrl: Convert to platform remove
 callback returning void
Content-Language: sv-SE
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-89-u.kleine-koenig@pengutronix.de>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230508205306.1474415-89-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0068.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::35) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS4PR02MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 777087f0-66dc-43ac-a283-08db50543958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: trMzFMFo0Nh8MErayvH3ZDmOSVTqiKORc7MfMpvD7t+yi1WUeoZ/ofvuXQQMgOzngS4G3Cl19ipckPRGTIrp58EBdqG7ZwuzeKd3De16VSIsczaR5n1XhfwEvGxmY+sLoQPON3P+1k+yyLkCGQoM/L28voCBFtDhhEEi1hXlSWoavBZ6qXdaOgj8jpak9goz8aN1JSSW9kcvsBsLH3bs8247HSA3oy6P+eSPv/78aWelQcOOmgoTWY7NgJawiLZT3FJFrb/VPTK532j5tXbCy+SpbFFCH5kSu3t6T7NmZsKY+cvLbIPmdGkce46JHEFmbonGsRpTeC/Ap6x1Gco9nfb2Hw7BDshHrLyyCRZW5kBgsA9md8fcAY0OnEHiRI9rIuGusHtAFHEShywcMK7DoOz0PBj6wXcxbvuSrbsABVXdCOhz4mAk+SvDrfxkc52zpU91dgFUv4WKWenlB+eCe0bkePzX01w0ymMd/4uv61qxcUiFX5rvM3pz2PmaTD9i+tHyzamr2n9ugoGfr/ek0vLTDZ9b9aJxsn/AprNBBff/1WHGOVSa8smyOMEDJkep6204ririYiBRlIYFE+lxikk3HTrv+kr5ufozoE01OW19xVaGnYZZXL1zWD++7gv1nE/EYG3ASX6mJzTzJxiWhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(39840400004)(396003)(451199021)(2616005)(2906002)(186003)(4744005)(31686004)(86362001)(4326008)(41300700001)(36756003)(66556008)(66476007)(66946007)(6512007)(6506007)(31696002)(26005)(5660300002)(6486002)(38100700002)(110136005)(316002)(8936002)(8676002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHJnenZVR2ZxckkwdmtQMTE2d2hRR0lhK3dFTE9ydHFzcGpBTWMxTTBoY21j?=
 =?utf-8?B?VWtENCtoQk5XWStiTnc2WHhXUTBTNnI3ZkM5T2tOY05wRDE0ak4zbzR6WGwv?=
 =?utf-8?B?dUY3VHVRaUhIWUhXZ3lWbnBvYkxjZSsxQ2FWdGJDdFlsNy92Q2wrSXc5S0FD?=
 =?utf-8?B?d2szTUpGUE9RL2JTbFFrMWs3TkR0YkFCeHNKSW5BSDJuUlV6Wm5aQVU2c2R5?=
 =?utf-8?B?WmxKL3NNdTg4c05SSVJNMUNEajc0L0RMR3Z5ZGZINEczb2xkU0x4cXZNTG1B?=
 =?utf-8?B?WEs0SVNxMlZLN1hkYzZ3MUFpTGlSM0ZqTWdzTTBZMzVvb0lCakp1bWdncnlF?=
 =?utf-8?B?MXRkbnh4ckRXSnNSS2xWWVlGWUhTQmlNSjhJUkFtaUdTMGd6c0pFTG9wR2tZ?=
 =?utf-8?B?dGlxK1hRY0NCWno0QVpEQzNuUDRnK25MSnNZUittcFpCYlo2RjJTMjJKa21Y?=
 =?utf-8?B?V1AxQkdsVlhCNnhOZ3pzdlM2ZlZLVnYvaVcwQ2dFVExtbnJQOFlTQzFLdHVk?=
 =?utf-8?B?Y1QvTVcxcFp5ci9BRkZnMGFLNWtnSS83ZEh3d1M4L3N0MTYyNG85OW94OVJ6?=
 =?utf-8?B?eWF1L2R5eEFva1pFbkhYQzFEVjU1WUhsZXhXai9mejBJTHZ1NVBRV096UUZm?=
 =?utf-8?B?VnZVWnA1cHF5UWdraGpYQ1Y1eDlOTkRXV082Yk1ESGxrMjYrd2NXZi9Tb0hE?=
 =?utf-8?B?Z2lvbThlRzBwcUlMRzRTbnUxOCtaTGZpeHlrM1JYMXNJdFZ5b0hDOWZ5REtC?=
 =?utf-8?B?WnB1QXhmOHVNVndWOUw4SGZwamVVaVNVRzJOMFhqNGtiYnJjQVZqSHEwN0xT?=
 =?utf-8?B?Qjg2emN1cTFsbTV3OEl3YktNMm1mZlJOdjVZRGRUSnh2Q2FRSHJjNWRsNmFB?=
 =?utf-8?B?WVVtNEdudFRCZlgrNE04bDhGb1pEMjhvRVFyVzBlZ0ErUnBkM0FXYzhmdC9E?=
 =?utf-8?B?V0Y5VUFtanpFbVZtT2Y0U3IyTTNnSkZMV0VkdElqRGYrU3BMZXY5MTVDSVp4?=
 =?utf-8?B?RTlYellPLzhkYjkyVUpDRjd3NHE3RXZ2aklaWm1FMDdacFZsMlRLdklJbTVI?=
 =?utf-8?B?eFFrVTVvT0U5V3pBWWh2OFp5VEI0djNsVGtVMUErdkxrK2VpQ2dKU1NmZzhl?=
 =?utf-8?B?RGJoSUJQVjk4MWJxeE9XbEE2Vm1wY2REUmtTY2RESVpFSUNGMFk5bkgxSHNJ?=
 =?utf-8?B?R1JGY0VwWDlveGI4RDJ1TnlkRllsaUw5TXFTTkJjbXhoNXJWUHNkYlJoelU5?=
 =?utf-8?B?bkhRU0k1djMxRHpCdDJQeDlMOEhsc3dpN0c0TGFOcDBNaGlkc1VxbjBpNEVs?=
 =?utf-8?B?aVF1UVQxRmwwclRLcXlWbEFWTkg5N1I0LzR0QmN4NHJ5ZnVDWnEyQ1RIbnlV?=
 =?utf-8?B?YVBiY1g2bkp0amM1a0FLK3JLTHNXbXNXSm83djkwNEx0emxtOHBGejJPWC9r?=
 =?utf-8?B?cUtoQVhQK1Z4WWNUaFJJSXNIVkE2VHJaNDJTTzhrWmFGcFVQZkZLQUp6QytX?=
 =?utf-8?B?dGpBUTQraVY3bnNadHFzMnlONFpqL1NLaFB2VERmYzFFUW94UWQ0N1hBRUVL?=
 =?utf-8?B?WjU4dGNTenNiams5WVZEaXRheHgzaTdNODhvOFRsOUNyTDkvVU1oQTNaVUJ5?=
 =?utf-8?B?aTNmVlpzMmxlTU5VZEFTaU1FM0FQUHZaZVg2b0ppRC90MmwrOTU0a3N2WGpy?=
 =?utf-8?B?K25qcFJlRmE0MFd4L2hVQWIrT1RwZjBQRVJadS96VWJiZGFoUEErWVBHbHFC?=
 =?utf-8?B?empEZ1IzYWlOMFRZbEFJNVB1OTY3ZTEyUy9EY29QQ3M3aHYxcVY1MGpvNDFF?=
 =?utf-8?B?OHh1THIxR2p1czlWWm9RWVBCM1hHSzBTdE1sUkgwR2VKelFUWXZWN0NiWFdD?=
 =?utf-8?B?UlBLc28vMHpuNXcxNy9pS1h2MzF4TjdBVVg0aFhkOXQ4NDFYMG0xK1lDQnlB?=
 =?utf-8?B?N2V6d0tlN3FBbDNvVkxTa0tOYi9QbWxXT0h4a1l0dnViQjJlc2lFcm5MWm5k?=
 =?utf-8?B?N1NscjhLVE9oM2tRbmFDYXlxaE8rTkVuY2Rzczc3ODBNY1hvV3RMSmR6b2pJ?=
 =?utf-8?B?ZjdqaWRUMXhIbktJaEZjektMZEJZaXAyUVZNdWFlTzJ4RE0rcWo1ZTVPMXdt?=
 =?utf-8?Q?B6qBWz5Li8KTOBvPrmYxQ9Vlv?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 777087f0-66dc-43ac-a283-08db50543958
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:11:27.4331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IECn1JjQtHHdKlgFw+qJFxxQ01rB4Usr7d+hPw9TkY0HK475sRxqUXSqihCptOuZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB7855
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2023-05-08 at 22:53, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

