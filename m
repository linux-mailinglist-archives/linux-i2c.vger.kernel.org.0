Return-Path: <linux-i2c+bounces-10501-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F51A947FA
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Apr 2025 15:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C912171B96
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Apr 2025 13:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CB21E571B;
	Sun, 20 Apr 2025 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="YaXgjbGN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4301E47CC
	for <linux-i2c@vger.kernel.org>; Sun, 20 Apr 2025 13:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745155266; cv=fail; b=Ouzzyhd49emw7RYpsGwHmkEL7R7bkbYE5SSTrYhSlG/BDuFsHXI82L1oG4VtdZsD8rzYE3DBhrOi5cTgNYtdgR6gSWxqpPEnZ8MR1JHSFgzOhehKpoB4UJZJenH18hecQEfUhglnaFSbAnzbhL4SEOaMoRuhx7d928VvI9r+MGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745155266; c=relaxed/simple;
	bh=MZBKkdwOGxgrA3AACSeQ0izQ2KVtbm0TbeLDLhOAsMw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QRy9O8XdXvgWzwWwNRLvPw7cO5jT2qY4PlpfTvmAtMf5MDTxb0r/4Wz8ts14EnjePltrNgOvtiUZMmCrLm0YywL9ji7YzX98juMvfWUGgSnlufAF57bevQCrjp7JVS22Q2+wUvGbAceNQcsKlHsSrzoUCgiZJck9ti7+Muqw1b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=YaXgjbGN; arc=fail smtp.client-ip=40.107.162.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWSGljUnWDadLaRJQ7se6bVzk0BoAEtF7xwG7GDB0+4sJatk772qTQ7aZjxGrugl2ItZuTFPB9iz6jWiUSltjPYVUbLKPvijtwDT01iKn9By0x2+iOmki1EWwt8lRXAAZ+jVcNWnbRb/qEOiwZ5u3UNoYI2NrW69t9MiXZ5/J+CV9YEfkawUCEIAeJysQg5VYx64xOxX9lhgYS0O2HeTHGD2kWDqboaZMq70QMg9ossR8CL3+lCG0tGXGsvD3xVZQv9g9EH9FgQNCDWqURIlyT+w/ycmPiwD/OI8Wmk+mG6vJkPLL6oRo9OB5R1AfJSxnq64RSubQp+HD1Nfs+Q8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZBKkdwOGxgrA3AACSeQ0izQ2KVtbm0TbeLDLhOAsMw=;
 b=q1U52rL4eL8HkQf+9RbnIKViEkt1b0VdKHZ+SLKolosfP3mu9dnY1PeMWbG9OORJ1CmOJxr/r5eOk2bw+XpVH+miAqNvZ4q/Tfgry1B3Un7rA4lSl3BBVl85J2pW13tO8T7zXMvMbGWe1WFw3F9dvqOBC4BHPvCAQst409bnEd9ONM7irA46NupgehCgVsDw+3XWmHlZkILyK3DFIKCsiNBlw6HKGQB+Pt1L59JQXEtWtxzxWHujLC8c2DdeHOHE/9SpgN4g6wvxc1nuj+cKGUVZ87Xz7a9fdu2Gq7e23k+z9SQB7+lwlpDyFHN4eyq+gdkZjjdroZ83nwTkMqpF9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZBKkdwOGxgrA3AACSeQ0izQ2KVtbm0TbeLDLhOAsMw=;
 b=YaXgjbGN/lmgLnMPcH1HdipKwu05z09ncHIcUtqHNUTfpfk63p/JTBYEmeYDVq53SiWgkKFJSDpRLIM3kDnzKO9Vczf+5sGMPioWOAPhgrhBWRe45qkBBzJkMfdhqf/o0W36B6+iQsBV4UA+hn9xJKjr9M0Af4f4aq0wIbCI71Q=
Received: from AS8PR09MB6594.eurprd09.prod.outlook.com (2603:10a6:20b:5c2::9)
 by DU0PR09MB6148.eurprd09.prod.outlook.com (2603:10a6:10:472::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Sun, 20 Apr
 2025 13:21:00 +0000
Received: from AS8PR09MB6594.eurprd09.prod.outlook.com
 ([fe80::79cb:3a94:1a78:ddc5]) by AS8PR09MB6594.eurprd09.prod.outlook.com
 ([fe80::79cb:3a94:1a78:ddc5%6]) with mapi id 15.20.8655.031; Sun, 20 Apr 2025
 13:21:00 +0000
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: [RFC] precise fault reporting in multi-message transactions
Thread-Topic: [RFC] precise fault reporting in multi-message transactions
Thread-Index: Adux9wvqs1aBmxaCTv2Ecl2s5arEtw==
Date: Sun, 20 Apr 2025 13:21:00 +0000
Message-ID:
 <AS8PR09MB65947626A6B5408FEB7EF8F192B92@AS8PR09MB6594.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR09MB6594:EE_|DU0PR09MB6148:EE_
x-ms-office365-filtering-correlation-id: d25621a2-995d-49eb-771b-08dd800e3151
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?BRVGITINyI61F3HjxsP7YDtHJIRzPv222DVXE5LFQzEaptTXzaUVgDlfh/za?=
 =?us-ascii?Q?t6xkkM6NQZIb8mvJ/kOx9ui/jT9D2I3ZSeKptImYW+0aAAUvtc/KNPtPnWYc?=
 =?us-ascii?Q?0j7rVMu0LxeSPPP1bE5Gk6+TLTSkXUiCITX31wmux6kwmF+A2L6Y04aCoWuy?=
 =?us-ascii?Q?u5HU3NeeOB6xXW6IkAbDfCxUnzkMpizIFL86ObcqfeCMzDq7CeDhH+Q3MqjH?=
 =?us-ascii?Q?KqgKA1GWQwbDnmK+fQgi7RrbPI4i/pBLl1kTHso5bqny+cBiRo1Nr2g3IgAB?=
 =?us-ascii?Q?L8w1P15M2TxZdHJybKkJt+0z1d/7oHT56Z2P57F2pOEfngTWdc1fPx66Gpmp?=
 =?us-ascii?Q?/xiLVqLYNb9w0uhWOkAglyqYs32I2lffyldW6DTzJGA5m5Vtm0nqpTk56enf?=
 =?us-ascii?Q?yKVd+83IEoDouZaAqep8sSgctFIHwVKI8Q5Ryyfxa4yl9jgmK36Q02dQqX78?=
 =?us-ascii?Q?Ot5q9tuJUJzmN1N6tSWTOA5ktgr9fAB+Grz56TLtGWzHIskGGXJ5QFrnhEBk?=
 =?us-ascii?Q?ed5Z6cW7poUPkkJ9Vi73NtaGkmJRLRFCIuFANMyjUYRwKVbWv27jUq6tg05I?=
 =?us-ascii?Q?L+AxfES46/1O3gtVEA2nrh/qaphrLTnJ00e95jvyPjgXpN4lY6vatorFrnSu?=
 =?us-ascii?Q?EwO5F9Rkdua1jWc0yjwgwlXr3D9uqCnrefveV5k1+Bm5jTy/OzaCuaZ2hYjt?=
 =?us-ascii?Q?o4EziPm5KADiF23Mp9dzdMRBYnHPqNgmPXDwQeSIx6Ebtz4FzWC/JQ5AG04Q?=
 =?us-ascii?Q?exSV5gAeY5Jag4l8jNORWNPZq3wXeJAgIr8Hw9KNFv2dR31eU2NbsyOHbZmn?=
 =?us-ascii?Q?X51shxrBLbelQH0XrK3XOOGiU3F+7ODFY76mQJXn/ajJlbhhQv64zUuP8IDz?=
 =?us-ascii?Q?5B4csmoTxZbLSvoE9DZI0FB2cMwsazcgRoA+i2mpag3vuEqWGqioEZPEm2Kp?=
 =?us-ascii?Q?GDYcVetUbSSlbozKzV+BvM99ChjeaZbrb6tOHbgglzl447qqXnXXe28ZAu/9?=
 =?us-ascii?Q?BOSgzuyppzc9PmWnNaogqEFQZUt2ohvSN/0rTxo4nBvg0YyQnB366K1+N5PO?=
 =?us-ascii?Q?EO+0X/REy1KXgIfxJEzKc4lUXf4j7TSEU/+RopogZjLsz66YFKRq/W3PXuZD?=
 =?us-ascii?Q?dRQBzUL4Hkv2trdj2ebJ4v7CipfNvYW6XyY0X2iwvSZFiIdHOxC3M3VjR42K?=
 =?us-ascii?Q?w8OciiWj7Bi7Z1oepBPPJ9elYvxBzJWV2S7xXqRnaQ2epmfqMiJaTSiQtGjG?=
 =?us-ascii?Q?GRbqvyXPA8i0pOc7bpBs1WQ7EymQABGkw691Qvtw4zoJSek9cUNfZwfMxBt2?=
 =?us-ascii?Q?Fcwg7vi6bZ7Ii3MGBCvLgAI7CjWixrtxVnst+TdFlvJmTjO5/dDG7ROnUtel?=
 =?us-ascii?Q?YJgPESMEOrSDRxLiLtO6SCIeOnMHvcsQwaJVBvjYC8F2IfTINfRMeRy2QFOe?=
 =?us-ascii?Q?yQbae7lBk/dCH+iG9oBb+WycNzaaLEmOzvsNYNCEGYjFqD+JvCRGsg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR09MB6594.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Bn6CckbbQpeqI7Q6al4wprBXiTN2btDvipn3XYHDlFQi15e521KcYSv+jZkw?=
 =?us-ascii?Q?J6sY7/VwEMy0itFech3xPcTvyKzVMCiV6dRMAtnxmH8wFEFvJJj+5cgI3x9n?=
 =?us-ascii?Q?X9EJ2kMfrnuql4H2gRXm/TrenvpY7cJxVXOMCn6Hltx5CxsQjHJEIMegZNc9?=
 =?us-ascii?Q?KHMRF/C/sWxkoIYGWrQxC7C0t4zvIjl+HidtUjl08byXaky9iE7unG0y8aid?=
 =?us-ascii?Q?NTXncZ7lyblvSTTNdFUWLPTmAQY7QsjHZfDXAG0gmaqaTrprG1n/IRUdMKHe?=
 =?us-ascii?Q?Z3hheQWG5T7v3qcTQohopkIFGswfClRq93AHNGEX0exxqgvaAgyXW97pSQGM?=
 =?us-ascii?Q?2N0QVZ0JmgdTHcKzxLGXVKfliqPL9srcPWIVg2cOb/wQlhbvGCEw8s4FLi8q?=
 =?us-ascii?Q?8PUJvN2k5o6QAUiDomwc37ithJccx4hDpw9jskTt9Esgk5nA99cZ8+fq20pe?=
 =?us-ascii?Q?tP4bqgAfyQ+uNsVOiKTriiT0I007q9xQDQE40ABjdtzCL4jRrqMpw+tx8Fnv?=
 =?us-ascii?Q?qTDjb8SKU2jZ20QipivgTPN7YwuUzMLsSIhobhY8K1bkpgyq93C1j0N2SvwC?=
 =?us-ascii?Q?deoRKrAwm9Xrz+UXttAxASVljsRMSTj04w4eYrUGV8kWf7v7crO/pUv1Mx5z?=
 =?us-ascii?Q?U3I8fZUV2Va5MZVqDMeiI+TEqAKabVnMg7GXaX15yRNjVhjjpbiue5t8yx0B?=
 =?us-ascii?Q?Vy8AMp2UIEKMf5MF1r2OwgYdpXyPUpMp1RR4dlx18M3jfP88x5coggqn32sM?=
 =?us-ascii?Q?al9h+dDXt/W8S3wSbf3j07sCSyfl9nfdV8vlWWdWgYadGpEDwR5CT7OSG882?=
 =?us-ascii?Q?2nhYQuQMaevhIDsrzriIwwBr0PGq3oTn4L6eD1ISUaXYM54zBhVv8x34nNrw?=
 =?us-ascii?Q?GeKQVpAz9OLKLzwHpCjsX0Y+ASAqhpaR5ARB0QlbAH0ouVHPHnSvWQtYNl2U?=
 =?us-ascii?Q?v/+fLMX0HtA71WFGpb1/vJ8M3GWQinAEabpfmp0et9gE6XxJoCUVOH87TJwT?=
 =?us-ascii?Q?xFiE82if19D20oaEUyUG8yTSCwd6259h7pYYi0MO8JtsDb3LVlizJw7NwjX5?=
 =?us-ascii?Q?Zr4NRECPwGkM9EJrUhE38GKQN9dSeRrwj/FNrpMvXLj2k28ZierwKfrPtv8i?=
 =?us-ascii?Q?auIK3YwOrk8fkXZP8diMY0keV4DS7gDOC43oD2nJ8NFLkcZrYtkcs+7yQmz0?=
 =?us-ascii?Q?a/ExDnLkzoGD0IwN1jI+igewqk6pC1zC2qlKlHmVnP5W78Ht2pUaIijh7NsS?=
 =?us-ascii?Q?hA8GVDdobGzryyyxYp7ALlQMJjPrnlSRcFu4lIYZeap43u7P0eGhTKVEGiUM?=
 =?us-ascii?Q?uo8aYD9ZC7kcshsp9VxBzbS7yyETzXIVodsO51Ra8vKbh9vRzGCb8wzpsjsB?=
 =?us-ascii?Q?gq62ZxIPu6O8BQiofxqz/OsjuG7S3vzhx6JnKE87vgq/6+rC6pD60UdTki6V?=
 =?us-ascii?Q?s11c9429S6YLATNw+OiXQrCCdrUma88dsAxay9l3qohdp3z5tWCjbUxoTRzP?=
 =?us-ascii?Q?DU/tD1D1cr/73TKsTi1+wXuM4SJq9ZS0eZf3ndDqbvaVeByD/VJVJGqXjhj0?=
 =?us-ascii?Q?VSuptHr9DsYHS1UcuUPKCyPqPaXRyPG/E9xy6oGS?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d25621a2-995d-49eb-771b-08dd800e3151
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2025 13:21:00.1190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XYkdLmEwy+h01CJJDustv6CySe98a6kK6UWXPF5OFMvOtILVjMvI5zGb0SV4wPcgvfucn94RXpFvZ7bbNAcKJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR09MB6148

We use I2C_RDWR ioctl to send multiple messages to one or more slaves in a
single batch.=20
If a communication fault occurs, we need to know exactly which of these
messages have been sent successfully and which one caused the fault, becaus=
e
our recovery flow depends on it.
We are doing this from an userspace process, so it would be too expensive i=
n
matters of time to send these messages one by one.

The existing API doesn't provide such feature. ioctl() returns zero if the
communication was successful, or, in case of a fault, the error code return=
ed
by `master_xfer` driver callback is returned in `errno` variable, but the
number of messages or bytes sent successfully is unknown.

My suggestion is to return the message transmission status using `flags` fi=
eld
in `i2c_msg` structure with the following scenario (described from userspac=
e
point of view):

1) Client checks if the driver supports this feature with I2C_FUNCS ioctl.
We should define I2C_FUNC_FAULT_REPORT flag for this.

2) If the driver supports it, client can set I2C_M_FAULT_REPORT flag in `fl=
ags`
field of all elements in `struct i2c_msg[]` array before starting transmiss=
ion.

3) The driver resets I2C_M_FAULT_REPORT flag for any message that caused a
fault during transmission if this flag was set. If the message has been
transmitted successfully, the driver leaves I2C_M_FAULT_REPORT flag set.
Alternatively, the driver can reset this flag if the message was transmitte=
d
successfully and leave it set in case of a fault.

Does it look like a good design?

