Return-Path: <linux-i2c+bounces-13974-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA7AC38D56
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 03:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A30D3B7C82
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 02:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74D923D291;
	Thu,  6 Nov 2025 02:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b="FF4JXB4v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazolkn19011031.outbound.protection.outlook.com [52.103.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C809D23BD06
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 02:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762395305; cv=fail; b=oWFUYAYppqvDplp3U0p0glcBWBMt0kIf45R10u4NIwmQOIAVpTEz8zzsBguOA3yhHX3CXzQX54LAswG4gYYMu4y8/bbiBVSuryGsPllmwSozbKOvtjh6KQKvlufoOHp3PwNNElDDju5rMZQizIrtFfIUTYiP+2qkrVFrLQNwS8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762395305; c=relaxed/simple;
	bh=n689lKVJ6q0Pv6oKEtX2wPgQgOuHgRxtKgAycR8MZ9U=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uoZtfSqObzXOPuXnN2Z4Lj8wJmSolGpry/qLLx9jJ0gAouldKJ2xYSCUNQ6DvRQvwgtxfUh5G0DTaMvVuRautgVoFRkId+ydujR70BKBEXiZ1Q3TIr1FoUmSHbfVwcWsQDx9rwe7oZm2GKHiQA8LDi1DXRbGyOeMtIotznrLdP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=outlook.com.au; dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b=FF4JXB4v; arc=fail smtp.client-ip=52.103.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com.au
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9ivyOGMbodbIo5pYbR6j7XlmI2oxDQlw+zor8fSRgRCUXvc9BorM3m2WSOXWJuP+AfHdbjv6lI8DaOa/Y8/abUVYacl+CF9y5EL8Z2eJbhZysYHn6y9j/MWAnBKV2KlFstKGmVhfgS82qbWJW+BF4D8VVVFVf0pQiTBPdIIreOPhXVTUxAztJ2juGMnwESuMoyX604X0IQjgvC+yOJzw5t+co4mKzm4OcJtls+JmWwewq/INg0Vtr0WlnSAJRXRJE90+pdcwATsLJOYgvHS+C1Lsee2msFXAxMI2/e8+Kpm+upBuPl4o1XsOqd+uxvg3sQ+8S5KXyyR55/S2DC+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUNbS4/0eh1vcTSbPg7VDM4cVaQg9eAMXZ9oLBwREz4=;
 b=ZPoo+MSTLqdiRawkZMpo8cU2T8EewzhGsqLStKp8DQjTedjiPnqAh61/N0DMZDJgKnTudIYtVv64cGohgmbBqFOwRqYmjXD6IQLjrhoADkQKuRqQy0AR7ykmY0UZ00lLjuRoYrhcFp5QRnIbmJpWobkpv/l9pJa9492IoAE1651CZPU3VFY4J8xWwl/ZxY18uHmi/c5kulYrIg69Yd0EfZErQAT/M4TgAxY//cXEuE9YUEzMpmywe2j5uR07wb/CMgQGeWoDK0JNdioB7Y3IO4HZz4wosFL/KejRrU3Hmo8FcrouAYgtYdLmxeDd76Y6a1URckL5C7lmKVAbhQUUUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.COM.AU;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUNbS4/0eh1vcTSbPg7VDM4cVaQg9eAMXZ9oLBwREz4=;
 b=FF4JXB4voXcOxFpyQHB80NIU5Eo1/RdBKJyN9j1RmxMRzJ96/lrGaNR1M2nxm7JXRhTLnRlVW7KpzAypOoPFOqOzjn38pzaaBSI/lQ9S18z5+ScVWERJn8A3lM3ltNGFpGpPE8T7bJXByh4TRj3MHwmrudqc0RA3T7Up3pgnnn+0oS6w+FVRJV6XAIM6P1Zjnt+TeBGWo0yMQcnoLEscRSDyiEUi1iQWIpDq9cu5LGmM+M6+nZCBDNm6PKH9Tb7PYP/KuW/YZgRA7xBfc0hf+KjmkNjnklb9KuBLG6drQSCKJM9AfL0M4gjQ7+8wx8qUEpjYIFHZx2qAEUErOOPPmA==
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com (2603:10c6:10:59::12)
 by SY3PPF8E5E02F08.ausprd01.prod.outlook.com (2603:10c6:18::422) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 02:14:58 +0000
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b]) by SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b%7]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 02:14:58 +0000
From: Stephen Horvath <s.horvath@outlook.com.au>
To: Jean Delvare <jdelvare@suse.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Kamil Aronowski
	<kamil.aronowski@3mdeb.com>, Stephen Horvath <s.horvath@outlook.com.au>
Subject: [PATCH v2 0/6] decode-dimms: Implement DDR5 decoding
Thread-Topic: [PATCH v2 0/6] decode-dimms: Implement DDR5 decoding
Thread-Index: AQHcTsMm4JZxh6aSG06ImgPUz5UiLQ==
Date: Thu, 6 Nov 2025 02:14:57 +0000
Message-ID: <20251106021356.208986-1-s.horvath@outlook.com.au>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYBPR01MB4586:EE_|SY3PPF8E5E02F08:EE_
x-ms-office365-filtering-correlation-id: 7336b597-cbf4-4ab8-c287-08de1cda489b
x-microsoft-antispam:
 BCL:0;ARA:14566002|12121999013|19110799012|8062599012|8060799015|15080799012|461199028|31061999003|38102599003|40105399003|3412199025|440099028|102099032|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7l8WCqI6RFeKuBHXXwkEfaSghq2NUnFeL4aCsazj5ZoWCO2+6g/3zinsDt?=
 =?iso-8859-1?Q?a0iwAOFq02DYWoDuI+Nd8uCfsSLuH5AkCdFOjeXQj8YcawaTfIyomETUsE?=
 =?iso-8859-1?Q?Eeb3A+TiUks+hlvh7VZTi6l/Sds66bSKKbRRMtfiy04GIQzowkkVRrp9M0?=
 =?iso-8859-1?Q?Doa8X5dR4YCiqQpFXE2FdAcXr0+fJRQSoLoGdflWWNbT6FKryMP2I5mAJS?=
 =?iso-8859-1?Q?UmtwFoA0p5/7xHFcewuwppjZGJextfYK6BfhvxKJ1ZFXXGrUxGIDTNjdCp?=
 =?iso-8859-1?Q?1gDJF/TXpxVQJRl7zTMxLgG2a46EwBnxuQHVVxtvZ4DycsezPFoxUukSm2?=
 =?iso-8859-1?Q?8sdUCZGaFsQ64Piplh7+GAExiSWQikXsq9cPLpstKdECKf/p7LpgiBxwaS?=
 =?iso-8859-1?Q?IF8H7wJrKmHasE+DBj+cEzY+CSJQtT028FNH2ddvjlCBiNeM/NcVGWPW+b?=
 =?iso-8859-1?Q?wFbTdjF3VFOaZpCu96G4PET1GivwDxbBEK7mGykxDhk4PsqW8kF3KwUqLU?=
 =?iso-8859-1?Q?IkS421YZQ+gOAtpgHdAZYwPHs9xmRJCCzxcnnmzGMwl3diS1KPRWp6tLZN?=
 =?iso-8859-1?Q?zOLASmSkQRSua2IUQnODh5S1F7gYH55/+2mj9Jn0JsC+7r+Bac8+ktK9Mc?=
 =?iso-8859-1?Q?7AgdBXvjuuxSVxFlJh54CFk7GOAWhTUzcZRLvyVY2T3k2Z+qJIIpZOYC9R?=
 =?iso-8859-1?Q?n+gCTiuY3fLcBcoizuszrdH2geZ0SnGSk6DKFX18a8RVvJ8i+/JHs45zhy?=
 =?iso-8859-1?Q?c/FRbzsnbnXrWWQhNiiyllVT/7aFr6K4qkFiKwPrBzqUwqLmSiJ7BUHqXu?=
 =?iso-8859-1?Q?hS9oxDi3zsRXn3AEdBlv27wKwLn8abkiVH/kHEk64/W/NBqjX23vSpo7Mm?=
 =?iso-8859-1?Q?YZuM5mgJrWtOM/tY0QTv1r8iNkIg48zB80mTJxQpbbiHoBTD5Phm5GEo6t?=
 =?iso-8859-1?Q?urm5CEQPdLXAg2PJIvaQcO/uwTMl4IKbupxeGZK+goCXj0n55ZY8LA29Ay?=
 =?iso-8859-1?Q?jQ0smzAEhGf0s+MH6di0sEMNs3Bi9BdEBOjisfp7yzeGYQhrKaIrq/3lYI?=
 =?iso-8859-1?Q?LXPP/9hB0gT1eXLvdtGU+Tlk5ibAlnjK9eHGxY+ckVCHrMjqcOXg2Prsfl?=
 =?iso-8859-1?Q?xep8Gsi2ZBKgUgZfRJhm3cAelrjJSuIO1ZVrfy7+nnPkQEY7yJ9ADqRViJ?=
 =?iso-8859-1?Q?tMOSUPCigzyfI7g7kc0PpKcNpn99hF9OuUUqGD3Akk2RqP+3GloP8YIVN1?=
 =?iso-8859-1?Q?d3zLMmu6PeETjJpXo3IXeO7bXEQ3cPIlhDlPD+Rks=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rrdDQ7D7ScD0pK8NK4gXuO91JQNZfG9rPXX6ONOu+6qrFV0sNkoFIrg6BW?=
 =?iso-8859-1?Q?ClEUq3n2SqJUDUzVh2zusMXmbv2RAg4BJzWA9C/DmcwwkMSjIlTqNqLTqH?=
 =?iso-8859-1?Q?NuSYy9dXxnaD2AkYaHQ7lBA6QoMmDaqNYr6KI+s/uTyvDpH0qRyRGaU/rL?=
 =?iso-8859-1?Q?H5RBN8Jd0DYCJR2/MD0G1fpjL/34HkseTR2399QfbdcB8SK7wkFoS/Buf6?=
 =?iso-8859-1?Q?wOsqu193A6VsmBo3iKcGeGrz4uVg+ZYqvd7P5Y4tSlpzh8uJldos3oSWHr?=
 =?iso-8859-1?Q?AGXbamoV2pICBrzu62WGpSrd429jRDi+tCZbb8dWMuf5jNSzWbglIhFzJd?=
 =?iso-8859-1?Q?Ibx5DJw2XBBwh+Ed7VA7ZkIPEF+11RgjKjO1k+LCSCbw8EfT2PudXS/QQu?=
 =?iso-8859-1?Q?ZcyhemBSjQW7h4sV5WVOQa3mstJywPxXLCvrzX7zORFEcWlmToArap5/q5?=
 =?iso-8859-1?Q?MyV0b3F9Uizywy8Awjfbah2yP2kQg9H0ExlWkPae4GF464rT65lUH9esZ3?=
 =?iso-8859-1?Q?3i0H+2uHm4BQtcbfCIFAx6rmkNvcH+XceC8az58UT0VGTwyL5OZlTBmDOv?=
 =?iso-8859-1?Q?V/VRS5NLgl0dUqUC37pL9oDtc8/6Y0SsIO2XvafKS55wXb3+jOf3/bIwxO?=
 =?iso-8859-1?Q?tslwG7cEdbI9BjFK7yBHtG5Cznmn6gYOUoofl+1zJ3Bp32yRrvQ9ntTr25?=
 =?iso-8859-1?Q?DXjSoMKCF6s6JJfGiTJ/99O8LjnnRUcoEVy6o23oJnuVid2KUAPvocwT+g?=
 =?iso-8859-1?Q?8CeJIHwKPiSkT1LUhplrYmMYqbROWopfF3rRp9sLbaaPSGqFyT1ZNHFk2p?=
 =?iso-8859-1?Q?OD+o3aEi4+F9ddfvTmLrz+avUTpND6CHU1Y7Pk5AqvTIvukZBhiJW8vx5q?=
 =?iso-8859-1?Q?6eCMk8qNQVvn5rxoWqwWJPVVeATrkuoc8eaaH2GKC6InQSfV9+IgBNJDoS?=
 =?iso-8859-1?Q?ajZ/rlTaX5v5mmNcN/q6tnt0LVEYG4jljqXK15uA0um1rqxc1ha/xkbusM?=
 =?iso-8859-1?Q?4O39EUwZxopRUokO5tvheEBIuhX9IhpkOMU8ubWL1AXcfQhElqk6kqLwMH?=
 =?iso-8859-1?Q?EVkUuyPPK3q5/Nnh4buVzGrPcqEYNn9RSRGK/s2if21+ekhutx2w3z3wkB?=
 =?iso-8859-1?Q?geadryJhqKUEJPU8nR7ihfBfCIIUVlMBZwiBhR8sdSnLVKoXrDZJl/SpWH?=
 =?iso-8859-1?Q?vXIVslVRA4jtcXaAmSwR+EpG3IVdiKrhy8EodQmDPqYj+epBht8bK/Yl/9?=
 =?iso-8859-1?Q?RVfg0iJANVsQUmNUQqaCy6tCAEiaKUAMKR8J52Lcc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9115-0-msonline-outlook-64061.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB4586.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7336b597-cbf4-4ab8-c287-08de1cda489b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 02:14:57.9665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PPF8E5E02F08

Hi, this series of patches adds DDR5 support to decode-dimms.=0A=
=0A=
I'm not too experienced with perl or the JEDEC specs, so there's=0A=
probably going to be some questionable choices here, but I'd love to=0A=
hear feedback.=0A=
=0A=
The first 4 patches (1, 2, 3, 4) add the essential information to=0A=
decode-dimms.=0A=
=0A=
The next 2 patches (5, 6) haven't been tested on hardware=0A=
implementations so I'm happy for them to be dropped if they're not=0A=
useful.=0A=
=0A=
V2 has been rebased onto master, and patch 1 has been updated to check=0A=
byte 2 for DDR5 identification, not just byte 0, and the commit=0A=
messages have been made more formal.=0A=
=0A=
Cc: Guenter Roeck <linux@roeck-us.net>=0A=
Cc: Kamil Aronowski <kamil.aronowski@3mdeb.com>=0A=
Signed-off-by: Stephen Horvath <s.horvath@outlook.com.au>=0A=
---=0A=
Stephen Horvath (6):=0A=
  decode-dimms: Implement DDR5 checksum parsing=0A=
  decode-dimms: Decode DDR5 Manufacturer Data=0A=
  decode-dimms: Decode timings and other data for DDR5=0A=
  decode-dimms: Decode DDR5 common module information=0A=
  decode-dimms: Add basic decoding of type specific information for DDR5=0A=
  decode-dimms: Decode DDR5 error log=0A=
=0A=
 eeprom/decode-dimms | 519 +++++++++++++++++++++++++++++++++++++++++++-=0A=
 1 file changed, 515 insertions(+), 4 deletions(-)=0A=
=0A=
-- =0A=
2.51.0=0A=
=0A=

