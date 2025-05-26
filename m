Return-Path: <linux-i2c+bounces-11139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8FFAC3924
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 07:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FB501715EB
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 05:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C7F1C6FF5;
	Mon, 26 May 2025 05:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KKSuVJp4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C977B661;
	Mon, 26 May 2025 05:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748237397; cv=fail; b=IPLWeduWntqbcEusq2MEhMdLF6W6sAXwU0TbUht810N0xzRQFWeRFfpqiONYQA9EO5udFWy1HPr1IQlaTIrd3rmvyhcRtSMNW8Q6zA/gl3jEe1k9Na/lFRSGJk93SrV+jG8NvSVUMIYu/vJnRBfJkgC/utUQaG76kUC6RB7VjYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748237397; c=relaxed/simple;
	bh=26hM6om5cZ1Q6R33UaWzs/QkSgZLhGLtSRttQ80M2xE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lx//rhgDCFNvhT8R/CMlcEWBzyNQml1jhH9W3lsNi6WWeGKYqpL2BfqwLV+XbroNxPrIYxBXNEjKRRqSMoMRT1B9ApGP9NnBfuryIO5BDL5IUsp/xti9/yr5JYzX0/pasKepXv6xNvccEBxOYkmc8T0XiEpW41dtHMjI+IP3UZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KKSuVJp4; arc=fail smtp.client-ip=40.107.95.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWRgQbtG+/OoSW3D7hktrsd9zYK3k4lS7FXdiw6k9Kcrtm93bFDuwvG2q5DUJTLWLjQCHD+c8uMsZXohJILQ0e/it/IopNVAPYr3ICm1WsfVqvye+roKISj49DpZ1nn7XLDk4r/It3yVBl+LfD2pG/MEihUpVddqyEZcJhl/QeAY8WTX6OeJNf2OP66/mJsCfxvLC0YT50S3kXXv/1MxWhI9+hyIabN24AD26GDliYo+jN1xJCHPTcmfB1j6lS39KgACUaRqfhAXOyvvDxKyQvVmNl6/2KlHLbqT4QRmaWLQNVoTZsmyicWimdJinK65eOiZetqFyXeBLdaUDPwBKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26hM6om5cZ1Q6R33UaWzs/QkSgZLhGLtSRttQ80M2xE=;
 b=IlVy2IFA4mXle8j9VPnO9FFmhxo7FlDf0nC6Povh+Kyttm5p7wim7CIJr9Ms0ykGv0faDVtSh419nqM6kHd22s8PIRJjuBAz/RahpP8XchrF65fPc04q7F86d+Y1n+M99cenPxINgu5WQHcrn4VESZ8S8UbkP2ZUo5xjcD4aHdH5EyItm9XQY5pLEdeFOGxJRo+2d/Gvkdvvk2Vlk7qP4GFHTFCFv9chDIu7w+EXoJfrm82/DEJOLgHRDG1f1lOnq1dQ1sP+w1pY037FX8gEGlmt/SU2lSc40xLmDXTr+FgIyquRQVTemTAOHHBYjkVmrqPkH8Ns9ukXks5NWdyRXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26hM6om5cZ1Q6R33UaWzs/QkSgZLhGLtSRttQ80M2xE=;
 b=KKSuVJp4KXhViu2q0h+3Ex/MDqdBtS6F8IjAspIFkWjD+0CO7nFrybl29/2j5vSvho1zzGP4fPIKepcBnACcNarNuz/WzMcXvg3AHXOsucdIzdIdnCZv5UM3W5EFnrmH1M5n0/gbhvWdREWxMehFDerq9Og+Zbnh8NYg91YwoFHwoaDAs5Mw3ZapG2dRPZLBUB1EGO3o3jIJ+FaUxVA0xe21NcZDHpwAj6PK9HPJk7ahFo4JocumzOEuX9YTFa+3kcktDCtd40iwL/qRLalGodK5SJwyFvZikAzPCywLbEboVono379GjEApTdlirsfhUTFlSl1UPGmn14rqfXDOug==
Received: from PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19)
 by DM4PR12MB7503.namprd12.prod.outlook.com (2603:10b6:8:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 26 May
 2025 05:29:53 +0000
Received: from PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530]) by PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530%7]) with mapi id 15.20.8769.021; Mon, 26 May 2025
 05:29:52 +0000
From: Akhil R <akhilrajeev@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, Laxman Dewangan
	<ldewangan@nvidia.com>, "digetx@gmail.com" <digetx@gmail.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: i2c: Add required properties
Thread-Topic: [PATCH v2 1/3] dt-bindings: i2c: Add required properties
Thread-Index: AQHbxmBB/Pbxu2rs/0m5g00dtRzyrLPVNiiAgAASogCADyf3MA==
Date: Mon, 26 May 2025 05:29:52 +0000
Message-ID:
 <PH7PR12MB81786101346C061EA73472FFC065A@PH7PR12MB8178.namprd12.prod.outlook.com>
References: <20250516124349.58318-1-akhilrajeev@nvidia.com>
 <31cf95ec-ef19-4f87-a27b-9ff183f5d257@kernel.org>
 <e24f406d-dce1-4201-9fd5-69dead1a90ed@nvidia.com>
In-Reply-To: <e24f406d-dce1-4201-9fd5-69dead1a90ed@nvidia.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8178:EE_|DM4PR12MB7503:EE_
x-ms-office365-filtering-correlation-id: 4fa2f0e4-ecfc-46ff-1e0b-08dd9c165773
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OUJwOWR1YjdPOVNIK1ZFZzJoT3lrMmZEVkRSYkdsTFdzWEJzYXVTR3J5d3J6?=
 =?utf-8?B?ZkRtVVFjK2dNY2RjMjF4RFozMlFKRUhDb1F3eW80QXZDRFoyTFNpR3dMVjZl?=
 =?utf-8?B?ZG41U2VEVk9sNUFodkhYUm82Yzc2c09KWDEzNzgyekU4TGt6cFNXV1VYMk9Q?=
 =?utf-8?B?aE53b0NjS21iQVdySlBpZHMrdnNvVExhcm5tNnVvZE55VFBhOUxhc2pLRFox?=
 =?utf-8?B?WTllU2c2VjhkY2h2UlN2WUNOVzVET3l6U3FhUDhMaDBkUjlOVTN0VHZCdzlx?=
 =?utf-8?B?YkZKZ2doTHVUZWkrWjg1bmdVdUdJMCtsaG0vS2VxMi94elZ3OW02QnNrVURk?=
 =?utf-8?B?NHhNeDZ3bFhvcUZQTkVXK2RxQ1BIWXpQdkZHS2VwVEQ2blpSWm9RbGJuWU9Z?=
 =?utf-8?B?RnJra3VycFYzYzZ0MkZVY0F4M3dJTzU0SU9GTXNNTFp3NVMxc1QzMXRzTUVU?=
 =?utf-8?B?WGpERUUyMkpWbUxRcm1ZdVNvcThnbUdKQXZXWjdtcFpDdlp6MGxmaHQzSHhK?=
 =?utf-8?B?YklRVk5sc2h3bUozS1lVTEl5VzR2VWxrallhNWE1bHJiVW1NcWlBZGJrWUk0?=
 =?utf-8?B?b0J5cmpiMktSYTNjQ2kzYTdjY3dxTys5LzduUXJwWlllTG1XQ3hGT1grL09W?=
 =?utf-8?B?UWMvaEV3K2F0OEl2TUdoSks4UitaL2R4aE92MzJ0OHl6NXlVYzdYQUt0NzYv?=
 =?utf-8?B?bzJ0MXY2UFpkcmdCT3I4R1M1dlNFQm5GMDNoY1hnWTBWZ01McW13a3kvM2x2?=
 =?utf-8?B?K0U0bXZhWXhOdi83OTQyY1ZRUUozWFp0cjFyRStWcVgySUxUTFVQWVdOdGt6?=
 =?utf-8?B?QVNOQjJyeFVUdHhydXRmUEFQN21Rb1FuaTROajluWGxIRkFBUzJTS05EVnFy?=
 =?utf-8?B?Tll3Y0FZYXBsUDNMeHJJRzZKRG9ia1lhQk5FRGk4Uy9IVkFkYk1tSFN3QlEw?=
 =?utf-8?B?TmU4ZlRRd1A2d1JqMHlDR2g2TlJ5aFNnbW1xd1VIMUI5TGVqZHphTmNTVmVT?=
 =?utf-8?B?K2lUWDk2dkNZNG1oOHM5dEcxUVJ1NjJhRGQrSVNITW5kb3JSSnhTdG1XQkl5?=
 =?utf-8?B?a3Y2QVJUMGd5YmFML2pkRkhZWndldDQxSFpRaUszUDNWZko4R3pEcjFFeW1n?=
 =?utf-8?B?QmVMeUxQSDhySENDR1RFMmRrNTllVEJiMkpybjJXMk5INyszbTd3Y0ZpdkhI?=
 =?utf-8?B?eDVhbzB6TVl2dDJ2UzgwT3VWZ2tQekpPa3d6bFFIM3E1czl5c1FoSTlIMktJ?=
 =?utf-8?B?cWJCWFN3ME9rdFZueWl4NEFncjNQRFMzdTNDWk1WOFNTUXhWSUowd0dCZHVu?=
 =?utf-8?B?Q0Zpb3UvRFBwVDdaNnNqR3Q1d0NrVFpWcXR6R29qVDJpNmNFNXdiRkkzMkZC?=
 =?utf-8?B?YlA0ejROUS9XT09HbGFlT3RvS2NKSFFmNHJ3Ly9kSEp5aEROc0Q2M0tGNFR4?=
 =?utf-8?B?a1VQaGlNTExVckZiaWc1c2J1SjY0dFpsRXNzNllUTWJjN0F6NStLeVBOdnhx?=
 =?utf-8?B?VnhacnFTdjY4M042QTZxZWh6NXArc2RYQ2R3ODlia1BiR0dDSVptNGdWK0wx?=
 =?utf-8?B?ZjZHNlliM0NwM1UzaHhScTB3ZHdUQ25aWE5WWHdHTW5pZnQwVWh6UGR1VHF6?=
 =?utf-8?B?cUhmVWZqKzdVWWZDeUI0N3FTV09wWW5yTUVLTFQ4WU5XYW0veTN0UFNtM0Iv?=
 =?utf-8?B?cmhYR2I1MnZvN3ZJKzJHN3h3UHJ1cVB5V1dLNG5HZlJDbTR1UzVzamlOdXNV?=
 =?utf-8?B?SGdTMFJUS0c4ZUx1aWFyZ3dLUmNQTTB1OEZDNTJVUEFBYW5IWWYrWVRBS1N1?=
 =?utf-8?B?ZEk2Y0ExUGNaVkxrRVl4SGxvS09kU0ZhRnI0UkM5QklyTU9TQjR4UlUvU0ZU?=
 =?utf-8?B?aGFzbUlSNVIyYjZnZXpXMmhjcVlxd3AxYW9tcEQ5NWdFeFJldVJQNkpRblFt?=
 =?utf-8?B?UUdtMWVGM0xWazA3SVR3OEUrYU05anhCalZxZGprMkRYNkF0YmVId0Y2TGNr?=
 =?utf-8?B?VEp4cndmVmhsS0dzSkp0L21RZHlidUZkWFJ2SmFsSlpNbkMyWDRRaU55YVBp?=
 =?utf-8?Q?zkff0Y?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8178.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WnlVeTFGYlRFeEpIb3o5QkxoSk1iK1RvaFV0L0RBSW1DbFhlUnJkVkd3WTUv?=
 =?utf-8?B?NENneERtaU9GYXpHanprbTBaRGNJTUlBeHY3ODlZRjNTSlQ4c0NGak1WdnBG?=
 =?utf-8?B?KzJOVVhhcUFBS1BhSFhVUlRkS2xLRk43UzlqUFBYNm94VkJmY0hYN3NBUWts?=
 =?utf-8?B?UmpyUmUyb3hHMmg3b01veVRVNzBKL3F0T2RlMy9BWjdrdExqUnRNQVZMdXkx?=
 =?utf-8?B?UVNtU3RsMU9xY1lZeGtrWGRIU3I5cHNqZVZvTDNhMHZCKzZEUWh1V0Ziakcy?=
 =?utf-8?B?Wlp2YVJqNXpnNmFzdE8wNi9WRitoN1VUdGZZSWxDRGlBNmxTRndZZ1RsT0hI?=
 =?utf-8?B?QXNtTlRsWE9CaHptNU1GcWFnbXI3TnVudmRnYjhma1EwWUlpN2pHSFJBQm5V?=
 =?utf-8?B?NnBsVG1hQlJpQjMwZ2lmcnRBRWEyVlpmUVFMUUx2MkgybUllZXZFdE4rVkFP?=
 =?utf-8?B?S3VpbXlQajE4ZDJBcTBkQ3J6TTR2aXU5WHlpZVJFdGw0cmNhOTVPNS9nOEhV?=
 =?utf-8?B?N2MrKzQ3UzB3Uk1XMmxUb3VRTHRiRVZKTmFVMWU0dkRFb1BhVHNFZ0dveGEv?=
 =?utf-8?B?NGpmWnN4Y2l3elJMMmJCcjRGTnpzRmZKbDVGdDQ3ZnRKSWRLZWIwZ05YMXp1?=
 =?utf-8?B?SnhUM3gvV2l1Vk9aL0ZCMGUrOUt2MC9CdGQ5ckZrLytMMTZJbGhyUW1JMzZV?=
 =?utf-8?B?ZFNteGVFZ0dJRTdwZENXQ290SGpBMEFrd0xxeU5ZT1oxRnY0SXVCdVRxMVlp?=
 =?utf-8?B?YVp1d1hHSkgyZ01sQzU1NzJGZEZsTktOMC9NaER4bklhZVBYcVhzQUhhd013?=
 =?utf-8?B?bTRrSWZZUUd5M3pMRUw5bmd2V3huR0hJeHd4aXN0WGhYMXlOQkxDTFN2VExX?=
 =?utf-8?B?VHdLd2JyejIya0piYUQ3RXg1SGh6VTBMek9Pb09UQnQwUm1rc3BqN2dJMjYy?=
 =?utf-8?B?RlkwK3RGa3RLT0VKay9wbkRwRW9qWFJOZ3k0MVcvOC9ORmVPZHBacU93ODE4?=
 =?utf-8?B?RklUbUE4UTBkWkYwTEFRT0szcVVkR3ZISFoxcTdVL0paU29jRitJdW9TWXRT?=
 =?utf-8?B?emNHR05qQUpxNFc3ZUh3L1RabFhYbUF2UWJwS1N2Q2dhd1hud1ZncnZiaU53?=
 =?utf-8?B?SG9jK0twVXpobi9oUEZHZnhhUFdZa084c2diZ0NONmVqbXhoWFh2a0RzOEhz?=
 =?utf-8?B?aVFZVVJmcDQ0azNGVmdRcHJ4MHBSQndsSkR1blpyRTR2RFYrclN0dGNxdFpk?=
 =?utf-8?B?U0JtZDB1TlBQUkJsVmlqN0N4QnhnbGpYSG0rbnRPRWRrd3pLTWdNa0pxNmx2?=
 =?utf-8?B?YktBdWJTUThwZ1IxK3BpRUIwaVJ1VE4vRDJvcDkyWmpuZGkrSHovVi80ZDRw?=
 =?utf-8?B?VGg3SmlpYjNTcDNERFdPYURZTTBPd0NqZFBZeVhFcWxkeEd2RkZ6eHkrREFE?=
 =?utf-8?B?SWJZa0RTSkJ4R1JVZTg1SG5UWmhCVmxvVU5yZlRuZFFjSG9LU1lWVVBaZjF5?=
 =?utf-8?B?eis1ZEtWRTgvdEFYT0wydlVDOWNSeHphUHFyMUZYY3k4U3VMZiswbXJsL2VL?=
 =?utf-8?B?K25vQ0dBQ2Z2bFFmUDQ4WTI0NnlSNGozR2x3UlJGcis2cFpBOU1LdUs4ZkNQ?=
 =?utf-8?B?M1ZkOWtYb3ZlOFZta1B1bGhLWitjMUZYeVd3d2JhQTd2QnRIcEVzZkdldTJ3?=
 =?utf-8?B?OVlrREJ3M3QyMlhZeFhpNmtCRUVLUU9tVFhGcUNlUGlLRnVVMDYyWUV4T0J6?=
 =?utf-8?B?M2EwbUZ0QTZJVmlOOEVuMno0TWVMU1NKeVVab3FkQ3FaaVpOQTkvU0NZeTNI?=
 =?utf-8?B?b2dZYmZjMjdZdDdKZEluUEZJd1l0TGpaQmMwV3Ixc2hSdzlUK2kvSWdnQTAw?=
 =?utf-8?B?TlZnWE1pa0VxOW1nd3BVWUZ2TDU0UnpaNm9FUitFVkY2UGpSYnhYZ1pYRW1z?=
 =?utf-8?B?Q0ovc0VNV0luSnprbFRlckdTMk5acHNzYmlCWnEybDJscnNSTHoyc0JjVERJ?=
 =?utf-8?B?SE52QnZwYzZCMUN5RFRBWWhFV01FajBRODBMZWZpcmtYN0ZpNERmOGxLZDF4?=
 =?utf-8?B?MHNjNDc2T3l6b0h2UFhCcjBTVTNWc0RGS3BhZGEzY2tnL1dtYmRWdnNLcUI4?=
 =?utf-8?Q?fRQucpIxU4jZcSlBMuBNwc6gl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8178.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa2f0e4-ecfc-46ff-1e0b-08dd9c165773
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 05:29:52.6276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ea081f6e4ooCET08AtZU0coea0IgLskM0sOTrOVmRTqrDfELpII67ttvRY8MNrfAu6K8ju1I4D+EYg+uJDmb5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7503

PiBPbiAxNi8wNS8yMDI1IDEzOjUzLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+IE9u
IDE2LzA1LzIwMjUgMTQ6NDMsIEFraGlsIFIgd3JvdGU6DQo+ID4+IEFkZCByZXF1aXJlZCBEVCBw
cm9wZXJ0aWVzIGZvciBUZWdyYSBJMkMgY29udHJvbGxlcnMuDQo+ID4NCj4gPiBXaHk/IFJlcXVp
cmVkIGJ5IHdob20vd2hhdD8gU29tZSBjb250ZXh0IG9yIGFueSBqdXN0aWZpY2F0aW9uIGlzDQo+
ID4gbmVlZGVkIGhlcmUuIEFyZSB5b3UgYnJlYWtpbmcgdGhlIEFCSSAobWVhbnM6IHByb3ZlIHRo
YXQgeW91IGFyZSBub3QpLg0KPiA+DQo+ID4gUGxlYXNlIHVzZSBzdWJqZWN0IHByZWZpeGVzIG1h
dGNoaW5nIHRoZSBzdWJzeXN0ZW0uIFlvdSBjYW4gZ2V0IHRoZW0NCj4gPiBmb3IgZXhhbXBsZSB3
aXRoIGBnaXQgbG9nIC0tb25lbGluZSAtLSBESVJFQ1RPUllfT1JfRklMRWAgb24gdGhlDQo+ID4g
ZGlyZWN0b3J5IHlvdXIgcGF0Y2ggaXMgdG91Y2hpbmcuIEZvciBiaW5kaW5ncywgdGhlIHByZWZl
cnJlZCBzdWJqZWN0cw0KPiA+IGFyZSBleHBsYWluZWQgaGVyZToNCj4gPiBodHRwczovL3d3dy5r
ZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmct
DQo+ID4gcGF0Y2hlcy5odG1sI2ktZm9yLXBhdGNoLXN1Ym1pdHRlcnMNCj4gPg0KPiA+Pg0KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBBa2hpbCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPg0KPiA+PiAt
LS0NCj4gPj4gdjEtPnYyOg0KPiA+PiAgICAqIEFkZGVkIGFsbCByZXF1aXJlZCBwcm9wZXJ0aWVz
DQo+ID4+DQo+ID4+ICAgLi4uL2JpbmRpbmdzL2kyYy9udmlkaWEsdGVncmEyMC1pMmMueWFtbCAg
ICAgIHwgMTkgKysrKysrKysrKysrKysrKysrKw0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQNCj4gPj4gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaTJjL252aWRpYSx0ZWdyYTIwLWkyYy55YW1sDQo+ID4+IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9udmlkaWEsdGVncmEyMC1pMmMu
eWFtbA0KPiA+PiBpbmRleCAxOWFlZmMwMjJjOGIuLjA3MTdmMjMwNGNmYyAxMDA2NDQNCj4gPj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9udmlkaWEsdGVncmEy
MC1pMmMueWFtbA0KPiA+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTJjL252aWRpYSx0ZWdyYTIwLWkyYy55YW1sDQo+ID4+IEBAIC0xMTgsNiArMTE4LDEzIEBAIHBy
b3BlcnRpZXM6DQo+ID4+ICAgICAgICAgLSBjb25zdDogcngNCj4gPj4gICAgICAgICAtIGNvbnN0
OiB0eA0KPiA+Pg0KPiA+PiArcmVxdWlyZWQ6DQo+ID4+ICsgIC0gY29tcGF0aWJsZQ0KPiA+PiAr
ICAtIHJlZw0KPiA+PiArICAtIGludGVycnVwdHMNCj4gPj4gKyAgLSBjbG9ja3MNCj4gPj4gKyAg
LSBjbG9jay1uYW1lcw0KPiA+PiArDQo+ID4+ICAgYWxsT2Y6DQo+ID4+ICAgICAtICRyZWY6IC9z
Y2hlbWFzL2kyYy9pMmMtY29udHJvbGxlci55YW1sDQo+ID4+ICAgICAtIGlmOg0KPiA+PiBAQCAt
MTcxLDYgKzE3OCwxOCBAQCBhbGxPZjoNCj4gPj4gICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+PiAg
ICAgICAgICAgcG93ZXItZG9tYWluczogZmFsc2UNCj4gPj4NCj4gPj4gKyAgLSBpZjoNCj4gPj4g
KyAgICAgIG5vdDoNCj4gPj4gKyAgICAgICAgcHJvcGVydGllczoNCj4gPj4gKyAgICAgICAgICBj
b21wYXRpYmxlOg0KPiA+PiArICAgICAgICAgICAgY29udGFpbnM6DQo+ID4+ICsgICAgICAgICAg
ICAgIGVudW06DQo+ID4+ICsgICAgICAgICAgICAgICAgLSBudmlkaWEsdGVncmExOTQtaTJjDQo+
ID4+ICsgICAgdGhlbjoNCj4gPj4gKyAgICAgICAgcmVxdWlyZWQ6DQo+ID4NCj4gPiBOZXZlciB0
ZXN0ZWQsIHNvIHF1aXRlIGRpc3NhcG9pbnRpbmcuDQo+ID4NCj4gPiBUZXN0IHlvdXIgcGF0Y2hl
cyBiZWZvcmUgc2VuZGluZywgbm90IGFmdGVyLg0KPiANCj4gQUNLLiBDbGVhcmx5IHdlIG5lZWQg
dG8gZG8gYSBiZXR0ZXIgam9iIGhlcmUuIEl0IGlzIG5vdGVkLg0KDQpBQ0sgdG8gdGhlIGNvbW1l
bnRzLiBVcGRhdGVkIHRoZSBjb21taXQgZGVzY3JpcHRpb24gYW5kIGZpeGVkIHRoZSBpbmRlbnRh
dGlvbg0KaXNzdWUgYW5kIHNlbnQgb3V0IGEgbmV3IHZlcnNpb24uDQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzIwMjUwNTI2MDUyNTUzLjQyNzY2LTEtYWtoaWxyYWplZXZAbnZpZGlhLmNv
bS9ULyN0DQoNCkkgcmFuIHRoZSBiZWxvdyB0ZXN0cywgZGlkIG5vdCBzZWUgYW55IGVycm9yIG9y
IHdhcm5pbmcgd2l0aCB0aGUgbmV3IHZlcnNpb24uDQoNCm1ha2UgZHRic19jaGVjayBEVF9TQ0hF
TUFfRklMRVM9RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9udmlkaWEsdGVn
cmEyMC1pMmMueWFtbA0KbWFrZSBEVF9DSEVDS0VSX0ZMQUdTPS1tIGR0X2JpbmRpbmdfY2hlY2sg
RFRfU0NIRU1BX0ZJTEVTPURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvbnZp
ZGlhLHRlZ3JhMjAtaTJjLnlhbWwNCg0KUmVnYXJkcywNCkFraGlsDQo=

