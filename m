Return-Path: <linux-i2c+bounces-4519-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 776B391DC46
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 12:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F37C91F22ED6
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 10:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9413413DDA7;
	Mon,  1 Jul 2024 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="fF10NYNl";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="i0lP+o0S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3F785934;
	Mon,  1 Jul 2024 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.153.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719829221; cv=fail; b=i3SIF+/wsxBdNLv0bCx6baLCYiP0ml5DcaPFjUFBfTnOn00hSS3JFz/8xcCkXGnuU7wERPfuSfJw0iwzznmxGuRTTP5HUpP8E4U+dTYf5WwKAyR/jrFuHY7+Ufp3XrubG81WJNRZt36F/cl/CtFT1IAUJa2uaA1xSd0vrRSX1H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719829221; c=relaxed/simple;
	bh=8gXK9ZhD4z76TUGWEDEDlMpOwtQh0nhjA4sQgSJX2EM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gKFmAIqiLjnDd9GrCs+F0RsYclr7ck83E2aWfx0VBwcfxeFzg/BZei39v7NyCbQalGcsvfhHu5oADh8A8Xzpjm+8o/Wd2op6DxjffQrc7uB4jk6gmsD2lznyt4KZAWAbpjdyOUUoa5TqhGXynd/BWmZafb4+Stz4BTwCVaZuuNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=fF10NYNl; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=i0lP+o0S; arc=fail smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719829218; x=1751365218;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8gXK9ZhD4z76TUGWEDEDlMpOwtQh0nhjA4sQgSJX2EM=;
  b=fF10NYNl1xNX36Cz+a/cZjb62vHA4qMLPa2bmS0U0TvUjaeRKEWsH8iT
   8MelL4U0jaTeRUMCdjefpRdBKOYKthinLIUc8eCcHNDVpZV5mwAg5ciSp
   5Xvsunb/Jtb7vd/8pBINUJPP0k9HO1ptFiF4qzojMv2qd17sQN4o0kdHz
   D9IeQ1U0qHdRbmSwfNwEmRWdWmCfnpEAaU6fTm5u/DIDu8BbgW5rFhd+7
   I1J63tHjiVcLVnx5IJc0+uLEu9Pp/7FD/8+pBvrOxaVzUhn5bqp6aqCm9
   jt6+e2KZu6n0gYPND4MZsJU9Hm5T9o07sevwXtxpibwXIxSUFmk+gg9YT
   A==;
X-CSE-ConnectionGUID: DBNGPINUTM+2ITfMWNdolw==
X-CSE-MsgGUID: bXwUCMCDTm+SDif2K7WkIw==
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="31281798"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2024 03:20:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jul 2024 03:20:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Jul 2024 03:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+KEFGKGlUn4ymrJv6UyFZJtWvpbgxASJAUOtEzncRsdT/xJDEVfynpmdeg3QvCk64pkh2x/VyImEuQD8ZakRggkd3NEbJ1qaxclrieOCKIpHLqn4BVWiRevdMBT5PGmWB5DfvIPoXTQg1NBBHukW+jXjYHkhXHpk7SvP9/LXaRO+qvBiCaxOLAPQKU9RSlps8UK0c7zXuYFH54OJVm/HNvXoEAFJ+9ZL+1v+GHUys6lcUtXVkLovQ06pHL8Uwz5M7cAR/BPT33g9u5sxOruHuJUsYCQkfdlc3aSbOTE1/OfJGhqbrrZkfAK9Xivrk85fU9yu8tByrAiKOvoy7GY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gXK9ZhD4z76TUGWEDEDlMpOwtQh0nhjA4sQgSJX2EM=;
 b=IIM8KaMRPMmQZdOVDcW+DNDCB3RuY/UD0foX5r+KtsSYFFUmhviLOFndbYBbuv7CjlLfog0FqFMfabI3eCmLNblHvRhuh1+yAaCsA+gfcK7yoGpEtrcxh8IBQypVfjpywphmnBukK7CRPxeKo/ZqIUPlXoVmmNjiQZSvnnyhlYct9CpW31FU0QTsDy3Ugnd5WguVNXR/j3wLydw1hqCMdqJ9GPbezHWk1QLPqUcr4oIniQyofFao945Rm/qT0Acd+/L4uGs+lye3nZpHLRpLRrxtKvhCLfmR290bTUGERduyv74Dj1eLvkTN6cNRs3nUUKdXqVbCmzutIyG4+y7bdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gXK9ZhD4z76TUGWEDEDlMpOwtQh0nhjA4sQgSJX2EM=;
 b=i0lP+o0SHU08DiwenURYdCSxXtdYQge0ckizBW4JQGyDEZGbx8HPn4lMM1jF1OmY4nsdke3qVdL04Wrm2oBxYBnQYpAt2ggppsPh/DTuQYjVtGZaB+RDiN6k/OaFYCN7rRRgBux6qm+Q416nVjpkkZL4ItqBZHe+ytnaDp0cG2Pcemkz72NsCepn3vMev3M1StfKerhRz8tCf42CuVKPGZ97BWZBUsxswSq+xscg6EbpZ9chSSZFH6LD/AfC44nqIOuGkr82LRojAV64V0+XPjVo9eCR/h/1B2vemy1CpB4fxFAJ51ye4zg8yorQaTvN6/omcwLaWf+qjt/ruRWwYA==
Received: from BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 by DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 1 Jul
 2024 10:20:03 +0000
Received: from BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395]) by BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 10:20:03 +0000
From: <Andrei.Simion@microchip.com>
To: <brgl@bgdev.pl>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<claudiu.beznea@microchip.com>
Subject: Re: [PATCH v3 1/3] eeprom: at24: avoid adjusting offset for
 24AA025E{48, 64}
Thread-Topic: [PATCH v3 1/3] eeprom: at24: avoid adjusting offset for
 24AA025E{48, 64}
Thread-Index: AQHayTGBv1mzh/dtb0KvO1vdxjAYGLHc2IiAgABg1ACAAAgwgIAEOxWAgAAXVgCAABohgA==
Date: Mon, 1 Jul 2024 10:20:03 +0000
Message-ID: <dbba7a80-dc91-4685-bb62-34503eed1a02@microchip.com>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
 <20240628080146.49545-2-andrei.simion@microchip.com>
 <CAMRc=MeJyByMvcFT2aJDK87bz4=+UXEuMtQ4G4MZUAUt39SS1Q@mail.gmail.com>
 <67d3646f-1b84-4d2d-9e36-be898f13be90@microchip.com>
 <CAMRc=MeJM4LmczCbZ8bKytLZKY_mP=Q8eaUprLMmO8BYHecStw@mail.gmail.com>
 <c1b53308-d1d5-412b-9558-9f40dd237397@microchip.com>
 <CAMRc=Mewx0NAdFBX6hpes_oa62M_Jp=LtzAPK73tZv+tKxnScA@mail.gmail.com>
In-Reply-To: <CAMRc=Mewx0NAdFBX6hpes_oa62M_Jp=LtzAPK73tZv+tKxnScA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5289:EE_|DM4PR11MB7183:EE_
x-ms-office365-filtering-correlation-id: 31dd1eaf-b147-49e4-396c-08dc99b75f20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MVZaSzdhSUJ1Y0hudTFQQk5DMC9BTDVtWjBNMWVSYWp6WlJEYmoxWXBEazdy?=
 =?utf-8?B?MVU1MFdPRC9hUmxvWHJGVHNVK2h6Y0tiSEpIVzQwalBCYzA5WFY2Q1BFbGlw?=
 =?utf-8?B?TjgrVWlSeFdUSDJnRnFIMmdtY3lENFJNSWFiK3h6RGpYMElrYTdsZFlDZ2U2?=
 =?utf-8?B?OUFOUnBHN2QrNzc3NzY4QU0wNldVdVQ4eE9TQkhtS2NRaHVkWjZqWHRsTEhX?=
 =?utf-8?B?bnBCT2JCTStYOTBZdE12RUthVG9PckJmVW5scHN1RVdxMnJsbC9JQnJTVmxO?=
 =?utf-8?B?amRGZ0h3L2thNWdUUk5oTk56aU1xSCtLUGoyZWZVMk41aGJVTmRkajBzemll?=
 =?utf-8?B?cEhpbnhtQnk2T2FwSGdja2R0TjV2aXlDczNnczdtMElKK0hTSGJhc0RwcW1r?=
 =?utf-8?B?Z1lZQ3dUQUZVTnhaNnhwTWZGaThoVmlqV0NQbFJhdGpZYTJYZ3hvSmRqOU5B?=
 =?utf-8?B?cmhsSDRMdkpLK1MwUU95RTFoUVcwWFZmNmdNSjhnR2pQSE5kM0ZCV1c1NHYv?=
 =?utf-8?B?Ynd0Sk1ZVGp0MVltc1ZiYVFjMkJmdUlTU1RSSlBBdDlWb0RBYjNyeEtvdzFt?=
 =?utf-8?B?WkYvdHB5R3ZTSWgza3VyaWZlR3F0Y2xzbjJsUXRCOFp0alE5b21WQXJUdFla?=
 =?utf-8?B?N1hmV3RyOXpJSmdKZ2hIeVg2QmhuUkFhSlk0S2N4NEdnbTF0ait6UU5oT1RL?=
 =?utf-8?B?TklWME5VdXdmNVZvcC9lMjdkWVlmRDNUZUZhdkNrMTQzZVlFMUxiUnVVdDVB?=
 =?utf-8?B?QktRM2Z1d0ZwRkJWbE5XOFEvcmVqc1ROK0krcFdtSHdibVlraVhNZFRpbllI?=
 =?utf-8?B?V2syNC92Vkljc0wvb2pSNEV3SlN0YnhtQzZ2U2k5QklzZ210eWUxTWhmRjVy?=
 =?utf-8?B?ZHhkOGhLdU45TUpvZ28zV09DOFZtUWxta1V5c1V0NStsY2tkYytBN05RbVpj?=
 =?utf-8?B?YWVHTEJ4c0VnSjZScUhMM29SdkhxejY5eElWNDMzcW93bFdubUxiQ2VOZ1ox?=
 =?utf-8?B?akgvdEZRZ0xaTkdpUzBNbTd4OWl3bEljRzMxYnJPU1F4NVc1bkNOL0xUdmJL?=
 =?utf-8?B?NHowNTZ5RGYrOEhXdzM5MmViVnVvcDFISzhxS28xbHVBY20vVWxCcGVUU2JO?=
 =?utf-8?B?UDU4SkdxVFBxd29zK0xXMGVYRC9LeVdXTzBVZFJ3eUJyekhDTXN6WDJXajhV?=
 =?utf-8?B?ekVrWGhXQWUwTFVVL3lMZ0NrQjFFUXZIZGVQUVcvdEVRa1ZQQmVkcHlxckN0?=
 =?utf-8?B?a284ZWFhN0RpRzdhZzl4ZWQzVFA5NVVJZG5CR1JPWEhWRURPb282ZHAyYlgz?=
 =?utf-8?B?NXR5V0FQTmpTRVBuaXEzLzhZbUd6bjZtckdTWDN0QkZpQjlyZ0xaQjhFN3E3?=
 =?utf-8?B?QzkwTWl2RmNtWjA3QTNORHFBNHg1b0dWc1AvSThhVHdqY0hrcERQeXBqOUtF?=
 =?utf-8?B?TE1wbDI1WlVsMWp1MlRyU0Q1R0lJS1JKcko3R2IzZnpvWkQ4TXhMc1NINjNk?=
 =?utf-8?B?alNqSnBTamQzRFN2Wk03ZDBROUhNY0Z4bXgvUXRHekxSekRSMUpyN0Y5c0R5?=
 =?utf-8?B?cVA2L1dNaTdIQ2VhSmVzZ1lOMktuek00RlU2VVRSS08xQ04yMGgvMkVVSU9Q?=
 =?utf-8?B?bDVXVzFWVi9wSzlraGVTUXZSUGFUaTdYY2pEckhPYWExMlFNNTZESkNZdnNt?=
 =?utf-8?B?eXpsMDBvNnJnRWx4VVRjV2NwNkVEMTlMaDlhVitubEZLbHhPQ25Hc3hENTl0?=
 =?utf-8?B?dUxsL0JPcFBXcW5CSzZjSWhzYkdIYVpOVk1EM3ozYnlvbC9RbzBPNU5DU3da?=
 =?utf-8?B?bXFUWlEvRURFNE9Pd2RZcFk1bjUyOFRyVDNUdW9hSzh3YmRXWU04YWNPcGZE?=
 =?utf-8?B?R05rWVJ5ZVlGZm9mcld1enhxZWM0Mi8wSEtvS09kWkxwWlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5289.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEVKYWJNL1E2M250MUhJNmtMQ1hXV0FkdVE5OVE0aEk1YmxRVjJTNmNvckd3?=
 =?utf-8?B?MzBGYTZPY1VXa21DVURNZ21ucHpNeG9wTlJxeTNleFdEVk9RVXE5dXhWcWJi?=
 =?utf-8?B?NjFOVitMVytldnM2ZXlIN0hXRDdqQ2VEWlJpeTJRSjFHZitzRHRidG9CWDlR?=
 =?utf-8?B?bGNkbUdQUCtEek9raFVseG5qalpJTE91bmRUekpMbzU3WmFVcXYzQ2gyOGlH?=
 =?utf-8?B?S1phTlpZUTdxMitVMTh5Zkx2N0JFaitlRWdGMkdWY090eWR5S2hsU2ZVblh6?=
 =?utf-8?B?SXFPWTI1eUkrZWpMSi92aXh4bkpCdW9hYWMyZzN6WEUrZXRzWC9ncFNSZ2M0?=
 =?utf-8?B?ZlVTY1NodEFtNVNUcWpRb0ZOMktTdEh0YkFwNjZXNHFyNnJGRE1TMkhMSlVC?=
 =?utf-8?B?a1BWaHgyVkpqWUZ6YVZmRThIdkRSQjVMdWo5aHZpU2drbzFhZjA3VXZpaXoz?=
 =?utf-8?B?VlNMUEVyYmRwRE85MlYxQzRtM1ZsTUJGakpFUERIeHZ4c1prTWE5eXdiZkxs?=
 =?utf-8?B?QUNVZDAvcDF2MW9MYTdjRC9MMzNpWVBBYlk4aVc4U3FkSUNCU1RYM2xQdlY0?=
 =?utf-8?B?bTJTM2NxRWJ5dlhGMThMSlRKR2ZuR0NwSzRLTS9VdHUvWDhZTmtjaGwxNHIy?=
 =?utf-8?B?ZG84N3B3TUVwWHNVejNZVXRqRktJbEpoMkZDdm5sbm5RYjNVU3l5cXJkM21q?=
 =?utf-8?B?cjc1K0dlR212YmFJUE9zbXZWR296cjRMVExranRZcXN0TUtJM0tzd0IzUGpR?=
 =?utf-8?B?VFgwWkg0djZVeldud3Axb0NYTDk5bU1HSW5FNkJEU042T2NTMjdWVDZmTFFF?=
 =?utf-8?B?UGVGUFFrL1c4SWlIdDcxOGlBY0Mzbi9iNHpEeDlxWGFPWEJtZVZMakk1Misx?=
 =?utf-8?B?WjNkcHM5SC9lMzNLSmlQOTZTNHR1aTBDdFhoNFgxV0N5aHRwT3dOck94SDJW?=
 =?utf-8?B?RzJySGF1aG53VGwrcjZWUlc3SjFWODkxMkl0eVJrOUJVY3BLOUVYc2ZPeVFy?=
 =?utf-8?B?bExGRlppL1RmQTVacWdLaDgvMFNRclRnQXJtcURreHFpZGhwZVhIMDVPUTFN?=
 =?utf-8?B?akQ4RFZnek5sTjI0dTg1ZTVUcmtaV1ZudSs3Uy9kQnlCUkpRd1dZOHMzNFc0?=
 =?utf-8?B?QXRHdHAyakh6WGNMTHhYdFJiK2FGWExFd2w3aUpQVXc5WExrVHd1cUswMTZ6?=
 =?utf-8?B?Y3o1WTNmbGxNMllseVBScWh3VnBsUFBiS1pVanBRaVJqSVh4SzZ5VU5HdWcr?=
 =?utf-8?B?cHQxWUNtdUw2VFYvQlZQT2hEMzZ5eHIyOUthenAwVkhKdWNzRGVOR3laV0tZ?=
 =?utf-8?B?dWk3MHBGMExHR3F5eFo2MUVNTUJJSEIxSG5Dek5NejgrLzcrRFFUdVN5cnFi?=
 =?utf-8?B?RzJkbkZVQVB0U3lDRTd0WXNFRStmVEw2MjQ5Z25UVXlNbjlxaE1LbEZQdzRq?=
 =?utf-8?B?V3VMemtXUGJCdXd6SVl4RkF5SW5mbzB3U29CYUZzblk3T29Ic1gxbEZxdE4w?=
 =?utf-8?B?OTJ2azluaFV6Sis0OVZvZUZhbVdjT3FaR2lGbDBCd096bHRycEtWUTlFb0xV?=
 =?utf-8?B?K1hQVjZabS9XK2pCbVFBclJXQ01Sbmt2d2dVSUdCQTZuUlhmVXhqdEY4NVZl?=
 =?utf-8?B?UEQ2cDczRS9KNE42Nm14d2VpSTZJK3dkWXM3OHZBa01PSEcwTDUvbm56V3Yx?=
 =?utf-8?B?UTk4Vm9GNXpQREZwTytKRlFRb0tOMU1DaG94VXJqTDZ4a1djazJHUWppc3Zr?=
 =?utf-8?B?TW52bFBiWUtTOU84TWorU2poSVcrYjhTY2ZOaVcxVVRycWpBNUZoeHVjbzZ3?=
 =?utf-8?B?QUVlb1ZsUkhUc3h1eUs2MEdNUjByd3NFZlRBeUFvNU5vYVY0Z3N3YytXU1pu?=
 =?utf-8?B?dmhVVkpRSDVwUVhIemtEbkgrQzlmVmhBMjR5bnN6eE1odXVVeW9CTUYvT3pi?=
 =?utf-8?B?RTRCMWMxZHFBaFovZEdyVzBRdSticldPQjRCMDRWRHZiZG9tSlkvKzVkdjZ3?=
 =?utf-8?B?Z2JCenlzUnJjQ2MrczVsbE43a2ZOZ2w5VlIvRHFTdVN6TWY4TkxVM1Btd2U2?=
 =?utf-8?B?MGVxQ3dSZDEzOGFnN3NCOVJpYkVHRS9odCsrV1dDdEthSjY3YXZxSWpmcmZD?=
 =?utf-8?B?VU5VZ1RrdjBRaWlPUjk4MWRqaDV6S1R1VmFLMVk1YXNZZnFsckNnZ3BPZDhn?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F39A8A1DDA48C34483234FB314C2C126@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5289.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31dd1eaf-b147-49e4-396c-08dc99b75f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 10:20:03.3349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I539op+MpgwA2/NZmkRsav8mcJy7FZmkfMlOoj52Z5wL7squTQuptzwe4qwL2frA4wTjtULjtD6DlbiJh8AQo/9cd3wpuFfLokakubMn2mM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7183

T24gMDEuMDcuMjAyNCAxMTo0NiwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBNb24sIEp1bCAxLCAyMDI0IGF0
IDk6MjPigK9BTSA8QW5kcmVpLlNpbWlvbkBtaWNyb2NoaXAuY29tPiB3cm90ZToNCj4+DQo+Pj4+
DQo+Pj4+IEZvciB0aG9zZSB0eXBlcyBvZiBlZXByb20gMjRBQTAyNUV7NDgsIDY0fSBhZGp1c3Rp
bmcgb2Zmc2V0IGlzIG5vdCByZXF1aXJlZCAoYXQyNF9nZXRfb2Zmc2V0X2FkaigpKS4NCj4+Pj4g
U28sIGluZGVlZCwgaXQgaXMgYW4gZW50YW5nbGVtZW50IGluIGxvZ2ljLg0KPj4+PiBUbyBrZWVw
IHRoZSBpbXBsZW1lbnRhdGlvbiBhcyBpdCBpczoNCj4+Pj4gYWRqb2ZmICh3aGljaCBpcyBhIGZs
YWcgdGhhdCBpbmRpY2F0ZXMgd2hlbiB0byB1c2UgdGhlIGFkanVzdGluZyBvZmZzZXQpIG5lZWRz
IHRvIGJlIDEgZm9yIG9sZCBjb21wYXRpYmxlcyBidXQgZm9yIHRoZXNlIG5ldyBvbmVzIG5lZWRz
IHRvIGJlIDAuDQo+Pj4+DQo+Pj4+IEkgdGhpbmsgdGhhdCBpcyBlbm91Z2ggbm90IHRvIGJyZWFr
IHRoZSBleGlzdGluZyB1c2Vycy4gV2hhdCBhcmUgeW91ciB0aG91Z2h0cz8NCj4+Pj4NCj4+Pg0K
Pj4+IFdhaXQuLi4gaXMgdGhlIGFkam9mZiBmaWVsZCBlZmZlY3RpdmVseSBhIGJvb2xlYW4/IFdo
eSB1OD8NCj4+Pg0KPj4NCj4+IHN0cnVjdCBhdDI0X2RhdGEgY29udGFpbnMgb2Zmc2V0X2FkaiB3
aGljaCB3aWxsIGdldCB2YWx1ZSBjYWxsaW5nIGF0MjRfZ2V0X29mZnNldF9hZGooKSkgaWYgYWRq
b2ZmIGlzIHRydWUgKDEpLg0KPj4gWWVzLCBhZGpvZmYgbmVlZHMgdG8gYmUgdHJlYXRlZCBhcyBh
IGJvb2xlYW4uIEkgd2lsbCBjaGFuZ2UgaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4NCj4+DQo+IA0K
PiBObywgd2FpdC4gV2h5IGNhbid0IHlvdSBqdXN0IGRvOg0KPiANCj4gQVQyNF9DSElQX0RBVEEo
YXQyNF9kYXRhXzI0YWEwMjVlNDgsIDQ4IC8gOCwgQVQyNF9GTEFHX1JFQURPTkxZKTsNCj4gDQo+
IGFuZCBhdm9pZCB0aGlzIHdob2xlIG5ldyBtYWNybyB2YXJpYW50IGVudGlyZWx5Pw0KPiANCg0K
anVzdCBBVDI0X0NISVBfREFUQShhdDI0X2RhdGFfMjRhYTAyNWU0OCwgNDggLyA4LCBBVDI0X0ZM
QUdfUkVBRE9OTFkpOg0KIyBoZXhkdW1wIC1DIC9zeXMvYnVzL252bWVtL2RldmljZXMvMS0wMDUz
Mi9jZWxscy9ldWk0OEBmYVwsMA0KMDAwMDAwMDAgIGZmIGZmIGZmIGZmIGZmIGZmICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfC4uLi4uLnwNCjAwMDAwMDA2DQojIGhleGR1bXAgLUMg
L3N5cy9idXMvbnZtZW0vZGV2aWNlcy8xLTAwNTIxL2NlbGxzL2V1aTQ4QGZhXCwwDQowMDAwMDAw
MCAgZmYgZmYgZmYgZmYgZmYgZmYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8Li4u
Li4ufA0KMDAwMDAwMDYNCg0Kd2l0aCB0aGlzIHBhdGNoIChhZGpvZmYgZmFsc2UgYW5kIG5ldyBt
YWNybykNCiMgaGV4ZHVtcCAtQyAvc3lzL2J1cy9udm1lbS9kZXZpY2VzLzEtMDA1MjEvY2VsbHMv
ZXVpNDhAZmFcLDANCjAwMDAwMDAwICAwNCA5MSA2MiBbdGhlIHJlc3QgYnl0ZXNdICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfC4uYi4uLnwNCjAwMDAwMDA2DQojIGhleGR1bXAgLUMg
L3N5cy9idXMvbnZtZW0vZGV2aWNlcy8xLTAwNTMyL2NlbGxzL2V1aTQ4QGZhXCwwDQowMDAwMDAw
MCAgMDQgOTEgNjIgW3RoZSByZXN0IGJ5dGVzXSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwuLmIuLm18DQowMDAwMDAwNg0KIw0KDQo+IEJhcnQNCg0KLS0gDQpBbmRyZWkgU2ltaW9u
DQpNUFUzMiBFbmdpbmVlcnxNaWNyb2NoaXAgVGVjaG5vbG9neSBJbmMuDQoNCg==

