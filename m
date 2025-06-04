Return-Path: <linux-i2c+bounces-11237-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B25ACD594
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 04:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AF6717B55E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 02:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE77174EE4;
	Wed,  4 Jun 2025 02:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nMmFsdGt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACA015199A;
	Wed,  4 Jun 2025 02:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749003946; cv=fail; b=nrvbB1s76VATakSWejdORM62Tg+WeW4nP/kCs5x0AqTNTFoaGj0njzCUHiPekSTgRkepgoVS/eoLW9X1febO2+RBf/vOGrNpSrVHIzBbgtOrAvcPw6zrpDcHbYolHo0YbzvZ7SKsvHbPzYIhHCylEtYpxnp6fv+nZUCNBeRQipA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749003946; c=relaxed/simple;
	bh=onA66n+81OR/QGcGBKspwqAbGGXGwIikNSdxpg9dfE8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MwW1/PPfkak+kxLLrgj19CqQbbhwjCt7StgXKXXYp86jDkcmbtucHn6Zy03Fm1sY1MtWXEXryNSHLQo3eU1i6KM5TWaYzPLnAQ5VE1tbOSJHyoCsviDDsCkrID7lNXahGSQRPeyp7TUCq5YkU6e3XIGZzsQ1KNcGdojtfpd4f2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nMmFsdGt; arc=fail smtp.client-ip=40.107.236.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6Xn+fR16W0v9nkFTMTyhGgmC+t14iDprnkiOzFPuFmyQgzZK6NVGYKH5iwNdvcTCz8F467Q9dPMw23mtuXBbISgk9vE4MOa6xVJ5ca/02h15fnRHTdOo2uEYwcO8zmPoqbaRm2WL+tXCln76doR325ucC+U+WSwhigyG91drzZSQ7+E/7AOUgppdAjtV8wkTEFZ0x0S2lpYL0vvc5vm6Nsr2z4x219Pv5Py1bWFFr7uI1caogC7dCao0vLF6Bkng7P9rD5BCECvxS1XW9Cwd1R5a3y9TX1a4MvToDZig8L8WqF9Edmmdi+sYHe7XRw3nFZQXqAXXuBeKbqtsicwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzs+0SMTRaKANIkqyhuzYd2CsJ7dQUzhQCHXQ/neRAk=;
 b=eIemowIgvb55+xhib9CfwZ2+gS/aGsOMs+ev5CdKJmIiUyCBClkJEnizZV/dOmH7x3jAZsuAVtKv3/QZSW38j73TJ6/U1KRSVdLfg53VX4zWlqndpmylOi91iNCzefq8pAnXgfRd/ooo2sD1S1BZ6GEkZKDjslhUPU6q+vEBvSSKJlABHTNhZ707NmjkIsvy//j8OaWvFKVTUx1JTGhEzfM4O6HehEmU5i+CaYynI2l7Hcaa9EmWW37Ygqlt2TrqL6mDExB8zKx36qawy771fAGDBxkq9t6cRd0fbBCbLm9scbidQWnPORQntAOYvxCrEJRl3GwqpjpDGJyzYDmiWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzs+0SMTRaKANIkqyhuzYd2CsJ7dQUzhQCHXQ/neRAk=;
 b=nMmFsdGt0NXEpZQfS0PF9SaDtDjmG1vRQ5Hb7Eufy7fjyGWzXasXawotJQgOuIYw7oOzo4qOXQKRKZP59KItKp4CKOIzPoCFc8hxv4MIh4xfXsK1I26GalZ4yvV6gSOZFYlp+TvPDYqEPj++feQicOUX8V8Dt6jykcu+OsfOGq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 SA3PR12MB8023.namprd12.prod.outlook.com (2603:10b6:806:320::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Wed, 4 Jun 2025 02:25:41 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8792.033; Wed, 4 Jun 2025
 02:25:41 +0000
Message-ID: <ff31349a-288d-433e-aaa6-08111224071f@amd.com>
Date: Tue, 3 Jun 2025 22:25:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i2c: amd-isp: Initialize unique adpater name
Content-Language: en-GB
To: Randy Dunlap <rdunlap@infradead.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250603214611.3039787-1-pratap.nirujogi@amd.com>
 <20250603214611.3039787-3-pratap.nirujogi@amd.com>
 <f80360f4-0d17-4464-8ede-21bae10dcfd8@infradead.org>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <f80360f4-0d17-4464-8ede-21bae10dcfd8@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0095.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::18) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|SA3PR12MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d3c30f-8d81-4f07-e770-08dda30f1a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGhham1mSkpvekRJZ3BoelJZVHUzVTIzYnFxNVV6Rm1qdnliTjRhQlRTdWRK?=
 =?utf-8?B?eG9CTU9jRWhKM0NEZEt0UWlrSGM5REZMQW4rbGJSclh6SGtoT1o1bVNScmwr?=
 =?utf-8?B?RHhvdjBLUi9pTGRFNzJyL0dMTy9zZTBXNkQwK3BjR3NXY3JjVVZjdk4ycGZj?=
 =?utf-8?B?NHo0Ukh1TXpRbERrVmlpTFJRczhPYTgrem01S05Ud0NSWWRBUFpjZlh6MVdn?=
 =?utf-8?B?bjVEdk9COS9NQ1pybEI0Slc5VXBETks3VnI5NEtzWDg1UGpna0E3YjZBVi9v?=
 =?utf-8?B?WTVndE1Hb2Vham80d05lckVHRm1ITnA3RkYvd3ZaUFZmNjFzdWdQVXQ1aGxh?=
 =?utf-8?B?SGlXQWREdFhReWdLdXVoSnVEQXBGMlREQnhUbURvLytJWERrd3RvVjF3TVZ1?=
 =?utf-8?B?bTM0SW8rbEhyMkc1UDJSNUFCenBVc1ZCd21jR0F0TVRXTVl3QVI5bnEzaXdx?=
 =?utf-8?B?SjRwSTJEY0NiaGJVY0lCUUgvL200ZkI1VEVxU1AxQXVRSHVMZnprdjdJOUgy?=
 =?utf-8?B?elV1WUFZeG1lazFhRDF6K0N1N2k5djdqVFJ1RTRyQnFkaXlPTzhJZFFjRWpT?=
 =?utf-8?B?b2Q1b01iaVpybEJvNldxZDloakRHVURkUjFJNFFXempBUmttbWNRa0xCbHB2?=
 =?utf-8?B?dkloMklkeFhtYkc4T0xPUjhiMHI4K2EzMTlVMy9ZdTJudnJUd3pocFR1QXEv?=
 =?utf-8?B?UWRoR0hReURkcGlpZXNEWDJLNUZmMER4UUpQR0xSUkxKbUhiU1FMVDl4SkMx?=
 =?utf-8?B?VXM3SmNsVnErbEcwVGdNRnlsSTRRNUhTaDFCemcrUm16Q0kvQWNxV1Z3UXA3?=
 =?utf-8?B?RjZ5VlZMZGhyUlZIdlZ5RWllRGtXTWlBTjlReHhPb1lNQXU0cW9tZGtoMWMz?=
 =?utf-8?B?VmRhclBTV1FEWklmRGpJSU9rUUlQOE9PQ2xvUjAzd0k0S25yT2FPK05OWWlC?=
 =?utf-8?B?aDV1MDA3a2pwcEpsZ3g3d3oxekRNOGJSOXgzZ2FKbTNPQkxMQXdFRVZLME9I?=
 =?utf-8?B?L1Q2ei9JRUlUNElUN2pMYnN4bUc1aHh5THp4dDRtWXNLRFR4ZzQ3M052cGhK?=
 =?utf-8?B?VTRQWVFTZFRudjFJeWlFUnNNTkM4ZDhuRWMrUHRBRVJ6a2dSU3JYV0d3TzBV?=
 =?utf-8?B?T0VGQ3N2Vnk1b2FyUEQ3TnVjemxrWWxFL1dRMjZIWGFPZWJJbFJTOXBVZC93?=
 =?utf-8?B?UWFLSmZnZE8wSE5LN0ViTlM1TnlXR20zcTlKcXhtdzA5MXFjRzV6RXBBVWZz?=
 =?utf-8?B?ZnF6Y0FIb1R3bkVIUmRUcm8vaVJ2TTNOaEE5aDNUcy96K0dNeUhyem9XMVBk?=
 =?utf-8?B?bFAxTFhaNXoxYTZSVFpoRVp2RHJzZ3dDRmhWaXdQdDY0eTk0dmh4M1JpbDE0?=
 =?utf-8?B?Z1h1dmh0SFB5eE5mS1JhaE5WSUR1M3BSTnlXVXNOQm5LZWY3Wm9hUFRrNjJM?=
 =?utf-8?B?c3dnRWdiVG9hdTA4bDNESE9Fdm1TeW9ZMDAwemZBK1dMZFIrZWRoMXJpUG1U?=
 =?utf-8?B?TDZvdWRwZ3JlakQ5ZUF3dmNWb3JXQW53Y29uOC9RaUlOVmROaEdXMjBTN2Vu?=
 =?utf-8?B?QmdmaXpsZ2xkVmRZRnVPazk2S2xmNmp5Q2ZWYy9CRlRLTGtvRlhjVndUQU82?=
 =?utf-8?B?b0Y2WUNUcGtIUkJaNS9Qci9IMU9Ra3dHZk95UFZTVXpPenJ3N2VBangwOHcx?=
 =?utf-8?B?RGdqK1VPREZqU3FZZGJwUTlqVzZMNUhvYjJIeGZ5QTJyazBIblJNSW1QRVly?=
 =?utf-8?B?VEJDRWt1ZFhwME16YzF6d09tVUVDSHhVanZkazNSckFBWEJoNUR5QW43Tkc2?=
 =?utf-8?B?NGxqNmNKNVZ3eXBkWVpZMGZZcExxcEE2YUlBc1I0OGdDakVmZkRsSWhSVkZ6?=
 =?utf-8?B?ZGV2YlZHRHhLQjhrOEVHWnAwM093cVp2VUVYcUtodmRkTzRrV2JBajU4MlUv?=
 =?utf-8?Q?0CQku6TBmso=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3c2K1YrbjhBTGlnaUlNRXhzK3NmeWdBbXVhV2k4b2M4S0RLeVlWazA5OWF3?=
 =?utf-8?B?Tzl5K2NvamlsQXJmTS9jQnNabnpRVFpFSEJNN3ZmZzRFQTM4SGtUbGJmODU2?=
 =?utf-8?B?dEU4QnIwUFJRRUdCTUxqZFFRdStyd2dyTDFmbG9CNnp3ck52TGRFNm9qYWo2?=
 =?utf-8?B?RUJRTkpaV3BzOHRKbFJ6TTFoWVI4L0tiRERzdjZUUTdQblY5c2pFN3Q3LzRZ?=
 =?utf-8?B?WWRiM1hxNjNBdGcvODRQcjlXWWNGUFI3K3NpaVM1MEMvUWhuTWx6RFRveEt1?=
 =?utf-8?B?eEpCMUg3TWNWOEk1M0Jxelk3QTNCTW9VYjMvU01qcFRpSTN4MEhsZkhxWEF2?=
 =?utf-8?B?c0xkNngyclFaSWUrNzlxSzV3aTZvcW9RZkFvMi9rMGl3UzhmQ1VuMVVwaEtM?=
 =?utf-8?B?cE4wQVk2R25PaFZPTHBTZGs3Uis5c1hxa085eWJSTlZuckh2UmlMekQ0Qk5J?=
 =?utf-8?B?NzN4bGl0alMzcTdPRHRuN2VvUjd4VE90UzRpOGU5ajdwNktCUjhNbVZxdHdV?=
 =?utf-8?B?QkxXdHFMVTBUMmg3ekxhK2NpN1FWLzJzalVhTWZyOEpDTVVEVGVXM1RvMStz?=
 =?utf-8?B?MytrdXVtdWhJVlVHc21TelZzSFlETE9zb1ZJUm1KYURJbmZpNklSdmhpMk11?=
 =?utf-8?B?ZFd5SkM5QzJhU2MwTnI1ajA4eWwzeWN6YUhDNnArbVlFWmNlYmphdnNlZ0hm?=
 =?utf-8?B?RG1vOE9lRXNBZDh5V2dkbXBQdHh4cDhoM3lXQkszL2ltWVpoR2xvbWxlTVVL?=
 =?utf-8?B?REdOKy9vNXJKOGdpQisyRERGQ0ZHdEppa3dqcGwzMHEweXVBc2tqd2F6Y3hz?=
 =?utf-8?B?c2tvSDZNZXpZcEFzczRzajJIcnZkNFF5cWN6Q29zMFpZNHgxVWdCbWo1ak5y?=
 =?utf-8?B?czQrc1dvbk9IRFhYUXJYeEtwOVQzb3JKeVZlYmpqT0p1dmJDdGJuTWoydDlL?=
 =?utf-8?B?TllYY1BwUXhmRGlqQ2NDYk9lTFFaYXYyeWllUkZLNmVGVFdSVzRMQTkyK2Ex?=
 =?utf-8?B?NHlZRHY0ZGdERDZjY2JOVmJscVVnZGJnUDhxTWRDWmliUDg0UHdsQUR0TG41?=
 =?utf-8?B?MzBjSjBGN0FPQ3dJRmFuOStvWDRIa3FEQ3VsbC9tcHRVRVliUWxZdFJRc3Jw?=
 =?utf-8?B?ekNjRWRkV3BkcHRFTko2WXo2U0NjTWJxZW9EQnBwZHJFcjdodVJQdWQ3a2RV?=
 =?utf-8?B?OU0rRjY2cGhwK3MxcTc2SFBrcUdPZmd0Z2g3RW82eUpOTVd3L1pHZXBYckJS?=
 =?utf-8?B?bVd2c1VNcEpyaU9ONmh0UEk2RFFkajVYRjNqNzF3OXNjSUpuQ09GanBaRTNl?=
 =?utf-8?B?N1NYVVJrbDFhK1V2UGxyMVQ4bjlLSmM4VVQxNFdpeG1YZnF3U2hOM0JuQ1BH?=
 =?utf-8?B?UmZZdlFrUVZDUkNqcnBLM2ZkdTNBWG0vVmpDN1p6Q0xVZW5uTkhUaVg4UEZx?=
 =?utf-8?B?d2lDSzFUYmgxeGpXZkJocTRIWlNGMmNhNUEzWVJTdEIxMnV5T1J2THJEQVND?=
 =?utf-8?B?MCt4SDJMcmgybG9MUGhuV0lJNHcwSkRXcWFObndPbXFqRjFKblhzbkROZERX?=
 =?utf-8?B?S2FjR01YNXgyeXZjOWErUEVCNUF3ZTl2R0JEVVB1QlFFZ3hFazVGVVBTZW5J?=
 =?utf-8?B?MmhnRHdVUDEvNmx4K0tocWNoWS9abk9Ra0tzSXVaUStHNnVCeldIOHdTZHA4?=
 =?utf-8?B?UXdKNXhaamN1Nzl4cDFENER2M0tWckhkSExteWlvN3Q4UzRDdlhqQzJhZCs3?=
 =?utf-8?B?NVYzc1pXUG03OTRzL0FHUy9WZHVmNkc2dkc0MjlreGQ3WnJYOW5pM1p1UHc0?=
 =?utf-8?B?ZXpwVDBUK1orcWlBa05sSVl1UDU3cUZtTjV6M3RERkFycy9LR0llcXlrcnMz?=
 =?utf-8?B?bjRhWGNaYzFnbU1uaDN3c2NkZHBWQVVyZ1d3RzBsVlZ4eVQrWGNha1VDR1gx?=
 =?utf-8?B?QUdWSkwrckhkL2ZOVGlSQmkvNzRISVgvWlU2dDdxd3Q0cjJoZ2ZlS0lOSWw4?=
 =?utf-8?B?NGVIWHhsK3lkdDJtSS9pNUhZd3duRkw5cWh1REUrMHN0byt6cjhTc0xEb3E3?=
 =?utf-8?B?YkYvcjRXKzQ4ZXA4TzRHcGh3ZVBiK0Jnckd2MjdpcGNPb09OZlBUV3E0NTho?=
 =?utf-8?Q?sb7lQpj30RxtKdUUypVihwws7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d3c30f-8d81-4f07-e770-08dda30f1a0f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:25:41.5914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQbkCS0fyY4S0zfLhzxCi0VEI0E2eonK24aA8w6o5ISZhklxtokBBhzrQUrB4rQeWDbyXCSUcXf4ZDgehrqgXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8023



On 6/3/2025 6:48 PM, Randy Dunlap wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 6/3/25 2:40 PM, Pratap Nirujogi wrote:
>> Initialize unique name for amdisp i2c adapter, which is used
>> in the platform driver to detect the matching adapter for
>> i2c_client creation.
>>
>> Add definition of amdisp i2c adapter name in a new header file
>> (include/linux/soc/amd/isp4_misc.h) as it is referred in different
>> driver modules.
>>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> 
Thanks Randy!

> Thanks.
> 
>> ---
>>   drivers/i2c/busses/i2c-designware-amdisp.c |  2 ++
>>   include/linux/soc/amd/isp4_misc.h          | 12 ++++++++++++
>>   2 files changed, 14 insertions(+)
>>   create mode 100644 include/linux/soc/amd/isp4_misc.h
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
>> index ad6f08338124..450793d5f839 100644
>> --- a/drivers/i2c/busses/i2c-designware-amdisp.c
>> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>> +#include <linux/soc/amd/isp4_misc.h>
>>
>>   #include "i2c-designware-core.h"
>>
>> @@ -62,6 +63,7 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>>
>>        adap = &isp_i2c_dev->adapter;
>>        adap->owner = THIS_MODULE;
>> +     scnprintf(adap->name, sizeof(adap->name), AMDISP_I2C_ADAP_NAME);
>>        ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
>>        adap->dev.of_node = pdev->dev.of_node;
>>        /* use dynamically allocated adapter id */
>> diff --git a/include/linux/soc/amd/isp4_misc.h b/include/linux/soc/amd/isp4_misc.h
>> new file mode 100644
>> index 000000000000..6738796986a7
>> --- /dev/null
>> +++ b/include/linux/soc/amd/isp4_misc.h
>> @@ -0,0 +1,12 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef __SOC_ISP4_MISC_H
>> +#define __SOC_ISP4_MISC_H
>> +
>> +#define AMDISP_I2C_ADAP_NAME "AMDISP DesignWare I2C adapter"
>> +
>> +#endif
> 
> --
> ~Randy


