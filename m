Return-Path: <linux-i2c+bounces-12534-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A31DB3D905
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 07:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAE1C1715C2
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 05:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618761F2BA4;
	Mon,  1 Sep 2025 05:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TWKk/PNQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F927450;
	Mon,  1 Sep 2025 05:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756705709; cv=fail; b=mpP+VmxhpKd2iAUb6fLU8bAkmypQCC2/S7n+j1UqSMmfn4oWGbaKxUqF0W1WPySB2cn5HTLK0In1MHBTBNMsYikCIPEOQSEzim5AI260NaRj6elbBTNxX+lSRyIQZjTbEdgom+MjKG6KoOW+cFB3oUd3/adwhqcGHRIGDmtQp1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756705709; c=relaxed/simple;
	bh=XuI9THPSKfNmKns4vXgGsk55n6bSwgNtutieJWJwK6M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CHqiL/YHu6VTLub7gg9WUzPYM7u49Id+eDdM4eG8gYJLkNiZd6ANiiQIeop0pS0jxVwSUYdXwQmSMfpyeQPquTujxcx8CZkWMhnenTwMPdKYolojT/buGbxeDNVNHQzpGyPsRpqae4vOjOFvjtBrKFgMQ0cI56V/0D+cMhg2J+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TWKk/PNQ; arc=fail smtp.client-ip=40.107.244.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1M3V8sFZ7hz/+LeAVBJdtvQOJxFbVwzgO4Q3YKT0caLKhLVcHjMXuzik1No/0kuFV9f/xSrSZc+83FqNrJK4cgyJokHuzfkQRrcegwmXrA39zn3AHyrq1rLkTJN0NnuL54xGXBJmokWcs/eZrmqDq420u3mAAdKgQe84sII0DWRY3EDJXQc4x9ajPhhYzf6+uAb1NMWjt1C1TUKRId+PGi18MGzmqa1jnP1DWTOAhMr/hLTtZ7jYFpTtGTyDQxf4HP6sUlcO9clVHXwbvIlDWgKKmlYETLGWUjgOhsKMwyrypCeI8fHhENoD6kq354uBltRuXUrJNmAW+gEtD02xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSvRDpm91IKF/28zcJ9sPZA5xYpn+C0BSV4Zy2cQhL8=;
 b=QJ/eAd/ldNPsPqeWHqVO0Uu5IUhXUml86DDromCJyMDRxk2jgA5clMHJGISyONt2Xs8ap1ln4TCFldeBYWSwMXRKZDTnKiv8PHYEdubZsh4Fje8SzRZqK5JGmgnLEpECt8LY97DYH5/cuvFKIzyBDJrRa7twfkqxdb5YUpn7i9S0k9LIILHsNk6XPJV0cd+1McRMS0P9NoEhPmz5qpG/3B3Eq0ZTqUWtVQkENlSj3HFYfOdgwTRWCeGoNhyoyIzlQ6SazMZcaqCbki1Dp/P/1R8RkatC9oXJQhSOnYFXm0tpkcEFnc6lSbbffBWkFL7dYPF/WvypT6uaG+ZxYZaVfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSvRDpm91IKF/28zcJ9sPZA5xYpn+C0BSV4Zy2cQhL8=;
 b=TWKk/PNQyomttoE7oUNG0trezdIz3fTfsLTPM7Y3+6x8wdIRto+1/8eGW9oS8rgnQOWRixyMhw4R2NjeAuBBp44T5ha7c65QsjXtMYW3+BO2k16foYE76fc8J1hf2aUl86qnHttwc5JL+Kg3ZaO4ZVstlg5jNPgLEIfr+W9ZkFA=
Received: from DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) by
 CH3PR12MB9284.namprd12.prod.outlook.com (2603:10b6:610:1c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.25; Mon, 1 Sep
 2025 05:48:20 +0000
Received: from DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1]) by DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1%7]) with mapi id 15.20.9052.024; Mon, 1 Sep 2025
 05:48:20 +0000
From: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>, "git (AMD-Xilinx)"
	<git@amd.com>, "Simek, Michal" <michal.simek@amd.com>, "peda@axentia.se"
	<peda@axentia.se>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
CC: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>, "Goud, Srinivas"
	<srinivas.goud@amd.com>, "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
	"manion05gk@gmail.com" <manion05gk@gmail.com>
Subject: RE: [PATCH V2] PCA9541: Use I2C adapter timeout value for arbitration
 timeout
Thread-Topic: [PATCH V2] PCA9541: Use I2C adapter timeout value for
 arbitration timeout
Thread-Index: AQHcAhp3t2YH4xycU0aN8EdvSUsR77R+A0sA
Date: Mon, 1 Sep 2025 05:48:20 +0000
Message-ID:
 <DM4PR12MB610936CBF0B76A9402FD63D98C07A@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250731125535.22598-1-manikanta.guntupalli@amd.com>
In-Reply-To: <20250731125535.22598-1-manikanta.guntupalli@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-01T05:47:50.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6109:EE_|CH3PR12MB9284:EE_
x-ms-office365-filtering-correlation-id: f997fa00-0e61-46f1-c9aa-08dde91b283a
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9NfdVrd2vcYyGB8BYmNbzT9+rT1p4/rH/6dqzBInv/xK+QsZFUg+J/cu5ywu?=
 =?us-ascii?Q?CfUDKJudrAAnkO3F47jIsiOiJWO/JdfXM3t5+L5l7/47Z0Vq3aWLotrakufS?=
 =?us-ascii?Q?6numeZYuM8I/gj5L3Q/0FttygJciTwClULVbWXTfdAL9Ujmdu9Y3E8uU7KKX?=
 =?us-ascii?Q?Zqo90vRyWd75gEVK1cK3WH03wDhiEPps+3ARwgDJJvTK72X7iwmWaTq0/tC6?=
 =?us-ascii?Q?rkZz894ZcZuuZ1H6SUrFThgD5lUZa7jI4Tc5z90q/DIkecP8j6ZQSimwLJU0?=
 =?us-ascii?Q?S46l40yeinUXRV6bIKK4z6ABQqBFX/aA24F6ezWtYfugcpdKxhMt4GhayONN?=
 =?us-ascii?Q?z6UTO9FZqx8pem1afbWXeZqQGmUHy8Dz/1Y21jJh58QiGfr2LXtsZd3AwNtN?=
 =?us-ascii?Q?pmvIHhflgCxhtfG4naV2lGcr54mc2ZgBnHwLayieXvMBAKiRoedp04ptDT26?=
 =?us-ascii?Q?Ll+r6KLmc57r3efrEeaEK4PWQ3yIg2C4vam9ASy0H1SfLz/c/d/PwAGe0Rvo?=
 =?us-ascii?Q?YqiGYDheQnEJWQkcCD2etmhN2g4/1FmrODdsIVICRpj+pJ/Io8zCoEk0glpD?=
 =?us-ascii?Q?kKXw95/UsPnhzRalU7R2PNxhabiv3DO8F/h/wNdG5CVtWV2Q22baT1iNgWfu?=
 =?us-ascii?Q?n9JmeNgzPm09xWkLRgf2JrTw4H+fuVtKdmCDrC8xfKwdIbBR1Mwu6faV8wUX?=
 =?us-ascii?Q?wMFxscYGa/pn7XzaIQHqg/jQZ62MHy23cSWI9zQqGsaqksv69zv2q/N4fwou?=
 =?us-ascii?Q?47O2zQZPgi+Q4Pw02JFxbXzii9wwDD48sKfIo7W2uW5KLBQPNLPMGL0pmkNu?=
 =?us-ascii?Q?ahDJgFLlhgwrWOrxPPWDqmRMsz+nzNVZoOIB+VEIFF+TNBgYBsKl43YT++F2?=
 =?us-ascii?Q?8Q/5Mp5MaBV5/FQlQpKf2K2bNLtF/bmrtwmc+KrdY8TI0XQe8AHgTm4SAehc?=
 =?us-ascii?Q?KefJzL+2U44RjLiMaApOc3xETYsxjMggY79YJvfQcWILJVR5wtvZpOMnzUlw?=
 =?us-ascii?Q?WDYWbPcPMJU4V57amd0Gi3hGH6uVo5B1Bxh2vAtELFpDn0hxzoA4AHeH5KKa?=
 =?us-ascii?Q?0EQ+XXK7bLq9knd6x6RmwFBuP3LW69qZbyEj6isuYAyzkiwHemeprK4aAGjy?=
 =?us-ascii?Q?k2NJtKc+w3/xQYrv3eup2voldeaq2xmqxiFedVpfVD5d3aMAAg8D2RMtKH40?=
 =?us-ascii?Q?dDhStdhf6dexQtIfrKR0DV0kygEzsA0vSgy8TMtZscyrNEGRyRlFPT6u62Pr?=
 =?us-ascii?Q?oqgojhZ/dPhMY5EyBFtCT7jkaj6KeQgb0p/WPurjIychEXrBNVNl9XMGwE4/?=
 =?us-ascii?Q?2oTx384ZrC2v/GWh6h8hCyhwBnQ4rICwP/KvyPB45G55zFdPMb0v2nC1RTJe?=
 =?us-ascii?Q?cPZ4K4qgmR2ThsGhWosomWZOqib+gAg8KTRIHD8gOqU1e9fmAiQ/6/9ag8g8?=
 =?us-ascii?Q?Vpmye+pQSK9/sVca1O7fCD4xbJtuOpZLJINkOOWq9pUs9UcfxBNVpRfTN4a/?=
 =?us-ascii?Q?BWqcpxVwPUU5i2o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?x327bTSkCbE+JLMWIx8FLUaWV3nsOlcN322aBMUCqCN47ICECArXdBeatlCH?=
 =?us-ascii?Q?MnAZXF9oLN4WE2x630A5pFtI5m02+OIiT3g2mLBpcQBbVmkfGtBIuhSKxYB1?=
 =?us-ascii?Q?UCJzZTHBIO7vpw1ApFdWcTMYuClnl6EUxEoT0unQW8sXJusJxQSLiGS/sI/1?=
 =?us-ascii?Q?WxdSMXNKdAi2RI6eP2Ep+k3ibUSCUGfVVdabB2HX7UPmV02thwsLRUt9oo7U?=
 =?us-ascii?Q?oo2fVesEisdQHAtmaNg+nEfLW89vltj6T+Cghqpp0o0bmnB9lGmIjdwOz8MF?=
 =?us-ascii?Q?Jqv8r3dEfTgZE3qs0LBUJ1FKmbBHIR19YGXjoa8Pnyc3gY2BClVDq7FPQ/0c?=
 =?us-ascii?Q?DqZ8uq66YF9lKKqxpezjTEC5zRjOMwd5zcavXcTbvUNhu9Ju7x5EePSeyUIl?=
 =?us-ascii?Q?5hi5IyC2GrqwUh6vvMKTmWeW04M7Wo0YgWVAI25P/YBEJGqf8mVND4azJ6au?=
 =?us-ascii?Q?aycNTMaDR2BxlC0m0NYEGcx2o7nvnmdC47XhVbLqoP77YNwlKq8zWmfZIbkm?=
 =?us-ascii?Q?GIbGXsPD4MYmiRqL3h8f24eZFxUB9RKgSv9dElK1368fDZxR+/FmmV/rQ48h?=
 =?us-ascii?Q?orLyp5/Coiph3QwnkxmPUBB5QqflKS0GG6ExnsGZd+H9cbM5Pq0c3uQ83L2b?=
 =?us-ascii?Q?dRoxErdAHOLA2qaafjyZe7EAXvAQaZAfBo7DpHEmnZKa8liBzSZdM31a15iN?=
 =?us-ascii?Q?XCTLyXskNnJ5g0SgYW+WACYuGDPdDDRkCnLu1M986v12K4h0RPH8r7tTp6E1?=
 =?us-ascii?Q?hwlVNcG9oocz/CchzipdjkzceNfpY7mxucC21h6chmynnnBwiO60A37gcNL4?=
 =?us-ascii?Q?Xd9IxPyqFF5WdlDYsDLXjjsReuJniu8Xfiqc17a+lHMlVMgatS/8sXlueq6P?=
 =?us-ascii?Q?ijdyucXI/lw9rJQNm+ixJW58hEEEl1cgaFOCrTG0SI82Op/fHFbQMC+CeiOo?=
 =?us-ascii?Q?me+/eq1iO+o4RxuOvWjsjzOTmN8OME6ygiuv2MMp/DCsMZq4beZjkerbJsWY?=
 =?us-ascii?Q?R6dgWAUD9QXYa3xBH+JtUW/SK3QU0ntHpSICeIylGiX6kafsd4tZWXO0peKn?=
 =?us-ascii?Q?WU7rZwHga4t+xPBoo34Pn/YcCRtvaaGA5IG3ICsetx25PFgRNPUrMQ8FKoDq?=
 =?us-ascii?Q?O0Vfzm4TT2eyFnhgHkbvD73qxnrkExyZ3iIeB4tgo/ak3Bzvh5TNnbACWtm7?=
 =?us-ascii?Q?cP8zfE1rYIasEYZv8vki0a3O0zUqrc5R1g+0tqS08C4lCVx4Tx2trs9VS7x9?=
 =?us-ascii?Q?QUJd+qCK5YQYSWydvW8wMAAPLuIkZVFm9pDTIY4fFxySOLNZsfu+UVjn4Wmb?=
 =?us-ascii?Q?wEU5/dKFflS8vlPo4+IZ3878J2K0HCNlc3if0wyKEKzeZFgHIpfnHZpH2qSB?=
 =?us-ascii?Q?QdCy5OsA7F7Lko57P+Sx1zwkXCSiYrs5o0KedlfKAWw02NAfChUqHtpxDu6s?=
 =?us-ascii?Q?OtJZw8n9iWfSNC4YBiQMAnseXhDA2WoW1mG5h7yZt2IG3Kb61NxU5jjO1M/b?=
 =?us-ascii?Q?k9EnS2pfnxUYGDKs6q1p89jCf7Hz5TnUQHLw9/3kM/H31Y1zV59GxMRs8Bbh?=
 =?us-ascii?Q?htfbCZOLkX1X3+hHRIo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f997fa00-0e61-46f1-c9aa-08dde91b283a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 05:48:20.4496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aP+j9ryDTifNyY6HB4dah1Bh4tiq9Rkcb1t9qz+HHm8+D81AIxUT8gULaFVFZP19szyTIYYPPhEb7C2MbxkDMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9284

[Public]

Ping!

> -----Original Message-----
> From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Sent: Thursday, July 31, 2025 6:26 PM
> To: git (AMD-Xilinx) <git@amd.com>; Simek, Michal <michal.simek@amd.com>;
> peda@axentia.se; linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org;
> wsa+renesas@sang-engineering.com
> Cc: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>; Goud, Srinivas
> <srinivas.goud@amd.com>; Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>=
;
> manion05gk@gmail.com; Guntupalli, Manikanta <manikanta.guntupalli@amd.com=
>
> Subject: [PATCH V2] PCA9541: Use I2C adapter timeout value for arbitratio=
n
> timeout
>
> Remove existing arbitration timeout macros and use I2C adapter timeout
> value for arbitration timeout and forceful bus ownership.
>
> I2C adapter timeout can be configurable from user space, so using it
> for arbitration timeout helps in configuring the arbitration timeout
> from user space depending on the use case.
>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> ---
> Changes for V2:
> Remove existing arbitration timeout macros and use i2c adapter timeout
> value.
> Change logging and commit details.
> Link for V1: https://lore.kernel.org/all/20250711124503.3390451-1-
> manikanta.guntupalli@amd.com/
> ---
>  drivers/i2c/muxes/i2c-mux-pca9541.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-=
mux-
> pca9541.c
> index 8663c8a7c269..3d8002caf703 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> @@ -63,10 +63,6 @@
>  #define mybus(x)     (!((x) & MYBUS) || ((x) & MYBUS) =3D=3D MYBUS)
>  #define busoff(x)    (!((x) & BUSON) || ((x) & BUSON) =3D=3D BUSON)
>
> -/* arbitration timeouts, in jiffies */
> -#define ARB_TIMEOUT  (HZ / 8)        /* 125 ms until forcing bus ownersh=
ip */
> -#define ARB2_TIMEOUT (HZ / 4)        /* 250 ms until acquisition failure=
 */
> -
>  /* arbitration retry delays, in us */
>  #define SELECT_DELAY_SHORT   50
>  #define SELECT_DELAY_LONG    1000
> @@ -229,6 +225,9 @@ static int pca9541_arbitrate(struct i2c_client *clien=
t)
>                */
>               data->select_timeout =3D SELECT_DELAY_LONG;
>               if (time_is_before_eq_jiffies(data->arb_timeout)) {
> +                     dev_warn(&client->dev,
> +                              "Arbitration timeout on I2C bus, forcing b=
us
> ownership\n");
> +
>                       /* Time is up, take the bus and reset it. */
>                       pca9541_reg_write(client,
>                                         PCA9541_CONTROL,
> @@ -251,10 +250,10 @@ static int pca9541_select_chan(struct i2c_mux_core
> *muxc, u32 chan)
>       struct pca9541 *data =3D i2c_mux_priv(muxc);
>       struct i2c_client *client =3D data->client;
>       int ret;
> -     unsigned long timeout =3D jiffies + ARB2_TIMEOUT;
> +     unsigned long timeout =3D jiffies + (2 * client->adapter->timeout);
>               /* give up after this time */
>
> -     data->arb_timeout =3D jiffies + ARB_TIMEOUT;
> +     data->arb_timeout =3D jiffies + client->adapter->timeout;
>               /* force bus ownership after this time */
>
>       do {
> @@ -267,6 +266,7 @@ static int pca9541_select_chan(struct i2c_mux_core *m=
uxc,
> u32 chan)
>               else
>                       msleep(data->select_timeout / 1000);
>       } while (time_is_after_eq_jiffies(timeout));
> +     dev_warn(&client->dev, "Failed to acquire I2C bus, timed out\n");
>
>       return -ETIMEDOUT;
>  }
> --
> 2.34.1

Thanks,
Manikanta.

