Return-Path: <linux-i2c+bounces-4761-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE88492A702
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 18:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BF70B21ED5
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 16:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4353B1494CA;
	Mon,  8 Jul 2024 16:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="SytKgKmR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2130.outbound.protection.outlook.com [40.107.20.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B031487CE;
	Mon,  8 Jul 2024 16:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455205; cv=fail; b=Tp5choJXxOJIiq8gWy5qSuMjAuh1rOCmxNQ1HEc/7SPX5oEW2QyrL49hawZR0YhW7wB2u4dYciI7fwry/d7fw6Wc7oGTBtNeR24ZUNm1mcGZq+2hxs7cejMTqyLYtcTVQAl94kwRGLp7vO4BOEFkgjY3A8cxPseM14xfR4mZbtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455205; c=relaxed/simple;
	bh=z4FqVvzL9gYCTOPTU7KsKuOHbjSrV8y2DJ1eaJqNdZY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uGsAlJpYKNY0zpOeS7W5mqKyI/tL3HdRaFEznyn914qtsjlnx0KArBj+23n2kA5LVHRpFIFvPvm8Zh6+Gz+kRDKfG/D7m9yQtu3VNPtIickQ1ieIhKi0F26O30mvUv5prd1JZ0pM8Bu+zGsDFVEF0vYIpit20FVpqpVcx2CHcgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=SytKgKmR; arc=fail smtp.client-ip=40.107.20.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOQT82E/kMBI0VeIOqh7ZKKLoVngutQpl3GJ9lI6Xn1MnFoSFafP+pXGK0SFjxmfXsezWDRnzqF/OkivCjFrgx4IB5SO8GKv52k5q3lquPNUMcOfyPueCo+kJFNj5YQv5nX95Ja5Ig0GOjIaItWlqFkKTzvctpKyjP21n6RvK3T9gji23uYuWFSWMFQG43tiQOt9BQI0RMwNorGcZVy5KxqHxZWkAp1eOc41TNLyZ9VJhewZPW1bedrX83pcg4QjONmizn2VmDtqIxDXZhN0MolMYefjyiUQSBmZFp9qpLe6qI5wLlMLMDj4Zj5lTzTD54Rwyrtld/WbkvcrdmgZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOz94KksZbowomQ61lp6xZjrFFg4NqyshzZRPsQz5zg=;
 b=ZQIg+9U6Pai2XXhjPxTstRcGpsLRBMwOj/O6FAVX94QcDaBtiJ0Gjoo+FCzgTL48wF+aiyT70vHhYr+YbElQbb8dtP9Xn8LfWnulXMWVhtNpt8vOvEOZF1i5vhOIEkJh9FBfI9CZ1mnv3g9ObZcEG/GwjU8YX7sJv3KmnfnagsOQJfuX6gzHHqufpHTjIUquYa4twCd+y5rDbVJH4k2ehk+mmC+UdmelD+TaUy5/0Tq5EazWLX7ciIQhmJXkmgjFJdaHhAjfH+pXHhEF+dCVpA/PlShUoTTZE8hlJO+7XU0+Jsmoo1XxEYI4HDNd32hUOGG5+zCOcTPs/E6xZcYqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOz94KksZbowomQ61lp6xZjrFFg4NqyshzZRPsQz5zg=;
 b=SytKgKmROcVevsUQvNlb/BS9Rzi8lqyS+5PNr1N4NfhxHk2dkCkvBYgKk+Cqg9hqajG7oUUReAJ8QwrYhEG9nredFmbDsOUBSOoDSKNcOqZlnzYdgYDAPa47Tod9IEONvhqgXPECOGtOUdxm75ahaSId+IMAuwQdBadYAH9QOZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 16:13:14 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 16:13:14 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 08 Jul 2024 18:12:16 +0200
Subject: [PATCH v5 5/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 rk3588-jaguar
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-dev-mule-i2c-mux-v5-5-71446d3f0b8d@cherry.de>
References: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
In-Reply-To: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VE1PR03CA0057.eurprd03.prod.outlook.com
 (2603:10a6:803:118::46) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|GV1PR04MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: f62fe91c-3e69-452d-f8aa-08dc9f68deac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUdudHQ3UTQ2OFk1QU5ZVTRvY0hlcUsyL3YrczZGT3FsT0ZOMDdjSnd0dk1K?=
 =?utf-8?B?NVhkYlA1bjRGZ1ZPNTd5eWtmZFJRaEJvbTFlRW55eitRM3l4TGZnVHFZUm1n?=
 =?utf-8?B?Y3lVQmFFNm1pU3hRSDBTVzdKejFOTkV4SVozMU9aa1hLM29ZaEYvZFkyWldV?=
 =?utf-8?B?RWpycWF3VjR0WGlYYTZ6Snhaa3hsRW9nbi9sd0tEU1k5UDNBa2hlaGZ4dGVD?=
 =?utf-8?B?L3dMWlJJRGpWMjg4ejdXcEY5ZWZTUmpwZ1JxdTBXdWs4V0pSbzNFb0V4dW5X?=
 =?utf-8?B?MkJpM25kOUtlamw2ZmdQckhFWnA2K3FjRlZmN3dkMlVrczh1aWFZOWVHcFJo?=
 =?utf-8?B?YXl1WkNuRENoYmtaMVVaTVo5b1VxWGIrUUdseUhNZjNaTGFod1lWcTF3S09q?=
 =?utf-8?B?c2dMYVVLVWJndm9pRnViS3VzajBjMWlMalBVV3FVTkZFbDVDb1RRclMxQkJJ?=
 =?utf-8?B?V2h3Njhkc0FaaEFoL1pBZFE5bkIyUkIyUFZQWDR2aWs4UFdoZGpzMy9vcjM3?=
 =?utf-8?B?bVFSM2RRdjRSTWpDM1JDRzVTK1lPZElHanZHamcxV2l4S2VCQkpPWlZleHYw?=
 =?utf-8?B?NmlvRGFLcVBHTnFmSkR5TVRBQ211MC91TXdwckR0N21MR2F4dWYvOXFwd3pN?=
 =?utf-8?B?UTQwUTdENmlrOHlQUmxwbUFLVDhwT0hBZmtXQzlDeU95SVBKLzMzSzA4WWt0?=
 =?utf-8?B?Z3YvTHlhQjdid0R4UTF2aHpTb3BaUWduZ2FMYkErWkdZa1RkRTQ3ZlNUZXJs?=
 =?utf-8?B?QzhUOXNMcWxkOEV4VzJEN0k5RVg2bzYxQWluRWRyS3NROHRXSUZXalFJV3NM?=
 =?utf-8?B?Vk01ZEtQY3drUE0xbk1lRTRJVWpvMnJuWWN4ZmRKZm9MaVduMVovSmdtbUVB?=
 =?utf-8?B?QTlzanFhK3VLbEphcnJIVzNMaUlYYTNLbmwvc3ZHa2RtTE5VWjZhK2pRMmRT?=
 =?utf-8?B?RDFOc2VESVZ0ejY3ZlFrTUV2Sit2VzJtVkl1aTNkVWd1RS9CcGd0dTliVTY2?=
 =?utf-8?B?SFlBTmRMclFqbWcvMm10YnR5VWJOVzVXYWVya3BtZWpySzNFVzhJVElxREhE?=
 =?utf-8?B?ekdMQkFvME12U3RsbnN3Mll3a0l0OWZvb2NTMjczVDdSVW1vQXVPaXk0Snl0?=
 =?utf-8?B?MEY2c2wxYVpmZXZJZ0M3VVJiMnd1NzZBQy92WWFpU2ZBNXc2akxuVFRsbGxK?=
 =?utf-8?B?b3k3RjZ2Z2lHUzdNWHg0czdmQ2txQUxJQXVxa0NIclUzdVpwMG1CS3pIa1hR?=
 =?utf-8?B?bDNxZFBZa0FsMnFvcklkaVVzbUV3QnM5NlRCc3pRWlB1WTI4bTlCd3BIVUR3?=
 =?utf-8?B?SGdCaW1zRzFUMk1YTEJLakJBd1h1WDkveGxKbk1sdnZjVWZZUUpKVk5JZUwx?=
 =?utf-8?B?SCtGSDdzdEloMzNQMzV0czR6dXk1MFk3ZUsvblkrN0pUQ0VsS0V3ZUlYVFFU?=
 =?utf-8?B?NER6TVREZWtwSHovTXVxdS9mcWhidTR6ekVDa2wxNUF1NkpSbjhnM0xJNU9U?=
 =?utf-8?B?WXZTcHVEaGtWYnFjbnNmdmxCemJmNW9HZlQ0L3YvcGhMRWFnMmMzVndVMjE5?=
 =?utf-8?B?TzFybk05SlpwTzFOQ1ltRUI5ZkhNYklXbGQ1NzhKRGh1c1lOWVU2V3ZHbktE?=
 =?utf-8?B?RXVxRXJVeFRVMlgvYU1QOVAvKzFWUEQxTVFIdVg2Si8zdW85dGxza1d4WUpy?=
 =?utf-8?B?M2t5amE2dTBoZFdWR0IvZWpqRStGNTdrWlN1RFJzMmxzcDVPTnRocktNSTc3?=
 =?utf-8?B?aG1scUhiZnVpSDZmb2g3YWJpRXk1S3FobkI4cVJkazRCbzhGZGFyZ0ZFZVY3?=
 =?utf-8?B?UDJUVVdvM0I4KzhoR1c3V1JlTmtxMmhtbTJVR0RiVXZZWE12ZnF2c1FENVpR?=
 =?utf-8?B?UnhuNjZsRjZWTjhrSm5sdU1hZWZjb284WW14ZHFKMEh5V0s4TGExU0UvM1pB?=
 =?utf-8?Q?hS0nEs6+cH8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGdVSVVncHc2SmFTeTdMSmxHaDY4bDJ2ZzFLbDJjdFdOR3ExYUgxclRic0V1?=
 =?utf-8?B?a2dUZkg0OHRwRkdNUGJCZ055WmhMcVplaGNmVDBWOFArOUpUVUliK3FJWDdC?=
 =?utf-8?B?Ukc4VUlFZEozbEhoQXNSK2FiTzlCbHJET0J0Z1BQcDZUT1phL3FrM0dnU3Jw?=
 =?utf-8?B?UGtKTS83UUFjRG0vSWlHemdHWlFhSVk0UEpzdzRCenpFQmFIb2RMNVZReFBa?=
 =?utf-8?B?dkExaDZ2ZW1hOW1jc21WWE8zRmNQREI1Qks3Nkxab3dmVndlTTdkc0cxRUNO?=
 =?utf-8?B?ZUhGRFRVUnhxaFB0OVdWUUU0YlM1QkVqWm5Eb3pVbzZGSVBkR2I1MWVBMkVF?=
 =?utf-8?B?T0srZU9YVnJzS3VvcCtYQ3hWV1NpRytHdkFFczVtV3N0Z3VoTWk5QkQxdTVx?=
 =?utf-8?B?ay9kZVpkZmtUYTZNUldXVXVhN3JFSDZwZ2RvRlExVHpnMG0rQTJIeDVwdWV2?=
 =?utf-8?B?OHZTZDQxYldKSWwzQUs0Z3lHb25LTnJseDRoZ3ZsYm55RDZGVG1Edjk2N3NI?=
 =?utf-8?B?cGlYNEVVQTdDRWV4NUszRXBtZ2xxOEVsMlBsMmZ5cXBEaSsxbmt4TklrZGl5?=
 =?utf-8?B?NmhjRXg3NHhEc1hUbWRqTWRPcUh2NDVTNGZpWjEvb3RsOFZjR1poZnAzQ09u?=
 =?utf-8?B?WUJsd3pXcFFjWXppSjNmbGc0SGRUOGtia09jbi95WVFuME9DWlIyZDRBeTFS?=
 =?utf-8?B?Q1pUYndOVUVwWkhKcHZlNm1DRk8zWTJ4OVYyWXRIVkNNRWtoandNMFBGOGts?=
 =?utf-8?B?dWwxcWQ3RUxtR2wvalNIaU0vZDZZZDFKZW5xS1JWTlEwa1Vtd01QVW1xUTNm?=
 =?utf-8?B?YnI0UFFiM0ZmaXY0T2J0TnhxTW5vallQZEdSaDFIWDBOc1NvL0dFQ3dyK3dp?=
 =?utf-8?B?YTEvVXJwSU83dVZmekdaSjNBWVJpN3oxcEFtdlhOK3hqU2xQRUFNL1FwL1VD?=
 =?utf-8?B?a1hZcEZxVlROVWp2R2lKNUVYZEc3bm9taVhCbkVsVmFHdnRoYnByRjNRMmxj?=
 =?utf-8?B?dDQ5Unkvd3N3YVdDc2VWWG11MHNSQUxmZi8wd1k2UUhIa2ZkNHpGSlc4Rng0?=
 =?utf-8?B?eTZSaUhGeHBmTWlwT0VwNkgxdFNNTjJ6L2ppajJ1MzJacDlnYzd0d2dyakRM?=
 =?utf-8?B?RnIrV2hQcDlXeGFxQjZpbFVOa0lTVWxMU2JVd0hTY1BJdHZJQy94dE42dnRS?=
 =?utf-8?B?ak5QdGVrTWZKWUZqQ3ZPSm9UemdBZVBzN0lIeFJXL2M4MjZqOXRzZERUakli?=
 =?utf-8?B?MVEvSlNYV3dCMVZkb084bEgwMkx4eUpaQ3E5SUNScGhidHVxR0k1RzRyWG1l?=
 =?utf-8?B?K1VKanA1akFlSkIwRnpTRmMvZ1BiTEFMdy9wcndPTmxvRlpoWVNid1NMWGlL?=
 =?utf-8?B?bTd3MW1SeTd6OGxUbCsxRnBhdHNiYSs3aGF6ZnZHSHk3MFRtSnNIYS96WXpK?=
 =?utf-8?B?UFltbXNoYy83SnZQQlA3M0VoTExwM2ZBSGxGU0JqQWJYdGRRZ3RyU2JQanl5?=
 =?utf-8?B?MXh4ejZQQzZUWUgybjE5b21WYVh6T3RjVWhUMnJ0VFcyelZpTzdxMDAyQjZh?=
 =?utf-8?B?SEZMOCtaZGtWTy9waDRkMHM3S3M2c3dQNUJZejhaSTdDWGJHazFxMXpTMCt4?=
 =?utf-8?B?OTNyK3BPcUhITVRCRGVJMlByWlIvUnlVM1Uyc0k2TU5IaDh4WmxZUVkrYis0?=
 =?utf-8?B?L0ZCM1dNMW1EY1JhSlVXc1ZiQUh1Slp1NkdSZW4zUWVqNWQ3WFA2MkszTENE?=
 =?utf-8?B?cy9HNGxaWGhZbnRBN0k1OVdHWkFMR0ZnUFJ0NUx0ZDFFL01PK1htbXZPemlU?=
 =?utf-8?B?clFmSHZkbXI5bmxkMW5iY3NLcldBRmwvZUlweWhUQmNVUklWUVZBM3VJN3NS?=
 =?utf-8?B?ZTRpTHZUWUVXcmdWaGFNR04zUUY4OFc2emd2SGhybS8vajJ1ZmYxWkFzTGZh?=
 =?utf-8?B?Z2hPNTRsNGl3MGc5ZWV0dkpDTDd4Y0lBWmV3TW1FZFg2eE83Wk1BZDE5a295?=
 =?utf-8?B?WVJFT295Y1Zwazg5ZWZqb1hDSTAxVTFBQnRxaEJpRFg5ejhYaFdTZnQrK0pp?=
 =?utf-8?B?ZWxrRDZwcnhrWjEzeURTZTVFdGZVZG9LRlVvOVI3NWh5Zlhvcy9xOTdrVUVl?=
 =?utf-8?B?NXpRL0lUakVWVnNVaXdsUzVrejlBL2c2M2xycFUwUDg1UUd5b29yaXgxTzJq?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f62fe91c-3e69-452d-f8aa-08dc9f68deac
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 16:13:14.2158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qW+xxWWtQ4qS3lITrv0aEJxRvwIs5yt2UvgaPQpoyi6hrQIhhCu3FCc1lYLDr1dCvfZgoLSgNMjWXHS6LfhLtSliXEwu5Ymrvtl2WcirCJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9055

Add the tsd,mule-i2c-mux alongside with the amc6821 (tsd,mule) and isl1208
as a default device on the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 31d2f8994f85..56f87a603581 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -32,6 +32,7 @@ button-bios-disable {
 
 	aliases {
 		ethernet0 = &gmac0;
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 		rtc0 = &rtc_twi;
@@ -276,8 +277,25 @@ &i2c0 {
 	status = "okay";
 
 	fan@18 {
-		compatible = "ti,amc6821";
+		compatible = "tsd,mule", "ti,amc6821";
 		reg = <0x18>;
+
+		i2c-mux {
+			compatible = "tsd,mule-i2c-mux";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c10: i2c@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rtc_twi: rtc@6f {
+					compatible = "isil,isl1208";
+					reg = <0x6f>;
+				};
+			};
+		};
 	};
 
 	vdd_npu_s0: regulator@42 {
@@ -313,11 +331,6 @@ regulator-state-mem {
 			regulator-off-in-suspend;
 		};
 	};
-
-	rtc_twi: rtc@6f {
-		compatible = "isil,isl1208";
-		reg = <0x6f>;
-	};
 };
 
 &i2c1 {

-- 
2.34.1


