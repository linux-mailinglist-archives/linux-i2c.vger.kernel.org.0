Return-Path: <linux-i2c+bounces-9109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B286A122D5
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 12:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F270162998
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 11:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4E523F266;
	Wed, 15 Jan 2025 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hYLfVf2Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C172139C6;
	Wed, 15 Jan 2025 11:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941255; cv=fail; b=jTSZ4Lcn+S9ycAoqvYe4QqcElo9NSGnaRYpncCBiUwyZUpRj9Sd+3U8AaSviVM3w/CvZqGjMUxXY9i7Xj8uNNsZ3hIjOAtUcaY5W284btJKFU42MRS8qgMEP3qrFJvgxq3gvx4aUzz9/UtmI01v04QEH2Dh/ltTgtsr+8RvraFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941255; c=relaxed/simple;
	bh=EVD0Uf9FS3qM92gpKs49SCEdWtahiVM0VnR8Hcm5/B4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HqtoPAWNiUSi/tb21E7YDfel/KkJG4UDqYKLGwu9tfGeP0lCBt+arv1w7HrSYtK0mmjn1bXJ20OZdIY61VXd5vhLmBu8RQtpX1yyAneafFxW+KcJidmq7GADULsw1VPfiPwfPuD8lsv/BT6ZNNFrs7Isc7kzMb1WzrOIwKVScek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hYLfVf2Y; arc=fail smtp.client-ip=40.107.243.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+aTkVdBf4HW3z01hW4rE/RxmzBLx/8kYraw3OHjLfykptCYTO3Q/pulbz6H4zB5tMTED8DrMcGMnPP6iLpo8TQePlUgF6sZ+hcsRaZNF1t9UE2+DkqT4sjPnrlf/aBZe0wQgSM0wTjiyoM//7hFX/mf+6OFwVLkenMRTVNiMlR94+JlClivCYUD4KUWg2IAPtsPH6aQJuvCrItfqB1S93DvsKy6oGvjmURFELn8KmMZnTg3jbNHrBpRK/Ld+opeehucbhOV2znA7D6kfZ9oekf/6Mo1jGiHtF/OoEqY9Ws336fERApLfTKnTKuCReQK4PCAKZjlCrOcwCAjAvP09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVD0Uf9FS3qM92gpKs49SCEdWtahiVM0VnR8Hcm5/B4=;
 b=ymCek0MGtWcghUT/mWgNlE4wteyOA7OooUw4iyd/IlUh71gpRsaW/W/y7mtOubghICeli7dEBAplTC7N9hR5sHfaJTHL4CTij2ZkFra1dw0emOFqt14oOLfNPwR3PW5zBN6Ghxt7fEkczthJuVwjAiGkCMo+AFaQFeOcJ1Om1HJpJzOUJ2y4IFURsVjvEhfWsmJ0lqWOC4yiu0cqxES2A0yPpRIDNyJyBoEgb4lIrwT4GngtxxFkVe5jPwLkzuxSle6Nkd/ZqIEWve9UapCMfxrkEnw+tthaxn409NxbYs86furgqhxkyok0aXyXLVg7k6j6oJrfqzoK4lp/+inp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVD0Uf9FS3qM92gpKs49SCEdWtahiVM0VnR8Hcm5/B4=;
 b=hYLfVf2YxZPwteCLq4dNkSDuL+V6gOcoZG0G+a9EukHI+Ck2BQ88LTCjszsxV1w60R+IlkFpfbKwcFScdmEb8orsaY/mwGeKDBRJz8FArW+sAhBJHVbIiuVRefOrEkUS3/rkmcjHn8zbFHdNp595ltUYA7fLMOOiaIy1eoNMZ7hesQSE3AoyY7ilEjApwcQrrsLan5BhvKUWCMRDZ6e3cGH7ulE8fPU3U5e3NUHfc3cD6m5OljVPhqhzK/ptQZRzcEbsNHz062o+bdPMwaBEu4WIa+xfrsB2etTN0Fu3/a81Dd8ObdfSmmQf7C+62NiStOgR7F8fRbzrysG1U5hGsg==
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by CYXPR12MB9278.namprd12.prod.outlook.com (2603:10b6:930:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:40:49 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%6]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 11:40:49 +0000
From: Kartik Rajput <kkartik@nvidia.com>
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>
CC: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	Akhil R <akhilrajeev@nvidia.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "digetx@gmail.com"
	<digetx@gmail.com>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 1/5] i2c: tegra: Add HS mode support
Thread-Topic: [PATCH 1/5] i2c: tegra: Add HS mode support
Thread-Index: AQHbYey2mcoVCqAgeEeRVMmF9eJOubMXwMMA
Date: Wed, 15 Jan 2025 11:40:49 +0000
Message-ID: <a40329ad49dcc0efe1a468046a0a1ab19e3ff53a.camel@nvidia.com>
References: <20250108110620.86900-1-kkartik@nvidia.com>
	 <20250108110620.86900-2-kkartik@nvidia.com>
	 <vdllsl3rbt5xjaew4wzovpo3aoqrn4wvezcvuqfyr3mer6n7on@pkq5q2g43r3n>
In-Reply-To: <vdllsl3rbt5xjaew4wzovpo3aoqrn4wvezcvuqfyr3mer6n7on@pkq5q2g43r3n>
Reply-To: Kartik Rajput <kkartik@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5716:EE_|CYXPR12MB9278:EE_
x-ms-office365-filtering-correlation-id: 0cd77e7a-2d85-40b8-3a5e-08dd3559757f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WFhEVGZ2bC9mWnNsY0lzTDJWTDhjQUtnRW1OWnRkTGVkTnpZUG1CL3NHcEhI?=
 =?utf-8?B?ZDhOdzMzU1c3MWhXVE56VVBPVi85cUZtVEV6bzYwOEtXOUZiNUVtMHV6SzJa?=
 =?utf-8?B?eHBiNWFTOEFOU3hWc0MyemQ4WEtyaWR4Y05xMVNZZmVIYUUyVUMzVFhMSGc1?=
 =?utf-8?B?ME1ManJTY0FUL2Q1WkFXdTNpUzdVcHptcGQwRDdEanNia2pxVG5KVy84UHZJ?=
 =?utf-8?B?bWE1VnNxVDZSWGl5VVl2eFFmN2JzZmdqUnRYbWt4RFZZYVBTV0V3MUJqQi9i?=
 =?utf-8?B?RjFvNmtWR2cyOC9VTFJRbkRkVDh1cUs1K082bGhvOWd0VkRlaUhIQ20wS09h?=
 =?utf-8?B?ZHdnTUJXUzFtRkpYd2picHd1UGcxWEpJK1dGSkI5blhuMy9HeVZSYTlvTWRn?=
 =?utf-8?B?L05tWjkwd0RqTEFCOWxybXczdUJlaEhTUlBTTTIvREdDekJMYmxBdzRheGdM?=
 =?utf-8?B?anB6WlRrOGhoTTl2SGpTbjRXRlMrbXd1Wk1vWHhlb2hDeEJzWWJBWEFramVu?=
 =?utf-8?B?SkFYMnZnL0tJUTRDd0V0QTZWdGh1OXJ4Z3VFYW5kWlFoNW5nMDU3N204T1Ns?=
 =?utf-8?B?RXg5Zk9xNVhkTWRRVWl2NE5kRkdXbk0vaGZRT1NqZXBCTXRKQVBSaG9kRktJ?=
 =?utf-8?B?Rk1ra21WY2dSVzNOd1J2aWd0OWsrSjFKaE1hb3NsZnVLOGN1ME1zRzM2TE4w?=
 =?utf-8?B?MGtGN2lhV0Y4TU1sTE5qMHd0ZzN2Q0t4aklLSG54bzVad2YrbnozTzFxNVlr?=
 =?utf-8?B?SjE0UjRkU1hjMndzQlA0YUREVEJFQ2V1eW1CdVVPU3lQNEpzT3MxZzM4K2hy?=
 =?utf-8?B?NklWS1NIVXdmbFNyVnZDaWpiWE1KWG94b09BNlNmQVlZUHA4SFVkb0NXbVVK?=
 =?utf-8?B?UER1TEtsNXZ1c1JCV0wxQjF1ZFliZlB5WU10ckdRVXluMEFRYy9ESWN4c3NI?=
 =?utf-8?B?ajc4dlRaMGhwcnJPdWZqS2k2ZzZzQkw1M1lWR2trc0ViNlVyelcySTVNQnRS?=
 =?utf-8?B?MUJ6TmpYcEFWRkhVcE5ycG1SM0pWbnJtc1lPZmIxU1BmMEVSWFVvdGRXaVd6?=
 =?utf-8?B?anVpM09nQnhoakJPeldDNm54SVp6SDllT1l2eEx0eWIwbElnWURwcElaQlhj?=
 =?utf-8?B?b1p2bzlpQld4bStJN2dyQ21aNGZ4enhYVHBWQ1YzbVIrZUNVWU05YnpueVo1?=
 =?utf-8?B?bFVuY0ZLRXMvR2dvVjdHdkRDc2dLVnBoTjhOenl5bjhRZXkxSnBtSjlQak8x?=
 =?utf-8?B?cGNhNzNoeTNIVDN3OWEwS2lIWXFsQmhaNFNUZ2hrQnZHME1pSno3dWhYK1p3?=
 =?utf-8?B?ZC91Y0FLOVp0V200N0dLNDlmYmxXTmRDeFk2Zm1tcU9mbWV1bHpUb25jcmE2?=
 =?utf-8?B?SmdYSmdCNUh0WDY3eTgyU2lJK2hRaGdwVUpWbXdoWXZmM1BCeUFzeXV2TGVt?=
 =?utf-8?B?VWw2bVZuNUxqbnkyengwd1cxa05rMlNwZWpmNUpVcjZOWnpkQy9oOGVDZnlz?=
 =?utf-8?B?dXpqWTZ6SkdHN1N3bXBYRkdEZDVWQVZCZEwyVDVaUEZrN2NXeHBETUNzT0tL?=
 =?utf-8?B?ZlZrQUt5SzR6Y1ZzR1VDNURORUJqT1Q2OEEzR1dON2Z5bHl5QWV6MjRxS0hr?=
 =?utf-8?B?VGZSYm8vckZ4MWVDVFNFOEVGWlBqR3JGTncyc2dHcmVxRjgvbkN0UmdMNGdo?=
 =?utf-8?B?VVNpODlSaGVCVVlBemNFTDZUVllyN0xkc0N4UEtVWWhUV2NLcVcxdHlFUjg3?=
 =?utf-8?B?RW9nZXp2YTdqRC9uRmpidFZXaEtPTXRaVEZ6WUwxd2JXL0NDVkFra05uU3Qv?=
 =?utf-8?B?cWptWElMLytpaUU0enpZbm9SYnRuRUM2SzVhZGF4K2RnQVF0b0JSdEo2c0J3?=
 =?utf-8?B?TW0zeTZudUhmZG1zS3VXWE14L3lRcWhWYnRxVDZnYTBnQnpvdndNYmg0Ky9k?=
 =?utf-8?Q?S1AfOeUsQ2Y49dzq/v5Vv2Qh6fFVrCE0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RnJqenkxTWx4NnR5UWxtR3owZEt2aHdxTWlGNDFwK2F1UWxHci9VWFlNMW1l?=
 =?utf-8?B?VGtVTUh5YWNRZTVzdllrMVB4aThmMGE3aE5CK1p0VWZwSHluL2xTMzJNS3A1?=
 =?utf-8?B?Q0Q0NlpYd05UZmJCdXhndTRvRGQ3OWdyQ3NzeUZpdDB1NlNCQ2tOcWdJRDVl?=
 =?utf-8?B?eXZiOGpQODF2dkYwcXRyUlAvSy8vMW0zSVlXaXdZT3gweWN1YlFqQmRLQmhl?=
 =?utf-8?B?REwwMUtVMGljVDcvc2ZIMHl6Z0NIK095YSt3VVJTUjdHUzdDSXM1SU5wQlhC?=
 =?utf-8?B?OGtWR3dqZmVIWm5pam9aYkl1MFZSVTNvc0VycEQyV0tCcjhYbWdWdUVFcHM4?=
 =?utf-8?B?ajdiaThadVhvWmhmdjlTaWFyeFRnUm53TUN1RXJ0WlBleGRhNDBKTE5JV1BJ?=
 =?utf-8?B?ZWsvRWVUdUhHZkFIWWJPcDZLUlhyam0wNDNKNGhybTI3T0NLd0FOeGdOcVZL?=
 =?utf-8?B?TlovNElxTU1PaUplK1hVa2RlUlc5amNYMUVlMlVlTEJ4UUl0cXhMdzQydHM2?=
 =?utf-8?B?bE1YZ3J4S1JnZ1FqUmxCenZZc2V4YkNiQ2xrL1d3MWFTaGNHZXNJZS9veEow?=
 =?utf-8?B?Um0rZmRCUmM3bUFBUVhya3pRU0VjSUxCZWtrcEtVaWhGTFA0UE1ZeUpwczdh?=
 =?utf-8?B?K2lydlpFUi85L1dnVmhNTFlKSE16UE53aFlYcXpOeHVhbVg5S0Rsdm1hWVIv?=
 =?utf-8?B?ZkVHYXhUYVI2VHhpNUU2Ynp5N1Z5ZTlHNmJ0Y1RPSlkxNTRuM3Jnc3d5cjIw?=
 =?utf-8?B?d0N6OStIOVcyN2VEUXBrdnZsK0h6NmZabEZzb2xlTzJpbGhYWUhIZjFURk5L?=
 =?utf-8?B?K1NNTkxsUDZUcG1zYnk3YkhqakRhWlpNalJCRDZjaDc0ZDNIZXE4QTN2K2ts?=
 =?utf-8?B?T0svTzNBaUJiRHdGbmFXTXE1clVpTmRndG1wWjI3akxkQy9LcmN6eUJhQllF?=
 =?utf-8?B?SEFxdUpxN0RmUXloMEZza1R3WDJNbnE5dlh0Z3l4WERITHcvM2F5cmFjM2Jx?=
 =?utf-8?B?dnovTkk2STlVMytSMkhyUFpwZEFnUzJldTl5aUwreHR1VHd4dzZyUDk4STMx?=
 =?utf-8?B?MDRpWFUwTDliMys1czRqcnk1NVBLemhmODRuWUQxYndoV0FUMGlOS01HSEJL?=
 =?utf-8?B?VzJRZVJLVTZHTXZId202NHF0dENlVERjc0VETm5rTmYzMWVmRW4xT04rRlRo?=
 =?utf-8?B?MXlxUGN1bTJHTDJ3dFNvOHlnY3kyU2NEOTlsK2xFdnZKVithVWJZWGdoanIv?=
 =?utf-8?B?dmRrQ0dtVXF4amt6QlI4b29ERFcwSHdYMTBOcGQvOU9VMFBDamNpWVgvdkNx?=
 =?utf-8?B?RFpxeC9zZTduN0M2TjNkVnUrVmlvUWJDdmlwSU5vVmNvRlM0WTB4cHA5VENM?=
 =?utf-8?B?WlBiQWZUaDQ1eC96UmR5NGg4Z0gwZkMxYWJjcTB3Rk9zOWd0cEJKVDNmNDVz?=
 =?utf-8?B?alNPTTFGU3JhbG5DVURQV3F0b2FIUTVwc0ZDTUtWTmdtUUg1WkFKa0c5dGJT?=
 =?utf-8?B?RE0vTlpyclFLN2djYUFQciszL0FvVFpjSCt0ZWgvNzBBZjVTVmVUT0NKbzNs?=
 =?utf-8?B?QWZDcnlMb0UyQjZzODNYcFU2OTQwenFkZWxjV04zaDZua3JxZTkxZGx3L00x?=
 =?utf-8?B?cUVTd2ZhRFBlbzZvSERaZnluRHN3MkNyZnhZaEpZWEtFK3poMFI4b2Fxek9S?=
 =?utf-8?B?NUJLNTJEUXN4Sm15eVQ4bXVjTmxhS2JOSEthcVA1czgwa0diNmphaS9MUkow?=
 =?utf-8?B?L1dMeE0wRVFWSEx6cm8rNnRuYjB5N1dvUnFsd05IV055c1FIL0psSndJcU9n?=
 =?utf-8?B?d2lwZGV1OFc1S2RzUlBPRDM3ays5NE1Ha3BCcXdLWjhMMmRxS3huQ1RQeGRN?=
 =?utf-8?B?WlJ2Z1F3em5jNjZZQ25Ca1Vlc09zdTBuYlVEUFlwK1R6bFZTdEZkSGhqK0Rs?=
 =?utf-8?B?T1NHRWo0Nk1GYUJSQXJ2RDJNM2UyWmVZaHVqZVhGUWtnTDg2OEk1eDBFTTdT?=
 =?utf-8?B?dVZHSUVTSnJyS01pOEN3WWF6Y3kxR1dobWtiRTZoYkFSWlc2TWtNbXk1cGl5?=
 =?utf-8?B?a0syRHdSeTVBUUxiaUgzcm1PNk4xQ0ltbDNFNnFwa0NUMFdDZWRDN1piMUdI?=
 =?utf-8?B?eU1wUDZvbEVLN2JkVnE5alM1M04vcGswRVFLM3BCRWJiOFFIMXNrNmRQTmVR?=
 =?utf-8?B?c0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0020489103BE31458AC93226779B9C0B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd77e7a-2d85-40b8-3a5e-08dd3559757f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 11:40:49.6013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P389lqJ6leclLt4IzcU3vtgSi3hzcL1cL/HwFBv7qz/ddZ33JLndfB8fsaztSEpIq01l4gZIiYRGM8pACbuLSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9278

T24gV2VkLCAyMDI1LTAxLTA4IGF0IDE3OjQ1ICswMTAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToK
PiBPbiBXZWQsIEphbiAwOCwgMjAyNSBhdCAwNDozNjoxNlBNICswNTMwLCBLYXJ0aWsgUmFqcHV0
IHdyb3RlOgo+ID4gRnJvbTogQWtoaWwgUiA8YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4KPiA+IAo+
ID4gQWRkIHN1cHBvcnQgZm9yIEhTIChIaWdoIFNwZWVkKSBtb2RlIHRyYW5mZXJzLCB3aGljaCBp
cyBzdXBwb3J0ZWQKPiA+IGJ5Cj4gPiBUZWdyYTE5NCBvbndhcmRzLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBBa2hpbCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogS2FydGlrIFJhanB1dCA8a2thcnRpa0BudmlkaWEuY29tPgo+ID4gLS0tCj4gPiDCoGRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKPiA+
IMKgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYwo+ID4gYi9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLXRlZ3JhLmMKPiA+IGluZGV4IDg3OTc2ZTk5ZTZkMC4uN2I5N2M2ZDM0N2VlIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jCj4gPiArKysgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLXRlZ3JhLmMKPiA+IEBAIC05MSw2ICs5MSw3IEBACj4gPiDCoCNkZWZp
bmUgSTJDX0hFQURFUl9JRV9FTkFCTEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoEJJVCgxNykKPiA+IMKgI2RlZmluZSBJMkNfSEVBREVSX1JFUEVBVF9TVEFSVMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJJVCgxNikKPiA+IMKgI2Rl
ZmluZSBJMkNfSEVBREVSX0NPTlRJTlVFX1hGRVLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBCSVQoMTUpCj4gPiArI2RlZmluZSBJMkNfSEVBREVSX0hTX01PREXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBCSVQoMjIpCj4gPiDCoCNkZWZpbmUgSTJDX0hFQURF
Ul9TTEFWRV9BRERSX1NISUZUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMQo+ID4gwqAKPiA+IMKg
I2RlZmluZSBJMkNfQlVTX0NMRUFSX0NORkfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAweDA4NAo+ID4gQEAgLTIyMCwxMCArMjIxLDEzIEBAIHN0cnVjdCB0ZWdyYV9p
MmNfaHdfZmVhdHVyZSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgdTMyIHRoaWdoX3N0ZF9tb2RlOwo+
ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiB0bG93X2Zhc3RfZmFzdHBsdXNfbW9kZTsKPiA+IMKgwqDC
oMKgwqDCoMKgwqB1MzIgdGhpZ2hfZmFzdF9mYXN0cGx1c19tb2RlOwo+ID4gK8KgwqDCoMKgwqDC
oMKgdTMyIHRsb3dfaHNfbW9kZTsKPiA+ICvCoMKgwqDCoMKgwqDCoHUzMiB0aGlnaF9oc19tb2Rl
Owo+ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiBzZXR1cF9ob2xkX3RpbWVfc3RkX21vZGU7Cj4gPiDC
oMKgwqDCoMKgwqDCoMKgdTMyIHNldHVwX2hvbGRfdGltZV9mYXN0X2Zhc3RfcGx1c19tb2RlOwo+
ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiBzZXR1cF9ob2xkX3RpbWVfaHNfbW9kZTsKPiA+IMKgwqDC
oMKgwqDCoMKgwqBib29sIGhhc19pbnRlcmZhY2VfdGltaW5nX3JlZzsKPiA+ICvCoMKgwqDCoMKg
wqDCoGJvb2wgaGFzX2hzX21vZGVfc3VwcG9ydDsKPiA+IMKgfTsKPiA+IMKgCj4gPiDCoC8qKgo+
ID4gQEAgLTY4MSw2ICs2ODUsMTggQEAgc3RhdGljIGludCB0ZWdyYV9pMmNfaW5pdChzdHJ1Y3Qg
dGVncmFfaTJjX2Rldgo+ID4gKmkyY19kZXYpCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGkyY19k
ZXYtPmh3LT5oYXNfaW50ZXJmYWNlX3RpbWluZ19yZWcgJiYgdHN1X3RoZCkKPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaTJjX3dyaXRlbChpMmNfZGV2LCB0c3VfdGhkLAo+ID4g
STJDX0lOVEVSRkFDRV9USU1JTkdfMSk7Cj4gPiDCoAo+ID4gK8KgwqDCoMKgwqDCoMKgLyogV3Jp
dGUgSFMgbW9kZSByZWdpc3RlcnMuIFRoZXNlIHdpbGwgZ2V0IHVzZWQgb25seSBmb3IgSFMKPiA+
IG1vZGUqLwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGkyY19kZXYtPmh3LT5oYXNfaHNfbW9kZV9z
dXBwb3J0KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdGxvdyA9IGkyY19k
ZXYtPmh3LT50bG93X2hzX21vZGU7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
dGhpZ2ggPSBpMmNfZGV2LT5ody0+dGhpZ2hfaHNfbW9kZTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB0c3VfdGhkID0gaTJjX2Rldi0+aHctPnNldHVwX2hvbGRfdGltZV9oc19t
b2RlOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZhbCA9IEZJRUxE
X1BSRVAoSTJDX0hTX0lOVEVSRkFDRV9USU1JTkdfVEhJR0gsCj4gPiB0aGlnaCkgfAo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBGSUVMRF9QUkVQKEky
Q19IU19JTlRFUkZBQ0VfVElNSU5HX1RMT1csCj4gPiB0bG93KTsKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpMmNfd3JpdGVsKGkyY19kZXYsIHZhbCwKPiA+IEkyQ19IU19JTlRF
UkZBQ0VfVElNSU5HXzApOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGkyY193
cml0ZWwoaTJjX2RldiwgdHN1X3RoZCwKPiA+IEkyQ19IU19JTlRFUkZBQ0VfVElNSU5HXzEpOwo+
ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDCoGNsa19tdWx0aXBs
aWVyID0gKHRsb3cgKyB0aGlnaCArIDIpICogKG5vbl9oc19tb2RlICsgMSk7Cj4gPiDCoAo+ID4g
wqDCoMKgwqDCoMKgwqDCoGVyciA9IGNsa19zZXRfcmF0ZShpMmNfZGV2LT5kaXZfY2xrLAo+ID4g
QEAgLTExNzgsNiArMTE5NCw5IEBAIHN0YXRpYyB2b2lkCj4gPiB0ZWdyYV9pMmNfcHVzaF9wYWNr
ZXRfaGVhZGVyKHN0cnVjdCB0ZWdyYV9pMmNfZGV2ICppMmNfZGV2LAo+ID4gwqDCoMKgwqDCoMKg
wqDCoGlmIChtc2ctPmZsYWdzICYgSTJDX01fUkQpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHBhY2tldF9oZWFkZXIgfD0gSTJDX0hFQURFUl9SRUFEOwo+ID4gwqAKPiA+ICvC
oMKgwqDCoMKgwqDCoGlmIChpMmNfZGV2LT50aW1pbmdzLmJ1c19mcmVxX2h6ID4KPiA+IEkyQ19N
QVhfRkFTVF9NT0RFX1BMVVNfRlJFUSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBwYWNrZXRfaGVhZGVyIHw9IEkyQ19IRUFERVJfSFNfTU9ERTsKPiA+ICsKPiAKPiBEbyB3ZSBu
ZWVkIGFueSBraW5kIG9mIGNoZWNraW5nIGhlcmU/IFdoYXQgaGFwcGVucyBpZiB0aGUgcmVxdWVz
dGVkCj4gZnJlcXVlbmN5IGlzIGhpZ2hlciB0aGFuIGZhc3Rtb2RlKyBidXQgdGhlIGRldmljZSBk
b2Vzbid0IHN1cHBvcnQgdGhlCj4gbmV3IGhpZ2gtc3BlZWQgbW9kZT8gSSBndWVzcyBtYXliZSB3
ZSBkb24ndCBoYXZlIHRvIGNhcmUgYmVjYXVzZSBzdWNoCj4gY2FzZXMgd29uJ3QgZXZlciBzaG93
IHVwIGJlY2F1c2UsIHdlbGwsIHRoZXkgd29uJ3Qgd29yay4KPiAKPiBTdGlsbCwgaXQgbWlnaHQg
YmUgYSBnb29kIGlkZWEgdG8gYmUgZXhwbGljaXQgYWJvdXQgaXQgYW5kIGhhdmUgYW4KPiBleHRy
YQo+IGNoZWNrIGluIHBsYWNlIChvciBwZXJoYXBzIGEgbGl0dGxlIGhpZ2hlciB1cCBpbiB0aGUg
Y2FsbCBjaGFpbikgYW5kCj4gcmV0dXJuIGFuIGVycm9yIGlmIHdlJ3JlIHRyeWluZyB0byB1c2Ug
YSBmcmVxdWVuY3kgdGhhdCBpc24ndAo+IHN1cHBvcnRlZAo+IG9uIHRoZSBjaGlwLgo+IAo+IFRo
aWVycnkKCkFDSy4gSSB3aWxsIGFkZCBhIGNoZWNrIGZvciB0aGlzLgoKPiAKPiA+IMKgwqDCoMKg
wqDCoMKgwqBpZiAoaTJjX2Rldi0+ZG1hX21vZGUgJiYgIWkyY19kZXYtPm1zZ19yZWFkKQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqZG1hX2J1ZisrID0gcGFja2V0X2hlYWRl
cjsKPiA+IMKgwqDCoMKgwqDCoMKgwqBlbHNlCj4gPiBAQCAtMTYxOCwxMCArMTYzNywxMyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHRlZ3JhX2kyY19od19mZWF0dXJlCj4gPiB0ZWdyYTE5NF9pMmNf
aHcgPSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgLnRoaWdoX3N0ZF9tb2RlID0gMHg3LAo+ID4gwqDC
oMKgwqDCoMKgwqDCoC50bG93X2Zhc3RfZmFzdHBsdXNfbW9kZSA9IDB4MiwKPiA+IMKgwqDCoMKg
wqDCoMKgwqAudGhpZ2hfZmFzdF9mYXN0cGx1c19tb2RlID0gMHgyLAo+ID4gK8KgwqDCoMKgwqDC
oMKgLnRsb3dfaHNfbW9kZSA9IDB4OCwKPiA+ICvCoMKgwqDCoMKgwqDCoC50aGlnaF9oc19tb2Rl
ID0gMHgzLAo+ID4gwqDCoMKgwqDCoMKgwqDCoC5zZXR1cF9ob2xkX3RpbWVfc3RkX21vZGUgPSAw
eDA4MDgwODA4LAo+ID4gwqDCoMKgwqDCoMKgwqDCoC5zZXR1cF9ob2xkX3RpbWVfZmFzdF9mYXN0
X3BsdXNfbW9kZSA9IDB4MDIwMjAyMDIsCj4gPiDCoMKgwqDCoMKgwqDCoMKgLnNldHVwX2hvbGRf
dGltZV9oc19tb2RlID0gMHgwOTA5MDksCj4gPiDCoMKgwqDCoMKgwqDCoMKgLmhhc19pbnRlcmZh
Y2VfdGltaW5nX3JlZyA9IHRydWUsCj4gPiArwqDCoMKgwqDCoMKgwqAuaGFzX2hzX21vZGVfc3Vw
cG9ydCA9IHRydWUsCj4gPiDCoH07Cj4gPiDCoAo+ID4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCB0ZWdyYV9pMmNfb2ZfbWF0Y2hbXSA9IHsKPiA+IC0tIAo+ID4gMi40My4wCj4g
PiAKCg==

