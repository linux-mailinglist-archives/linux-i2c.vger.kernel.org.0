Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04E786FBF0D
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 08:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234727AbjEIGLN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 02:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbjEIGLM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 02:11:12 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2120.outbound.protection.outlook.com [40.107.20.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C479EE1
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 23:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LM8xFu9zUq1ePlna+wnM2ZM5D3KYGtSd+/HBrkuX8RXJwy0BX+WeDrs+RvoUScJ06TlEczZSiPHMDm8sTDHuU+7Ccg7jV43igUze2dgEHPYsB7rJYqtX0bI2BcX/xRADp1nj6BvdrOUh/KxRVhsVofd8AdOyyKEOzgl2Bo3xoEROAfAB/9rWWvRl0kxYAJ5QB2i4EmarnGJ2Duynl9tHGPcDS0g5ScwKz9SOckGXtbxNDZN4w07yS9Oy9dLsQGZUK2lJtWB9o+5OhKbP+Fs86G2Pf7Jr1nXj+CjTAenc58y7LU/Jg8KmWe4W+x5fRLpRD0rN9Jq2qWXkGyEWqRscfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=A7h1d/NPWfMuRC54clHHhErwZ95Y6dZjAjq1ThKTlUJBzNN8wlRkZzQOD+0Bw8vS5laynEidYEIqjIAjwrCenfjrf3hH+avCdBufYZxHSoyVm+IANAmsc8TbrK7Wng9DabEUf7E3v72FyhEzcEKytsTX1du7dfPNT5fJ5OC/5+2VRN9M0UgTf7Jhw1Cspu+pAadG3wgQlsL7QQKQcQ8NQa+posjgKZ8giQ4Z4pVrTg5j+1zJMsvV0FAcKacrniELhQI4AtXe+E9R9HPXghw3QvGhX/8ON52Z4iQIAmQp5Y6/WQdbWgB0jD1+Hcz6TYho5h5ojYTJrfmTrzjSgCNWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=MX+IKhSkKJzvCskhya1b65SVOZTX1gplAqckfZn+ifqbFep4lbg1VrOqRw/ENnAfNadEABd5oKSkeO07Po5WEhblO3DV/6A3B/YadWX0OlIXmrux6V3zA5PKS+nrfYEo5hPaQ9Vi+7QIkBS6iKh5lBa8NpqjCHtiLOAjN/Dr3QA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS4PR02MB7855.eurprd02.prod.outlook.com (2603:10a6:20b:4c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 06:11:09 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa%5]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 06:11:09 +0000
Message-ID: <4f3ebc21-4b49-11f1-510a-a3fe83ddbb58@axentia.se>
Date:   Tue, 9 May 2023 08:11:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 87/89] i2c: mux: mlxcpld: Convert to platform remove
 callback returning void
Content-Language: sv-SE
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-88-u.kleine-koenig@pengutronix.de>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230508205306.1474415-88-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0086.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::10) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS4PR02MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 0756096e-77c8-4036-10df-08db50542e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/gfjdJFhyYSjp5VkedAr+8hBsTCg2NPfImMRzYAiqEQ5W3nSfp8YajBiX+UIfhzDVSQkN+7qxH1WcXL9CGcVmbpepu3KmgRU9hCiDnPxJ3qFQd9nEM/V0+csVvGQmovjTj4zUpOJTClVFCMY2smbCzKAsuj2peimcFpujB8VOz4dxmlEqCqMs1fJmQ9m3CGOCABIWz/mCequS6AOUsp1BURYvn7h8fRaLxN44QsR8qO8fxqA2RxqQL8QPq/wIXt2DF59p0PJOmb6mAM0gYJG1qQf97+94XthTQNqb55pofEUPgSCg1cnNBAfmLyPD0lMVRFL6x17q2lny5qHf+JbdkzvTl0PjrwWCN8qW1tuq82h+2A8yWK+3ojYth/AasKxDsfGzR+7Sb8N3jsZ8LQe9/ym1yaL8kHFAbcwW/TuiYN4m1aH9it9J5L75qriSnR9Ooa6AlPzkDJvTXiTo7U1iHCMtMKaKcNv2qr3rSD4Wk48z73KgT8wWkNlWiorCKQY7G5n2cjlzgouQR93VeMArd7uMHpnhmP+8aWpbOJMSsRkGZVdODBIxP6e+KxSxBkGedkYFB9uixJXG5gGoLEpIpQ9HdMFR+2v3IJ6+a+2aUcCyRf0R6EFYtJiUOk4mZeIkoBS5YTCh+2xwoQ3Deoq4gwbQGe8AZtNqmyq4fNZPLyTgekfgUji2L9vhWDDY7I
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(39840400004)(396003)(451199021)(2616005)(2906002)(186003)(4744005)(31686004)(86362001)(4326008)(41300700001)(36756003)(66556008)(66476007)(66946007)(6512007)(6506007)(31696002)(26005)(5660300002)(6486002)(38100700002)(110136005)(316002)(8936002)(8676002)(478600001)(133343001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGNERkduNVVOVVljcWtBdWM1RFRlakxreGJkbFFLYTVSYVFaZ214ek1abUlR?=
 =?utf-8?B?bmVzUldnMktlVktqUGlaZGV4WkxVd1VVSDNtUDBBQVJzb3B6Rjc5VENoaWJp?=
 =?utf-8?B?akdkRTlLQXVRMVRKU00vWnMyOFZOTWtsNjFta21WS1pxaHhhaGJKaEZjQVU5?=
 =?utf-8?B?aUpiaittNVB5V0VMSFh2TDBzOWlWdmNrT3ZUVUZMTUVOc2RGY2RnVk14QXZl?=
 =?utf-8?B?ekhRU2lrRlIvMTNWVHVtTTJCVytlSDJVdWtkdUtITUVRR0syMjF5U015N3kw?=
 =?utf-8?B?MWduMWhrZlVVdG5vR1pWMEJTbS9LYXE0UHRoeGJwYUN5b0dYSWlmUDJmUENH?=
 =?utf-8?B?em1kSzZER2pQa1Z1dlNpWjNESTRBVXBFbjd4WFk2NEZzZzJVZXp6S0I1ZFdh?=
 =?utf-8?B?czFjckdrcGt3c3IyQm1zTFVLcWwxYUN0SjZYTm1qUThPWXB0T2tUK1Z2VjRX?=
 =?utf-8?B?aE5uOSthZGxCNmNjMEU0N3lMUG14R3QxVUhzVWdhSmRXeUZFdDY3ZHFXYThp?=
 =?utf-8?B?b2w1L1lTOFVsdVQyQTFpZ2NRMTNwUEZaNHNKWFk1UXMzU29iZ2o0SnJvdkJN?=
 =?utf-8?B?TUlVY3dCR25aaVFkYXhNQ0VzRjNVSzFqMHpTY2VZVVhtZEVRSjJyZ2JNc0pZ?=
 =?utf-8?B?bmd2UTJaK1JSM3RYbkplb2FzRGNtQmRNWHZlOERKbmhNd1pDdGV3ME05Qm5E?=
 =?utf-8?B?UnhnTFdFaVpTemR6OXRhdDFmd0ZyaEtGNTlaMXNYUTRLQnlabFZKUEd0R2RV?=
 =?utf-8?B?UjNsZjJFWWd5emZzWVRvT1BkUGNQQzZ1UVdTbThKaHErZU5TcFcyOXJPYWpL?=
 =?utf-8?B?VklGSWtXSldRUHJDUW5LUm5aQmJURlI1UHJtc21mTVBHMm0zUGJHZlNJd1lC?=
 =?utf-8?B?LzlEaDVuM3RGbkZXcE5adFJRNEQwbnM1dVFHZlBPRkdHSGl6cWpTanE2cnVP?=
 =?utf-8?B?RzBhRWs3TlhuTVl4MHc5SWZ3d1Jpc3ZQWTNGd2pLdmdQaHFWeEFBVklUUUVL?=
 =?utf-8?B?QlpHbmphSlVybThwK0VBOXN2QURiRFlJM1JoN2dJMWk2VkZJRnNrRUV0QnlO?=
 =?utf-8?B?Q1dxVXQvRUlsZWJPaXVhTnZmWU56YUVxcTNlbFhRclRjRzFOSVJac21VQ0oz?=
 =?utf-8?B?cW5sZzN0aVM3N1FKRnkxbDhzbTRBRjcvbVFhNW51aTBoNFN5Nm02bnlNYzVX?=
 =?utf-8?B?VFdDakRQRkFjcGtYU1BIMlIwdExXWk5RTEQwVEwwT0h6ekM4VnRQMFl4MXk1?=
 =?utf-8?B?ckVINkhONHQxbmVnWHZNOTg2QmVwUzVzUWFlV2kwNzdxdnZIazJBK2dFUUNx?=
 =?utf-8?B?UmdBYW1Ub2lWalFNa2lnckNxRmJVb2hJZFRMZURvdTNFaSs5QjcreitaTkpJ?=
 =?utf-8?B?U0FVUHZzaHZ3U01TMURCWm1xNFNnRldFOXRhNDZBZnNZOStIbi9KNW8xMWNY?=
 =?utf-8?B?TWdsK0t4OUNnd2dNdUlUalFWOFcrT2I1d1ZjeWFvV2pYa0FVWGxuUHNwUGRR?=
 =?utf-8?B?VTc5WG9maUk1ZC9tSEd5L3VjdzdrVXd6U1RnemdpOVMrVURhRWd2QTNOT2tl?=
 =?utf-8?B?OHpkWWN3Y3BjK1dVZmtScXdsQTBCTjVmNjVrckpFeUhzM0pwWjR0UUtIY3Jl?=
 =?utf-8?B?ZDIzVkpUb0k5MVhQa3puU3VQdm9YdVhzb05Eb2xYb1F2eUxwZW1oSHBkdFFV?=
 =?utf-8?B?NVpLWCtsMEs2RFEwSjA3VVlydHlBL0NNcXNNU1pQTU1CTkpHRmxmeXZQYlhM?=
 =?utf-8?B?Sy9JeXJKaldQbGVTY2I3dEdWam51Ymk3aXFqNStxOERIMWxMcjZtWC92NHJL?=
 =?utf-8?B?UkJ2UDFrLzA4Mkl0STZ0SkM1RzdDbDk5ZjlNRFhmdGlPWWl6WEU0L2gzRXda?=
 =?utf-8?B?Y1dFT3RXVTVvREZZQTdYRk5neWVHYWRxMDRvMDR3clUxcmxYRUl5Q2FjQndG?=
 =?utf-8?B?YkRRdW51Q1Z3T3NlMEUzQ29LRzk4OC9qTEVRTXpESC9pUUw0L0lmQ2xoMCtZ?=
 =?utf-8?B?NkxSU3pueElNSDBUaFlHa09hVGNxZkhmLzViODhoM0o3V0lCbFdpVDA1NXFk?=
 =?utf-8?B?M3gyK2p4cTMwcktaTTRUWU9sdkZ0ZE1qL1lKbWw3MFNPd3cycFRybjhXM0No?=
 =?utf-8?Q?xFdOXg4cHK0xAGRnNIUVEva0j?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 0756096e-77c8-4036-10df-08db50542e59
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:11:08.9394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeBisiaUkQi7IWpuVVwqubL2qiXTFbMDnni2d7dw3qAsEjjaFPGekdpeRWRhc7TV
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

