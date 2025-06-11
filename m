Return-Path: <linux-i2c+bounces-11363-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D310BAD5752
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 15:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B80DE17E447
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 13:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D5E28F1;
	Wed, 11 Jun 2025 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="WSeiQahk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1BF28C5BE
	for <linux-i2c@vger.kernel.org>; Wed, 11 Jun 2025 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648964; cv=fail; b=XBX/3G6zXmUtw/jxZWtS85fWEgkjMKY7hF1+zX+XyMu+lM2i3GkM1+CoBTegT9FOXXu5efH5F6DEZbO0SI46Ol5WLBTibNbHhMpwZ7m7CG4qwD4V40owqIxnq5kPLnpMAFOiIqVZpzgrR10H35yc7JZmuZJB8aqYvMknz0IPlXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648964; c=relaxed/simple;
	bh=iy7fed1hLG8wDiRX0ANDV80C9tiC8kj+EYFVgC4tb6w=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FsE/tA167G6HMMn7FJEXo6xcalc5d4WM2C5zX9/1Wpdtbf0F3894fksMfFFP/OGYSAMLo0JyfwpI6StePUqruoWtlZJbEfDHwY3SkqAHws58tww4gGLw2CJzBdqzZ9Q5At1BHHegJdZ+R648cOxdWYxs7vvGYkJoJtqrOspd04I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=WSeiQahk; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAH6wH4/bp8s8KBY1g4K7DorORxFkiFUsO2ED/ZlZGWK2C5Er32c/SY/wt+LtRadRs9NZJbG6ul2CXAwsmx1pdFzkMYqlHSelFhJmJlu948clyXyx0GSU+NC8Z7rIjPG04VSjGGBM+ZGL37b/Swjusa1s9MifDS8QiK76dWpqQ7/PRe0C4sjCXXkKksT5256biyrSiB+6+hvjg84OcqkxtBZQjnPHQCqmXRVoGdknMeD/Yo0RWsRLqCF44QL7tWBZVqaI7P8+8Y54MG69B/A9WeBDQUZFkVFUy0xVtCsfvM+m05+P0hejIHItuo5aEGXB2XlI9K+edTxBypjdGy23A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPcED6hmvXuVfdfG6IJn01yCrX693T8LT64Y6IPDMY0=;
 b=QVtce91N/JP0FsZieENrsLExTRMSzI9k5yjcwMdvc+fFJhGm/UcHPGUYQFOJL3IKj6yKqh6aD4A2sYr9Y4BWcoR1/7WkXKdBj27/o6xXrYjfXdwrpcxcFUI7op9n4D1CTCTMFAW5Vxu54bXeWmPVbZ5Hd/lvaNLYwbGv1uoU5KPYy5wSak4GXS2mSSGiVEcFPacfDEkYLewjPYqYf5TqcpMJ67IKCuAzyyMZC8KQ4El/SCFYfnfM4W8ZTYSS+YUdzkkemfeB34rSmPb6JNh0yxImA8qzS/LOk33MxuE2oKhxNOpmGmkdCnwNthUTJHaQ4AcNx2wZpLrewUlQ249OJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPcED6hmvXuVfdfG6IJn01yCrX693T8LT64Y6IPDMY0=;
 b=WSeiQahkFBmOxoylOJk/OyAwOmg0moAlaFPh1h/UD5s/2TTaYHrQrghsA9UyuGQGuYDVKXEWsVTYUGYzD2hL8AZEXvSO1dT2AjOC+9mu+mSjc/3Uc58s0aZlR2pZsq0OvF3oT7lwCFoTnMDc4ycFR3tmaQPtm+Ac0DuWjB/WYyU=
Received: from AS8PR09MB6594.eurprd09.prod.outlook.com (2603:10a6:20b:5c2::9)
 by DB3PR09MB6251.eurprd09.prod.outlook.com (2603:10a6:10:43d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Wed, 11 Jun
 2025 13:35:57 +0000
Received: from AS8PR09MB6594.eurprd09.prod.outlook.com
 ([fe80::79cb:3a94:1a78:ddc5]) by AS8PR09MB6594.eurprd09.prod.outlook.com
 ([fe80::79cb:3a94:1a78:ddc5%3]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 13:35:57 +0000
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: [RFC] I2C master: precise fault reporting in multi-message
 transactions
Thread-Topic: [RFC] I2C master: precise fault reporting in multi-message
 transactions
Thread-Index: Adva1ViRS6pdlQtjRoCiBxDHAKlpdw==
Date: Wed, 11 Jun 2025 13:35:57 +0000
Message-ID:
 <AS8PR09MB6594CE2834B392CAA3303B949275A@AS8PR09MB6594.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR09MB6594:EE_|DB3PR09MB6251:EE_
x-ms-office365-filtering-correlation-id: f1d38276-609d-456a-c170-08dda8ece56d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ChC+mXkDBUHRD1GGxpScozlTv4sOrL8DhoM92kDI22x8MRDeiEem5sJpu2p2?=
 =?us-ascii?Q?1zZn23NWnk7plJJdG2V+fEUDN4whcDlMoq43+w5UFUnyKZjINVnkcCLSsGnE?=
 =?us-ascii?Q?7ibHnl0pV1grpvYaG3WktgR8bt1zfWSR5x2AW+1DQuI1Vsof0H5k6QaA7r9M?=
 =?us-ascii?Q?3zbF7cS22I/tM07hHXuGDf/n1SXF7iuC6QlrZH2LpZZP95NMRYYeJB5MI7+3?=
 =?us-ascii?Q?Z3kh1dsniZCLCg0jMhgTeegq3aboregucdExazY/8pJpRw/wP4msHL9wNLpw?=
 =?us-ascii?Q?1WqQ0ETDi3JLegW627CIRsO6H0ihB8Acnkvns0uZM4FVAucfVOynQvPry/1h?=
 =?us-ascii?Q?uCaI2SdiGpdAzIGM1HwcdTSw2w06AD/Ng0kQL8O8SZh1gazhyPjvmxPpzcCm?=
 =?us-ascii?Q?yZ4m13Q0i/WKwcBhSicyTmH0owC6/UfLJX6BIvVu8pIvcX9H0FUOEJXEf6QK?=
 =?us-ascii?Q?HXT8fLF0ATImm67iRZhoaJKsfUrrhP+GASi8hr9evZ+3KnPeU/sVcC96++lK?=
 =?us-ascii?Q?fNglyJmu2TQLediTkkRRkte0cTOK9gooKe3n6hor/WLYbpFEMdLyi81BGUm/?=
 =?us-ascii?Q?ttlJfbsDPw7uoiPSin1WVyOO7p7+pinej+oyFyccQSyrE0yHGELDNKTDNXbH?=
 =?us-ascii?Q?ZwD0ewhGi3pUE79qNLD9p2hgzvr34aM/IvVdYhxTzN/qaAad2vquX8KWiRTg?=
 =?us-ascii?Q?6kHMBWF+UYQiyn1TZa5GH0iMoP8ykLwpLHcFsvqQ6PXCSBsVT8jLtP/5GTSc?=
 =?us-ascii?Q?ZT+S37hOKOkXnFvwN3VS/2W1ipQtIMNkmID/+jZkG/8CXOlGnQ+R8Mn+IV9c?=
 =?us-ascii?Q?aTz5zHNxiQggNwahw+R7g2Fr4YirXRrLuCH+5bF0EL0cvrU8O6OqQ4ixih0s?=
 =?us-ascii?Q?bPQEZ+mDgTtF/Xyi7nTyTY/PgET7YkJw9Vy1vuFmtIgKEtoMFQtxtuw7Ey2w?=
 =?us-ascii?Q?PtZarnrfh4sOq7f4plwpoNgBVK8KD8KFAW61rYe5Wm/vdbVVO83yKR4nXzY6?=
 =?us-ascii?Q?Dk4oT2s2IzzKKym/TdvhBNu5SYbaHPXuz66FbUSAZCeimYY8ymXLCX6lsZbn?=
 =?us-ascii?Q?sGnrw0KyrLImVrqz24KXzk+Bey5Lym1mz4vkDYcxm4UU10Oc68xQ4HcUe1dr?=
 =?us-ascii?Q?IY11nOzq8FdW7HTmZd9wPJaDJE+kChXH54qapwuFpQNbWUZvlfp4lNamYZSN?=
 =?us-ascii?Q?Jm6RUgU+qVDJNsXk4/55JkzRjRWziPSFSYAJmU8dafW43YSXtlVPuRcykH8c?=
 =?us-ascii?Q?xuQ2w3WKXw0umf/JJT5BMqBDzSQ2fEAYTqoK4IYx+zaNVX3qlnKE2msfKxwM?=
 =?us-ascii?Q?/SUnQU3J0TnOfuJd2kt/Nkt9MzvflyKQOQotn+YHj1CxZDVmUWd2twwXHHBC?=
 =?us-ascii?Q?V3fPjd5F/wbXhuNp+1Hwg5BfnEJ3iPzTSVxB2wH4yHXpe04Z6BYomnapFqY1?=
 =?us-ascii?Q?LuaA1IdYARikLdWDkApbYq1cfkpg0GnbMoLigjQuEaLoe9I8KNJqqQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR09MB6594.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?O4Gd+F+PYvb8NfSNlHQVsjmAnSf/3wpe8gvKawtannEkd4U35R/VoAqVIbBt?=
 =?us-ascii?Q?lvJbZ3gT8vJlKwm8e+xQWp4ey/8yppxrCUTuBd5/2oMm3zhH7XZfGz18A2dE?=
 =?us-ascii?Q?H/CRSAYjM4nxcM9F3qAslq5AO+1yYGsaBrRX6LhLKd/tvOaWKjc3R9TtqS+q?=
 =?us-ascii?Q?Gnvtm/NLS0olna5WdYhOoY52IUBEqRCbTfE+/OSqTCge8frNnnxPORvAHltU?=
 =?us-ascii?Q?A3RhWvZnZrP6o3eO1XiSViHKJmpcKII7g0Lq+hB9LQyczRBbxXyaBS8OiG4G?=
 =?us-ascii?Q?foYKfDc/l5kA2bR8lYqf9Obk53rapB0vwQflXzX3dByIvRDz8h2bS/XJrEd/?=
 =?us-ascii?Q?LzTe3028KDAGyiEzgHqzkeXXiGsGBupWA5U4Wgn+EYHFB1My8qcaJF7hg4ZO?=
 =?us-ascii?Q?PbR8eLVEbHaGtyQMj30kGl5UzgKPq237+svmYoe4q8y4/BTZc+4rC2GbgQSk?=
 =?us-ascii?Q?YiqoCcU56Ntgzhh7Wu1t//p2bcWFyRWuiBNCsQB1Ml+oPkMwc71m59YW8eMt?=
 =?us-ascii?Q?QF+lQwO3GwosxglXTlVZxs6u6u9nB4oa0VMLiu2RD58HcK1ZiYGnRuDniJgN?=
 =?us-ascii?Q?zoWKlv01YpN87IvVFHheuPQnclUTzwbQbRJEZ6W4cMEHNKg3fzBkUk5UFW2A?=
 =?us-ascii?Q?oCkM2TWUfceEL3ZFKBUCT5wnZtpjXVi1kRFpo32ZUt3ie4A1fCYyzT4lF6bB?=
 =?us-ascii?Q?LS3HYX66RRZ9LgmGUgMRuvFnoxl4zLssdati/uzW4E4MKzwq3trOTkJ9EuWI?=
 =?us-ascii?Q?i1COJN4BWAPQ1tHQvsWMLXMHYqzY3hf56SzxfsP5qbogb95RHVaInIELaSGV?=
 =?us-ascii?Q?KtGLdbcrW9B4K6kVcHwV97uOJwjH/04J+4yrAudwLKOBJz2d0D5fxiMYGdKg?=
 =?us-ascii?Q?uLv5JAC7q62qkaOh22SPFmNXihIg4OOsJBvv2txE0x6prpxTFxl69NGChVOX?=
 =?us-ascii?Q?INXaWdO/JqIrv72tVWpRP8ENLcR5uxFHH3pmTDS6oPoZJfmZKVLnzRPm7y8T?=
 =?us-ascii?Q?30n3c0KiKSkr+4lE1Q2SU/tab3nBnZqkF9RWoBIklX2EQQ8WUEKdP3ueM2Yu?=
 =?us-ascii?Q?txOZfzTb5jSl9gkHX/bSEqUvsWv0KTHDp7Ps2WTRJfvVplpVa3ZVTc5vbP7n?=
 =?us-ascii?Q?PhZp2FD5RpMcjU/G1mKDbik9aisLBZ5ib9vV9FOGWz9TwUXjFlovROePjlXH?=
 =?us-ascii?Q?pH5mk/zdOdvBXO36I+vSIxtAaGjZJhlyioSKI3XVzrb0zOGMvcjCG1Pti7Ih?=
 =?us-ascii?Q?nGHVQbnqknY7i/A4zTnJdVkEL4bXDBl8kF0a/3hIvt5XLpQ6HiNPXtRta6GZ?=
 =?us-ascii?Q?zcsOEd6CBpkXspuwLOJdqvvtOlYl98Wwq0wSQVU0KoCybYCq21OawPxC4b/z?=
 =?us-ascii?Q?FJvi1JIajTG3Zg4cM9gkkDY4U7X90Ky9FG/bNeC7WwAsKBO4R0/s9wqILTv6?=
 =?us-ascii?Q?2ZXrzSCWuoxDZS1namS4OCHitZgjZMUqJBW1ppUBk47ND6jdnc9cUJMMvvkb?=
 =?us-ascii?Q?Tep+LkUOIOZWq027HBdI0js+CP68NKSUbXKK1y4Hvohypin2wXU/8jtlFzcZ?=
 =?us-ascii?Q?IP/DNh9uRgH3a0CHPi25O+q+BocsBy5IUpn6+dw4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR09MB6594.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d38276-609d-456a-c170-08dda8ece56d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 13:35:57.1367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R1kS3VQpaBw7IHxenjAxdM9FbQaGYb+eEsBQsTUG4V20QEX26DYOdgt4dhjCCu7oM+PRLIsjEfHmeuBi2D9d1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR09MB6251

Hi all,

I sent a message about a feature that I lack in I2C subsystem some time ago=
,
but didn't get any response, now I send it again with some updates.

In my user space software, I send several messages to a slave device in a
single `I2C_RDWR` ioctl. It acts like `i2ctransfer` called with several
`wLENGTH[@ADDR]` arguments, e.g.:

	i2ctransfer -y 0 w2@0x10 0x01 0x55 w2@0x10 0x10 0xaa ....

The problem is that if some fault occurs, the caller doesn't have any way
to know how many messages were sent successfully and which one caused a
fault. This is important because the fault recovery flow depends on this
knowledge.

I suggest the following design:

1) We need two new definitions in `i2c.h`: `I2C_FUNC_FAULT_REPORT` and
`I2C_M_FAULT`.

2) When I2C bus driver that supports this feature detects any fault during
transferring messages, it sets `I2C_M_FAULT` bit in `flags` field of the
element in `struct i2c_msg` array that caused the fault, and clear it if it
was set before for any message sent successfully.

3) In `i2cdev_ioctl_rdwr()`, if the driver has `I2C_FUNC_FAULT_REPORT`
functionality, the updated `flags` field is copied to the user space.

4) If the user space application gets a negative return value of `I2C_RDWR`
ioctl, it looks for `I2C_M_FAULT` flag set in the `struct i2c_msg[]` array
that was passed to `ioctl`. If it finds it, it means that this message caus=
ed
a fault and all the previous messages have been sent successfully.

Is the modification of `flags` field in `struct i2c_msg[]` array
acceptable, or it can break backward compatibility? I didn't find in
documentation any claims (neither positive nor negative) about that.

Alternatively, the caller can request the precise error reporting
explicitly, by setting `I2C_M_FAULT` bit in `flags` before initiating
transfer, but this design is more complicated.

What are your thoughts about this?


