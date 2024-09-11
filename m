Return-Path: <linux-i2c+bounces-6547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4CD9750F6
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 13:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FFD91C21228
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6B515C13F;
	Wed, 11 Sep 2024 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1FWTc+Ns"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0EB186606
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 11:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726054934; cv=fail; b=s/w+e0I3HvvocSaLMQ2ISKuPKSfgmPH+mbCyAVfE7eQsSJ7kNq10hBx3mMcrXCLdW5aEq3/xLO35yVsJFtNIiuHjr/zAEwLy+YY6Jqc4SHeftnsflMuy5QrI0vP0PbLcjoijgjCoXEy+Xc/T3sCMFRrVTRC4VJIbLqUjnBYf8U4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726054934; c=relaxed/simple;
	bh=o2Dm97d3IfHxAo3iA+QCzEwYyMxkmbtnIYD5yCe/w38=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TYCa9pwvUVfIcrmSSHaDgaRWTx9dRC9CaEF8nb+uY6en5KCmNsWOm3675ql8Lj1+c7ndpsXsGnC/gpML/F/Rx9rBJCN+TUQ2ZcxGjdo9erBeNo41MqgSemGDqFDPR8xV5GSlRatgVFuvBcMXq0rrM+GyBtELt0c500QhJgq6wfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1FWTc+Ns; arc=fail smtp.client-ip=40.107.244.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+JIqz4sH8Lt/RbmqCvGVwct6FN7JbcSwoMbxz6JEHsXB7+yt5joyP9vLD94y8F+CP8z47xHSDJe2eMKy6Wr2jcCN+MhZqpzNPI4OIGyegidqMEnW4CUj5K+KID/DMQyBGmFp3d/BDXuC9q0vSJ7BLLwbTKVNYzX9jo03bBA9ycovVUBGynXbzyCg2vw8vL5T8gxqe1XQHKjeK7AkjeiZ7ghUnUAjE/esK2luNCL4OpLbrLxlkp96Rlh638gfk0Eypwv8yfYSX3K+scE2g6IupKFByG/dswMnbZZB07hcVYtthNpNYTzBspIvBKQ58uRWD+2cvZ+jcUS/YtD6yB8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2Dm97d3IfHxAo3iA+QCzEwYyMxkmbtnIYD5yCe/w38=;
 b=ZWSZ2eZsTp1fMr5gvMf2pEm+xxEWEbiKbjFITXQPUWp7Uizifj7rvbOqO+Cb7lCZeTfCujNXP6egWIGgUZ6ogZ2NOP0+3gmi6ZfMjeorZA5RQeOduFeRFv423hVK41aTs0PSiWskDxnwFeAkR6fRosFhFW3UlyYBqJRfV8pUATJ+DcWW7Yxrx+vO7PfhHI0/7PUPCoSo+uKAT3JckxEGiTbMCexq7B4bWPNcOD1UcGbC/DFo+5xaXEcTmzBV5Q4C0wjseKWtbvZ7vZjljBZRTIZ0TpefEZhBZYGob+WTFhCLdJAUfbUP0x9ZGC0iDukWFYyCtZ+9chwcgQNHHQ62SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2Dm97d3IfHxAo3iA+QCzEwYyMxkmbtnIYD5yCe/w38=;
 b=1FWTc+Ns5IGEo6Uhhg1mNdyZI1yTvHAeFMpNybs+ZcMqS3PWG+rXZo5/6c5ww2G+IapWst/4IOfU4VkKp9Iml8k4rFT9QDe7WpT1CzMM1yfmeK5WyKTUMdUR4ebkv+sD1C22kg35ucAXL/R4mZNs1l9XPagvs3XhIiarc4wIaSo=
Received: from DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) by
 SA1PR12MB8743.namprd12.prod.outlook.com (2603:10b6:806:37c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 11:42:09 +0000
Received: from DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1]) by DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1%3]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 11:42:09 +0000
From: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To: "Simek, Michal" <michal.simek@amd.com>, Robert Hancock
	<robert.hancock@calian.com>, "ben-linux@fluff.org" <ben-linux@fluff.org>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "Goud, Srinivas" <srinivas.goud@amd.com>,
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>, "Datta, Shubhrajyoti"
	<shubhrajyoti.datta@amd.com>
Subject: RE: [PATCH v2 0/2] Xilinx I2C driver fixes
Thread-Topic: [PATCH v2 0/2] Xilinx I2C driver fixes
Thread-Index: AQJcoxcIn4ZF6I4Ml1lr2IegqWo7hbAeKiJQgAADxACBMQeTYA==
Date: Wed, 11 Sep 2024 11:42:09 +0000
Message-ID:
 <DM4PR12MB6109CF657C93DDD9096815268C9B2@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20231121180855.1278717-1-robert.hancock@calian.com>
 <DM4PR12MB61092C8804E50438DB36609B8C5E2@DM4PR12MB6109.namprd12.prod.outlook.com>
 <4d071efb-d951-43cf-a845-8eef57483643@amd.com>
In-Reply-To: <4d071efb-d951-43cf-a845-8eef57483643@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6109:EE_|SA1PR12MB8743:EE_
x-ms-office365-filtering-correlation-id: 21e87d4f-b982-47f3-302b-08dcd256c4f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cDFvKytPRXVkM2xtNURXVXdZOEJjTEVNT0FsUlBRSWxRelprajlnTWRPNGox?=
 =?utf-8?B?UTg1SXpIeFRraUE2a1Rlelo2cm1Sci9RMFNCcW1XQXh5b3V3T2FIWmFYMkc2?=
 =?utf-8?B?U3l6bzQ4bVYxOXNzS3VUWXU2ZUJmRmpkSlkwOWhYQkltQ2hDL0dYRGZWNEpX?=
 =?utf-8?B?SERTS083dmdZNGJHMGI2cENnMnpnbVZVU0IyV0w2ZmVybGRkWXFOT1BnMmlY?=
 =?utf-8?B?WExtcEZhVEtkSWtRQUthL3FZWWZ2eEg5Uy9CUlYzSVFmWFJvaVpnNE9CR2xZ?=
 =?utf-8?B?NXNzdjhDbHdqSzJqaHFDbk5Rd0drTlpSbk4xSjhhMnFuVFhTZmlzUlBRRFow?=
 =?utf-8?B?Q2dIREwrUnM1L2NBMW9tZDhkRzRjYlcvUUd3bkVwdUZoRDAwMU5mR0xEa3ZJ?=
 =?utf-8?B?eDhCb0pFRDlMVTJCRVdNT2V6ZStkSFFUOHpFRGs3VHZFV3dTQ2RJOEs0WG9Z?=
 =?utf-8?B?TVFSTktLd1FZcEU2bmgvbU42anhlSmpYUzQyZ2E0K0hHSnE3KzRsRU4rN2RW?=
 =?utf-8?B?UGxMWGh5Wi9qd3lmVjhXL09RalU3bWI3Ry9YRG10bXhPSTBQQXhJTlpYZlVG?=
 =?utf-8?B?WXNVTWNwTThtUU52c0JHN0k5cHFVbzdMQitrTTdkQ0tYdXAwK3h3R2Z0R25q?=
 =?utf-8?B?Y1pGcHpmS0NZcjZsNlBpOEZrcjc3bFBjOTFWVHJKWHZmcXBJYW10N3E0L2pK?=
 =?utf-8?B?eUtELzVucUJSb1BGbUV4M1NOblNCdWVGci80SVgzVDRmRHlITmpVM2RVOU8x?=
 =?utf-8?B?NXBRZ0lmOVM4Nk9QMUo2eEFZMzUxUnp4MUF0L2pBNXBBcXpvdTFsZGd3eHdr?=
 =?utf-8?B?UjZpVFVmODdvU2xUZkZuVnhWNWJHMHZxMloxN21nQW1tdzRUb0JtTWE0S01V?=
 =?utf-8?B?bG1jclR5blhibVhYbGRGRzNEcmM1aTNyQXdGR0dkVk9ianFlWGQ1aGFFK05I?=
 =?utf-8?B?cDlRcGJOeWxwakYySjNJZmpRM29XUlRFbnFNUFhYRUFvTWMzTStXV01KOTR5?=
 =?utf-8?B?dlRncitDcy83NkYxOGp4cG1KMSt1bEgvNUFUWVlyU1FxeU1ycGwvTnFMeGNF?=
 =?utf-8?B?SFpVajNEMCtBeFN3YWlrVENuVWlUcGx3ekJacXI1TytaNXZsUGx5RnFSSUhq?=
 =?utf-8?B?Mk1DajBCcDdIYld6TnZDbUlZZTJUY284d20yTzQ2RitrYUdpRnNhVzRmeXhx?=
 =?utf-8?B?RzZVTHQwQW56UEhTYWd2TkdYSVI2TTR3WDhmVlNkVWk1YVVjQXpoZnErZ1JS?=
 =?utf-8?B?Nk1Dd0g5cEVzSmp2S3VJM3g3RnYyTzFKRWFyUkdSZmxNVVNPV21qODBtaC81?=
 =?utf-8?B?c2dkS2MyWndCaUwvc2syeE01em83aGp6b3Jhc2dZRzgrb1ZNK0hPbGcyOHJV?=
 =?utf-8?B?VXlEd2g5b0dRMklQbHRuallveEZDNlp0cG1TZTZnYXB1SWtZSWh0RUN2TjNS?=
 =?utf-8?B?RmJPVy9mNXFqNlNyS1RiVjdTQy9HV3NDOHlsRERZWWZoYXVQbi9BcDNqS2JM?=
 =?utf-8?B?ZnBOazl1VnhlN0lPUmxwV0FTOVRwVFZONHNNeHAyazhhVTNwSWtWajdET08z?=
 =?utf-8?B?bFBXSzZBb2p0T0F3OXdYcEhrY0JGeHVaeUpYVk51alFLc2NIRkliVTVBeHR1?=
 =?utf-8?B?QWZVL01aTGcraFJrTXJIQytweXpVREJnMUsxL0JrNXlMandhVDFtV256Kzhv?=
 =?utf-8?B?UjdpOFRwTk1UQWEwUGtzb0dFNnFHa05lLzJFYTVUUGMwekZjckMyUXc0UTVa?=
 =?utf-8?B?akFOT2llTjZOQWc3RjdsLytBb1ZCY2tTOE5tSWVXZklodjFUY0l1aCtZazg5?=
 =?utf-8?B?eVZESWtxZDVPMG1sVEt0OHJhZlZlTUxrcUVVejh4V2w1dG1xRFRhK1BsanRL?=
 =?utf-8?B?clVjamtoWVhzUjZPTitqMllYK2JPaFRzQTRqQzRUZTlMbEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dVN0T3ZUYU91c045NXBnZnJHcGZPek43Z2NJRlVPbyt6dDZjTm9IYUE3dmhv?=
 =?utf-8?B?aC9pRjlTTnFYMWI1OGhnNThRU1FsTkZxRS9qVHlaT09sdjF0aWE3VHlFYVoz?=
 =?utf-8?B?QVBrM3Y0NzRFdmpXUWhvOVYyM1JKQXpMdHcwdndZd29Dc2Q5T1lNN3lBNHZl?=
 =?utf-8?B?a1ZOK1FZWE1GUnAxVC9aNDVKeW5CL2pzTVBTSDFUcjdaU2hDd0NpbDBOZHZX?=
 =?utf-8?B?V0lDa216K2lNQ2lsN1kwbE9HVGdlWG5scXQ0Z1lyM3kyZm5JTkh1ekV2dU9H?=
 =?utf-8?B?ZGU0UXk4aEQ2YlB6a3I5V25PVlZpZWRiOWdreStEZVRpWEdaY3dYOUo2RkFr?=
 =?utf-8?B?YmZkUWFvWnVkakcvZHI2TnByL1ZWQWczTTVhUExWYXNMK2ZDUityR21pakcz?=
 =?utf-8?B?VG4vd1R6VFpDMk4vRTRJd24vSnhwZ3JBUnpqY050YzVKVHRQNW5VRTg1N0c1?=
 =?utf-8?B?NUZab0YvaUc0bmgxZ0tuQUpZV3JNNlV0TXBoaXF5cCtqYXZiMldaaDNCK1Vq?=
 =?utf-8?B?SzQyeCthOFJoa0lTZXFRdmFrR1pCNnZnaDVDTlIrT253SFdRSG95eVE0THdm?=
 =?utf-8?B?YnU4YTRPTkthUjJZRjQ5RHlyTXdtWTZSd1Q4Zngybi85eFl6M05IemppNUM1?=
 =?utf-8?B?WWNGSVJ1N0N0WkVtb0Y3VEk1U09oTGptMlNDMVZEWkpkcG5zOW0zZHY3QkJH?=
 =?utf-8?B?LzlSV0ZQaGpZY2dVM3pNVitaUGZ1RXd2UU1jSGpFQXlTT2dTZW1xYSs2RmJD?=
 =?utf-8?B?NGN2S2hvOTcvMmQ3WFFMQWdRWWJKWXl6UGduK0dTRGNMYStVV2pPZkJueVZP?=
 =?utf-8?B?SFM3cVpudTR3QWFMUzJ2VnAzbklVUVlmQ0tPRkV2TDVoVHNTTWVIS0M4NlAx?=
 =?utf-8?B?ZnN1RnoyeVFJOG96KzNkaG9meWJGVVZJKzlmV0dSTFVBNmxhK0RZbTB4YzlF?=
 =?utf-8?B?dU9nNFdpQW1HL0RxSmZpL0tWQ3F4U2VDZjlOeWFkUksxdDE3YnN1eGlreDFj?=
 =?utf-8?B?bG9kNEhVMG1FQTNRN1FzVFNmdklheXVKeWt4WTBjUCs2UE9hTWY4WlYrTllR?=
 =?utf-8?B?MmwwMGduZUxtcWgrSkdlZTJCY21RcDcyZGZRemNMY0t6MHYyVzRGTHRSL2hn?=
 =?utf-8?B?RzJDQjhzSXNkdHBzUnRYOFYzUjgvYjFWRGJXUDdEZEJNOHFPLytTWXdkK1hX?=
 =?utf-8?B?N0lTUWZBV2xNNHJxTVVmNG9mTmt5b2F0KzlVcUZMYWpOS0hrZWJXUDZ4K1ox?=
 =?utf-8?B?Y2NIaEswNGxheUd6N3U3UlludVRRMDNGSVpGdURzdXlsZ0pNSkR3Mld1R29O?=
 =?utf-8?B?U1h3b2w5Y3JzbWlaR1h1T2puVytpZ0l1OVNuMnVHaWFUYmVySTZoL1V1OGkr?=
 =?utf-8?B?UlJvTFpXc1VKWGgzMXMvdTkyOXB4eFoySUxpMk43UkhDZG4yUE9tZ0xHL1lk?=
 =?utf-8?B?a3QyS3RFUHJQRGpjaVJDTXVzY0dwZ3FoNCs5a21hZXd5eEpuY09LdXB3bHFa?=
 =?utf-8?B?SDhZY1BHWmpkV3Nzc1hHSGVaZmZESmcrdzBRcDJhekFjWmNDVnZRWVRmOGl3?=
 =?utf-8?B?Q3AzcWtYLzdhVE5YVDdKWU5za2FqYjEvUnpCc0VGZUVpanpwcVhtNWlzVTQ0?=
 =?utf-8?B?dW5uUUhnRUFvUWszanoyMXUvdHp2dkZ4VDhmL2tXY0VPK3hlR0tpUjZUaUtS?=
 =?utf-8?B?STY5Z2Rnd2FVRVlSWnhEL1dvUzdlR3prdXk1bXdvSHdxd3ROM1E2L0QyRnV1?=
 =?utf-8?B?K0NwTUZFM256YWdvTi9qVk9kT3ZJUWI4Z2FpeXBsNTVESEt2QXlpcW1CV0pE?=
 =?utf-8?B?cldra0xLSzE5UlZJOGgvS2M1UnFxdTFlVUkrSWl2YjUwYWdndXJQVS9vQjJJ?=
 =?utf-8?B?bzkxUTFRQ1U2elIyOC8xRWQ4cDUwRE4zOGtCMVdyMXluWDRTRXR0S3dSSmpJ?=
 =?utf-8?B?cDNjakxMWVFocGdTVkd0L2l6U0hRRGJNRFhybzYwMzVTS3hMNDNkWUpkLzRu?=
 =?utf-8?B?a2pxRGlCOGFWbHRIdmlaSzYzTUpKSGRTWmpsa1M5VERObCtZcm1zVXpuMUtj?=
 =?utf-8?B?VFphK3BVcEpuWWhrOWdhUkN3czhibWRhWW1FRk1Xd0ZKNHIrd2xjQ291UGdX?=
 =?utf-8?Q?p/CM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e87d4f-b982-47f3-302b-08dcd256c4f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 11:42:09.2653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RZRRTxqz7v/VLPHgyHPzumJY8cREIgHEmqW+Xj8I7axgoC1uh4ItTTUS73bkfpY90FHj5b2j88pw1nCdv7o85w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8743

SGkgQW5kaSwNCkNvdWxkIHlvdSBwbGVhc2UgcmV2aWV3IHRoZSBwYXRjaCBzZXJpZXMgdGhhdCBo
YXMgYmVlbiBhd2FpdGluZyBmZWVkYmFjayBmb3Igc29tZSB0aW1lPyB3ZSBiZWxpZXZlIGl0IGRl
c2VydmVzIHlvdXIgYXR0ZW50aW9uLg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgdGltZSBhbmQgY29u
c2lkZXJhdGlvbi4NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNp
bWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29tPg0KPiBTZW50OiBGcmlkYXksIE1hcmNo
IDEsIDIwMjQgMjo1MyBQTQ0KPiBUbzogR3VudHVwYWxsaSwgTWFuaWthbnRhIDxtYW5pa2FudGEu
Z3VudHVwYWxsaUBhbWQuY29tPjsgUm9iZXJ0IEhhbmNvY2sNCj4gPHJvYmVydC5oYW5jb2NrQGNh
bGlhbi5jb20+OyBiZW4tbGludXhAZmx1ZmYub3JnOyBhbmRpLnNoeXRpQGtlcm5lbC5vcmcNCj4g
Q2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtaTJjQHZnZXIu
a2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAvMl0gWGlsaW54IEkyQyBkcml2
ZXIgZml4ZXMNCj4gDQo+IA0KPiANCj4gT24gMy8xLzI0IDEwOjE5LCBHdW50dXBhbGxpLCBNYW5p
a2FudGEgd3JvdGU6DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4g
RnJvbTogUm9iZXJ0IEhhbmNvY2sgPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+DQo+ID4+IFNl
bnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDIxLCAyMDIzIDExOjQxIFBNDQo+ID4+IFRvOiBtaWNoYWwu
c2ltZWtAYW1kLmNvbTsgYmVuLWxpbnV4QGZsdWZmLm9yZzsgYW5kaS5zaHl0aUBrZXJuZWwub3Jn
DQo+ID4+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWky
Y0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IFJvYmVydCBIYW5jb2NrIDxyb2JlcnQuaGFuY29ja0Bj
YWxpYW4uY29tPg0KPiA+PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMC8yXSBYaWxpbnggSTJDIGRyaXZl
ciBmaXhlcw0KPiA+Pg0KPiA+PiBBIGNvdXBsZSBvZiBmaXhlcyBmb3IgdGhlIFhpbGlueCBJMkMg
ZHJpdmVyLg0KPiA+Pg0KPiA+PiBDaGFuZ2VkIHNpbmNlIHYxOg0KPiA+PiAtRml4ZWQgYW4gaXNz
dWUgaW4gZmlyc3QgcGF0Y2ggd2hlcmUgYW4gYWRkaXRpb25hbCBtZXNzYWdlIGNvdWxkDQo+ID4+
IHN0aWxsIGhhdmUgYmVlbiB3cml0dGVuIHRvIHRoZSBUWCBGSUZPIHdpdGhvdXQgd2FpdGluZyBm
b3IgaXQgdG8gZW1wdHkuDQo+ID4+DQo+ID4+IFJvYmVydCBIYW5jb2NrICgyKToNCj4gPj4gICAg
aTJjOiB4aWljOiBXYWl0IGZvciBUWCBlbXB0eSB0byBhdm9pZCBtaXNzZWQgVFggTkFLcw0KPiA+
PiAgICBpMmM6IHhpaWM6IFRyeSByZS1pbml0aWFsaXphdGlvbiBvbiBidXMgYnVzeSB0aW1lb3V0
DQo+ID4+DQo+ID4+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy14aWljLmMgfCA2MSArKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQ0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzNiBp
bnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gLS0NCj4gPj4gMi40Mi4w
DQo+ID4+DQo+ID4gUmV2aWV3ZWQtYnk6IE1hbmlrYW50YSBHdW50dXBhbGxpIDxtYW5pa2FudGEu
Z3VudHVwYWxsaUBhbWQuY29tPg0KPiANCj4gQWNrZWQtYnk6IE1pY2hhbCBTaW1layA8bWljaGFs
LnNpbWVrQGFtZC5jb20+DQo+IA0KDQoNClRoYW5rcywNCk1hbmlrYW50YS4NCg==

