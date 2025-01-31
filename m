Return-Path: <linux-i2c+bounces-9244-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6CAA239A3
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jan 2025 07:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7BC71653DE
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jan 2025 06:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DDC146D6A;
	Fri, 31 Jan 2025 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F4g54ZN1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2076.outbound.protection.outlook.com [40.107.212.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999B514F70;
	Fri, 31 Jan 2025 06:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738306022; cv=fail; b=m3ZQPc/CafcdVFwif7OujSCxi+MXKdgv/ly6dXV0skwOojjOu2sx3myztZhCOu/Xusq9movL6L58F2vLPXN+iLVqFxGJ1rxmyuoIancIQjOIC1HHTEhjfIaWeH7JSK60qOb8ueUGa9vYEPWA2EDB4qL4xs1RLKDVh89v5Cu86/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738306022; c=relaxed/simple;
	bh=Afa3tGsj/xFcMIlcTWDJNZM7HzOnl6p2E6oIWFEUAnM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iJg3+R/fz/jgRU8nP7kDZGSu51CyX8EJViF+P7RfuGy7mlC/d78P9xk98LTnR34s28ZYUgpRUS52q+QGm7hacyscf9ZFxIeFLClAHvLN9GDG9YwxvlDxypxsXN0xQQ1nMrv9C53p1po8ImUITr8IC3xIi/guWACYC3M1ta3gHGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F4g54ZN1; arc=fail smtp.client-ip=40.107.212.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXe3ZmQ8nmzTD2kReYWCQlLw5ixsLmVRT9jj99JDXd3qvS7EiXDJsijZGnDmI8mfsSzJgyIe1a2F+fq7vkpiPAHPlIYJpp1YDGvtlrfPuQJbuV9P3TwvQeTtuOIOdJc3UK4zX9VRH5TCGmozdOygFMWgE/wpr8+HHFKBbvDg2/E2qtzgV2UsJyw/VcxpIR0FUPsY9PqbeRHEwqOp+KnM0uDDTguRaAtu4GKkmyN/pmhvFysSEBHGkBCIsgQg6LgwlVZb4tX10Yqx+Qr3gdx8OarjGXUhXYv2h6qlq5PFCDdYmFznOqAo+C0QNceqTOSM+KJ+aerS2yurEyXVapqLlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Afa3tGsj/xFcMIlcTWDJNZM7HzOnl6p2E6oIWFEUAnM=;
 b=BS6RUxbs4vQpaoYB69e8X8sUPr3AkfyRHWa2wroW5azu5ZLGujJQZjQjU/PG3WNBx+oLJdgR/zqKWvCCjBeLGV5nLkiRnpYKpAd01ad6ozU5SBwhddElWXCIjxN4mk43GbjIlNr/TBpAbpJcgrHcxHHrGvJDxabhnUKdsaKT0r1OlEbrwhXijxzg4UuQ0RbEFVjARXssBLckfWhDfOisIUDCw5Q+yKI24CeBVWrKYExUlbWmlOc6Z2IcvSVWA88c1uYZxnLZDD0eWqsSfd1LjIORKcdCEUXqXzjssYesFA7DcepD/oWPNcTZq5XERIfXuZNu0pZ/rd+nChnWg+3m+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Afa3tGsj/xFcMIlcTWDJNZM7HzOnl6p2E6oIWFEUAnM=;
 b=F4g54ZN1y3Clj/HbPBqzmT5LC+DGW2/+OCK9CxpfRYukdl94BtHmhqjFap6/AZgQfdxsOMAnKGAOtcZWHf7i5zRXh+LX6TxqlA/XAY+YtvfnbUZZeJ4PNpascCkyCjzOZNZbrJqg1GsnAvGvIZdpsKOsLLuvcYREi+GmJhhs8viW0Pu9I6L9Bi8v4yV+y4Y/09vqZKlLOTOYK8S/lHCd7NVBAiiK9QATJnB2/mArXkpXC1EjqmoIBu2h32whHWcYUvTE5PdCmJ9aH05DKFceXuyNeAV2Aa5TH5972qt9U55a5tjcBnjb+G2pYCWWkjWvrQsf4c2thwVNa6oF4j9mBw==
Received: from DM4PR12MB5721.namprd12.prod.outlook.com (2603:10b6:8:5c::10) by
 PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.20; Fri, 31 Jan 2025 06:46:55 +0000
Received: from DM4PR12MB5721.namprd12.prod.outlook.com
 ([fe80::5bbd:73c:90ac:83c7]) by DM4PR12MB5721.namprd12.prod.outlook.com
 ([fe80::5bbd:73c:90ac:83c7%4]) with mapi id 15.20.8377.021; Fri, 31 Jan 2025
 06:46:54 +0000
From: Kartik Rajput <kkartik@nvidia.com>
To: Laxman Dewangan <ldewangan@nvidia.com>, "krzk@kernel.org"
	<krzk@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Akhil R
	<akhilrajeev@nvidia.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "digetx@gmail.com"
	<digetx@gmail.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] i2c: tegra: Add support for SW mutex register
Thread-Topic: [PATCH v2 4/5] i2c: tegra: Add support for SW mutex register
Thread-Index: AQHbczHX4TF+SX1mI0GO+pmGjU99G7Mvg40AgAAUnACAANk3gA==
Date: Fri, 31 Jan 2025 06:46:54 +0000
Message-ID: <e1c72d7ac3f21ece4bf6a3f4c58f3fc300292b2f.camel@nvidia.com>
References: <20250130143424.52389-1-kkartik@nvidia.com>
	 <20250130143424.52389-5-kkartik@nvidia.com>
	 <febb1225-3c14-4377-90e0-4d4aee307ede@kernel.org>
	 <0daa503e73099085d84d432bb72a5f79db81a9b1.camel@nvidia.com>
	 <4b9777cc-0bb3-44c1-92f8-209c30837f20@kernel.org>
In-Reply-To: <4b9777cc-0bb3-44c1-92f8-209c30837f20@kernel.org>
Reply-To: Kartik Rajput <kkartik@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5721:EE_|PH0PR12MB8174:EE_
x-ms-office365-filtering-correlation-id: 5e11f278-9469-43b5-6c07-08dd41c30ce5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?N2VLZWFqQTJwT3Z3Y1RhZ0MyUitBVlVZcnVOR09ORW5qUVU3WUJKTkxwZXpk?=
 =?utf-8?B?eCtzb3EvMVFNVUhqa09lWStFNWFnaUFOVXc4YTk3NUFjdTJKdHpHaUdDSGR6?=
 =?utf-8?B?UU55YnlnU255aEZjTUxNdlQ5Ykt2cTM5QTU1aTM1eitmclVQazZrV0Zkczdl?=
 =?utf-8?B?bnRtRWt3NHdHeGQ1SC9HaW5QbVpiQVRYZlplSjZzbk5EM3FXQ2dZRlhRV3Qy?=
 =?utf-8?B?Zk5zYmx6MmlmWURESVk1alE3TlRKS3VUYzV2VFBDMk9BemtPVVNHUnk1SG12?=
 =?utf-8?B?SDJya1J0eDA4U0dzUi9TbEFmTERKdG5EVlk4ZHg3SGc4bjhLZE5pNzBsZnpw?=
 =?utf-8?B?ZFFlNWYwTUpFR1BmTklOOFdtNE1ibXRZRjRvSTVyenFMcVNBbEhUc3B1bVU4?=
 =?utf-8?B?UFlsRENDZnEreXRxYnRzZ1ZRTW96N3lrbWMxOU1CdFdOMndxWlhDRXJkbTI2?=
 =?utf-8?B?M1ArYmhDMTdnaDZKWGZIREtyR25kTlJyd0tXbmd6YUNPZ29qbE91RncvdWtK?=
 =?utf-8?B?Z0h0a3dBVnA5ajNwYVFLRTh5VnFoNjlycnJBc1ljdFl2bi9lQUJhSmtZWlJH?=
 =?utf-8?B?NUJ1WHZCSDZtbFRqaXpzSFBNM09oRzRSWDVsdDRKb01Xck9wZzB0Z1plMVlq?=
 =?utf-8?B?eUUvWEVXdmUrZ1NwYnR3NXpKUGRwMUdOaTV0ZFZ5Q3d2TmhNNGZWSG1zOG9x?=
 =?utf-8?B?L1NKMlRaY09BclZNNldkTCtPeGRrTEtFNXVDSWprdjM5cTJQclIvZkduS1RM?=
 =?utf-8?B?L29yQWk1Ky9SSjBmQ3pXTUxkSjdkak8zZ1V5NlkrZEV2SGlDTmRSNmtjS0hQ?=
 =?utf-8?B?UGs2TWhaTE9xcEJiU3AyWTE4T2NsWWNoS3U5dU9manRvZHZVNE42UFdqeVFM?=
 =?utf-8?B?UGdzMExxUHdZS1JwZTNEZXBkZlF4QjF3RllRK0tmZnNZTVFUZkVjbEJkZUJq?=
 =?utf-8?B?ZmJWY0E1NXU5M2ZzY0NnREpOcjdxRnVuOHpLbXBPOGRoMllCK2FsT2xCWGR0?=
 =?utf-8?B?dnBOWTdFY1dOdVlLN1VzLzFVcDVzbUhSeTV4MmxnMEdncmFTL2pqQTVzNkpD?=
 =?utf-8?B?dGEwNE4yZm1ZZ3BTZDVxZzdFRGVvTndVN2VaU2VYWHVRNUVneTV4cTdWL0p5?=
 =?utf-8?B?OTZQQjkyZUhOTldWeWNyd0RGMUs5TkFCM0drQlIxWFl2Wk5nRVV1ZCtYODBX?=
 =?utf-8?B?UlRHaC9TQklUN0NVdUlPdkRCTSthUjBhdllpV3prRXpWcUlHdlRkTE5pYTZK?=
 =?utf-8?B?WDRoQ09xWDlBNTBGTEY3L0NoVHJob2s0clhJb2tzSjhUenpTUkZiNXdHWlpQ?=
 =?utf-8?B?eExwSE8wS2tzbE4reGVUbUF4ZEZSZE9GYWY3dmhNZXQ3dFJ2SGhRdU9pQTVs?=
 =?utf-8?B?V3hkYmxteC9MK0ZJa2k3MHdvbXNpWHpGSFdWcjAxc2JtaVE5OG1wOCtVWmFs?=
 =?utf-8?B?THhpRVlQR1EydlFPZmNoQlpkQXl1QkVuTlFlYlRwc2FlUjkyZnpDTSt4RkpY?=
 =?utf-8?B?ZTFtVm4rSG9iS3ZIbzVTOTBGS2NXdjR2NENicDdCaDdOZVFiQ0Z3OWxrbHJt?=
 =?utf-8?B?ZXZyVnlpdW8rQzNHS2VMdWpSMG9HNFc1YnRqWFNJRlgxQkFDdTZ3T1NVTkNR?=
 =?utf-8?B?bitTT2pyWHBYQ0RKbm1MdDQ5RFNoS29qaVdzV05QQ0J2bWJ0cVRYb1FONlZr?=
 =?utf-8?B?akp4M3JnbE1rM3kreFpQem9uVXFQcFRJVUZSTHlOa2VEam9hNHJTaEYzKzBJ?=
 =?utf-8?B?Z3ZETTFRNkhIdncreUloUTQyOXFrSXJLcnJvVGFFQXFjSnY4MmlnRFNBNC9E?=
 =?utf-8?B?a0Ztc0ttQm5OUjB3WXgrOWR3dktScjdZbk0vUDB1K1FRK1pMQjNtYTNBZStB?=
 =?utf-8?B?c0owMFYwUVBjdnBsblFZZUV1RFdYdFpYaTRzN0c1djYyTkg0SjdWRllpTHFn?=
 =?utf-8?B?SWU0V09RSVNPOUlWeTNRamhhaERHQW11Nys5eG5xVU5RTytob05hNDlaSmx0?=
 =?utf-8?B?ZC9UcXBBRWpnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5721.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OFZwL0J2MTAxSWJiekIvZVN5eUNCeFdoc3I0d3V1cjB5aDIvUlczTmVqa042?=
 =?utf-8?B?dnl1UzZ4czdoNHlsSEVwb1ROYWI4NmFHTXpLckYwVWdya0VWNjM3L05jaENQ?=
 =?utf-8?B?TUlJV24yZEFXQW9GbHdnb3oydldLQU5GWlltbFMrbjlvWURWSzd4VGU5UnUz?=
 =?utf-8?B?WWQ3ZnNMbW5EZkl3ejBBZzFrRWtsVThXU3RWU0FTVnY2VkR0OFZZN1RFd1Yz?=
 =?utf-8?B?bGlZWkczWE5FaEdYSktDR2RwVjN6ZGh5cGorZmRKTTl4QTh2NDdQUGFCaVR3?=
 =?utf-8?B?QmFrOTZPYVNyZHlVRzV1M1Q5K3o0c2lWS3FRcllOZ0pnMnkyVlNCNGw4WjBi?=
 =?utf-8?B?aDlVQ3hINmt6UCtYZnl0UU8wKzVTNmVCTlVQSFZqQjBvb2ZrVHowazZpbEtF?=
 =?utf-8?B?SFh1S0MrRkZIWDJlOWhHWkhCU0kraGtIY01rVTc0ajN6ZVgwN09mL0N6cFJH?=
 =?utf-8?B?TGRnd2ZTRU0vUmZna2lZYlo2bjBJYWFKNk05d1g1T0lUZndEZzBZYUpueHVm?=
 =?utf-8?B?RWovY21uRjl5MFphV3NmVU5wWGxNRUZOb0pEYncxTFFDaGtMekV4YlhtWFF4?=
 =?utf-8?B?cjlxdk02a3VhU0l2cDRYS3FRSTJhWDRUZkJkNkpkWDJzblR3TzNDZ0Z0YW5B?=
 =?utf-8?B?MWFtWDB0UjFZRlp2bUs3MFgyaVE2aWlGb1VPWmZ1aVhVdE0va0J1eWQrRklq?=
 =?utf-8?B?ZUxNbm56MHM0MUdkV2l4NDFRdWpReFR3YWpIc0lQNS9sM1NMeDdvUHVuZWJl?=
 =?utf-8?B?cTRGaVA3OTdIVCt0ZERQRmJNRWg2RHUzNVB3UFlXTjA3cmpKaENVeUJMdE03?=
 =?utf-8?B?VEM0bnFpeDdMMGZwYVB1ZGRlZTdEQWVncHEycjd6WUpNSnpSR3NkdE5ieWlu?=
 =?utf-8?B?d3FwSCtrQmNydk82RU9qemc1T2RHY1p0S3ZjaGwxQTZucFI0VWhENnZJdzJX?=
 =?utf-8?B?NE1PWUt2SUk1M05Vc2Z5UDhJVFJlbW5TZ2xMQmh5WXZhb2d0b3A4cXhMV0g2?=
 =?utf-8?B?UGQ3cktXWllkY3JybHo0dlNVd0tneTYveUl0UENVOG9kMVVjQWZlTUNXbTBG?=
 =?utf-8?B?TG1rQlNHU0swV01hTWZkVzlLYlBBeVBnYzJ2ckdsbmlKTHN3M3gvbmhab1Ux?=
 =?utf-8?B?MW1FR0Z1QnBWOWxOUnN3ZXVZQXpTRndkZUJiTDNQNXJhL1VlT1poSjVvcFI4?=
 =?utf-8?B?akxUb1NrQStaWjFQWGtSbmo2U3BXSEdsemQ3c0sya2RVek5TRXJKU0JRWnJX?=
 =?utf-8?B?SmdTWjljYWNrdkxCdythL0pwZTJBVUxlWGp4SjlacW4rVnNVTDR1d3ErNTB4?=
 =?utf-8?B?YzcxRld0NFljYXBLY3FnakZhdUc1L3M4T2hPUjlvMjJ1L1RUU005VWlhVjJk?=
 =?utf-8?B?K1lGS2EwKzNUK2IwTUloSnp2ZitVUDdsa0FWVUVXR29qUFRacUsxMmJTakdu?=
 =?utf-8?B?MXovTGpmZGlQWHkwMGpuMTdXU3V3Q0FMTDVteVEyRjQrRE42bVpTTW9jSDBw?=
 =?utf-8?B?aVBSaktHbjZrUWx2STg3MjFVRFJ5UUtnR0V0SGJqUjdGS2d3em5HZzQ4cm5W?=
 =?utf-8?B?RE82OHRCM2ppbCsvYzMrNDdCdFJzOUxycC9vSGI4TXJBeUtyUnA5TlVTUFRq?=
 =?utf-8?B?SkpWNlVmSnk5NDBJSXFDc2wvT0haQTNTbDE5SkRneFZ5cDJrb3VSYkJkYnRB?=
 =?utf-8?B?N2lheFdnekVyS3J1SkJ0NjQxQ1gyenZjdlNDamNDWER0cmY2S1ozSnJadzJk?=
 =?utf-8?B?TmlITDk4cFpGakZQOFpJOGpUVDFsN2dmSmR2NjJxVlZOdVZKTzlyUlFPNWJo?=
 =?utf-8?B?SFVEWE1BclF5MWsyTlpyWU5UYkpLbVNobWdTdFBjVFRacDJPckZPM1VXZHY4?=
 =?utf-8?B?QjlSTzhoOXBPNnZLQjU5elcyaWNRVHN3a2ZqZGlrYmRaZUUwQ3g4TUpzVGZ2?=
 =?utf-8?B?NmViV2IxS2oxQk9RQ1Qwdjl3VEVQUU4zYXJBaWxnZ1FMMmFLK05WTmxmbVU1?=
 =?utf-8?B?Zmd4Q2RXVit3ZU5DU3dkeXAvTng2MWw1ODBLWjdXajNNd0tvM0gvcVZlRThs?=
 =?utf-8?B?eEw4WjJRcVRYdkVWN0krOUVqUjZ0aXpRS0VKTy9veUMrN3pOdyt3bVVadWhi?=
 =?utf-8?B?QzRyc1NKUG52RTNKWlJNWjB6SjVUQi9Xc21IT3RzRU9VL0ZMRGxRMUs4dTlD?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10BAD98B84754043A91D2DC9B92ADC35@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e11f278-9469-43b5-6c07-08dd41c30ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 06:46:54.7096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mIzInpm9LkAxLhsDAhCFmfozbX3jBGuxtJ6/Dtld3eEEI4WsQTLOuc7ZgYsOc0rc2bFgeVTT1enDZZqlJuT9Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174

T24gVGh1LCAyMDI1LTAxLTMwIGF0IDE4OjQ5ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRh
Y2htZW50cw0KPiANCj4gDQo+IE9uIDMwLzAxLzIwMjUgMTc6MzUsIEthcnRpayBSYWpwdXQgd3Jv
dGU6DQo+ID4gPiA+IMKgLyoqDQo+ID4gPiA+IEBAIC0zNzIsNiArMzgyLDEwMyBAQCBzdGF0aWMg
dm9pZCBpMmNfcmVhZHNsKHN0cnVjdA0KPiA+ID4gPiB0ZWdyYV9pMmNfZGV2DQo+ID4gPiA+ICpp
MmNfZGV2LCB2b2lkICpkYXRhLA0KPiA+ID4gPiDCoMKgwqDCoMKgIHJlYWRzbChpMmNfZGV2LT5i
YXNlICsgdGVncmFfaTJjX3JlZ19hZGRyKGkyY19kZXYsIHJlZyksDQo+ID4gPiA+IGRhdGEsIGxl
bik7DQo+ID4gPiA+IMKgfQ0KPiA+ID4gPiANCj4gPiA+ID4gK3N0YXRpYyBpbnQgdGVncmFfaTJj
X3BvbGxfcmVnaXN0ZXIoc3RydWN0IHRlZ3JhX2kyY19kZXYNCj4gPiA+ID4gKmkyY19kZXYsDQo+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB1MzIgcmVnLCB1MzIgbWFzaywgdTMyDQo+ID4gPiA+IGRlbGF5X3VzLA0K
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdTMyIHRpbWVvdXRfdXMpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICvCoMKg
wqDCoCB2b2lkIF9faW9tZW0gKmFkZHIgPSBpMmNfZGV2LT5iYXNlICsNCj4gPiA+ID4gdGVncmFf
aTJjX3JlZ19hZGRyKGkyY19kZXYsIHJlZyk7DQo+ID4gPiA+ICvCoMKgwqDCoCB1MzIgdmFsOw0K
PiA+ID4gPiArDQo+ID4gPiA+ICvCoMKgwqDCoCBpZiAoIWkyY19kZXYtPmF0b21pY19tb2RlKQ0K
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZWFkbF9yZWxheGVkX3Bv
bGxfdGltZW91dChhZGRyLCB2YWwsDQo+ID4gPiA+ICEodmFsICYNCj4gPiA+ID4gbWFzayksDQo+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZWxheV91cywNCj4g
PiA+ID4gdGltZW91dF91cyk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKgIHJldHVybiBy
ZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dF9hdG9taWMoYWRkciwgdmFsLCAhKHZhbA0KPiA+ID4g
PiAmDQo+ID4gPiA+IG1hc2spLA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGRlbGF5X3VzLA0KPiA+ID4gPiB0aW1lb3V0X3VzKTsNCj4gPiA+ID4gK30NCj4gPiA+
ID4gKw0KPiA+ID4gPiArc3RhdGljIGludCB0ZWdyYV9pMmNfbXV0ZXhfdHJ5bG9jayhzdHJ1Y3Qg
dGVncmFfaTJjX2Rldg0KPiA+ID4gPiAqaTJjX2RldikNCj4gPiA+ID4gK3sNCj4gPiA+ID4gK8Kg
wqDCoMKgIHUzMiB2YWwsIGlkOw0KPiA+ID4gPiArDQo+ID4gPiA+ICvCoMKgwqDCoCB2YWwgPSBp
MmNfcmVhZGwoaTJjX2RldiwgSTJDX1NXX01VVEVYKTsNCj4gPiA+ID4gK8KgwqDCoMKgIGlkID0g
RklFTERfR0VUKEkyQ19TV19NVVRFWF9HUkFOVCwgdmFsKTsNCj4gPiA+ID4gK8KgwqDCoMKgIGlm
IChpZCAhPSAwICYmIGlkICE9IEkyQ19TV19NVVRFWF9JRCkNCj4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArwqDCoMKgwqAgdmFs
ID0gRklFTERfUFJFUChJMkNfU1dfTVVURVhfUkVRVUVTVCwgSTJDX1NXX01VVEVYX0lEKTsNCj4g
PiA+ID4gK8KgwqDCoMKgIGkyY193cml0ZWwoaTJjX2RldiwgdmFsLCBJMkNfU1dfTVVURVgpOw0K
PiA+ID4gDQo+ID4gPiBBbmQgaG93IGRvIHlvdSBleGFjdGx5IHByZXZlbnQgY29uY3VycmVudCwg
b3ZlcndyaXRpbmcgd3JpdGU/DQo+ID4gPiBUaGlzDQo+ID4gPiBsb29rcw0KPiA+ID4gbGlrZSBw
dXJlIHJhY2UuDQo+ID4gPiANCj4gPiANCj4gPiBUaGUgSTJDX1NXX01VVEVYX0dSQU5UIGZpZWxk
IHJlZmxlY3RzIHRoZSBpZCBvZiB0aGUgY3VycmVudCBtdXRleA0KPiA+IG93bmVyLiBUaGUgSTJD
X1NXX01VVEVYX0dSQU5UIGZpZWxkIGRvZXMgbm90IGNoYW5nZSB3aXRoIG92ZXJ3cml0ZXMNCj4g
PiB0bw0KPiA+IHRoZSBJMkNfU1dfTVVURVhfUkVRVUVTVCBmaWVsZCwgdW5sZXNzIEkyQ19TV19N
VVRFWF9SRVFVRVNUIGZpZWxkDQo+ID4gaXMNCj4gPiBjbGVhcmVkLg0KPiANCj4gDQo+IFNvIHNl
Y29uZCBjb25jdXJyZW50IHdyaXRlIHRvIEkyQ19TV19NVVRFWF9SRVFVRVNUIHdpbGwgZmFpbA0K
PiBzaWxlbnRseSwNCj4gYW5kIHlvdSByZWx5IG9uIGJlbG93IGNoZWNrIHdoaWNoIElEIHN1Y2Nl
ZWRlZCB0byB3cml0ZT8NCj4gDQoNCkNvcnJlY3QuDQoNCj4gSWYgdGhhdCBpcyBob3cgaXQgd29y
a3MsIHRoZW4gc2hvdWxkIHN1Y2NlZWQuLi4gZXhjZXB0IHRoZSB0cm91YmxlIGlzDQo+IHRoYXQg
eW91IHVzZSBoZXJlIGkyY19yZWFkbC93cml0ZWwgd3JhcHBlcnMgKHdoaWNoIHdhcyBhbHJlYWR5
IGEgcG9vcg0KPiBpZGVhLCBiZWNhdXNlIGl0IGhpZGVzIHRoZSBpbXBsZW1lbnRhdGlvbiBmb3Ig
bm8gcmVhbCBnYWluKSBhbmQgaXQNCj4gdHVybnMNCj4gb3V0IHRoZXkgaGFwcGVuIHRvIGJlIHJl
bGF4ZWQgbWFraW5nIGFsbCB5b3VyIGFzc3VtcHRpb25zIGFib3V0DQo+IG9yZGVyaW5nDQo+IGlu
YWNjdXJhdGUuIFlvdSBuZWVkIHRvIHN3aXRjaCB0byBub24tcmVsYXhlZCBBUEkuDQo+IA0KDQpB
Y2suIEkgd2lsbCB1cGRhdGUgdGhlIGltcGxlbWVudGF0aW9uIHRvIHVzZSBub24tcmVsYXhlZCBB
UElzIGluc3RlYWQuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNClRoYW5r
cyAmIFJlZ2FyZHMsDQpLYXJ0aWsNCg==

