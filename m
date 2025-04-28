Return-Path: <linux-i2c+bounces-10647-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B41A9E597
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 02:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADB79189B76E
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 00:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0AE6F305;
	Mon, 28 Apr 2025 00:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jvLuh88I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2066.outbound.protection.outlook.com [40.107.241.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DC535979;
	Mon, 28 Apr 2025 00:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745801754; cv=fail; b=SX5hCWyseABTIgOkucNWUn+CSIsmgIhb+jWPqcYciiVuVWJwMZr76+0H8zHpU1zItgyxgxnAuUrx89/pGq7g6e6aXS1pDWazu8bTjj8YFUZobELMzED1+xHBDAhyrYqQXFpob+E9AXGQoe6Zru4m2yHXN7tc/6pOvSE4eq8wnPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745801754; c=relaxed/simple;
	bh=+mOk3b/6BV4yOmbqrifD7TcxaUg98ANpggsiIf0Kznc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DYhyHi+gKrr6b/lfZkeGV3ifNSkCBAGkcOXaZANwEcGXzXqKMsM+cMHbmJRmSbJwEjmBrz9j2ES30eUyG+gAlZozwxFYj9jQ/jf1cJOWjwk0PS3a4XFyAmpKWaJ4Sx6EGDTMBh8AEQW+RhR+GdorfCCA0t+BkiTqn3300OKWSHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jvLuh88I; arc=fail smtp.client-ip=40.107.241.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBeiwdisYE/K8RiB8QOUA7StsGU+vd/Jo7c2y02rELAoNq6VCaAa+TJuhwrPYcG3MsplOHlOUx6tNBh9SwdnKv3q05l3ui+b71Wzms+WpLipknXcwUpTHO6ou4hzPfi52PYLW2Sxf+YC97nxPz42Fgcu7DpTmCWbc7hgkog5APd6p66AhhIeYRdImN3X3rJBqdSUL4BnWxxmI6Jg/DoWIyU1q2VjbHEbnwTnxsQ8KYMVbJyZK1Ey2A/haLYx/HtgIYw40cy5k3IU2Nx+/zdcvtcJJmdX2n3w32jIgKiaaWb4UrnTRLOcWOZIlkYHXwtjhrZIXtz9y7Oj0ZrapfeLAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mOk3b/6BV4yOmbqrifD7TcxaUg98ANpggsiIf0Kznc=;
 b=j0l+Nfc6YJ9Lt4uF0xHWVYXNVUX6J1fbDipUXtX4u1eOLYJ/+6Iwo/02RVC9n9NFbYqGTMaN/8oHl9EelQxaJBfWjpsqqZ+NaQujzxIM7ojZTZA2w6rjsoOffD64X0UcQVlZHZ93Jo82Bx/xdVBFi+2prYj+L+ZZNlSN5Qw/Q0P1L8Rrns5mYlzu5XoOjQTxRhcsdm/tZm9Cg0S2SSeYn1TGpXi0tRtyw0t2hdnOU2FPi33NxGoPvBK/YcTJtjB7yKoubZisrgGZDcITPx9CI299055GHD6RF+vurlW8DA/WiB+Lp+syDuo3/Tu539Bb7pbzBmf5ohh82VuPRo5MBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mOk3b/6BV4yOmbqrifD7TcxaUg98ANpggsiIf0Kznc=;
 b=jvLuh88I38HStJ5BZhxHutA8BreSZ6DEkh/N0/pe/D5eoM+x52xopPuEXxnwCACW5xJ2IbQR/n7nuf4XdESYUyU65R5WtDo7SET4bsBC27XIM9P6TuxM1nLTACuDjamkHHrnunJlNlGwNb1VZQbct5Nvseeom1DBKl3TDOvR3wxVuNP+urF/J87R8bjGkaQq5BPrcvaZ9LurxUyYh6u3V1+9bKVZIseI+9Z18FYLuNbptDumyiNJM0VD8jYCuMCJTo2fpiEFL4sz+HBnWChUI36IYDeD4MeE7dbFpChGaVU6AcN2DtSR7TZ3VO8Uz2ZQeNUCTGVyKudvPHO3ZBWyMQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8258.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 00:55:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 00:55:48 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Troy Mitchell <troymitchell988@gmail.com>, Oleksij Rempel
	<o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Yongchao Jia <jyc0019@gmail.com>, Frank Li
	<frank.li@nxp.com>
Subject: RE: [PATCH v2 1/2] i2c: imx: use guard to take spinlock
Thread-Topic: [PATCH v2 1/2] i2c: imx: use guard to take spinlock
Thread-Index: AQHbtzv2y1eEfsxiE0mM1qu905pnY7O4QYXg
Date: Mon, 28 Apr 2025 00:55:48 +0000
Message-ID:
 <PAXPR04MB8459E722812D2B11D57AA17F88812@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
 <20250427-i2c-imx-update-v2-1-d312e394b573@gmail.com>
In-Reply-To: <20250427-i2c-imx-update-v2-1-d312e394b573@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8258:EE_
x-ms-office365-filtering-correlation-id: f0c0ab58-c5ac-44a2-6862-08dd85ef6a70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGJsRGM4cjY2QWZNK005djhEczRHQ3YxaDBIaVlpMTduNDFFbFpscUtjeE90?=
 =?utf-8?B?dWN3UjFyNzRJRm85Um51VmFadUZXSCtHS0t3Q0NDUmVIbkNoTlZEcFQ3REU3?=
 =?utf-8?B?Ylkrd3NvSy93RklIQ2dQQkNuQllOck9hUW91NTVENStNamFSb1g0WmJnak5B?=
 =?utf-8?B?VEwzMXo5YlAxN2xXbER2dnFxNGZCR21rc0NkVUtITnMxZFQvNmw5UmJWQWtr?=
 =?utf-8?B?bDNuQVRCMEREc0NrN2x0NnR4K3M3ZW4yUGxXcFgzNVBHOEtVS0tpeGJ0YUxT?=
 =?utf-8?B?K3ZObEJ0dlEyR2lRaStDdDJXOHVwVDdUTFlaazhTVGNWNVByS2QvczFwWEF1?=
 =?utf-8?B?U2NSaXFHOFYveXUxZjhpNEpzQWREeTRRVjB1eU5LWStSZFhSL0lHaWNrNVc5?=
 =?utf-8?B?Rlh5WnRTbWpJaTJtTFQzemhpYThNMGhxbXpOa0dPRkpEODNxd3hvdkRTaHFP?=
 =?utf-8?B?cXpjaFcvM0M5MWRLRGYrZWd0VW1xTDRBZmw2bTkvNjZlSTIyN1FwaXdMbllv?=
 =?utf-8?B?MCtnS2RRcXRrWEpKNmdjcEJKSnpaNTBsdFlURXMxczRtWXovWEt1VXlyZ2V4?=
 =?utf-8?B?VzlTT2h0VFdvM3kzVERQbEd0U3c4TzhiVFJnQTlHYVpjRWxjMUhyb2NaTmdH?=
 =?utf-8?B?UjFCNm1JVnNVd2FTRThGYkFMQ2tTYzlyUDN6aHNtOEt5ZzBxbGZWZUNPRG1D?=
 =?utf-8?B?eUdvTGozQURKYkZqdFhaWWJUTkw4SmRpWTQvOFNoeWQvU2xLaE9KZy92V25p?=
 =?utf-8?B?RkgxOUg2ZzRzK09iV2E1U3luekd2aWtvL0J4UTRHWWVqVGV6YzlzZFdhbkJ5?=
 =?utf-8?B?MEQ2R0RycUVmOEpET2RKaVUrbzh0RWErTS90UG9HSFVvWVphOGF5c2hhV2Z5?=
 =?utf-8?B?R3pOay9DVWpUYWFPVDdHV3VtZGl4dEhzV1J1eXMzSlN5MnBDT0ovYlgyVm1q?=
 =?utf-8?B?cTYrT05pZmUwRzR1cFJIMjM5QVBta2RmcG9iTFV5b3JuWExmRHQ1aHk5YTF3?=
 =?utf-8?B?Z0poeGxheXIrbGJjWi83U0xtajFmQU5tanRlNHZpUksyOW0vMWswbGpFVDJC?=
 =?utf-8?B?ZWVMbTBURXJnS29YYWwzazJIT2xtaTRZcUtxYVZnTU5xREZuQ2M4MFhCdGVa?=
 =?utf-8?B?RUZnL1UzNXlseXBjRmVMakcycUpTWUhYdUxaeXRNYkFHQU5XWjBwUHhwQkhG?=
 =?utf-8?B?b04vdmk1T0lLS1RQb3kxcjR4NS9IUFBMMExoTHo0a0daYXVmbzd2aEE2SXUz?=
 =?utf-8?B?aW5wYVhwT04xaEJOUlFwVXY5OWZjK0FON1RRTFBnbEJOZVNVbTlUbGQxUEsv?=
 =?utf-8?B?anorS25KcXMvR1pFNUJTMEZTSk51R3lPNzlsZjFnMVhBcENxQUI4dGRpbzB0?=
 =?utf-8?B?Wkh5cFJmSEFSbUF6bHpzaWJZWS9nSUp3am9qNGpoclFBSFc1by9oTnlaU1Z3?=
 =?utf-8?B?WE5zQVVpVXd1OE1RWStjenZidHVRRkRPa0gwdnJrOVJHb0lmN3hyY2RpbFN1?=
 =?utf-8?B?RG5GK2RwZjI3N0dPa1pvUUxRV0ZmRkFDSWVCV1VoOHJsZStvNlp4ZkxqNVgy?=
 =?utf-8?B?eGtVMmttQU1KQUNXZSszL2NIWVkyM0dsa3VCb0hlTVlBVFpTMitjZUNNNjQv?=
 =?utf-8?B?Vlp2NmJQQVRwK0xUeG5raElsMCtSVGg1dlJlQktSYks3TGUwZHJpZFhteXB5?=
 =?utf-8?B?MkMxdzZ3YS9tVW9VSGdheTJpcUFHa3hCRUg1SzR4UVlDYWtrbXNpcUJiaEN5?=
 =?utf-8?B?V0N0SndKdXhVeUFPSDlOOTc3ZUUxaUdNNUxUNUJ3bVUxUDVML2xMQUNLMDhu?=
 =?utf-8?B?YVY2SC84VjJDUlA5QjBLYXFrNW1zZmd0aGNZamhCQi9tL2JwbVdoNGhCRXlY?=
 =?utf-8?B?KzhMNWJIMzRNbDMydTd6ZVJ0bDd6eVNjN09IRUU4aGVJRmQydTgzMWJFVy9Q?=
 =?utf-8?B?NkRua2EzYko3UVhqamJSRUVkOEt0SXdiR2hlajhXbStrU0JXSDF6b29UVGw2?=
 =?utf-8?Q?wiwkzIJdCewtrSbA4D89UsCYTMMBG0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnFOenV1M3gyS2JGVnEya1dsR3E3RUdTZEROL2pudWRvWFByVFRjWFMybWhR?=
 =?utf-8?B?eVk2SmswNkM5ZVNFbHpVM3I1MklKZU42YXlJT2EyOXpnb1pxZmM4eDFYU3Zu?=
 =?utf-8?B?alFJdnlNQnorcDNsTjBiQUtyanJ4WjdzZzIyQ3ZDbWY3R2JPakhISjRUR3o0?=
 =?utf-8?B?STJKZU0rNmZ5S2UwRVk4bkt0Q2duR0FqSjBlNmRJSnhWNHgwU2NNcC9LWDRq?=
 =?utf-8?B?ZnRSaXZDYXd3cU5MSVFhblNjSzVYVm96cHVmOW5pNEN3SGZ3cWZ0UnpDSzJx?=
 =?utf-8?B?LzQ5N3ZaUWlUdzVkVkpxUFF6TEtFMm9XbUErWWhzMEU3TFlDb0VEZWp0WGVY?=
 =?utf-8?B?Z0Y0cVVTT2Q1WERRSmhPL1hMZjZyS0s2WmxGa2ZOZG5WM1ZUNTVIMDlHaWgz?=
 =?utf-8?B?TTdYUGNsS0I4cmJLTWlNZ2trN25qUi9tTzgyZi9BQVFoVDhlRWloS1F1d0Np?=
 =?utf-8?B?cGtzM21zM21YTWVEaFpLaWRPSzVOc25PTHYvZW1QUzJObnNMaytuTmRJZlJV?=
 =?utf-8?B?NnF2bW9BaDZ4N043dis4dVBXaXRDZkQ2clR1ZEZFWklmWGxubWdoSXE2REl5?=
 =?utf-8?B?WGw0L3FIajlMdGkvdlJvVGJNa2JJclB4TmE1QWlPUG5GS1ZZOVFBVjE3K0Nu?=
 =?utf-8?B?WjdTMjdiekUrNTg5OGlLOXE0cGtPQjdXYWtsS2VvSGRLYjF2clpWY21JWnd6?=
 =?utf-8?B?ZU5FNnMyOVdlV0M3bTlGZG5iYkdXNGR0TXdSY3lackEwY25CbjZSUWtGT3N3?=
 =?utf-8?B?L09iWkRhZ2cvR09zWVVpTVEyUmFtNE1Kc1R2cXZYNisvQmZWSHVzZUFmQ2Vr?=
 =?utf-8?B?OFBuR2dCclE4UnZnb1B4S0Q2NDM3aU9zekpWTDRlSVk2cy90Q2hMRVRJY1hn?=
 =?utf-8?B?azhRRDBGem0rK2ViNEIvWFplWU5VL1Z4VE5RazQ5YWpxaERFZjRXYVZ6aW0x?=
 =?utf-8?B?d3AzR0tHQWRURWx1MURFd2hobzZXbTlNZ2ZRb1FRNzdOWEtPVzgxR25YZDV0?=
 =?utf-8?B?Q2IyRkszcjhTR0hUeWp4WlFCU3dWanQwNVJpblhSb1JVYzJiYmVCMU40M3NI?=
 =?utf-8?B?OUY1N3R3K2JEdnFsS0NwWjJzYitROTZOM1BDUEp5a1VYSGlxSnROSktqbDFx?=
 =?utf-8?B?TXVQNjBGUkVORy9rY1BKMmdiUytMTXJSemNZREZ4MDE3YUpEa3JrZkhFOXVq?=
 =?utf-8?B?Qk51WExIaitNNy9UbTBKYzA0cFNCam92Q1hWMlFpZ0Rya1hhNUhGWUREa0pr?=
 =?utf-8?B?YWJ0ZDVoc0ltdzNUdmlFRk1XS1lhQkRYU0JXc1lyeWVXVXhTTjRxdzF3NitF?=
 =?utf-8?B?RTFIRW1yTGVVcHBTRENwQWNJV2tzZmoybkdubVUyQVFVbzQ5S2NrRm02bGhL?=
 =?utf-8?B?MVFQYjBMbW1iVnhyU2VpTFFXekNNdnpwdDZWOUFSaFh4azQvY0U5OU83bWpK?=
 =?utf-8?B?eEhXTy9SREZsbkduMC9WeG41M05lRDdCbmI5RFJxSWpFWlNsMWMyeVliWTlF?=
 =?utf-8?B?cjRmZVpXektrTVR1WjcwK3lVa2xTTGpEZjFzNUxwVktPWFJRTjcybVVVcEpC?=
 =?utf-8?B?eksxbk1OUFZ2cCtKcWt2QXlOWXlLbk1WcXAxYmtsTmtuWHY3ZUVOT3JLYW1i?=
 =?utf-8?B?MkpSNkF5dHNkZ0hKVzBGcmlIY2pueDFnZkt2cUFsa0UzVWtPUWJjUUxkRG1R?=
 =?utf-8?B?Ui83V1hqdCs5cmZtcE5WY3Z5NFdiTjk1NGFvUlhrdXNIZ2xqSFlZUm5icWpn?=
 =?utf-8?B?OFk2aWNyRVRVYWpqRWlGd3BWQS8vSzFNcjRXbkh3cUhyazIvUlphMEtBMSta?=
 =?utf-8?B?c0QzU3hQUGJuL2hZZGRLVXYxR3NqTmxIdE5SM2kxeEFld09xaVZ3bUltcDly?=
 =?utf-8?B?RTBQYklMbXl1VUFRYjdvL05Ca1ZVM1NYcVJEZTNyNU1PUjN4WGJtWVJNOHFa?=
 =?utf-8?B?dWZFUkJYTFZodWFOa3p6WmJ6Q3RjZVlSaEF2a1ZVKzhvWEFrd2VCaWNFQnVF?=
 =?utf-8?B?YjIzeHhRK0VXSDlJUm00eUZlMCtNdU5tTEpML0Q2d1FQNDRKc2xlS3hBdVFx?=
 =?utf-8?B?M2x5Qkk2VWVYemF0ODBCbkxIU2tSVUVET0xuZ3hKNGFIUk9JN1ZLeHcxRjg3?=
 =?utf-8?Q?7jDo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c0ab58-c5ac-44a2-6862-08dd85ef6a70
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 00:55:48.5750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Bko8xzW+K5fYUFrj8XLVz52gvz7il/5L9cKqX5UsBGffEqB6vWsTfSAk7S6vlsVTH6+J7cDkDkp7Lo1Qa0V6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8258

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMS8yXSBpMmM6IGlteDogdXNlIGd1YXJkIHRvIHRha2Ugc3Bp
bmxvY2sNCj4gDQo+IFVzZSBndWFyZCB0byBhdXRvbWF0aWNhbGx5IHJlbGVhc2UgdGhlIGxvY2sg
YWZ0ZXIgZ29pbmcgb3V0IG9mIHNjb3BlDQo+IGluc3RlYWQgb2YgY2FsbGluZyBpdCBtYW51YWxs
eS4NCj4gDQo+IGkyY19pbXhfc2xhdmVfaGFuZGxlKCkgY2FuIHNhZmVseSBiZSBlbnRlcmVkIHdp
dGggdGhlIGxvY2sgaGVsZC4NCj4gDQo+IFJlZmFjdG9yZWQgdGhlIGkyY19pbXhfaXNyIGZ1bmN0
aW9uIHNvIHRoYXQgaTJjX2lteF9tYXN0ZXJfaXNyIGRvZXMNCj4gbm90IHBhcnRpY2lwYXRlIGlu
IHRoZSBndWFyZCBzY29wZQ0KPiANCj4gU28gVXNpbmcgZ3VhcmQoc3BpbmxvY2tfaXJxc2F2ZSkg
c2ltcGxpZmllcyB0aGUgY29udHJvbCBmbG93IGJ5DQo+IGVuc3VyaW5nIGNvbnNpc3RlbnQgYW5k
IGF1dG9tYXRpYyB1bmxvY2ssIHdoaWNoIGltcHJvdmVzIHJlYWRhYmlsaXR5DQo+IHdpdGhvdXQg
YWZmZWN0aW5nIGNvcnJlY3RuZXNzLg0KPiANCj4gQ28tZGV2ZWxvcGVkLWJ5OiBZb25nY2hhbyBK
aWEgPGp5YzAwMTlAZ21haWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBZb25nY2hhbyBKaWEgPGp5
YzAwMTlAZ21haWwuY29tPg0KPiBSZXZpZXdlZC1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3ltaXRjaGVsbDk4OEBnbWFp
bC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYyB8IDM5ICsrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jDQo+
IGluZGV4IDllNWQ0NTRkODMxOC4uYTk4YmYwMWM1ZGRlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWlteC5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14
LmMNCj4gQEAgLTIzLDYgKzIzLDcgQEANCj4gDQo+ICAjaW5jbHVkZSA8bGludXgvYWNwaS5oPg0K
PiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2NsZWFudXAuaD4N
Cj4gICNpbmNsdWRlIDxsaW51eC9jb21wbGV0aW9uLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvZGVs
YXkuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPg0KPiBAQCAtODkxLDEzICs4
OTIsMTMgQEAgc3RhdGljIGVudW0gaHJ0aW1lcl9yZXN0YXJ0DQo+IGkyY19pbXhfc2xhdmVfdGlt
ZW91dChzdHJ1Y3QgaHJ0aW1lciAqdCkNCj4gIAlzdHJ1Y3QgaW14X2kyY19zdHJ1Y3QgKmkyY19p
bXggPSBjb250YWluZXJfb2YodCwgc3RydWN0DQo+IGlteF9pMmNfc3RydWN0LA0KPiAgCQkJCQkJ
ICAgICAgc2xhdmVfdGltZXIpOw0KPiAgCXVuc2lnbmVkIGludCBjdGwsIHN0YXR1czsNCj4gLQl1
bnNpZ25lZCBsb25nIGZsYWdzOw0KPiANCj4gLQlzcGluX2xvY2tfaXJxc2F2ZSgmaTJjX2lteC0+
c2xhdmVfbG9jaywgZmxhZ3MpOw0KPiArCWd1YXJkKHNwaW5sb2NrX2lycXNhdmUpKCZpMmNfaW14
LT5zbGF2ZV9sb2NrKTsNCj4gKw0KPiAgCXN0YXR1cyA9IGlteF9pMmNfcmVhZF9yZWcoaTJjX2lt
eCwgSU1YX0kyQ19JMlNSKTsNCj4gIAljdGwgPSBpbXhfaTJjX3JlYWRfcmVnKGkyY19pbXgsIElN
WF9JMkNfSTJDUik7DQo+ICAJaTJjX2lteF9zbGF2ZV9oYW5kbGUoaTJjX2lteCwgc3RhdHVzLCBj
dGwpOw0KPiAtCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmkyY19pbXgtPnNsYXZlX2xvY2ssIGZs
YWdzKTsNCj4gKw0KPiAgCXJldHVybiBIUlRJTUVSX05PUkVTVEFSVDsNCj4gIH0NCj4gDQo+IEBA
IC0xMTI1LDMyICsxMTI2LDI4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBpMmNfaW14X2lzcihpbnQg
aXJxLCB2b2lkDQo+ICpkZXZfaWQpICB7DQo+ICAJc3RydWN0IGlteF9pMmNfc3RydWN0ICppMmNf
aW14ID0gZGV2X2lkOw0KPiAgCXVuc2lnbmVkIGludCBjdGwsIHN0YXR1czsNCj4gLQl1bnNpZ25l
ZCBsb25nIGZsYWdzOw0KPiANCj4gLQlzcGluX2xvY2tfaXJxc2F2ZSgmaTJjX2lteC0+c2xhdmVf
bG9jaywgZmxhZ3MpOw0KPiAtCXN0YXR1cyA9IGlteF9pMmNfcmVhZF9yZWcoaTJjX2lteCwgSU1Y
X0kyQ19JMlNSKTsNCj4gLQljdGwgPSBpbXhfaTJjX3JlYWRfcmVnKGkyY19pbXgsIElNWF9JMkNf
STJDUik7DQo+ICsJew0KPiArCQlndWFyZChzcGlubG9ja19pcnFzYXZlKSgmaTJjX2lteC0+c2xh
dmVfbG9jayk7DQoNClVzZSANCnNjb3BlZF9ndWFyZChzcGlubG9ja19pcnFzYXZlLCAmIGkyY19p
bXgtPnNsYXZlX2xvY2spIHsNCiAuLi4NCn0NCg0KUmVnYXJkcywNClBlbmcNCg==

