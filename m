Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FDF42ABAA
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Oct 2021 20:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbhJLSPB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Oct 2021 14:15:01 -0400
Received: from mail-dm6nam11on2052.outbound.protection.outlook.com ([40.107.223.52]:36160
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230002AbhJLSPB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Oct 2021 14:15:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcFHJBznjP/l4HGuqsnGsRSNhoWGBu66S/pWgv32020ftV3ABJR3eovxGhBQ91tls1r8s2DVGvU962dEtQ7oB+OuF5wPsJkYEOpar0KXrP7MrXLXbqw6ktBpIhyIRwlTGU39yhqlgI4sGimhiR+ZFWiuXr4D3D/aBlP+2VhiuvOsCzBPP6iTLJ+fillpOQClKnt9Wi49l6K2ZZXhLCyfyG40TGsCXKBgICO0/d98DzqZoc6bhhuTn/jXwXy0YcYS4sjiuAh+VUOHVOO4nbzOys/dlj3bdBcubZQkWxZ+3cmiL9nLoqkgarEvhx8dNeH86kuzN3sSPsWhrxt4urEWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAnIJU95Y/2WsgR2y/JAxBSBl2rLUlanQMkXD25aLCw=;
 b=Ixw5hliCGz6kahNao+vYa4zNmcKivi8c0B8A9djDMYlJ6HnYrvLndtI8e9qVzRdxQI3igWRIEORZvBXNCa8K/OjvwCmX887Qe00CpK+pSRNeO5+qwyGW4ho+70dnnWBi0mUzuuBRlHjpHNIsTGJK2pWiS6uvLQfrVodkOqrIlc1ElbcK2W0P0Jy2a4BjgRvVA2wOlj/0R4zealWOU0QWmAayNNHFqjEW2vfVc2Cyu9OCShk6LLNUxfxEsD2DZq/lm8IfL9HkjLZbtfu4hMS0KxJ0ElwKs2BcxgplSdef/5oC709isTPjSYdOpjLZwrc+wePG9MAbQcQuJYMthxnXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAnIJU95Y/2WsgR2y/JAxBSBl2rLUlanQMkXD25aLCw=;
 b=eN2bAc9rPH7w+GT/bf8Mf0+4iEVXD5m4fFkCnFeneTwupV987fQnlGe/FM0xiHx8soAI0yqQPkYy60CPgy4mpzOeLAj/Od6TnYgk9/b6yVHFp5TdONprAf7Q42b/cviAc4KJq4ehsXVb2C4RvCQkLqciVm8RMqhB6H2aF3nQOUI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5110.namprd12.prod.outlook.com (2603:10b6:208:312::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 18:12:39 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ad99:1a52:6176:7ceb]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ad99:1a52:6176:7ceb%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 18:12:39 +0000
Subject: Re: [PATCH v1 3/7] i2c: i2c-amd-mp2-plat: ACPI: Use ACPI_COMPANION()
 directly
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux ACPI <linux-acpi@vger.kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Elie Morisse <syniurge@gmail.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        linux-i2c@vger.kernel.org
References: <4369779.LvFx2qVVIh@kreacher> <3647069.kQq0lBPeGt@kreacher>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Message-ID: <56cc8580-f982-742c-6808-a4d66e39da8b@amd.com>
Date:   Tue, 12 Oct 2021 23:42:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <3647069.kQq0lBPeGt@kreacher>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR0302CA0011.apcprd03.prod.outlook.com
 (2603:1096:3:2::21) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
Received: from [10.252.137.85] (165.204.140.250) by SG2PR0302CA0011.apcprd03.prod.outlook.com (2603:1096:3:2::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend Transport; Tue, 12 Oct 2021 18:12:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 301ea9af-ed02-4435-5f8e-08d98dabe05c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5110:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB511042D16143B1A6926855819AB69@BL1PR12MB5110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nEfpjb/ZwvpETU1f1vu82k6QxgFBet8gnF5+PFgoJIF+xl/ImGH+4dhlCV0GgzcxDXWU+vBw+0ayx5Z0OF99EtSWn3CsEXTfHtpRKtiRlwwLd0FQ682MqfHrbqaU+eHNjBJWmug8IPsEJgbYH6P9NsLJxU+1ACj/tcheltVt0dqQjUgxMhYhnggYe6azBNXlJIS8Po2vqOr8kqJDgCYY40sH2J2B0kJ+3KBhDSOeNnGCPm8fIl537qk7z0hFZQ+0D33BUg4M/IGL713jaVGpSuPazL5bWWp3CNXSUgzRlX13y7wmU+etgAF2qYi6PGKdfk3jEwSI4UNQJCuYWJEzfCt0tWxTeHCRXoKRNkmKHdx3M1F2xXP62jK1kR6CwaRoTmlDgUbGNmN0+FjSzl439RzGBKTCfpIdBzj8OCR+wNQP9I1vgsCWkt6lSDJ4SZh0erH86ejDQknMeT6y9rAjG1GGTr3zJwA7l1ay5FHNUcfyKgWaDHhrX1HM60kVeuXVhb33en5tFhWjVr46lIiuaVM9K4JEVgt+wRmIdsxTB5goTwKhvtB31kCSi8OYW+vjw90TtzjBfDxqO0Ql5BDnS1SJbbR2EJQYrw50uTllzVu/MdV7Ny/cjCvSIzgWFpjhwQOhOXM4OL/j0rps0WVrDJ2K9kHPvQy3FUOI1cZ5YFT3QzneuSET5CWJVwlEr2UH9bZJ78KlkmC/G6XYPt0SK24DZR0Q3FTz86NdF5GlGo1ztwSmLKTbpLjpyZmstBlg53QheXGg5c8YeBB2I1Iyrj5zBoYGIBdk+xUmZloWC6nAqHoeZ8Arn4BcGGjvuLkc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(4326008)(31696002)(2906002)(86362001)(8936002)(186003)(5660300002)(66476007)(16576012)(8676002)(6486002)(316002)(36756003)(66946007)(54906003)(6666004)(38100700002)(31686004)(66556008)(83380400001)(110136005)(508600001)(2616005)(53546011)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3Zjd0s0SUhuRDFWeXJ3d1h5WE1XQkJ5N0F6c3lhNVE2VWdGeS9NY3Q1d3JO?=
 =?utf-8?B?VUFkNzhjMUpVb3ZlQUxuZS9rN1dqY3JUanpXekY1c2pkL1FRUXdqUVpkYmJ4?=
 =?utf-8?B?dlNudWpBZjV6VTNRM3FBYk9vbWFhZG1Bd1ZWT2FseitvSk0reVpVRDJzU3BM?=
 =?utf-8?B?NVRVOXRFS0VSYUVjS0ZvZjRobDVBTlA5amRGOEJYZmU2T0dmL1RUK3FCUktP?=
 =?utf-8?B?WnJYeGMybWJ4QS9OZHM2NmRsRmNZNWlWbmEyYXNha055emtwUHdVdjVZRngv?=
 =?utf-8?B?TnlkWUxMUnFyakxYTEk1VEp4WVFnZU54RkhBK1pkaThweXdNenBpNUVSQXd5?=
 =?utf-8?B?NCs5eHVTY2xxZkZXZHVneEZJOVpqS0R0VTdoajYzU0pFaUVIK0tLd29XQ3Ft?=
 =?utf-8?B?ajNjYlB2VSs1Q3V0UWRvMlMwQis0cXIyVytoV3A2ME1KUHIxRGxxNTFCQWtk?=
 =?utf-8?B?a1VxWGo2cVppZjlKOGIzVVJxRGU1V1ltSW9Qa0lUeEt6LzdsMGFybldIbFFG?=
 =?utf-8?B?UGRBK29hUWNRcmtwcnRCb09SZy9mK0k5SjNmZXpKVkREWTJxanZJVjRZWWJz?=
 =?utf-8?B?cjNFeW1KRE40bHBGaTN6V2M3V2pJdUFZbTF3cGdiZ3U5WUllR2RyNlJsdVBz?=
 =?utf-8?B?WW8wTjd2bWZybGZYSW5ybU40RTFIbFNYb2NXMDdvT0V2SHpBTTJrNE5TdEtC?=
 =?utf-8?B?WnRxWEp5aExCZzZZM0NqdXNEeEtLTjhiOW5rTUo1Qld4bkljY0tZeDBZbWFz?=
 =?utf-8?B?YmI5R2JpUDBYMGc2amZ5VlhCVmhQWnkrZWl3aWhYYnVyZ2plUFJhQml1L2Y4?=
 =?utf-8?B?Y093QmNqL2pxb0cvWTgxOU9yejdXMldYaU9oVDZhVE1hVHVpcnkxMmNBT2ZC?=
 =?utf-8?B?WVRJMG9pWjdMQW1CMEx0a1JZS05NVk8rZjQxSzZ2Wkd1WXhvVW02RVlkSXNN?=
 =?utf-8?B?V1ZqaFNUV1NYeUtYUEVRRDlHejZJS2k2eEllbmJ6MUZTMjZ3NmROWTJia05O?=
 =?utf-8?B?UlhFVFYzM2lLWVRNTXpTdUdXRHIzTlFsdFJrZ2VEWmx5R1hkNU9sN3dqKys3?=
 =?utf-8?B?emZ1RzIrM05jWllOSS9GUzFBZ1FZVFJZZklGRnMzTmU2T0lwd21KYitnNlZS?=
 =?utf-8?B?MitRSE9TNnk5M3FhQ2Z6akl5NHBCV3k2cXdaVW54MUJBdDdSZVJBMG51aWVt?=
 =?utf-8?B?S1YxWjRUU3YyM0xsR0NqZGxNeUZXeHdWSktFMVZhRDRSTHlnY2lXd1E2K0tv?=
 =?utf-8?B?cGgvYjFoUTRaNXBTbms4YlNrY2NuSG83NysyVW1EYjBDS2xQTWxTaS9Kek5w?=
 =?utf-8?B?T044L1MzVEZDYUl5V3hIZFBjU0w4Zkc0VU1VUVdMYm9SdzMvR3NPRlZmQUw3?=
 =?utf-8?B?eXpEWWo1MnVBNVhzY3pCRVo3RWp6RXpvMjhDbDZIczZMUWpuWW5JdlZwSHdR?=
 =?utf-8?B?V0hpU1luY21rT3N5aDVlUWlKV2xCcE1WM1IzRXpHY2F3VmRGNTZZVEgzckhu?=
 =?utf-8?B?MXN1TVBNQk04ajdweEpjRElKdTZzS1dWYkhYNWtGcmNPTUhmazVOMHdZOVpB?=
 =?utf-8?B?dEcyRXh2UC95dlorR1A3VXdyeHRCN0RhWFdDRmNxTlkxeXNyVStSNk5CTldM?=
 =?utf-8?B?UHBMZG0zY3JSK3FieVNwa0NMclVDbEh2VHVZOHFuemoxTkFwYVFIcDd3TU45?=
 =?utf-8?B?TjhBa291Uit3MUhTMWpDYyszVDlnTXVoOWR4RGFqSjVLTlhVY2Y1QVA0ZTRF?=
 =?utf-8?Q?vRwIbF2/yhCSaVZ1w/fFM4rGABkNp5FGZJRySLk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301ea9af-ed02-4435-5f8e-08d98dabe05c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 18:12:39.5617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XiPsStRSCGo6AMKpNRbs9V/M3HCf6HDJ54klBZr2jNm3KWrLu+P84ijsyoE3QSWBxWv7ALah1gd1Vb2UlFOBag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5110
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 10/12/2021 11:14 PM, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael@kernel.org>
> 
> The ACPI_HANDLE() macro is a wrapper arond the ACPI_COMPANION()
> macro and the ACPI handle produced by the former comes from the
> ACPI device object produced by the latter, so it is way more
> straightforward to evaluate the latter directly instead of passing
> the handle produced by the former to acpi_bus_get_device().
> 
> Modify i2c_amd_probe() accordingly (no intentional functional impact).
> 
> Signed-off-by: Rafael J. Wysocki <rafael@kernel.org>

Looks good to me.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

> ---
>  drivers/i2c/busses/i2c-amd-mp2-plat.c |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> Index: linux-pm/drivers/i2c/busses/i2c-amd-mp2-plat.c
> ===================================================================
> --- linux-pm.orig/drivers/i2c/busses/i2c-amd-mp2-plat.c
> +++ linux-pm/drivers/i2c/busses/i2c-amd-mp2-plat.c
> @@ -246,12 +246,11 @@ static int i2c_amd_probe(struct platform
>  {
>  	int ret;
>  	struct amd_i2c_dev *i2c_dev;
> -	acpi_handle handle = ACPI_HANDLE(&pdev->dev);
> -	struct acpi_device *adev;
> +	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
>  	struct amd_mp2_dev *mp2_dev;
>  	const char *uid;
>  
> -	if (acpi_bus_get_device(handle, &adev))
> +	if (!adev)
>  		return -ENODEV;
>  
>  	/* The ACPI namespace doesn't contain information about which MP2 PCI
> 
> 
> 
