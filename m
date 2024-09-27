Return-Path: <linux-i2c+bounces-7042-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B51987DDC
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 07:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D552D283F70
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 05:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2A8176255;
	Fri, 27 Sep 2024 05:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="j0/3HB82"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2132.outbound.protection.outlook.com [40.107.237.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FD5175562;
	Fri, 27 Sep 2024 05:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727414743; cv=fail; b=gMDn/MmPgwdYq+/4MpJU1gttTPQMHg9zL7fpECrVU+idRhiyvzE6Jzue8unKrb5irX1hqwY9DwJ3B7TKT8V1wyxXOADR42M72UF/cdO13eXTuLD6k03WwZUdIwCUVh0yS1ZVLT/QcEZnnFA9WxgGp9NvUAKq+x0j+T7vC5qAKKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727414743; c=relaxed/simple;
	bh=iggXLZrvO31cSQa/efuFQnc8m3BGiQEGwSczGGaVlGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mqhPMgl7PN1Z2wl4z66ruikzlK1KROfNSLjnQBv+n4Wctm/L1hfrjBxRP3PhUeHCQK+qx9wvHYaU5Au5NqEKzW/s+26Mo3Aq8CQocFH1rvXxxiwxJwvK9Ci5BxqOAAUNRkC5vrLWd4SWjlmjsPqJfUwxreNtUx0SeqBpPvDyuy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=j0/3HB82; arc=fail smtp.client-ip=40.107.237.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/6fRaeHJ9SUla1XMeQhp7zjOcYdTm1Tyg1ezV5ujxFy5G7eS9NkgZc/Bn0f7Mu3Efij+xpQcNQdm30HX2vQ7CU9kXRkmp+AbEMO8eM9nJVqv7fd6Cx3GcZeB0nykrZqAHS95FMoGtjbv8xyd6aw1/FkUzc2AseXRU14sbdisj3dC7BQom1dkc73eAYLAnSeVahkH48R2qog0F+h7pHK1K0+DS28HLjIhIkpfRB8cocALQLJsH66ugkKGdZIDksun4d+OLCfLEjb5XgbqVVQ3FUotz7RQIFq+vtw1MIOhO8lCdoLUUeRD/7JjUDgSeDki2WgbVgLFXdPFDelP0Vb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfrxJmvZ/E5r0G5Euv9dngxSdBDj9xpz/WN8F/z1ciU=;
 b=TuTD0QATxJnJEVhazk7t+G6lgm4HmXBKnr5PQIvK9lI6iEc+iZOJDt9LRPosm5Om0TYzuKIhSqLEMR6oZ+gJ5Ve5n+XJ6qQUfkJJYv8BC0MLWkvqMuPLFXLVYw70AtXKVowP8C36XJJTxBIyWtEqCM7kG/xDJs1qUklNIwv1SKK2nVwXHqpTwPZje84Kb1DBMC1xFJiI5UhIUOq0A3m60G61OiR/4Xg1Hv7J5ZGfv6A/ETXZRDgRAvwSZYm05wd8lW0avQ3/pokN7H2NQ+fOze7al/+7Kg7cSciIDso6w4Lxq8KcZaVeaqP1WHNww8OkyBiafrQVcdZ4eoorhXH0Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfrxJmvZ/E5r0G5Euv9dngxSdBDj9xpz/WN8F/z1ciU=;
 b=j0/3HB826niGZwXiN9sE5423tZRfHlQYkLrlwSwjlU6ZUbTT3mw/m9/Z6ikmlxnOEy7PvbflCX6m1TbhEcy8GuC3N2iV3eQQ3ytDTnYe+Ra1Vul/9q20fnFgjeTnMl50n3dlt3jV+jMolpc2Pa0ISK0R3ilGp8aH9mHlnOGYfTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by DM6PR14MB3449.namprd14.prod.outlook.com (2603:10b6:5:1ed::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 27 Sep
 2024 05:25:37 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8005.021; Fri, 27 Sep 2024
 05:25:36 +0000
From: Michael Wu <michael.wu@kneron.us>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Morgan Chang <morgan.chang@kneron.us>,
	mvp.kutali@gmail.com,
	Michael Wu <michael.wu@kneron.us>
Subject: [PATCH v2 2/2] i2c: dwsignware: determine HS tHIGH and tLOW based on HW parameters
Date: Fri, 27 Sep 2024 12:22:17 +0800
Message-ID: <20240927042230.277144-3-michael.wu@kneron.us>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240927042230.277144-1-michael.wu@kneron.us>
References: <20240927042230.277144-1-michael.wu@kneron.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYAPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::16) To IA1PR14MB6224.namprd14.prod.outlook.com
 (2603:10b6:208:42b::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR14MB6224:EE_|DM6PR14MB3449:EE_
X-MS-Office365-Filtering-Correlation-Id: 951e3701-48dd-4909-8dd6-08dcdeb4d14a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014|80162021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3pVQjJCR3NleVhjVXBKTG42QzZ4WHV0ZTF1aDVrQ0drMDE2QzZEaHV6cTFT?=
 =?utf-8?B?UWhMMWNJeEgydzVEVXlHK04zdS9jMlFvdGxTQWVFTXA2YnlZbndvODZWZGcy?=
 =?utf-8?B?TXV3NGtxTW03RVBMR1dpL3F5Qmp2SGxvbk1ycWJ2K3NBOGpYUTVOSWtlR2ZX?=
 =?utf-8?B?amV0bzdhenptWFgzbUNGSmh5VVdHMFBSSlhtekxyRnJJM28xRitBNkVDQ29N?=
 =?utf-8?B?QWZIRHJPRWdRMUErcldvYjRxSG5BNXp4bmtKbFl3Qm50WnlEQnhVSE95NEFF?=
 =?utf-8?B?V0tURXpieWVvY09IN0JWbkYyTjVYL3dBV2x2Z2VaOUNPcllVVDBLbnZZMDNF?=
 =?utf-8?B?aUpXNkFqUzQyaHk3OGY5WmgxaWhhZTlsSmZjVHBxblg0ZGt2YTNaWEtmeXpZ?=
 =?utf-8?B?VllCWlZ5Zlk0cjV3b0R3N2tCeXZVNTRxZ1laQy9oR21INVhLaGkrMWh2QUJW?=
 =?utf-8?B?UldmSk1RMWpMcHpwTFV5Q3EzWjlxWkFNKytEUWUyNldDUitZem9rdXgrZWM4?=
 =?utf-8?B?c245QXRRS0ZGMVRvQXZpd1FqNyt0S0R6L2RndzZoRmFWUUtyYWZhK0hPRHNw?=
 =?utf-8?B?cG44NGVtQnJyODhaU0g2clFsRDlndHorV21XbTdlY2RWSFkxeW45VXMrSm1Q?=
 =?utf-8?B?YUc4a1FleUptRy9QWnBDeE54WDVvdUlpbW9JNU00UTNOMnh5aXBzSFpaM2V1?=
 =?utf-8?B?eDFCeGp2WW5ZNFBpVnVscUNUS0llbjYyTjlPQTZuOTFBTWtycHJKUS9MM1Fo?=
 =?utf-8?B?d21mbnZuZ2dReWVYbHpRdGNiaG9DUy84TnQ2WFhaSnZIVUpqYTZQTWxlV0ZC?=
 =?utf-8?B?WDhMdktoYkttNjkyc2Fwc2dIYU9laXJNREdnZUV5dXROVGQvb0lTTW1ySzVn?=
 =?utf-8?B?a1BKejhhZ3FvRUNIL0diTmJKUEpkYUJtdkt1cG1rajUzZElWbjlCSkJOaGNS?=
 =?utf-8?B?RXlxZmRXdE9uUUhmYXhPRVRzNTdIbWNSRWFCYzFMRGRmSmxRanFlS0RwYmJl?=
 =?utf-8?B?UW1CeDkrdmhMMytDWnhVR1RVdnBPbE5aNUp4SUp2cyt0T3hRNWo4ckx3bXNF?=
 =?utf-8?B?WkE4YXJWT1ZZYXI1SjFEUzBNVTdXbEtYMldJUXZUMDI0QlpQZDhPeUZBVEtV?=
 =?utf-8?B?Vnlaa05sMWs2UkVGaTVBM2NVR1JiMVQ0dmJaU0pJMlFZaGljUzh1OUlZOTNk?=
 =?utf-8?B?b2tpcVdUdnlmQ2VmQnpSOXMxRFpFclF1cVJ4ZFZGaU9DdURORGE3SktpYytG?=
 =?utf-8?B?SHBZM1M2ZExRV0lxL3NnSEhZRkFjdE1JT09TbHl2S2NLbjlvRSt3eGxJK3dX?=
 =?utf-8?B?cHplZ3VCRUQrNjByQU1FMnhXaGJxQnNpcDdDU1kwclcrRkxPekR4RXp1Y3BO?=
 =?utf-8?B?NE94STh3UXVHYzBFYWdVY29VY0pHaXpZQU0xeEs3eWU2WkpXQkZiaDdWSXhT?=
 =?utf-8?B?dm1wbk9MaXlsRzVnSWNybUlrSDVrejkxNmtydWR3ajEza1ZwblZRQmIvQjRU?=
 =?utf-8?B?MXV5QVk0T2Q2aUpOK2F4eVFHOTRDbjczMkV0S1phR05DNndSVTJjYWdlNWs4?=
 =?utf-8?B?M3BXT3FIbE1WL0JOTlZlVlB6NGZVZ0JQVFhlRktQc2hoMXV3UEZFdjhXUUlE?=
 =?utf-8?B?KzRNOEVSTnFwU1ZUOURtQzNPSWQxZkZNR0trRnBpRE9IN3czckYzS1hMTktl?=
 =?utf-8?B?Nk9nczhIY2IyRElFbXNWTUxIMURHY09FcFFuZWs3QTU2MnVxeTJzWHFTZ0hL?=
 =?utf-8?B?SkdJNS9OUkFGc09FVk1MZDdyUmRCY3FzZEJDcGlhU09uWTFDTUw1NWhZdzJ1?=
 =?utf-8?B?Um5yL2daaGRGUk9UUXV6cmlPdHRJd1c0YUo4N3NRKzVEa1ZqVVhWWTlGMk9X?=
 =?utf-8?Q?MERDsRrQQoQBl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014)(80162021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzlQZGVNME9vY2FOMWYrb0RJeVNFdnFXblhaRnFFMmlVY3k3clpNNUg5RUt0?=
 =?utf-8?B?eitCck9zdTRPay9mQkp2WkFVa256YkpxVUFNL2hJWm16dmlpN3N4QVY2MytY?=
 =?utf-8?B?MlNxRnNWWjBvc0RZa0Zwd0ZWY1JJK01mVEJtNXZha09yc3VZcHVQbkdBekJL?=
 =?utf-8?B?STdkSTJ3NkxXeGdQcmhXWkFkYVM2azlkVU4vYVNYK1grVGVEYSsreGpKcmZG?=
 =?utf-8?B?ZHVnQVJEbFdiOVpyUVdqWWhOVko4a0I5OXJuNWZIbjB3dDhoZjBhQkFhZjFx?=
 =?utf-8?B?ckFEbTdBZGJVNE55b0NyYjFxcVBEREd6MlFJRlRVdlRpMGhnSElRWUZYN05o?=
 =?utf-8?B?ZHpNTlJVY2IyblpCT0RkcTVBbUQ5Q0RjSG5GSm5iMGJJZklNNHhEZXlkMlZ0?=
 =?utf-8?B?dEh4YXhrSFdLOWNRYk5NTnhOYTg4dUp5Sk1OZHJpazZnT2RWdmZWN1dzbm5z?=
 =?utf-8?B?VnRPU3VSS3p6UmpnYWJOTGhqZGx0SW91RGJSVlhXYWxLbWplejJHMHQyS25p?=
 =?utf-8?B?T3g5b05OOS9wc1RNRHVLNDF6M1BjenNGbzlVaHFxY21EZk91OWVDcjY3cWFC?=
 =?utf-8?B?WUV4TDk1TEhSUlduY0UwOEJGZ1dqVkpaYUtqNkJ2bzN4M2dydUVzeUNHSW51?=
 =?utf-8?B?alExSUtjQk5PclQrb1hKdWJHSTZISURuM3dkRk50aUkxeTU3UVZmZUVuYnRT?=
 =?utf-8?B?QWQ4K2psWHZqSjhSUE9WZzFxeWtvS2dwVEY5SVNGRlVzc0N3Y05aN2NhMWto?=
 =?utf-8?B?OEhBanNPamt1NHRFb1N3emxMdjNBa0ZvWXRmMndLSzBhaU5Eb0RFSFNoNmwr?=
 =?utf-8?B?TW1TM2pYNmg4Sll1aWg5NHIvalhoclUxeUUzZDNla2V0TmhnbHQ5MjY1TUVV?=
 =?utf-8?B?OGhKYkNLYTlzVm94ZG9WelUxTG5Jek5Sc2E1SUNUUjNsaVQrNW85VWF2dExF?=
 =?utf-8?B?WUIzd2o1cldZU0ExNVFLcFQ0UjlicHNwdkk2ZFlXSEVCN3VHazVCTXJPZy9j?=
 =?utf-8?B?RitvVG9hQXBJUDNHd1VCcXhIOFc5SU5zK3BybXQ0ZitNd3BmVE1QQnh3L1Zr?=
 =?utf-8?B?K3U0T0ZrM254bUJLVnJ5OGo5akU4cGw0cm9rMGhkZm5Ud0tCU0Q0R2tYRUZJ?=
 =?utf-8?B?THJPTXNaRnNkOENVbHBLcitPVlJuMEtyNGVtZDN5TEFSWTB4cXp0WnJWRTFF?=
 =?utf-8?B?ditIMThVSHVXbG5ucUgzeUVUbGhSUXY1bEdhcG1JUkxEcmwvcGdGT3gxODJO?=
 =?utf-8?B?RVVIYXJsSXdRZkZXWndIUWFCQ3g5WENZTW01REhUN1I3TzVGcFFKdDdHblBi?=
 =?utf-8?B?d1ZpZEhzak9SM0svR3VWZmtrNFZDdE4ya3hxS1lYSkRLVWVSUEQzZ0J2Qy9B?=
 =?utf-8?B?Q3lNZlE2SkEvaUJnSm1Cd1BKR3hpd1pvNkppRGNKYkpCc3crMjJZWkJPMXhX?=
 =?utf-8?B?ZzB3eE1tbkMwd0c5ZWNPdnZtMkFOakpzbGp3K2dRTHIzU2Y1SWMxWjdBVjVt?=
 =?utf-8?B?a3Z2R1RZZzUwcUtoZHJubVNWZ0pIV05IWXRLMVVJa3J1M21vWk8wdEM4dVJR?=
 =?utf-8?B?SzFmYk9BUGJDN0JnWUNOK25wcmtFTTU2VG13bUFFaGFYZzF3eVMwRFgzMkc3?=
 =?utf-8?B?cWpEd0JRMXQ2bUQwMkh0cDRtRW5YeCtMc2dTZkduanVTUi9LaGllblBDUEVi?=
 =?utf-8?B?WUdmN2hKemhhTkwvREpzNVBmemwwMGZMU1d2R1orQzJoakYyYzlKSGJ5eWtG?=
 =?utf-8?B?SzZZbUNHZHFOY09iSE1KeUhGRUtBRFVsWU1GZVhvaFNyTG0rNThWb2I3WTNj?=
 =?utf-8?B?NnE3b0x5b3ZNc2dQOTBxRWg1SnhwSzVTVTdyOUQ4ekNtQVNiVmwwd1daRG0r?=
 =?utf-8?B?NXpjc092ZjZNZ2tNUVJNempaejlnZkNLdVZhSWFjK05kV1dkQ1QyT3ZkZnhC?=
 =?utf-8?B?M0laOFlYbXE1NVY3Y09vT2VEYWwvc3UvNjVhZjNYZUtKRUJCNjE2VndxUUxE?=
 =?utf-8?B?ZUJhOEdwZEhzV1hoaGFmUURGYkdWU0ZuNzV1NTJUc1NCOU5iTnpiUjAxWUto?=
 =?utf-8?B?cEhsRnE5KzgwL3p1aDY1K2RIRms2M1ZzYWJVOVp5SnBwU0RMdjh2d3FxRUp4?=
 =?utf-8?Q?IewiSUorJIzssw6rXf/BUV4vx?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: 951e3701-48dd-4909-8dd6-08dcdeb4d14a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 05:25:36.9013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1x2wL9b1blRbXTXQEBB5V56GP1F6LFOw3pvxUOyWNL4LNLCK29Tc2cQMXppwhko1wop5BryQbGKs6FheUdEqng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR14MB3449

In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing parameter
for High Speed Mode") hs_hcnt and hs_lcnt are calculated based on fixed
tHIGH = 160 and tLOW = 120. However, the set of these fixed values only
applies to the combination of hardware parameters IC_CAP_LOADING = 400pF
and IC_CLK_FREQ_OPTIMIZATION = 1. Outside of this combination, if these
fixed tHIGH = 160 and tLOW = 120 are still used, the calculated hs_hcnt
and hs_lcnt may not be small enough, making it impossible for the SCL
frequency to reach 3.4 MHz.

Section 3.15.4.5 in DesignWare DW_apb_i2b Databook v2.03 says that when
IC_CLK_FREQ_OPTIMIZATION = 0,

    MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
		     = 120 ns for 3.4 Mbps, bus loading = 400pF
    MIN_SCL_LOWtime = 160 ns for 3.4 Mbps, bus loading = 100pF
		    = 320 ns for 3.4 Mbps, bus loading = 400pF

and section 3.15.4.6 says that when IC_CLK_FREQ_OPTIMIZATION = 1,

    MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
		     = 160 ns for 3.4 Mbps, bus loading = 400pF
    MIN_SCL_LOWtime = 120 ns for 3.4 Mbps, bus loading = 100pF
		    = 320 ns for 3.4 Mbps, bus loading = 400pF

In order to calculate more accurate hs_hcnt amd hs_lcnt, two hardware
parameters IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION must be
considered together.

Signed-off-by: Michael Wu <michael.wu@kneron.us>
---
 drivers/i2c/busses/i2c-designware-common.c | 16 ++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h   |  6 ++++++
 drivers/i2c/busses/i2c-designware-master.c | 14 ++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 080204182bb5..907f049f09f8 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -372,6 +372,20 @@ static void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
 		t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
 }
 
+static void i2c_dw_fw_parse_hw_params(struct dw_i2c_dev *dev)
+{
+	struct device *device = dev->dev;
+	int ret;
+
+	ret = device_property_read_u32(device, "bus-capacitance-pf", &dev->bus_capacitance_pf);
+	if (ret || dev->bus_capacitance_pf < 400)
+		dev->bus_capacitance_pf = 100;
+	else
+		dev->bus_capacitance_pf = 400;
+
+	dev->clk_freq_optimized = device_property_read_bool(device, "clk-freq-optimized");
+}
+
 int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
 {
 	struct i2c_timings *t = &dev->timings;
@@ -380,6 +394,8 @@ int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
 
 	i2c_parse_fw_timings(device, t, false);
 
+	i2c_dw_fw_parse_hw_params(dev);
+
 	i2c_dw_adjust_bus_speed(dev);
 
 	if (is_of_node(fwnode))
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 1ac2afd03a0a..893c2c53648a 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -240,6 +240,10 @@ struct reset_control;
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
  * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
  * @rinfo: I²C GPIO recovery information
+ * @bus_capacitance_pf: bus capacitance in picofarad
+ * @clk_freq_optimized: indicate whether the hardware input clock frequency is
+ *	reduced by reducing the internal latency required to generate the high
+ *	period and low period of the SCL line
  *
  * HCNT and LCNT parameters can be used if the platform knows more accurate
  * values than the one computed based only on the input clock frequency.
@@ -297,6 +301,8 @@ struct dw_i2c_dev {
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
 	int			mode;
 	struct i2c_bus_recovery_info rinfo;
+	u32			bus_capacitance_pf;
+	bool			clk_freq_optimized;
 };
 
 #define ACCESS_INTR_MASK			BIT(0)
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index e46f1b22c360..b18da66da6a8 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -154,12 +154,22 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 			dev->hs_hcnt = 0;
 			dev->hs_lcnt = 0;
 		} else if (!dev->hs_hcnt || !dev->hs_lcnt) {
+			u32 t_high, t_low;
+
+			if (dev->bus_capacitance_pf == 400) {
+				t_high = dev->clk_freq_optimized ? 160 : 120;
+				t_low = 320;
+			} else {
+				t_high = 60;
+				t_low = dev->clk_freq_optimized ? 120 : 160;
+			}
+
 			ic_clk = i2c_dw_clk_rate(dev);
 			dev->hs_hcnt =
 				i2c_dw_scl_hcnt(dev,
 						DW_IC_HS_SCL_HCNT,
 						ic_clk,
-						160,	/* tHIGH = 160 ns */
+						t_high,
 						sda_falling_time,
 						0,	/* DW default */
 						0);	/* No offset */
@@ -167,7 +177,7 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 				i2c_dw_scl_lcnt(dev,
 						DW_IC_HS_SCL_LCNT,
 						ic_clk,
-						320,	/* tLOW = 320 ns */
+						t_low,
 						scl_falling_time,
 						0);	/* No offset */
 		}
-- 
2.43.0


