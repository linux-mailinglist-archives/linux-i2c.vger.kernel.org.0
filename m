Return-Path: <linux-i2c+bounces-6702-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FBD977DD1
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 871AC1C245A2
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684381D935D;
	Fri, 13 Sep 2024 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="DBGFgInS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2085.outbound.protection.outlook.com [40.107.241.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BCA1D88B4;
	Fri, 13 Sep 2024 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223916; cv=fail; b=A/gxQI3q9Hl8pDmQhzg2ZFsKTTzopyqe8/Iem1f1I1FSH4XMWVSAffYJVa5IbHgbORMa9+P7EiHeYvtnsNIYfaQrnKPSBXAd6xIo1FQS1jiLwz9c0G/o6W6RkrWZe/K2ILNBCQklr/cR+8qlwl8xq0mSia/NzQOGqJ6m/zs0o2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223916; c=relaxed/simple;
	bh=tRJ2UTlAGm5BrqdzK7SMKu7N9PGcYcsgemuhPIj9PFc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=awJa9J8E9ucsmuCREDYDUjlWFtBZq5Koos7ls3st+ANM/NjmDpAkWLdIF67v17C5Q6iyl5534Qxmz+/ZxZqzvEBH6WhmohL7AqRWWjMg6r5QcMwGPORJlU81OnjbOysR5RLSgr7cIzcDxpjr5TdplhRKtmk5l/QbzPjGLkQ/KS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=DBGFgInS; arc=fail smtp.client-ip=40.107.241.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKGgi/IdiDk+bWObrG7H9KUU6d5vHCRhYzzEn6HS8ISmVh5iH7m0NuqM19ro7bVmme5P9y6SINP+ZYwez+JqUE0fuWQUGe8nmsgcs9lQoTUEFN9RDipEnJZCIgVQIdMNhkKhHzUUnUZ5tvn3xkM3/RKpYLxe72uLxhTmX3NY6PDAE1kDsQ98olr2bexOaaLs14Vqxfv281Vhq+edjpaJ9bGMFaY4ebBC0TN0MLR6aD6tkth9Nx8A8oHutGiq90JoBGqN9/6rMU2Q/dNJnPdZ7pH8tKBW0R1jtcvObHF4j+5g+Ic3EHIkz3Fm+Qu0dZZSJy7JQb0H37UMw701cLBpfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzT9tw9W5dxzE7PdMajy/+vF/6QCaliNKemlLeDwevc=;
 b=JeAPrxxU1o69sSWxDi7XVV12xrrFxd4S7uythfLOvBwaBo7yh9xfAsWWGbrC3agOxW5iN6ACM522CJ/6cwxAoBiyMh0Me5CM+3c5vo6ppGPwjy6x1jCScMISjkH0obBHmufCHBLJVw4QQFbw1VVu11SY0uh088xm4MPgLlB4jKr24yfXdwoEJzXX9mKeWw7WALyX9/pVSk0PXyiy4O4reGGgWrpAZxUTYWqbGDHWTIz6QPOxR/Nsi+Mb/LB10i/8iMFoK1euKO/Z86qHg58ApWc+ahnx3NWJ4fFliCcg5rkiWtKsBWiiVCowVc8ItyZ079/XNPPl+0/JW2OZJ3qCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzT9tw9W5dxzE7PdMajy/+vF/6QCaliNKemlLeDwevc=;
 b=DBGFgInSXTdsHslt+pAnj3s3orSSA/7fq+9o1OUEpEJc/8gzxHPnaNtr5IQe9ao8j9iT9zvJXFxXd0MPpiagI1piE/O23WINBzHbuVrAWNZYwTpF21kS80c5zsaOugZllugCD1UuHDX23QTVEZxig5y2raObUGsZydMU1uo/PHwLGc/yoRYzoRnjNvZAZIuSWWsChtPUWz6zeutMG4fxjr4Gy0GCvukO+tHP6OGFMKYWDOK5Lsv7jlv6aenafFyt5zhZYDfpEF+eSYW71/UHFJDVsQHeU9G1rhBy3kbiXiGAPKt68GssCuRWNvoT8JBKmBEJqAko4LQVds1fK9VN3g==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 VI1PR07MB9923.eurprd07.prod.outlook.com (2603:10a6:800:1d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Fri, 13 Sep
 2024 10:38:30 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%6]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 10:38:30 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 2/2] pca954x: Reset if channel select fails
Thread-Topic: [PATCH v4 2/2] pca954x: Reset if channel select fails
Thread-Index: AQHbBcjsUOspQbnJY0u72i1KC5m03Q==
Date: Fri, 13 Sep 2024 10:38:30 +0000
Message-ID:
 <DB6PR07MB3509D16C9C71F7A7A0B47C0C9D652@DB6PR07MB3509.eurprd07.prod.outlook.com>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|VI1PR07MB9923:EE_
x-ms-office365-filtering-correlation-id: 2bc3298b-68f0-4aef-77a9-08dcd3e03587
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?dZd6q71qy7Ce459qnafObR/yUUqRKFGNplOUKeMZ9WEDOTZ8C8VzvzKq8e?=
 =?iso-8859-2?Q?3szSfsU1sNqc0TSqg3wa+fIzA1u/w1rKHEUWpWrOqVDoy/BNKLjDrfYTgv?=
 =?iso-8859-2?Q?k1Zu5NVjO/+UoBb7+6EMOnRiQgSeWbzHnem6vQvo/WRSHJEQa0TWnlejU/?=
 =?iso-8859-2?Q?X29wsvHh9zeNMFDqHvZB+CrwXy7etZSAraTDOipaHdhVodrb1qnAxkCCjs?=
 =?iso-8859-2?Q?gyhrzRT/t6A3amaxjdPeo9QlaPOm3ZpTkFO5rBm5+SPi2PaRCVg7uZudYm?=
 =?iso-8859-2?Q?IGi05hUxqeF8mzOmmiAPKADRaTrkbGfAPGiU4Xn0z04B4L7UwnCZiMT/7I?=
 =?iso-8859-2?Q?LC4xIbBIXd1ozInyra+ihP/FT1wSt4XURcEtNFHXsRrDubQ1aURnJKjrt9?=
 =?iso-8859-2?Q?cVWIG8/ekqdQtlSmV+z+6MsCqyvzlu5Za9W7dTrKDm/hduzeyeA8Io0/M1?=
 =?iso-8859-2?Q?cOuMuguW+n9av4oQNcIPes1dEagNncMwG09/JAl4qU6+iJTZ0q/de4k63/?=
 =?iso-8859-2?Q?oCqS+iT9ylpyPRGSCE87v3f2370/fbISvMnLAA/JU9GtmEdl7lfQiy0rU+?=
 =?iso-8859-2?Q?6Dn2NryyADzLW4BRm8+1fK6S4fZj1E2jL1nuZFpFxVXRQAgS4w4E9nvu3d?=
 =?iso-8859-2?Q?O5cqOp0n+INsRu07bnmlfTKIEiZyyZbZic80tQR+q4XCISXQ9TBSSh+wuG?=
 =?iso-8859-2?Q?Q8rt6jrcRSL1AzhSu3YB1EC9MbQeKqM9k1kHVp6J+UaXy4JFn3Lx/uI93I?=
 =?iso-8859-2?Q?1+yw6ZWbaV0W8BxSlPnx5hqmOqP/DVMNjp0zXQXg6pmPj1kw0Ry/WYfpt8?=
 =?iso-8859-2?Q?cNmR8R0reFvexO8ykcyWq14iSTPXn0j6EP7sg7n+lzMeS9EdN6nzAm6vi9?=
 =?iso-8859-2?Q?eS+6pKmbl+ZGffec/NY7/N/eD4TJ0a54X/I1nn59QllSH6glSyXUGvj5aJ?=
 =?iso-8859-2?Q?Ea5pza7qSVj4QQ5vMAPDi0JOBj8eriCTX2KlnAgT3HJ0xa12uFp7TZmzxY?=
 =?iso-8859-2?Q?eL/ZorFZpcZcmzCNUL483dJvMkAlknptyhLmgVCg+NdGhoJdaOR/LHRzYk?=
 =?iso-8859-2?Q?0xp87VjWWENlWcwwipqkyjPOKUONuHxrJjvYuFeUucqREsIwDVI047xo7N?=
 =?iso-8859-2?Q?JP0VEOFXQZTKVgaFyJeD54UEoFKiADSKYuNl7UxM6if2gM//YcgbqQPJga?=
 =?iso-8859-2?Q?JUcTb1GxEFRACQERh3sln0gRnE2mfH+hw5LxwD6UEecJDpu6oG+rxpUy0q?=
 =?iso-8859-2?Q?/QvHaZPUt2m2XfWyNrn70NJDoamOeQpkuj5k6fGw08h/7M+h/+BXb810ig?=
 =?iso-8859-2?Q?cDl2RA5RnJfw3HuT506GLRwkiroBpQFdm7obEzIZ6x4ukToOyzyaUO8UxQ?=
 =?iso-8859-2?Q?N9eGc56gmAYn/hvYjpwG3GnilmX1FtGD6nXDrUywniP4tXuYrL0UM5CdXM?=
 =?iso-8859-2?Q?lr0ewPm6tTzyPjR12ujzSgKNOo8XHNoeiMnLeA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?1ErMnH7RbUwuZtiPthftN9kh7Rrd3WtGjjSPvsZPecL2PHVkrf/5WcUa4A?=
 =?iso-8859-2?Q?jhiqQfwZQTR9bKxU1jHL++zFUyWbTzQB/JL01fRp/xqHPhzmbO5mW/tBOS?=
 =?iso-8859-2?Q?9nZce57kkkQFdy62pGe/5mGiDqZt7CyWS/YNloKSlVIPaU1YbyeWfeQOp4?=
 =?iso-8859-2?Q?+ufaIgQlDXVzBvvksyfqCIb6Vl6FEAd7SuqtDi6YE/Rcfv5OlMTgQ2SQ7u?=
 =?iso-8859-2?Q?PXTyHh9i9m/rY4ack+g/jEYcVOUiCQz2qMDAVw7gPSdc4oE1SOVvJe2QnY?=
 =?iso-8859-2?Q?ACOMJQYqM4GsPASdVLv3Hi/PJBoFs8aO+5rwUZdYTz2Kwa4mI4nY+0u1QU?=
 =?iso-8859-2?Q?M/5GW0Ss+4F6ywJXXjI7vgPKR7R8b7pO5HTbsI8h81IDl5CJBb8q3OTVQv?=
 =?iso-8859-2?Q?ySy37zujTYCVfdtwcx1xo3fp4Vc8t3Q0NxPX8bBFsmNNx5u9eVqIcVNalf?=
 =?iso-8859-2?Q?phtCOkOkHUam5QR86k36+GB95xdVpmQ3fv5ekjVZyet3k4yK+r0+dYhbk8?=
 =?iso-8859-2?Q?cwlBOMnacKpBGz1C0oZFso2575OttEpjJCJCYwFfzjYnHmKWq3zx1tekh4?=
 =?iso-8859-2?Q?2UIJRg+PapkkXoAEa4Oe4MLrXu3uyxRzDJ8yOvI0TEnFJwWNkrLlJxEoGs?=
 =?iso-8859-2?Q?MH/yna0g6LHDhjLtg+9cs/AUN/V7nH3x5GjXT4FEKiPU7LREmk3oocyO95?=
 =?iso-8859-2?Q?pIu/KykrxwQHqPvO6OUjmZ69moubl+/WIVBdcItZ2rNTjaN0WjxwFC5xxM?=
 =?iso-8859-2?Q?eu9SL3YorkrdmKuXhngOsRHYZgj7mzkF05AiLfmwhKn02INx/Lqh7Yf0pm?=
 =?iso-8859-2?Q?vtI5G0YYiEeiTduB5QtDm0bC8tY1cAtIpp/aQUU+nrakqYDzsl8lmuyNe9?=
 =?iso-8859-2?Q?Idd25zvUJ/CXb8W+ZgsvlpJ3NFt7fa6hRvnsIADq3e5UF18UDD+wiW5yXb?=
 =?iso-8859-2?Q?yzVnLACKoB5yDKpEjg/jB1mCOaDWa8ns1sWvLaeMxjqw+aOgFFS1QJt6Nq?=
 =?iso-8859-2?Q?ioHL+FtcHWANX+E2NRGx52ajcK0pp9Qjp20cWgFeGrlD1ZRQr9ONPUeCYP?=
 =?iso-8859-2?Q?yW9W5nYeZNkH66eorSrbq+/2+EBXRIUHusJmw3tJuuKkMtthWms1TgQiDx?=
 =?iso-8859-2?Q?LW92cy8sBFBJE0fdDxS8qZM3gtVFhuuNjFD6nwWgcXvx+ZL+KCoqnY+lGa?=
 =?iso-8859-2?Q?jcRBYvH4YjKFOD9t/V14rNMGVWUWqd4GIEfIqNkgomw4TZnXAQjonmAIVV?=
 =?iso-8859-2?Q?B9HYe+pdsQRozTPzZG7AjEnj/Tay8aALEtu68TY3coAFFch0R8PnrKTvF8?=
 =?iso-8859-2?Q?YLzkG5q0SXWPqIrYMi9rv9IhOTYlV3y1KhV9CIRMb3Y369YjABxD3cx9UZ?=
 =?iso-8859-2?Q?fdBUiAGVu2IB3NZBy9oMBOp7U3Hmodc1qagnVG55turVD8pe50ioYJ0z7r?=
 =?iso-8859-2?Q?vlE71SvEO8qXZ1AmO23HEekmgJweuedRkJAgQDRwPbtZHXewNTKJLxb4my?=
 =?iso-8859-2?Q?Dfs0dEVdnRxkjZlx8+2PS1B+YVwpSZkz4BAwHIQkdvHa+CrAAt2mVR8B9i?=
 =?iso-8859-2?Q?EdenXjqJR3T+qP4YIK1VfLbOQlhNjzeKQuHi5/DngX5fQkkw6aubpEzshb?=
 =?iso-8859-2?Q?DZO0YXumwqiV3N9ixiNjgHVk2NVGX3Mau4?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR07MB3509.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc3298b-68f0-4aef-77a9-08dcd3e03587
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 10:38:30.3405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eFeh+qDZvc0gKKO4pDOnhzH+iwqwL92zt3opl4DhT1XZlr3oQS6+NWy1NsRuCdgkPT1kewMRdNCOLKcTQDY8vhVti6dE8Se1WtFOMYqTBF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB9923

From: Wojciech Siudy <wojciech.siudy@nokia.com>=0A=
=0A=
If the channel selection or deselection times out, it indicates=0A=
a failure in the mux's I2C subsystem. Without sending a reset pulse,=0A=
a power-on-reset of the entire device would be required to restore=0A=
communication.=0A=
=0A=
The datasheet specifies a minimum hold time of 4 ns for the reset=0A=
pulse, but due to the path's capacitance and themux having its own=0A=
clock, it is recommended to extend this to approximately 1 us.=0A=
=0A=
This option can be enabled using the i2c-mux-timeout-reset property=0A=
in the device tree and should only be used if the reset line is not=0A=
shared with other devices.=0A=
=0A=
Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>=0A=
---=0A=
Changelog:=0A=
v2:=0A=
  * Removed mail header from the commit log=0A=
  * Decreased reset pulse hold time from 10 to 1 ms=0A=
v3:=0A=
  * Make this functionality enabled by appropriate property in=0A=
    devicetree=0A=
v4:=0A=
  * Fix missing condition check from devicetree=0A=
---=0A=
 drivers/i2c/muxes/i2c-mux-pca954x.c | 51 ++++++++++++++++++++++-------=0A=
 1 file changed, 40 insertions(+), 11 deletions(-)=0A=
=0A=
diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mu=
x-pca954x.c=0A=
index 6f84018258c4..316048b0011d 100644=0A=
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c=0A=
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c=0A=
@@ -110,6 +110,7 @@ struct pca954x {=0A=
 	u8 last_chan;		/* last register value */=0A=
 	/* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >=3D 0 for channel */=0A=
 	s32 idle_state;=0A=
+	u8 timeout_reset;=0A=
 =0A=
 	struct i2c_client *client;=0A=
 =0A=
@@ -316,6 +317,30 @@ static u8 pca954x_regval(struct pca954x *data, u8 chan=
)=0A=
 		return 1 << chan;=0A=
 }=0A=
 =0A=
+static void pca954x_reset_deassert(struct pca954x *data)=0A=
+{=0A=
+	if (data->reset_cont)=0A=
+		reset_control_deassert(data->reset_cont);=0A=
+	else=0A=
+		gpiod_set_value_cansleep(data->reset_gpio, 0);=0A=
+}=0A=
+=0A=
+static void pca954x_reset_assert(struct pca954x *data)=0A=
+{=0A=
+	if (data->reset_cont)=0A=
+		reset_control_assert(data->reset_cont);=0A=
+	else=0A=
+		gpiod_set_value_cansleep(data->reset_gpio, 1);=0A=
+}=0A=
+=0A=
+static void pca954x_reset_mux(struct pca954x *data)=0A=
+{=0A=
+	dev_warn(&data->client->dev, "resetting the device\n");=0A=
+	pca954x_reset_assert(data);=0A=
+	udelay(1);=0A=
+	pca954x_reset_deassert(data);=0A=
+}=0A=
+=0A=
 static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)=0A=
 {=0A=
 	struct pca954x *data =3D i2c_mux_priv(muxc);=0A=
@@ -329,6 +354,9 @@ static int pca954x_select_chan(struct i2c_mux_core *mux=
c, u32 chan)=0A=
 		ret =3D pca954x_reg_write(muxc->parent, client, regval);=0A=
 		data->last_chan =3D ret < 0 ? 0 : regval;=0A=
 	}=0A=
+	if (ret =3D=3D -ETIMEDOUT && (data->reset_cont || data->reset_gpio) &&=0A=
+	    data->timeout_reset)=0A=
+		pca954x_reset_mux(data);=0A=
 =0A=
 	return ret;=0A=
 }=0A=
@@ -338,6 +366,7 @@ static int pca954x_deselect_mux(struct i2c_mux_core *mu=
xc, u32 chan)=0A=
 	struct pca954x *data =3D i2c_mux_priv(muxc);=0A=
 	struct i2c_client *client =3D data->client;=0A=
 	s32 idle_state;=0A=
+	int ret =3D 0;=0A=
 =0A=
 	idle_state =3D READ_ONCE(data->idle_state);=0A=
 	if (idle_state >=3D 0)=0A=
@@ -347,13 +376,16 @@ static int pca954x_deselect_mux(struct i2c_mux_core *=
muxc, u32 chan)=0A=
 	if (idle_state =3D=3D MUX_IDLE_DISCONNECT) {=0A=
 		/* Deselect active channel */=0A=
 		data->last_chan =3D 0;=0A=
-		return pca954x_reg_write(muxc->parent, client,=0A=
-					 data->last_chan);=0A=
+		ret =3D pca954x_reg_write(muxc->parent, client, data->last_chan);=0A=
+		if (ret =3D=3D -ETIMEDOUT &&=0A=
+		    (data->reset_cont || data->reset_gpio) &&=0A=
+		    data->timeout_reset)=0A=
+			pca954x_reset_mux(data);=0A=
 	}=0A=
 =0A=
 	/* otherwise leave as-is */=0A=
 =0A=
-	return 0;=0A=
+	return ret;=0A=
 }=0A=
 =0A=
 static ssize_t idle_state_show(struct device *dev,=0A=
@@ -543,14 +575,6 @@ static int pca954x_get_reset(struct device *dev, struc=
t pca954x *data)=0A=
 	return 0;=0A=
 }=0A=
 =0A=
-static void pca954x_reset_deassert(struct pca954x *data)=0A=
-{=0A=
-	if (data->reset_cont)=0A=
-		reset_control_deassert(data->reset_cont);=0A=
-	else=0A=
-		gpiod_set_value_cansleep(data->reset_gpio, 0);=0A=
-}=0A=
-=0A=
 /*=0A=
  * I2C init/probing/exit functions=0A=
  */=0A=
@@ -625,6 +649,11 @@ static int pca954x_probe(struct i2c_client *client)=0A=
 			data->idle_state =3D MUX_IDLE_DISCONNECT;=0A=
 	}=0A=
 =0A=
+	if (device_property_read_bool(dev, "i2c-mux-timeout-reset"))=0A=
+		data->timeout_reset =3D 1;=0A=
+	else=0A=
+		data->timeout_reset =3D 0;=0A=
+=0A=
 	/*=0A=
 	 * Write the mux register at addr to verify=0A=
 	 * that the mux is in fact present. This also=0A=
-- =0A=
2.34.1=0A=
=0A=

