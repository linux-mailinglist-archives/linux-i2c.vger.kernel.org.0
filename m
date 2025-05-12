Return-Path: <linux-i2c+bounces-10941-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B8FAB473C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 00:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 398C91B42AB9
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 22:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6F129712E;
	Mon, 12 May 2025 22:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C56ZMzk0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B17625C821;
	Mon, 12 May 2025 22:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747088671; cv=fail; b=MC/4ljJLe8rdKlHneyilUGQOCHl0hNW47u/462QUhNOqSuaNAkskovd9ezSBcXQ/wNsI2JMVvEQGGeTkUuHOIsCO99u9vn03cOZ7Xrl2Dco1RUMeawWE/aWOoUIgOipBDstTtjz25yuAFJmrELpXwtA6ktQRpMUvXPM/aDpY/hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747088671; c=relaxed/simple;
	bh=oOpjmL1nho4VvDmAsEXmg1tlevpLBtcEMesYuRtSDuo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pHU8XI4noLvHdzvAKoywjiNX4jE5m/pfxXntZ83VEJUDjfauDSwBwBSBoeOXfw6NM00JY59ytSmMz8dAbohiyhi9dSqQxsMvOh6+2w7zUOmnusX3ppDHUWFjUfuJDUcDdn8TvbjqDnfWmcLOdD0PgxeeaxqKPqxLOjdSiu2LgXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C56ZMzk0; arc=fail smtp.client-ip=40.107.92.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aj5jcKBzkmriXENHpOFIqmiW/HK2uPmzipXdXfph3HBsS/GB8F+7A21nJ/4p+ZV6NWetC4bGE6pQWDtyGplnwwv/pJrtNOC6XU6nmONTJejaEU7+b52ZBJcdQKRgmSaEl1ZRx3M/LxPTYoqQ7TDCi2kxi6bABNjmAmfY5iePGKQTQ26/mFY8S04hfIRPtclUxHLm3JjDczjTgwPxbkj9JN5sJcxcje/bsgDdP5lK/YO2oIs1t0lQOSEvqJpdr/kOI6/ft7DSeK2HAIaeYgm/XYDF7WaKSDi3zUBgSif/QgCusNSnc7JR/bTVoKcYOrkfAIZFCz8qB+owPsK/pE8FaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqecl8e2fs7i9i0IsW0aGG0g6vY1e9nFTaHerke1ORM=;
 b=Oo2oZD2xcF40ahvcNGQLXgovXHyKioT7xRsjTfAXIhzG5J9iCBBjHlVnKK7vuwkNlVroS9ZfIVcFoyDTeTi47aaw4+hY8gxiP4kou1gYtQe/HegbxXd/np2QdHFBLw0No3vu1iijYNIj17Tn9m1SWNljbaXGgO2H/xuBLNHhlqukh/LpIU0EmVfr/GqegdZoP6BDlZaxWjnV7LSnJqSfMImzrgvl404rcLM6CydHrir8VYXXOepWDN1FOkBa/suvjLLuaplIJhW6F/0sePFQ2yQI96h/NqcA1hAkRp9eS0AQwaKZlTpyiWZMRJRaT/4FMiZXN5BoLpttq+NLZs83IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqecl8e2fs7i9i0IsW0aGG0g6vY1e9nFTaHerke1ORM=;
 b=C56ZMzk0xnvU+GQC0Q425k1jhteW7OPonHcpufc/ZuWlstSvvufEL5jvYIyGzSSq/AaCAhpo52yecjT+xNFxgzM0IcQW3FSNJJkiqdO/JiB3e6i+6RSZZaztFri9SckdeI18QH8ttR76oWieSDI/6TeOgMcYdY64CrYrS5pS6eQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6426.namprd12.prod.outlook.com (2603:10b6:208:3b5::12)
 by IA1PR12MB6283.namprd12.prod.outlook.com (2603:10b6:208:3e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Mon, 12 May
 2025 22:24:25 +0000
Received: from BL3PR12MB6426.namprd12.prod.outlook.com
 ([fe80::3e7f:241b:d574:95b4]) by BL3PR12MB6426.namprd12.prod.outlook.com
 ([fe80::3e7f:241b:d574:95b4%7]) with mapi id 15.20.8722.021; Mon, 12 May 2025
 22:24:25 +0000
Message-ID: <b7a5e00a-a744-4824-bfac-fd9caed1726b@amd.com>
Date: Mon, 12 May 2025 18:24:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: amd-isp: Add ISP i2c-designware driver
Content-Language: en-GB
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org,
 mlimonci@amd.com, krzk@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com,
 Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <20250424184952.1290019-1-pratap.nirujogi@amd.com>
 <fc126869-15f4-48f1-a44c-30c45f8dd2ec@wanadoo.fr>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <fc126869-15f4-48f1-a44c-30c45f8dd2ec@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::8) To BL3PR12MB6426.namprd12.prod.outlook.com
 (2603:10b6:208:3b5::12)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6426:EE_|IA1PR12MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 29884c59-2fcc-46c7-ac88-08dd91a3c051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXUvRjExOTJvZ2g3RVNWaTRtb2ZYaEt1MWR5Um5VcTNxNEpsQ2c5TUZ0ZVBI?=
 =?utf-8?B?VmFBWFN6UStGbFRvV0FORUZvNE9WWWpEL3p6RkQxNnR2MXhrUEhrb2tnb0ZR?=
 =?utf-8?B?Y1RvMTQwbGdGS1dqc0tjOXdPa2hTenltd3B0TXNNL0E5d0h3SWFOeVBZQ2Vj?=
 =?utf-8?B?R0lOYlNMZ2FEZDluait0djFtcGFQSEtIa1FkQU9zVFkzWmU5NlRyU0lOYmtn?=
 =?utf-8?B?VENtU21uVFdXeEF0a3h2UWIrNmM3ak1OVm1oUlZ4TDc1TEdSNlJORXZML3F6?=
 =?utf-8?B?am9iSEhGdnM0cXlLQUpPWkxqaFVub2VHa0R4VUdvYSt3RWNEVjlvd1l5L0dl?=
 =?utf-8?B?Y1VsSjJKQzVrNEJ1LzBXOVlNcnVzN2RsNklmNk82dXpqM1VyNGpUaHh6NVg3?=
 =?utf-8?B?UG01T1VCc2c1bTZLWWNhTytURlNLeFBYK1Y0b1pyZ3Jad1p4bENaNEFVTFFH?=
 =?utf-8?B?ekx5RVEvUHNkYXc5TnVyK0c4VnVkenVoZndjV1U4eERnOUIzYlRuUG5DakY1?=
 =?utf-8?B?SkxSNDk1azBMdEFwWTBlQ2JFeGEvMytyZnpuMlp3eXY5RVJ4d08xazFrZzc5?=
 =?utf-8?B?YlJsVGxDb3pOYzM2YmM5ZFZERUNlUTVyVWltRUZ2V1RYVEgzaEN3N05pQkE0?=
 =?utf-8?B?ZHZWWGlIQ081TzkxSi9yTGcrVWhZTDRkUFpzRE8vWVlLMTB1aDg0dXRMLytB?=
 =?utf-8?B?eUJFZThoZVo2WWpOU2xIeUxzV0FjU1AycEZDd21aN0NLRkZaaWFMS0lHc05B?=
 =?utf-8?B?T0w2eW5Hbi90MXNycGZMUmUrQjZTK0w0MmcwdkV1Zk5sRXF1alc5dUpQR0ZB?=
 =?utf-8?B?Z2xscS93Tzk5dGZNTjhJd1h4Ry9zQXZ0Rng2NUZFRzhEc3g5V2NXdWdFaWlK?=
 =?utf-8?B?V0I1Q1p4bEwzblJQYXQvbktlSHczK0loZ3FUektQbTBMMDdUOFB6cUR6djky?=
 =?utf-8?B?S0U1TWZ5dEZyRDdadk1qTlg0cDNMZHo2ZUc1ZFRJbzA5R0s2UHBBS2ZzMTZT?=
 =?utf-8?B?QzVhQXBscEVKWm1OTlJTcEJUTUlvVm1UN1lLSTRJalBJcVFaakEraElITGx4?=
 =?utf-8?B?S1BBV1duRWxaTk9CV2lKRmIrbnlWTjBDbC91akRNQ3ZUVHp5eVd3dnc0RVlx?=
 =?utf-8?B?dGRJZnpSSlBsNllUaklFd09lZ1lZK3IxT21jbGJFVTIzc1hObDMycTVBSElM?=
 =?utf-8?B?YWx0ZXJzeXE2YVBwSGNmWEhSUzh1SnZBOFNBVllJYXpWenNhMTRKZUpnYnFY?=
 =?utf-8?B?YjEyMGVndFJwRFo4QktjTGJwc1RDQVBQa2M3dUVLWUQvdXk0T0txWS9DVDBF?=
 =?utf-8?B?LzhvR3h5R1JBclptVGtSQmt4K0NrMDd0UjJ2L2FrT0VTenhnbHZEd0F6Wmtv?=
 =?utf-8?B?TGllcjNqODBhSmQzdWFUYlFGMXNNSTNxMk9yeVdIb2ZKT3piSEZKeUhEa0Ex?=
 =?utf-8?B?UGFWYkVGVEVjTURiSUZwTCtFTnNtRnY3UTdrY3pIQ1l6NDFkSmovK2JBeGtK?=
 =?utf-8?B?QVpvU01mUDlSTEovVHRUQjU1bnBjMXVocHZHbFBBOHNDNnhVSzYyVUhCZHgx?=
 =?utf-8?B?a0NBTzl2RGFteVVZQ0JCdTVrTWYvK1NjZUxzNjlHb2lOdHN1T3ZqNm1GU05l?=
 =?utf-8?B?aFlMcjh3WlJHenJyeUpqNWlkb1lDazVRd1Fpb2NiaWxicjFvZFRaTDFvY3A0?=
 =?utf-8?B?a1hKQ0JaUDFsQ1FSVTRId2w5VC9pc2QxTE5QTkY2ckZsVWhSRFVVNlZ3RlBQ?=
 =?utf-8?B?Y1ZNS25jVlYycXZZbHhVc29sbC92RFRHOElrUncreVRpK1hLNDY1aG9QNktG?=
 =?utf-8?B?MlBtYTlXa3I5ckZMZkFxRzVKVnlTZ2N5QUE4VTZHLzR4WW5yVkJxbW9OREdQ?=
 =?utf-8?B?U2t2YWJJMVVZNHBHTWN5MUpHQlc1VUthcitaUUsrNHFvNlgyZ3lMaklWb0lx?=
 =?utf-8?Q?wnR8/9rgP4Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6426.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cG5zYjFQckVzOCtaclZPOTI2K04wcmFWb1RrZlR4ZTZMc0F5RmRhNnNYZVUx?=
 =?utf-8?B?VWIwbjNYTnlzQ2owUmFjdXkyeTY3bXo1N1ZRTjJjdzdVNTc0cTF5UlE2NVVF?=
 =?utf-8?B?OGRGWjV5dDBUN2x3azBmK1pXNVlYaXJ4cEtxcldJWTl2ajNRMlBPemhoSkw1?=
 =?utf-8?B?QVZpY2h5N2p2aGdHRU9CWjBwS0RHZU03OWpOckNZRTNTZTBxSUE1V0JIUVpE?=
 =?utf-8?B?bXA5MG9ZcWdyaW5qc1puL2dBcTFJSW4vK2R4eWExR2NqZ3lINUhDeWhybUsv?=
 =?utf-8?B?aURSdFF1Um9hRHkyeHo0WTA2dFQrY1ZvRFBGZVFBWWd0RWtOQUFrbTkwZU9L?=
 =?utf-8?B?R0xDOG9LRThpdU54Yi9ZQlQxYkNTc1dXcjhvWWVNK01lTTdxblBobEI1bS91?=
 =?utf-8?B?YmdSZG41Ujl6c3VzL3hwOFFUU04rZ3ExN21oRmpRcUlZcFY5RmR2SmhQUTd0?=
 =?utf-8?B?ZGE2b2h2ZmhWZkI4WThteDlsakRPbnptS254ZFdTSjhnUE9hdk9Lc2VOT1Bh?=
 =?utf-8?B?aEJiS0xzZjh1NjNXRURWaGw1NkhESy95eE94YlI3ejJkQVRZWGUzck93RXlz?=
 =?utf-8?B?dkd5TU92Tk1EaUVLaXl4aEFTbE5hQW5qMjExQzhvYVFGVUc3UThpeTVRV21o?=
 =?utf-8?B?VTZKampsNlhLa0g5Qno2T3JIQTBwNUFham14WlhPai9pS2tkaWRVNnFWMTZH?=
 =?utf-8?B?R0NIUzlISmRaSW11WmtGSEpKL3d6ZDAvWThQNDBvRDVuRFdpMTdXWjFXOUFE?=
 =?utf-8?B?WEZDRDkxczFmR1lSMDRtVG9RUzh4bDhVOFZzLzZSTzJhSDZzajJzaUJwdzhQ?=
 =?utf-8?B?Z3gzOHRvV2x1NnpWVTNBZUN3MzU3N293VUs5c0JkOWhqUXI3K1JrRVBkSGxU?=
 =?utf-8?B?Ti9HY3pOcjdlVkpTbVE2SnlyaFhrYlM4TDZid1pONmlYUkJLUGM1eWZEcHlK?=
 =?utf-8?B?S0loVzBDa2M2R2phNFRJMSthbDRVTC9sbXlzd25zYkg2YzVkd2IwZUEwTDNQ?=
 =?utf-8?B?NkwwaThYSW94YlVJRjhlblpHMWV5WVRkcG1VSTRkeXJhclFXSUpTWWpKaktB?=
 =?utf-8?B?Tk5pOUEwamdDczg4VVUwNDNNMjQ5QSszUzNXODlJeW15Q2RSN0hVY1JMNEs0?=
 =?utf-8?B?TTlxeFRtU01zT3hIMTgxUWVERHpyUmJRZGozR2lPY01oS2tMRUw4MTJzeHA3?=
 =?utf-8?B?NkJPUmx5ZHpMRHZ6T09yMDhuUGoyVEZSK09COVZiaGw3MldkVkJ0dVk3YnlK?=
 =?utf-8?B?NW8rOWVqZ0d3S3drZkxoNEl3WHl1R25TUnRBTE1oNnFqQ0JOY01MZ3NMZmRU?=
 =?utf-8?B?ZGIySFovYnVvdFBMWVV1WTlKZEVOSGVWa1MzekxSU0Z2dWlEeldvUU9UMjRF?=
 =?utf-8?B?bHU0ODlHVDRrVnY5NmNvNk9BUGkrVTFtMDBrUGJTYXF3TU9INWNVRy8rNzlE?=
 =?utf-8?B?Wm5SN2pMYnNNQ3dMNVYvc3J2Y2JIYjEyclZFNXQxc2NRS3VYc0xoOW1uTGQy?=
 =?utf-8?B?elJqREJvSHBXWlJ0SHNEeG1ybDdUZ0dlWkFjbVQrS3ppOUNJaWFDaEVsTlh2?=
 =?utf-8?B?SktKaSt0Zmc4WTFsMXg0Y21ldVNtNXVZcFVmKzdBbXJtY2FCdDNNUTd6WnRH?=
 =?utf-8?B?MEFQdCswclMydzl3WCt5YlJQaXdiYmFOa2h2a0JPRlVPcEJXdjl0Qzh1THl5?=
 =?utf-8?B?d1A0MXNKNWJNeEZ5b2ROeTNaak02cWdvbExWdUkzVWpKT2thdzViQ0QzN1Fq?=
 =?utf-8?B?MGpqWlFmNkdJLzJmdS95K2szeTJESStWZXJHYnB0R2YxaHhEeDVIb1NGY0dH?=
 =?utf-8?B?YnEzdzlNdnJ1aXRzcEpEOVFvUnB1NS8zUkh3MHdmSjkzUmZFM00zb0Vob2ht?=
 =?utf-8?B?VDFDVlo1Y2NTZTk4Vm1iTmNZYUhvbmVXR0dVNzF5aURaWnZZa0pBQ1AxYWpz?=
 =?utf-8?B?UDVDelVCWjNZcW0zdGk5YlFlZ3VVdmdsQ2Y2Q3dVeW04citudFBuclVoTlZm?=
 =?utf-8?B?QzVyc0FuaEVFK3RiYm43UW83K0ZoVFBMd0VMSHl1ZlI2MzIvMVlmc3czWmti?=
 =?utf-8?B?N3B6UlNXSmgzeWpsNVJtMlcrOHY1QUtLQXVFRi8xTHovT2F3YnlmdU5FczB4?=
 =?utf-8?Q?bOe90FxxBntZ+VeRd1PJ0mAO0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29884c59-2fcc-46c7-ac88-08dd91a3c051
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6426.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 22:24:25.2631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MQxqS0WrnLpynPE90gPz9q82ByFnVGajlbVvFkczIX89R5YDhz1nm1ApY+dODEJ2/sJ814EWaI4DPWpv5qvNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6283

Hi CJ,

On 5/9/2025 3:11 AM, Christophe JAILLET wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Le 24/04/2025 à 20:49, Pratap Nirujogi a écrit :
>> The camera sensor is connected via ISP I2C bus in AMD SOC
>> architectures. Add new I2C designware driver to support
>> new camera sensors on AMD HW.
>>
>> Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
>> Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
>> Co-developed-by: Bin Du <bin.du@amd.com>
>> Signed-off-by: Bin Du <bin.du@amd.com>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>> Changes v1 -> v2:
>>
>> * Remove dependency on exported symbol "isp_power_set()". Use 
>> pm_runtime ops to power on/off ISP controller.
>> * Remove hardcoding adapter id to 99. Instead switched to use 
>> dynamically allocated adapter id.
>> * Cleanup header files.
>> * Replace subsys_initcall() with default module_init()
>> * Update copyright header and license info.
>> * Update MAINTAINERS details for i2c-designware-amdisp.c
>> * Fix coding errors based on review feedback.
>>
>>   MAINTAINERS                                |   7 +
>>   drivers/i2c/busses/Kconfig                 |  10 +
>>   drivers/i2c/busses/Makefile                |   1 +
>>   drivers/i2c/busses/i2c-designware-amdisp.c | 205 +++++++++++++++++++++
>>   4 files changed, 223 insertions(+)
>>   create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f31aeb6b452e..65b6d985e1ed 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -23519,6 +23519,13 @@ L:   linux-i2c@vger.kernel.org
>>   S:  Supported
>>   F:  drivers/i2c/busses/i2c-designware-*
>>
>> +SYNOPSYS DESIGNWARE I2C DRIVER - AMDISP
>> +M:   Nirujogi Pratap <pratap.nirujogi@amd.com>
>> +M:   Bin Du <bin.du@amd.com>
>> +L:   linux-i2c@vger.kernel.org
>> +S:   Maintained
>> +F:   drivers/i2c/busses/i2c-designware-amdisp.c
>> +
>>   SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
>>   M:  Jaehoon Chung <jh80.chung@samsung.com>
>>   L:  linux-mmc@vger.kernel.org
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index 83c88c79afe2..adb2910525b1 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -592,6 +592,16 @@ config I2C_DESIGNWARE_PLATFORM
>>         This driver can also be built as a module.  If so, the module
>>         will be called i2c-designware-platform.
>>
>> +config I2C_DESIGNWARE_AMDISP
>> +     tristate "Synopsys DesignWare Platform for AMDISP"
>> +     depends on I2C_DESIGNWARE_CORE
>> +     help
>> +       If you say yes to this option, support will be included for the
>> +       AMDISP Synopsys DesignWare I2C adapter.
>> +
>> +       This driver can also be built as a module.  If so, the module
>> +       will be called amd_isp_i2c_designware.
>> +
>>   config I2C_DESIGNWARE_AMDPSP
>>       bool "AMD PSP I2C semaphore support"
>>       depends on ACPI
>> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
>> index c1252e2b779e..04db855fdfd6 100644
>> --- a/drivers/i2c/busses/Makefile
>> +++ b/drivers/i2c/busses/Makefile
>> @@ -58,6 +58,7 @@ obj- 
>> $(CONFIG_I2C_DESIGNWARE_PLATFORM)                       += i2c- 
>> designware-platform.o
>>   i2c-designware-platform-y                           := i2c- 
>> designware-platdrv.o
>>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)     += i2c- 
>> designware-amdpsp.o
>>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c- 
>> designware-baytrail.o
>> +obj-$(CONFIG_I2C_DESIGNWARE_AMDISP) += i2c-designware-amdisp.o
>>   obj-$(CONFIG_I2C_DESIGNWARE_PCI)                    += i2c- 
>> designware-pci.o
>>   i2c-designware-pci-y                                        := i2c- 
>> designware-pcidrv.o
>>   obj-$(CONFIG_I2C_DIGICOLOR) += i2c-digicolor.o
>> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/ 
>> busses/i2c-designware-amdisp.c
>> new file mode 100644
>> index 000000000000..ad6f08338124
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
>> @@ -0,0 +1,205 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Based on Synopsys DesignWare I2C adapter driver.
>> + *
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include "i2c-designware-core.h"
>> +
>> +#define DRV_NAME             "amd_isp_i2c_designware"
>> +#define AMD_ISP_I2C_INPUT_CLK        100 /* Mhz */
>> +
>> +static void amd_isp_dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *i2c_dev)
>> +{
>> +     pm_runtime_disable(i2c_dev->dev);
>> +
>> +     if (i2c_dev->shared_with_punit)
>> +             pm_runtime_put_noidle(i2c_dev->dev);
>> +}
>> +
>> +static inline u32 amd_isp_dw_i2c_get_clk_rate(struct dw_i2c_dev 
>> *i2c_dev)
>> +{
>> +     return AMD_ISP_I2C_INPUT_CLK * 1000;
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>> +{
>> +     struct dw_i2c_dev *isp_i2c_dev;
>> +     struct i2c_adapter *adap;
>> +     int ret;
>> +
>> +     isp_i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_i2c_dev), 
>> GFP_KERNEL);
>> +     if (!isp_i2c_dev)
>> +             return -ENOMEM;
>> +     isp_i2c_dev->dev = &pdev->dev;
>> +
>> +     pdev->dev.init_name = DRV_NAME;
>> +
>> +     /*
>> +      * Use the polling mode to send/receive the data, because
>> +      * no IRQ connection from ISP I2C
>> +      */
>> +     isp_i2c_dev->flags |= ACCESS_POLLING;
>> +     platform_set_drvdata(pdev, isp_i2c_dev);
>> +
>> +     isp_i2c_dev->base = devm_platform_ioremap_resource(pdev, 0);
>> +     if (IS_ERR(isp_i2c_dev->base))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(isp_i2c_dev- 
>> >base),
>> +                                  "failed to get IOMEM resource\n");
>> +
>> +     isp_i2c_dev->get_clk_rate_khz = amd_isp_dw_i2c_get_clk_rate;
>> +     ret = i2c_dw_fw_parse_and_configure(isp_i2c_dev);
>> +     if (ret)
>> +             return dev_err_probe(&pdev->dev, ret,
>> +                                  "failed to parse i2c dw fwnode and 
>> configure\n");
>> +
>> +     i2c_dw_configure(isp_i2c_dev);
>> +
>> +     adap = &isp_i2c_dev->adapter;
>> +     adap->owner = THIS_MODULE;
>> +     ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
>> +     adap->dev.of_node = pdev->dev.of_node;
>> +     /* use dynamically allocated adapter id */
>> +     adap->nr = -1;
>> +
>> +     if (isp_i2c_dev->flags & ACCESS_NO_IRQ_SUSPEND)
>> +             dev_pm_set_driver_flags(&pdev->dev,
>> +                                     DPM_FLAG_SMART_PREPARE);
>> +     else
>> +             dev_pm_set_driver_flags(&pdev->dev,
>> +                                     DPM_FLAG_SMART_PREPARE |
>> +                                     DPM_FLAG_SMART_SUSPEND);
>> +
>> +     device_enable_async_suspend(&pdev->dev);
>> +
>> +     if (isp_i2c_dev->shared_with_punit)
>> +             pm_runtime_get_noresume(&pdev->dev);
>> +
>> +     pm_runtime_enable(&pdev->dev);
>> +     pm_runtime_get_sync(&pdev->dev);
>> +
>> +     ret = i2c_dw_probe(isp_i2c_dev);
>> +     if (ret) {
>> +             dev_err_probe(&pdev->dev, ret, "i2c_dw_probe failed\n");
>> +             goto error_release_rpm;
>> +     }
>> +
>> +     pm_runtime_put_sync(&pdev->dev);
>> +
>> +     return 0;
>> +
>> +error_release_rpm:
>> +     amd_isp_dw_i2c_plat_pm_cleanup(isp_i2c_dev);
>> +     pm_runtime_put_sync(&pdev->dev);
>> +     return ret;
>> +}
>> +
>> +static void amd_isp_dw_i2c_plat_remove(struct platform_device *pdev)
>> +{
>> +     struct dw_i2c_dev *isp_i2c_dev = platform_get_drvdata(pdev);
>> +
>> +     pm_runtime_get_sync(&pdev->dev);
>> +
>> +     i2c_del_adapter(&isp_i2c_dev->adapter);
> 
> Usually, this match a corresponding i2c_add_adapter().
> 
> For my own understaning, in which function/calls path is it hidden?
> Is it needed here?
> 
> CJ
> 
i2c_add_adapter() in this case gets called in probe. Please refer the 
below call sequence for details.

amd_isp_dw_i2c_plat_probe()-> i2c_dw_probe()-> i2c_dw_probe_master()-> 
i2c_add_numbered_adapter()-> i2c_add_adapter()

Thanks,
Pratap

> 
>> +
>> +     i2c_dw_disable(isp_i2c_dev);
>> +
>> +     pm_runtime_put_sync(&pdev->dev);
>> +     amd_isp_dw_i2c_plat_pm_cleanup(isp_i2c_dev);
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_prepare(struct device *dev)
>> +{
>> +     /*
>> +      * If the ACPI companion device object is present for this 
>> device, it
>> +      * may be accessed during suspend and resume of other devices 
>> via I2C
>> +      * operation regions, so tell the PM core and middle layers to 
>> avoid
>> +      * skipping system suspend/resume callbacks for it in that case.
>> +      */
>> +     return !has_acpi_companion(dev);
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_runtime_suspend(struct device *dev)
>> +{
>> +     struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +     if (i_dev->shared_with_punit)
>> +             return 0;
>> +
>> +     i2c_dw_disable(i_dev);
>> +     i2c_dw_prepare_clk(i_dev, false);
>> +
>> +     return 0;
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_suspend(struct device *dev)
>> +{
>> +     struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +     int ret;
>> +
>> +     if (!i_dev)
>> +             return -ENODEV;
>> +
>> +     ret = amd_isp_dw_i2c_plat_runtime_suspend(dev);
>> +     if (!ret)
>> +             i2c_mark_adapter_suspended(&i_dev->adapter);
>> +
>> +     return ret;
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_runtime_resume(struct device *dev)
>> +{
>> +     struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +     if (!i_dev)
>> +             return -ENODEV;
>> +
>> +     if (!i_dev->shared_with_punit)
>> +             i2c_dw_prepare_clk(i_dev, true);
>> +     if (i_dev->init)
>> +             i_dev->init(i_dev);
>> +
>> +     return 0;
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_resume(struct device *dev)
>> +{
>> +     struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +     amd_isp_dw_i2c_plat_runtime_resume(dev);
>> +     i2c_mark_adapter_resumed(&i_dev->adapter);
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct dev_pm_ops amd_isp_dw_i2c_dev_pm_ops = {
>> +     .prepare = pm_sleep_ptr(amd_isp_dw_i2c_plat_prepare),
>> +     LATE_SYSTEM_SLEEP_PM_OPS(amd_isp_dw_i2c_plat_suspend, 
>> amd_isp_dw_i2c_plat_resume)
>> +     RUNTIME_PM_OPS(amd_isp_dw_i2c_plat_runtime_suspend, 
>> amd_isp_dw_i2c_plat_runtime_resume, NULL)
>> +};
>> +
>> +/* Work with hotplug and coldplug */
>> +MODULE_ALIAS("platform:amd_isp_i2c_designware");
>> +
>> +static struct platform_driver amd_isp_dw_i2c_driver = {
>> +     .probe = amd_isp_dw_i2c_plat_probe,
>> +     .remove = amd_isp_dw_i2c_plat_remove,
>> +     .driver         = {
>> +             .name   = DRV_NAME,
>> +             .pm     = pm_ptr(&amd_isp_dw_i2c_dev_pm_ops),
>> +     },
>> +};
>> +module_platform_driver(amd_isp_dw_i2c_driver);
>> +
>> +MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter in AMD ISP");
>> +MODULE_IMPORT_NS("I2C_DW");
>> +MODULE_IMPORT_NS("I2C_DW_COMMON");
>> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>> +MODULE_LICENSE("GPL");
> 


