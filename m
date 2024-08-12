Return-Path: <linux-i2c+bounces-5297-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4484394E9A4
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 11:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6986E1C215A4
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 09:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E059716D4E8;
	Mon, 12 Aug 2024 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="VaiYOjif"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013003.outbound.protection.outlook.com [52.101.67.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A45116CD3D;
	Mon, 12 Aug 2024 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723454665; cv=fail; b=nE6Vfvj0C96S4TMUUOnCBL/59YUg0+lJgJtMtkvSQQFw3fNuNH4lZUVArBzCgeLM1H3pTwfY1DS/FV+vjCg70IXfZ+1iE1CVdC0istmLpXCBDzKIvP/yN/28HUM+7eYOms7dE5Lu3UUGiUoYqiYr7RvhPtUVkFjvuVdsDNXLxkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723454665; c=relaxed/simple;
	bh=TJzMbiwolwAAJoVZ7MYDFrL82nLCl6+Nk04USJqvJXQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IN4McoMofLCn31FP3FxeSAlGoiGcO42SDTusOlcv0zmNYEssSl6hWLR5jsZ5kbLpxuWzveZWQY7T0BvzV8Om1yPOmHVRK75SbvzlRuzaUcr01Xr+YRR9u1hk/J06Yq0A7fwVp1n0qzawDJAWUnrvJHCTBFSKyHa2ijZgO+/9SgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=VaiYOjif; arc=fail smtp.client-ip=52.101.67.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQ8W3Ukl+mayvViaSHPnNnLXcMzmEtqUHn9lq6Ggr+cYDqcyH3FphuIK7sl5U3bUO8Efni3B4Mn8Rlv5jij6qGYfxew5zia3Y7hAnFX7EpRN9c7Tu/o6u+yaQKJ4WxyR/V49eug6PexkWJELbTEaqjIZ1eGYMPgGEMfQ4r4qxeN7FNqyfLjNG+8rbEYx+KZPbbHBHWnBz+pvvynu4zVF/B6izaEXwfVYOPwa+l6BwmNk5mpBkOX5IRxWhQCct3uvTPPp0ywqtVn2JAKzXCW3/TXxGkQml5XVY35ZQGIoTVARkthvheXfmJmzex23fAh7Oj2T1cOzgh7G4pkwQfDZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfTTiHVqwXDmD9AERIQf2bQAjVcpTjkk5tnEa+vGcxg=;
 b=H0e23GPIkx4V3AdZg9vUX7sdR6lKGWkcEEJivSXZVmJX715mPRDuYSpfpPsuVPIBXXFYYcfX/Khy+TL0M5/AJRjg3fW/lshLIlvGqt5a5jSBLLPDoF6m9KSlTcAiDw7ZVfD4QjJO4fhSAr4dwTDQutu1yUdwLOGUFmhWGLeKLRmUrOB8Fh3Xt5gSYn1e2gf4fouIYjvvQCR5FH7aFnU1TF4EY/rR1xzwaLa1K/2+ByiO0jKJf+4OcDfURKdYSJRtwNMD/9znQPcKNrdMGatK/4nS0ZxxA3YAGHQDAInmzzukVZPltCymM2JoJNegq8uaSNlKDhyTBzg7D9zm8xKTXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfTTiHVqwXDmD9AERIQf2bQAjVcpTjkk5tnEa+vGcxg=;
 b=VaiYOjif4AU/bkPegE4H8ZURfTzFZAjEqPZY0IpNJfgachfhtbOaHqj48TOCu3ZcAmwRWffW1SnimEsHdk+OOBxOr3GQdkxcRxSQfDXtN10sVRwmnGJgsVgOlMJpWavaljLXLpB+wVeSxd63ndo2HDltN+33kp+kRyE09jU1gtw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by GVXPR04MB10922.eurprd04.prod.outlook.com (2603:10a6:150:218::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 09:24:15 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 09:24:15 +0000
Message-ID: <728a8e06-81f1-4771-8031-ea043b9baf20@cherry.de>
Date: Mon, 12 Aug 2024 11:24:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
To: Farouk Bouabid <farouk.bouabid@cherry.de>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Heiko Stuebner <heiko@sntech.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
 <20240725-dev-mule-i2c-mux-v6-2-f9f6d7b60fb2@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240725-dev-mule-i2c-mux-v6-2-f9f6d7b60fb2@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::16) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|GVXPR04MB10922:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f78886f-baba-42e6-f232-08dcbab088f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVMyT0xnOXd6enArK25hUUc5T1p0Ulh2UEhBNEIvL2h3UHltcHpCRURsRmpw?=
 =?utf-8?B?aTgzQ1VLSXJOc1FrenpiZ1ZxT0FEYVo4Z3lxRTF3TU9QQVlScWh2eXpCVlZD?=
 =?utf-8?B?blNuQks3UDI4Vyt6Q3BmZWFqMjZFR3NmUTJEYnc1RGo5Qm9QcTJrekwrNFZV?=
 =?utf-8?B?UGpmZHNyLzVxVHJxYnFmODZ5cnpXVldXOXJmOFpmUXFjVTZNd21lMnBFZDN6?=
 =?utf-8?B?MDRQd3ZuRkNlQTZLaWJXRFR5akV4bUZXUSt0ZE02WTBsTGErZlVPRGx5UWRC?=
 =?utf-8?B?SDN5MnFBU3oyVTgyZCttVWlPaWQzVFRhTWhvdWZwYzk2SjhmMGNkUldIeUlX?=
 =?utf-8?B?dDFEeElmSDJocFkxdnU1MnlIWnJobzFUMFMzeDQ5cmUvNVZydGtBeEVIWjlJ?=
 =?utf-8?B?ZXYzM3Q2OU41QS8xdG1ZdzYzMkhSQXM5Z1poNkNyaWZYSi9lQWQzdUZBNzho?=
 =?utf-8?B?QkRIWFgwK0hmRHZTWmRYNzRWZ3Fsa2tvb3ByYXBNWFlFTVdGeFBzcW9XdkZ3?=
 =?utf-8?B?ZkNmVzYwNWdUbjZKejZ1M0FLZndUTW5QQVBiM0cyeXo4TDF6VURpS0dZdjVK?=
 =?utf-8?B?cUhVMWdhZU5Ycm9yamJMZ0xSczNMVTZOMEVIUlNUYlUvVWQrTFk0SXdPeGVF?=
 =?utf-8?B?TnJnOExkdXoxOUNqYzg2aVZlOEVGTDgrS1c3RUNBbWV1U2tmUDBMcy9MOTFi?=
 =?utf-8?B?ZXh3SHJsTzkwemdRaXpYeEZjbmJWa0ZZWjZCVDlOZGtGWEdkQU9JMkNtTHBi?=
 =?utf-8?B?T0oxMTM2MlM4NzJOVEQ4MFFCNUsxMWIvRW0wcnZBYWNUN1piNlRITTlZOW1m?=
 =?utf-8?B?cnVhRTRuU0JleHNMQmFLU1UxV3NLTjVGeHlEbitJaThPYVlRUkMyQ1g4RC94?=
 =?utf-8?B?T1FQeWdvdjExa3lQWk1PbzhRSENENVI3WUxtSzlHMkE4aWs4OFlXS3lvazdF?=
 =?utf-8?B?MnRmRGR3b1RPNEVOOTFFamljb2hlancra0hJMnVUNStrQXdkRmlzck8wUG0w?=
 =?utf-8?B?L0hSZ2wxQ21FLy9kK3ZwZTlyRjk5SXZzM09mS0g4TDMvZG16TWtKZk0wamo0?=
 =?utf-8?B?cnQyOUF1SXI5WkQ0cUlPb1FSNDFYUzU0T3pGVmVBRzFsK09GZTZmMXRYYitU?=
 =?utf-8?B?c1RVbUJlRjFlekNIYyt6eFhtYW92aG5SQmovVmQ5Q1NyZzRZYWN6NFA0aTFU?=
 =?utf-8?B?VHVQaTJFRDM4SzQwcmRhdkpnWTFNN3d2cXR3R2N0dVluZ3AxMm5GVnU2WXlY?=
 =?utf-8?B?ai9oTkorcU5CVmxncmlVaHk1cXVlK2JEdFlRMEhhOWpramlHNEFXK3Qxcld2?=
 =?utf-8?B?YmtzMnRoMklkYTdISDloRXVWMnpuZ2NOQTlHckc2TGx2bW9nczhTdUdJQ3F1?=
 =?utf-8?B?byt1ckN4K0IrTUJNT0NKQnVtWFU2eDlEb2FsVzk4WTNtVS9yUzVaT01zNjk3?=
 =?utf-8?B?M1ZUeEo5Q3h0V1pPU1RpbFhCSlpQRE5MYzVwRXVsZjg0ZE4xWFVPWTdjTWln?=
 =?utf-8?B?dFQ0bUlLOUt4RHFtSFFxNm9zb1ZDbjlXdVU2VDRJb3VxTjR1OEFhSjNiSGor?=
 =?utf-8?B?Yk1hOVVZM2R4SjJxaWV3Qkg3a0swczQ4eDRWbVZqcFZBeUJqenBlZkNYeVJy?=
 =?utf-8?B?eDJXVDdqbzZ5eUx3MmtRaHlRVkRtcXJieEUrMEpZZjVwbzNITVcwMkNuVlh3?=
 =?utf-8?B?Kzg4U3p6L2hqS09GRUNnYjNaMU1YTjZpQU5pdGFrcmxRZ2JHem5VTjBsTEtI?=
 =?utf-8?B?dFdpQ3pFa1RkR3doVUhYU2tBK2ZoS0tuelFDS29DMS95ZEpxYXg5U1l6ekFG?=
 =?utf-8?B?RXpCRTNvQzk0UmxaT0NHdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3p4dSsrR0tyemg2ajUxSWtlMjhvd2FJSGhhL2szb1hxdzVFSXVSU2NVbmN3?=
 =?utf-8?B?QUpYeTJNNkNKTStjZ1c0eVMrMUpqSnBoc0s5UkxGTyszK2JYeVdUZ1JmUlJN?=
 =?utf-8?B?UENEN3BaZzhCUVBsNDJMRXowRTNSalJ5N1ArckpxaFVwR010K0U3N04rS2hB?=
 =?utf-8?B?SjExYzZQQmRpQjB1L1FROHJ1Q05aL3VNMnlFOXl3WHBVamFWUlJNVE5Tck1M?=
 =?utf-8?B?R1dXODNiOGJxeVZIWmo4c3VEekRoMUlUOUpSL0ZnNkZ0elU3SWFmdHlSUkpJ?=
 =?utf-8?B?VEV3Q01HNmdEWU1oT0xxN2l4blJBUkl3bDh0d1MyYlJQbXV2NVY5aFNySG9p?=
 =?utf-8?B?VmxiKytLdTVjU3dzek9ObDZ5dkMvbkpQL25ocWtTUkRQdW00UTg0eTVnei9n?=
 =?utf-8?B?bHd1OGt6VjRaRXFxMUlUZ244Mkl6aEhrUldHcHhRelJ2NmhMV21DcGlMN0Vq?=
 =?utf-8?B?U29sY3I4RWs3TnMyWlBPMXZwckVRdk9SY05zYndVTTlscWwyUWF1M1k1S2M1?=
 =?utf-8?B?Z0tZU01XVHFIQTEvYldvWE5tcTFGRitaYktOZlU2VG5kak45VC9Wc3h4SEJP?=
 =?utf-8?B?Tyt3a0J5TWtOc0lpbTV6YVBna3JKTmIzSGJ4VUlhUGdCclFzVHRPMXNncmZx?=
 =?utf-8?B?cUR0OXllU25yU1p1N2tibnVTWnlOaFk0TVNSaU41d0NMTUJlMkdHbEN6VXZw?=
 =?utf-8?B?b2YrL2ZxblU5dHJyYlRocmR0SUFvejlIaUw2RUhqRVpGMTB6NUVOOFRxQ0gz?=
 =?utf-8?B?dnpRbHhiUUxmRzg2Rm0xSFJOS3NhUzI1YTB1Y243Rm9yYXdjS3RBZW5Kcldy?=
 =?utf-8?B?MlVRNTlRalJjZVF1NThkVW9YbWZBSkpVOFk1WDRTY0hNNzFJemtzNUhvejFQ?=
 =?utf-8?B?YWxzT24vdUY2eFArTlNxUkIxR0JndisxVEpLWnBGUFMxSjljWmtDSzZsRVN2?=
 =?utf-8?B?aGl0bkE3d0ZCbGJlaDZYK3NqTXBYbEJGeWw0dE5rZ2pGWDBSOEt5TVhRMkty?=
 =?utf-8?B?K2tEQ0l5M2piY2haNmZNSHJYbW1HQUZoTzYrUEFTcGFZd3BiVXlyNjJYMlpZ?=
 =?utf-8?B?ZmZ0T2l1SnZ2SUVNbjMrSTJKR2tnb1p4aW9SNWxSanhoTTg2R2JqSHJaYkZI?=
 =?utf-8?B?cWJzMkpDVUFKdXAxNWl2Ykt6ZWF0UiszcTVXTERaQ3BBcHBkaXZzVjAydktT?=
 =?utf-8?B?bGRoMkY5USsva2NKMFBBZkRyODBmamlJTDFpUk1sMTNWYnZrTENjeXlDdWpL?=
 =?utf-8?B?UWZqbnhHemVsNzhiM3gzMXZOUkcwVmJjZUwzWlhRVGM5TFZOSDhVU1lvR0Yv?=
 =?utf-8?B?QlFXcFlXY0dERnBYZkxTSHVUZlZ2ZnVzMXJvKytIcEVXTDBkRzM0VHBaVWNC?=
 =?utf-8?B?bEZ2MDc1cHZXZzg5MkUxSnFaSDE3V0ZHcFlXM0gzcGpIUVpvQW85QndaMmgy?=
 =?utf-8?B?MXpNeE5NMnpacTN6VFJ6MS9OQkg5eWVBc1ROSENtNFNWbXV2V3ZuMUk2Y3V3?=
 =?utf-8?B?S0dDQWh2NzFQVTBjbmFLeUZKZWVZd0JHYkdGWGhxQk1BN3hxemJkN3lpMlk0?=
 =?utf-8?B?VGdwSDM2TWhodmRnYWdmYkJ2alJKdGRyYmxrQVZ1V2VVSndwZTlrSUhJZFVJ?=
 =?utf-8?B?ZzdJSm9oem56MmxLaXN6VUdBd0dERGJ3U05CdkhHTmJsR29taEgwRG9yUGVO?=
 =?utf-8?B?QjFYeGp2TDU2MnY1ZjVLVEVicWlCY1pCMXFBSk80Und0TkVwdjBPeFZibzZi?=
 =?utf-8?B?SExQLy9iaWJreG1LVnZwRXE0T0JyVU1LL3l1OEY1cVQwNFpJc0dFRlhsTFB2?=
 =?utf-8?B?a0dpQm5OV0dZcFBUR2lJN01ObEIyMzZIZ3NLY3BnMFhGaVNWeUpiV2d3YnQ5?=
 =?utf-8?B?NlU5aUtYcXJ0dVA2bXlsKzYwb0VWdWFjeHRuS3FhcDVpaDlHdEI1dEFNZHF3?=
 =?utf-8?B?NWZ3QTdwbENsamFxTEYrY3NXRVlhWE1kdzZtU3NvQVhlZ0Qyb3FLcTdTdDVN?=
 =?utf-8?B?UytCMjNtTjlxc1RzelFCZkxvbmVSVVNkSkJnWXZ4YU9oeWZBQlNUUk9ocDNz?=
 =?utf-8?B?dC96YkUybXllWUZxQWs2eFg0WVNleHFVVHZGWlRiSVZFT0xtQUlpU3owaXdZ?=
 =?utf-8?B?Q3dyQ1prQzVyRmk3eXB4NHJQQWpjbDlYR0VtV3hLSXBRM1pTcUFlZXhuaVds?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f78886f-baba-42e6-f232-08dcbab088f8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 09:24:15.5695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRdfvJG1OuPOIeUaroIYkDKNdoUvLIc7W8YccnFb0cCK/w8Px/2+G9P7tDNMBv5TxqkQJOg4Hvi1ss1mQ7ziyDIOCARxygFBYotdCtrGVN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10922

Hi all,

Gentle ping.

+To Wolfram Sang

@Wolfram I see that you're the one merging most patches in in 
drivers/i2c/muxes recently but ./scripts/get_maintainer.pl doesn't 
return your mail address for the patches in that folder hence why you 
weren't explicitly added (we used b4 prep --auto-to-cc)

I assume this is due to:
https://elixir.bootlin.com/linux/v6.10.2/source/MAINTAINERS#L10339
which according to
https://elixir.bootlin.com/linux/v6.10.2/source/MAINTAINERS#L36
means everything that is a direct child from drivers/i2c but not deeper 
than that. Is this expected?

+Cc Andi Shyti, since patches that weren't committed by Wolfram seems to 
have been by Andi. Though I'm not entirely sure which entry in 
MAINTAINERS shows that responsibility? Are we missing an update to 
MAINTAINERS or is there an issue in how we get the maintainers for those 
patches somehow?

Looking forward to receiving feedback on those patches, thanks!

For the original link of the patch series if somehow it didn't make it 
to your inboxes:
https://lore.kernel.org/linux-i2c/20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de/

Cheers,
Quentin

On 7/25/24 3:27 PM, Farouk Bouabid wrote:
> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
> among which an amc6821 and devices that are reachable through an I2C-mux.
> The devices on the mux can be selected by writing the appropriate device
> number to an I2C config register (amc6821 reg 0xff).
> 
> This driver is expected to be probed as a platform device with amc6821
> as its parent i2c device.
> 
> Add support for the mule-i2c-mux platform driver. The amc6821 driver
> support for the mux will be added in a later commit.
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---
>   drivers/i2c/muxes/Kconfig        |  16 ++++
>   drivers/i2c/muxes/Makefile       |   1 +
>   drivers/i2c/muxes/i2c-mux-mule.c | 155 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 172 insertions(+)
> 
> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> index db1b9057612a..6d2f66810cdc 100644
> --- a/drivers/i2c/muxes/Kconfig
> +++ b/drivers/i2c/muxes/Kconfig
> @@ -119,4 +119,20 @@ config I2C_MUX_MLXCPLD
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called i2c-mux-mlxcpld.
>   
> +config I2C_MUX_MULE
> +	tristate "Theobroma Systems Mule I2C device multiplexer"
> +	depends on OF && SENSORS_AMC6821
> +	help
> +	  Mule is an MCU that emulates a set of I2C devices, among which
> +	  devices that are reachable through an I2C-mux. The devices on the mux
> +	  can be selected by writing the appropriate device number to an I2C
> +	  configuration register.
> +
> +	  If you say yes to this option, support will be included for a
> +	  Theobroma Systems Mule I2C multiplexer. This driver provides access to
> +	  I2C devices connected on this mux.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-mux-mule.
> +
>   endmenu
> diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
> index 6d9d865e8518..4b24f49515a7 100644
> --- a/drivers/i2c/muxes/Makefile
> +++ b/drivers/i2c/muxes/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_I2C_MUX_GPIO)	+= i2c-mux-gpio.o
>   obj-$(CONFIG_I2C_MUX_GPMUX)	+= i2c-mux-gpmux.o
>   obj-$(CONFIG_I2C_MUX_LTC4306)	+= i2c-mux-ltc4306.o
>   obj-$(CONFIG_I2C_MUX_MLXCPLD)	+= i2c-mux-mlxcpld.o
> +obj-$(CONFIG_I2C_MUX_MULE)	+= i2c-mux-mule.o
>   obj-$(CONFIG_I2C_MUX_PCA9541)	+= i2c-mux-pca9541.o
>   obj-$(CONFIG_I2C_MUX_PCA954x)	+= i2c-mux-pca954x.o
>   obj-$(CONFIG_I2C_MUX_PINCTRL)	+= i2c-mux-pinctrl.o
> diff --git a/drivers/i2c/muxes/i2c-mux-mule.c b/drivers/i2c/muxes/i2c-mux-mule.c
> new file mode 100644
> index 000000000000..062596869651
> --- /dev/null
> +++ b/drivers/i2c/muxes/i2c-mux-mule.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Theobroma Systems Mule I2C device multiplexer
> + *
> + * Copyright (C) 2024 Theobroma Systems Design und Consulting GmbH
> + */
> +
> +#include <linux/i2c-mux.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#define MUX_CONFIG_REG  0xff
> +#define MUX_DEFAULT_DEV 0x0
> +
> +struct mule_i2c_reg_mux {
> +	struct regmap *regmap;
> +};
> +
> +static inline int __mux_select(struct regmap *regmap, u32 dev)
> +{
> +	return regmap_write(regmap, MUX_CONFIG_REG, dev);
> +}
> +
> +static int mux_select(struct i2c_mux_core *muxc, u32 dev)
> +{
> +	struct mule_i2c_reg_mux *mux = muxc->priv;
> +
> +	return __mux_select(mux->regmap, dev);
> +}
> +
> +static int mux_deselect(struct i2c_mux_core *muxc, u32 dev)
> +{
> +	return mux_select(muxc, MUX_DEFAULT_DEV);
> +}
> +
> +static void mux_remove(void *data)
> +{
> +	struct i2c_mux_core *muxc = data;
> +
> +	i2c_mux_del_adapters(muxc);
> +
> +	mux_deselect(muxc, MUX_DEFAULT_DEV);
> +}
> +
> +static int mule_i2c_mux_probe(struct platform_device *pdev)
> +{
> +	struct device *mux_dev = &pdev->dev;
> +	struct mule_i2c_reg_mux *priv;
> +	struct i2c_client *client;
> +	struct i2c_mux_core *muxc;
> +	struct device_node *dev;
> +	unsigned int readback;
> +	int ndev, ret;
> +	bool old_fw;
> +
> +	/* Count devices on the mux */
> +	ndev = of_get_child_count(mux_dev->of_node);
> +	dev_dbg(mux_dev, "%d devices on the mux\n", ndev);
> +
> +	client = to_i2c_client(mux_dev->parent);
> +
> +	muxc = i2c_mux_alloc(client->adapter, mux_dev, ndev, sizeof(*priv),
> +			     I2C_MUX_LOCKED, mux_select, mux_deselect);
> +	if (!muxc)
> +		return dev_err_probe(mux_dev, -ENOMEM,
> +				     "Failed to allocate mux struct\n");
> +
> +	priv = i2c_mux_priv(muxc);
> +
> +	priv->regmap = dev_get_regmap(mux_dev->parent, NULL);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(mux_dev, PTR_ERR(priv->regmap),
> +				     "No parent i2c register map\n");
> +
> +	platform_set_drvdata(pdev, muxc);
> +
> +	/*
> +	 * MUX_DEFAULT_DEV is guaranteed to exist on all old and new mule fw.
> +	 * mule fw without mux support will accept write ops to the
> +	 * config register, but readback returns 0xff (register not updated).
> +	 */
> +	ret = mux_select(muxc, MUX_DEFAULT_DEV);
> +	if (ret)
> +		return dev_err_probe(mux_dev, ret,
> +				     "Failed to write config register\n");
> +
> +	ret = regmap_read(priv->regmap, MUX_CONFIG_REG, &readback);
> +	if (ret)
> +		return dev_err_probe(mux_dev, ret,
> +				     "Failed to read config register\n");
> +
> +	old_fw = (readback != MUX_DEFAULT_DEV);
> +
> +	ret = devm_add_action_or_reset(mux_dev, mux_remove, muxc);
> +	if (ret)
> +		return dev_err_probe(mux_dev, ret,
> +				     "Failed to register mux remove\n");
> +
> +	/* Create device adapters */
> +	for_each_child_of_node(mux_dev->of_node, dev) {
> +		u32 reg;
> +
> +		ret = of_property_read_u32(dev, "reg", &reg);
> +		if (ret)
> +			return dev_err_probe(mux_dev, ret,
> +					     "No reg property found for %s\n",
> +					     of_node_full_name(dev));
> +
> +		if (old_fw && reg != 0) {
> +			dev_warn(mux_dev,
> +				 "Mux is not supported, please update Mule FW\n");
> +			continue;
> +		}
> +
> +		ret = mux_select(muxc, reg);
> +		if (ret) {
> +			dev_warn(mux_dev,
> +				 "Device %d not supported, please update Mule FW\n", reg);
> +			continue;
> +		}
> +
> +		ret = i2c_mux_add_adapter(muxc, 0, reg);
> +		if (ret)
> +			return dev_err_probe(mux_dev, ret,
> +					     "Failed to add i2c mux adapter %d\n", reg);
> +	}
> +
> +	mux_deselect(muxc, MUX_DEFAULT_DEV);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mule_i2c_mux_of_match[] = {
> +	{.compatible = "tsd,mule-i2c-mux",},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mule_i2c_mux_of_match);
> +
> +static struct platform_driver mule_i2c_mux_driver = {
> +	.driver		= {
> +		.name	= "mule-i2c-mux",
> +		.of_match_table = mule_i2c_mux_of_match,
> +	},
> +	.probe		= mule_i2c_mux_probe,
> +};
> +
> +module_platform_driver(mule_i2c_mux_driver);
> +
> +MODULE_AUTHOR("Farouk Bouabid <farouk.bouabid@cherry.de>");
> +MODULE_DESCRIPTION("I2C mux driver for Theobroma Systems Mule");
> +MODULE_LICENSE("GPL");
> 

