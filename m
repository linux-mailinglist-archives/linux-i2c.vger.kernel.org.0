Return-Path: <linux-i2c+bounces-14519-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42533CB9525
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 17:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80E8C30B9BCC
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 16:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B7B2D24AC;
	Fri, 12 Dec 2025 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b="eBLPd70g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023092.outbound.protection.outlook.com [52.101.127.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C392D0C85;
	Fri, 12 Dec 2025 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765557699; cv=fail; b=foaIn6WfchqiHw/fwRfSUMBX6sEACiGjCQ6KNu28T6TctzeLXWoWXRnh7mgP1GXjLjWqNX96Jw/qogrcr+zaxLNjLufo4f9BMBSK7et69wH98SeM1gujaKArgP4O2xeZCLceX1fkJlxpfULSw/aBPqIt2fGWiI1+yQ6KgU66iG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765557699; c=relaxed/simple;
	bh=lQM7Zvt0uk1UgbA1S5B02YrrGq66MHgNIx8FkVfsMMw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=m2tQXSZaTlbGEj9/xOw7RgsqHUh7rqaloVrYkpkcEIHv2jnHts1VPeujLC5NB703oIW5PDwvIfgiQtWimWvSmZDjRx1OppbPCVvxWmnJhAgQpGQ+UKWnUA2nRr7YPBcvI49+cJe26XmiwE1yW+zo1Fh4ou0ojLwfb0zptE5Sgno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=eBLPd70g; arc=fail smtp.client-ip=52.101.127.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=advantech.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyFchG4+4Bt9VioVtL3/0EpMgTLVK3uJODPdIocAKI0mcymgB3jSgAQmva35cQUTRnJRy9SWDnhwp3XVY32xoNimY+y1WOYkYBKGkUdNU+zwvNyTz1pw/qjTiD/GhJpu/N3OlDwKUy6vpjaIL3B9pMFN6eG+H4OR+wtVxkPaIQmDy+AW/pZFfwN/Bg+9UwXpASNB1/Z9rtjOVjMr/b/dGluMG1N+y7lx5j2Rb7LaiGorK2w3SWoa5pPGZ4UphkiC9M8n6xqbtB2NjniuYZsQ8RLV0u7dWUpI0KP8agGmhZTAJmk32rvnLl4CYi5GU+FJXh88lM4t3sG0PdgxVbwy4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiEEJ5gy5Muv/Yg+R46RHmTq/PhJ7kPOP5XmcVpUvrE=;
 b=Hxh0PvY+NNA/ic+7CYbjX2SVma5w6kX/pGtyGUU2A4B8nRXYC5yE8JWyU0atvQ/f6211+NxZqJqBjK2B5Dfwx1qn/mnKXOIpui6P4owHq8OaxZ+x/zx9Rs+dSAlBuOZ1CIQftf4hrF9Gf03RFfdSuxkiftksjw4jAy+b9shJlDN4zu+UUQ5OS8JyFAh49eNgAnOlOdJ3f1LysvQ3zey60BLeWhaem9RiyV5+JFWBnjf8P/ND/DeTXt1WYH2vVcN035QTrYaO4WfLAVXkzfF0Yb+Kkhz2aB5GjnxlnpLo7kOOzeMVxp0nFp45nX/PC7oQ7qAxcd/k5wppgkzNE97GNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiEEJ5gy5Muv/Yg+R46RHmTq/PhJ7kPOP5XmcVpUvrE=;
 b=eBLPd70gAxTC1X6IBuYk9nvwDpke9eaDRKZMXCCBw4bobmi+QdEDareM2KxCkeP45agMiTalYUiTRc5AULiYawI7+n1NPWDvMFkyU1d7m0p7QzsLwEIlHFKlrLOZxACFSgAEqBbp+G9tMxsZNethhitqNnLoJpmuxqTypt7qdOTVdHW+pUdkOyZIw38BAhfgbNoADlJCjYOLe7mJWZb0K29CMT4W2Zu2IV8CBU457EJlNKFicGsEriDjeeh/QQDvpS/UPXB7W5UIvcyD5ublucf7ywROVm2WbJ69MU+T4ImXp5luNB5a/1/dKWLazAJFJy0V0tPuN+9oG8ES0O7c9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.com;
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by JH0PR02MB6564.apcprd02.prod.outlook.com (2603:1096:990:3f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 16:41:33 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:41:33 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Fri, 12 Dec 2025 17:40:54 +0100
Subject: [PATCH 3/8] Add Advantech EIO Hardware Monitor driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-upstream-v1-v1-3-d50d40ec8d8a@advantech.com>
References: <20251212-upstream-v1-v1-0-d50d40ec8d8a@advantech.com>
In-Reply-To: <20251212-upstream-v1-v1-0-d50d40ec8d8a@advantech.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
 Wenkai Chung <wenkai.chung@advantech.com.tw>, 
 Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>, 
 Hongzhi Wang <hongzhi.wang@advantech.com>, 
 Mikhail Tsukerman <mikhail.tsukerman@advantech.com>, 
 Thomas Kastner <thomas.kastner@advantech.com>, 
 Ramiro Oliveira <ramiro.oliveira@advantech.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10783;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=lQM7Zvt0uk1UgbA1S5B02YrrGq66MHgNIx8FkVfsMMw=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBpPEWgkZy4sHStD9pAY+x/DYrU4+ajgM6pPyF5V
 UDiE/kjd0SJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCaTxFoAAKCRDO7dCnvL2w
 CS88DACL7fuBfWPP2G3hS5zDcGDcEBDQJ6dv5Goi9d4EB1eXar8B6AEN8rmH3rDY5Jb8FvvUJNO
 7JqsTF+P1HCH22Feb96N/ry26pdM9d26GkJhdCjkz3XT0QpWbRMMI3IYCGqRzdZg716t/BwMomQ
 iqPlqf0HjG2PfqvpCcRr7TNLnr36rJXHpjQ6ZoP8583uN0BBCkBJvEWZQJAv4EtKvi9g5+Ql9xe
 qHQqWDlKPBq7R5vXX+BFMCeKgr1qYMvQbKuQLrci8p0vX/iCJXZJqnLa9HXgrv+sWQZc2ummLOo
 4BvmLJXphZZSiC2xat9p7RcTGT4CebpBC6FClhKCTsZ8yD0//6lLlnvkaTbXZMXOOIcKtcILiMB
 DnvjuRLQ2t+ZClXjaaDJFYECDQ6KL6gtDKZWs1awx76A17NQRGMr7cS8kLsMWyxB1KVmu5eJhCg
 IZiOcHnGu19NPmHHWfBFSUwu6OBj+8oMEwS0rcycqJts0sJm5Sx8ZT7h2pOB/mjVBOWkc=
X-Developer-Key: i=ramiro.oliveira@advantech.com; a=openpgp;
 fpr=B53649E0D19BC99812A1E862CEEDD0A7BCBDB009
X-ClientProxiedBy: FR4P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::12) To PSAPR02MB4502.apcprd02.prod.outlook.com
 (2603:1096:301:21::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4502:EE_|JH0PR02MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: d6dcd453-bfbe-4b52-a37b-08de399d4f5a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDQycWJiMEpsb1F2OW9BckdEVEpUdzlCa09RWmtaY3N2QXpoRWdmNy9SNURz?=
 =?utf-8?B?U3hlUXR3WG96MXlLQ1Nwc2tpNGg5OHloK1dkNFlONzhCZGdHalNYd1FRTURI?=
 =?utf-8?B?SFFOTlJ2NzlZRGFjQmRiS051TlRoVkxGWFQ1MmhnbVgvSWkyb3BaeEViRHA0?=
 =?utf-8?B?TXptNWhaUmZsbUJhMXUvb3NHcU1MNGNReUZVMkZYM1p1RC9NWmlxdFY1Y3Uz?=
 =?utf-8?B?MCs2aFJqbmJIWHBhRnFIUlNGc0UwbUJCdjNJczBmM2NYUlZvS3llWlVnNmZs?=
 =?utf-8?B?bVBYSlV3d0tHc0JFWSszV2pmZnoyOUc0YWZVV216M295RUFmL0VSWjNsanZs?=
 =?utf-8?B?ampXaGdOUENBRE1OeVB2KzhRdTBOaUdlbWdUT0ZmZDQxZVNmc2tYMmhCbkM5?=
 =?utf-8?B?ekc1cGJpWGNRWk9UTEV1am92a0xCc2IyM0QxKzI4WWpCckNpbHV2L3ZYZncx?=
 =?utf-8?B?YzhDOWlLa2NuWmpkOGRSbXdyYU41UUE0SjkyUHdNeDR3TlFOUFlsTGlEbmtl?=
 =?utf-8?B?MDFvK0dmZEtnN1NYZFRtVWhLdW9aOG9STTNKUmNTeW96Y0Q1UVYvOW95cDRj?=
 =?utf-8?B?eERad29ETTVWWWY1WWROQ29PcVBiY0pPUWZueWIvVmlnMVJNbjBKVjZ2S3BZ?=
 =?utf-8?B?LzEzeHRTWk5MZkhub3JiZk9lajQ0VzBONzhXTnRlQWlxRDdKMnpTeGxtYlVh?=
 =?utf-8?B?Wm9zSmlSbURNeVk4ME9aenR6c0NoRjVsbHgreFhtaW9RL0dnaWNUa3ovQlNi?=
 =?utf-8?B?dU4wMVpHODhOSzdDQklxVDNDUXEvYktMazYyOEVIS0hxK3UrNXoyVzFFNUZI?=
 =?utf-8?B?RTRUR2xFZVdjdEMyY0c4NHMwWWxsSUxJMHFKQ0lQT3hYekZMWjdrQWJBWExZ?=
 =?utf-8?B?VjJ4UGJVV1hNTTlOaTJ6b2RoZXpvMk5mbXVxSEhDTFNsUlZNYW96UXdVemdD?=
 =?utf-8?B?anp0OUNrTUMwSUFBWmZFZVlJU0hXaisyZ1NyQ0QyYWZ5OE9QcGNBZVhhWDlG?=
 =?utf-8?B?QVdiNWpLQ2d3Nkprb2xkSjZST0FKbU1pOTVZdUhsNlRHZ1ZvdTMwdG9aWlVI?=
 =?utf-8?B?bVFya0hjeEQ0YU9ZblhSS1hhR3hRY2ZGZ0loRTVmenhZVmlubW1yUkdOeUJH?=
 =?utf-8?B?c1JJQzRQc0lLdElvLzNlTEhTa3VzNVNqbWUxS1BseXRDRzFONld1ME4vNzlQ?=
 =?utf-8?B?MDBBQ3R4V0lIUE82bVdVTVdxYW1ZZWJPTHBRYWxaaW5OUkxDdWY5clJiWEpT?=
 =?utf-8?B?M0luTkpKQ0o2cGJldk1wMXRUVURvQkFVazJsZVJVMUxwOVZFcnBBRTF6L2Jn?=
 =?utf-8?B?bzlCODNVMHZDZUNuYXEvaXp5WHZJRDlpMTJ2eVRYNEpoaWNkOG0zeFptMzEr?=
 =?utf-8?B?MUJMMHhoY3cvWkxtQzE4QVE5cFg3OVRUeitJQW5KYjF0aTBYNno4K28xdFpY?=
 =?utf-8?B?NFFKUERMTlAvbENXa0ZCZ1hyZnJhSFpBNDNXczBZaHZ4cjZGbTVRaVVCVUJz?=
 =?utf-8?B?MURJQzUySDduRGIzYXpvaG5xeTV2ck9KVkRNZkFnZ3RsWXQ1M296M1ZodTZw?=
 =?utf-8?B?SXRtUVhMZlVlM3dXN1JZRVJJand5TTl4bElDSy9wbStlUGhqWC9mdm5FZ3o4?=
 =?utf-8?B?NVRpb3MyeU1tUSszWEEzNHRFbzhhU2VRSk82T1RlcDV3Y0d0RVNnM2NRTFM1?=
 =?utf-8?B?RGVHMmdyZHRsby9FaStFYU9vTGMrNk1uTHVkTWx5MkoySHU4dEN5cW91bjJW?=
 =?utf-8?B?bHlXMElWQm9oSEhhSEtSYk44ektOZ0hxdjZyRGZCN3FIWDBPK0pLbXlQdndR?=
 =?utf-8?B?T2VVSERzYkV4WUE1WnZGZEQ0MTY3R01zQXgxN2VVbGpMOXp6aVdUTTVORUlB?=
 =?utf-8?B?b0NVdm1HZ3BoZ2Rud2k0WHM3eExSeFZGdmJvdkpjMExrRjd1Qm5iWkF5VFFF?=
 =?utf-8?B?WUYxcFJ1M1BlVWtEV0w0dnBPQjBuclFGd0VyYndpSVd3S0x5K2pIM0tMMmNO?=
 =?utf-8?B?OFkvVVlOa0VVUGkvUEhPdHZTYjEzbkJVVjdWS2c2dWtJVmlTS0hBWXVZblpm?=
 =?utf-8?B?SlZhYVpXc2tjd0lneEdoenJKRUloY3kzSVRxUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmlVc3ZSME95akNMbXpGNjZ3bXg5TForN1FLbng1SGlRd3FyUVNSeUZXRXZW?=
 =?utf-8?B?WnVUcW9JWnZzMGFuczI2UjI5cXcvb1pyby9icGZIZ0FjdHpNZW1RY3czUTIw?=
 =?utf-8?B?K3I4UUNwUjJTL1RXMDZpWGRxeWF2N1JxMy93bndkVFUwZ1BKbDNEelpvWHJS?=
 =?utf-8?B?WFJjN2ZQanNRQUpaRnlvWFFYTmQ5dEJoYkVsNWs2RDJYbkF3MmtSN0JDTkV5?=
 =?utf-8?B?ek5QZFBKYlFpZVJHc1RPTTFNaDRUVnVOdnVtS3U0ZkNTYWxnYW1HZjFkVnlv?=
 =?utf-8?B?Z2dDdm9udGl3M3V3M1FqUnNhS0czTWtJZXE4Y3Bqa2ZPd04zR3VFQ0tkQTl2?=
 =?utf-8?B?M0s3Qkl2UmxIWTFWTFQ0Zlkwb0dJbjNyYlBoTnFPN0w0cm1sd2ozd3dvWi8y?=
 =?utf-8?B?ODZvaHZHamlpYnhJWkJBTFFnMStVTkVsdk5nV3dDaFJjSEhXdmVYRU5nYkdl?=
 =?utf-8?B?UnNDTFFzUW1pa2VaRWhMc04xMVJJVUNlN084VWl6YWI4aElBeTdIZVZtQUdB?=
 =?utf-8?B?elpIaHR5UlcwZFg1RXJMeW13MXJWeVpNK3c5UmZ3QlE0WnZwOTBscHYxck9M?=
 =?utf-8?B?M2ZsRkVKalhJUFA1dzhqM3B4Y3I4NEprRDdpV1liQm1RblB6Sm00Mi8ydWZ5?=
 =?utf-8?B?NnViZXdoYmNrclc1RXlvVGZQZiszY3RYZzM3TWVKRU5FMkR3OFh3YmhBc0I3?=
 =?utf-8?B?dEN1NWgyVDJ5VitSekwwR3F1NEdzZUVsVWdXL0VtczAyNFdzZnU2MmpIZU1u?=
 =?utf-8?B?dFQxMEptS3g5SU5lSEEzQWdOMVBzNzdycUhSZmh5YlNwQW00aDVvWjRaZ1l1?=
 =?utf-8?B?enMzUjBpckFiK0ZZQk9hNFlXQTVtZWlMYk8vU05icmsrS2xtYjZKVFlzREY2?=
 =?utf-8?B?UmNqUGVsSDh1dTY0SUpsUWdoVVBUZ3UyaXlSOEZCbTlJOStuZDF3Z0JFa2pE?=
 =?utf-8?B?Y0FPa3VweFozak5tQWk0Q01oczljSGFEQTAzZ1NnUVM1RVMzWGhDNGQrQ1h5?=
 =?utf-8?B?YkpwY2t1VFoyZHNjVWszcXM5YUFUdEErTTJLN0pSSkgzcUJ5MXg3TkY0OXh2?=
 =?utf-8?B?eFJ3ZVRyZ0lXWmxZOVlPb2NuNElxL2MyNDhyeHdPeE9YYVJOTEFLbCtvcUs1?=
 =?utf-8?B?UUVvdWZvSzFHb2x5VTFLaEd6bEgyUFRDaTM2c24xUS9hdnRCcWFHRGxpYk5I?=
 =?utf-8?B?N1JxakNsYVpCQnRiK1dzSmFBV2NXdjFKOUNzck8wanVnZGVtaVU0MFdtZUR5?=
 =?utf-8?B?UkJ2Mnc4WU9rY2JSSldMRHM3RXZDUmxyTmtleW02SC9vV1NwK205LytWOExR?=
 =?utf-8?B?c2YrU3lLU0l4azE1RTlTQzdKNFJZbTVYeVl3ZC9nSzYwUWhlV0Y0QjdWRXlm?=
 =?utf-8?B?OXRZNzk1SW8zWGtSYmRhQzhteFJQdk1vR3h4eEs4TThIaGF6UXFuR3pFSm15?=
 =?utf-8?B?Q3NxYk96d3NJeWxPOWRrMGRiSzg1elY5S2VKb0ZQQXJHN2xHSXFpUTcyMVRO?=
 =?utf-8?B?eE1INDZweGluOXRMemZNY05jcVkyTmZadDV0dU1xNElVUDZHVkN3dEMvODdr?=
 =?utf-8?B?R3ozUXNITjM5c1VOL0NUVURXWCtoOWxsNnFiOXVLUk5oRlFjWVdydjMrYVNC?=
 =?utf-8?B?WHlwZTVydkJrM29kQVhBT1ZlQkpMSnpuaHBwWDRTSGxoY1VTaTRlWjNwcWhr?=
 =?utf-8?B?d0l3MzZxVGlXUzIvazZpajdaTm1DRFROKytyVUo1RG9wdlZVci9tdlhpYm1t?=
 =?utf-8?B?cWZ1YUhoMmpCVklsd0ZiZUt3VTBzcGlHMERDYVdnYk4vSGt1VElCWENENFpT?=
 =?utf-8?B?TzBSdnJuY09GeDA0Rk9Mb1loUzNDUEJqcFB5aWN0OTZzTWNJc00rcHZVb1lO?=
 =?utf-8?B?TlNnTEFhTEtuclNhV1lLeGZ5Z01hQ1NJY1JST3VuOWY2MWpQam5hTkt6ajdr?=
 =?utf-8?B?KzJGbjM5Z2IxLzY4WDV0eWRqZ0V1eTExTCs5Y3A2Nk0rNVVNM0RnZzM4dDNy?=
 =?utf-8?B?dmREVlhRWXh3ZldScHhvazNzditVMXQ4MDNGZDFueTBOTTVvSnNuMXl1bG42?=
 =?utf-8?B?ek1xN24vbWdpa2tOaGhEUkRBVXE5ZVBjbEpUWFY5M3hpM1Z2ZE1ldnFNVmpQ?=
 =?utf-8?B?WkJSblhRcnBQaUJpTEZzb1E5SStMNXB5TTQ5NGUwelRROWh6dW5tKytzNFJJ?=
 =?utf-8?Q?6qVN5dDiMhmzEc/77ckpKHI=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6dcd453-bfbe-4b52-a37b-08de399d4f5a
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:41:33.8286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4O/586Qpr6tGjJMPxtOsfGyVRTufL5Xdz4x/aaZMOGlJhuNUdnEb+s+ryZFp6SeZvQfVfafUEcP8n0RRDBK3IwLcPs9VzpYAEV9Ytp2wfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6564

This driver controls the Hardware Monitor block of the Advantech EIO chip.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS               |   1 +
 drivers/hwmon/Kconfig     |  10 ++
 drivers/hwmon/Makefile    |   1 +
 drivers/hwmon/eio-hwmon.c | 344 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 356 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 359d4a13f212..fdd39b152f41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -620,6 +620,7 @@ ADVANTECH EIO DRIVER
 M:	Ramiro Oliveira <ramiro.oliveira@advantech.com>
 S:	Maintained
 F:	drivers/gpio/gpio-eio.c
+F:	drivers/hwmon/eio-hwmon.c
 F:	drivers/mfd/eio_core.c
 F:	include/linux/mfd/eio.h
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 157678b821fc..08993b993596 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2043,6 +2043,16 @@ config SENSORS_DME1737
 	  This driver can also be built as a module. If so, the module
 	  will be called dme1737.
 
+config SENSORS_EIO
+	tristate "Advantech EIO HWMON"
+	depends on MFD_EIO
+	help
+	  If you say yes here you get support for the Advantech EIO
+	  temperature, voltage and fan speed monitoring block.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called eio-hwmon
+
 config SENSORS_EMC1403
 	tristate "SMSC EMC1403/23 thermal sensor"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index eade8e3b1bde..e69f03b41fae 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_SENSORS_DME1737)	+= dme1737.o
 obj-$(CONFIG_SENSORS_DRIVETEMP)	+= drivetemp.o
 obj-$(CONFIG_SENSORS_DS620)	+= ds620.o
 obj-$(CONFIG_SENSORS_DS1621)	+= ds1621.o
+obj-$(CONFIG_SENSORS_EIO)	+= eio-hwmon.o
 obj-$(CONFIG_SENSORS_EMC1403)	+= emc1403.o
 obj-$(CONFIG_SENSORS_EMC2103)	+= emc2103.o
 obj-$(CONFIG_SENSORS_EMC2305)	+= emc2305.o
diff --git a/drivers/hwmon/eio-hwmon.c b/drivers/hwmon/eio-hwmon.c
new file mode 100644
index 000000000000..164591aa31a7
--- /dev/null
+++ b/drivers/hwmon/eio-hwmon.c
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * GPIO driver for Advantech EIO embedded controller.
+ *
+ * Copyright (C) 2025 Advantech Corporation. All rights reserved.
+ */
+
+#include <linux/errno.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/eio.h>
+#include <linux/module.h>
+
+#define MAX_DEV 128
+#define MAX_NAME 32
+
+static uint timeout;
+module_param(timeout, uint, 0444);
+MODULE_PARM_DESC(timeout,
+		 "Default pmc command timeout in micro-seconds.\n");
+
+struct eio_hwmon_dev {
+	struct device *mfd;
+};
+
+enum _sen_type {
+	NONE,
+	VOLTAGE,
+	CURRENT,
+	TEMP,
+	PWM,
+	TACHO,
+	FAN,
+	CASEOPEN,
+};
+
+struct eio_key {
+	enum _sen_type type;
+	u8 chan;
+	u8 item;
+	u8 label_idx;
+};
+
+struct eio_attr {
+	struct sensor_device_attribute sda;
+	struct eio_key key;
+};
+
+static struct {
+	u8   cmd;
+	u8   max;
+	signed int shift;
+	char name[32];
+	u8   ctrl[16];
+	u16  multi[16];
+	char item[16][32];
+	char labels[32][32];
+
+} sen_info[] = {
+	{ 0x00, 0, 0, "none" },
+	{ 0x12, 8, 0, "in",
+		{ 0xFF, 0x10, 0x11, 0x12 },
+		{ 1,    10,   10,   10 },
+		{ "label", "input", "max", "min" },
+		{ "5V", "5Vs5", "12V", "12Vs5",
+		  "3V3", "3V3", "5Vsb", "3Vsb",
+		  "Vcmos", "Vbat", "Vdc", "Vstb",
+		  "Vcore_a", "Vcore_b", "", "",
+		  "Voem0", "Voem1", "Voem2", "Voem3"
+		},
+	},
+	{ 0x1a, 2, 0, "curr",
+		{ 0xFF, 0x10, 0x11, 0x12 },
+		{ 1,    10,   10,   10 },
+		{ "label", "input", "max", "min" },
+		{ "dc", "oem0" },
+	},
+	{ 0x10, 4, -2731, "temp",
+		{ 0xFF, 0x10, 0x11, 0x12, 0x21, 0x41 },
+		{ 1,    100,  100,  100,  100,  100 },
+		{ "label", "input", "max", "min", "crit", "emergency" },
+		{ "cpu0", "cpu1", "cpu2", "cpu3",
+		  "sys0", "sys1", "sys2", "sys3",
+		  "aux0", "aux1", "aux2", "aux3",
+		  "dimm0", "dimm1", "dimm2", "dimm3",
+		  "pch", "gpu", "", "",
+		  "", "", "", "",
+		  "", "", "", "",
+		  "oem0", "oem1", "oem", "oem3" },
+	},
+	{ 0x14, 0, 0, "pwm",
+		{ 0xFF, 0x11, 0x12 },
+		{ 1, 1, 1 },
+		{ "label", "polarity", "freq" },
+		{ "pwm0", "pwm0", "pwm0", "pwm0" },
+	},
+	{ 0x16, 2, 0, "tacho",
+		{ 0xFF, 0x10 },
+		{ 1, 1 },
+		{ "label", "input"},
+		{ "cpu0", "cpu1", "cpu2", "cpu3",
+		  "sys0", "sys1", "sys2", "sys3",
+		  "", "", "", "", "", "", "", "",
+		  "", "", "", "", "", "", "", "",
+		  "", "", "", "",
+		  "oem0", "oem1", "oem2", "oem3"
+		},
+	},
+	{ 0x24, 4, 0, "fan",
+		{ 0xFF, 0x1A },
+		{ 1, 1 },
+		{ "label", "input"},
+		{ "cpu0", "cpu1", "cpu2", "cpu3",
+		  "sys0", "sys1", "sys2", "sys3",
+		  "", "", "", "", "", "", "", "",
+		  "", "", "", "", "", "", "", "",
+		  "", "", "", "",
+		  "oem0", "oem1", "oem2", "oem3",
+		},
+	},
+	{ 0x28, 1, 0, "intrusion",
+		{ 0xFF, 0x02 },
+		{ 1, 1 },
+		{ "label", "input" },
+		{ "case_open" }
+	}
+};
+
+static struct {
+	enum _sen_type type;
+	u8   ctrl;
+	int  size;
+	bool write;
+
+} ctrl_para[] = {
+	{ NONE,     0x00, 0, false },
+
+	{ VOLTAGE,  0x00, 1, false }, { VOLTAGE,  0x01, 1, false },
+	{ VOLTAGE,  0x10, 2, false }, { VOLTAGE,  0x11, 2, false },
+	{ VOLTAGE,  0x12, 2, false },
+
+	{ CURRENT,  0x00, 1, false }, { CURRENT,  0x01, 1, false },
+	{ CURRENT,  0x10, 2, false }, { CURRENT,  0x11, 2, false },
+	{ CURRENT,  0x12, 2, false },
+
+	{ TEMP,	    0x00, 2, false }, { TEMP,	  0x01, 1, false },
+	{ TEMP,     0x04, 1, false }, { TEMP,	  0x10, 2, false },
+	{ TEMP,     0x11, 2, false }, { TEMP,	  0x12, 2, false },
+	{ TEMP,     0x21, 2, false }, { TEMP,	  0x41, 2, false },
+
+	{ PWM,      0x00, 1, false }, { PWM,	  0x10, 1, true  },
+	{ PWM,      0x11, 1, true  }, { PWM,	  0x12, 4, true  },
+
+	{ TACHO,    0x00, 1, false }, { TACHO,	  0x01, 1, false },
+	{ TACHO,    0x10, 4, true  },
+
+	{ FAN,      0x00, 1, false }, { FAN,	  0x01, 1, false },
+	{ FAN,      0x03, 1, true  }, { FAN,	  0x1A, 2, false },
+
+	{ CASEOPEN, 0x00, 1, false }, { CASEOPEN, 0x02, 1, true  },
+};
+
+static int para_idx(enum _sen_type type, u8 ctrl)
+{
+	int i;
+
+	for (i = 1 ; i < ARRAY_SIZE(ctrl_para) ; i++)
+		if (type == ctrl_para[i].type &&
+		    ctrl == ctrl_para[i].ctrl)
+			return i;
+
+	return 0;
+}
+
+static int pmc_read(struct device *mfd, enum _sen_type type, u8 dev_id, u8 ctrl, void *data)
+{
+	int idx = para_idx(type, ctrl);
+	int ret = 0;
+
+	if (idx == 0)
+		return -EINVAL;
+
+	if (WARN_ON(!data))
+		return -EINVAL;
+
+	struct pmc_op op = {
+		 .cmd       = sen_info[type].cmd | EIO_FLAG_PMC_READ,
+		 .control   = ctrl,
+		 .device_id = dev_id,
+		 .size	    = ctrl_para[idx].size,
+		 .payload   = (u8 *)data,
+		 .timeout   = timeout,
+	};
+
+	ret = eio_core_pmc_operation(mfd, &op);
+	return ret;
+}
+
+static ssize_t eio_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct eio_hwmon_dev *eio_hwmon = dev_get_drvdata(dev);
+	struct eio_attr *eio_attr =
+		container_of(attr, struct eio_attr, sda.dev_attr);
+	const struct eio_key *eio_key = &eio_attr->key;
+	int ret;
+	u8 data[2];
+	u32 temp_val;
+	signed int final_val;
+
+	switch (eio_key->item) {
+	case 0:
+		return sysfs_emit(buf, "%s\n",
+				  sen_info[eio_key->type].labels[eio_key->label_idx]);
+
+	default:
+		ret = pmc_read(eio_hwmon->mfd, eio_key->type, eio_key->chan,
+			       sen_info[eio_key->type].ctrl[eio_key->item],
+			       &data);
+		if (ret)
+			return ret;
+
+		temp_val = data[0] | data[1] << 8;
+
+		final_val = (signed int)temp_val + (signed int)(sen_info[eio_key->type].shift);
+		final_val = final_val * (signed int)sen_info[eio_key->type].multi[eio_key->item];
+
+		return sysfs_emit(buf, "%d\n", final_val);
+	}
+
+	return -EINVAL;
+}
+
+static char devname[MAX_DEV][MAX_NAME];
+static struct eio_attr devattrs[MAX_DEV];
+static struct attribute *attrs[MAX_DEV];
+
+static struct attribute_group group = {
+	.attrs = attrs,
+};
+
+static const struct attribute_group *groups[] = {
+	&group,
+	NULL
+};
+
+static int hwmon_init(struct device *mfd, struct eio_hwmon_dev *eio_hwmon)
+{
+	enum _sen_type type;
+	u8 i, j, data[16];
+	int sum = 0;
+	int ret;
+
+	for (type = VOLTAGE ; type <= CASEOPEN ; type++) {
+		int cnt = 1;
+
+		for (i = 0 ; i < sen_info[type].max ; i++) {
+			if (pmc_read(mfd, type, i, 0x00, data) ||
+			    (data[0] & 0x01) == 0)
+				continue;
+
+			memset(data, 0, sizeof(data));
+			ret = pmc_read(mfd, type, i, 0x01, data);
+			if (ret != 0 && ret != -EINVAL) {
+				dev_info(mfd, "read type id error\n");
+				continue;
+			}
+
+			for (j = 0 ; j < ARRAY_SIZE(sen_info->item) ; j++) {
+				struct eio_attr *eio_attr;
+
+				if (sen_info[type].item[j][0] == 0)
+					continue;
+
+				eio_attr = &devattrs[sum];
+
+				eio_attr->key.type      = type;
+				eio_attr->key.chan      = i;
+				eio_attr->key.item      = j;
+				eio_attr->key.label_idx = data[0];
+
+				snprintf(devname[sum], sizeof(devname[sum]),
+					 "%s%d_%s", sen_info[type].name, cnt,
+					 sen_info[type].item[j]);
+
+				eio_attr->sda.dev_attr.attr.name = devname[sum];
+				eio_attr->sda.dev_attr.attr.mode = 0444;
+				eio_attr->sda.dev_attr.show      = eio_show;
+
+				attrs[sum] = &eio_attr->sda.dev_attr.attr;
+
+				if (++sum >= MAX_DEV)
+					break;
+			}
+			cnt++;
+		}
+	}
+
+	return sum;
+}
+
+static int hwmon_probe(struct platform_device *pdev)
+{
+	struct device *dev =  &pdev->dev;
+	struct eio_hwmon_dev *eio_hwmon;
+	struct eio_dev *eio_dev = dev_get_drvdata(dev->parent);
+	struct device *hwmon;
+
+	if (!eio_dev) {
+		dev_err(dev, "Error contact eio_core\n");
+		return -ENODEV;
+	}
+
+	eio_hwmon = devm_kzalloc(dev, sizeof(*eio_hwmon), GFP_KERNEL);
+	if (!eio_hwmon)
+		return -ENOMEM;
+
+	eio_hwmon->mfd = dev->parent;
+	platform_set_drvdata(pdev, eio_hwmon);
+
+	if (hwmon_init(dev->parent, eio_hwmon) <= 0)
+		return -ENODEV;
+
+	hwmon =	devm_hwmon_device_register_with_groups(dev, KBUILD_MODNAME,
+						       eio_hwmon,
+						       groups);
+	return PTR_ERR_OR_ZERO(hwmon);
+}
+
+static struct platform_driver eio_hwmon_driver = {
+	.probe  = hwmon_probe,
+	.driver = {
+		.name = "eio_hwmon",
+	},
+};
+
+module_platform_driver(eio_hwmon_driver);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("Hardware monitor driver for Advantech EIO embedded controller");
+MODULE_LICENSE("GPL");
+

-- 
2.43.0


