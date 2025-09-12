Return-Path: <linux-i2c+bounces-12900-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C28A5B5435D
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 08:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 736F2441A49
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 06:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBFB28CF50;
	Fri, 12 Sep 2025 06:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Xira0uXJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D5025A322;
	Fri, 12 Sep 2025 06:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757660147; cv=fail; b=Wru4hN3N4JxDwCaJ+F4AqkNQMCiXOuIUUt86urkwI5TsaY0Kzs2BAwCWtrcN6IcJXL7C3GPeoQ67bFZ+r2n+9elUgsH5fN4ibvmpNBqDaFwqw/NMccrhsPGkS8tdjjn8Rj4srmK1baj092sylIBcPpNsWIaBowIFb6LJeO296Fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757660147; c=relaxed/simple;
	bh=NhFs67B8tdVZAZZokE1PAvsMqFYcnaw0upLXfbdyAk8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=obPFJU4hgUUsxgT9lr/erfbGpP1k1xuuFYF4FdB5+KE2qkwF2hSO6BDan2fj/Q9ThxrHs6rY4/si9oc9UNzPlJGvNQvj1XMbvwzNaYczdZenx2pLgrcI2Euh9qhlvA0hd9zoIWbE+TS1uWMVElfV64jaYz6cuhuSSTQeDIBAPIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Xira0uXJ; arc=fail smtp.client-ip=40.107.93.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNxUdTEjZcEZ2GFlShMcPFqC8K26D9aXb6Ug0wy36DgeRTuffnt7iAd2otcqlC1WZBpNwl6LNbrEaVaWJ65ebNkwoMc9O/AkYTutnyKiFb4vuHbetNfZ2RWC7N2RrYx/27IDN8UjC8h82EvDdduCT88+BakrVgafk2QdDXkZkmXcoeZ88SAA3P3aS5jfBxsG1BCFgmFj0yJZOkgwcB5k9jL3DJqiGEkR3HJ8ghtK8vh1DJHu812ju+c18qxIDHU971ba6T4CiDKqOC6fYka4XUFHYblH2Zd4kO9s2l3oEolvjlhsg2fNqvMXDJ4s/3OjJVOLcKLwz5orrt65DoEaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cmdo9lKBGDbWYhS7dnxrCwlETcLzmm1n3e9gbdx26Y4=;
 b=k4fhaEvD6/e1Z/pOTQzmLg7pMiKJ15dpEUHvH8qMIvkYn//IqWB0QAyG8CHTqCNf5tN2K+IoO2ci8gsKSpTpjwnjKVRkMboRnUQdiIDsSq2oq7BNinsLZuKfxr27A32Y/mfRg5EnGOBR/I/mCJbxhw9dNeisvO0e+hM32gXQnKi5excG6pDZnsyVwY9dxqDnGLaeztf2q+aLK8++MgQwrjVVfi2+UsmMRHXfAYV0f03U9zhof9i7iWzajjkDNp/BbiA+uxUQB9+W8E2i7HSzk2YnAVrbbG+znwMUKESI9rtmXvYrGmXdgEozeFVNcUfwdQ+uL2Fr6rYyI9ZvvuoCiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cmdo9lKBGDbWYhS7dnxrCwlETcLzmm1n3e9gbdx26Y4=;
 b=Xira0uXJVuci+jr/Ohnt1TxNuUdGL0bIjD3FEG1NB5Rq6GaCM1WHYLi7peLHJV7MgtSp3MmjAuGh4eXAhERavXHr7J+usqYz6nwsKr3qq0isUTc0QZwC1afrAVPGJPmGPk86PaxxPGmnXxX4Q2CLVikSWO2uLnUYOG5ZtWuoBzs=
Received: from DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) by
 SN7PR12MB7372.namprd12.prod.outlook.com (2603:10b6:806:29b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 06:55:41 +0000
Received: from DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1]) by DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1%4]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 06:55:41 +0000
From: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To: "git (AMD-Xilinx)" <git@amd.com>, "Simek, Michal" <michal.simek@amd.com>,
	"peda@axentia.se" <peda@axentia.se>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>
CC: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>, "Goud, Srinivas"
	<srinivas.goud@amd.com>, "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
	"manion05gk@gmail.com" <manion05gk@gmail.com>
Subject: RE: [PATCH V2] PCA9541: Use I2C adapter timeout value for arbitration
 timeout
Thread-Topic: [PATCH V2] PCA9541: Use I2C adapter timeout value for
 arbitration timeout
Thread-Index: AQHcAhp3t2YH4xycU0aN8EdvSUsR77R+A0sAgBFcwbA=
Date: Fri, 12 Sep 2025 06:55:41 +0000
Message-ID:
 <DM4PR12MB6109784A362751CEE8D472B78C08A@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250731125535.22598-1-manikanta.guntupalli@amd.com>
 <DM4PR12MB610936CBF0B76A9402FD63D98C07A@DM4PR12MB6109.namprd12.prod.outlook.com>
In-Reply-To:
 <DM4PR12MB610936CBF0B76A9402FD63D98C07A@DM4PR12MB6109.namprd12.prod.outlook.com>
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
x-ms-traffictypediagnostic: DM4PR12MB6109:EE_|SN7PR12MB7372:EE_
x-ms-office365-filtering-correlation-id: 9c129231-2779-40d1-732c-08ddf1c9635c
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?LJaaPJAcuzY4RPzH9qM2EwN3Ce2Qv5q+gSknJZVnLD5c5AYux+qucpFRmdTP?=
 =?us-ascii?Q?D3nXQkp4a8DvbDV6ZJqgL7BaQJnAHYsyXkTxo3B+kwkKI//fUZiU0GsWj8en?=
 =?us-ascii?Q?zpYH2M+cb3CbnT0i2Fwsmq+HwHbF6cNZAkPtXIPRHXEZJ6AF6EWS1DuJ9yzg?=
 =?us-ascii?Q?pTLg2x5zP3WCHP2hWwYDGpxerxUquQ2R16CXmCAnWCMKi3UhmyPApvq6CIbY?=
 =?us-ascii?Q?gPqfFnveqSuYtNa91Z+11NGWAMRymC5bTyBu4YTcb4WyxA/CsXchmAPTukY0?=
 =?us-ascii?Q?/FXBCH/cDNSrGatF3jkKLty2h1dUkTmxmcBxeK3Z5BgpnQx9NinofHutLaEh?=
 =?us-ascii?Q?6U8i7sPoH2Ab1ydjz/47Jds7zFQGMfUUnJFhGXXsqVc6+Ioz2uusbCFvLIMY?=
 =?us-ascii?Q?3mkQfjSLLQn1qDAPTJ7qoj7P5OjhVCFq//8qgwWM0e8jwQLXJxyESu/KIu3u?=
 =?us-ascii?Q?2zCjmCoGoo7XyVp10haHtMRYq0V5zvoVl10hn6FgQE7Mb1wea7D7V65uEBfU?=
 =?us-ascii?Q?7vhGgouQC6VZxyUV20pKKhy7BsM0qwbENrJwO1lCOSHYY99LbR2bfhhkDk0c?=
 =?us-ascii?Q?STl6hsgoO/veXus0bStMXPs2uDmvovzf0FKIM3XpEU7+vmSKMtjE0uYI3DgM?=
 =?us-ascii?Q?fNZQiPUa+/FEw+tXcJTtktSQNOl8gNAmPbBXNd04fLmqWxZYloL0A9HMjItz?=
 =?us-ascii?Q?mjE+IKuWJqdPDZjAX7icW1T3iuO9gZkAL3HDUIQ4Rj6xXN00MWdb06CfJRUJ?=
 =?us-ascii?Q?lNMqf4HCgwg7DlKtLFlJdo0bZhnZzOTpgBw44NXOeHwFwo51gCZT10yRN5T9?=
 =?us-ascii?Q?AE5jgLgxG1wYTRMAHEEZ9K6r/pAy8VNqSeqLKp5cP4ZpLwjB58x3iYgpCkxy?=
 =?us-ascii?Q?KYuJvrDTy8yQjgwafcbFR1mO+Tfl420hJ0+4tdG/SQKnHUD2mqVoHe28WaWG?=
 =?us-ascii?Q?SbWk4KAZ+kNySjUpMLtPDpsdgJP9B2zbfWBcy0rmnTbljLz9MnisOjtG9DD/?=
 =?us-ascii?Q?06reJT2PdGbaKWqAKcBZrNP84AGSH6MxxlW1hCW11E/HAs5J5OsOmc7bgHSt?=
 =?us-ascii?Q?/wjCPq18cdLX7SAZ4dnZyclyjkvb8wlDrMgsXX49Xehjyo5g6plzcKVKZqg9?=
 =?us-ascii?Q?8XHoFnbFsTK3ytRv/dFI4+Oy35909TCyQdn4UeScRtMLqs4fyw8IsG/q/DG3?=
 =?us-ascii?Q?jDoqnBGGwrsp9P2gwSpUPYnLnmAwAxQmxRAMuvkU/89ovkiAGfXtHktgmByb?=
 =?us-ascii?Q?gm55lkSfnAvNco/+9q7XlARp6IQaqRIpMYxX2+OHb+Eo78Y8sybVX+mzifW5?=
 =?us-ascii?Q?A4OustNde9LfCrL6Evf5uGWC+1awOjTbWeesOsfWxmuqJMhqi7psVDxrcxe5?=
 =?us-ascii?Q?PRQb00bDVQFZySUrph3G/0P5t3DCzkNeXwhPPNKD4vhLM3HSlW3ht/HnKnXS?=
 =?us-ascii?Q?ovFZpFsal7+c1ME4u0U5VTyQhcSGZcvdgIp8tjWvkc2/IgHTWW4ho3YwPoTC?=
 =?us-ascii?Q?BKDVu33/65RtOao=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qc12X3xV+C13hWmuxE6W3BdfKCNShPmPy0ndnAfA1W7/nC2uRpBdQ7fdd2X0?=
 =?us-ascii?Q?JEqoIuPhid2BR1jyz7mnh1jDx4CLLVFueN+Ica6UiE3qAzjaT4vcs7GP96Tl?=
 =?us-ascii?Q?pdlL+GPyF76Lw/Mj7n9VC0QEeWkOw9UdnZ1tvn+aAj3vFw05J2Pd/J+jb6Xi?=
 =?us-ascii?Q?UXODyvT2j1ugM0pR5hkBMa52Dfd/Tamq6zbrr2kfIxJbUS6XXbcsOuqqMHy1?=
 =?us-ascii?Q?8k7m0+peV/EI5mQGrbx61tJlLfARx0CNDTmFTFjhA1vCAGAggwRwxw5ERYGw?=
 =?us-ascii?Q?St0zH075092U1OnzSl+nDohj65BiAXtNpRC2HzSe85XZ3uw93YQSo8JuCHJ9?=
 =?us-ascii?Q?L6aetdoIcXIqaxoAyBpcPGrc2zMmko+FRL366mLTTkEM9a87EZDd4Du8/DKX?=
 =?us-ascii?Q?hEYZa6ubxuGkJ2ohfEzrg2/KHL0CXB2E/g9Ra7aKFovYIEG7FGS29g3pFiSQ?=
 =?us-ascii?Q?I3mQbsTeYhRo2Uc44W4Uegv6RwvTfxMovPgun1SSzsQ9sNM9ct0odnoWQiEB?=
 =?us-ascii?Q?1AmGSbxQrDu6m67Um9ZbgtKThUWyub0ktC3QkvAN8ViEaN8kEVqzmvm8v1Vm?=
 =?us-ascii?Q?ZxChKmedXPNrkZVY+xzbrKvq13K/in3ChODF+wuzXiqvHCAn/GkW8BIBZkCJ?=
 =?us-ascii?Q?gY7FHhPD9sExZ7w8iAp7oQ892aYCUmNG6cmY06/2M7Bgbj6M4WBFjRgMkBAi?=
 =?us-ascii?Q?dxYMkbEgFi7YCIGDRaOsP1pqtiB92zyH5J4D6GDorFDdyug/dCkVJ/Y5yHwS?=
 =?us-ascii?Q?3oFZldteB4yc6RI6qxEPajeJVBviWar++FSRY4kxvfHbBGDJurk7VPsqM1d2?=
 =?us-ascii?Q?fFNXm3mD4YckSJE7TklpAC4ufu/L3lrwIJlDE/tXsAd+io78Uu7P5qDeaEB1?=
 =?us-ascii?Q?7JZpgTMlTxpWsfAfYnqvyu54BIlk7K8nEX7RoI2LmhtIOHKv0saIfdQKVZb7?=
 =?us-ascii?Q?Zd218W00Nu4ygml52eQQhfut2DIuwfoxJlNVK7Ie+YTKAQgxWM7A+1V4DmvV?=
 =?us-ascii?Q?Vw3vLMGMRubLBZy18pGhRDzzEyy6nFz44a/AxdbIuVMIW7Q/y/0Ns8ICQo0K?=
 =?us-ascii?Q?2jhGhPzZ3KFpwtOoU4+4B/4iZqQF6sRK+VPUgZzEPnRf8H5LCy4p1oY/ayuQ?=
 =?us-ascii?Q?Mfqtddv8UFBNNDa1sEMq2I9CI/CPdNvUcq1fCyTLjShbAhQqJ4clPOfyw/bE?=
 =?us-ascii?Q?uGVliGT0nVd79SbS+FTddQNfnUCj6VdqCikDnY4o4Q4Wc75/lwDNs6OvnfBK?=
 =?us-ascii?Q?cJxbyslQPnWGO2DcRr+7SeOu5RwhaGx24Xn+C+xYvyt6kwGjhS4jLP2Cuc17?=
 =?us-ascii?Q?zeIjFMFJ9dPOqr9+ZVCzlkkRlkHYfreXpOsJJVbc1XCxlGprM51O7Nh6B3Z9?=
 =?us-ascii?Q?CwdPrSfN0i/cxC73b5qbiYYelKkZssxKm2l8Xt/oyvF9Iec1nz0tJZ0PUzvi?=
 =?us-ascii?Q?Sz0Vn0R3bJlZzS18LSB3QMSEYpzRDcEzdm4xaXq/xJwJMcXJF5EdbZNlZHBy?=
 =?us-ascii?Q?yBPtaTUIo0LxCxmt2leWBB+hsXnaC4S0tdbycqmvIcIGqT+J9zto5FDfRjXs?=
 =?us-ascii?Q?I1mZYnLi7SfAop1lL68=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c129231-2779-40d1-732c-08ddf1c9635c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2025 06:55:41.3990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C+OzNLkSVQSn1a1E1yar0LqxD3dIo+VBowyu+IP/kZv764jy3wqdzUxgKTKlk9ePqxe5RGCCi02epw3iqDErSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7372

[Public]

Ping!

> -----Original Message-----
> From: Guntupalli, Manikanta
> Sent: Monday, September 1, 2025 11:18 AM
> To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>; git (AMD-Xilinx)
> <git@amd.com>; Simek, Michal <michal.simek@amd.com>; peda@axentia.se;
> linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org; wsa+renesas@sang=
-
> engineering.com
> Cc: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>; Goud, Srinivas
> <srinivas.goud@amd.com>; Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>=
;
> manion05gk@gmail.com
> Subject: RE: [PATCH V2] PCA9541: Use I2C adapter timeout value for arbitr=
ation
> timeout
>
> Ping!
>
> > -----Original Message-----
> > From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> > Sent: Thursday, July 31, 2025 6:26 PM
> > To: git (AMD-Xilinx) <git@amd.com>; Simek, Michal
> > <michal.simek@amd.com>; peda@axentia.se; linux-i2c@vger.kernel.org;
> > linux-kernel@vger.kernel.org;
> > wsa+renesas@sang-engineering.com
> > Cc: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>; Goud, Srinivas
> > <srinivas.goud@amd.com>; Datta, Shubhrajyoti
> > <shubhrajyoti.datta@amd.com>; manion05gk@gmail.com; Guntupalli,
> > Manikanta <manikanta.guntupalli@amd.com>
> > Subject: [PATCH V2] PCA9541: Use I2C adapter timeout value for
> > arbitration timeout
> >
> > Remove existing arbitration timeout macros and use I2C adapter timeout
> > value for arbitration timeout and forceful bus ownership.
> >
> > I2C adapter timeout can be configurable from user space, so using it
> > for arbitration timeout helps in configuring the arbitration timeout
> > from user space depending on the use case.
> >
> > Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> > ---
> > Changes for V2:
> > Remove existing arbitration timeout macros and use i2c adapter timeout
> > value.
> > Change logging and commit details.
> > Link for V1: https://lore.kernel.org/all/20250711124503.3390451-1-
> > manikanta.guntupalli@amd.com/
> > ---
> >  drivers/i2c/muxes/i2c-mux-pca9541.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c
> > b/drivers/i2c/muxes/i2c-mux- pca9541.c index
> > 8663c8a7c269..3d8002caf703 100644
> > --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> > +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> > @@ -63,10 +63,6 @@
> >  #define mybus(x)   (!((x) & MYBUS) || ((x) & MYBUS) =3D=3D MYBUS)
> >  #define busoff(x)  (!((x) & BUSON) || ((x) & BUSON) =3D=3D BUSON)
> >
> > -/* arbitration timeouts, in jiffies */
> > -#define ARB_TIMEOUT        (HZ / 8)        /* 125 ms until forcing bus=
 ownership */
> > -#define ARB2_TIMEOUT       (HZ / 4)        /* 250 ms until acquisition=
 failure */
> > -
> >  /* arbitration retry delays, in us */
> >  #define SELECT_DELAY_SHORT 50
> >  #define SELECT_DELAY_LONG  1000
> > @@ -229,6 +225,9 @@ static int pca9541_arbitrate(struct i2c_client *cli=
ent)
> >              */
> >             data->select_timeout =3D SELECT_DELAY_LONG;
> >             if (time_is_before_eq_jiffies(data->arb_timeout)) {
> > +                   dev_warn(&client->dev,
> > +                            "Arbitration timeout on I2C bus, forcing b=
us
> > ownership\n");
> > +
> >                     /* Time is up, take the bus and reset it. */
> >                     pca9541_reg_write(client,
> >                                       PCA9541_CONTROL,
> > @@ -251,10 +250,10 @@ static int pca9541_select_chan(struct
> > i2c_mux_core *muxc, u32 chan)
> >     struct pca9541 *data =3D i2c_mux_priv(muxc);
> >     struct i2c_client *client =3D data->client;
> >     int ret;
> > -   unsigned long timeout =3D jiffies + ARB2_TIMEOUT;
> > +   unsigned long timeout =3D jiffies + (2 * client->adapter->timeout);
> >             /* give up after this time */
> >
> > -   data->arb_timeout =3D jiffies + ARB_TIMEOUT;
> > +   data->arb_timeout =3D jiffies + client->adapter->timeout;
> >             /* force bus ownership after this time */
> >
> >     do {
> > @@ -267,6 +266,7 @@ static int pca9541_select_chan(struct i2c_mux_core
> > *muxc,
> > u32 chan)
> >             else
> >                     msleep(data->select_timeout / 1000);
> >     } while (time_is_after_eq_jiffies(timeout));
> > +   dev_warn(&client->dev, "Failed to acquire I2C bus, timed out\n");
> >
> >     return -ETIMEDOUT;
> >  }
> > --
> > 2.34.1
>

Thanks,
Manikanta.

