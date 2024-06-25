Return-Path: <linux-i2c+bounces-4327-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4C3916012
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 09:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C2DB1C20CA9
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 07:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653D4146A62;
	Tue, 25 Jun 2024 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="mHbFWpJC";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="SADOhbfA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AAB1DFFD;
	Tue, 25 Jun 2024 07:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.154.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719300836; cv=fail; b=fIfhA8RixL6tOQ8KZxU8gsK/Lc/KPw3r2ze1SwbqB7EPPZplkPXOr9HopgHG7wgpEDh1AWahbVwGpA6ke3NnXJ+KnYzu2IJg7RJc/A2kyWv7D1qLT+Xw4YfEqYIlerYtCm+C8Rpy8X8VhYx0EfvAUP3Z7wY1p7x4c/vFtFMwH+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719300836; c=relaxed/simple;
	bh=CEUaBoYaDv0i/DH89KGZfvNKBCNK+K4FPTV002Izb8Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UI0BqSSUeLgTbys/BqL0qK9yMazJka01vQIi/Uxqd1Kj8o4HDlPEQUVmpoCs+H5MWAIquMKYoLtlqtwSIXz2Q+uZrFVew1cuuicGM9lgM3SDN/6Y8sJeQFhKmt7m2LOUuaev3t3uTkIYd9UQ2nRM0B53vL0JHOc3RAMKM6Lunnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=mHbFWpJC; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=SADOhbfA; arc=fail smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719300833; x=1750836833;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CEUaBoYaDv0i/DH89KGZfvNKBCNK+K4FPTV002Izb8Q=;
  b=mHbFWpJCU3IBRQW+viX8dF5i9vR6gheTVRaT8nZahb+yfm0S4NMRGIlT
   N3SpHEHvGQoFLv8sckZ9nEA3Hc361MIGF3KCI/cZgOopdXc6k4oAyzuXv
   JyDkkF76i/w/azSB/+KGiSVOOePHuXoQxgwXupqFHc0KaJuWqmj1iFgTg
   cKDmMy3B61Q+0To+mxquKCbrQlISAt3EIk+96O4wJlCuSrGGRatCJOp/r
   m8nwY7MBD/i0ZssPoS+dfpKqnhssubPDfw+cxE5gUlh1uj+qWTeEzuEgs
   9AZXEy5ngPmPoBVWh+luud3ztRyapkZ8kE4r3Jl0McPJ0BmdzTsQ+bLrh
   A==;
X-CSE-ConnectionGUID: A8MYZUE2TL+CfzxwnyRZjg==
X-CSE-MsgGUID: OpqlEDF/Tzeqahh3X86P2g==
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="195853456"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2024 00:33:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 25 Jun 2024 00:33:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 25 Jun 2024 00:33:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvspQAR+cRLkGPBxi2sZWBuABdCWRBHi0emMgGkGVh/CCXVZcmser1WBzM2ADmN1H7QpIhZDHQxS8KfMrjK3Q1iHjX3knwLV3SaezPBMj77dOjwCpdSnWtka52QDyEUKuiQjy+RisfB2B9COpI2I3/sruQbHVyl+G451uI+KDIuk8KzRfjFZzP9xwqEEpoa2MzysgBfgGWQH52chWDy1Ze05Vao8aZH/9rZ/Wuj+jfNOn6ghpCByJPJGMa70LtaoOVQY2DiZEBLumwtBrmCTMOVCAH+oUnhAOz9NR2pzhgJG6xuw/J2hnvrGxuzcb40cyzEJymGZ/AZJHigr8FhMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEUaBoYaDv0i/DH89KGZfvNKBCNK+K4FPTV002Izb8Q=;
 b=UWCbJQknRNiWu2TZbFlWW/QDURAeSdMCR3fC2FIjFThA4Gux2CXWyQo14uuUW8l+wdfQ3v9sVcpOk8Shjoi/sYbdLEoWkZINxBW36niq2OY0QoaB/3pwZSv7Y2xVcvPyu7JyIHis+He/njJ5XxW53OR4Uj0zL+fFJL0SjeAJWLPOuClVGnjtkFZFuYthlXSkHOhmFNe0NWXRHikUcihWu+xDUsV8uegyxF0Vhg2LO+X8HmecF3JxhYatLzqSXMxTcWiC75rIczAffvEeTdM52UbPhhIuG2e7ooOucY7YD9+UCEeI2nKTlJ/NrEhZc7tHQdaI9ILwYibW8elYZKyP2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEUaBoYaDv0i/DH89KGZfvNKBCNK+K4FPTV002Izb8Q=;
 b=SADOhbfAm9JVH8RCdqyTU6FcJ2xnrrvqVhY7izpEgSQk9wp1lUnYK0VNNumfWF6T1Tc7Efy4d/d1rU6bOUVuq8PhKuaeSO+5Of3AedJAEImLInPwbh7aieLK7whHDKtcvm+5SHcPftodEwobfEo0P9or0bLeY8r98zzkuM/vLdLtlsf+sOgxdgIccDMRGheGdcq4Bvqjs33gjJsmh6Gie99C018o7j01iwIiybE7cJOclJ1z+krzNKkCsQaEpYGwlfWa3Ysg6HFwPEe2kqhWvIOCWvD9JkIqGmNpSgefaISYFuElfUcuRwSyzhC+JtOVNqNYGFnUK2OXfjdStn5PyA==
Received: from BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Tue, 25 Jun
 2024 07:33:18 +0000
Received: from BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395]) by BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 07:33:18 +0000
From: <Andrei.Simion@microchip.com>
To: <robh@kernel.org>
CC: <brgl@bgdev.pl>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: eeprom: at24: Add at24,mac02e4 and
 at24,mac02e6
Thread-Topic: [PATCH v2 3/3] dt-bindings: eeprom: at24: Add at24,mac02e4 and
 at24,mac02e6
Thread-Index: AQHaw9TbRUcf20bKqEOyQtim71xJ1rHXV4OAgADEuAA=
Date: Tue, 25 Jun 2024 07:33:18 +0000
Message-ID: <53820e28-f512-4129-9a17-a549ef664755@microchip.com>
References: <20240621121340.114486-1-andrei.simion@microchip.com>
 <20240621121340.114486-4-andrei.simion@microchip.com>
 <20240624194913.GA267989-robh@kernel.org>
In-Reply-To: <20240624194913.GA267989-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5289:EE_|DS0PR11MB8133:EE_
x-ms-office365-filtering-correlation-id: 93cb8dc3-bf8d-425d-98d1-08dc94e91545
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|366013|7416011|1800799021|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?NmI4SlhtM05XNlZja2F1YVZ1MUNUNXFIT1NqVmRLN1VHZXpKUjdXa1d5MDIw?=
 =?utf-8?B?UjNrQlQzQ3dXU2JJOFVjb29sd1Q1VHFxU2dvMmJpSnFvaWE2RlRxeFA4akYr?=
 =?utf-8?B?dTR0cGdYakVyWVJiMFk4L2w1eWRFVE9RQlFyd1NiVVhjNnhBOEZjcXluU1Qr?=
 =?utf-8?B?dmNkSkU4SURjTjRzWkxsckxlT2p5c1lEOHlNWnBVV2xkbWNKTHliNncxL09J?=
 =?utf-8?B?dGV6cm9PZjB0R3Q0cnI4SmZRL2IwV3MyRTd1WGNWckhvM2hLR0hjcFZMdzRX?=
 =?utf-8?B?dDRlTXhhek1XcWtENmIrSVFzR3M3UXJYWDhNYUNDVytzSUxGNG85T0VZbitS?=
 =?utf-8?B?a29UVVdZa1VCUVVuTmFhRC9ONzFnNG1qK1lOTU9GTkh3ekxQWDRpelpobU5C?=
 =?utf-8?B?M3ZaTWdmUUpmUVNjYlNtdnVrWUh6SGZlM29WYnBjdUZUcHZDUkU0QVp5aHM1?=
 =?utf-8?B?SjdYenI2MGdEQWlaa0ZPTXFPcEZoSDRHTUZlRXFnS0xsejZIa1FVc1A4WjBS?=
 =?utf-8?B?d050WHd3SWVnSUlKWTBLNkZNT0RPVkpQRkE3NS92ZGgrb3I4K2FVNmhGM3R5?=
 =?utf-8?B?NnhGblRZM0ttWlhMYjAxcVNxQmdlRVVZNHNQNmNNa2lhMTFPdjRGTWtaRExY?=
 =?utf-8?B?UytCV01mc29JaEV5NDF2RGRvVjRBLzk3ZnN0RDJ4RWJ4Q2FOK0dUSm83Vm1u?=
 =?utf-8?B?WFBiZ2Nhd0N2bktVbytXSFdHZTdFVUQ1UUxDUFMySU5SLy9IZU11eHdxS2FU?=
 =?utf-8?B?RkJkQWlEamQrcHduYUxuTmhycVliYVdRYlRHcHFneXFwdWhHZHVlU3Uyb20r?=
 =?utf-8?B?M3hFaEEwclcxQTZ0U2J0NmxsZlZEOGZjMzEyRDlVd3Vqd3VETVZNTDdRZmpE?=
 =?utf-8?B?TUtSRnEwRkF2R1BPNkU4UVM5MXJmNXJkSTB2cWF2U0pJS0piZThGdUJ1dVZR?=
 =?utf-8?B?SGtieC9SaEo2NmFWdWlYNkh0SjJZQ1hYWHh4WFlIM01Fd040NDZxY3BNWTVP?=
 =?utf-8?B?K2c4QWtXL25WbEJhcjRVQXE3Zjh1Mm1aR1VNcjFoR3RGRlZFeDFnQjV1aTBv?=
 =?utf-8?B?ekFibFZhbzgrYmdLbUxMenpjWFhSL1l6VUMvQjI5VEFnRlkvOFlTN3hMY2Yx?=
 =?utf-8?B?Y29ycW5OS0FBYmhQOXV4OGJ5QjdNY3crWk9VRVNTR1B2NjUvL29KUFhtc09E?=
 =?utf-8?B?NDV4M1FEQTZsb3hTK0FyOVZFUFAvMFVFZWhhY04zNCsrUGhzc0FwL3BtQjZo?=
 =?utf-8?B?ZUNTMGdhbXU0dUxHN1ZiQVM2YmgxMWc3T0lOQlprVFM0VmpJcHBOVEh6RU1C?=
 =?utf-8?B?M0ppdXgyemxTWnBTaVlJSE5sWnJqdVhsYTBCNFY4cWpTaFRCb2pqZ29ybFZZ?=
 =?utf-8?B?TEZmZnpyd045VE92ZWV0MHhlYW8xbmY5SHlES2dzeFZNVVAwZEZHOFI5U2M1?=
 =?utf-8?B?SFpaZS82Smp1MkpsMGlneG5qcGhBZ0cyMlorSzU3RjJ6ZFE2dmtYWTIrV21w?=
 =?utf-8?B?MDY1YmtSSk9PeVk4VHZ4aW9CWVNIQi93bllpRzl4TndiNWxZcXpRL3JLQkYz?=
 =?utf-8?B?OXNKWlkxOGJ5UTJjZFdOcTUzd0FKWjJsdm80TS9kdUhTVjl2a3pwbUllenh4?=
 =?utf-8?B?UzFsdTF2U2IrUVI2dlBpS1k1bEdtZFJ6NEQ3c0sva2djMW1heFJHM3pSbEdj?=
 =?utf-8?B?Wkp5OVNPL1dTUmw5Y0twSkpOa1pQSms3bmYrdUJKc29ZZ0Z1TTlLclU0UkFB?=
 =?utf-8?B?S3RyOXI5M2ZIWlhLajdRN01SaWRWb0JqZFh3Y2JYeHFabkUzYUhsRDlZMVpM?=
 =?utf-8?Q?LZ1OS4gHjpJYqS6PVDUccuNOE9H+xq5snNmo0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5289.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(7416011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mk5tU3puaEZ0bXBXR1ZranBpVUpHQU8vdE11bWRuYTBNQ3NtUEsraCsyUlhZ?=
 =?utf-8?B?WkVCbTZpZitlRk1rSWVNVUQxVWJaYS9hYWpUR2FsMHRCMzNDSTViS3NCbTdq?=
 =?utf-8?B?Vm1ycEU1bWJOYk9XZzQ1bFN6dG9aNEdLZ3JKS0NCTzgwZzE4c0pnQjRjM01w?=
 =?utf-8?B?NExTN0liOCtDKzVYeEw1eEh0NHp2V09IVmM5ZzRZdXQ3Y1Qwak1QdFRiOHND?=
 =?utf-8?B?VXExL01UVnNIR0cxRHpMWStxZ1N5RDZwcllic1ZQODF0SXZkN0pvSTQwU0po?=
 =?utf-8?B?YTc4WFNKWlNPVWNObWd3aElQSi9XR05TSndLdDBhc3ZFZmF0Lzh3QlRoeVFt?=
 =?utf-8?B?V0w0Q1FnbUQ2dXJLVnVQbDgzR0trT3dJVjlFTWJMMEZmQzRrUHVER1RURzA3?=
 =?utf-8?B?d3dGVjN6YnA5S3F3a1RuMTJUQkVpa29sRVNNK21tTUpUeERXbnFDTi9YbFp0?=
 =?utf-8?B?M29yMEl6L05BSkVoLzZZekpYQ0cwSldtcTVlVTRheFpCWUhPK0drNktLQVhS?=
 =?utf-8?B?Wm1PVnRjbFBiSW4xcHRGMENRbzFuWmx5cWRWSTJZWXkzRjloZHNYVllteHBz?=
 =?utf-8?B?MHhLZkVuN1R4ZGMwbkdxOWlITVR6WXBQVExKL3kxei9ITnZjeW85WjFQQTdK?=
 =?utf-8?B?T3JidXhOb1RJWVFjeFhtWHl0Zmx2L3pnZ09CeUhQSDlyTjhESnVIcWNxemRa?=
 =?utf-8?B?V1RscVl3b1RKSmVkK3B4Z2lrdThXZnVkVWovaWVqbWRkZk1WRitzU1hxYlFC?=
 =?utf-8?B?ZGs1RVBHL1hEbnY5RkhQNGU5dWNyb2R6eURKcG9PK2NYZC9PT2pBdzFyUDdE?=
 =?utf-8?B?Qi9oYTZPTHVoMVROcDFtcENqVjdlcG96aTREdGtseG1pSll3UDNjWndyY29Z?=
 =?utf-8?B?Nmp0aVhXUlJEWFZvOEl5Sk9ldjcrYmIxQmh3SFpRcFVBMXYxTU9VcjRBMTNY?=
 =?utf-8?B?dnVvSDNoRmdYclJ6T2ZnQVJVOUZzam5JR3A1YjNBODV5dEd1WC9TYlg5MDdH?=
 =?utf-8?B?RHlSMTFYelZWUHlTOE13UUpnSjN5U3dPcDBEMTN4aVFWWUhVdlZzb3NOYzhZ?=
 =?utf-8?B?MWJONnFBd2EyTG1oSExGNHZkdklHNUZDbDF3aHM2d0xiTU5GWnVrOFBNTWo0?=
 =?utf-8?B?MXl5WDk4UmcrQTZLeUpWL0dQdTdTajB5ZHlRZ28zTElYR0tNZ1pPQU1UcHIw?=
 =?utf-8?B?UXZVWjZlM3NoVmIyamJNUmtWcmxOeFh2K1h1dnRSSFJ6bDV5K2JHSG1sVXY4?=
 =?utf-8?B?ZDdVL05mVDJtNmtvNVJlZ3NKYnlYdUlFQ0NlTkNEWkRyeVVvK3AyYlNJYVh1?=
 =?utf-8?B?ellZZDBMeVB4NjlzMTFyY3dmVm05aTl0REk5L2ptQ1NOR09VYUxoSnJoSmdx?=
 =?utf-8?B?SWF6UXFhUm5JK1VPUjJQZDkxcjVyeUcyWXFMc1oreHh5NlRFWlUwK0tiaU1P?=
 =?utf-8?B?WWkyZExHbzBsNWdGMlU4eUkrSjExeDdGNC85aGh4TEpGVzh6QWdxWHoxdURJ?=
 =?utf-8?B?WXh0MDIxM3FCRlRwc2NjNmpDK1c0VGF2THhMUndTOHBUek45d3lrOWh0eDY2?=
 =?utf-8?B?ZkpIc0wxZnRVdjNQa3dlRmtwZFJ4YysxZWV0UEFNUEtSSXEvR0NCVmN6SnZa?=
 =?utf-8?B?K1NlY1Q2SGs4R3hjZno4SUd4bXRkbTUrRWcxdGh2ZmFGM0Y1bzVSWVNEZWxX?=
 =?utf-8?B?OENodUJBQjQ3ckE0QUFNTktOZzRvQnh2dlNzdjFxd2NYaEZ6VEs0MWVLU3c4?=
 =?utf-8?B?Q3RQSm1WQ25VTzlub2VpU2tHQldnVTBDUDM5a3FPZS9NUXcvcUdmUVNmUndF?=
 =?utf-8?B?RHdGemxTYkJVbm53Y25QVndzdERRK0lhbVRQZXFQRnExMzJkWkcvTTNoRzVS?=
 =?utf-8?B?U2RHL1RSSG8rRjhwUXorcS9yU2J4blc2VGFDejY4QXF5bXMvOGZTVVZrU3dD?=
 =?utf-8?B?dWJnSWRidy9qdkRNVDBEZEo0ZnBBWlYvR3M4dTJuL2sreEJiaFUzRGtMb0Fl?=
 =?utf-8?B?VmJSVzJYb3YwME5VaEJWYnUwelJWcTc0b2I4MmRncGFMWnFIV2E0a1cySW9P?=
 =?utf-8?B?aWtVUnN4SDQzeDhUT0Y2RVY1eVhpN3RyZ3FOZVhqTHZEaWYwWGJQbnBWSVE5?=
 =?utf-8?B?QVpRS3l3V1Jwa1dDMTF0Q25JRjdZRkR3NURCZHRTV3BsQVBtNElIbjNRZURi?=
 =?utf-8?B?Znc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E451F71AE094E4D8B11D4791161DCB8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5289.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cb8dc3-bf8d-425d-98d1-08dc94e91545
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 07:33:18.4733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jsalRKj4zgmRYocaeCPAbS/MvjvWs+xavPsCHgPGeApHGZTgrYx2AEtjSeKOzWoOMtsu8HcQE9w+AZb7R0blvjA4JpG2lvYurp/z44PnN9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133

T24gMjQuMDYuMjAyNCAyMjo0OSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMDM6MTM6
NDBQTSArMDMwMCwgQW5kcmVpIFNpbWlvbiB3cm90ZToNCj4+IFVwZGF0ZSByZWdleCBjaGVjayBh
bmQgYWRkIHBhdHRlcm4gdG8gbWF0Y2ggYm90aCBFRVBST01zLg0KPiANCj4gVGhlIHN1YmplY3Qg
aXMgd3JvbmcgYXMgJ2F0MjQnIGlzIG5vdCB0aGUgdmVuZG9yLg0KPg0KDQpNeSBtaXN0YWtlLiBJ
dCBuZWVkcyB0byBiZSBhdG1lbCwyNG1hYzAyZTQgYW5kIGF0bWVsLDI0bWFjMDJlNi4NCg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlaSBTaW1pb24gPGFuZHJlaS5zaW1pb25AbWljcm9jaGlw
LmNvbT4NCj4+IC0tLQ0KPj4gdjEgLT4gdjI6DQo+PiAtIGNoYW5nZSBwYXR0ZXIgaW50byAiXmF0
bWVsLCgyNChjfGNzfG1hYylbYS16MC05XSt8c3BkKSQiIHRvIGtlZXAgc2ltcGxlcg0KPj4gLS0t
DQo+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2VlcHJvbS9hdDI0LnlhbWwg
fCAxMCArKysrKysrLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2VlcHJvbS9hdDI0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZWVwcm9tL2F0MjQueWFtbA0KPj4gaW5kZXggM2MzNmNkMDUxMGRlLi5mOTE0Y2EzN2Nl
ZWEgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVw
cm9tL2F0MjQueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2VlcHJvbS9hdDI0LnlhbWwNCj4+IEBAIC0xOCw3ICsxOCw3IEBAIHNlbGVjdDoNCj4+ICAgIHBy
b3BlcnRpZXM6DQo+PiAgICAgIGNvbXBhdGlibGU6DQo+PiAgICAgICAgY29udGFpbnM6DQo+PiAt
ICAgICAgICBwYXR0ZXJuOiAiXmF0bWVsLCgyNChjfGNzfG1hYylbMC05XSt8c3BkKSQiDQo+PiAr
ICAgICAgICBwYXR0ZXJuOiAiXmF0bWVsLCgyNChjfGNzfG1hYylbYS16MC05XSt8c3BkKSQiDQo+
PiAgICByZXF1aXJlZDoNCj4+ICAgICAgLSBjb21wYXRpYmxlDQo+Pg0KPj4gQEAgLTM3LDggKzM3
LDggQEAgcHJvcGVydGllczoNCj4+ICAgICAgICAtIGFsbE9mOg0KPj4gICAgICAgICAgICAtIG1p
bkl0ZW1zOiAxDQo+PiAgICAgICAgICAgICAgaXRlbXM6DQo+PiAtICAgICAgICAgICAgICAtIHBh
dHRlcm46ICJeKGF0bWVsfGNhdGFseXN0fG1pY3JvY2hpcHxueHB8cmFtdHJvbnxyZW5lc2FzfHJv
aG18c3QpLCgyNChjfGNzfGxjfG1hYylbMC05XSt8c3BkKSQiDQo+PiAtICAgICAgICAgICAgICAt
IHBhdHRlcm46ICJeYXRtZWwsKDI0KGN8Y3N8bWFjKVswLTldK3xzcGQpJCINCj4+ICsgICAgICAg
ICAgICAgIC0gcGF0dGVybjogIl4oYXRtZWx8Y2F0YWx5c3R8bWljcm9jaGlwfG54cHxyYW10cm9u
fHJlbmVzYXN8cm9obXxzdCksKDI0KGN8Y3N8bGN8bWFjKVthLXowLTldK3xzcGQpJCINCj4+ICsg
ICAgICAgICAgICAgIC0gcGF0dGVybjogIl5hdG1lbCwoMjQoY3xjc3xtYWMpW2EtejAtOV0rfHNw
ZCkkIg0KPiANCj4gQXJlIHRoZXNlIGRldmljZXMgYXZhaWxhYmxlIGZyb20gbXVsdGlwbGUgdmVu
ZG9ycz8gSWYgbm90LCBJIHRoaW5rIEknZA0KPiBhZGQgc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJp
bmdzIHdpdGggdGhlIHJpZ2h0IHZlbmRvciByYXRoZXIgdGhhbiBhZGRpbmcNCj4gdG8gdGhpcyBw
YXR0ZXJuLiBJdCdzIHJhdGhlciBsb29zZWx5IGRlZmluZWQgYmVjYXVzZSB0aGF0J3Mgd2hhdCB3
YXMgaW4NCj4gdXNlIGFscmVhZHkuDQo+DQoNClNvLCB3b3VsZCB5b3UgbGlrZSBtZSB0byBrZWVw
IGhvdyBpdCB3YXMgYmVmb3JlOiAgIl5hdG1lbCwoMjQoY3xjc3xtYWMpWzAtOV0rfHNwZCkkIiBh
bmQgICJeKGF0bWVsfGNhdGFseXN0fG1pY3JvY2hpcHxueHB8cmFtdHJvbnxyZW5lc2FzfHJvaG18
c3QpLCgyNChjfGNzfGxjfG1hYylbMC05XSt8c3BkKSQiDQphbmQgdG8gYWRkIG9ubHk6IA0KLSBp
dGVtczoNCiBwYXR0ZXJuOiBtYWMwMmU0JA0KLSBpdGVtczoNCiBwYXR0ZXJuOiBtYWMwMmU2JA0K
Pw0KDQpPciB3b3VsZCB5b3UgbGlrZSBtZSB0byBhZGQgdG8gInRoZSBzcGVjaWFsIGNhc2VzIHRo
YXQgZG9uJ3QgY29uZm9ybSB0byB0aGUgYWJvdmUgcGF0dGVybi4gRWFjaCByZXF1aXJlcyBhIHN0
YW5kYXJkIGF0MjQgbW9kZWwgYXMgZmFsbGJhY2suIiAgYXJlYT8NCiANCj4gUm9iDQoNCkJlc3Qg
UmVnYXJkcywgDQpBbmRyZWkgU2ltaW9uDQoNCg0K

