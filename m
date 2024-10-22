Return-Path: <linux-i2c+bounces-7497-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C6D9A9557
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 03:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E324B22933
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 01:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AA9126BFA;
	Tue, 22 Oct 2024 01:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="yXaZEwF/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com [216.71.156.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9D85C5E;
	Tue, 22 Oct 2024 01:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.156.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729559670; cv=fail; b=eB5+HJZL+3Kdd+awaJqDHxJ49Q1n3dK/myB4E7aTIwxaOKro88TstrlMYAuXrN6MVbMbtZGsGAEj/nvypIfM6sW/V9psQ4WgkOMMeirBpTF/OxTtUX1PZ2OiK1oeK7qCWI4xvs3RU2iYdndPhUrF7UZ13930QrIda7lM1bkz9pA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729559670; c=relaxed/simple;
	bh=sMscHTjIcYJAATDeoZMhfPsIgLED03sNZd9tVvz5L2E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sOilyY8tvI6cHvQ0gP+aa7buOnuTZijwwsZaXRr85PtqfYOjTyuwdXhafXvs4SEbfA3e2HL3BF7lI39WCQMSTqd3nc4ud0vtqiG92vP7vNw7rNeiBlnfIh4ojHnGhuhFbdsVcGlOnRKXLBhEcqMG/1yjcgOawHGvEQ5aUDd7I8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=yXaZEwF/; arc=fail smtp.client-ip=216.71.156.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1729559668; x=1761095668;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sMscHTjIcYJAATDeoZMhfPsIgLED03sNZd9tVvz5L2E=;
  b=yXaZEwF/laeJRmGgmgt9vqWJv0bSkOvQc+VuLUIWhNwu4Gi03gsbgnYG
   NbqYnY8qV7JtBQ2ITZM77p/9fpyJdPK9ukIOVPDhgyfUjm8DHKmL2WnA0
   pU1QvFF/8J1EJs57noqUcNgmDrSkLUbspD+BIkhyOd9Ve6SXiR1e2/OZJ
   RfBw47bTv/48ztLsx643/2nhMKebrIujz3tUTVUuYo+2rXUSpPm5O21JG
   Q9f3kUO7wMitjVto4YtHWCCA57Z0H4kqoyoF0X53Fm5WKGPfcJWfdWrUO
   EYU9MBuQD9c7bXloUhu503Llyz2OQ5VmQ6gMOLRi8RAr5KoFaueUWN4m6
   w==;
X-CSE-ConnectionGUID: /G1P2OTLQoqoEktvblWm8A==
X-CSE-MsgGUID: YmPBq8U2SzWy50yeEvviVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="135207650"
X-IronPort-AV: E=Sophos;i="6.11,221,1725289200"; 
   d="scan'208";a="135207650"
Received: from mail-japaneastazlp17010000.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.0])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 10:14:22 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANer4Y8cwxN+hE5WOe/sef+HoEbu3q70V9P73BoJFg933Run6hpHhDJ6fEq2XlSzA3S3KUf1LCDIgO7wFWZ4wyereWko1RQTzDSPRsKksrlxLdj9pJAa9ymUJY1y7XHDM8lBk1/eLkve2YpIhwdSgOFRws8QWnyR9f9QDqCbTgIJkQ7kO/hxiSJJgaaFHdLyaNB+fOYO31b0rX9QEXfgVXU/UOoQxWVFKbxre2A7MH5utWNhuuG3roInivfaI0XN9IcXVNUAuub0/6xEZJ/P4MY8fEeXOsnOEuaHtD9VYRuARroGHLY1eJktq3VbSChuHYu5lqJUiV1x2p+c3Kwy0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYrBt3329lyUckGKDUCGs+fV6n5OE3hkBtjd7Lidnpg=;
 b=GV+M2HdtnSdYobndlHVn9Ac5umZ8kipDb5hGkL/tY4GiCUiGRvEjIoF+BbQNBv7iz0TFAo7MxUCeigmIUaipcQMN3TUDqMIFFqHJwqqBJIDafOIvFj1XsfVOgPZB5KrcekfBMNaIQjCa/Iv/ZoBPW4Vp/LK0hZE9NbAA8vUIMQmRxsWOFCYsf4hkO+sJ25gHwL1LaY4q84UvrvRlXQagYpRDhjCS3bIveOJ4WR7ef4hPvJPer2a0MVLIUgbJIMJvvLHsUjUvVaZ+e2+ipSGZH0PWR5AmWC0NJ6zvxbsXGcznmTGAQRsXXlqd2X2YFTR8srIzXLmHSjLHuAgEKszkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com (2603:1096:604:12c::9)
 by OS7PR01MB11549.jpnprd01.prod.outlook.com (2603:1096:604:237::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Tue, 22 Oct
 2024 01:14:19 +0000
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe]) by OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 01:14:18 +0000
From: "Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com>
To: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>
CC: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi Shyti
	<andi.shyti@kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller on
 Fujitsu MONAKA
Thread-Topic: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller
 on Fujitsu MONAKA
Thread-Index: AQHbIQE+jLx5nBqtt06FYSQ4k1MgtLKMdDKAgARb1sCAABOggIABGCBA
Date: Tue, 22 Oct 2024 01:14:18 +0000
Message-ID:
 <OS3PR01MB6903405361060650429FAC2AD44C2@OS3PR01MB6903.jpnprd01.prod.outlook.com>
References: <20241018015826.2925075-1-fj5100bi@fujitsu.com>
 <ZxJXj3holsMIdnC2@smile.fi.intel.com>
 <OS3PR01MB6903FEFE0404D809D62D4628D4432@OS3PR01MB6903.jpnprd01.prod.outlook.com>
 <ZxYQDSCpo8n4g3jM@smile.fi.intel.com>
In-Reply-To: <ZxYQDSCpo8n4g3jM@smile.fi.intel.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=cad98daa-10c5-4ad5-82b5-9c66beb84b86;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2024-10-22T01:09:35Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6903:EE_|OS7PR01MB11549:EE_
x-ms-office365-filtering-correlation-id: c5ccad5e-6439-4013-0971-08dcf236da26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?UVIyODN2VFlOaThnQnBuZ1R0VTlxWnozWGt5Q3FoczhiNmhjOCtZNHdK?=
 =?iso-2022-jp?B?aWlzZ21KeStoRCtIbXI0U3M2U0RzZFBJRGdZUVY1TDd4ZVJGWlhYNGZL?=
 =?iso-2022-jp?B?RklQZnlVVkJ0MDJ4VEJiMWlUMGVBZHFFaWdJYmpkRnR1bnNMaHhZTTE0?=
 =?iso-2022-jp?B?cUtueVlzNHBNbVJnM1Y2Rnl1WnBBL2lMS3hKaEx1WUQ3QU56azZVRTg5?=
 =?iso-2022-jp?B?N3V5ZU0wdkNCY3k5eG1Bdjd2cGVEckRCWUpmL01CMThJOUM5ZU1GbXhz?=
 =?iso-2022-jp?B?ZzI5STJ2UW4xbHN0YU5VUmpZaXBBM0NMVExOaTd6aGFHL2pLVnZqalJH?=
 =?iso-2022-jp?B?UEpoTVlyVWhJTGVLMGoxUGNXVElNVUFDdTNDK2pGVzF5bkhXZG9OM0tC?=
 =?iso-2022-jp?B?MEJpU1gzMHMzelA4UldhUDZaUFExMDE5VHI2aWMzUGpmZWJpcFZ3MDYx?=
 =?iso-2022-jp?B?NnJ0UjhQajF6dnNFaVFJYVJYa1ZETWdUS3BISjdYRGhmaWg4NUdTUk0w?=
 =?iso-2022-jp?B?eDM2dkZMSUpjWHhSNWtWQmIvRkdxYWNJVTBTb1kvM1Z2WVVTb014RW1u?=
 =?iso-2022-jp?B?Nzd5MGdYdWpLV25BR2hJeUh4dUFlYjVGYmNOdXdOZGNCMHpuY2gvTXp3?=
 =?iso-2022-jp?B?YjVTclRXUzc5WXpBczB1WW11MWlZVWpwU0lwWjJGV3I5WE5vamtJSFdW?=
 =?iso-2022-jp?B?VWZQd0VUS2ZnRDVqNDE4blViSnBzUEppVFl5b3hCVlc1cmJiREFRTnlK?=
 =?iso-2022-jp?B?Z3ovb2dZN1N0S0lEWmFOVjAwNGVqQXN5QVBTajdVVVcyNFFHeDlWZ1ZV?=
 =?iso-2022-jp?B?U0J4V2ppMG0wNzBleUQxSFkvWFpxTGc2RkhlTS91U1o2WmhOOWNLWG1J?=
 =?iso-2022-jp?B?Z29TVjVsUDRkcWVRYkswcHliejhma3kwdklPMWVURE1ZbmxkMWdWNi9r?=
 =?iso-2022-jp?B?Vkh2dEZxbTJRTUlBc0VMSG1GRGFyb2N4ck5veDJRcnJudTRORjBaNVJO?=
 =?iso-2022-jp?B?QmltMTMwcjlQSUgwQVpqUzBUNW1uaml6YTAyd0xjQ2xma2N5b0hFOUM5?=
 =?iso-2022-jp?B?VlJiM1hkLzNsNUpHbXhLb1V2Qkg5aXFVcWplUXBMWmY4Z0FoSGtPN0U0?=
 =?iso-2022-jp?B?a0I2M3loZzFleTVicFlNczY4OTJma2lsN01SR1pXdzJHa2ZKNlZlS2Ix?=
 =?iso-2022-jp?B?WmE1bXdBd3lvNzhhd2FtZ1dpczl1MEtNSGJBanRtZWJ5WldBeDlHUy9K?=
 =?iso-2022-jp?B?VkZjeVl1TXRYcnlIVEo0cWkyRExEUlVIT0JGZGJ1a1RIMWM5M3pBakkz?=
 =?iso-2022-jp?B?S0gyeFJoYkdlUmg1OXZZODVhanV0TXEvcE84LzlxNWdaWW1GTkw0K1Fq?=
 =?iso-2022-jp?B?dnQxT0lmcmpWKzlSRFZqRlZrMDVDTmJpRFVlazFqL3dGS0F1RjJpWGtN?=
 =?iso-2022-jp?B?Vmt6aDVXdHFqd3VVcWNiM2c2Q3U2ZEN0RzI5U0F1cTlJWnZFdEY1amxr?=
 =?iso-2022-jp?B?REE1OHBkMjltYXJEWVZGQVg5YUN6b0c1cm11VmMrSmpORWF3SVBDZjNG?=
 =?iso-2022-jp?B?ZUtvbkYrWks0MjVpTE9TNmZGMW1DSTJ1RS90WWZsdXlCRGtQWFp1bkJq?=
 =?iso-2022-jp?B?R1ZBTFZNN2V1bEIxUVo3WmxYN0lQNlF2R3YvNHIyRStVSUR4R0VNZTNG?=
 =?iso-2022-jp?B?RVV3dHQ3KytoSUhqOVpPeXZaUUNodGQ0QmsvV1M0S1ZGZWxDRllZU0d5?=
 =?iso-2022-jp?B?T1ZpZ3cyQ21EOU5ldE44QVBiSjArTGlaSUJKZ3huMk84ajFPSzV3SlBF?=
 =?iso-2022-jp?B?RkNRRWwvTFFxT0ZxMExobTFxS3A4L3g2UzRBTHhpdUM2Y2ljR0F1Ukcx?=
 =?iso-2022-jp?B?cmlQd3VjMnlISmFycjQreSt2NWlIQ04rRXFrdjFtMm4zMG4xSW5FSGFx?=
 =?iso-2022-jp?B?UVpGSkdYU2g0WUV2cnY3ekdmdURFbVFpQ0NYZmVVY080OTZkaHoxelZ5?=
 =?iso-2022-jp?B?cmlLN1F2MEoyYjNVRU9VcUlEYU9qaEhVUUZ6M0s3K1kxSEg5bml3Rm5p?=
 =?iso-2022-jp?B?SkE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6903.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?VVRXVDFweEdDdDE1ci9FejkyTWVGT1hLNlFuRElQVzJ3NXFGTlRnTTEv?=
 =?iso-2022-jp?B?MkpyOUJSVG9vUE4wcVRuMEk3S2k4QnI4RWo2NWtiZXpUelFnWWJUbGRt?=
 =?iso-2022-jp?B?VzEwWVU1TExWSHBxZmYyelBKd1lwaFowSmZGTlNlK1B2QWR0a0xWRFM2?=
 =?iso-2022-jp?B?cENWNzlGRWJIRndVVW1CZ1I2VnVNeXRuRFFOZ2d5eGJsa1lZNTBkTWxW?=
 =?iso-2022-jp?B?L0txcWVWRXdqRFh6dXQvN01SUlJORDRzemlCU25MeDdwWTA0bmU1NmJr?=
 =?iso-2022-jp?B?TVFDbS9MTmlIY2s2ZXFnTFZwUU11bVpaa0lrRUFtaXlSVVA4UVU4SUlr?=
 =?iso-2022-jp?B?RmFHNFVMKzdtMEVVRjFyazlISjc4d2s2ajg2U2VSWkZtcEducCtjQVV2?=
 =?iso-2022-jp?B?S2FYVXBzZ1NTblpGZzB4RmRsWVlTWEtoYWt2RG5peVEwK1VGTGJVLzM0?=
 =?iso-2022-jp?B?MisrN1NIaDR1RytaZThxb2tiQm5UamRQWGJiQ2kxVkFzdVhFWG1EVklV?=
 =?iso-2022-jp?B?ckpzOS9TRkRXS2RDTHVtbENmNzc0S0NhelRhUmNrMmRDVnZWak5jSHlT?=
 =?iso-2022-jp?B?VkVBd01JQmV0c1B4Y2xRV0VaaUVrekJVaTl5N2h0MWQ5N29qY0o0VkM0?=
 =?iso-2022-jp?B?S3VuT2FCZy9icys3R0FUeHpDR2ZIYUZlK1dRVDBvV21wb3NHYmIraXFm?=
 =?iso-2022-jp?B?NWkxVGV4V3drVC96OVlIL1VnRGk1eEZyUEszQk1qTlYvbTA0ZnpmR0Jz?=
 =?iso-2022-jp?B?UVFQQjZ1aHF6d3VPZlFEdHRLZEtwMEJTYkpRcHFJTm9Bd00zSXdGeEh4?=
 =?iso-2022-jp?B?dHFGd0pIQ1ZmajE0V0VXandlNGY2VFd5cDliYmFnK1pjRnEvRW5rWE5y?=
 =?iso-2022-jp?B?UTQxMVZBeStwUVJFQmQ1REpTZnVuR2h0aWdyM1RvNjN4dk5UNUhMdEVx?=
 =?iso-2022-jp?B?REhybUJSTTl0eWcwSG0yakVXd04zSktsdGNrdEtpdXJsZHdVcHNLNGFm?=
 =?iso-2022-jp?B?YzVEVUVUTXR6cE16QUlYN2NYbm9oWEFZaFB3ekxXWVVmaVRVcWp1dXdO?=
 =?iso-2022-jp?B?a09hekp1c1lSR3pCUE1mYmI1eVNBWXN6anNFTW52dE83UTA3bVJuMjNL?=
 =?iso-2022-jp?B?Mmo3V0ZadytGb2kzbTByTTVzVE1PaEoxRGZIY0lmS3Z0UmtGMXFNYUNu?=
 =?iso-2022-jp?B?SlJjOGFpb3o3L1h3SlVHb04vbEpzWjY5UnpZMzBGUVRRZ0hoa3kvUzgw?=
 =?iso-2022-jp?B?Um9EZVFoMkFCRUFKZDY1ZzhIdno3WUtST2dkSFBqRENMUWxQY0NYeE9x?=
 =?iso-2022-jp?B?L2p0RHJ1MWpOYk5sQ0dTRk9VTkVQOS9RdWI4MWZaZnFpYkQ2Rysyekw4?=
 =?iso-2022-jp?B?bTlTZGFxdW1hSlBYa2NFUXMwQ1VrM1RNbzNLNEdFUEJFWDRKUzdpWm5j?=
 =?iso-2022-jp?B?TUl0SHh6Y1lIcVZiY3laSldyVURoNjZjcnhqUFlDTnhubFUvNXdpS3Rw?=
 =?iso-2022-jp?B?OU5CbTdJUFFGSHE1ODZEM0Rab1dCSzdoSzY4bkRCSjQxQVQxN0UvOGky?=
 =?iso-2022-jp?B?UHR0Z3o2V1VJV1h6SDBNdzRSUzBjOXlCNDJiZFBDLzNZcVdGTTV0TEVl?=
 =?iso-2022-jp?B?cWdoNHZaVndpNWJLRWl6NzNNTWVBNWZWYVlzSGJsSWNneGZ3QVRVUHVE?=
 =?iso-2022-jp?B?dlQvei8reE5KQjllTmNxV1NtbHZraDVBTGpJMmZSSWJwRVFRc2xoVGQz?=
 =?iso-2022-jp?B?aG1ZQmhVSG5ZWEZEQTZmMlVMMTB6TkdvTTkvZWlodFo4aXpvNjVHNHBX?=
 =?iso-2022-jp?B?dmRUdEhRSFlOZUp0Qk5yQngrOThSbkdsS05NTHB5UnY0Y2w4eGxvQjlS?=
 =?iso-2022-jp?B?WmQybkx0SkxrU0hHTFVVL0JoakI5UEFQcU1wT3drb3F5b2pEcEkrWFI5?=
 =?iso-2022-jp?B?WmxJd1RxZmtDNGF1SXY1Sm5CZGg2endDSXlYVzdVbFlpNXg5WFlGdUhz?=
 =?iso-2022-jp?B?ZWhJbllDcEIvWW5QZkxHMndKVkVrUDM4N3lNT1pmTldkUllWWG0yaEM5?=
 =?iso-2022-jp?B?Znd1RTBuVmVSakJNMGo0M2RNdmJhWGcwUlNBR2RlZFhjOFBNZ1VhZmh2?=
 =?iso-2022-jp?B?cHB1QWw4YUVSZjJqaVlFeDRTdHphV1BJNHh2cXRjdnJ6RmpudFkvbm9s?=
 =?iso-2022-jp?B?THlIdHR2QVlWOWlnam5ZRmtOa3hFTXNOdWdyb3pqVEExRG9HSmxlekEz?=
 =?iso-2022-jp?B?MS9JOHdTK1dKOUpJSGVxdlJjRXQyOHV1dmpvWTlIdEFtbHU3SUhtVXdM?=
 =?iso-2022-jp?B?cmM5SGkyV3lxVUs1TlRoc2tHOHdDR2hic0E9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+dZqQlDOC+dykcrpzTgeCE42sCBPUDvVAlnelzXkwraFLCM3Lan+RmdoR4XzSYl7HN5F1KoyopqhOvgMKYIxeGOxg0ft0ipE32ZURF4s16rvzJruY7j6+5gIFkM6TLNMH9q6UKj2LOojf9m71+HF33Y7393J7Cgn5TQZPkmdgtntMacKPNU5QvFixqm8HfR/tA/xv4NRJmBBrgbWwikE9naQ6m2gEs/AVYGfk56kN7W5hqj3/4nCfwKvyVjSGmAhSXZFCwTswH7ZVpc71WYoQq8OhoTwy6pmuiMbsBcaKs0z2/78vdLYKiSaDYRQpZitsJQTJcwQs3MRHVd4+dl2QzOH9prLNQTobd8OvKW0GYw2zlFFEUZT7zT8Lo3/iHGfkL2iT8UEitV8ibSeG6qYEqAcNECrgsPc8bEBlhUEt8XSBuCePWQo6R8p6dnB8oWj/nwakknjksIGOW7U2RWINN+HvYlBisb9AhWy4PvTIrUSlVybab35Sd85jGwhtIKlbwzq8cUiSFmocRqYzggJkfGi0+91+wz86BUFPW94FG+sxEr5F3vfppvvis7Mui9HIoLLYADZjuVFWOr97N6FI3Ko5xS1z1vUr+ifWaKEYlgPJa6QEX67ret7jd82tZkk
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6903.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ccad5e-6439-4013-0971-08dcf236da26
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 01:14:18.1726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HsF/Gl1BTYhzagwlj20MmPqdSklDIaV94AV57KrSqHd9Y0vYIJxGKZcI7/l0ELPPoFlbAOqnXiLPL2t9MiUxlFbbE/xP5Qs+Fri8rFyqkWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11549

Hi, Andy Shevchenko
Thanks for you review/comments.

> On Mon, Oct 21, 2024 at 07:22:55AM +0000, Yoshihiro Furudera (Fujitsu) wr=
ote:
> > > On Fri, Oct 18, 2024 at 01:58:26AM +0000, Yoshihiro Furudera wrote:
>=20
> ...
>=20
> > > Also please give more details:
> > > 1) is this ID already present in the wild
> > >    (in the products that one may just go and buy)?
> > > if so, mention the example of the product.
> >
> > Not available at this time.
> > It is planned to be implemented in the MONAKA server scheduled for
> > shipment in 2027.
>=20
> So, summarize that in a short sentence, like "This will be used in the MO=
NAKA
> server scheduled for shipment in 2027."

Understood.
I will be more careful in the future.

>=20
> > > 2) provide an excerpt from DSDT for the Device object that uses this =
_HID.
> >
> > The DSDT information obtained when verified using an in-house
> > simulator is presented below.
>=20
> Just strip it to the only significant parts, see below
>=20
>      Device (SMB0)
>      {
>          Name (_HID, "FUJI200B")  // _HID: Hardware ID
>          Name (_UID, Zero)  // _UID: Unique ID
>          ...
>          Name (_CRS, ResourceTemplate ()
>          {
>              Memory32Fixed (ReadWrite,
>                  0x2A4B0000,         // Address Base
>                  0x00010000,         // Address Length
>                  )
>              Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,=
, )
>              {
>                  0x00000159,
>              }
>          })
>          ...
>      }

Understood.

>=20
> ...
>=20
> Hmm... Why Device object is called SMB0, are you sure it's the correct on=
e?

We considered the string to be the most concise
representation of SMBus HC#0, given the general
constraint that object names should ideally be
four characters or less. We understood that,
unlike HID, SMBus object names are vendor-specific.

>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

Best Regards,
Yoshihiro Furudera

