Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670C03141C9
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 22:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236544AbhBHV3m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 16:29:42 -0500
Received: from mail-eopbgr60107.outbound.protection.outlook.com ([40.107.6.107]:28875
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236568AbhBHV2x (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Feb 2021 16:28:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+gIQNaCfxoxrHduFyoz7tcLW1znJDeOBga9epYJawr6354yWchCq1nIYe8zTcwF+89suCqkZOqoco8Jy9TB4AJ2GzFSlBR702mBdua7xbfwfVCXm3gVGC3/p9mIPD955UZy4gzT50RPyre9ZzPqK2XllN3l5kPXFFmYxmbGONgbQ6iYb3CTOBgkxFh8IyYTzd2Yl/QMO6AIrfRV+8NcEHxzrxxiq6Lr7nClfAHmMnS0ouIoE6pNnY3iEPCoCE52jwTK7mn6HnwNGc6a44iwgxYPglC4iCB/MUwK5QiJtYPgKMuN9GTucLchLfoCYqCzWmJ7ABAtj6oUvXwFPCJEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVV0UqNiqje+9ZhjVxVHgK3fFXJuXXdigEfjq2RSC9U=;
 b=TyYQruqH0X56SVGn8mYceDtH5+d8ded2i9Gi3NsctBW+HgdjAJJUVnhfy8nuXwwuYby8PP5T2GSBnMTmSKoafqQjr/CLa0pECnbEgEI1rPwezdKqiQv/CQdXsusgI4a2KdgFmhGpInv1xiHDoSsUMY0lcCyxCFJPbQ6XkRcDEQVCSZ4jrBp91iiAtFCk6PFC6M52LaxuG1ipQISt+MjopcNxLpHPAeRXsrsH+xGd430xDTUhG427qR2gnK3IIbdAns5toBACJ9jz0vodWKmVkio7Lu/sdRZkWmJgVApi9UPHBmk+tQyqM+cCcnFoDY5tyW5YJfuWMlmC/+6gZrUIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVV0UqNiqje+9ZhjVxVHgK3fFXJuXXdigEfjq2RSC9U=;
 b=nfNy+kShoslLtNvSKKP8D9F1NGSI4jvdxzYWZQ+j1a6KXqhiX+XdDSciddc8Ri1SPFW9uFmbDgIcv08kFn37E7Rue/g7/VShNWyuKlMMavE8qbL0czBWqpZwfdHk09zn/sWvv2wf/TD2Pn4pRgvyAH47QyD6f+zy9sZzFbhPXZ8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6245.eurprd02.prod.outlook.com (2603:10a6:10:19a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 21:27:24 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 21:27:24 +0000
Subject: Re: [PATCH i2c-next v5 6/6] i2c: mux: mlxcpld: Add callback to notify
 mux creation completion
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210208201606.10620-1-vadimp@nvidia.com>
 <20210208201606.10620-7-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <8493aefc-dae8-d766-b2c3-1710eee59855@axentia.se>
Date:   Mon, 8 Feb 2021 22:27:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210208201606.10620-7-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR0402CA0023.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::33) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR0402CA0023.eurprd04.prod.outlook.com (2603:10a6:3:d0::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 21:27:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9fd6436-4f0c-479e-7f12-08d8cc78537c
X-MS-TrafficTypeDiagnostic: DBAPR02MB6245:
X-Microsoft-Antispam-PRVS: <DBAPR02MB624529D5102FB0BE6CC4936BBC8F9@DBAPR02MB6245.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /fh5R5S2bKwl9nwBErJECiWWdZeP2/tEGhJJMbEZMUWKZ0Z0OAG8iiQAT3JLdpry05NmmFHXQ3Yy3qBzOrJxqCUwCPDn9LWTjavLYCWFSuFaJWIPMGx5YO/oEUvEBfxisFIjuzmgc8PPpmyam00K/cwqP8xtMRbkVXsVKksP0Oot3MkFFA4fKiKAwZIMHNRF51RVJz5zUtdHz6vK6tsjGWkLe2rw7/sbEbmdaVgMxrASigY8VlJO7lVoPcEghp/zKb9m8hlKLhct6NBGagW87gRJE5+NZBv7y+fXaYBLZrZZ1eS68J4aTB+74SONGmzzVJjr9E2neZOoGHIohzzq2negA7T0MGpCxyfq1HgPvHZSw0SbbxHCdcJ0tlZK/zMs1NdIZmCMTXscTED0ZSqdiRCQ9c43xu3CdX0uhpuKg1Vv+YN81DXj3YSlCsxFQPU1xAjb+dcD416tAOAGusAj3gbd2MTVLzVHn72uTIPgfmuLbgKdjJtWAOzGi8ucVThzqKe37Yd4stTNS97y4KwcO6CepTN6lPnhN7AM1fkWtH6htZltUYBnMRT/0DyMt5rJ7jcqbPlzJwa4S3A3Q4Qk0MfcP679XRiTg9SMJmgg+50nEEA/BSiGyVRSv/YROq7rT0148zHXiuq7y0a+2qy7hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(366004)(136003)(39830400003)(36756003)(5660300002)(8936002)(16526019)(31696002)(83380400001)(6486002)(2906002)(31686004)(86362001)(316002)(16576012)(26005)(4326008)(4744005)(2616005)(956004)(478600001)(186003)(53546011)(66946007)(66476007)(66556008)(8676002)(36916002)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bnF0Z3JLOHg1SDZBa01DUkJZamtINWYxQnI5U0JOWGpqeHVVZ3JMdjM3Yzdj?=
 =?utf-8?B?Y1JEUWY0c3ZBb3VQZ3pKUW1KRFFlbVVOVjJtVmRZYU0rRXRlTDFEMzllQTBu?=
 =?utf-8?B?bE5kT1B4ajVNODl5Y1RqNTlDRk5ZcnlBc1QxVVVsSUFqS3QxTU11RDYzYmFM?=
 =?utf-8?B?TlZHU1dHUEVjUTNMdFpGT0tPbFFRcmtjS2V3cDdaNXVJVEtYV3lLZ0UwQmZO?=
 =?utf-8?B?cmd1eXIwSC9KSDVaYnZmQ0liTkJZUHZrQklMMEM3K3hqYXVLd01iS0tFbU1y?=
 =?utf-8?B?aERjNVc1Sm5aeVRoK3JYUnlpRHpuM0hLaFpscFFzQ3M4NlhGakUyTWNZd09T?=
 =?utf-8?B?N1FCaFVTcHBJZmcrL2J1R2Mwd3RESnJ5SHkwZURxa3VFUnA4MjVKc3RnMmVh?=
 =?utf-8?B?NUcxVXdtdDBoR2hMNWw3bUxYdVNmbzBNNHNXdWlGVDRBSEpkOTlyQ3A2WDRT?=
 =?utf-8?B?YjFHeXY0S1cwWGdCbVFQbDVUMDlySExMWmJaZGdVWDVMYUpMTUVXM3NmRkpO?=
 =?utf-8?B?N0QrdmhJZGVvSG1WT3dlazkwU0lpWjFTS2JlZFpuUU1XZ1lHZmdCWGIxNjJW?=
 =?utf-8?B?RHZjay9kNS9NdDEvdEM0dWNXb1UyVVJCb3B3VCtKbnJ6RE1nTCtZOHg4UmJO?=
 =?utf-8?B?UlNDRmJGWURrSmRoZlJ0T2xVUWNYZU80NGVQSkQxNThIOW1qY2NPQTVUdm9G?=
 =?utf-8?B?dHI1NmFyQWtHbGZsNXJXS2tLYWptbVU5am0weG5qNG11TlBwNUJOQXZrTytw?=
 =?utf-8?B?UzRqZEhnZTF2aG9PVTA0MUdBS1cwMVZNNnpCcWxYak5iODVQbHQ5UWI1V1c4?=
 =?utf-8?B?T3VEa0pta2tXV3g4R0xhR0dtMlo0a2RmMDc0V2RSOGNJVyt4d05VaklnREVE?=
 =?utf-8?B?SjVaeFU0NFBaaVdiSXRVOG1BOGYwRnZrcjZjN2NtNWdVMXJUN2lFTlZZVkJI?=
 =?utf-8?B?RGRHaVdRNnBnMFN3NDdidzJmcUZrajhsNHpTQk52UHBIdFRkd0dvTldqdlo1?=
 =?utf-8?B?a2VHRTN5OHBaaDRqRWpCTTRMWWFWNEQ0WUNydXpFbUV5L1RvcFR2U2NXb2hF?=
 =?utf-8?B?d3RXd2tRRkJjbDJRUGh1R0I3T2xXQmxYTFd1YnVMTEE1M0NVTFdjdkl3YnVN?=
 =?utf-8?B?QmFkeXBQc2w5c09rNUhXNnkxZ21VdkZ3bnVST1lQaTBTWC9EVERjQllzc1JF?=
 =?utf-8?B?bHd3WDNpZ2swaWVjRi9yY2lWZWhYSitMQWFlUDl4OXhBbEt3KzVqb3VUTDU3?=
 =?utf-8?B?NWNQbE91WHdxRnBGeFBYSkM1UGJHTUdvZUFBMTNRUTVqc1pTQzBZR1Y1azF6?=
 =?utf-8?B?NXdFTDU5TVRKNFZIYW82dGVHSG93dlVtemc2Y0xRVFRQS05CUHRNN2QwMEZW?=
 =?utf-8?B?UWpySXBXQjJnNVNob2pUbmprUGtkL3gvSE9pM3FUYW9uSW9OcTFZWXNIaW1w?=
 =?utf-8?B?KzBTME03WWpGdHIwdi9ObDJ6dWx5RWtNKzFoZGZERW1wSFFMeU1DUnlnam4v?=
 =?utf-8?B?WGhBUi8zZ0QyWlByM2o4dFFnNVkrVmlyNWZaeUFjQkRUeEdGdHAvdDF6dENH?=
 =?utf-8?B?NkZHa1NEbVFSUzU4WlhUT3FQRHdnaWNCZkFEeGE1UE9JNHRxR2tnRzF1U2dW?=
 =?utf-8?B?cHdrSkxObitIeVhlVVU0WTBHS2crdHEyOHJ1b1ZhVHhGb2UrRlArVUh6MCtX?=
 =?utf-8?B?elVKMzdrYUJZRVBvNE9zMHVnbk1DOGFUaDQ3QjVhay85dU5uZDJTMlRkWlBU?=
 =?utf-8?Q?elSGsLKJam8UJ3Gx7pG3HTlZqUOejf1EZXoUdbd?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fd6436-4f0c-479e-7f12-08d8cc78537c
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 21:27:24.2724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0qyxSIniMAkKU4r14tvH+hXgh5pZvypkVi6C6HeGPJNYlurja/P+OagzzQ5r4pf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6245
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-02-08 21:16, Vadim Pasternak wrote:
> Add notification to inform caller that mux objects array has been
> created. It allows to user, invoked platform device registration for
> "i2c-mux-mlxcpld" driver, to be notified that mux infrastructure is
> available, and thus some devices could be connected to this
> infrastructure.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Acked-by: Peter Rosin <peda@axentia.se>
