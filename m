Return-Path: <linux-i2c+bounces-13797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDFAC06FE4
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 17:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 821F24EAE79
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 15:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EE8322C8A;
	Fri, 24 Oct 2025 15:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bwMBLiAN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A49D2DC776;
	Fri, 24 Oct 2025 15:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320031; cv=fail; b=Q2DZ4DcLuXN6LOW+d+K209Iv7gF24wS1Rx0FCuPyfvrJpaU25Xmeze+uJ4UIAmnDhQ9lopeYuywp3QYHhLOBoTUk9Ajv6DeZOzOarIZhe0kJDUVSoTq5sEFAIwEQ5Gqj8tPfYdW/LK6PbMw6hD03hJm6kSY2UKJdagPwsIrPmX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320031; c=relaxed/simple;
	bh=h6HOq/dmF62/zyVi993M+CywODIbZJp+4J2qjrUSstY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=knEJs6FKCsuf4LeuL860o4AccAmLf/oJdvYr7RE/pbopp0/1xuM6pqkPG6VbszQflqc2hyMd5ZZpHlnqvQqpNcNdd2uuQKLKtZbu2Kl7lwZRyOYgouheKyyp+25NUg3x898cNCsfjxrACSArBh2+N+4CpYb3JC+/M7NoOrNWrNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bwMBLiAN; arc=fail smtp.client-ip=52.101.52.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARfAJC0W3Nhd72gDhtQ9j/oePpH0aLkc2PrOAXnF+u6kK/0aPAug6Be1brf2GkuasBJTbuUrsloILOBTegD5/cketPichj/5f0T2XfdCH/CfoAOoiqRuWIxadBFUW7fvlGkNpeYufIVkRwNYOaQQvanmxAKiWW4C/vV+D1pUQiQBsswSm6ckSKCK8eZ9k8TcbuI1SoQMgtxAZvi1l1ypbluOjs+li2aMqDEyKOyGwVvlggaLqYU8/TmBSni8NBbR8k8hwzoAtkoewr75JqCaKS6K4pvS3ZqXdSyAd54r67M5e3v4T7NS+bHQ69Hlp5FCHct85VmVRrLKlY2ZTty1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSbkFacpo1NVZWYqUDxbjI7tZm1H1DT34GL2KR4EfPM=;
 b=mIJazvThROsk6S6aViI5atRLPrxGAgrG40LsJ50dtZpcupRmQn5K352fKXEtjhtL+bpj2mkLsWsC8yzAm1cpTZ4Mod1h6PtyyCwKDC66Am3gxLDltT6RsRANF5phWNnL4QAwg4vonlIvAzJBTlvkmnZHg5up7kvApckdqsMIRv2Eku/i6t6juA9Fdqj5itWYYqIYll7n8JybOBXVMdnYXPudJbExdqy5svfpuGk2YZiaKomSqANoWfy7hNYhyklhD5WZqw79Y0V5IURXEaPGAieSXetPAKxNaGGBdEDf1P/oyEEjMGAlnFml+bf6xpMThiGCcFz8Jwb6rQsCd4waPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSbkFacpo1NVZWYqUDxbjI7tZm1H1DT34GL2KR4EfPM=;
 b=bwMBLiANa5pAzm/HSF9/hZJpU69X8LBPyLV9Mf+NBRcx0x1lIuFaUE2GVOGG5oGD4zzMR9h73tqXj/bzrcdZXzERdnwDx2Vdrht0IbL7otAax7PZlzCI2HQU1WG5W0RoOiyG+TPapSNWIwKzw481YPQYEzURnZAx2Czda4xdi52zTbHZkZAywDXW7rjSMbT5Z6sbEh/R4/oA1TPo/oVZ42ENCDBprL0/ha92FfGWhbbwI7E7GIX5DiY6g/2ARzGai4nZ4zc8YjGJP3Sg9pwPMheaQN9nMTBprnmVCxAlxGOygt5NBC1nTtgXivN/aBqIHwT3vp84pi0QvcifktSF3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM6PR12MB4484.namprd12.prod.outlook.com (2603:10b6:5:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:33:45 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:33:45 +0000
Message-ID: <fba594d0-09f1-48d7-9d1c-127fd5e8c095@nvidia.com>
Date: Fri, 24 Oct 2025 16:33:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: tegra: Add logic to support different register
 offsets
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251001153648.667036-1-kkartik@nvidia.com>
 <20251001153648.667036-2-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251001153648.667036-2-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0394.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::22) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM6PR12MB4484:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b2f1204-fe25-448a-a935-08de1312b828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Um5VRUFud2lCRVBpVzZHUlViT1BubCtMb3Voa0lzUkVaRi8ya1ZtQm9GT1Fh?=
 =?utf-8?B?b1Z0aVpsOTBTTXVYekhRK2FFb3did3YvZlRSOVJEeXFuZE4wa0lhc3doSlMy?=
 =?utf-8?B?RngwT1VvY1p2Vk41U0ExdTQ4UmdEeUVBZkRMMzUxa3lxbWlkaTJscWhESEwy?=
 =?utf-8?B?cFdmY3FtMHNCS0ZQQ3RXS3BjdGlnQmtydUd0QnRaUGpnTVFIZGU0Mk1QWXNX?=
 =?utf-8?B?emFZaFJxQ3VoR0VxTHMvZFdUT2t0WC9JMFo5cHg2OEdMb0RYMThycm53V2lB?=
 =?utf-8?B?MDh4KzB4Mlh1SVMxWDE3c21iZEpFYkNrK1owSDhZY2xxQ2huVVhEZk9QeWEr?=
 =?utf-8?B?a0doM1p5QXlnektBeElINFRYTmd3WTcydGx1M09LSGNrbXhTK1Z0MWZ6VzF1?=
 =?utf-8?B?dG94Vnd2Z1gvb3h3djBJVm1McTdRZHh4d1JHKzNKSzFiNHJxOW03bzJiNHkw?=
 =?utf-8?B?dSsyZk9TMWFzQW9wNjZ0QjVocFJxOU5CVXUrelpmVHBGb3VpeG4rbElCMmdS?=
 =?utf-8?B?ck83Q3dtVFd5OGkzY3ovcmVjWG1NRmtnbDdNdW5XdndwcUZ6bzZUaExhR0JO?=
 =?utf-8?B?ZjVmNk5TcGNWRnZvOWF2T3NXek5hNmtOYnpqVEpBZzZLd2YxT3l5cktEVW91?=
 =?utf-8?B?VU9IaVhldWthTGlPSDdGWlNlaUJ1eENZQi9MUCtsa1AvTUJzQmRLOUhNeS9G?=
 =?utf-8?B?TGFXMmdHYVUxbE5GZ1hRQzdaR25rUXQrNm9URFoxK0k4cmllV2FhRlo4QUxQ?=
 =?utf-8?B?SVVmOWs4ZVZrNEdWRURSU3NmVjZ0NmFwQ2JaMzJMR1pQOUtTODhCZEZjazJU?=
 =?utf-8?B?RFV5Sm16WUZyYkovVHBSY2t2VGxEZW1KWTVzVXhua1htUExnNWw5RzhUVTRj?=
 =?utf-8?B?T3h2STh4OTNPSHNLUkN3dHNIZ3RHaTNmSVNzcDVKN0pIcWxpSGJXZk0ydndi?=
 =?utf-8?B?cUVxZ1F0T1Vrb2x1NzVXS2phWEpHTFk3ZmhabGtqcWhsYVNBSTVmL0U0YnNr?=
 =?utf-8?B?S3NHajdIamgyMkhobTFJOWpjMDEwWXJzeUV1TWJJckVSNjZKNGt2OVQybEtI?=
 =?utf-8?B?ZmtYbnAvWTdsZlBacCs4NjVvRUc3eTRGa01xeGs3QklKYU9yWFVJU3RmT2Rj?=
 =?utf-8?B?SHpDWVlvcHAxUENWWGpZRGEyY0FhVit4VGRZVGNEdS81S1RDR05Ocit3NENU?=
 =?utf-8?B?b3dOelQ0WmxzM2lwWEt5dWpjV1BnS2c2K0xua0VXL282UXhuQThZTXE5akRJ?=
 =?utf-8?B?YWtmNGR6UnpxYnhsVmlGZUhJMGNmaWRBd3I4RHZmMy9pWE4xU3pJYjRscjlO?=
 =?utf-8?B?L2ZFN0QvdWR4Z2ZqY3QrZjF5OUN0blRVdG9TZWJWaVRWd2YxSXQyekphRjZw?=
 =?utf-8?B?RmxpNlNuS1pRZ3puRWZPZ1dob1hkTzQ1WW44TTMzeVRWdUkwUmRydHBoN05S?=
 =?utf-8?B?Q1NEVVhOS2F4ZE85TmlScUd2aFlxYnZnYkpnc3B3OGMvczRQTFpEYUVlc3Vp?=
 =?utf-8?B?OHoweEtzMnRzajFsR2lNc0J2VEcrQ0xwL01uZUowNkNFaWJDeUxLblh0Ykcv?=
 =?utf-8?B?a25yY3g2cHJhS0hHZ0VtQTdGQ211cmpPY1lkNTBaeFVCcGZLdC9TR3NaSnV4?=
 =?utf-8?B?VTdUbFlramFkaFJqTlFuL1NhQ0FxemdDUWFGcDlRc3RTdFZpVHIyVkZyMWdi?=
 =?utf-8?B?QnBCbGZyaEhjSjByTitrUlRIRVg2eGtycFo2bUMybHROQmJuVkVRY2tFOEtG?=
 =?utf-8?B?ejFnT1hhMm5xaHd5VmF5ckhUWjJ4QXFFV0g5VzhYSnpMQlF6eThSZ2Njd05G?=
 =?utf-8?B?SDhaV0NiZmloOERCNlhIOW15S3RpWjVYcWI0d1JZcUQ5eHd3UkdzY3ZzVGJS?=
 =?utf-8?B?ajFhZXNVTCtsbHBlT1gzamZyMENqS1JkbzlNUXAzbHhkOFdUQ2pqanQwWEVN?=
 =?utf-8?B?RlVIUWFnMlVhTjdmU2doUnMwMEJYSW5nQlpLVXJsWU1iVGx2SzBpNzY5Ykgz?=
 =?utf-8?Q?UFQQqJbWgWHKjR0KmTg/rT6Nzt7l2Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qko5OVczMG8rc1IrUUQzem41WWVreWxHN0Q2ZkRzUGc4b09WTE0vN1hOS29h?=
 =?utf-8?B?WnlqcDNLTTJzM1lETlVuVFo1Vi9lOEVNYlBpSVdlVllVUUI2eTZXbmRYQ1lp?=
 =?utf-8?B?andQRFQwRUZWVHoyektMY3VWa2YwdDcyR2dSRHFKQ0k1ZTNIYStnK3UyVmtk?=
 =?utf-8?B?K0VCWExTaGdWeEs4SjZya0ZOMnVIRDZjek41azRpNDFqSzVIRllua01nbkEx?=
 =?utf-8?B?WFpvWHJ2aU95cCtybytxNWtPNDZaemZzNm9UYkwwVXByRmdTZjY4eVlCWHlo?=
 =?utf-8?B?L1ZncCtjMUJHOUNGMDhwMlhTbVJDUjFLQ1lsdWVNOEYzYmNCWjByL3pWTjJX?=
 =?utf-8?B?YTIvVWpLZllrcUtiNk4xQUlEOW1QN3pNYmx1OVFRbGgrdUoxeDBtbDlsbU4v?=
 =?utf-8?B?TjZWb2hPNTZNT2VsRitWWFlicndqWVBZemlTdVRoZzVhMlZNeVBZMDlhK3Vy?=
 =?utf-8?B?RkpwWERqRmdYZ1VXRVBLcnd1U3BuclZtcTdJV2NiMUZqalZmSGFYRldSbnhk?=
 =?utf-8?B?N0c4a1RtS3h6TEZRbldjQXpiQzRrYlNHWlFTOXl6cllSdWs3S0NoREcwY1dq?=
 =?utf-8?B?R2dkR1V0Nmg4aFl5d3B3d05MR3MybmRubHRZL0Y2emZIaVFzWEVrUXhzWFU4?=
 =?utf-8?B?ZE1jbnZZMk8yZlpkTVpSN2R1VUlJRUF6eVlHN3NBclhxTS9YaENJQzQrS05E?=
 =?utf-8?B?Ym5MYUhoOEJ6SCtlWlJsZ3dPQkdEakZjUGlmalVsOE1WTkdvNHptdlNkcEEr?=
 =?utf-8?B?Z3o3NjJ1Y0F4TEVibWpDbmNsdFVTUUFUcEx1ZWRnYVhjNEhVSU9LZmJqMWoz?=
 =?utf-8?B?R0orWUhCZ3VjVHNONXpOajB4cXNuMThrQzVLaTZkTUhYcDNRVHdNakF1R0dG?=
 =?utf-8?B?algzay81MTV5OFl0WHZNdWVwNnYyU1dzQ3R0MDh6Y0pUaWI0bGtpQzlGclpV?=
 =?utf-8?B?N29pbXhLZ0t3V1UrWWQySit6aExuZ3FBNGkvblRvVCtQKy9reEwxN0JEQS8v?=
 =?utf-8?B?cndPaU40cTRKcC8yQWExeGp2QjVudENYWVU0S2xvQk56TkVTSkJQRUFZSW1E?=
 =?utf-8?B?dk1WdGc5OWZOb3owS1hzdmJKQzc3aHdSRVF5cUlIenNwbnA0TXUwUm5mWmNT?=
 =?utf-8?B?RUViNFhJcy9DK2J6SGttQitMNHpqRHFhK2lXMnAzNytOMVZiQS9kTGFUT01Y?=
 =?utf-8?B?bjdHT0dVTEVPTldTaEcvcFVVM2toZElTOXl4N1YzMzhZNTZmSi9XaVJpRVJS?=
 =?utf-8?B?cUwzckJVa21BdVEybi9EK0RMNEJpTUY2enR1b24vNDF0SXBaUUpDaS9QRDFv?=
 =?utf-8?B?TFdLaVlwcWFSYlFyMW5yRzV3V1I3M2E3YW1SNGxLWjZybDVGZ1RUK1g3ekF4?=
 =?utf-8?B?aGlIaStOY0M3QkZHN3pqb1BhTjRNcTlxZHcxNUpiMG1Ib3ZjTnAvdzlpZGpq?=
 =?utf-8?B?czJEdzhRZUdYUEJiWDFtTEt2MjdwV1VRMC83aERzc3JxVXdiQ2JXaUVtTHVt?=
 =?utf-8?B?SG1uQjFXM1AxY0MwZ00rTUdldUVuVDU5TzByL0g1QlhPeFVldFVtRE8xbU0z?=
 =?utf-8?B?TXVqK3kyaUp6S1orc3RCcFcySUhkcGVTOVZPWDE5QWZ6c0pLUzdpVjJTRndp?=
 =?utf-8?B?U0FNWHNlcEtQaWpmdWIwbnYzNlEyQmFXamU2SzVJckNmcVFDVlV6cWZmSE5G?=
 =?utf-8?B?V1FzUE5wK1JNcDY0TGRMT0Y1SjB4TWVzVWwzb1pjN2NzSnMxYnB6eDB6NWl3?=
 =?utf-8?B?cDBFMjVyL1RIbmYvVkZHM25PZWhWTG1BTUw2VUNyYXVxNURFRi94YUl3V2NU?=
 =?utf-8?B?c2JlS0UxOFZuaTJKYU82YmRIMWNWdEZEQkhBWWVvWE1CYWFKbnRtelkzTFpY?=
 =?utf-8?B?UmVXTk40YSs2eWJHSjBtWHkvbmhIS0U3OHJiek1aclNrWWZlUnN4NjRHWCtJ?=
 =?utf-8?B?NHcvdDJzYkwwR2xjb1hIODE4bmFoVUZtaFBUOEdKSWUwaWZkNXdQNzRqbjZu?=
 =?utf-8?B?Ung3eXI4VS93di9NcURSblpna05YMFR3MG1oOHUzbktCUFMzTWYyKzllS0Ux?=
 =?utf-8?B?TDcyOCsyOGJNNi8ybzdJQjNzUnNCdzc3bllBSE5KNkozQ2paUG4yN3VEa3ZZ?=
 =?utf-8?B?VDVNYk9TT29EVFFJcU8rRmVvdWpvUFNiZElHUHdIa1BvazE1em01K1Y3TWxk?=
 =?utf-8?B?TEdvcGRYZitIQ3BaM1ZGOExhZzIzREhISTN5Q0hRNVEwSFFHRXVLZzNkd3ZU?=
 =?utf-8?B?MDl4WDBnT1BFMFZUcTJOWUc2WW1BPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2f1204-fe25-448a-a935-08de1312b828
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:33:45.6066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+9RhQxHhNV4gFmxG58xI5rJOXTjQMJSCIpKBwQvZYhp4T7j+DnurH6vQnHY7+hHvi1ftQQ83gCcJY6pdJlTgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4484


On 01/10/2025 16:36, Kartik Rajput wrote:
> Tegra410 use different offsets for existing I2C registers, update
> the logic to use appropriate offsets per SoC.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 499 ++++++++++++++++++++++-----------
>   1 file changed, 334 insertions(+), 165 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 038809264526..1e26d67cbd30 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c

...

> +static const struct tegra_i2c_regs tegra20_i2c_regs_dvc = {
> +	.cnfg = 0x000 + 0x40,
> +	.status = 0x01c + 0x40,
> +	.sl_cnfg = 0x020 + 0x40,
> +	.sl_addr1 = 0x02c + 0x40,
> +	.sl_addr2 = 0x030 + 0x40,
> +	.tlow_sext = 0x034 + 0x40,
> +	.tx_fifo = 0x050 + 0x10,
> +	.rx_fifo = 0x054 + 0x10,
> +	.packet_transfer_status = 0x058 + 0x10,
> +	.fifo_control = 0x05c + 0x10,
> +	.fifo_status = 0x060 + 0x10,
> +	.int_mask = 0x064 + 0x10,
> +	.int_status = 0x068 + 0x10,
> +	.clk_divisor = 0x06c + 0x10,
> +	.bus_clear_cnfg = 0x084 + 0x40,
> +	.bus_clear_status = 0x088 + 0x40,
> +	.config_load = 0x08c + 0x40,
> +	.clken_override = 0x090 + 0x40,
> +	.interface_timing_0 = 0x094 + 0x40,
> +	.interface_timing_1 = 0x098 + 0x40,
> +	.hs_interface_timing_0 = 0x09c + 0x40,
> +	.hs_interface_timing_1 = 0x0a0 + 0x40,
> +	.master_reset_cntrl = 0x0a8 + 0x40,
> +	.mst_fifo_control = 0x0b4 + 0x10,
> +	.mst_fifo_status = 0x0b8 + 0x10,
> +	.sw_mutex = 0x0ec + 0x40,

sw_mutex is not supported for Tegra20 or anything before Tegra264.

Jon

-- 
nvpublic


