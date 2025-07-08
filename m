Return-Path: <linux-i2c+bounces-11871-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08CDAFC06D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jul 2025 04:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B84E7A9B67
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jul 2025 02:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B3D3594C;
	Tue,  8 Jul 2025 02:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="P6tlRrSM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013027.outbound.protection.outlook.com [52.101.127.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0651820B7ED;
	Tue,  8 Jul 2025 02:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751940381; cv=fail; b=g1Q6+sDon8qPyD/FyZ2VdGNh7lESyXwLDMKtfoLuvD0gQB/0K7UCS+TNWpr1XXs1pPM+nUIWq827t8SPlgH5RSk7/zFtxpQDyYzdVs00h4eR2YqUhD30YEgioXcMq4fFRVkcgQSFbOsRTvE1s6yrwhC2mPD9hEmJBFx0Kv2PcDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751940381; c=relaxed/simple;
	bh=bWL7+ZmX/APG5trUgkyBE+j2iGSN3/l/eyvVq/q/R8I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XF+ky6exE4KnaHCF9qWRFBnQlkB3QiBXwwYsh1cgEZ5NLOj9eqAA9rfCSESZPW31uYi681NSdhj0XRDS71NgqghChtN97a4OSovvyhITIphttLp7LgvTyR9eht7xWIE4FnRd3PuIMsPKrPeZWKLkh1uUj+YsW97X62Can9MMe10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=P6tlRrSM; arc=fail smtp.client-ip=52.101.127.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHMrGpLo25I78W2j9S+Eoc178PaY1lNQ5J6wuxGBMVfUKB2tvlrrc4Sssw3gmj2obmXLkg1P/wjiGlP9FfmVKQ+lw7kcgDMIuMzmv1DcZmOVj8LKzBgpVOCHBuXBWjjoCfxxye/ap1ZFfAwwsC2awrfDc0R4Ci/I5mXfFgdQBLc5puHmDvAeKFx0HyN4rsSiGJZVUgWk1IFmFFkX7mlVqMMTdz+vvx7DywWxbELlm42vnTpuENBvViVVg4drje3GEffpPlQq8U4P2K6fvjOQ3pyaunWBHo4cF6K2rLlIwJ+X0+TWvHrr1rNUoA1aFzKiytHZL+S3AOWt2A5zDeRflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TpB9KMA3mIckR/pzH0ARNQ+YwHar9YOqgkEGnJblG8=;
 b=IHpTfk280OFqHlPrNlrFJMLhmrDXPGbFJB3+lQa4ZLuKdQpbajYrxyN4HFaobaocNLFhUh2vnQtXVJ6JIC80uCspOg9G6PlnDQZVovNZCYupX2xgpmYilTOs/DcVIi2P6UCa3VhUmmF48OVkBT0211vsJILaay+uxublwvRLBUlhGXpzUBuAkgLd9hKSmLqIsnjfKZX9Xk6e2tNEIVx0q+8x+IcsZT+nNfgs3n2265yniU9HBc73r0675J0HzUn1XHsXN2i5DNHrCCPnbySsbeFHAF8HcBJT+x7OdMNDbfJKcdKt8YpnTGcAL2J6CpPodmFnfkb3ZQSJbkmLc0No8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TpB9KMA3mIckR/pzH0ARNQ+YwHar9YOqgkEGnJblG8=;
 b=P6tlRrSMVlFPW5wme5/H7iRFJM3zMWWtBUTgXRfqafL5tsHYuhKnmhcdE05SXXe9KGJ296U6nz1ixkra87Zq5IZjr7SVT74f5/o3odboNFD5sJ6FrwQLTG+tFAoY7nPHSSbEl73C6209oqUqZXYrc1AaNZZsieZWlNMS6ODTz8BpxXuot9hnbEJi3wLBY/HDQTiUDIwVWsq2LXnt8jX1WemjMxgW0MZ5AqdwCnR6W2t7NXBEOzYOZGe523G9wLVuiInqqzHLUUk90Nk6ddMpmo8U8uc+PxysdvNu0BExrY9EKYQVxJ9BhxBuyw1ciXPRzG2O0KVJyHPrzJusDDE4zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TY2PPF70F768FD5.apcprd06.prod.outlook.com (2603:1096:408::795) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.24; Tue, 8 Jul 2025 02:06:07 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.8880.024; Tue, 8 Jul 2025
 02:06:06 +0000
Message-ID: <e6814ec7-b9fb-4185-9929-1e463ef518f6@vivo.com>
Date: Tue, 8 Jul 2025 10:05:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: busses: Use min() to improve code
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
References: <20250705114436.579070-1-rongqianfeng@vivo.com>
 <20250707104041.00006171@huawei.com>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250707104041.00006171@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:3:17::21) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TY2PPF70F768FD5:EE_
X-MS-Office365-Filtering-Correlation-Id: 06cc72af-e536-44f3-4b18-08ddbdc3ff93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1JONk9oZVZKN1Q3ZE9lZDkrUmJNZ240MFJKVTRkQWtKUFBCNFZ3MTFXVy9v?=
 =?utf-8?B?MHhOUlNHbTh1SzNFZlN4Y2ZiUEZpNCtMeHlNcmRZSGFxV25GQXlLMUE0ZHh2?=
 =?utf-8?B?dzhlQTVPdCtKN2hKa1FZR0o0YVlzdjl3aS9UTFV2Tm4xaHN3cDc0WjJmQ2wv?=
 =?utf-8?B?NW02OXZPdndhZ1JkcUNYd2laRktPQ3kwTlB5ei9sQUFTWmUzVHNGUjhIdWY1?=
 =?utf-8?B?YklZS1JHQnBFVkt5Nk5zdDM0VFlqMXZjK0hwTU9TOS9TcTRPYit0dUF5S3pq?=
 =?utf-8?B?b1l1N2FRYkE1OU5kYzJZU09Gb01ZZzZsV20vR0JoRUZLdHpKR3QvNTc0OGdB?=
 =?utf-8?B?K2pXck84cE9YMnVkcERnaWM0cGdvSFkzS1ZyZTAyL2xrd3dBd3RpZkdJN0V4?=
 =?utf-8?B?ODBYV1NLNGlob1JiZFlIS1d0Ym1sRnZvMWoyZTVDaVhubEhCMXdyREJ6TDl2?=
 =?utf-8?B?bExZZ2ZZWmNJeFZuQ3ROekhIWXBnQUEzNlNMMjFrNXFEUHJEcFplQ2ZIYmNq?=
 =?utf-8?B?UEZOM3RZSXJzcnhGSGVnZHlZaXpiTEVSdDF4emFPMStiVlp5aTRtMW1DTkwv?=
 =?utf-8?B?Y3FZZkxjeVgrTzVUaGNuc3BMYjQ0VzBGY1dnZnhmcHAwOTBnYXhXZ1BZeE1m?=
 =?utf-8?B?TVp0d1ZDQ1Y2cmpDcjVRbUxYRXZlQmFrQzdGNzRzWTg5Kzg3MDh1QkM1Mmhm?=
 =?utf-8?B?VFgrU2s0K2FYTkl0TlhBL2phSGpqQlN5ZElXZDJrNnBVNGJtQXdjdStoT040?=
 =?utf-8?B?UE9lYWJZUE8yQWNTYkxkTFMxSUloNGtIZjJaR1V1MS9PWDUxVVpzVHN5WEUv?=
 =?utf-8?B?TzVweWVyVFY1K3o2QTdCZ2p3SVBlS0lQdjhXaHF1aGVtZ0x0YWFWVUxURFJo?=
 =?utf-8?B?eUQ3c3l5VmZNeTlLSTUyV2RlU0FNMkNsaGNKeVZrS3MraTdJS1Ixc1ZEL0xy?=
 =?utf-8?B?M0hrK2tvM3g5WFB2cWdHZGtTdTVRbk5TbTQrUmY3d2c2aVFDSW4vMDVBQ01n?=
 =?utf-8?B?UlR5SDdSVzEvNTI2OFNlUHNRK2hoU3RrT0liTlVwbGRRaEJqS3pLSGhtUVdv?=
 =?utf-8?B?T2sxdXBhV1VVblRoVmVBWUpYQW00dlorOGVGN0hLTDJkSFdoNGluL09lazRs?=
 =?utf-8?B?MjZvVzFvZFc3WjFvNzVrRkJMN0lIYzhLcGtFaGFEdm9NSExiZk5pQUliUkVB?=
 =?utf-8?B?QnprME91Ykg4c2pCb1VtdzFnbldMS3NwUlVXUVJqOVUzdUUyamxRMFd1Skh4?=
 =?utf-8?B?VVNtWU1mU0pSSGxlWUlUS0ZvOWl6eVh5N3FZcWp5TlpTbzRjWk4wdnkzek53?=
 =?utf-8?B?TjZKcWpGOW5qaHA1UjE3U2RNL0YrMDlQSEU1MFh2MzE2Z29wZlUyUGhkWStN?=
 =?utf-8?B?NXAwdkswYkZ5WTdDbHVINkRUTFZPdzNJdmFacmlTamhHOFJ3NG02aUFyQmtn?=
 =?utf-8?B?emR0QjU1TEZzaC9pN3p0V3M4REJCSFFjVU1WMzBCMjNUZksxMXE4NGhuTzE4?=
 =?utf-8?B?Slg4UGdmTSs2L0VTNG1uUmpYK3pOTGlvL25XK0dBYUN5eHNTbXlPc0tOMTY2?=
 =?utf-8?B?dVVWM293cWNyWkNabkhSVDcxWXBMcjBONXZSS1d4YkN3VDY0Vkg0V0dWN2V4?=
 =?utf-8?B?ajlJWjQvZ0JTRVhmTHRoZ281NDR4NG9aT0hueUlTcVE5TkhDRGZEejhNYndO?=
 =?utf-8?B?dm9lRmpwN0E4OEpoZnlsT0NJK3RzM28zTW1EVnBLb1pRVW5uOU1YVGd6Mmcz?=
 =?utf-8?B?SXo3cnVnU1pDVUN6d1RqM093amFXcmZTMm02bjRNSW5tOEtPQXA2RzlUTnRl?=
 =?utf-8?B?ajBqQUkwOXM1MkQ5SGF5UXNrOFBSYnFMQ3R4ckg4MTlXVCtqNVE0MWR6d0ov?=
 =?utf-8?B?QWZ4YkF6NENlKyt6UHVOVS9nU1ZXQmtobFA2d25ZWUNua2tvYWlWb1IzMGx1?=
 =?utf-8?Q?eMfrYDj8kSw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d25YQVR2SXZWYzBrbnk1ZDd6Z3krWTdpY2pXWjlvT1FoZ25ZR0xMT0tJczRq?=
 =?utf-8?B?YUlRY2JWM2VNZXMxTU1uaUZvSzhVZXllTUFYSlFMZndXZFdxZGZDU3FQN2Rt?=
 =?utf-8?B?NHJPTHdaTGMrMklCbEYxb3YvOWFrMG1WRHN2bkMraVZpUnBEK2Rta1phbTlV?=
 =?utf-8?B?YWdUaTlidUhodXR2RjhaU252Um8vRis2VUUzbE43Ykl1bjhPMGV1UFM1UHZD?=
 =?utf-8?B?SXR5TGtGYlUxMERJRU9uYnU0Y3ZXclBGY2NUWnpYeHZvVUFFNjNZbGJINTZJ?=
 =?utf-8?B?K2NnY2gwK2F0Rk5hYkM5dVRsQlM3eEdVWlQvUXkxU0RMSGY2cDZ6bWlybm1p?=
 =?utf-8?B?WURCbGtiT3QvL1pFV1RhRlpRdkltYTIxS2lrUXFUdUdOTFdzYUxCVDJtYVVB?=
 =?utf-8?B?ajRaakdmVXVlOHUzK3lhNXM0b3lMUGU2MzlNai9hdnJEd1EvRmZJZ1VKZkpw?=
 =?utf-8?B?WTZsY0JlajkzTHNSRDVCNlRnYUxHT1hzZjNuTUNyYytNUnA2ajdXd0tuaTl3?=
 =?utf-8?B?cUdCaWRPeE1xL0hmR2ZPQW1SWmVhcEY1RFc1ejVkdnpGS0dlV1hDTnpOckRD?=
 =?utf-8?B?ZlQ5OUJuTTdlSm1KZG9HdDFCWmdqVWRZNnZNamJ1alVGLzZMOGIzdDBVSzZT?=
 =?utf-8?B?N2xFdkRhRFB4S2pBVGZBamRMdVFWaVgzTVhuRlo1Q2t3TE5acmNqMjNOMmhT?=
 =?utf-8?B?OFN4ZGJaUzd6MWlUNUlTcnFkWUlwNWlMSnJyaXE1d3pxOFdLTkFUWDNibnZV?=
 =?utf-8?B?RmFtSFRGRlVrUGdia3Y1OUo2RWpFRVFuaHltd09ia2kxbS8zcjliRlNLU1RO?=
 =?utf-8?B?aWFlczY3c1JLSWxOWGpYb0p1RTRYYmdZRnM3UmRIeGUxb1hGa0FtYlVNY0JG?=
 =?utf-8?B?MTJ3MGwxWjJKN1hmU2Q4alNzeUljNXg1bWV1R25laXVCaEh2R1RrcSswT05x?=
 =?utf-8?B?ODFIaFJPZVV4bVNPMmRGRjRwcnRsZVVYRWRycVZ6M0tBeG9vaXVCQlpEelhH?=
 =?utf-8?B?NmoyS2owcDg4T0svUDh6K3hhVDU3ZVJaWGhqZ0JSN1RZSDh6dzNUbmZhWU9l?=
 =?utf-8?B?SkRleDhnMnZHVXNheGVObXlQRWtWbDR6bkF1ZThxWnhZZ2NMOG51R0lXb0VR?=
 =?utf-8?B?eDVzZXNLcFFSNzZmSUpLVThzWlRnYjUzZVE3YnZabS9FQUhqQ2RSQWx6MURj?=
 =?utf-8?B?a0VsU21zRTFFSXRBdjZUUFdoWlBsL0V1Z0ZmVmIzaVREcVJ3cHVGN0QxVnNE?=
 =?utf-8?B?dytLd0hIYVFyZ0Z1TzR0SHFEUkdzK3gwdGtRWFZmZnRzbUhnMWIvVXBIY3dX?=
 =?utf-8?B?MTJyZmtvUG9hL0NCcndqcTk2TlhmNGt5YWh1WHlmQVc1OE9IUm53ODgvdHIy?=
 =?utf-8?B?K0xpRkh2Vy9vMzZLWHRIWXJ0ZlhyakFNWW91R3R1WUthV01OYVNkTkpHUWR5?=
 =?utf-8?B?elVta3VEYnc2K0pSVTllVkdPS3F3MTZtRG9nUUFVMGxDWmtzNytpUlBZOEFJ?=
 =?utf-8?B?czhtclY3U1lxTUw4YVJrWnc3S21PcmhzTkNoeFhwc3RaNFhLb0lqeWt0SzlM?=
 =?utf-8?B?VGViR1l2emJEMlZGRlVqWUJmVG9XWS9qRTBnNXlaRGVNbUM5TWlhbUZaQzMv?=
 =?utf-8?B?ZzZibndEOW1Lam9UcmE4T1NUd01GemRtUWxLdE9wcnp1L3NPTXlpVTNPc1k0?=
 =?utf-8?B?SU0wT3BZRTZ1SHlRMXdnZkFEcXhxSDQ4SnYvV0Y0a0w0VjVyNmtuNTh2WUE4?=
 =?utf-8?B?WUNncUk0NnJLQmtTUmJkblc3dVFrQUI1ZEQ2bEc0eFd0UStCem9ENEQwc3k2?=
 =?utf-8?B?a2JsZHVvWDRxMVBLRUMvVzh5VWRMekFzeXQ2YVdmc3NCSmM1OVEwd2dFUmNW?=
 =?utf-8?B?M3FCS2hmZVBpOFBtMWczUkVCRDNqYmhUbWNIRy9ibmJpVitQUDVxOGJaR1RQ?=
 =?utf-8?B?SDNsU2FDWTNVOHkwMW4wOEtnRFR4NEljVzU4Z3JZK1pOSWFzNHVyalZha3U5?=
 =?utf-8?B?ZHQ4RWlFQmp3VXI0ZHZMWWo1ZjNEUGVDQ1lMd3ZzK2Jyb1l6dGw5anZoejVk?=
 =?utf-8?B?OHBnL3Zac3NJNmtoWXlsaE5GQm1GK2FNbTlleEdwNG13bDNtWUlYdFc4MVJU?=
 =?utf-8?Q?UGTGX3Xa0u2d+brG5pxR4O7d+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06cc72af-e536-44f3-4b18-08ddbdc3ff93
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 02:06:06.3716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZfduShJQE8Wv6wkjAd/dU973PcXgicu/k8bifKEjMo4+Nd52/yAz8/9nPXeo8ZDmIPRQD3E0WHJAYqNceQazA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF70F768FD5


在 2025/7/7 17:40, Jonathan Cameron 写道:
>> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Drive by review...
>
> I'd add Wolfram as +CC at least.  May well pick it off the list
> of course.
Thanks for your reminder.
>> ---
>>   drivers/i2c/busses/i2c-st.c | 12 +++---------
>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
>> index 750fff3d2389..285d8a05ab36 100644
>> --- a/drivers/i2c/busses/i2c-st.c
>> +++ b/drivers/i2c/busses/i2c-st.c
>> @@ -422,10 +422,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
>>        tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>>        tx_fstat &= SSC_TX_FSTAT_STATUS;
>>
>> -     if (c->count < (SSC_TXFIFO_SIZE - tx_fstat))
>> -             i = c->count;
>> -     else
>> -             i = SSC_TXFIFO_SIZE - tx_fstat;
>> +     i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
> Add
> #include <linux/minmax.h>
>
>
> Given it is now one statement perhaps cleaner toput it
> as the loop initializer
>
>          for (i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
>               i > 0; i--, c->count--, c->buf++)
>
Got it. Will do in the next version.

Best regards,
Qianfeng


