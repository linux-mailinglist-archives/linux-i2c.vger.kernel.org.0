Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE247BB54A
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 12:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbjJFKci (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Oct 2023 06:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbjJFKch (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Oct 2023 06:32:37 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2129.outbound.protection.outlook.com [40.107.22.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3EDCF7;
        Fri,  6 Oct 2023 03:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brkff+a7eEcNZK1myIafNCUWNwpBFSbJmEr7lTybCn1GCAuD5y1bLWMJDNx58cv1GoeYsaAvIZuMpRWaSFPhl8NcMPB3X9QqYktGdUpm8fHTdf7zxbtlj90pWNg3vzK1LzrmYoQ+xwamEZ1CVu9dFGIpegtCUeC3lQ45mZFco+k64V9XxXUmQALOBF2zUMRjEF25d9IiMqFwB1nOfFwnVgv4LlTrGp6FqzZGuWEBnpStkLQ5xyVFQxauF3+0JLLiJQLjK3pt5YAuHaX37GE2SSqNngRWlU55ZmeeUZvtFFWUKfg2IYTnzgKQOJ+46azdpbr9X1AI2X0jSQwYNlzQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CevNY6muSFqSy6YfiZQhFr3Th691x2ODOZrEzlT0IGc=;
 b=cT+fefJ9BHYoe4tiHhf/XHSSQbZlKg3nfjBqWeVxJA1hutqVTCUDiuuGAE1IDeE3qbHueRs098By1zGreXpz/4eXG75N2twTAndSFOfIk0NG6zRsDIPNbkBNkdy538KtQg89C2cDuqPdRsCqPhXRPtZKDFGMOePqBBsmp59qrTxAB1LbEuSgPgBJttSZAWYMLdNKauafgv+8gtWhSnH4jsYVYbNMM2WOmTtaBHm/Q04YvH6NIZ6ChMQUZo+FPwPcnlgMidmArO85omxP72DOSxIdYGQd3dNOeSFy4D/2nnlMHHYZhzsuIVSfJyG5sS7ztGLrwMIKWkV3RDDsA8UfLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CevNY6muSFqSy6YfiZQhFr3Th691x2ODOZrEzlT0IGc=;
 b=JVZIad5S9pt64xQj7ujwZGGqVYDl2I48U3Xc1bYqHZgXb0rfGaC4fD/doJMRNRpDVjlNjEkpAIO383Fg+3GemPjPjO+YRJvXVQh/PRBwtevntGf2qWdYj8hyJFzy0F6ZTLXKRJ1Er7wsbLXJuO0/mH7tqNdhzJQ0l2wzyCBAwMA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM9PR02MB6756.eurprd02.prod.outlook.com (2603:10a6:20b:2c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 10:32:27 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 10:32:27 +0000
Message-ID: <79fd231f-c43a-bcbb-9660-c58e5bfbd953@axentia.se>
Date:   Fri, 6 Oct 2023 12:32:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 2/2] i2c: muxes: pca954x: Enable features on MAX7357
Content-Language: sv-SE
From:   Peter Rosin <peda@axentia.se>
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231005134541.947727-1-naresh.solanki@9elements.com>
 <20231005134541.947727-2-naresh.solanki@9elements.com>
 <29485a37-1f45-9f7f-9cc5-5d6a9fcc5e08@axentia.se>
In-Reply-To: <29485a37-1f45-9f7f-9cc5-5d6a9fcc5e08@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AM9PR02MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: e5424b23-9b13-4710-cec6-08dbc6578997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kk7VmBrWam+3hFJkfWVu/guE3y9NR3LHAQaWenaCMkvMZV9mkWde43DEq3t5DzBjgRjXmrqA/MySV0qh5ob3SHY1l5ES8p29H9B7MCAwFKGZehsjWVO8000blsOFJaVjElQ2deuC88NglHVBioXRAEFIzBFHrFqcRsKlVkWf+RwPtN4Mjlh7hs6QtCt0bhKGxSDi2miQaA345SYFrX22y6kyCjzNBJToXddZVIxGE+A4yfMT5IiGG74vA6ph7IDHRG2Juh8s3ybJfGpnef73h7+jnWHSkBE1L0R4rZ1bo/Qmjey02Vk19xrHNF1ptGTedTxQTgB/lUjMyfPzho3HLi7HyqsREWjWiPqp1yyHzvorkUC7pTh44ZpP0ghEj+/0MWIXkVt2wOssIIBKD5xe2rBeMOjkxm91iC1Rjclag6TG/waQNOASPtGZN3HFAobm6uAHAVsXcKW7zIbYVKNzgu3Ayuy92qt5ZdYj5PUluJ0ZG5rSuBZfq1r4ocHFJ5zvLb82B4W2Qadih1ZXN39plreKUM7f7u2ODNdr+kE5SiHJhYGBqeH49QbIeHI63ReCVgH6xyUIfVGoBDj4V5aT5+I36h03w8ijj9UbD7f34mcBXwn5xUz6XCB+Kr6Yu0riVmKyrqYQ8FBM61yrR1Q+jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39840400004)(376002)(136003)(366004)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(316002)(66946007)(5660300002)(6916009)(66556008)(66476007)(41300700001)(8936002)(2906002)(4744005)(8676002)(4326008)(6512007)(38100700002)(6506007)(6486002)(2616005)(26005)(478600001)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTdXa3dDUUt4M09DalZqZ3BEZ2N1VlF5d20veUdlNXlMaU9GQlJLcmhqQ2lh?=
 =?utf-8?B?UXVSamFqeWgremtkVlVQazhYekMyN3lhOGZ5QnQ0L21JWjA2MXMrcVNxNUtT?=
 =?utf-8?B?VGZhMDJ1VlNDN3hCVXk2M0lRVE41SXFVMTZBcTJwMWlXaFpPOHFhZ1JXQk5i?=
 =?utf-8?B?aUNPdFR1dmhnMWU4NnhTTzhKRm9TbkJocFVpRlc4ak1WZnJ4QjNQRlFTQUEv?=
 =?utf-8?B?MW11ekZJdGEzaXphMlBaMXlHc2FiL2t1S21yd0pOSUREa0U3bWNzMWhMK3Bs?=
 =?utf-8?B?YXkyVjdQMDd6NnI5UmV4dU9lazdKcnovSW9jK1ZpaUJpL0xQTis0Z2liNkZt?=
 =?utf-8?B?b01wbzhIQWJXRW4yYW51d3k4RkF2WEJOZHhsYis1U3RabklFWFYwSzFHNFlu?=
 =?utf-8?B?dXFVS3FxaldtUWFoZURxUEpXdU5GV3hpd250bVBTcXZYWmgrOGpOLzNXNy9D?=
 =?utf-8?B?VDdxWUpCSjBzMGxTZloyaFIzRks0QVh4ZTlXcXAwV2dGU1pVN2FBLzJlSmpo?=
 =?utf-8?B?Q3B2ZFZHZTlTSDI0cUoyUXBmVnZYcElLc3Npd0Q0K2Nxc25xSUt4ZDBUdjRK?=
 =?utf-8?B?QWh2QnUwejVhdUZZUzk2YTBGNkJNMHJJL3JrVyt4bHJKQjhGU2FLcGVRZnFM?=
 =?utf-8?B?WFcvRGVDWFQ2SUJKOUx0cXZMckhudmpYNjZxeXEyUmtLZVZOaTFBTlJkeHdM?=
 =?utf-8?B?U3U1MUs2N0V2MnlMR3BlSG02UzZPdVFvTEl4OFFmQ01meW1mcGNnSWNFc2RD?=
 =?utf-8?B?WG5XNzZ2S3M0aklxc0VrNkpzTExMd3BGQnEyTGl5UzlDSEZGVHY0eDNKbVov?=
 =?utf-8?B?b2huR2RHMmRSNFBQbVNaZFJOc2JSd0JjVStzK2o0ckQwam5ITC9xNVFEa2xK?=
 =?utf-8?B?bXVTWnZtWUo0N1FFOGtYTVlnSEx6SU13V3JkdXJDK2FNS0psN21VZGNobE5z?=
 =?utf-8?B?dXpSWDhUWFhvcDRaQkdRczZpaVBGK2hINDhzdVpIT3hrRithL2ZDcnd0cVFB?=
 =?utf-8?B?WVc3VUxlcHBBY0ZRYjdRLzlTejIyT2xoeUs2WGloSlBoSDRiOFUyaHlDVitP?=
 =?utf-8?B?MFd4cGdKWE9EWTNTQ3lmaXNGMmIvZWdzY3JjMVFYODJ1MkM1ZmFLLzZhN1lu?=
 =?utf-8?B?K1RBOWMxdzhTQlBMckJ5ZkFSQTRTQ2ZBcmV0MU5kUmVoTGtaQWszbkoyOWk0?=
 =?utf-8?B?a29GcTVrS05uSzVTcHczaFZxZ1dzNFpMaEdFbG1HSDl3SHlOTjUrQlVlczdH?=
 =?utf-8?B?S2xwMjIreGlrTSs1QkdwUUZpN0NUSzRqOW51WnlNNkVjeDUzWGs4V2xDbVp3?=
 =?utf-8?B?N0pNQXhXUHpna0tBSGM0aVVWUUpncmdzdEM2NmtkM3NCUlVDdks2dGVVZGVk?=
 =?utf-8?B?VEFUNVNpbkRPRS80bm1vOGRkMldzWndZSnd5Rm1PdWtVRGRUZXNxQ1JuUUZP?=
 =?utf-8?B?aktVb1pyRVNqeVpkTDg1a1NCR1U0V2ZnNnMxRm85QnBEYW1MRUpxblNYS0lK?=
 =?utf-8?B?TG9na2dwZm1sU3ZNYWhqMkltYkNmNDlEbFZWODJRRmZBOWVwQVk3aUNsYmJW?=
 =?utf-8?B?eTh4cE9XdEhBT3BEY0s1WFM0RjZDTW9IcU5LL0dtbUhnR2YyTzRaajRQQkRh?=
 =?utf-8?B?dkxRaXlDZ1pHVHVpRWFFM1hFUjF2L0NSelhPNElpUlQvWXJiV29laGNxTWov?=
 =?utf-8?B?bkdWYzNtbG9JQUV6dEQvWmFpQ2NGd3E4bmxuc0x2U0h5SVZ4c0RseHRDWUJs?=
 =?utf-8?B?N1RWS0YveWIxMHdsL21xTmpRb2p0aDRuOTA4TEk0VmZDelVPNDlIdTlFSi9D?=
 =?utf-8?B?NXZ2bVBTdlZWdlNTT2cxcHM1SlZBUEtyeFNyU1liR3UrcWx0WUUvdFB2TWZG?=
 =?utf-8?B?aHBTNEZZcXFBbXh5RFJOVnlKR0ltQU9MS0FxR2RucUlaRGhmelViRHdDVFgx?=
 =?utf-8?B?UFhheTF0STN5NmlGc3RWTDZJWVkyL1BEaEFYR2poS3RDUzVZcXp0aGNYSUxC?=
 =?utf-8?B?bTJvdmRrZElzS2cyblR5emN2SkY5Rk1PVjFmT25NTVp3MUc1eWlleUxla3o1?=
 =?utf-8?B?OUpDRWVuV2xvQmVWQ01ER3I5a0VyRzZMMEVOcnNKd0VvZTltYVpway9LQm90?=
 =?utf-8?Q?O3/WiMwSnonxvpyyJkUCamRgp?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: e5424b23-9b13-4710-cec6-08dbc6578997
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 10:32:27.7241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9kW/c2fh8e+fTKv6lEBNlkCjLue6jlUWB2wx0frGTw0l6VdSBUjRnuvvd+CcA6I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6756
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi again!

[sorry for replying to self]

2023-10-06 at 09:46, Peter Rosin wrote:
> 2023-10-05 at 15:45, Naresh Solanki wrote:
>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>

...

>> +			dev_warn(&client->dev,
>> +				 "Write byte not supported. Cannot enable enhanced mode features");
> 
> Missing \n at the end of the string.
> 

Also, I2C_FUNC_SMBUS_WRITE_BYTE is separate from
I2C_FUNC_SMBUS_WRITE_BYTE_DATA, which makes that "Write byte"
misleading.

Cheers,
Peter
