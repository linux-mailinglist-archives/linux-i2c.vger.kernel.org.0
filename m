Return-Path: <linux-i2c+bounces-3439-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E4E8BD6D4
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 23:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 822E61F244BB
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 21:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD07215B968;
	Mon,  6 May 2024 21:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="ISsMiOxp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2138.outbound.protection.outlook.com [40.107.22.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BF4EBB;
	Mon,  6 May 2024 21:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715030808; cv=fail; b=sHqVBfaPxpy9Qi3wF+q8sO0poyRcT6HFsCJ9UBWL0qWZ3LtB/EamqyRk12g47O+jFRHkYT+3SbSFi59bvQbkd3tjX2YC9Cplv0iiBp7/dhieokj971fHsJqeJCiSfGTjR45X2FsOumF4Af+p21rUbdFiNy7c3hvDljugbfnFnqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715030808; c=relaxed/simple;
	bh=RJacL/ue2nAkIMtj9kQwmR4VLzsxPkCEH+Yz8Ywls8Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hvDj0g/ldBPrfRr6KGmEtDRWXbSXm6dQnqqXaIHvROkH/UJfD4fiMc6zbH0zOZH5Ld3+xVPDat1XP1d22pwQjVMap+PVpIPuFZTo4IklLaBPcDANPJ19gYQq2TULLHcQYhpyZHY3A+x4Qwrs0R4ZuT2PfY+z7I81Sa420XzqJrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=ISsMiOxp; arc=fail smtp.client-ip=40.107.22.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5ooc3KeLsUoetHo+j5nDTca47IyjDmkzoPQbEMJFIdWYnddY5YGW96bZzjUsIZZtPnd6qjVIh3XP0QFmSOxQo74BTk+BV28EYuSMMNrwVAec6UsH6pdZHktsc8ThQ3vFB1c2LEDH84MxkuEhP/lejUQgRi9kVJrtR8Gb+IxdGgF9nV8NSRP8rMLp2JRe+iVTc8Ds/zm+yn6OlPYOdgWYGs1vphXTo9GMPv7VoIO5zxhGhsv9au97T0WwvEsDzACh4R4LehmePq3fn1glgsVeddmPRPtiF8t5lhqxzhb7s1q85ZySgW0nDytiil3DJKmuugDTql/17hTVsYpW1bU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGPNwbATmtPFygmq2EYl7C8cf67gJ5B1k4pr7RA+wTs=;
 b=N7eejFRivjzLQ2/NXKXbGoxZK2/lQXPq6rYFFHpbLDYA6GHlKdTdMOeSdyIaLxBXj9aNCe1+SJZUxeFOXkwMA939NieiPEwfZ+RrhpvRVBMt2ByCTxs+OVaNAg8A1vKfZHeWRnb2c7/JYosKBEkmdVocm4aMX7wDzNzcIoVWziC9OlAZJf48qEI5IosGUXEsxtYDSslnoGvdjbatcEFEjAwQuou2d5EPju8aNUTKvLGsEqVhUNp22gLtIsmCUT74gsJt7U0NHqRrf7t1dVU1G/si/v35dYZ3tyUTDvGNomykqeuDSa0o/bFCr2DxGP96yImkFY4k6ZUahaoLC9Ou8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGPNwbATmtPFygmq2EYl7C8cf67gJ5B1k4pr7RA+wTs=;
 b=ISsMiOxplLe77TPqsjRixBx9kTV0NlKnLRtV6v3B+tYiwTtnVqqaFMHsc0NgxfyCW6bpK4Nk2E/VO35jAqennDAKGhMmyyS2VTONW+/NNo7s1Z8ZWBCzVJBX5GksV0/yHmZb0M8f9rHLBLKHDCb+fbgk/WlKiZaTZmCVX/7STtg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by PAVPR02MB8965.eurprd02.prod.outlook.com (2603:10a6:102:322::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 21:26:40 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 21:26:40 +0000
Message-ID: <9b12dc9f-054b-fba5-e23d-48d0fe1a00e2@axentia.se>
Date: Mon, 6 May 2024 23:26:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/7] i2c: mux: add the ability to share mux core
 address with child nodes
Content-Language: sv-SE
To: Farouk Bouabid <farouk.bouabid@cherry.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz
 <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
 <20240506-dev-mule-i2c-mux-v2-1-a91c954f65d7@cherry.de>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20240506-dev-mule-i2c-mux-v2-1-a91c954f65d7@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0102.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::23) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|PAVPR02MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: e52b3564-7ce8-40ab-0297-08dc6e1337c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015|7416005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rk1vVFE2M1BmVkJTVVhGeGIySkZ4M29taU1BYXhvdTZTZlpSRzNkUVdNWXBq?=
 =?utf-8?B?VERnajVFWXM3YWJPbE5tVmFUeno1UEt5UjNqbTlrUkY3c3VjVmU2OHlWZlMv?=
 =?utf-8?B?b2Q2Mi9jVjNqS1Nic2pnVStBOFM0b1hURjFtMGxYc1RvOXM1UGlEQm9yQXN4?=
 =?utf-8?B?eUVoL3RBTHV3QTJxcEwrUSt2YzljaHh2Q3NGS3JiTGV4ZktQdFRacE11QXVY?=
 =?utf-8?B?akFseTgrSFpVb2czT1FTVndQT2tDS0V5ZC9RVXkxYjBjZTYwZFZ3R0Jra2lX?=
 =?utf-8?B?T3dLdlZ5WmRkWW5pUTgwUk1BOFZMSUp5Zk9KMENqYmw0ck1kc1hNQUE5SFZI?=
 =?utf-8?B?WFk0SUVWSFQ0Y2FydFRydU1yaGpxV2h2RGhvemJDcnFST0p1RUgzZDQvL1RT?=
 =?utf-8?B?YXFxTFdONTJtNUE5b0lqZCtYTThtaytKdnFRcmxWdHNLbGRoNUF0S0k2eERM?=
 =?utf-8?B?UWYyb0h3bFFwemV5VnduaElUdzFpWWtNTWFvcFdFaHNsczU1YjFWcTlQaEJz?=
 =?utf-8?B?cDgwRFk4K0Fjek1KYUNtQmJwZ0lWYlB4NC93NWpnOEJxODdKSjcyeTdKT3VK?=
 =?utf-8?B?ZTNQQnpzNnlRLzZBWmJ5Y0diK0lYeXN2MElVenJnVjFZZzEzTTFoOHNZU2kv?=
 =?utf-8?B?eGs0eE91WFpyV1FJdFl4blJNaWtHT2FvMm9haVVyeGV1WmRKODlxcmJXWlR3?=
 =?utf-8?B?MmZROC96SkZnV21ZUkU5dFV3T1BZWVUrbGlNWlJhM3JtcFFUanp3N3g5ME51?=
 =?utf-8?B?YUJ5T1haRTJJa1V4RHF2Lys3SE9tSjIwcTRWb2tRU0Zwd3FvakJTUStySVhy?=
 =?utf-8?B?SnpZR3JVbnUvQUh6eThhR0RIKzZlUlZZWEp0andRSGkyQUsyMlpIb1BnNWIv?=
 =?utf-8?B?OVdWM1JTem1KNktlc3lXTWVtd2lYUWFvd0JuMmJZQ1IrUjFqdDlndGZMaGFZ?=
 =?utf-8?B?MXlOcy9ENlJzS1U4VUVlY1JNcTI0cC9icXZUZHR2SEYvWk56Y280TjJiekZ2?=
 =?utf-8?B?UjV0eklCT1Q4QTJqd0pRbHUvaUNPVGwyQWY5TzBqbHBwNThieUFBdHBzejVU?=
 =?utf-8?B?MFZZc29iaUxLYlhBcmxpRWlMTjg2NWFTbmRpK2RZVTRqU0Mzc0FFNDhCVDVy?=
 =?utf-8?B?MC96RmYwUXh1Nm9mV1RGOXdYSm9aZTRPQjE3WFFIcXV6VUVoM2tMWWhFNXRq?=
 =?utf-8?B?YWtkUHlEaDhYWXROUlZFcit1eXpWNnBRK0JjSDhrTkpGZTBMblMxT0xpd04v?=
 =?utf-8?B?OWl2S0tvcE9LRy8zQXJrU1FnNHZvVHd5SFpPajdTMWZlMXppYW9qcGpjN3Vj?=
 =?utf-8?B?K1ZRRnZvem5OTEx3ZGx0Z0RZYnJyeTVRc2JuSEJlQ1FXOTdVNks4b25paGc1?=
 =?utf-8?B?NnJtQ0VCNXlJRDg4Q0F3ZTY2a2RkSFhGdUtvM2NydjZSRkZvR3NYRm8rbFJL?=
 =?utf-8?B?RlJnNGQ1UFVheEZyN1l3U25Zajc0YmQ4SkJBVzZOdU5RbFRFMWVnSUVSVDIx?=
 =?utf-8?B?TCtZemN6MFpIU0FSRjgyeW1tV29Cbk9OWWZJelBjZ21OMnNHMEsxTmVLWlNh?=
 =?utf-8?B?bEpUNXRzb0dXdTVWcVZxSGx2ZTE3d2JMNTFnTFgwL2FpRUs2NWVzc0FVTklK?=
 =?utf-8?B?aEp0TGY4OFJPN1lVYURGdnlFR1ZtQlQ4cytMS1JVSEIxTjhJRS84MHEvSG8r?=
 =?utf-8?B?Z1I2R1ZNeVhVcGl2S1lOKytQRzh2eHkxOWp1Nk82ekg3WkpLNnV2WDBRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGpFVWZ6TDh2bXRpZHhKQU9VQVcvbksvWWM2cHVaQWk0VnRVSnFtYkR1aENs?=
 =?utf-8?B?bzgzL0RHaC9JeVJpdnpubm5VMmFjZWVpaWhESS9taWdsT0RtMXdOWmF1enFh?=
 =?utf-8?B?WGNJaTRWOFg5NVVzL1JPSzl0WDhkR0JvMGR6dzZacUlTSUlxL1VGS1F5akdw?=
 =?utf-8?B?R0Q5SVlYZnpOSWh3OXFhY29tRFQrNUJyM1laZ0RrWVFGZHIyeVNzd2drNWIz?=
 =?utf-8?B?Tm9DbDNVR2FFeGZIcm5ZRlBkb3EzWFVIaTNKaTNFbVVGR2FWeU91VWNzRzhE?=
 =?utf-8?B?cFRTRkZvdUJSRzFlc2owNlNUQ2lrRjRHY1lsR010T3IwQWNtcnZhYnBjcUYy?=
 =?utf-8?B?ZVJ3allJT1FBdzgvTHJqOERmR240ZDhRUThXeXVoZXJzcUEwTDhSc1FiV0Fo?=
 =?utf-8?B?VjZidVVydno0WVFZSUZ1M0lZODAybW1IdExaM1pBZjV0Y2d5cGtENHdJY0Nl?=
 =?utf-8?B?WWhKWUdRQXc0VXhEVWRuYWJ1TXlNTkM1UVMxV2FWdFZZcXM5bjJ5R3V1dWtE?=
 =?utf-8?B?dG1PREx3Z01wMXp3TVQvOERQb2FKbXFCNDNvaUUxY2kzVlFqZW4yMTQwS3VV?=
 =?utf-8?B?eU1BY1NSTzBjTGoxTGdsblRkY3IxSjE3R1l0a0tobGJKMjQ3TGtBN2RsZjBz?=
 =?utf-8?B?MW5rM3pkR2llNXBNMnE0QVFuNExqcXVyMkl1R1ZDdTZDRU1CWjNWeS9ic0Uw?=
 =?utf-8?B?UVBDS0xSZS93WU5yMFRPMk5nT2l4NDdYaTkyUEhJb3BkTGhzWkt2d2FkNkdJ?=
 =?utf-8?B?QUdXNEdTVi8zemtyTkpFZGtta0p6QXVydnNKNW55aVM0Z1I1Y0FNdWUrcmNx?=
 =?utf-8?B?bytiRFpJdHNzUTlXdUt3M0tJSml0OXB5alowSGxWMkRUL0JCYXVjUFFFMndy?=
 =?utf-8?B?V1hHaVRHakdsd3NsSkpWTFFhNW16bjExK2Y1aGlQYlh0QzVSMnVFeVhMNU53?=
 =?utf-8?B?ZVJMbG5nL29xTU45UlpIeU9LZ2xkM1NSTzViRWJtOU5qQ3RUSVEzK3ZJZVFH?=
 =?utf-8?B?b0VPUFd6WDlRRmZ4ZXlISkQ3ZEgxeElrcEtzSGVsTDRwSkM4SUxuUGp3WXdH?=
 =?utf-8?B?RDdnYmJFbDJFYzhOZnRPTnpTemthUm1QU0pkdUo3VzdBWENnQzVXYnNEQVBl?=
 =?utf-8?B?aVNnODZFeVAzK3hZYXBWK3NIK3NyUUNQQzlXUCtWUHJHVDByeDVIUEZVZ0VM?=
 =?utf-8?B?RkZ6ckFZcHYrQTZRZmNVQXdnTlpNUHNUY0pBV2F1SmVNdnNiSGFZR2NhYzMz?=
 =?utf-8?B?dnp6UUxDRnFGNVlLNFRveFVGMS9BZ2RDN0tBTWsrNmFFWm56ZjZXRG9ZRjlM?=
 =?utf-8?B?aUEwRXlRRFNMYXVUN0Vqdnd4TmxmTHVlandjdERveWZvV1hSaXBhQ2lwM3ZO?=
 =?utf-8?B?Z0VMVHVZRytFYno3eWdZNitzWDVzTDRPQkw4SWQ1ZUt4aVhITGd6Nk9tVG9s?=
 =?utf-8?B?V1drQk4wWVBGRzEzY1hxbjczSDRxL2hXd2ZFMXJmS0FSZXhFcXF5engydVlk?=
 =?utf-8?B?NkR6STl6U3BLSUlnL0FxV0ZzKzFRUGg0S0JaSzlNZ0d0NXhVL2dGR2g2TWZD?=
 =?utf-8?B?MjBwWlpTV20rU0lnTXhIem5ZbFJGdFFhYVhyTHFUVHhpSUFEMlpieHIzZ3cv?=
 =?utf-8?B?V3lSUmpmOFpIRjhKTGVkblMwWW9vNW90OFZiWWFjVWhPZEs5dmpRM0pwZFA1?=
 =?utf-8?B?VmNkTlVmYlFzK3hFQmZsTy9qSWpGazJ4cFk4TmFyVTlOMWd4MDBmTmpoZmly?=
 =?utf-8?B?akZpSzFId2V1cmYzQ0FPVHBnSzV2VEE0empsUDRQT2xLZzlCK0toemxpcVZO?=
 =?utf-8?B?WEE2LzJ0b1htU3ZyWmJVcUw3Q2lIN3dhaFc2L0t2RUF5NkkvbnNYS0xFZ3k0?=
 =?utf-8?B?Z3ZpQTJlUEJiYncreFNSdkorTzNSMGszQ1MyWTJpbkp2Z0xpWHEzTDloemg1?=
 =?utf-8?B?ZllIL3FyU3FtUG5iSVBLSFpTT0ZGSVlqVUxZd3hBTWF5aks1ZUgzWk91T3F5?=
 =?utf-8?B?Rm9Wa1FYOG13QWlqN09jNXhTZWNQQ213VVljbzlnTFQvVG1sRlgwS3NqaXBC?=
 =?utf-8?B?UHhQZXd2SkNBSDlMRVd1eTYxUk9DWTJSMkRKUHhLU3ZYaURqT3NxN3RDWStq?=
 =?utf-8?Q?MJzrvV34lYXPmqgi9seX3XsqF?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: e52b3564-7ce8-40ab-0297-08dc6e1337c4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 21:26:40.0044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdIHLgRP1OTNvMfK4g36YjcNKDG/thVM3gKLIrMWi378oYFAX1RAtG8nBrKujitx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB8965

Hi!

Regarding the subject (and elsewhere) I think of "mux core" as roughly
the code in the i2c-mux.c file. So, for me, the "mux core" does not have
an address, it is a mux "driver instance" or "device" that sits on the
I2C address that you need to share.

2024-05-06 at 13:37, Farouk Bouabid wrote:
> Allow the mux core (if it's an i2c device) to have the same address as
> a child device. This is useful when the mux core can only use an i2c
> address that is used by a child device because no other addresses are
> free to use. eg. the mux core can only use address 0x18 which is used by
> amc6821 connected to the mux.

Use I2C in text, not i2c (applies to other patches as well).

> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---
>  drivers/i2c/i2c-core-base.c |  6 +++++-
>  drivers/i2c/i2c-mux.c       | 25 ++++++++++++++++++++++++-
>  include/linux/i2c-mux.h     |  1 +
>  include/linux/i2c.h         |  7 +++++++
>  4 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index ff5c486a1dbb..ce2425b0486d 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -821,9 +821,13 @@ static int i2c_check_mux_children(struct device *dev, void *addrp)
>  static int i2c_check_addr_busy(struct i2c_adapter *adapter, int addr)
>  {
>  	struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
> +	bool skip_check = false;
>  	int result = 0;
>  
> -	if (parent)
> +	if (adapter->quirks && adapter->quirks->flags & I2C_AQ_SKIP_ADDR_CHECK)
> +		skip_check = adapter->quirks->skip_addr_in_parent == addr;
> +
> +	if (parent && !skip_check)
>  		result = i2c_check_mux_parents(parent, addr);
>  
>  	if (!result)
> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> index 57ff09f18c37..bdb75a130cab 100644
> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c
> @@ -334,7 +334,30 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>  	priv->adap.dev.parent = &parent->dev;
>  	priv->adap.retries = parent->retries;
>  	priv->adap.timeout = parent->timeout;
> -	priv->adap.quirks = parent->quirks;
> +	/*
> +	 * When creating the adapter, the node devices are checked for i2c address
> +	 * match with other devices on the parent adapter, among which is the mux core itself.
> +	 * If a match is found the node device is not probed successfully.
> +	 * Allow the mux to have the same address as a child device by skipping this check.
> +	 */
> +	if (muxc->share_addr_with_children && muxc->dev->type == &i2c_client_type) {
> +		struct i2c_adapter_quirks *quirks = devm_kzalloc(muxc->dev,
> +								 sizeof(*quirks), GFP_KERNEL);
> +		struct i2c_client *client = to_i2c_client(muxc->dev);

The above section has overly long lines without good reason. Please
rewrite as something like this:

	/*
	 * When creating the adapter, the node devices are checked for I2C
	 * address match with other devices on the parent adapter, among
	 * which is the mux device itself. If a match is found the node
	 * device is not probed successfully. Allow the mux to have the
	 * same address as a child device by skipping this check.
	 */
	if (muxc->share_addr_with_children &&
	    muxc->dev->type == &i2c_client_type)
	{
		struct i2c_client *client = to_i2c_client(muxc->dev);
		struct i2c_adapter_quirks *quirks;

		quirks = devm_kzalloc(muxc->dev, sizeof(*quirks), GFP_KERNEL);

I also wonder if that second condition (...->type == &i2c_client_type) should
be a WARN_ON_ONCE? I don't see how the flag can be set sanely on an adapter
that is not itself an I2C client. Can it?

> +
> +		if (!quirks)
> +			return -ENOMEM;
> +
> +		if (parent->quirks)
> +			memcpy(quirks, parent->quirks, sizeof(*quirks));
> +
> +		quirks->flags |= I2C_AQ_SKIP_ADDR_CHECK;
> +		quirks->skip_addr_in_parent = client->addr;
> +		priv->adap.quirks = quirks;

The I2C_AQ_SKIP_ADDR_CHECK flag should probably not be propagated?

	} else if (priv->adap.quirks &&
		   priv->adap.quirks->flags & I2C_AQ_SKIP_ADDR_CHECK)
	{
		struct i2c_adapter_quirks *quirks;

		quirks = devm_kzalloc(muxc->dev, sizeof(*quirks), GFP_KERNEL);
		if (!quirks)
			return -ENOMEM;

		memcpy(quirks, parent->quirks, sizeof(*quirks));
		quirks->flags &= ~I2C_AQ_SKIP_ADDR_CHECK;
		priv->adap.quirks = quirks;

(My code written directly in the mua, there's probably something silly in
there...)

Cheers,
Peter

> +	} else {
> +		priv->adap.quirks = parent->quirks;
> +	}
> +
>  	if (muxc->mux_locked)
>  		priv->adap.lock_ops = &i2c_mux_lock_ops;
>  	else
> diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
> index 98ef73b7c8fd..17ac68bf1703 100644
> --- a/include/linux/i2c-mux.h
> +++ b/include/linux/i2c-mux.h
> @@ -21,6 +21,7 @@ struct i2c_mux_core {
>  	unsigned int mux_locked:1;
>  	unsigned int arbitrator:1;
>  	unsigned int gate:1;
> +	unsigned int share_addr_with_children:1;
>  
>  	void *priv;
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 5e6cd43a6dbd..c3acbaaadae9 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -670,6 +670,7 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap);
>   * @max_read_len: maximum length of a read message
>   * @max_comb_1st_msg_len: maximum length of the first msg in a combined message
>   * @max_comb_2nd_msg_len: maximum length of the second msg in a combined message
> + * @skip_addr_in_parent: No conflict check on parent adapter for a given address
>   *
>   * Note about combined messages: Some I2C controllers can only send one message
>   * per transfer, plus something called combined message or write-then-read.
> @@ -690,6 +691,7 @@ struct i2c_adapter_quirks {
>  	u16 max_read_len;
>  	u16 max_comb_1st_msg_len;
>  	u16 max_comb_2nd_msg_len;
> +	unsigned short skip_addr_in_parent;
>  };
>  
>  /* enforce max_num_msgs = 2 and use max_comb_*_len for length checks */
> @@ -711,6 +713,11 @@ struct i2c_adapter_quirks {
>  #define I2C_AQ_NO_ZERO_LEN		(I2C_AQ_NO_ZERO_LEN_READ | I2C_AQ_NO_ZERO_LEN_WRITE)
>  /* adapter cannot do repeated START */
>  #define I2C_AQ_NO_REP_START		BIT(7)
> +/**
> + * do not check for conflict on a given address
> + * used accordingly with "struct i2c_adapter_quirks.skip_addr_in_parent"
> + */
> +#define I2C_AQ_SKIP_ADDR_CHECK	BIT(8)
>  
>  /*
>   * i2c_adapter is the structure used to identify a physical i2c bus along
> 

