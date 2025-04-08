Return-Path: <linux-i2c+bounces-10204-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9069AA7FB82
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 12:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04A1417EF2B
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 10:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F91826657D;
	Tue,  8 Apr 2025 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="nma4HZGz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2070.outbound.protection.outlook.com [40.107.103.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7AA266B40
	for <linux-i2c@vger.kernel.org>; Tue,  8 Apr 2025 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107090; cv=fail; b=mF9H/pIWJLtVXTALnAEiLCxs143/7MYTn+KdxTg9Cdb0TTdx8kNOVi3Jp4mF8/jdDRxJhSlpxoXWLh19pttDrDPUZxI23Nh73seIxk0GczOP8Hh7dw6oyqxLtXYkNrp0uYG6s9IG4WosBCJrrF3+wzyX4mInlq5BNsxPOp+ZRto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107090; c=relaxed/simple;
	bh=Ozs72N2yUYRKiMUm0LSoFb5BPwERDDSGGkxOupV+2Q0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pGWSQ20xvfzRXNAZrlK3KMwTq1lmgBWU+5b12UKkdXymIk56YjDHPZENRn7townHbaaa6E9f1skJoTztvqGVny/ZQuTH3BPb1QSIcq8xwQ9etZ5+brM6whxCUwFsUmfK4RNapDnjN+idPzWZdambD90W51wteHfGOw4qsUSULmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=nma4HZGz; arc=fail smtp.client-ip=40.107.103.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLtexiFcmHYnseMdY+5O4MwzIbfwyB/eWVMO2e7KduhhPplEIYCS358BUzRsVCXs6xSZDm9/BRDRQDm6ylsSq7/arq5aBiaAqBQk9kR37XVDvL2ycPSQJBaJHRyme4KxQ/PumU+Nx6EmKpuDXyMGJjwafk6QBU7VsJgdO73ArEqTdlyT5t9sceUwPydIVf7Pnk/+6bNo6KWcOccQQXQHdBpAArNUvfcxXbP7a5PpSbK51XSQHx2AtQo0kiLV+TfXcHKPsSoOCcJbLNCJW/5f2si4aFNRxhapCahNTxmui6R4wAuMjmn4DX+fWH64d0bt2fGC64eTyBTvgiCE80Esrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ozs72N2yUYRKiMUm0LSoFb5BPwERDDSGGkxOupV+2Q0=;
 b=m/TV6gnt2o3iS8+gQCx9H3ih+oZ1HnE+Gp9GSJDmr68DRth/K0vqrCaQHTpMXbX9sLfVIX2s9kRO5GYNIxnDHR7w+aGGVOGtUzah+OQvEzWMfXNx62JAYf6zdARyKkiCBxPh+V9jpSffI9sOulKeyJ75ULOyU9wQtOjvGbl/Fvsi03j2PCsJl7oHZP/wQDcHDBIdXpEFcPRZ4SDrNnqzomAqs9/wACYk1niawr6t2aStjjku1l4fSmhT9aYVtlwj3CvpQUNCG8jmU/w2zJdLkxb+a0eu8tOx2ePTg81hBN7RnWKlMrwrl79sr5mN4YAD+MpID0Mk/iP78HWwGNMDEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ozs72N2yUYRKiMUm0LSoFb5BPwERDDSGGkxOupV+2Q0=;
 b=nma4HZGzIIocNG9SqDh6wpNG8PFbBqeM+9yihep3RQRnpFmg8cIh3wmSLHri/WDeoCaqRgdKm1GhjPFxg1a7471SBMzMqxsUN6tNCwOzh1jvks82mvDcGIgB9mXG5qY6XPc82yZfjiyHOexSqKVGAb6onK+IIYGdWzlkemLHGFg=
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by PAXPR09MB5605.eurprd09.prod.outlook.com (2603:10a6:102:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 10:11:25 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 10:11:25 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: [RFC] Handle targets with different speed by the same I2C master
Thread-Topic: [RFC] Handle targets with different speed by the same I2C master
Thread-Index: AQHbqFs/gVN2unV8DUyyXrxsBlCMuA==
Date: Tue, 8 Apr 2025 10:11:25 +0000
Message-ID:
 <AS2PR09MB629642F8FF0F7CD6F3498E8C94B52@AS2PR09MB6296.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR09MB6296:EE_|PAXPR09MB5605:EE_
x-ms-office365-filtering-correlation-id: 30552e10-e887-446a-65f8-08dd7685b852
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?iPRDSGPvpgeOobLpAVYGsXEfT07Dq/CMefB0XcD6P5mO9dVhfCA+0epJCk?=
 =?iso-8859-1?Q?o/QRRk9/FInWE8fizEY2ncTS8p7ZPceZ72v0NNZ6cqE8CzgbZDvAwxoCEe?=
 =?iso-8859-1?Q?EQC/EWSQxGJNH4fsw9KZ9VeYGDdjEzq8TFn6EfFtGGask6UYHTBrRMD8mH?=
 =?iso-8859-1?Q?AQhaNgboz1WNv+I6YdsKUCP7VpTAC1nDq6fL36yo/IbrsGH51E3N4DwMK9?=
 =?iso-8859-1?Q?jBVKxkvyr2AnfEB1L8nAkFDc1WOvpIgYXlOXHWe/dvmZiWmJ2EQ6Qumm3V?=
 =?iso-8859-1?Q?NNub7O7jM1vaVC5EKk1pnbiKV2GcMipD3KXoBJc6eq0vJWiCfGSPrn77MB?=
 =?iso-8859-1?Q?J+yD/NvSvNn6Lwsgu0c1TrkrOYPr/D5DxPo2jm+FP8aXs4LWJQelvNQb+6?=
 =?iso-8859-1?Q?eDpDkEauUDyeS1qSJIHu2XfVbIS1f/aBTUXvLaEHoDHQPrCPgscgEG+7EA?=
 =?iso-8859-1?Q?+SIMsN8kfGVs1Bq1lM7BDqnoFCbYHxx9y7JkZW/TjZ0higtcI3GSIm57X+?=
 =?iso-8859-1?Q?tiKDpwE7dlm4biMlinVSqHyuSOviaIDlLwqQBn9zbK3FCJGfoNC4WSwfhE?=
 =?iso-8859-1?Q?eQjF6YDYRWeVZ+WrbjJWfc1k5DC52v+0DkYbPELg3OF/uPl1hRvciSc/zk?=
 =?iso-8859-1?Q?6+AeQY6g3nSWauH8BUNyrHNdBMIivQQW4kG/FE6SWpHF9dLNrNrgq9dfCt?=
 =?iso-8859-1?Q?WGQjLxFJ/KyZpdfQ+MHKwkfOsRv2ESV7n1aIp6acHbjnH61PYWVpDVZC2s?=
 =?iso-8859-1?Q?uUCYwzvkRFYDdw27F0iigUfw3UZtpirHX7CecOUwXn/FrXNCsKckKe3xSt?=
 =?iso-8859-1?Q?hecxbXQRLDBUizClSv2afRM2wsZdGM+5BYagyG3vSZZQgYsjotT/zsW6vV?=
 =?iso-8859-1?Q?t6BnZkMVJSFdfUaXC2pt6IqDeyRsCam+prQwdaeBQKeESoE7V2yHe4TjP5?=
 =?iso-8859-1?Q?VgeyEUe4/Cndfls5eIU7MKFown++4RiUlYCPXTrbQq2OURPTdUxjCLbIsx?=
 =?iso-8859-1?Q?b18uYDVpLqqg8YFuywxNXDXY8xisv3qCcm9SH9kOW6WieCdeX3ucC+tbSd?=
 =?iso-8859-1?Q?Ju8WMgemHaD/U26jWb1vdCsjbbWXBTqVW+JzDGgBZQXde7h0dylzMQStKO?=
 =?iso-8859-1?Q?En6mrd0VopN3wwYcgUM3xrXlKCuD6NdMe5qj3VIgdTkL6UPWs8mMc5slBy?=
 =?iso-8859-1?Q?fO2nWxIaKnaMXneYPJB9MzWhWB+u978mtDj3KFV4fczgPeLPjQNaFNDJN3?=
 =?iso-8859-1?Q?oJBy9OeyCmpGTf4WTBNNYwwqYWrpDPmIccNk/J2UqBLsnbpY3JAzoTaOQv?=
 =?iso-8859-1?Q?kT9HOABpEb3YHSBQ+Rl7WTc6wgAz+PmZpYA2acMP5ymP0uPurfZMUcWD3V?=
 =?iso-8859-1?Q?IrBzwLsuUhP+OQYc5oaTUHtWVMKsR/n3JCvfLRLkZS9W78mvwPVLEMst3P?=
 =?iso-8859-1?Q?biKAiK+iPCUe0DiKjKd69yCDIWN58WBJIYa2F/9e2haPvtRpPFEY57fNdM?=
 =?iso-8859-1?Q?x+JUIkOeIy2Zbmh8CCWByv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LGBKMmU7Kwj9U1FbuEzKR+aooALfz1WF3DfBofsIeqTvNLstLnn091BKDX?=
 =?iso-8859-1?Q?x8y3/e7IttIIB3geS65MedZjBaBZQe0oGAyU5IyQvVmQkLSZXeiVpgFzlc?=
 =?iso-8859-1?Q?6VifqjQrOC69UvdX9zii+Lyg4n26RQJdZcNkHk2QwrcBKwOo03f8ZjYak1?=
 =?iso-8859-1?Q?/GuROtVi4V/59FtZZU/xZWbmYzOBkoEUEQm2JiW93cJ/KA0Ga5qZ54PiXu?=
 =?iso-8859-1?Q?5xn7viLMIyjEuFjeaDghbmicKIOxyVDXLP9qHQkUFZ7xeN921L7s+1OABg?=
 =?iso-8859-1?Q?vYT0s9NuRuercX2S3W0QNH6XX7TyZAT15UK0m20Z3ZNKtkJiQwy2tfqJy4?=
 =?iso-8859-1?Q?DcLWSEJSVbHqORaMluJ2GtBYyzm6Whw5nZgJvRHNWiU7UCEjsuQU24xhH/?=
 =?iso-8859-1?Q?3eOd/RqtGbvAFWTtqp0xy4QIoUBUTXcTGHi136I9StRVmjWkSHq/dAlGaC?=
 =?iso-8859-1?Q?Grbmq5RJ6s/OxdYZh62jR12BX1Jlz7cGHVB39N5OnyV5+Tq6f7wuP0Yr3j?=
 =?iso-8859-1?Q?doN6/TikrIiUw7zfLjKwYT+RqktxbJQBg+d66xEDx9TTW+KINFoIj9aHi2?=
 =?iso-8859-1?Q?hPAIXa90kJ2ZOeCm/Mw13iTL+LL9R4lvGV/yWz2iERBJhzjAV5qNCWFB4L?=
 =?iso-8859-1?Q?GSfSbL1RencWKHP4sUjl/TdQLKkhXgKh7w54nx/ylf57NcwSKxLUm4ddrj?=
 =?iso-8859-1?Q?AvCU01E9Y8uRZsCoNA4pGUcieobK4gX8px8D+zlFzlMvTk1A0Tqhj0TzCP?=
 =?iso-8859-1?Q?iPfmGSDpdTcjqnBweNorLUGxkV0S+lxKy4oVxWbZYp/WcwLzzZgRgp4Xod?=
 =?iso-8859-1?Q?MKGX3vmW9TxUPqN0ItPB9mZhX2T/3HbxdOp7MatgK70cMhDe5m674SRE4O?=
 =?iso-8859-1?Q?losBNT/QvTp1PmGp4SWwPEGTxTE+tmDPITXYAndcFbF7Vh2orG+fG9DW9K?=
 =?iso-8859-1?Q?1pTbw/aP/aezK+skCELFcQ1YnzDK38xdhGxqILI+MCRBK5LHbre+kqtfa6?=
 =?iso-8859-1?Q?icz0agM37fhD4Amh+7CN90RvvjbC7K+w0KEMh26tb6UAeRDwkUAyCzMaGI?=
 =?iso-8859-1?Q?okkdvR3A/gkg+q4upB6rB+DHT0mWrmuQ2oGE+znqzc/LMGXoltvQ/jZ4BM?=
 =?iso-8859-1?Q?CzKgmVP9zgFlVL0mTIVXp5YbVqRVkpxddyej4kX3M6Ciyxp3qoY7Ruco/t?=
 =?iso-8859-1?Q?vSImmI63Fe3NEEg32bm3SM2IDLsqKEjkUARPfx7296r6jLRFVuxaMc1CqS?=
 =?iso-8859-1?Q?w3e2POnj+emPGazmKxzqnHHv38eI3S71Or/N8aBnYV31BfkjRpFsyicah4?=
 =?iso-8859-1?Q?ZOz+hmmTr4Ir7yNtPjooPxYQmuSJP8N+i7OiFJnDyAMLIxuSti3m/2kx1b?=
 =?iso-8859-1?Q?A5xRv9exQK4m+zqFFKHDvk50bilW+lToZCx4SILV1npsbZPpdatcwZALYY?=
 =?iso-8859-1?Q?HdLPghSwyLnV2nJ1YS68qBnlzh2wotR8X6Ff3T4/kf/T2vHjVE+vglmvfe?=
 =?iso-8859-1?Q?Tz0qt9Q/rO2i6+z3NV8isDOL7pSSe3xbd1WwCTNqnLsz8nyFvufxWL9iTm?=
 =?iso-8859-1?Q?+mYsS6vhc/SXLVsfMN89ueJxmnBglkgkcsobSPh5SbW62DwMBjCpwKF3VM?=
 =?iso-8859-1?Q?pgPJuwZvuoUVQmAhmsH59PnGdJFEkZh6W9?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR09MB6296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30552e10-e887-446a-65f8-08dd7685b852
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 10:11:25.1507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: intpBGNOOf2sE3LzbvjGPnbYDS/06uo+DDmMk8NU6QLhGuX2noPhDvfSBXYh8sd6cPL8xNQ+XZHeEiZQNgT75w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR09MB5605

We have a design where several I2C targets with different maximum speed cap=
ability=0A=
connected to the same I2C bus managed by one I2C master.=0A=
We want to communicate with each target with its speed. However there is no=
 way to=0A=
specify the bus speed for the I2C message.=0A=
=0A=
I want to propose the following solution:=0A=
=0A=
let's say there's master represented by /dev/i2c-0 with the configured spee=
d=0A=
1MHz (I2C_MAX_FAST_MODE_PLUS_FREQ) and most of the targets supports this sp=
eed,=0A=
but there's also a target capable of 400KHz (I2C_MAX_FAST_MODE_FREQ) at max=
.=0A=
=0A=
Create virtual I2C adapter (say, /dev/i2c-0-fast) that refers to the real I=
2C adapter while=0A=
have its bus speed set. Software talking with the 400KHz target will commun=
icate with the=0A=
/dev/i2c-0-fast. In its message transfer, it will ask real I2C adapter to c=
onfigure bus speed.=0A=
Regular communication can be continued using /dev/i2c-0. This design requir=
e no user-space=0A=
changes (only device name should be adjusted)=0A=
=0A=
Bus speed can be cached and hardware reconfigured only when needed=0A=
=0A=
Adapters handle i2c_timings in an adapter-specific manner, so I want to imp=
lement this as=0A=
a modification to the particular I2C adapter (designware), providing OF bin=
dings for the=0A=
sub-device=0A=
=0A=
Does it looks like right direction for development? Any other ideas?=

