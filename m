Return-Path: <linux-i2c+bounces-15274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8BFD3B901
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 22:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F425302FCEE
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 21:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D502D3A69;
	Mon, 19 Jan 2026 21:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gPhj9ZYZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BEA27F756;
	Mon, 19 Jan 2026 21:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768856516; cv=fail; b=uSBWGe3cNP0omYqKgOv2oxxUX7JcFzic6stLnL2GW6QX1AA+LpDWhTX98yXMecZux6c2eQgPzqlDrS2soZCKrL/E+zelJWtt1jhw2pYeENDyrVKe24tg1ceBlqXDo7Lsxlqar/hnV9ShyLsK6tTrnAxShSxygs8ZYSfu3LJOlVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768856516; c=relaxed/simple;
	bh=AJMwK+k+OU8okqfxzwAumtrjBFBOSfQ62UawT/G0peE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OiKOoojyOSNAehzM9DSKuiprcNF59VpGUPc/tL9bCfReU+KYEKC6mZ/jW0EeNweawePbwWNUBVxbLd6UjCOGAGzTAUKMXTgGyCd3UzFGTik5VyGfvNOJQDQt+KYu13p633F+Rj2abt3BLGx9V4v2cUYn9B0Jhz29tOyx0/xlW9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gPhj9ZYZ; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWJeZPfnQbGdcrEvCSEQteRx66qn6jLJ4agA46/U+MH2pWUBuVFwVN4Y+RNvIW+JCkjGDoRUYeVdtrx2a0HDB3x1DOzFplcPpsYXvASGq3Sn7lB2dqwCTZWCySX10JD+0cCgl6KB+oxYS/kaUB8xVJ2O6ZsJulzjSqRYJJ/+ttL0zzONLUP0b5JJ/pbkCAj/i+5GZTVMBgpWzii2gN3vksfZf4gmckjGzmQzjiIsnaFIS3LUZoMUVna7ApJQScbYJyHE4CdwlKcVcpWilnYHLedI1qJE1dUZoP9W+zGbTyWWY2xUQRK2z9+mT0K7Ntnf3FhkFuS5zqkSzYdAk7m4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZaP+vwDg9b0m5SGWWMWqBSTVNMY7ZGTSYVivdNPk/g=;
 b=TbHtmdsCZb4x0iezaouJmKl+1cJcnP59uly4zDOtOLqSQOwSvfXpQgplDwQ5JRi+OfS9tnrGfbGwq6K82FpsIJdnT4By5FzuEObYobCvx9wmW6JvXLpTDcFW7SEZST7KDFC9TNNHwTYOxfa+gWvw2kUjMsFgUS0sEocUTH8d2a0F1Nh2mLPrIvyvkeCZv5+UMyQn8MJjyKYnufps6CumtZ/s6E5JgRsFkMSVim7kRa3JYFY8jYSAeaaaCqleonxUT9QkVYfkTipBRv0IpPqL+Ca+l4Hu10wOvwcWMKHMpWOLKdOpCRNPWkuybIN5HsyP10j0H9BnV7qLd6FpbHq7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZaP+vwDg9b0m5SGWWMWqBSTVNMY7ZGTSYVivdNPk/g=;
 b=gPhj9ZYZQgFaHfRqOX8gxQskpfzTyrUQaeGSnsQeflEs6tCFWwHyjELdpsIAxq3oMHBAjsQjg6eymUzsEJy06i0az6zivH1x46h1NiNbCaEGDmpvbyvx83bt8fWL/iCXI6fSiEk34822z0BI+3j+nACHo7pMqzuKtlZUgKAoo+hFFofBa1p/MDI0klNjgTtkQM8Hze/fMfGcsuIfgSV4DNsqsZzNK1bVlu6qRStvRz7TwSmKrjNhVH7UCofou6PWRQFd+Jk6J0FdacencOvIi7XYAYJKeJwmUJ2jhjT6gzTPnHGYyJLDhiilDz/QL/4RN8ZondsTPOJ+13EllHmx/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ2PR12MB7893.namprd12.prod.outlook.com (2603:10b6:a03:4cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 21:01:50 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 21:01:49 +0000
Message-ID: <089e771d-a4fb-45b0-8c34-5393a4082def@nvidia.com>
Date: Mon, 19 Jan 2026 21:01:45 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] i2c: tegra: Add logic to support different
 register offsets
To: Kartik Rajput <kkartik@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260113165929.43888-1-kkartik@nvidia.com>
 <20260113165929.43888-4-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260113165929.43888-4-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0155.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::16) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ2PR12MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a6596f-1f1f-42f6-ad34-08de579df6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnEySlNILzZ5bEc0c01hTWFSMDljZmJmQnpvNUVYT2MzVDYyY010ZEEzNlRp?=
 =?utf-8?B?cUNuUm53YU10NXBOTFlRS2ZjcDVrNWRaL2ErYU1yVGZwRjZoRXlRRkRPTVg1?=
 =?utf-8?B?aXEzMXRsNGQxV3BKN0xOeVVmZ2dYMnU2aVQ3THdXREd6TythWlNaK3ljZ3RY?=
 =?utf-8?B?OHEwanNhT0lwbjVSNVB0RGp0NW5wNkdUeS84OWJybEVyMDl4ZGdaZUJKbm85?=
 =?utf-8?B?WjVZMUhocDBXMGVzMWhTWGdFQnY0bU5kaWRiSFdzNWtxaURRdWlxYlA5S3BS?=
 =?utf-8?B?NHdxcFN5a3diK1BQdUYxUU5QdEdTOU1sY201dDBaWk9oK1VoVFdwTGpSSm9B?=
 =?utf-8?B?ZFBIWG9tdWlPaWp4ZVM0Z1hLdlJNeWd5ODhwUEF2eHNjVTdEZ1J2dUptSzdR?=
 =?utf-8?B?YzNvNXI4ZFdncjVlZTJRNmNFUGpXWmhvRHA3ekx6QUlGekVlUjlXc2h5WHVq?=
 =?utf-8?B?R0ZNY1lxR0d3bjFGZzhPSjZRRWxxNllJRFNocGplWjhnQmRoMWxnN0FmQXZW?=
 =?utf-8?B?YlpKUnJKZEgwSFd2YitnYjVQRngzRWVNUGN2aG9LV2pHbExrRW9TMmRGbEZt?=
 =?utf-8?B?dDV4MUNqNWs4dHpDNk40a0JaVmJzV05PaU1vM2NSSFJzbVNwUzg2aWdLSTRj?=
 =?utf-8?B?bm5aV201WXNlOUxpcFVNSDhjQXNLejZpQXl6S25wQ0NlNFd1R0FoU1Bzdm1B?=
 =?utf-8?B?OEgzcXhEZlRqR1JxMWZHWnVTcG9xOS9YRjJpL1hUdGdpeTc5TlJFeWgrT2w3?=
 =?utf-8?B?ZVAyNkNwS0gzMG0zTUNodHdZeFBPenZSM2UzZmc0N08rMndjMWl0bkpUOHlx?=
 =?utf-8?B?WE8wZFQ2NjZweHRMRTJlaEo3T0kwNVpVZHhPcUlXVmZEMmRiTWJWcmoybnFC?=
 =?utf-8?B?eVlmeXdSdjNsdHl4RUVRV2t6bHc0VnYrMWhJYzZDUFl4dmQ3R3YxZUdzZDFl?=
 =?utf-8?B?SllVQnVMOEpxbmN5MFQ2T2ZUNm42Q1BKZE5pVG9nQVBwYm5UeHpvZitNQWVX?=
 =?utf-8?B?SjNsU1NER2ptMHZ2Rzh4WC9rejV1UUdPZTAzWFo2NmFYeGVjL1VkWHhRakpn?=
 =?utf-8?B?KytRV1p5NFJPb2VzcU9wMmZNbWtFeURianZqRytGQmlnWTRPMzY1aUcwVzZ1?=
 =?utf-8?B?SDMrT3FOQTB3d1Y0ZTY3Mkxld0R1bzZwRG5Gd1h5ZUlBejNHMHZ3VnlQZ29R?=
 =?utf-8?B?MEFjSjlaZldLUjhmWlo0UUU0elNRaC9hZTUrSlZndzl3cFhLTllvenlDak9p?=
 =?utf-8?B?NGVONldDWEdTNVFHckNFNUpCZGwxck5zc2x6Slljem1xVTVJcU1Qd2drMU5y?=
 =?utf-8?B?c1ZzUU1tTW9uTEs3R0llZy9jQ2UxNktwKzF2RW1rTERJZU91eXM1RThQa3gr?=
 =?utf-8?B?SVdDcUJpYTh0cmlvNkRPZ2laWlJmWWgrSGc0bU45bXdDeklPOGFBUTNqR3k3?=
 =?utf-8?B?bm9TUk41L0xHWjhmOHpDc0dGK1h3US8rQWlwc0xoYWxYMFhTeXk3Q2lKMHQ4?=
 =?utf-8?B?NHZ1WW9ubUdhekljTFcwQ29QekJQejZLLzMzblFHWUFqRlhGZGxjZEgwRWVN?=
 =?utf-8?B?djgxMGFyc1FhNHFORnVQOUZhSXVSMkttYk55Y09maDB3ZkRId0pJL3lKOWxz?=
 =?utf-8?B?Wmg4MTE4dVh5cXJwZG0zS3cxRWUyMDU0dHA5WC9OVjdyVUhhYUVvaFlJdU5h?=
 =?utf-8?B?V1JmZktNUXg4YU00K1lQb0pBc2xvVlA2OEIzZjV1dFZiZTZhWGxiWTAzWHFp?=
 =?utf-8?B?UFBDbGVlY2t6czZGWmhnOEVTOWdFSE1Xd1JKbWxWU1o4RXFaMlkzcDhUNW9p?=
 =?utf-8?B?OVNySXB0bzl0ZGI5NXlZcXB3RXpqL1Qvd01TcUdKSVo0SC9JOE5SVXV6dXlp?=
 =?utf-8?B?WC9pcEUyOG9MRHVEenE0RE5PN0xjN0t6anI5UHBPdWNxY3Fockp0K29pZFI0?=
 =?utf-8?B?ZTd6WVNJN091bW1MNjZuWlZOYWIrcUZzeFJCUW5ESnRmSVBaTFZmWXcvY0t1?=
 =?utf-8?B?TXE5Zkw0S0xkRTNMY21oUGZpQ0traEc0VzBLaFh6TFRDK2tkcXRCRzVyT2hP?=
 =?utf-8?B?T1VHQ05oOTY2eHNtZTdmOEswZW04U0J3L21VZkJPOFI5czlIY3RYSklNWUVl?=
 =?utf-8?B?TGFuYjd6ajcxYWh4ZEovYWIvbldJbG5HRFFPQXE0N1I2SGhRcjVvazVNQkFt?=
 =?utf-8?B?dkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnc0cGxkcGpOWFZ2N2NJSW42S0xsMC82bExvRTJxc1BMYjNGcVM0REFHb3lu?=
 =?utf-8?B?bGtXaGE3RHVSRi9wY2ZSMVl0ZFVhZlVGOFJwdWFETnhSL0ZRRmF0TnVlN2lS?=
 =?utf-8?B?OS84czNKOHlHU3RHdTlSVFNMbUk2emd3RnJMcVBhV00xdFVLbEdQTWhCMGRs?=
 =?utf-8?B?c0JJSjdDcTEvbmVrNlZ2aFdMQ3BucXBxc3E0Z2ZoTTNrcjlVWVByWGhGSTlV?=
 =?utf-8?B?T2x2U1pTd0pQY0RkZjgxUk11dlVMSXJnYTJTcDFiMVF2U1NIakQ0OUtKM1Fa?=
 =?utf-8?B?d1pCeGtuaUhCUHJiZDNBQ3dMYkp1Y0J5ZlVid2VnNExxWThLVDZaZnhTaWR4?=
 =?utf-8?B?Q29PVHA1RmJCUW9BbmRZUmp3a0tsRDdhcjlNdkJGNm55WmR5OURCZkNkSkQ5?=
 =?utf-8?B?alpYM1M2QStzc3R3VEJNVklJWWtqblM0NDY1cUZValFTcEk0Smp0eHlORG1O?=
 =?utf-8?B?cS94Y3F1MDJuZW16TXpNcTdUQjQ1OG5EbXZRZmpZcEZDeEQvcWYzMXdudG1Y?=
 =?utf-8?B?ekhweXZIYnlETkg3NEpWdUR1a3RZaEtSbTRQbndEYlFwZ0w2Q1hMRVVFUmtJ?=
 =?utf-8?B?MW5FUGlteWRMNWJockFNWmVRZzg0TVJGNUliZVhGU01Xb0p4My93bERnNTU3?=
 =?utf-8?B?V21BOENQOTduYzZpelBtcnlQVmQ0MHIrRDE1SnhmS3JQQ05aaFRZb25aaG1D?=
 =?utf-8?B?cGllK1FMYWRScjJmU21rY1FFMzJUTjY4VXJGejYrNDNNRUE2bHBBcVRmbUV4?=
 =?utf-8?B?RzlaNXk5TWJYYkZHV1pmSnM0SVViZGZSR1pZYjhsOTFZZ3MzcTdSRWp4R00y?=
 =?utf-8?B?MGpEd1hPTHdkT2J4bDFRWXRrRDcweUxRcTBjODNLVUVnZEVBRXc0ekNLa2lR?=
 =?utf-8?B?UXZuTXZlOG9FdE5TUGtHd3NrVGcvUlIvTVExanZVMWVlNHNYUXhiRnRNdEtP?=
 =?utf-8?B?SkFFZWpORjJPMitwZmx2c0E2Y2E3N1dtcVk1b0UrbjM3VUplalIwQzlHanpM?=
 =?utf-8?B?cXdsVXFRdzZEWE1sbTJqUGpBL1YvMmYvd1hFbVVqZnJpS1hyQ1k5b3ZKc0dS?=
 =?utf-8?B?SEFUbS96dCtabHlxajRtV2VVbFYzT01kemFHRmNOZzFHbkliUU10dFpZNzhN?=
 =?utf-8?B?OU1QcXoybGZWdzgxalBjWEQvRHlXOWk4YWNTS25QRkpnU2JFL0Y1dHIwd1Zs?=
 =?utf-8?B?N2FHOHoxY3JweUZZcEZtalhsOFFNVHZ6MUlzZWhFb1YzQUI1d3Y1bDBRbXlk?=
 =?utf-8?B?dnR4QkdLamwzekVQQVVmUFhiTzBvOFV5Um5uOUF2K0pyRmJQbFc2VndoMHpW?=
 =?utf-8?B?STVreUNJN2dIVlRSbjJBMDBaMEptZVpuQ0R6WHlaVS9KZTR4Vk50WUdtUWZM?=
 =?utf-8?B?dmpjY0ppNmxKUXJNZDl3a3JKZWYwN3FBbWtJOWVkdW1SS1ZQM29SNm4xbHlr?=
 =?utf-8?B?NHhoUFVsQmFpaVJ6VmY2dTV0c0NmckhmTlV6UDJiR2ptK3RoUDdVQVB0ZVpQ?=
 =?utf-8?B?YjVVQnlYandBUXFpaGRMSWVUTUhYQnhXa24xdldtSHQvd09QTWFmSCtJeUpr?=
 =?utf-8?B?Q0JkdHV6eEczSWZzVXpUTnRnUllsWlBkTFAxVG45NDBJellzQXR0SWpjNWRB?=
 =?utf-8?B?Nmp1emRVQVBxTzQvNVhIQ05sZllCcEJVRTFtMkcxTnpGYklKeUkrK1IyY2VH?=
 =?utf-8?B?TDk2TE5sYlE3a1hXdmlDOWR0ZjFJcDBJVlNzbkVuWUoxZ21xWlhLVFJtYVJG?=
 =?utf-8?B?Mk9kNTFUazFvZHBaT0RUQ3RtSEFMSFl4L1FCRDRDMG5NOTQ2QUdCdC81T2tw?=
 =?utf-8?B?c09oYXJrcjFhR2FzYlNiMDlmdWxqcENBUjhHbTdjWGc2YldhZHVmZUJ4K3l4?=
 =?utf-8?B?ME9sWll6aHkzY0VXZEZkM09qYjB1ZXdYSlg5SWFMang4SmFjM1gzVGovWWZi?=
 =?utf-8?B?VXVHK3NDNTYwQ2RhaTd0Y2F3OHVsR0ZibWxaUDJheUttM1IySGtxZ3FtVWhF?=
 =?utf-8?B?alpnWEtjQ3lOVGkzR0xVSXQ3RWNNMmsyV0lOOHRxL0VJWDRGY0d6TFJsbHMv?=
 =?utf-8?B?RGlGQkc0VHEvdDZ1VTFleGUvVWJYd1g2dmlueDZhOWxMQnlhU1pUTnc5aHVC?=
 =?utf-8?B?eWlnZVB3QmR6RkZxQjJ6ZTJONFpKVHh2WFdUdEMvWkQyeFcrbDdRRHhiSnZ4?=
 =?utf-8?B?YmZrYUVBOU12dmFNVzMrNWxOa2hTWFlsUWJnU1EvZEM3ZzNaRmNpVGdWTG4r?=
 =?utf-8?B?UWRnS0tLeFA3ZEJJZEZGL0xHU2Jqc1NvZGVYZDFkTkFKUlJxOGhETkpOSDdD?=
 =?utf-8?B?ZUdMeGFJWDVTVkF1WTl2NW5CQ0IwYUthMi9CeFdYdzBKMjRiWWQyUHdsT0Ft?=
 =?utf-8?Q?cYgNy7GBK7ARPK+XtdiXhlWEWfRV1tTtgGqUVaGkKkERW?=
X-MS-Exchange-AntiSpam-MessageData-1: gszjATkPwH/Ybg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a6596f-1f1f-42f6-ad34-08de579df6c9
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 21:01:49.6443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ks+COsYb4NCtxcv+l0G1m9H6mO8Ty32b6GYbLXLyW8thsr6vT868msm5sKvCYsRQp//2zFxbkPwe3y8Cyfc0eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7893



On 13/01/2026 16:59, Kartik Rajput wrote:
> Tegra410 use different offsets for existing I2C registers, update
> the logic to use appropriate offsets per SoC.
> 
> As the registers offsets are now also defined for dvc and vi, following
> function are not required and they are removed:
>   - tegra_i2c_reg_addr(): No translation required.
>   - dvc_writel(): Replaced with i2c_writel() with DVC check.

This says dvc_writel is replace, but ...

>   - dvc_readl(): Replaced with i2c_readl().
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> Changes in v7:
> 	* Fix Tegra256 reg offsets, change it to tegra264_i2c_regs as it
> 	  supports SW mutex.
> Changes in v6:
> 	* Do not remove dvc_writel().

This says it isn't and ...

>   /**
> @@ -348,45 +466,26 @@ static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>   	writel_relaxed(val, i2c_dev->base + reg);
>   }
>   
> -static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
> -{
> -	return readl_relaxed(i2c_dev->base + reg);
> -}

If we are removing dvc_readl() I am not sure why we have not removed 
dvc_writel().

>   static void tegra_i2c_dma_complete(void *args)
> @@ -621,12 +720,12 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
>   {
>   	u32 val;
>   
> -	val = dvc_readl(i2c_dev, DVC_CTRL_REG3);
> +	val = i2c_readl(i2c_dev, DVC_CTRL_REG3);
>   	val |= DVC_CTRL_REG3_SW_PROG;
>   	val |= DVC_CTRL_REG3_I2C_DONE_INTR_EN;
>   	dvc_writel(i2c_dev, val, DVC_CTRL_REG3);
>   
> -	val = dvc_readl(i2c_dev, DVC_CTRL_REG1);
> +	val = i2c_readl(i2c_dev, DVC_CTRL_REG1);
>   	val |= DVC_CTRL_REG1_INTR_EN;
>   	dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
>   }

We could just call writel_relaxed() directly if we can't use i2c_writel().
	
Jon

-- 
nvpublic


