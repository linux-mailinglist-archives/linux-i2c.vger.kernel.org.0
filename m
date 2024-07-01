Return-Path: <linux-i2c+bounces-4533-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D40991E2A1
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 16:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D7E28186F
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 14:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CEE16B3AF;
	Mon,  1 Jul 2024 14:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="dxPsBepV";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="kS0YzEhq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C38B16A950;
	Mon,  1 Jul 2024 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.153.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719844699; cv=fail; b=awu9ZbkCfYkEMxpi9d29QKvJma9R7O2caB26Eve/+7okSlSGiIRNn4N2l+dvDt/NxA8rooolhf2UNQHjkm9rtxMuPp4zmTPmIPOEcKWdxUtthVzjII/T7/p7RJDgBR3QKBzZpar54LWXbFccCPrI7SX5d4uDjipRknLZYD4I41s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719844699; c=relaxed/simple;
	bh=xIzL3aDz1+q9jlTjggy/7zOBOODCQP9JXDiDlBlPbJk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ioGsmm6S/8IiczawWVrS6754Rzar1/HJnpP4uhoQE037el6Hriez0BYM1URy4nElLETReq6G+0IflKlJbI06RvCNcgPAg0D9NonMXL068wz/+DVbpYz9RhVezvP2vfi+pdXFhMnkVvWZQKs+GENItujj/qWwOsCjD8ANQEHgthA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=dxPsBepV; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=kS0YzEhq; arc=fail smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719844697; x=1751380697;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xIzL3aDz1+q9jlTjggy/7zOBOODCQP9JXDiDlBlPbJk=;
  b=dxPsBepV0533TYfcM4e0JM7XxziWIlN5OAXOqYmCZeeY+WMfyNavaRb7
   uzZdzFQdOTl4S0hKumLG7ZmFilzoeq8HkJt0SBsoWybYWlKitwxsnR8uF
   BOMFm3r5omrGgbDZB+mJTyiwRVTMxX9nj5nPU4mzUuwJspIWSxUpScNCk
   +E+ZgoKbY7gGKrQzq7uXWdrj41sR5XX/ayNvoyPJvIBMb2gInd0w/EVIe
   QHuKGMDFDXh6DhIxeDyJc7hKEe+g0XHqHWiQ0r/OgR1mjle9MKkJA8q/5
   DUvAJ5Ysq6xAIvkjvN1T1cn5MCNZZ3vv1O+zyZiT27ck5UgkMGBx1B5x+
   w==;
X-CSE-ConnectionGUID: iGHcXMRpSX6C6CcOPyfJpA==
X-CSE-MsgGUID: FCOl9kNZRUeKIdbHOD0JNg==
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; 
   d="scan'208";a="259586424"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2024 07:38:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jul 2024 07:37:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Jul 2024 07:37:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kP4wVaYQfx9cF+1TYTniTwM9SAp0n09u/GiDHLGpSmWhxR7NPe0G+ta4QsyoZgJ43y1DkbOEcoIz7co3ujxo1a9w6MXIE1vcxz68QyAYHOgDSEVDm7cELa/WF3AqFfbccFXpZOHg+X7uchfsMqvi8l2u+CFvreJMhgRjoRsKiaDDLcKf2CCCnu9DksGWBvxtu/iHqcBCpKgFcCM0DonJO+3U59MuvQyTjwG97RMGuQUkSQpB6AuYW6plnhKT21iP41ONfJE3vbOehuITMHPLijJwd31RIyagszxbvTuDBXi9FHxsWKiAAOysbG25LFWYL5II5idEg3dqxICBecyniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIzL3aDz1+q9jlTjggy/7zOBOODCQP9JXDiDlBlPbJk=;
 b=g6VhiJHtQkfoAZlNCCp9m+roUgTPlGwH9E1PX0Y+ihxgZdfqVzPkta643OpT/L4CCL7EzMLdClC3WkZUxqx7jMcEpEBht0LpDaezp4Gl5h/8rbnE1vaFpbgeWvNwY0B7it9i+c3796qEP6N17oCn+S00v7PW4F8+SVqdh1qv9YwI/IFgSn7GDTQfjotCmYWvj0e8ghtGbyNtreZVTx+qNCl3ytGD20pzjg51pmfGhrys6ACswbYYpBzICgrv/wjImMmhHwqg3+bvGE6mnR+ZWXPX05wlJa9S98YwvF7wqJEj/ulzM6EAKLl19q0nWeL3ynzWwcu5xV6coc1XZIkgKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIzL3aDz1+q9jlTjggy/7zOBOODCQP9JXDiDlBlPbJk=;
 b=kS0YzEhqEeiB42PeZ8HWZ8U+1YpNlsTBselpRL7rlgNZZ/lA3NgDhic5SnaLgaEeTd/fQyFuYqHXXFDRjZbrPfPyHnP3qhT01jctm6I7k9qNE25YXPiEDQv4f3IZog9fis1glcTxd1ekcPUWGD35U5lTjBA3odMRPEwa+tcTvlXk4RIneBJNhx6VP+704cW8iKbvqC9jiY/qbAGmRnbCJhf4FYNbvGMk6fkQuUUFQVp3W2BUS0vDr5WIpbN5iFcW8cDuXHcfBCdvuujwrMBd9DZVe5BWbDUyL0vVaT9LMLLsxeKbqZH+7NpcQBGMMq++MqLL1nQJHSvpLucAvyVHQQ==
Received: from BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 by BL1PR11MB5953.namprd11.prod.outlook.com (2603:10b6:208:384::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 14:37:57 +0000
Received: from BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395]) by BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 14:37:57 +0000
From: <Andrei.Simion@microchip.com>
To: <Conor.Dooley@microchip.com>
CC: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: eeprom: at24: Add Microchip
 24AA025E48/24AA025E64
Thread-Topic: [PATCH v3 3/3] dt-bindings: eeprom: at24: Add Microchip
 24AA025E48/24AA025E64
Thread-Index: AQHayTGFipq1RnVUHESI83ra/iB+krHc42CAgAUSxwA=
Date: Mon, 1 Jul 2024 14:37:57 +0000
Message-ID: <04278bf9-fb5f-4592-8edd-a45332fed24a@microchip.com>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
 <20240628080146.49545-4-andrei.simion@microchip.com>
 <20240628-plunder-wackiness-72b0acf3624b@wendy>
In-Reply-To: <20240628-plunder-wackiness-72b0acf3624b@wendy>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5289:EE_|BL1PR11MB5953:EE_
x-ms-office365-filtering-correlation-id: 16cc3c21-1ddd-42c4-d5bf-08dc99db6681
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b01adDZoQVQ3NDEzWS83WU5mazkxaENwenh4Y0dsd1BWcTJNQk9JK2Z0cFFX?=
 =?utf-8?B?MHV2OEg2SUM3ZVh2V1c4TisxNFpCbCtwNlljWnBqRGVGRURtT0YrWmpjVnBk?=
 =?utf-8?B?dzBWWG9zSEhYelZWVURXOExLZVllczZmYytNNllmVUNrTllXak4zSlU3MTdR?=
 =?utf-8?B?bElZNHRnVUxuZmMwcU5vbXFBWlNxNmpoMVN0ckVsRkpMS3NYR1F5VHhoQ2Ji?=
 =?utf-8?B?S09QV0pTNW5HczNKc3pmSEFNWUk5QlFnZHRnbHF1bW5tRGpZRWxDQVRNN0tP?=
 =?utf-8?B?c2FGYW1qTWRvMkZ4NXVKb01Ic3JDcXRBSkFUT3doWWlpYXZJbnh3eElrL0I1?=
 =?utf-8?B?OFRjeC9EZ1VvdnFFMWs1VmpzSnIvMlJLSFhmVVN1bGJzdkVhZ1RlK1hOWC9T?=
 =?utf-8?B?KzlQSm1LSUNMTlJOL3hQdVdCU05QVGN2UndUSmRHWmEzN2hkdU5zQUt5ZVNj?=
 =?utf-8?B?SCtnVzM5UGlXNFIwb0lxOVBiUlhNOGxmTEZSRzI1VFpzM1RvMFlHd0JheElM?=
 =?utf-8?B?UUIrUXVQOVQydjMzWDRpV0NxVWNZNzhBcTZGampoYjJSV1JnWFdzM1Jjd3Ew?=
 =?utf-8?B?WmFlZmJIMUNES0JLWUNlSVVWLzhGMDRVRGhxRnY0SDFQczJyL2Z3K3drbDNW?=
 =?utf-8?B?OS9Dc0I2MVYyYms1UW42V1V3eEs0RTllT0pvbVQ5YUlhOXEzcDRzSUtoWlU2?=
 =?utf-8?B?empieHc1NjBHYUJ1QjhORXRnUlZYbWR1WTNlaS95Si9vc2tXUWw3RkNSSUlZ?=
 =?utf-8?B?V1RvaTF3NlJjdUlvSmRSMjFrRklQb3ExNXgzZEpwd0hycWNjdEpwd2cyQTBi?=
 =?utf-8?B?VmxyczhlUDFRa21HWWNBV2hqUmNhampySURqNyttMS9OeDBkazIrZFNuZTRm?=
 =?utf-8?B?QXhIY1pNZ3dxNy95Z3Mzb2FmczFqYklCUE8rbUhOdEFmemt5ZmV3RGFDcmtn?=
 =?utf-8?B?WXZpcWUvYkVWVzRydVpjQnRHenF1QU9QU01PYmFIbnMwRG9xTkJaNzJhdzJm?=
 =?utf-8?B?eFRxQXZVbEJWRWY5aHZwVDhuWHpRZ2tOQXhEYWdNTXRJcmMxOXJvaUxXd2tm?=
 =?utf-8?B?a0Izd09mR09YZDQrOEFKRjdPVTFGK1BkbG9pbzVGV0dUWktnekowL3FmQld5?=
 =?utf-8?B?OVh5eDB3Qy9vOGFIVW10WkxjTHFGODVOK1M3aElzMXhSQ0NIZnFUcmhZRzRG?=
 =?utf-8?B?djR2YXlnVi9yVXdrbkJVK3dEWk95QWFOLzFvUnFRcDlTb2UyVW9BTG9HWnVN?=
 =?utf-8?B?dk0wR2JTSWFqZkpWS0wyQk5OQk5ITE1GN2ZIcm5NRWM5bVRVT0pybVJQREIw?=
 =?utf-8?B?d2l5SitMZ0FoZ1pENlRSVlVXUVF5TkN1Mml5Z3ZSMFk1a1lnQlpoZVZlTUlN?=
 =?utf-8?B?K0dYbGF5SXpadml6T2FQTStldlVGU2owQ2hFQUd4Yy9ZZkFoUS9NcFRRZmlB?=
 =?utf-8?B?YWRqckdKdHNpSklZUDhTb1JqbjdEbW5QKzVER0hrVUNZM0pCZnhBWWtaclBJ?=
 =?utf-8?B?K3ZxcUxpWlp2V1NhTzRhZWgyM0IvTzdZN2ZWU3BoYkQvTEhmT0tsQllxOGNh?=
 =?utf-8?B?WkdoaFBrSEFYWUszQVRxWDFXak1VbjNGcnJxSTVPSmh6OHZrZkF3Sm9RM1NR?=
 =?utf-8?B?d1lKem5FTVRLQkpIVDlDT3ZiM0NMR2Y3aTVrUUZhRThYTndtTWVid1V2RjNL?=
 =?utf-8?B?aldjRVVUQm93MHNZRDBPY3BFaTFmc2ZLa3dHSlJRR3dZV2xyWTRKblhSNU85?=
 =?utf-8?B?cXM5cTQ0L3BJQUt1UTk2ZTJkY3lDOXRlbk9XTkU3eDF2K3hCWVREWEpIejUx?=
 =?utf-8?B?aVV2WEd3Mkc3R2pyNUVLS2dzdWsrSWFKQ2MrcjhSWUQ4TWVPWFJrYUZxUGdS?=
 =?utf-8?B?a0YwTFNVRFBCZ3lwQXVPMnE5TWdDWVYzZWw0MktaNVJnZmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5289.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVpkL2M0MDMzSnRvRVF0WFFSbHJId1NUek9WdERKVkMvNWF5ODZ6Sk5QZWNP?=
 =?utf-8?B?MFYvL0FxOE9LejlFekEzSEh4Z3ZHSmV0Tyt4SmdFVHhwYjlQTSs4M0hyMXA5?=
 =?utf-8?B?M25QMWRTcWdnOUkxMHVNVUZUMzQ4VkVoVHk4SVBSb1ZuS2UwU3ZIdFJ2ODE5?=
 =?utf-8?B?a3JCeGtWTVVKSnNIOTVBdDhxNXFLaUdaSFBrYlhRUnV1Y1NPOXI3VlBrM1M1?=
 =?utf-8?B?LzFYZ1l1ODhBYVpyOEdMZDRnMllkcU5qMjQ3dmVjanJqVStyRlBqRkZ6UFdu?=
 =?utf-8?B?N3JMbUw4T0VTL0o1Ynp3bWV5dzFTWVJvSEU0MGxWVFl6K0ZRUlh0UzZpYnpI?=
 =?utf-8?B?N2JkdGxvbDNPYXZWYktmZHN1emNzWldaKzBYMUxhb3BQc1p1cXpST0RXTUZn?=
 =?utf-8?B?YlBVVDNnTjl1NUJVZ0ZlV0FPYTlEaWVPRnJCU1BaRzZUZ0xIS2FXN0VzeEpU?=
 =?utf-8?B?UmJXNzI5dXVvZHZpNURjc1krTlE5aXNQeTFGcGZaMDhEc0REK0VBVDVhdWpT?=
 =?utf-8?B?Zy9GaFByVzQxRVhQQWN2SkxnM3JUN1VVbDA5T3NaQzc3Y2J1WThReVBxS3FK?=
 =?utf-8?B?SmYwRUhkSnVvR25VZXRHZHB1cS9BWWFDajhJOTFUK3AzZENoRWUwWjZtci9L?=
 =?utf-8?B?dW9RZnJxZ1Q4WkhQUHRZUzRjRVFqSithT0Y2VVA2RklOWFVKNDZtTUUzNlpE?=
 =?utf-8?B?aTd0Ym9JMy9BYlFBZ1ZLdVJQVkxHV3NjQkEzTW12VzQ1VWp0Ty8zLy9raTRO?=
 =?utf-8?B?N1E1VWtwRTJzMFVVZHFBak9yVWF0NHA0UlVGZXcydkJ4bmY0cm41MXB0aDU5?=
 =?utf-8?B?Sm1BNkpUZVUzVk5GNGRaZ1d1TVZMM2YzTU4rc203SVNiakhxaE1zNkc0Qmwr?=
 =?utf-8?B?NkE0a1JRa0FNbjZ6K1FIZnc3YTJEeFNEQ2NlMDNQNjczeGNnZlR0b0ovblF6?=
 =?utf-8?B?Tnk1QVNVSzFGcEtJc1VBcWdVWVgrNS9lWjBvN1oxS0NUODJXaUs1T0NrVFFH?=
 =?utf-8?B?Z1BpamxFc014ellyU1JtN0ExOXUrc1YrbjFSejlFSjFjOXpldFlsOFFEcmdt?=
 =?utf-8?B?UjVMejN5SFdBUllLVWdmY3VkcmdQSGVlc2R4RkxiaXRTMEFYakxyc0haZlJV?=
 =?utf-8?B?V0tqREFWeTJlMng3Sm9XQitmV2Y5ejh4TG42N0I3SVJVbDVmR003MEhPbjZz?=
 =?utf-8?B?UUJMazVERHBWMUJSM0ZXYUZJNkJ6cE40RVlRakhSMk5BcU5sSGF1S1pFd2Fn?=
 =?utf-8?B?aE1hRlh4dVIxeDVmS2pzZlRMN0syMkN2WE1HRHdBWUxWOFNZV0NXTEJzR2tQ?=
 =?utf-8?B?ZnFwYVo5RnZ0Tng4dlAzamJ0UnljZm1neWhDVFl2UlB2Q3hZRHRQc3VLdDZT?=
 =?utf-8?B?T29ub1M2U0RUUzYyZzN4R2IwSzVaM2txTTZrOHNKK1o2b0pIdmRVYURFMnhL?=
 =?utf-8?B?ZFdyZkJEMGQvWFBBaUV2MEVwbmVwTWZXMUt4b1VuVXdxNnpVS1N3RmM5bmlp?=
 =?utf-8?B?Wm1TZ1NjM0dPcE9FbExGWngxOUd2RFZCQ1h5QWcrVk84TFZPQXNna2d1NStk?=
 =?utf-8?B?YnlNeTJ4b2M4MUZGN2ZONzgyNFk3c2VZbDNEOXJsc3QzOWhsRjdVeFpQREZH?=
 =?utf-8?B?WExUeHhPM0g5dnN1enBuRzJwQkNYZFJPNWU5YTQ5UDkxeTFHLzVYUG04Vytw?=
 =?utf-8?B?MDZiaVRPeG5mZmcvQjgwVjE4UU50UDVTQTBxV0dyUlBTaUJBczhveWpETGla?=
 =?utf-8?B?NjNKRjBmcGtqaW43eXFCZjFqL0lUMDc5SU9ZRGQxL3FydDVXMXk3emVMOEtw?=
 =?utf-8?B?VWxMV3RWWElsZDQ3TGNWTVBsUjArWWVOT1hmcGZENzhDK0JvTG85dVg3eUEx?=
 =?utf-8?B?aDY4Zno4YjBra084N0RGdlF5NnNWc2VSOUVpQTh4bWYwRkIzTTRlS1g4Y1lv?=
 =?utf-8?B?bU9SZXNodVQ2bHRsY0lxZS9yQzNYWFlWUVF2ZjVOUHFYUTcycFF2cEZrNFdI?=
 =?utf-8?B?OU40OTZqNzBEMHFUeDI5bk5hUFIzYVA3Yi90T0JCVFRKOFd5S2tacUl4ZXdm?=
 =?utf-8?B?T3VPcTFETmN1Y3NtUWxCb1N5TGtERmUrTThSeTh5bmxRYks2Sm9WRDhQaTlh?=
 =?utf-8?B?Mlp4WERSY2t5TjJ3TXM3cVNjT2dDeC9BUlJEYnlnRTEzL1Y3OHJHZUQxOEVQ?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44EF8D89E8875244A79A24C24059D5FC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5289.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cc3c21-1ddd-42c4-d5bf-08dc99db6681
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 14:37:57.5855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KHets2tvogG9yql1JVbEhkKzQ/nqaJOX1bF1cvGIHDIreNnuCQLEEzPf4sM9ZTGYPLSzOlYxLvil/HBBQCn5xZUH9Q2qoswnxouoAJ4RS8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5953

T24gMjguMDYuMjAyNCAxMjowOSwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBIZXksDQo+IA0KPiBP
biBGcmksIEp1biAyOCwgMjAyNCBhdCAxMTowMTo0NkFNICswMzAwLCBBbmRyZWkgU2ltaW9uIHdy
b3RlOg0KPj4gQWRkIGNvbXBhdGlibGUgZm9yIE1pY3JvY2hpcCAyNEFBMDI1RTQ4LzI0QUEwMjVF
NjQgRUVQUk9Ncy4NCj4+DQo+PiBSZXZpZXdlZC1ieTogQ29ubm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+DQo+ICAgICAgICAgICAgICAgICAgXl4gICAgICAgICAgICAgXg0K
PiBUaGVyZSdzIG5vIHdheSB0aGF0IEkgcHJvdmlkZWQgYSB0YWcgd2l0aCBteSBuYW1lIHNwZWx0
IGluY29ycmVjdGx5DQo+IGdpdmVuIEkgdXNlIGEgbWFjcm8gdG8gaW5zZXJ0IHRoZW0uIFBsZWFz
ZSBjb3B5LXBhc3RlIHRhZ3Mgb3IgdXNlIGI0DQo+IHRvIHBpY2sgdGhlbSB1cCwgcmF0aGVyIHRo
YW4gdHlwZSB0aGVtIG91dCB5b3Vyc2VsZi4NCj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWkg
U2ltaW9uIDxhbmRyZWkuc2ltaW9uQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+IHYyIC0+IHYz
Og0KPj4gLSBjb21taXQgc3ViamVjdCBjaGFuZ2VkIHRvIHJlZmVyZW5jZSBNaWNyb2NoaXAgMjRB
QTAyNUU0OC8yNEFBMDI1RTY0DQo+PiAtIGRyb3AgdGhlIHBhdHRlcm46IG1hYzAyZTQkIGFuZCBt
YWMwMmU2JCBhbmQgYS16IGZyb20gcmVnZXgNCj4+IC0gYWRkIHRoZXNlIHR3byBkZXZpY2VzIGRv
d24gYXQgdGhlIGJvdHRvbQ0KPj4gLSBhZGRlZCBSZXZpZXdlZC1ieQ0KPj4NCj4+IHYxIC0+IHYy
Og0KPj4gLSBjaGFuZ2UgcGF0dGVybiBpbnRvICJeYXRtZWwsKDI0KGN8Y3N8bWFjKVthLXowLTld
K3xzcGQpJCIgdG8ga2VlcCBzaW1wbGVyDQo+PiAtLS0NCj4+ICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFtbCB8IDQgKysrKw0KPj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2VlcHJvbS9hdDI0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFtbA0KPj4gaW5kZXggM2MzNmNkMDUxMGRlLi42
OTljMmJiYzE2ZjUgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZWVwcm9tL2F0MjQueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2VlcHJvbS9hdDI0LnlhbWwNCj4+IEBAIC0xMzIsNiArMTMyLDEwIEBAIHByb3Bl
cnRpZXM6DQo+PiAgICAgICAgICAgICAgICAtIHJlbmVzYXMscjFleDI0MTI4DQo+PiAgICAgICAg
ICAgICAgICAtIHNhbXN1bmcsczUyNGFkMHhkMQ0KPj4gICAgICAgICAgICAtIGNvbnN0OiBhdG1l
bCwyNGMxMjgNCj4+ICsgICAgICAtIGl0ZW1zOg0KPj4gKyAgICAgICAgICAtIGNvbnN0OiBtaWNy
b2NoaXAsMjRhYTAyNWU0OA0KPj4gKyAgICAgIC0gaXRlbXM6DQo+PiArICAgICAgICAgIC0gY29u
c3Q6IG1pY3JvY2hpcCwyNGFhMDI1ZTY0DQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoaXMgcGF0Y2gg
d29ya3MsIHRoZSBzY2hlbWEgaGFzIGEgc2VsZWN0IGluIGl0IHRoYXQgb25seQ0KPiBtYXRjaGVz
IF5hdG1lbCwoMjQoY3xjc3xtYWMpWzAtOV0rfHNwZCkkLiBZb3UgZWl0aGVyIG5lZWQgdG8gaGF2
ZSB0aGVzZQ0KPiBmYWxsIGJhY2sgdG8gYW4gZXhpc3RpbmcgY29tcGF0aWJsZSAoaWZmIGFjdHVh
bGx5IGNvbXBhdGlibGUpIG9yIGVsc2UgZG8NCj4gc29tZXRoaW5nIGxpa2U6DQo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZXByb20vYXQyNC55YW1sDQo+IGlu
ZGV4IDY5OWMyYmJjMTZmNS4uNGQ0NmI4YzU0MzlkIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFtbA0KPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFtbA0KPiBAQCAtMTgsNyAr
MTgsOSBAQCBzZWxlY3Q6DQo+ICAgIHByb3BlcnRpZXM6DQo+ICAgICAgY29tcGF0aWJsZToNCj4g
ICAgICAgIGNvbnRhaW5zOg0KPiAtICAgICAgICBwYXR0ZXJuOiAiXmF0bWVsLCgyNChjfGNzfG1h
YylbMC05XSt8c3BkKSQiDQo+ICsgICAgICAgIGFueU9mOg0KPiArICAgICAgICAgIC0gcGF0dGVy
bjogIl5hdG1lbCwoMjQoY3xjc3xtYWMpWzAtOV0rfHNwZCkkIg0KPiArICAgICAgICAgIC0gZW51
bTogWyJtaWNyb2NoaXAsMjRhYTAyNWU0OCIsICJtaWNyb2NoaXAsMjRhYTAyNWU2NCJdDQo+IA0K
PiBUaGFua3MsDQo+IENvbm9yLg0KPiANCg0KSWYgSSB1c2UgeW91ciBzb2x1dGlvbiAoYW5kIGRy
b3AgYm90aCBpdGVtczogY29uc3QpIC0+IGl0IGlzIHNlbGVjdGVkIHRoZSBjb21wYXRpYmxlIGJ1
dCBkb2VzIG5vdCBtYXRjaCBhbnl0aGluZy4NCg0KV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgOg0K
DQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2VlcHJvbS9h
dDI0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQu
eWFtbA0KaW5kZXggNjk5YzJiYmMxNmY1Li5iZmFmN2VhYzY1OGEgMTAwNjQ0DQotLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFtbA0KKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2VlcHJvbS9hdDI0LnlhbWwNCkBAIC0xOCw3
ICsxOCw3IEBAIHNlbGVjdDoNCiAgIHByb3BlcnRpZXM6DQogICAgIGNvbXBhdGlibGU6DQogICAg
ICAgY29udGFpbnM6DQotICAgICAgICBwYXR0ZXJuOiAiXmF0bWVsLCgyNChjfGNzfG1hYylbMC05
XSt8c3BkKSQiDQorICAgICAgICBwYXR0ZXJuOiAiXihhdG1lbHxtaWNyb2NoaXApLCgyNChhYXxj
fGNzfG1hYylbMC05XSt8c3BkKSQiDQogICByZXF1aXJlZDoNCiAgICAgLSBjb21wYXRpYmxlDQog
DQpAQCAtMzcsOSArMzcsMTMgQEAgcHJvcGVydGllczoNCiAgICAgICAtIGFsbE9mOg0KICAgICAg
ICAgICAtIG1pbkl0ZW1zOiAxDQogICAgICAgICAgICAgaXRlbXM6DQotICAgICAgICAgICAgICAt
IHBhdHRlcm46ICJeKGF0bWVsfGNhdGFseXN0fG1pY3JvY2hpcHxueHB8cmFtdHJvbnxyZW5lc2Fz
fHJvaG18c3QpLCgyNChjfGNzfGxjfG1hYylbMC05XSt8c3BkKSQiDQorICAgICAgICAgICAgICAt
IHBhdHRlcm46ICJeKGF0bWVsfGNhdGFseXN0fG1pY3JvY2hpcHxueHB8cmFtdHJvbnxyZW5lc2Fz
fHJvaG18c3QpLCgyNChhYXxjfGNzfGxjfG1hYylbMC05XSt8c3BkKSQiDQogICAgICAgICAgICAg
ICAtIHBhdHRlcm46ICJeYXRtZWwsKDI0KGN8Y3N8bWFjKVswLTldK3xzcGQpJCINCiAgICAgICAg
ICAgLSBvbmVPZjoNCisgICAgICAgICAgICAgIC0gaXRlbXM6DQorICAgICAgICAgICAgICAgICAg
cGF0dGVybjogYWEwMjVlNDgkDQorICAgICAgICAgICAgICAtIGl0ZW1zOg0KKyAgICAgICAgICAg
ICAgICAgIHBhdHRlcm46IGFhMDI1ZTY0JA0KICAgICAgICAgICAgICAgLSBpdGVtczoNCiAgICAg
ICAgICAgICAgICAgICBwYXR0ZXJuOiBjMDAkDQogICAgICAgICAgICAgICAtIGl0ZW1zOg0KDQpC
ZXN0IFJlZ2FyZHMsDQpBbmRyZWkgDQoNCg0KPj4gICAgICAgIC0gcGF0dGVybjogJ15hdG1lbCwy
NGMoMzJ8NjQpZC13bCQnICMgQWN0dWFsIHZlbmRvciBpcyBzdA0KPj4gIA0KPj4gICAgbGFiZWw6
DQo+PiAtLSANCj4+IDIuMzQuMQ0KPj4NCg0KDQo=

