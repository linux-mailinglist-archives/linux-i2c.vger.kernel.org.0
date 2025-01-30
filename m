Return-Path: <linux-i2c+bounces-9240-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D114A231FB
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 17:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 885C3167733
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 16:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D571EEA35;
	Thu, 30 Jan 2025 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KGXJctyv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1E01DA5F;
	Thu, 30 Jan 2025 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254947; cv=fail; b=Jr0VYbsXAg18/MIS3/X6HSMEM8FeBiao5l5MZzyEihV9WZKrRizuUTocvet8uOZATMMGp+AjoT0NzcZzy9BvBRTxzprASSvUgfdOEdP9aNR5reG9NvsN2thhdDeEzCOH0PxMdu8LXJz+z9OiiRs4J1IXpBTh6BRX6FgaAoS6xXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254947; c=relaxed/simple;
	bh=MeI4vauVbJ7SY+iOXtInsRbHe0JU9Dr5YXl61d8QtPk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kNzA73TxFslvJbDfM9dwNmaTXgBqdyMSdC7/spHDHBbyF9Jyvy7W6i1B69W10YbXqc4EWTJOHog3msaIeksjGvjwXBooOKqbDg42D0NBNKxym/882d1VctiVZRVv/pKX1lSEafyCH59YTvWE5XR9psnhC6T+fGB/nIFquwxx+S0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KGXJctyv; arc=fail smtp.client-ip=40.107.237.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NI60zSVDTHQhppfon5k8oXWNtx2jcuDWZo2zebovp8u3Vrb/VIbf8UBmISyV03eg72fD++RRjhMYBszvb4MCIrBPaeAoiANAxpdtukMopZscl4t+IIGH144rS8LTR5NAnGNv0lJBKOcXg6704t2tOEdfVBN2ykaGpH9neFLeYx/zlNSmucPsOtEIw5GkagEC4TgEUU/Z/lgY+M0mOUU8CrmtOO+1uwz+UX3GTmsUExMPAEbLNZcZJzacReX0Zru9yzkK3+Ts3xO7d0/kAjkbiHtmp+QfOmmo8eVVlJQ1tQ2Y9gebdlGezyCY8mvNnV/8fHjDPbkqsTnMhgcasBKfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeI4vauVbJ7SY+iOXtInsRbHe0JU9Dr5YXl61d8QtPk=;
 b=JexUhhDNUwAdEgY6j22dUTNWTLq02tzwKNtBYx3W1MjfsSLDIzA+TxkKAjjtPaEkIBoCXHoJzjRFRZYJ8A+9Wnom3+II53iXWHQiO47qT4v/JPPAdIg7J/1+WuvSFlS4dLZscRqBL+nPiB8wF88Dv2+QTJurCjfP2fd19iXlO+Z5Tfnm5GgMLrVz8npfpRpBWsWrT+LTGPX04UkYIh/f8i7L9A5A5acC9AEuMukz8niMTdYXgfIOfGoI+1scyoxmPJq66EsTrqCVHDTsfa8mO5jm9SPrhdyTHI5cG/RYNicdH4sd9z6gjFeTKXtqMs376FKEkEUPJVESx5Od+mLC1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeI4vauVbJ7SY+iOXtInsRbHe0JU9Dr5YXl61d8QtPk=;
 b=KGXJctyvrlG8wI20Fp5Jze3KlSm9Xrs/A3TWZPasZzUeh9KDEB7Whvgmy9uwPTE1kJfhM4tImFe5QXrqsxays4IOOE825uO4BwCNUnQhyI1CBv5SAkAn6rE7jyDhFCUG1s3DVUKUuaPz33b3CZTxyDFOt01RN48HIGR/ejWdKaoQXdWf1/wU6C0dC2qZ1Dlhpaj0gL/JR8poPk0E44dNnGaXsPAOs2zgV5azQj+7ET12o1jE/mlXSqDVEAA+4nGraCZrDwh8XUOdpLsClX11B/JCTYxcHDEQnpofeNbfss5RvY9NfW4PD5oy+dpd6YtilrCcwIPtnO+tKrJeaTOj2g==
Received: from DM4PR12MB5721.namprd12.prod.outlook.com (2603:10b6:8:5c::10) by
 MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 16:35:42 +0000
Received: from DM4PR12MB5721.namprd12.prod.outlook.com
 ([fe80::5bbd:73c:90ac:83c7]) by DM4PR12MB5721.namprd12.prod.outlook.com
 ([fe80::5bbd:73c:90ac:83c7%4]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 16:35:41 +0000
From: Kartik Rajput <kkartik@nvidia.com>
To: "krzk@kernel.org" <krzk@kernel.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Akhil R
	<akhilrajeev@nvidia.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, Laxman
 Dewangan <ldewangan@nvidia.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "digetx@gmail.com" <digetx@gmail.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] i2c: tegra: Add support for SW mutex register
Thread-Topic: [PATCH v2 4/5] i2c: tegra: Add support for SW mutex register
Thread-Index: AQHbczHX4TF+SX1mI0GO+pmGjU99G7Mvg40A
Date: Thu, 30 Jan 2025 16:35:41 +0000
Message-ID: <0daa503e73099085d84d432bb72a5f79db81a9b1.camel@nvidia.com>
References: <20250130143424.52389-1-kkartik@nvidia.com>
	 <20250130143424.52389-5-kkartik@nvidia.com>
	 <febb1225-3c14-4377-90e0-4d4aee307ede@kernel.org>
In-Reply-To: <febb1225-3c14-4377-90e0-4d4aee307ede@kernel.org>
Reply-To: Kartik Rajput <kkartik@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5721:EE_|MW4PR12MB6731:EE_
x-ms-office365-filtering-correlation-id: 75e8c57b-4289-4a80-d23b-08dd414c2303
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q1hwd1pXRWp4T2RwM0pkbTErZkE4bmxuK1FlbGNtb2oyZHRPMjRuWjBXL1dM?=
 =?utf-8?B?L0IxNUd1R3BQRURpQnh2aUlUYlptSVdhSHBnY0tlYnp0K053ZzNNb0tRdHBn?=
 =?utf-8?B?aG5mZUkwWWdUeXRFZ2dDcHdsa2ZFaXY4VGIveUhYdnRwdXVJV2w0dXU2MUhy?=
 =?utf-8?B?RlBnL1gwLzNTTjh1d1phYitUWDRiYk5aTDZ2RHJ4blF3TnQ4MkdmVHlkNTRR?=
 =?utf-8?B?T2wxeVNmYnNEUzA2eHJHZlo4TjZNOTdpNTgvdlJuQUkva2JkSEIydS9ZU3FW?=
 =?utf-8?B?bG5lcFh5Tk5FVGlxVjRPdnNCdWp4NVVDV3lBMkdORm1tK0NFUVBOc0lRZTJt?=
 =?utf-8?B?eVRObE9rU20zckc4UVpwZ2Q4emNzaHFYeWovRE9QaGRKMXNyZVZZRitUSVNi?=
 =?utf-8?B?dlgwZzUxbWhuajNKNzBxY0VNTHBHbVVMUXhyVGh1WkpvdFJ4WmVocVZucTN1?=
 =?utf-8?B?UE1aYVhyOE1MOXFpM3kwdkQvbDN5TkJOYzZaclZRU3Btc094QytZZW1kNThB?=
 =?utf-8?B?THBIZHM1ejNYMnRMY3JlMVV0Q1Z0RldKMEJkMmVMZ2JtVkJGcjlwTmN4RG16?=
 =?utf-8?B?TGZWSUI5OVNHVzJUdHd5NjhHbk5RcFkwdHpEUFFHRGlEaTEybzQzaEh1Z3Nu?=
 =?utf-8?B?bFRRVzNBWG55bmxwT1hCMFR1MjZweXhjb1JFNDFLNWdGcjNQUlBZSWo5a3RV?=
 =?utf-8?B?SGlmQ1RjVTB3Vzdpd29GSWw4OEdMNjBSM0c0SVN0dGZkbmRHMTZBNk44QTZM?=
 =?utf-8?B?eWwxTVFueGJsV0JabFZTdGdkNWxrRS9OVGwwK0V5ZE95VmpjRy9XWTBUYjRK?=
 =?utf-8?B?UWZvWHk5bDRaOFVnbjNtSXJ2bmVwZXJBUjdrdXJQTTlGcVVqdlJSajI5blBU?=
 =?utf-8?B?S1JYVlkzcndPV2xaemVCOTNIYVk3RTV0Q09jMlBnSjluY0swQVMvVlc5OVla?=
 =?utf-8?B?YkZlL25jcTdKbE1iUVBmTk1xLzVsbUpHRnQ4RnhGM0NMUlJ1NGgweERueWJJ?=
 =?utf-8?B?eDU2QU05VFhFSzJpMFpLcXlNUDZvZWIrUXRQTjVnb1JwUFM1dVkwazd4OFds?=
 =?utf-8?B?V1dhR0szOCtxTENBVFRaeFhhVXRyeHhUTm9rZ1VYTWVsNFd2bDdqaUNUK3pn?=
 =?utf-8?B?bk5RNFRCRVA2VEpDMHhSbDQyRElMd0FkNFBGbzg1SFdBVTY3bUdneVh1a2l0?=
 =?utf-8?B?VnVIajYxajNmYkhpV21xYTAxQmlqdWF2RzMzS3YwcWh2ODV4M1Rpdng1TWhy?=
 =?utf-8?B?VmllQTM0WGtYK1pLZDZ6NnN6cTNCYkE0MERHZTVUNUEwRDJmOHdnSjl6anlK?=
 =?utf-8?B?NDUxV3V1ZCt5eTNSWWoyZ1Z5ekt3ZFJLaVlCTld0ZUJBemxSaVJSbzkzUC95?=
 =?utf-8?B?dTk1T1R0ZjV6ZXB4VksxTzZTRnpEN1dTS2RLWUlLSDJidnVyOG1VdGo2TmdC?=
 =?utf-8?B?b2lERlA2RzZtUjNOUWJlaEdhZEprSTFkcURQSGNZZEZIdjBvZytmd1p0WEFz?=
 =?utf-8?B?L1JqWU1WREFFbytpZkxUVmExQmV6bExPcU82SGh5YmRqTW95M3NiZUJjRkFY?=
 =?utf-8?B?dk40TUtPTWJNZHNZOVVqaE9RNmhIYk1RZnlkL1VOQm1uUEllRUh4VWllKzFR?=
 =?utf-8?B?YVA2V2NRTFgwSyt3KzZTUVhBU296VXg4RnJYWTdFbWMwTTd2NlFuOTk3WHgr?=
 =?utf-8?B?THV1bGJiZTlTaTZvenJXcmpDeHpoTVdQQVNpN0U5d082VXpvb3FBYjcvenlo?=
 =?utf-8?B?QVdRMVFsMXowem5sU2FIL2Z0bUN5cFR4WU92SG94YzhBSTZOUjU5MFVaeCtN?=
 =?utf-8?B?bUdzdGdhQlY4bW9NN0l2aXFLdUJQK0ZrZlhVVXpoWlNTNGRDVG82T2xOYW5z?=
 =?utf-8?B?eUVsWXdoZ3pGanZjdGhKU1NXcXRMYXo0Q1BkTURheE5zRTIyRldNblk3OHdh?=
 =?utf-8?B?RVdtd2Z0ajhmTlQ5RXlnRnBKS2lTTnozeXNSclZrUkFHN0IydDB0Zmhad0I2?=
 =?utf-8?B?aGQwTzJEVzlRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5721.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjdvUkZFRUJrcXBQRWNTMTV5UWFJblpsOFU4R3N5dVUvUDFBa0tkS0dJZWJn?=
 =?utf-8?B?ai9BUWo2R0dMamFsNHZBbEQwWit0bzJYdEFqM2F4T25HQ2tFVXEvVFFwZXhW?=
 =?utf-8?B?WENZQXYrc3FiMGliNjl0NCtpaEIzWFA1aUkxOFlXSDdJNHo5M01DcUJCdlE4?=
 =?utf-8?B?TUtXYnJEVE1rOEF4ejkzbWwwWnl6cXN5VkpnUE12ZGYwM3orZ2dmNDJlL2dn?=
 =?utf-8?B?ekZPdWhnRVdqSXhjS3BBM3I0am15aW9ZOElaOGwyZVNrWmU3eVB3U0lCemZU?=
 =?utf-8?B?bi9jVm5iZlhXNVdITk5WYzhzZnpreXRMczZPdEI1U0FSQU1DMXRjWFliV1RP?=
 =?utf-8?B?UFRjQ0N0MWhiWEgwbzdORDQ1VUx1bU4yQW9iQU5idi9ncU1KcUg1Mjd2R0pL?=
 =?utf-8?B?dXdkMDM4OTVmOEN3aXUrUkFTd3VNRUxiZmZtNGZqR2Q2RERaVU42SEc4WmRz?=
 =?utf-8?B?azhISElkRVZYSGltcHo5cXkzYjFzRHc3dXVTUFI2MGE3alYvWVBpZXNmYXli?=
 =?utf-8?B?RmJJam00eC9DanV3QmZTQzlBd3B2clZZYlJsb0FFVnd0VllMK1BCeVRxL3RH?=
 =?utf-8?B?NUpxM0swOFlYN1hRSklpZkpqaG5pTjFQa29jc0JCeGVtT1k0SlhuYm1DdU02?=
 =?utf-8?B?NnpGQlpSUGRBNkx1c3JzelpkVzA3RGtaL2hnZDNEZTVaWXhNSldQZ2xKMFlh?=
 =?utf-8?B?bmxta29rRVlFSmpPN1ZhV01TYmFiemF1Vy9CRE9pb2UzV1IwamRtMWJGSys5?=
 =?utf-8?B?L1hJMkNaVDZTWlFCMTB5RGZVb1dTNkVCV2lXUEZkOVNBRzBDTFNVRUV4VmFU?=
 =?utf-8?B?QVRXN2xhd1pGMnpGTVBVWDdPbHFTUEdXUFNpRGdQZXI0aGNCKzl0VjgyQXhN?=
 =?utf-8?B?dDZwelF1bklnbCtSWjJVL1RFQXdCYXc0TGxGUnpMYm5na3R0VFd0OXNUSFVJ?=
 =?utf-8?B?Snh6S3dzdFdwOEdRZFJiQkFGYmpoWC9xUmNCYmpmSkNLbWZCWDc4SjYxNTl2?=
 =?utf-8?B?QmJ1M3A5R3pSYTBSRVkzZmtlZ3EwTVdpeTR6Y21mc2xJOTlQMHl4ZnVJWE9H?=
 =?utf-8?B?b2dSNC93QzJHNHRkaVFzbDNqK3RibkhkUDNDV2swQm1ZNlg2aldCbUxSQWZE?=
 =?utf-8?B?eVFFZzRmZGFJRUEzS2o1cjM4RGVBODFpUm9YM3hiR3Y5Wk40dFQ2RXB0Q080?=
 =?utf-8?B?Y2VTTjNnTDVvMEFhT0NURElFRlF0UEhYRlZpTHdKZlNsV3Q0Sno5MG9RWWVF?=
 =?utf-8?B?cjg0UWhlMGxmVXFiemFYTGRqY2txOERjaVZYOFVFR3lLMXp2MVNiNWk3NDhq?=
 =?utf-8?B?TWp5dThlZ28rVis2UDNLb1ZjSGZYcVYzNVlRZDVDUXV5bm16a01ucnZoMVo2?=
 =?utf-8?B?NE5vS20rTzdyY2lZM1NSdEhsZCs0SG5RVzNST0RTRmZRN2V0K1RXZnp5NHdV?=
 =?utf-8?B?dHZiVXA4NDlVdDNJV1p2NE1vNE5pbXJiOG1jRXMyd3o2ZzBON3o0OTU5M1RP?=
 =?utf-8?B?M2MxVGJUWUZzcjNzM3I0QVRLcUFFaTZUUzRXSlZ6b3dQRnl0QlJMdFg5U3Nz?=
 =?utf-8?B?NTh6UkNlQ0lGK0JJTnJ0THRmbXRxV3ZrWnJFSUl3b1ZaOS80eEJ5WDArOWtT?=
 =?utf-8?B?T3RKcDBkS1JybXBvR282aFlqWTIwQmV4a2Z6VEhCVHZPN1BPS25ubkZhSXJ6?=
 =?utf-8?B?YkZ5MmpQRk1JSjdwNHNKMGc1MGVFWS82djl1V2s1Z3NPamtsbFI1T2J4eW0y?=
 =?utf-8?B?aElFRGI0Sk5TdTF0OWJKOGRJTGNyVnRYV0YzdXdGZTcrNExRYm9zK1ZOMDZx?=
 =?utf-8?B?K2hEUVRBTnZ6Z0RwbnJpUTI3NzhDKzYwZUlPcmx1Vmg2ZjJDSStITVpyZFl5?=
 =?utf-8?B?Um8rSVRIQlFBRHVRVTFiU1NjakQ1ZHRNTldMWllQa3NMVjdWMjJMdTExYkhP?=
 =?utf-8?B?bUR0bWw0TzhSRENiTVhsbW8wVGhVWGcvZldyVExmVzZ5ZkZybG1yNms0ZE0w?=
 =?utf-8?B?U1BXai9UMVBFMXJpbjZJY3ZBZU8xOXplS3QrY3RxU0ZFQUlGbjljeVFPcEZH?=
 =?utf-8?B?TEIyRzFGcmZqN004Yk9LTG1kSnFTdE11bFZ3TGk2OGZZbkRMUFlTMFVJRlZD?=
 =?utf-8?B?Nk5waDZ6SjNkN0NLeXdHYzZOUGFvMXFCUGRUMmp2SitSQjR0UlZRdkhqMGFG?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09751996CF6DA14EA63CD1F93B699F1C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5721.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e8c57b-4289-4a80-d23b-08dd414c2303
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 16:35:41.7083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p5nltnaLkyYa234nEXxq4rRTFg4ItfSgf0ySdTAco3oK5K9MYxwuUfjrW+9mlNGJxgwEq4i0Re9T9U6wD4Q52w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731

VGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHBhdGNoIEtyenlzenRvZiEKCk9uIFRodSwgMjAyNS0w
MS0zMCBhdCAxNzoxMiArMDEwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBFeHRlcm5h
bCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cwo+IAo+IAo+
IE9uIDMwLzAxLzIwMjUgMTU6MzQsIEthcnRpayBSYWpwdXQgd3JvdGU6Cj4gPiBGcm9tOiBBa2hp
bCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPgo+ID4gCj4gPiBBZGQgc3VwcG9ydCBmb3IgU1cg
bXV0ZXggcmVnaXN0ZXIgaW50cm9kdWNlZCBpbiBUZWdyYTI2NCB0byBwcm92aWRlCj4gPiBhbiBv
cHRpb24gdG8gc2hhcmUgdGhlIGludGVyZmFjZSBiZXR3ZWVuIG11bHRpcGxlIGZpcm13YXJlcyBh
bmQvb3IKPiA+IFZNcy4KPiA+IAo+ID4gSG93ZXZlciwgdGhlIGhhcmR3YXJlIGRvZXMgbm90IGVu
c3VyZSBhbnkgcHJvdGVjdGlvbiBiYXNlZCBvbiB0aGUKPiA+IHZhbHVlcy4gVGhlIGRyaXZlci9m
aXJtd2FyZSBzaG91bGQgaG9ub3IgdGhlIHBlZXIgd2hvIGFscmVhZHkgaG9sZHMKPiA+IHRoZSBt
dXRleC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQWtoaWwgUiA8YWtoaWxyYWplZXZAbnZpZGlh
LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEthcnRpayBSYWpwdXQgPGtrYXJ0aWtAbnZpZGlhLmNv
bT4KPiA+IC0tLQo+ID4gdjEgLT4gdjI6Cj4gPiDCoMKgwqDCoMKgICogRml4ZWQgdHlwb3MuCj4g
PiDCoMKgwqDCoMKgICogRml4IHRlZ3JhX2kyY19tdXRleF9sb2NrKCkgbG9naWMuCj4gPiDCoMKg
wqDCoMKgICogQWRkIGEgdGltZW91dCBpbiB0ZWdyYV9pMmNfbXV0ZXhfbG9jaygpIGluc3RlYWQg
b2YgcG9sbGluZwo+ID4gZm9yCj4gPiDCoMKgwqDCoMKgwqDCoCBtdXRleCBpbmRlZmluaXRlbHku
Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jIHwgMTMyCj4gPiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEx
NyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYwo+ID4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LXRlZ3JhLmMKPiA+IGluZGV4IDdjOGI3NjQwNmUyZS4uYWE5MmZhYTZmNWNiIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jCj4gPiArKysgYi9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXRlZ3JhLmMKPiA+IEBAIC0xMzUsNiArMTM1LDE0IEBACj4gPiDCoCNkZWZp
bmUgSTJDX01TVF9GSUZPX1NUQVRVU19UWMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIEdFTk1BU0soMjMsCj4gPiAxNikKPiA+IMKgI2RlZmluZSBJMkNfTVNUX0ZJ
Rk9fU1RBVFVTX1JYwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
R0VOTUFTSyg3LCAwKQo+ID4gCj4gPiArI2RlZmluZSBJMkNfU1dfTVVURVjCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwZWMKPiA+ICsjZGVmaW5lIEky
Q19TV19NVVRFWF9SRVFVRVNUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0VOTUFT
SygzLCAwKQo+ID4gKyNkZWZpbmUgSTJDX1NXX01VVEVYX0dSQU5UwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEdFTk1BU0soNywgNCkKPiA+ICsjZGVmaW5lIEkyQ19TV19NVVRF
WF9JRMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgOQo+ID4gKwo+ID4gKy8qIFNXIG11dGV4IGFjcXVpcmUgdGltZW91dCB2YWx1ZSBpbiBt
aWxsaXNlY29uZHMuICovCj4gPiArI2RlZmluZSBJMkNfU1dfTVVURVhfVElNRU9VVMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDI1Cj4gPiArCj4gPiDCoC8qIGNvbmZpZ3VyYXRpb24g
bG9hZCB0aW1lb3V0IGluIG1pY3Jvc2Vjb25kcyAqLwo+ID4gwqAjZGVmaW5lIEkyQ19DT05GSUdf
TE9BRF9USU1FT1VUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDEw
MDAwMDAKPiA+IAo+ID4gQEAgLTIwMyw2ICsyMTEsNyBAQCBlbnVtIG1zZ19lbmRfdHlwZSB7Cj4g
PiDCoCAqIEBoYXNfaW50ZXJmYWNlX3RpbWluZ19yZWc6IEhhcyBpbnRlcmZhY2UgdGltaW5nIHJl
Z2lzdGVyIHRvCj4gPiBwcm9ncmFtIHRoZSB0dW5lZAo+ID4gwqAgKsKgwqDCoMKgwqDCoMKgwqDC
oMKgIHRpbWluZyBzZXR0aW5ncy4KPiA+IMKgICogQGhhc19oc19tb2RlX3N1cHBvcnQ6IEhhcyBz
dXBwb3J0IGZvciBoaWdoIHNwZWVkIChIUykgbW9kZQo+ID4gdHJhbnNmZXJzLgo+ID4gKyAqIEBo
YXNfbXV0ZXg6IEhhcyBtdXRleCByZWdpc3RlciBmb3IgbXV0dWFsIGV4Y2x1c2lvbiB3aXRoIG90
aGVyCj4gPiBmaXJtd2FyZXMgb3IgVk0uCj4gPiDCoCAqLwo+ID4gwqBzdHJ1Y3QgdGVncmFfaTJj
X2h3X2ZlYXR1cmUgewo+ID4gwqDCoMKgwqDCoCBib29sIGhhc19jb250aW51ZV94ZmVyX3N1cHBv
cnQ7Cj4gPiBAQCAtMjI5LDYgKzIzOCw3IEBAIHN0cnVjdCB0ZWdyYV9pMmNfaHdfZmVhdHVyZSB7
Cj4gPiDCoMKgwqDCoMKgIHUzMiBzZXR1cF9ob2xkX3RpbWVfaHNfbW9kZTsKPiA+IMKgwqDCoMKg
wqAgYm9vbCBoYXNfaW50ZXJmYWNlX3RpbWluZ19yZWc7Cj4gPiDCoMKgwqDCoMKgIGJvb2wgaGFz
X2hzX21vZGVfc3VwcG9ydDsKPiA+ICvCoMKgwqDCoCBib29sIGhhc19tdXRleDsKPiA+IMKgfTsK
PiA+IAo+ID4gwqAvKioKPiA+IEBAIC0zNzIsNiArMzgyLDEwMyBAQCBzdGF0aWMgdm9pZCBpMmNf
cmVhZHNsKHN0cnVjdCB0ZWdyYV9pMmNfZGV2Cj4gPiAqaTJjX2Rldiwgdm9pZCAqZGF0YSwKPiA+
IMKgwqDCoMKgwqAgcmVhZHNsKGkyY19kZXYtPmJhc2UgKyB0ZWdyYV9pMmNfcmVnX2FkZHIoaTJj
X2RldiwgcmVnKSwKPiA+IGRhdGEsIGxlbik7Cj4gPiDCoH0KPiA+IAo+ID4gK3N0YXRpYyBpbnQg
dGVncmFfaTJjX3BvbGxfcmVnaXN0ZXIoc3RydWN0IHRlZ3JhX2kyY19kZXYgKmkyY19kZXYsCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdTMyIHJlZywgdTMyIG1hc2ssIHUzMiBkZWxheV91cywKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIg
dGltZW91dF91cykKPiA+ICt7Cj4gPiArwqDCoMKgwqAgdm9pZCBfX2lvbWVtICphZGRyID0gaTJj
X2Rldi0+YmFzZSArCj4gPiB0ZWdyYV9pMmNfcmVnX2FkZHIoaTJjX2RldiwgcmVnKTsKPiA+ICvC
oMKgwqDCoCB1MzIgdmFsOwo+ID4gKwo+ID4gK8KgwqDCoMKgIGlmICghaTJjX2Rldi0+YXRvbWlj
X21vZGUpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZWFkbF9yZWxheGVk
X3BvbGxfdGltZW91dChhZGRyLCB2YWwsICEodmFsICYKPiA+IG1hc2spLAo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlbGF5X3VzLAo+ID4gdGltZW91dF91cyk7Cj4g
PiArCj4gPiArwqDCoMKgwqAgcmV0dXJuIHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0X2F0b21p
YyhhZGRyLCB2YWwsICEodmFsICYKPiA+IG1hc2spLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZWxheV91cywKPiA+IHRpbWVvdXRfdXMpOwo+ID4gK30KPiA+ICsKPiA+
ICtzdGF0aWMgaW50IHRlZ3JhX2kyY19tdXRleF90cnlsb2NrKHN0cnVjdCB0ZWdyYV9pMmNfZGV2
ICppMmNfZGV2KQo+ID4gK3sKPiA+ICvCoMKgwqDCoCB1MzIgdmFsLCBpZDsKPiA+ICsKPiA+ICvC
oMKgwqDCoCB2YWwgPSBpMmNfcmVhZGwoaTJjX2RldiwgSTJDX1NXX01VVEVYKTsKPiA+ICvCoMKg
wqDCoCBpZCA9IEZJRUxEX0dFVChJMkNfU1dfTVVURVhfR1JBTlQsIHZhbCk7Cj4gPiArwqDCoMKg
wqAgaWYgKGlkICE9IDAgJiYgaWQgIT0gSTJDX1NXX01VVEVYX0lEKQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPiA+ICsKPiA+ICvCoMKgwqDCoCB2YWwgPSBGSUVMRF9Q
UkVQKEkyQ19TV19NVVRFWF9SRVFVRVNULCBJMkNfU1dfTVVURVhfSUQpOwo+ID4gK8KgwqDCoMKg
IGkyY193cml0ZWwoaTJjX2RldiwgdmFsLCBJMkNfU1dfTVVURVgpOwo+IAo+IEFuZCBob3cgZG8g
eW91IGV4YWN0bHkgcHJldmVudCBjb25jdXJyZW50LCBvdmVyd3JpdGluZyB3cml0ZT8gVGhpcwo+
IGxvb2tzCj4gbGlrZSBwdXJlIHJhY2UuCj4gCgpUaGUgSTJDX1NXX01VVEVYX0dSQU5UIGZpZWxk
IHJlZmxlY3RzIHRoZSBpZCBvZiB0aGUgY3VycmVudCBtdXRleApvd25lci4gVGhlIEkyQ19TV19N
VVRFWF9HUkFOVCBmaWVsZCBkb2VzIG5vdCBjaGFuZ2Ugd2l0aCBvdmVyd3JpdGVzIHRvCnRoZSBJ
MkNfU1dfTVVURVhfUkVRVUVTVCBmaWVsZCwgdW5sZXNzIEkyQ19TV19NVVRFWF9SRVFVRVNUIGZp
ZWxkIGlzCmNsZWFyZWQuCgo+ID4gKwo+ID4gK8KgwqDCoMKgIHZhbCA9IGkyY19yZWFkbChpMmNf
ZGV2LCBJMkNfU1dfTVVURVgpOwo+ID4gK8KgwqDCoMKgIGlkID0gRklFTERfR0VUKEkyQ19TV19N
VVRFWF9HUkFOVCwgdmFsKTsKPiA+ICsKPiA+ICvCoMKgwqDCoCBpZiAoaWQgIT0gSTJDX1NXX01V
VEVYX0lEKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPiA+ICsKPiA+
ICvCoMKgwqDCoCByZXR1cm4gMTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgdGVncmFf
aTJjX211dGV4X2xvY2soc3RydWN0IHRlZ3JhX2kyY19kZXYgKmkyY19kZXYpCj4gPiArewo+ID4g
K8KgwqDCoMKgIHVuc2lnbmVkIGludCBudW1fcmV0cmllcyA9IEkyQ19TV19NVVRFWF9USU1FT1VU
Owo+ID4gKwo+ID4gK8KgwqDCoMKgIC8qIFBvbGwgdW50aWwgbXV0ZXggaXMgYWNxdWlyZWQgb3Ig
dGltZW91dC4gKi8KPiA+ICvCoMKgwqDCoCB3aGlsZSAoLS1udW1fcmV0cmllcyAmJiAhdGVncmFf
aTJjX211dGV4X3RyeWxvY2soaTJjX2RldikpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHVzbGVlcF9yYW5nZSgxMDAwLCAyMDAwKTsKPiA+ICsKPiA+ICvCoMKgwqDCoCBXQVJOX09OKCFu
dW1fcmV0cmllcyk7Cj4gCj4gCj4gQmxvY2tlZCB0aHJlYWQgaXMgbm90IGEgcmVhc29uIHRvIHJl
Ym9vdCBlbnRpcmUgc3lzdGVtIChzZWUgcGFuaWMgb24KPiB3YXJuKS4gRHJvcCBvciBjaGFuZ2Ug
dG8gc29tZSBkZXZfd2Fybi4KPiAKPiAKCkFjay4gV2lsbCBjaGFuZ2UgdGhpcyB0byBkZXZfd2Fy
biBpbiB2My4KCj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIHRlZ3JhX2kyY19tdXRleF91
bmxvY2soc3RydWN0IHRlZ3JhX2kyY19kZXYgKmkyY19kZXYpCj4gPiArewo+ID4gK8KgwqDCoMKg
IHUzMiB2YWwsIGlkOwo+ID4gKwo+ID4gK8KgwqDCoMKgIHZhbCA9IGkyY19yZWFkbChpMmNfZGV2
LCBJMkNfU1dfTVVURVgpOwo+ID4gK8KgwqDCoMKgIGlkID0gRklFTERfR0VUKEkyQ19TV19NVVRF
WF9HUkFOVCwgdmFsKTsKPiA+ICsKPiA+ICvCoMKgwqDCoCBpZiAoV0FSTl9PTihpZCAhPSBJMkNf
U1dfTVVURVhfSUQpKQo+IAo+IFNhbWUgcHJvYmxlbSBoZXJlLgo+IAoKQWNrLgoKPiAKPiAKPiBC
ZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgpUaGFua3MgJiBSZWdhcmRzLApLYXJ0aWsK

