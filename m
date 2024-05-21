Return-Path: <linux-i2c+bounces-3610-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9868CA89A
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 09:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 416D7281F69
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 07:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006D74D5BF;
	Tue, 21 May 2024 07:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b="hDZzKOVK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2096.outbound.protection.outlook.com [40.107.241.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C9250269;
	Tue, 21 May 2024 07:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716275569; cv=fail; b=IKvxeUX0ptfgGpjLaHljUFpn9qhmk1QdCaMEIz3M3AO1WPBjYID83mi83JbhuVtojPYcixACo6Kuv3XQITrjjdRwceRnipEUQicWOeeeSPRJmK3oxROPGkyYmMmuaJPyXLYZF0KWHfZfI33G0UhHeB+hgoI3y/83k1BN+FBpP2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716275569; c=relaxed/simple;
	bh=IYou0lNjyKxyM21pEk/Qeh83k8VLNLYsTaQOz0YZdTs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n7+Q21zcWIaSwPbfRre/Iw2R1Fux9ro+Xf8SMu1hp7qQPSi+ZJuDBycFJFkasfx6avrmwYR3BBKbDVGg99Z73QYZHfI7+6jKL+BgIn0CsvQslKet3GxXmqWLVr9aZZ8Np6iJBTNZkfqjY33R3UCReNX61c/eQFU8PIGlckClEXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk; spf=pass smtp.mailfrom=bang-olufsen.dk; dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b=hDZzKOVK; arc=fail smtp.client-ip=40.107.241.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bang-olufsen.dk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiKe2O6MFc+UoiiBtQD60rpH9BL74PhLmXfJ5ZwAHQVHvEoFkQyB4ejhQlsJhQ2bcnkJTjvBKaMaQZzjbhDa7+JMfiN1AQxbRUk+QMp5VRJ8ExZn9Xw4j9xp+3WMRA/7KgySknamXfMaFdMHu0nbMuxVpd1d9KfpoEWi68UI0dlc31S0TQXWOyyyYrYkGIobuLK2pFzuLdr3ZevxVviEseESJgH59r8TRa8rOb3xid7E+v+2v/S1foMJJ/lWN0Mor9nAyKiRe438zY0F0TBL9vKKvrjSEnLfdVYjauPSNTRyesFW2Loj8PLWgQptKMhTFdonCbzBZTjujcGx7Sb0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYou0lNjyKxyM21pEk/Qeh83k8VLNLYsTaQOz0YZdTs=;
 b=h55/oqrVOT+vuvFoXcPY2OT91P24Rdm4RGkiDZ1/f5OdGj6G/83cP35KVN1l6E5CyGieI9lxzi3PytUQEnppI77G5U3w29yYjFfATrDtjnZdHX/P94VsPpimV6CW4ci8LZIJflgHiaNwmlq1ig95eXySDirspHY73lOXj39d/G2+8yuq/tXupzR+6IQIN3b/cd722rvFfGcz1IB6ar939g5dWMTZ9D4GeWfKxVzkxPlOyVcda6sFKP79/tuRrWaGwWog+fGC2id36wjczxVSZNPDzoNOUhpQbcZoOiQkYTqP6mN52cl1FTG9FOp2TPsNivHjMV2Rw8Ujq/FIeRuhVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYou0lNjyKxyM21pEk/Qeh83k8VLNLYsTaQOz0YZdTs=;
 b=hDZzKOVKBJYJ9/+yU/PkPpMdW6L5K3jngcW/ItSuXHvYZ+zOCE4nSt7zrVCrshKW/8qVX2gIZwC14baE7+kutRTw9NnOosTdIKjmkXKG36e/SlekhIjJ9Vi7B1bGD8G+t5hb8P6cgpdMOVMAFBNtucUhunnZK/cKN083hF1EHOw=
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com (2603:10a6:20b:53e::20)
 by AS8PR03MB7046.eurprd03.prod.outlook.com (2603:10a6:20b:23e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17; Tue, 21 May
 2024 07:12:44 +0000
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014]) by AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014%5]) with mapi id 15.20.7611.013; Tue, 21 May 2024
 07:12:44 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <alvin@pqrs.dk>, Mark Brown
	<broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi Shyti
	<andi.shyti@kernel.org>, Saravana Kannan <saravanak@google.com>, Emil
 Abildgaard Svendsen <EMAS@bang-olufsen.dk>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 11/13] dt-bindings: a2b: add compatible string for
 Beosound Shape node
Thread-Topic: [PATCH 11/13] dt-bindings: a2b: add compatible string for
 Beosound Shape node
Thread-Index: AQHaqFx0M4SAA47ntkWqHGkuPrwvmrGeclcAgALZfQA=
Date: Tue, 21 May 2024 07:12:44 +0000
Message-ID: <3mt6nziqmdrwl34hmt7ilwy5m2x5mtraiokimn742whc5agtpv@3z2hmpc3mmeh>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
 <20240517-a2b-v1-11-b8647554c67b@bang-olufsen.dk>
 <2d311fd3-8d07-40df-bc91-e4df522efb99@kernel.org>
In-Reply-To: <2d311fd3-8d07-40df-bc91-e4df522efb99@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB8805:EE_|AS8PR03MB7046:EE_
x-ms-office365-filtering-correlation-id: b4e86dd5-ba10-4807-ea32-08dc79656989
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?M2FXRXprS0poQytHMEQ2TDlaWms4b0hzeTZYQzRsYXNESWNKRUtUS0xaWkF1?=
 =?utf-8?B?aE1Fdy82a1VjOTZTYmtEZFd5Y3VWSzhGTnc5ZStic0cyaFFUSWwvREdjK0xE?=
 =?utf-8?B?SlViR0ZiR1czYjd5bDZOQU10WkJVdlo4cFFhQjI0M1ZRUUpxZmx0K0xzMG5M?=
 =?utf-8?B?eGlLOGRCaXJJUGJoUnl2WHY4ZzdzNjh5MVNPdjNXcUtFTVdUVTlrZWQ1L3A3?=
 =?utf-8?B?eE41UTBSeDk3cHNjVGxzK2d1YnJ4KzBheDQxUzN6LytXRjdJempLOEg2M25l?=
 =?utf-8?B?T0hhNGtCemkxWkRDT3dTVXlYZ05pcUQzOEZycFVlalFuVmkyZUZ3MzVDU3Ra?=
 =?utf-8?B?NnpmMm4veTdlMEZ2b0dqSG5lYWVjaVFWWXJOWHYyWkJFNzdLaWNwT2VZbVdG?=
 =?utf-8?B?Y3MyNVJCdHlrbWNmdy9ndURka2ZON0JPcUREeWlhUkRUZmhaekdZOHhPVHJW?=
 =?utf-8?B?Q2FzWlFFSDAwVy94cTU1QmM0UHdJcTF1QSt6QlpkVHFkVHYrZ0d3ZkxCWlRj?=
 =?utf-8?B?N3MxUmxzSlJiVk9RYjBFbU5kOVcwaDRHS1FpcTZOazdvUDB5blAzckFjT3Zv?=
 =?utf-8?B?VXd0WThqQTFpMGpBRnZ1eDZBeGVySlk2SkpNUGtlSFBSblNZMDJsUFNPSExT?=
 =?utf-8?B?QisxZDJWaW4yM05yM09zanJFdmlENFljNFUvaEIwcGZUNWl6cFJVQWtrSm5p?=
 =?utf-8?B?VTNJYjJITHM1Rjc2SU50Zmh2NGJzRkt4RnhSMjE1c0JOUWJ2OXk2T3B5SkJz?=
 =?utf-8?B?Uy9raHZpRlFKWjdSQk1yM2lqQ0VERkdPZ1I0RDZRU292SzhSR1Q0Y0E0SGpE?=
 =?utf-8?B?YXc3YW9tVjFHenJiUUprenhORlNTeDRmZWpJcGVGR08rNXlBTkltMldScTNh?=
 =?utf-8?B?TUVLNDVhQnhyVGF6SjcxanZhVjk2eEJuWSs4Mnd0Ni9seUhDR3p6cTUyTHpN?=
 =?utf-8?B?Sk9WQWQ1QThwcmVlL0ZqUkFkU1NzSUpQOXJRTVhQb0xXbm1jMUZqL3M4SGow?=
 =?utf-8?B?enhTT0ZCVENLVW5wSEREWHowUXRKeGRoTnUvalZ3ODBORWhrM1ZvTUp1aDcy?=
 =?utf-8?B?eUV0V1pIcHVlQ2FIT1FUaWdaNG0xSkcrMFZEQ2NEdWJBTXdBc1JmKzJxODJl?=
 =?utf-8?B?S2JKcHIreGxYY3pUc3AwdWJrdFdKQzdwMzBhcmpRVzNiSFIxYTY1ZVhsUXFR?=
 =?utf-8?B?TzV2SHF2MzJSSWp5bWFOT0RoaGFyWGZITVFzeGlsOFl3VjMyUGQyLzdyaHZZ?=
 =?utf-8?B?eWlyS05kS1hpK3JGVEU2RTVrK3NMOU85dmlhTGgzSFpkTktFczFXT1lFckEw?=
 =?utf-8?B?QzYyVSttZGpqaVhxa2s5Z2ZkbVF3N0pQQ1ZVWHJzWlBONnpCM095NzZJMVg4?=
 =?utf-8?B?WDRERlBFYXdwTDk3TnQxSG9ESUJ4am5iY2FOdlZ5ald1Nlg2R3dzcExkcis0?=
 =?utf-8?B?RGh0dzk0YkxZKzhGMDl0MGY1UzZkMlp0cVhrbFUrY3ZIcWFTc0dSc3FLMXll?=
 =?utf-8?B?WW5tbXhZVjZ5WnNONisxajltS09pRXVNQ2ZEMFdCUWliR3ByeGdLMkNESFJG?=
 =?utf-8?B?aHNIbXdZYng4eWJrWjRPaDhyc1AzVkhIRHUrbnYwYnZmWmpnYkdqRUI3TFl0?=
 =?utf-8?B?MVlJdDNxR295cU5xWGw4ck0wN1JwL2xpMUJnUmVtMTFxUjFRZjhYc1Y1MXVB?=
 =?utf-8?B?UFU4ODhLUXVYdW1IaWR5NURDcWVvbko1ckw1Q3lHWkNnRXByUE5ONXNYTGdQ?=
 =?utf-8?B?d0RHRXUwUVM2REVzQ2ptR0VKREpJeEZJNXA0ZG8wTFR6L2V2cU9mRGJlUXhs?=
 =?utf-8?B?NURtS3VxV2F0YzVTVWdGZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8805.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QVB1TVhrYnJodXpWUHN5STk1bjUzcElnUUhBWXV5bWpHNkRLRGs5TVBFQ3BR?=
 =?utf-8?B?d2llTUpFY242Nm53YWp3K3dkQnpEdTd6WmVQQ1l1bzRXSTRRdlFnM0VpYVpa?=
 =?utf-8?B?c3dYU2xJbC9ERmxXM2NLUm83bmRBYUdVcU52QTMrOVI4MEthZmpBNEc2Zlcx?=
 =?utf-8?B?VzJLZit0c25QZlRaNCs2Vko4K1N5YnExdkt0ZnJ4ank5bXovMWlBRHBxZWpO?=
 =?utf-8?B?Q3MwaE84Ry80bkJhNWVNb2ZoRXJFMmxuTWprZE9NNEtXRkZyUTU3TFg4a1lh?=
 =?utf-8?B?THI3MkMxdlFVbGF3dFNFdkUrOVI3bmpFSExrVkRpTC9SSmtuRC8zcXBkRnhu?=
 =?utf-8?B?SlZFYWQwdEVoSGVvaSsydEFweFRoODZ2WUVTb0sxV0dXcFdOUHp1aE5ZWi9Y?=
 =?utf-8?B?cFFZS1ZVM2s5Z3dFSGh4VFM5a2RWbUVCTmJJT214R2V3ODlOSzZLbVR5dEhR?=
 =?utf-8?B?YlhJcnlRdE4vSUp0RHVWOU1iWG1leXlvaVVXYjF5OS9ic0NQbDVNbW1XTStC?=
 =?utf-8?B?NWM2c2VQSXRXTFo1OWduSVQ3R0xZbDh3eWxyUTNkY0JZZUVIRisxTHlpcTBN?=
 =?utf-8?B?UjZhKzhZZUFLb1lUdmtrd2tCaTFzR3o1YlRZeTZNRm1SZ2k3dkxmRklKT2ZW?=
 =?utf-8?B?RGt4WUptQWQzNHNrTHNiZlVneUZsQ1FZZUpRby9RTU5ZckVIRlRpNHg2Q2hN?=
 =?utf-8?B?OE1NUStvenY2NG5nVWxrMDVmNUhBWjl0ZkVqeFJVQmQ4VzJBanlyNFBDTXMr?=
 =?utf-8?B?L0tQR2xEVldxcm9lY0daSEhZdW5IWXJGdm1hc1czaDE4enNxYnpMcHZPRGNW?=
 =?utf-8?B?czk0Wkt3RW1MT2tQck01VEZXcGNZYUNNU1E3SVFwdTRmeit4NVU1ZGRqaXNR?=
 =?utf-8?B?ZmhYdFdibGxQK1hoM2IwYndMclhxQ3lFTGpKejRQOGloQ2ZxdVVNcXJQa211?=
 =?utf-8?B?ZFdVWVRwYjFZcWJBZHg0aEhiODFHeU5JK25yS3RnNy9zV3BQdjdRTUtKZ1c1?=
 =?utf-8?B?eXBVejJlRi96WWRuVmxXOHBxN29XRmJtU1cwL1pKOTE5Yjk3RXNvRWdFajIw?=
 =?utf-8?B?U1lTMlphMVdzMEhYKzVxdld0UGI0TnZ2WUw4SVY2OHh6TnJDdk80VnBLSEhv?=
 =?utf-8?B?U3VRYXVsUWllVFFobGpPZyszT3pGT0xWQVk0RFVhVklFRitlN0MrU1ovV0pC?=
 =?utf-8?B?S1NVM3FuU3hSSzdleUdUV2t2OFJDNVBmdXFYMzlLMVhELyt2aW9wQkUvV2Vp?=
 =?utf-8?B?cUJtVTZZbTRwRjlsNWxSTENDZ3JTUldiSmFPZ3huZ1BlSlBtcFhJUGVmalJN?=
 =?utf-8?B?d2RjbWp2ekpVcG9LQ00zNDJib2NBUGJCRklHUUY1T2xLdzMrZ1FjTWc4OUVB?=
 =?utf-8?B?Q3dUSzBFbkcwWWpXVUZCMEpRQWdqdFpOeXZORkQ0bFVsU3Vja1RLZGpDb1pj?=
 =?utf-8?B?UXNxdHZWSDVxVElkbkFpU2VSamJZckdBeHg5c0hyTjVUVnVqVXl0OHpPcWlr?=
 =?utf-8?B?WDlyVk05dU5JNmY0aVZOZUIzemNseTVmYXJRZEg2SXZ1cmFjbXhMb0NYS1NZ?=
 =?utf-8?B?TFNTOW1HN0kyemY4ZFhjYWVMZk8zK2IyT3hnY0Jvb1puZ2NkNHFwQkl5eHF1?=
 =?utf-8?B?d2d6U3UxSHdYOFZ1bTZnUlZEVVl3YlNpL2F3UE1NUWNoeVIyNjFLUGdzZlRq?=
 =?utf-8?B?aHRyWVM4QTVPbHAwbXVOK0ZoYUQyemVkYThxcURkYjBURktrWnc1VGE3d2lz?=
 =?utf-8?B?cDY3WkIvVGhUOWRLYTZFTG9hUkVhczhnTFlsRW5QSTdUK1E1bkVtbWNNN0RH?=
 =?utf-8?B?dFlVeUtwK3pQSWRoTVJKTkJSS2pFbFJBaHkwWlJOWWFoL29GT2s3L3YxWUIr?=
 =?utf-8?B?VGRFTWRUN1gvbWRKZzQ3Y2ExbW5nakIxeGF6OWtuY1FKNGsyNDBhTFo4MElX?=
 =?utf-8?B?YzA4VGxoMm8rVDF6QjRZSVd1MFYyeXlqWDN1L012Y1ZSS3pzTmo5WVNQNW01?=
 =?utf-8?B?YTNOYmpoMXpQUVNCYmRGVlZSd1NwRlZGUy83alZUcE9BamNua3g2Y255NjY1?=
 =?utf-8?B?SGxUSUluemZnUjQ2dVV5Z2MxVHVpZ0ZOaThxNnRsMThWOG8wTHNLR0x4MlJD?=
 =?utf-8?B?aXVhM1pMVDNyQTRlUXRzMFRhay9aVm5DTHZ5VjhSbW4wZXM4S0h5U29HUDFn?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30029EC6D6470546806CB1EE5A272E97@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8805.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e86dd5-ba10-4807-ea32-08dc79656989
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 07:12:44.8960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /j+QBrw8nIqdZbykur3xYl/ydwshYnkg1bnQ1G7TsT+V6Rv5ycJHN6J0SecWs9rHfVJ+sUL+uw4rklIBXKd2GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7046

T24gU3VuLCBNYXkgMTksIDIwMjQgYXQgMDE6NDE6NDhQTSBHTVQsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6DQo+IE9uIDE3LzA1LzIwMjQgMTU6MDIsIEFsdmluIMWgaXByYWdhIHdyb3RlOg0K
PiA+IEZyb206IEFsdmluIMWgaXByYWdhIDxhbHNpQGJhbmctb2x1ZnNlbi5kaz4NCj4gPiANCj4g
PiBUaGUgQmVvc291bmQgU2hhcGUgaGFzIHRoZSBzYW1lIGRldmljZSB0cmVlIGJpbmRpbmdzIGFz
IGFuIEFEMjQyNSwgc28gaXQNCj4gPiBpcyBzdWZmaWNpZW50IHRvIGp1c3QgYWRkIGFuIGVudHJ5
IHRvIHRoZSBjb21wYXRpYmxlIGVudW0uDQo+IA0KPiA/IElmIGl0IGhhcyB0aGUgc2FtZSwgdGhl
biBkZXZpY2VzIGFyZSBjb21wYXRpYmxlIGJ1dCB5b3VyIGJpbmRpbmcgZGlkDQo+IG5vdCBleHBy
ZXNzIGl0Lg0KDQpPSywgeW91J3JlIGJhc2ljYWxseSBzYXlpbmcgSSBzaG91bGQgYWRkIGl0IGFs
bCBpbiBvbmUgcGF0Y2g/DQoNCj4gDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQWx2aW4gxaBp
cHJhZ2EgPGFsc2lAYmFuZy1vbHVmc2VuLmRrPg0KPiA+IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYTJiL2FkaSxhZDI0eHgueWFtbCB8IDEgKw0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2EyYi9hZGksYWQyNHh4LnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYTJiL2FkaSxhZDI0eHgueWFtbA0KPiA+IGluZGV4
IGRjZGExNWU4MDMyYS4uYmVhMjlmODhkNTM1IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hMmIvYWRpLGFkMjR4eC55YW1sDQo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2EyYi9hZGksYWQyNHh4LnlhbWwNCj4gPiBA
QCAtODEsNiArODEsNyBAQCBwYXR0ZXJuUHJvcGVydGllczoNCj4gPiAgICAgICAgICAgIC0gYWRp
LGFkMjQyNy1ub2RlDQo+ID4gICAgICAgICAgICAtIGFkaSxhZDI0Mjgtbm9kZQ0KPiA+ICAgICAg
ICAgICAgLSBhZGksYWQyNDI5LW5vZGUNCj4gPiArICAgICAgICAgIC0gYmVvLHNoYXBlLW5vZGUN
Cj4gDQo+IFlvdSBqdXN0IGFkZGVkIHRoaXMgYmluZGluZy4gQWRkIGVudGlyZSBiaW5kaW5nIGlu
IG9uZSBwYXRjaC4NCg0KaS5lLiB0aGlzPw0KDQpUaGFua3M=

