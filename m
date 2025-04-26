Return-Path: <linux-i2c+bounces-10631-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3793A9D91A
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Apr 2025 09:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12EC44A1F7C
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Apr 2025 07:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC5224E4BF;
	Sat, 26 Apr 2025 07:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="AOrAoIY+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010010.outbound.protection.outlook.com [52.103.67.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC4D1F4191;
	Sat, 26 Apr 2025 07:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745653023; cv=fail; b=HI5wllT/dMky670TfnLqq2HhPeqwBI5+QUXnOwqZVT3fAQgW/G/8g3HtfRFO+vhOYJ4+fMiAMnDKW1qHT+2VeSiwFbQFgTMo4BQSQ9tafmuaXjBz/I4AP7D/YN2thSuTgDKZqE0JX8JOQeyN0P+K5s+ShGXrVauJYTzqaGxpr/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745653023; c=relaxed/simple;
	bh=GAbZkjE1AKTUzkscHQjYxa6ex2vNLdRQVCGPF5BAW7o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZLkq3UarHUYvLK8yWqaArhEuJupuyvRL0hKzPVahc84c3FPZqqm5DfibhhQyai7v40ZNKW0OPIVqLMB//0X/1g9M72yWdqT88O8OUxhrYGrBamJhl3YKoFCqY/lHgTgJLEgKtxRwBW/rL8ETV73o0tgfgPkp4yq4ThNnaKZJq1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=AOrAoIY+; arc=fail smtp.client-ip=52.103.67.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOmrPzwEb3peWlkuQYeHwh3N9FYq5+zJaXii2NgJ7280UE8wdjPkHYpIU+JaUAev3QLMlYnPOwZWbbgbMbOF/FlxZOIaFe0GZpUX3fccCF+Dwvdj2YlYv+8opu/gulHA9FBEY9cQqidjaBD4SOPfQJkuxHAaaHAcbLTY1HG2EBFRRzJWq0vtTnToJ3Y6nwloUn7emwfX9Y33IxNfF2eRLgAas9qvqFZYJPRGlDp6OOdBakhSKaAITxWhwWQe1M36Ou7q+D3cV8RdnESS5iesjfQu2YtWKv2bEzxPUFefLy9HP8lYhMkQw9m6HMk/haI8oU/6IkRItptb2G08eRSd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l57VTVXgDEJGsynS9OXHE9d303+JPUnzcC/FgYfkjHw=;
 b=Jf7Uq6AO0e8IS4bCRsM1qlbaZy3o1yuO+oOgW6LqN6vAui/IuooYlZNQ8xMQS9Cxgw1DOeJx99072Q7MyKPm1F24cIU6FAhubhE2+r5YwnShVVogMd+5CCfvmMMtWwBndU0FdwYGUUz6e1sR9PrmxvZATgplxts8jFKuLMovaupjJVPtJf/8zBt2WVjaS/7ECZeW0yopjC9M851llyu5iIoasqEO/D3DNPNungXrlz3QPj4ZGHCuM06s+dz0SkJL7OikyHiCX9kmlRMUVzaWhn0l8HZOUzs4+WP1+4xBpNCW4x0MIlHOTfCbWKxlDXjcsozHRx4XXsOwckKCsVoJJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l57VTVXgDEJGsynS9OXHE9d303+JPUnzcC/FgYfkjHw=;
 b=AOrAoIY+cZFO4t2ixnw/9qhvQrFjvZOgXwG1Ws52Br/kRamC6fesS9n1C1RuiKeKoCn9IGXqmZn9S//60cz7+kr2GtH83+PY8G0Zrdx6H/9e/dc34J+eM7d4xH4l8qDs6LqI5/Hb+vtQTAyIJkahivUHsk4lwlY2a8+Cr6m1Uy0n2HQfXPagufa53glR132mRVDQf+hykHsfqzU21ihl6ah/GCWmoeDf2R9ju8TX/xTdOc8eyD33pomeZCU+T8foO71ch7HAOSzokgxzAKjOxw/4+SUuYLjCMoYvw+FYlIvEFBvq2PRro0J8+Bga/G8PTeIlrlyytgNBuIi7/SQ1Cg==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN2PPF42D195671.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::115) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 07:36:49 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8678.027; Sat, 26 Apr 2025
 07:36:49 +0000
Message-ID:
 <MA0P287MB22626253965E96829B7371A1FE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Sat, 26 Apr 2025 15:36:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] riscv: sophgo: Introduce SG2044 SRD3-10 board
 support
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <63417258-20bc-4c8e-8ff7-f26d7b2a4efa@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN2PPF42D195671:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c6ffbec-ddb1-4e06-8896-08dd84951a9d
X-MS-Exchange-SLBlob-MailProps:
	7J/vb0KDx3gr+YHKmSMzj5jlTHKVEqRitjs4sGAhT/YdbaNMlplyTo+F9ASsQAFQ0Skj0jlsCZIyKA/NBxcBqSOSaGwPYT4+jt76FWw+723RPu7w2gwp0eFPnyY8ETOrGSZepxm041ZQl5667F2ss8wXwJpWWB7zah5xq4OJjlBIx1q1EPvkR5Cm44RYqH62J/GVKmMo4uP/y2DxZ6szHhrqXEGG95vfVWrkcGf312F0uImMsXzvtf0aCZRQkPEdj26p7Kf65QzLh+MPF408/Uz+64DuZCNPjYfXBM2Q9So1LayMnWv3IwIzjpVQLNm0SkWYrhx5KoLlc0vByRp2MWNj98L4HC7z+UZlTONssJ0MXclsP5OfWPugm/zHHLRyy6sgjks9n8Y3iKBxcokyWrvd1ckVqSyKjU0R2kAR83r9Z3QCPcNXC7hWC+1gyvl7ZyOEJVsvd1N1+Rtda0It1tONqSTf1gBHDQc9ZZo19RcvmsWvU4lOATrmdC1W/XT+5SioMYB/xQCsou8T0KZBP80SYJ0jcHv2gcV0LAsQjv3t/z5ef4srBruZ1W23AlwhQh70y7TU7UBYqT3HoB8MhmIEB9NPCi58G8FAoDhtpU5uPFDth17Sr0YabUhGOmXKlkOqGEK7JlbBd8lTE7ImM5Jtz291Nzx07jXpjXaj0pYBnSb29Oxbmos2sO2jtQRxoZor5sPEK01z+ibFAMSdpzenXp/nESBBAnNhHaTXCRWs8chIOdKwnfGiafjYCm/d5n7DTcJuwgOKeCzOl3R6MLl4GxenkX/NybBbnWMgHnQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|19110799003|15080799006|7092599003|461199028|8060799006|4302099013|440099028|10035399004|3412199025|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qk9TOWpmOGlUbGdCM0ZkZm5jSHlYRkV2NVBiNnRQaVVJS2EzSjVLbzF6MVRn?=
 =?utf-8?B?dlhMR2hjUHlJc0pMWXdFNUFxdjRmdDFUUy9qQlJxN0tKamM5S1JFSDA4Z2l5?=
 =?utf-8?B?WmFUTlM5TGVWbWFnaXVtS3lTYWtuRTlWN1FvNm5BVXR3M0VmalNFa1NmK2Q0?=
 =?utf-8?B?eitMMXFKVXlJdEw3U2cwK0VJb0pnMW5iL1ptL2kvMG5vWEY3SlFyVGFNWGxF?=
 =?utf-8?B?VVJSOGVtSVpZQURkd0tTRHRCdFU2WDlYQURXajhsK2lha3ZxNXFqNmJuRitO?=
 =?utf-8?B?Y2c3aERKaklQMnorM0VsMmlFWVplT0JqQ2NDaDRaSkh2VDRGTTFOYUJLSlNv?=
 =?utf-8?B?WFJiWkxuWURUZjhUVEVRSW40a1BpQWxLY1FHQjJ3ZnJ6aE5FNDFWOWFLZXRs?=
 =?utf-8?B?MldOOE5UTGpwUlVKTlN0blpKUFhIL3hkVUJ4UVVod2NKMmhVQy81WXJZb0NO?=
 =?utf-8?B?ZHpMSWJBSEwrN21XZkRwUGVXSEdZTzc2MmZOeEl0N3M1YWRqWkZaMG9YcW5U?=
 =?utf-8?B?QmV6NGQremo0NHpROWl4eDNUNHpDazdmT0loY1lJcnJ6azlZKzBpYk9mbytV?=
 =?utf-8?B?RVlmQkYrczBWcFBCQWZrTFpSUjN0NGpoNVJFQkI2VitFZS9MZTY1bEpPTWlX?=
 =?utf-8?B?bGU0MWsrUmdxdVVKbGJqRkZLcG5WbmQycHpWTlh3dmRkdDlKdHpLRTh5WFBi?=
 =?utf-8?B?QWhKeXBmUFpKZGg5RGk2UmJCS0FGYjdRR0JDVXNJU3diUkYxbmJsT2kxclVL?=
 =?utf-8?B?SnBUWHd0N0IyZW5JSk1Obk1JT3NJRVQxNGRCWjJaVjVkZDVZWEIzeS9qamlm?=
 =?utf-8?B?V21yY01qbWN4VnVQSTNNeHhRVy9kK1FLcEhWK251VEs5MG4yK1dJVXFGU3E4?=
 =?utf-8?B?YTgxQXJTdXQ3U2hrMEl0YWlSNDhSbkI4elQ5ZDBncmFLcGpiTTY4dUY2ODY2?=
 =?utf-8?B?UjNtOXV3Tmp5WWJXUnZjb3ZOYUFtTEs5aFJWUHdRVWl5MVF4Y0pYREZTRnVK?=
 =?utf-8?B?RXQwZm5wM25BTE5zVXU1cTRrM1FKT2l3Y1dpLzR6eU9yMHA2YnBoczh3eUJh?=
 =?utf-8?B?RSt3WjdKN3l3Q0FOZXZ4ZG1TQVdjU3cxWk1zb05PUmJGVDJvUDBwYnFqcjRo?=
 =?utf-8?B?TFJZSzc1L2drZm9pN0g1MVIrVmNLbmxpcVM5ZTJEVFkyQmxEUUZrVG1PeWJq?=
 =?utf-8?B?cUpHQU9ndERRSGlVb1JJMzlkZUNFbVQrUk5sTEtQYnhSRjMvdUFDQ2dmdzJE?=
 =?utf-8?B?WUZKMVdCY2tXRmlqOWxVamlBZzU5QmRKSU16UmkwVVVXNExhVVZFRGlwY2du?=
 =?utf-8?B?UjVJSUVjTE9oWEpZbUxDZkttUzZyMHJ6bVRGdWRuRjNUT3FwdGMySlVZN2pN?=
 =?utf-8?B?d2d4WmZUNytsMjhsWUNhS3RpVXZ0cHZDRGNQSU03Tk00VjRCNDFaL2JzUW10?=
 =?utf-8?B?OHRna3NTNmJuVHJlMnVINGxROFI4cDgrTWUwWHNNWXBtZXlGNXFkNVZhNDZF?=
 =?utf-8?B?cmxSSDI3Z2tZNkhnRm5qOVNwMUVBNWY5WVVQakNtVG5HOS9lUVVVNWs0Q0hr?=
 =?utf-8?B?eEtISG1pYnl4MzRhWFdZc2s3VEszZThzNkgyQzU2QlJrcDN4R3JRTXRIa0FP?=
 =?utf-8?B?M25QeFpCb2piTjVPMTkvNkc0WVVLMmJYa200VDNvSzl3QUhPdzlKNXVTUXVM?=
 =?utf-8?B?ejI1aVJ5VGh2MzFHQVhKblNJbkEwbHpTZFh3bm5hTFJVZ1BRRDlUcitVd015?=
 =?utf-8?Q?ESqhINMuTZ8PpIoNHM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGVtMEVpLzJrQktDQmRtbkMwSjA2NnhkNTMyTDFrNzY4ZEJjcXZ1a0IrU0wy?=
 =?utf-8?B?ek50VmlsbDc0YXkwMEhTZllvMkJWR3h6UGovekVQVGJiUnB0VHhEdkZrbE5t?=
 =?utf-8?B?UERtTUZvcXZxelk2aXJvT05OV0JjMnhoN3JQYTc3TURjaVE1WEcxaFhDaS85?=
 =?utf-8?B?bWc3UkJUVUErQ0IwNnVvMG04VGliVHp5dVkraGNSRVRJMWVzT0VjcDRsSUZY?=
 =?utf-8?B?dm9YR1pQSjNNcm1mQlc4cW5nenpPenNhVmJNQXBRTS9oQmVlRHA1RVZTOExF?=
 =?utf-8?B?TVNlak9SVkhrbDJEUmlZWkcrcU16TGx3Z0hXUTk5NitQaUk0KzNDUmwvazE4?=
 =?utf-8?B?b2RtSUt4a2wrckhIUFRQM2FSZW9HZkVGdlVCRE9HMXFNeDdYL21rM2U4YVJO?=
 =?utf-8?B?ZVh1N1RKclZFYllOK1haaTJTM3VoaFFyWmx2UXNaQTB3T0h3WVFnK3B2MFRh?=
 =?utf-8?B?UmoxcytqaDRienpXM29LVS9mLzlPTFV1UWdUVUg1VnVoN081OTR2eFJpVFFO?=
 =?utf-8?B?K0dZR0oyWFlQSElXZ0IwMjBYTnl1NmZJWnZJbDhaTkh1bFlhWjJucGN3S3Nx?=
 =?utf-8?B?Ni8wUnJnWDlwVnFnWVNOa3gra0hJK3IwUWVZdmh2OE9jTnNqandpUFYyL1R1?=
 =?utf-8?B?WlViYWZBUGpIVzRrNWlLV0p4ZitiMGtDS1pqblYzWXhkRHZ2eFNhSkJWcG1U?=
 =?utf-8?B?eDdUc2g2ZDFRd2RXQVJqS3Z6d1RUbmFwSG53dmJYOE1uTVkrSGphTk0vZlRW?=
 =?utf-8?B?Zldid3UwZGVWdWdKQkhGVEFlRWJFZm1uMWFzWUFjeGRwTE1lbWlDcTNxczFo?=
 =?utf-8?B?ZTNSRy9hM1oxaTRjMjdQbkFhRzB0ZFZ6ZXA3NW5yQUxFRnQ1ODhZcUdWMm5Z?=
 =?utf-8?B?cFQ1U1YzdUJYcVlNYkZ2eDlCV1NiYVB4NTZxZGZUZTd4NzNQakFsWkhvdkxW?=
 =?utf-8?B?bjgxU3Q0K1doSHU3Y2dWT3ZTdENYYTBrQmNTK2NnMk91S3BXdDF5RWJPN1Q3?=
 =?utf-8?B?R3lYUXNYRkZPaFdMaWlJZlcxNXpTQlU5RnBkd1lVUUZ4Q0tYSkpHa3lWREF4?=
 =?utf-8?B?UlBBYllpUTlnQ0NkbVgyd0R2MGt3UVJZS0dkanY1a2ttQlZZeWRYU3ZDZjQ0?=
 =?utf-8?B?ejMybTN0RUF6NkFvVVZld1dYaFhRZWttcEY3cUM4N1ZFc0tYbTFBSCtRdTJr?=
 =?utf-8?B?REFrUXFBMmN3eUpBSlhpck51dHRvWFlaMmptdWJBWk1lc2s2blVQSnk3bmpm?=
 =?utf-8?B?VDkrZE5IdEdnQnNzNVJXN1FERjB5SDFQQnozNFFvQTV0SHRWR3Q5Qk9kaXYr?=
 =?utf-8?B?MnBmMXUxdjJVY0JhYWJaVHBML1ZTdkdZMXZ4YmNBWWhic2hYcEpETlBaL3JT?=
 =?utf-8?B?b0FPaExTSzBEa2FuSmxmekZmNUtRd0Z5Tmd5RFdyd2JrdVlBazRWalh6ZjZK?=
 =?utf-8?B?UWwwTWNEWHdHa1U1QTNzemk4cWZsS0ZLWlVtci9xWXE2dCtjRDBTSTArVTlS?=
 =?utf-8?B?NS9JelRpRVhBZmxxTUJ3TWF2d040dlRzRzduR2Yxb3FZeEEzUVpRQ1FudEla?=
 =?utf-8?B?KytvS0ZrYXZRS3FXNlowb1RuZTZMWDFnQ1NoT2V2WTlCa3MrdksxUEI3dWp3?=
 =?utf-8?B?dXZROUhjYmJvdEl6bU5FUTFlaEwyVUorbFZKUUdYNytsUGRQeEo4eXFRZ0tX?=
 =?utf-8?B?YkwyZkVYNDhGSUlMbHppVHBOQXBINS9STm1HN2JvT3hFdTZpeTVYZm5sMklQ?=
 =?utf-8?Q?wMscGD0avPHyaoD2yo=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6ffbec-ddb1-4e06-8896-08dd84951a9d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 07:36:49.0511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF42D195671

Hi, Inochi,

Will you apply this patchset on sophgo/for-next? I see there are changes 
just about dts/bindings.

Chen

On 2025/4/14 6:34, Inochi Amaoto wrote:
> Sophgo SG2044 SRD3-10 is an ATX board bases on Sophgo SG2044 SoC.
> This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
> 1 microSD slot.
>
> Introduce basic support for this board and Sophgo SG2044 SoC
>
> Changed from v1:
> - https://lore.kernel.org/all/20250407010616.749833-1-inochiama@gmail.com
> 1. apply Rob's tag
> 2. patch 1: new patch for grouping all similar compatible ids.
> 3. patch 7: remove unnecessary compatible check
> 4. patch 8: adapt for the new patch 1
> 5. patch 9: fix copyright e-mail
>
> Inochi Amaoto (10):
>    dt-bindings: i2c: dw: merge duplicate compatible entry.
>    dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
>    dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
>    dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
>    dt-bindings: reset: sophgo: Add SG2044 bindings.
>    dt-bindings: hwmon: Add Sophgo SG2044 external hardware monitor
>      support
>    dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2044 support
>    dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C controller
>    dt-bindings: riscv: sophgo: Add SG2044 compatible string
>    riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10
>
>   .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        |    6 +-
>   .../bindings/i2c/snps,designware-i2c.yaml     |   12 +-
>   .../sifive,plic-1.0.0.yaml                    |    1 +
>   .../thead,c900-aclint-mswi.yaml               |    1 +
>   .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |    3 +
>   .../bindings/reset/sophgo,sg2042-reset.yaml   |    7 +-
>   .../devicetree/bindings/riscv/sophgo.yaml     |    4 +
>   .../timer/thead,c900-aclint-mtimer.yaml       |    1 +
>   arch/riscv/boot/dts/sophgo/Makefile           |    1 +
>   arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
>   arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
>   .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
>   arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
>   13 files changed, 3275 insertions(+), 9 deletions(-)
>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi
>
> --
> 2.49.0
>

