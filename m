Return-Path: <linux-i2c+bounces-180-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C589F7ECA7B
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 19:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E822D1C2093C
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 18:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5028B364B8;
	Wed, 15 Nov 2023 18:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="Acaoj9ZA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2120.outbound.protection.outlook.com [40.107.244.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB55C1A4;
	Wed, 15 Nov 2023 10:25:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjfXVw1pd1jyqFH4STp8uv0pYgjJgPdhqNf06WsRgvS2yPfC6aUIDJTySfFTcEdWlGwcWteFcwmBP/tTm/YZ2LR1n7jjWZdzKlxkz6aHNNHgk96AIoReZu42aI/dhAIEiI6l1U37wYdBo2Clp3mDNqtFIyQHNCjm2otsM7O9Hn8yaCO77pMoITkK8Ewu0f42T80SP36M9juNw0GI5V4df20RkTqtZKhUUi+9kiUyMBS7eVz/flboRx9Q+HSVMLkYp4ZoSQewmEaaNO6CpR2WfOahS3mP2RTY8V1nUOwQlwh5hRtaO2r6ldVqOvNrGEbtfLviOwKdlQIoMOcF7OsanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULZb1lKT2kHO5FaPc/IX4YHIpR2TY46uw6pWS3Q4gvY=;
 b=HNo3IzUkJ/7bz3zT90HZsEPAy56Qg3eicnMQPNL0rLaqwYaji3/GuAF9uAFWYEj7IqRAmuhE4A9uRBbEk2dsW2HwHJUck1XBgfvezJ58QzbP/H08dIq08neKY2DUWkowxbI1U88E/v7Lx/x0aS6JA2rcILSGqDV7FvDxzlvlS0/aj3oydaPsFAyQDU3GbdfxpuaxljzcHDGJ/CqE4DAbEiIlmWhBEgxyH63SJF+/8lUFiwa2yxIc01UKE9QQDMaOnOAkG1S1qkzs8y0N4GWGTtuPNEWuy3oBVnTB0IuQvLGu1kS95OZIxglOKavM9lebMF+b0hxXECgT2WlMNlJLGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULZb1lKT2kHO5FaPc/IX4YHIpR2TY46uw6pWS3Q4gvY=;
 b=Acaoj9ZA6sGJgqAyQBjqTxyUtWY+/6HDB86BZ4YKMFRgMN77oP7wj0XbI/ktZcYDEBcG1gw4Oj2RKsrX0Z8+lJhWPLgixQbxYnmrER1hgr57wDp2iC0UION6bTOIiM5WjmXX02MeP0XV83afOSRbD7emOrlSmPsE73qiEjZL1t8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7475.prod.exchangelabs.com (2603:10b6:510:f2::9) by
 LV8PR01MB8431.prod.exchangelabs.com (2603:10b6:408:18a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.18; Wed, 15 Nov 2023 18:25:19 +0000
Received: from PH0PR01MB7475.prod.exchangelabs.com
 ([fe80::3313:3ab6:572d:58d3]) by PH0PR01MB7475.prod.exchangelabs.com
 ([fe80::3313:3ab6:572d:58d3%6]) with mapi id 15.20.6977.019; Wed, 15 Nov 2023
 18:25:19 +0000
Message-ID: <16668165-adcd-4cd6-8c50-83b992f8e880@os.amperecomputing.com>
Date: Wed, 15 Nov 2023 10:25:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: designware: Fix corrupted memory seen in the ISR
To: Serge Semin <fancer.lancer@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231109031927.1990570-1-janb@os.amperecomputing.com>
 <yuperxjytpcwz25fofjut2edzjc4i6jgymcraxp4q6mfe27taf@b33ym5iuubji>
 <ZVHxhN+dxJSUkEOg@shikoro>
 <tupjmogut45oh2t2cth7o5wpqc6u6qkwfwddqrfnozlpplavlz@vram3ul3t4zj>
Content-Language: en-US
From: Jan Bottorff <janb@os.amperecomputing.com>
In-Reply-To: <tupjmogut45oh2t2cth7o5wpqc6u6qkwfwddqrfnozlpplavlz@vram3ul3t4zj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:610:1f4::19) To PH0PR01MB7475.prod.exchangelabs.com
 (2603:10b6:510:f2::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7475:EE_|LV8PR01MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: dd25ada4-5805-4cc1-0d23-08dbe60838b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F7cGLsRHWEtxqFbiMGa/VPos0qnKj+ambkP7AizORfu6YLHRvMqwJlngF6ffgHn8XhaWWbwl0XK0+v/1AVi64ReskM+2YE4VseakJlqJL0M7/V1ZViwXPfnrAZxqgVt5A8GuWpDSrXl69NhYg9bp/Mpehid8E8jH+FDKOnAGSCOKIKSiIFazvquOVC0PqVFFmTepUPyh2MXvW3Pxm1S4HEDGuQyqhL9Bf69HA8kdr14ZOLeZigQvBxxfwOf4WUEJyVUw1IAAof7Cq7vzbkt3uCHEWr49Vfos2rC1JjvHbm0T9iPhrnNZVufOvRqMJv+EPeGwsFyd55aRr/wSt+Zf5FVRzYPbCC+Bfr/k5htXbvLe63K2lV8XWEAy5mRV9MOGprApn0ynheLyzneNIAmq/QKrijR9lb8BRcMDthnEm+rJoOEWvhDcVCzCipEDGxSC75LDhZc6zLA9Sv2w9Tq74qi99md1xvt5G0VWfjxLqB+XECvr2qSTRi7lzepAzJzCaXrE5kNsuPymlJ7XdqY778O1QhSAesQq45gnuzLhhktJP5ybjySYfN1rZYtLrb6e+QjVWBJakG8fxO42W2LBQFLGn/307R7Nk3O1KB9yjplBl0oihGh5/8uIsfrEoaYB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7475.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39850400004)(396003)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(478600001)(2906002)(6486002)(6512007)(6506007)(2616005)(6666004)(86362001)(5660300002)(31696002)(66476007)(66946007)(110136005)(66556008)(4744005)(8676002)(316002)(8936002)(41300700001)(31686004)(38100700002)(26005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0M0YmExWm1LK0ZOZVlGMU4zbGRjQUxRYTdvUkZOY1dYT3RuaEJzbWRwSjJi?=
 =?utf-8?B?WHh5UnRrRS81UzlWbWt6N0kxWi90bWFDWmQyVHhqYVdRaE9mRXYvWHlsTEov?=
 =?utf-8?B?TDdaZnJNZ294V00xMzMwcnczS3VNR0xrZ0pLNDlYKzh3UjBVR0VhTnlZSjJB?=
 =?utf-8?B?aFJ5RWVKK0lHK0NXczkyM2ZDMUZxSzBhUWpCUkZVbE5HalpMMVVTMEVKcmJr?=
 =?utf-8?B?c2VnUVdoc3dYeHp3aTVrZCtwbVV0N1I3dWVrVkNQV3FCejdEZFdIQkNBRDZp?=
 =?utf-8?B?K2RNcXY0RzNIeStqSUxDenVpNnc4cFQ4am55R01Cazl5eEhJRWJDbXVGTks2?=
 =?utf-8?B?cVBjbXBiRElkYlhGaEszSlIyK2ZyTWRiRmQxaUhxcGI1L09oLzRKWmlZay84?=
 =?utf-8?B?S0o0N3JaZXZIYmRIU0VFQjJGRm9sUC9zVERXOVJWZ1QzdzVuL3VVemFQais2?=
 =?utf-8?B?Nk9XSXRPN3NSeGJIMXZQWVlKbTE0MVlyV2swdnA5VTNYT1pPSWwyWXl5S0Jh?=
 =?utf-8?B?aS81NmJXQWxPL1RRRUJKc25mN2txYm5aMnB5Yk1VVkVDdnZOUlVZM056NEN0?=
 =?utf-8?B?U3pQRnBkK0RRaVdVcnV5dklZSWtYM05ob0R3SWZEcStsNm1TQWUwdkplZEln?=
 =?utf-8?B?ZlBZVmFJT2NtSHJuRVFqWkg1Yzdnc0M0U1hFYk5SQmh2U1pLK0YwOHVHTHMr?=
 =?utf-8?B?dXZDSzQ2d2IxYTBoL1hkYjUxOWh0YXJsMWYraFh4MWEwODZZdnN0VDNJcTFF?=
 =?utf-8?B?djR0SkFkRmhQalVqMTJrWkNKQmkzQi83ZVM5OW91SXdJTlQvZ0tZMFdxU1lW?=
 =?utf-8?B?Q3cvS2hJcUo0MHBPOGMvM0VnRitxOExTd3BtWnQ1aGhkK0c2Q1NrUjRIVVFP?=
 =?utf-8?B?OUp0N2UyUHIrQk03c2xRS2VRc2VOU0xmZHgyU3VGcWhmN1RkNVdrWnF6RVdD?=
 =?utf-8?B?MHFUVTBqTkNhUkc1QXpDd1h2d2xKUVFqUUZFcWlaNGdFcEhFUVVoV25WU2kz?=
 =?utf-8?B?OTBsMVA0R3ExMHp0dmJUeDN0N1VuTmNhQ2lRdzc1UldkOHVENzZqSmdOK2ZP?=
 =?utf-8?B?TzZmTEIvVGVlK3RjQ0ZYZVpKZUsrdGRJSUxXbVdNLzNQQmJLVXBzQjArU3h2?=
 =?utf-8?B?dVFBTnpMVXI1TmZmNGZISWxiYjlpM3dXd0lHaXp0bTBJd0FMQkt2WWJ3c3k3?=
 =?utf-8?B?c3hoVFRMbVVwVGF3cE1LUkZNK2hBRUI2cFoybW52TmdiQXhGdTNuOFI3WUJE?=
 =?utf-8?B?anJzTTlSNzlkdTBobXpwajdLVS9NYzYyZFNRRE5Tcm9TM1pBalorU2JjMDda?=
 =?utf-8?B?ZkxRVXZVVVV3VjFRQSsrQUZxckhaOHJ0bkYvS3JORUN0Qjd4cWpMWmx1ekg4?=
 =?utf-8?B?cGFmbkFGNnBMZmxENFE5cW5XbC9yQlZyQjk3bFd6Wk93clZyWGQ0THVyLzRy?=
 =?utf-8?B?TDBrOXdLRSt2blh2cVJCZWtJUURLRUhDVit0VU5UVTBGZ1RqN25NQTlVSml6?=
 =?utf-8?B?ODIzVzQ1ZE9SOWt3L3RXY0tBOFUrcE5rMjZDcXhwbTNPZWFSTVkyV21tMmJZ?=
 =?utf-8?B?ZmN0Z3lGTlNWV0wyMk0xTjJzYTJjbkVRaVJ3bSsxeWliYy9hYTFTREF6WlFM?=
 =?utf-8?B?Rnp5L0NxbVVVMk5taU1NRWtGdkYzcGo3RkdYRHlwaittWS9lN3lHRW84QWdj?=
 =?utf-8?B?Ry83YVlUVjhDb1IrVE8rMVlBVHBic1ZNTVVJYXhwQmx0VkFqTERFalYyR3Zi?=
 =?utf-8?B?cmkxVHpvVXRyck9hT3M5S2E0RUV6RWQrdGJHQllvcTNCVTRyUks5ZzRrUHdQ?=
 =?utf-8?B?a2pUY1NRQ0ZCQW1iUGYvWFBtK004TUJDa0FyclRCYTRVT2QxbVZsdmtkQ3dE?=
 =?utf-8?B?L2F1UEVYMFBRZGhPa3FiNXBFckVGRnZQUXV2bmVGR1pVMDVFeXJ1UjBNeEU3?=
 =?utf-8?B?bGt5ckcxRElKVG1LUW0yL0YrSVJmeTZvTVBXcFpPdXN2c0JlSjlhVCt2RkFv?=
 =?utf-8?B?cHNWZkVxRE1nRkI4Uk1aNGlDZmhjdEJqOFF3Wjd3OTdzMGJVeDhYd280VmVo?=
 =?utf-8?B?S0FsRzIxWTdBV2pJWHVvRWREODd1VGVSbFdUWWt4ZS9xNUQ5RTRzVEZnMGdS?=
 =?utf-8?B?WjlIL3dIcytHenRDc0dLeXVkYkhzUlRLdWxUYVU4RTlOcDBJWThoVk0weENl?=
 =?utf-8?Q?byiD5RY9SCAhhZLkyKai3tc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd25ada4-5805-4cc1-0d23-08dbe60838b9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7475.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 18:25:19.0397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xk2vkoTuuJsVoyVvkMHipJ1zdssTrAqkrFwSZJ1hOUNuzAPsPML3QmM/Sa/5hDK8uLR4IyK74lxnCf7R1eQTcKrt3uEmQbdQERgbwXzVLDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR01MB8431

> On Mon, Nov 13, 2023 at 04:51:00AM -0500, Wolfram Sang wrote:
>>
>> Thanks to a restrictive hotel network, I haven't pushed out yet, and
>> could still add your tags. Thanks!

Hi Wolfram,

Any chance we could get the "Cc: stable@vger.kernel.org" tag added to 
this patch? More than one large cloud company would like to see this in 
the stable kernel, as it significantly improves the reliability of IPMI 
transactions on platforms that use i2c for this communication.

Sorry for not including this tag in the submission.

Jan



