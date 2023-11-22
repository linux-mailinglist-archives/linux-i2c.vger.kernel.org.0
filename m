Return-Path: <linux-i2c+bounces-385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F8D7F4D0C
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 17:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19CAD1C20A03
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 16:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F54325772;
	Wed, 22 Nov 2023 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="R8dT16q2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2120.outbound.protection.outlook.com [40.107.8.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F2219B6;
	Wed, 22 Nov 2023 08:41:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qtm9e+9udp9F9QCQMIHz0QXL0KJUstDbq1/b1PRt1D0t6mmxiEHt2XLPDjqIkvguqI0dt0MXSzJbmkkGMYgp3qCqQrFJ9lDt+hGlp33FXMJxUj288w5RXk6QKu47ezjH4os1FgVXwDJHLIX1fifnKm4SDRTVCQwxDSPBh+dxxL3xA//pmipj4N/yBxTk49dyn0qi7/4STxrb4v5XrZKlsEnd6CAnTcu6oiIF3nVJ641Tyo/UCRRWmKsQ1ZiXxwEZBfKpyMW2QWKj2kgl3DrsWrB/WBLR7No73S0vzh3In50PewCIh5O/wmHr1XsVFE2KS8rHRHi1uyxVJiLFOYke2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vslt0V1kzXtFfCEvOvpBxKDgu5ZfKdj+M6Gn198Kt4I=;
 b=exUwOFORpH5vXS7W/a0ltMnXl+bu3YktEKYS6PMUmqQ/quad6ad2RhmLTxKbFNsqOntD1ISawthjIZgGsZLwjkV7O5AW7UIq3igVS37GCi205ykK6E742fbgXe/4FlWnFQkQU1HOUCL0o0dtqoVb8FINcMtnn7esCQcS/gYE0Oa6lur/hw+OB2Qy0w/kEGk0ccM717vDNyU0Ld6tu/b/PBKCkWt9u1PWgxEJehzBGy3usMlkY8RF5KvbRvlGvYj3SZ/riV+rijBCR/LjeTWmfNC3TDBJpEDitB0dxxQuF79NG38Cj2paxWhBLzwdeeB7EXZmjQ0M7P/yJOywHkFXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vslt0V1kzXtFfCEvOvpBxKDgu5ZfKdj+M6Gn198Kt4I=;
 b=R8dT16q2ZWJHjgybrvkXsM/kje1hmTyl4qE7Xakwa5dGMICqGo/AsRi5rWVJeJaSD5wZbLdFf4WkhlWmQxSkA2YOqjqPKeqGjO+cbncV7qIJH5rHyhvjvLrGU1Zcj/fzJUHlcl/qzUBYgLF4xZhqXjK6mZEuoYY+EYtW9ARkXec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DB9PR02MB8322.eurprd02.prod.outlook.com (2603:10a6:10:395::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 16:41:40 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::eb7e:2017:35fb:d31b]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::eb7e:2017:35fb:d31b%6]) with mapi id 15.20.7002.028; Wed, 22 Nov 2023
 16:41:39 +0000
Message-ID: <480fef02-09ed-9a32-d5bb-e7114381220c@axentia.se>
Date: Wed, 22 Nov 2023 17:41:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] eeprom: at24: use of_match_ptr()
Content-Language: sv-SE
To: Bartosz Golaszewski <brgl@bgdev.pl>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20231122155916.38037-1-brgl@bgdev.pl>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20231122155916.38037-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0038.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::22) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|DB9PR02MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: b314f909-994d-45fa-4020-08dbeb79e667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5WxNAjOr4I8GpW4QmwqKZpeHRpAtkZ2wZrdn37qlE2iilOPxz7ni21RhhzwRUMj9bXLbwyrLYS9NCadLluBqU9MHzuYwcGk4wUFBTSuCDBkPEavHj20l+7tv1La7j7y7+fbAfYc+YPcaZNQmTGD+KS0hYSGVlONDu9sgFSEJ7Ch/9pNY7A7IthNSq52/dNlye3D9wfErDWUySTK//84rdyaMPZ+MJwbEht0xcS+gOZF75swWnQGT2lBNurO0oD8+DCKG5PMB/+1WiL3h4Bm6MYlJjXJ3klX5yOQ+p0piHDuRxQAbnlOxMC1+RYyZuZCQf+10qw0zq+BW0eK0Ag9zDGMXQGL2T1QzfuS4CQUmds3U+pSExqtzvP+RAH4x6tjbA/9ZdPK4nlHJmK0PQclkrTo3wz9UFNWX4csSeui5726VmOQXiP2QAKi6lB+EwuxUYyw4uyE0e1HJXfLg3TlR5jZqOhMDOTZmc0CoF+81/CgKinHKm6gKC470+jtNIE8B/JTIwSfH6i/ej2nDHZnYVbVNQDD6QU6Fg4ehuPZ7Ry6qHiToBfaeUdp4W8Zmh9Jl3M2mLcRLv8ybGEc5jKv55qZpBITYdF+dKQMGNLEj+Ky/6H/tTeD5dDAgdSEJQ6InVgdJGJ3OQsLYF/X9d3WGi4XTGCI5PlpOkm3t0iDkp0iSNavEXujwzfhgr6gFrb1W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(346002)(396003)(366004)(376002)(136003)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(1800799012)(451199024)(2616005)(31696002)(31686004)(86362001)(316002)(110136005)(6486002)(66946007)(66476007)(66556008)(36756003)(83380400001)(26005)(6512007)(4001150100001)(5660300002)(4744005)(2906002)(478600001)(6506007)(41300700001)(4326008)(8676002)(8936002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnBQV09CT3FUbCsweXl1Q0RUdjF5djkvNFdqamF2bEdkMjBDSlpnQnNNQzBS?=
 =?utf-8?B?VEx1VkZsNk4zNGN6b2tNSWFVSHdXajJnUGNkZXl2Q0hpaDRqN3gwdUxZeEF4?=
 =?utf-8?B?dkF5cnJYc0FRZjZPNUxRdDk1SElEMXg0eVkrT2k4L1ZERGZJZUx1dEtyNGZl?=
 =?utf-8?B?VWtJSzJHVjFzV2RyOENMUFV2NEJrdGtZY2EvcEZ1Rlo2N0d6U0NPVnJVWDNO?=
 =?utf-8?B?Z1NGOGJ1eCtPcitrUkthYTE2cnVvQlMweHZYcFpCZmFMYm51Y09COWFSekJt?=
 =?utf-8?B?RXdSWFE1UkZDZUJvYmdUSTh0TWFoTnJkbE03Y09xNktpSUJpbW5Mc1d2N05S?=
 =?utf-8?B?MS91SHVsU2FPbkwxQ0JIbXY4T0dUM1VjVnVNc2x4UWMrWHl4TFE0dkhXZWFr?=
 =?utf-8?B?RW1UdnlVaWJ0MWRlUU9ENURNay9ROVYwdFJWU3J0Ly91RzB2d2hhMkNIR1Nn?=
 =?utf-8?B?M3R2WmpxMmdwdWlRYzJMVzVDWXpseXVXYmgxTjExbkJpWENYRkdiQ0kvQ1Uv?=
 =?utf-8?B?eVIzb2J3cEpWdVhPMzNUWHU4QlNnSmhJSWNmVENVeFZ5OUZHSjZpWTJydWp0?=
 =?utf-8?B?WUV0TThuSGZ6S2N1VGx5eVVMVDBuQ2hFVXZ2L3ZoZnRRMGY0SzI3bE9hemlW?=
 =?utf-8?B?WHU0ZmN0cktmVGJDLytWYW0wQ1h4UWFNRVFKaXlsejB0eFFYRlNyREZZKzFK?=
 =?utf-8?B?SHg1Y0Y3USttdzBTR282WVdXTmJZMHBhQW5OUVV6Tm9IVUZDTUNkYk0xQ0ht?=
 =?utf-8?B?cjRSay9JdmVRUDJOMkVFWFpJNGNWamgyU2tQckt5V3h5YjYzQ0t3aHJCSU5S?=
 =?utf-8?B?dlZ5OGFxNldiakFLbStFWUUwRTk3ZDZDUFd4TkNNNk5rcTJzQnVZdzl1bWNX?=
 =?utf-8?B?VGY5WnY3UktGOXBpa2Vvbm5rTkFtQk5iZ2ZrTTFadldnNVVINnlWTzNIa3k4?=
 =?utf-8?B?Q0k2bDZtbTh0M1IycnF6dDBSRUpTUWFkbUJ5bSt0VWtpMVhwYWhQa3JFS3ow?=
 =?utf-8?B?ay9LSjBwSzhWWllQQWtPUThYeFVFNFdMSFQ0RVdaTnUzZUYyaDN1R0ZDSmlS?=
 =?utf-8?B?LytFaHR6MXhqbWJZK2o4dkM0SXpBZUZrN2RjQWhiTUQyV3ZKa2E1aGxjcWky?=
 =?utf-8?B?UExFdW5aTURnYVl0OWltcnRYMVIyNCsvNlNhc2VTeFZmZ09NNHU2bXh1ZGN2?=
 =?utf-8?B?NTFKMi9EVFFJVWhkcGVsdTRsbExFcFNkNFVRNkFjS2NzQjZseFBKZ28zUldl?=
 =?utf-8?B?UThPaEd0ajFiWGdrZVd2RUVYdVZWaTJqeWdCbkxkUkFXSUZFeGJkekVTMjNY?=
 =?utf-8?B?OVgvSXdBYTBGWmRhdGlrc0hTcTNNajhqclpFTzE1eitOd1Z3VVd6cXEwUllU?=
 =?utf-8?B?YkcwM0RqbllCeGs2Wml4RXlwOWFGbVZZd1NmaGZaZ2tCZjF3NG0yZXg0S2tP?=
 =?utf-8?B?UC9XdlFoSG0xTGJrRDFtWXBxQ2RpdmkrVEg4dVk2YU5Ed2lYbEdFblNvSXUx?=
 =?utf-8?B?d0h2RGs2ZTJjdmxUM1hmYWMyczc1UkVjSVpXYXBzdHpPb2JwNy9LT1M0SkVJ?=
 =?utf-8?B?Z25Jenk0aityTm9Va1FCc2Z2SHBhWDBleGVRZGtLZ1FjdmZNYytOcHRkVmlL?=
 =?utf-8?B?OW1jVHpHRnhhL1k5TUFieFJmRk5NRlNjY3BPUjgvSVBXVTRQSGRXNU9vNHFu?=
 =?utf-8?B?S0N4VGFSelhDSFo4UGRYbzk3Y2dDK21ITkllRVkvOS9SV0lNdUtldXRSS3ND?=
 =?utf-8?B?VmdINGhUblVNRmg5Uk9DUWF6ZDZieUpmZ2kvcG5YVUtTMzg4ZVhIZ1l4emJ5?=
 =?utf-8?B?UGJkRmdneTNIWS9Ga09vdWZvSFhzM1JOWlFyMTQyV1haMXJobHhqWUcyTXQw?=
 =?utf-8?B?UE9yK0UwdVJmbGdPakk4MG8rWFlNTzNUeHlXVkhZN2I2dVBPK0k1NlFsY0t6?=
 =?utf-8?B?WlJLVUdUVFpZVXpwdHZBV0lkdUsvVjBlYWxGMGpybUxZaVdFVG1UWkkwSTZi?=
 =?utf-8?B?MlM2dXhjKytGaU5IN2hCcHd6L3d1eGRmZkQvRnNoTjdtYTZkSzFuZ2lxZlBt?=
 =?utf-8?B?R0FaVnpKRkIrTVU5VzkwQ1dqVmtJSTFPM2lOekI4Q09IL0d3a3RvSFJrSjhC?=
 =?utf-8?Q?HwpkNCkOFKX4svBIWfN3zMg4K?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b314f909-994d-45fa-4020-08dbeb79e667
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 16:41:39.4019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqz5BBXBd6jzYjlrDe0fiOh5D+WJCJSMe2ozEdTy9eTZz8fZvJQTs6BWJ+Iem5fL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8322

Hi!

2023-11-22 at 16:59, Bartosz Golaszewski wrote:
> -		.of_match_table = at24_of_match,
> +		.of_match_table = of_match_ptr(at24_of_match),

If you do that, you will need to also add #ifdef CONFIG_OF around the
at24_of_match definition, of you'll trigger a warning about an unused
const variable (for some configs). I think.

Cheers,
Peter

