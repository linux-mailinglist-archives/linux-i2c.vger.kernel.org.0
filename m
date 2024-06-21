Return-Path: <linux-i2c+bounces-4224-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CB89128DF
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 17:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF6791F28531
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 15:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365C853363;
	Fri, 21 Jun 2024 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vE2Gqxya"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2079.outbound.protection.outlook.com [40.107.113.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318FA57C9A;
	Fri, 21 Jun 2024 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982303; cv=fail; b=IvUgPOcAbd60DQ/a8d0MIr71szXTGrkzyD2Wues0E/RUZ1HEUgHA7FXb6r/hoaKibJcHOuw0sDwUk6vnU6ZuVlUQv2N/S0wPCGy4t6gTGPAmQMHAj8Yp7PfwSRzTUx6tBmUN7BJ368qwleeVcVQ1RtWQ0Bc85P0i0A8rznh29NM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982303; c=relaxed/simple;
	bh=OVUHd5KZAZKasvXsQLEqglXVdp+Qeo2sEJ4NieoD7rQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qDc260C4ARntwtaq76bUcuxxU9DfgmqTHnTOYz/kRZnX7x85pbr1LULnYn3H1Q0y40y3260u/yPA99af+fWLD+4UF14Vccus+QuBlcoqrOWRk02eiqcp88CBrDYE9a8q45Tz5jeXAIVCh0d9oDpk4fM9u1IJj+VkVCRGIHHyFXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vE2Gqxya; arc=fail smtp.client-ip=40.107.113.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7r0rW/nIYGoz3PpkDYXlRZce1OQI6UNpCw/pNJYqRkvaJWbawrQfsjMs2CVed7vk846P/rwOJkJe46WTrBGMHgg7w0UN4LqXXp2P4EPpzHZAS8JNhIB4hx0u/dtC3U3AGCV9WwPOo/CKQ0TxbcbESSkp/Io/Wi71gavlu5kYyg/YC19wJrdd/Z5FUJEZWE4onm0oOdCClGLIXGPWLQgbKF8FMp1QzSr3F+IwMw7lWP72wYSFVaGmQHoTZh3B5Y9cfE2lAn2tZzuzk/2JovCuALYfxdE3/obg7Cd9IwzfH0u+FPRgmtx2hybxFQQsALeUrBhYgItxm4yHMhPdLkXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVUHd5KZAZKasvXsQLEqglXVdp+Qeo2sEJ4NieoD7rQ=;
 b=Kb24tqGZW651q6SDeMYNJby7ibzJSHhTfeDVc1ywPKnY65rFLIZFg0wbYxy+fQ9cldeKKRygPaZpWvwifc4iRsWHeEVyOb5hww4v1q5lwXoo/0K4YpXOEtYYpLtqtsiXeSZxcFgxE5U6xnD+zUEktCD2d9rGOZuMfDys/8mcOTK4Ld7sIKjVK7eUMpUlvYsvvNxJvqwlsEinHVtNo26aMtL16Y2Blvh8fSPezJmQObpuiH/CVhBY+Vj2EWOB6G92lJjallM78RPq6EaVXfFjzpU5cd6gI0zcOiJjmKRMwqxj6PoxmHRm3eUbMR0Znom10U2FzPJvNwtkJk7hp+pIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVUHd5KZAZKasvXsQLEqglXVdp+Qeo2sEJ4NieoD7rQ=;
 b=vE2GqxyagZa9H+f2C4QltwiUeELjbWAYri/nh686+RDzl4rCbbTG/paKDT2/KvbwcsbVU25BapCM7/wkAjbsjGtWHOx7cOjWLPBZ1Tlqn8QFumQBgOzCaxLkNKEXNmb/IEJqtzc+8TXapuvk5P6juSqV41zXobEQFfvG5muWa50=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB7005.jpnprd01.prod.outlook.com (2603:1096:400:d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.24; Fri, 21 Jun
 2024 15:04:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 15:04:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Chris Brandt
	<Chris.Brandt@renesas.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Thread-Topic: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Thread-Index:
 AQHaw83CoDfPceNxD0KOSNXxIs1DTLHSJmsggAAGUYCAAAAcwIAAAxiAgAAAHECAAAZ8gIAACYPggAAHhoCAAAGPAIAABnaAgAAA+tA=
Date: Fri, 21 Jun 2024 15:04:55 +0000
Message-ID:
 <TY3PR01MB113463388F0F9F6DF4573188986C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346105D3D3DD46AEF8CD44986C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <0bc78e5e-de37-4ff6-ac74-571f615b97f9@tuxon.dev>
 <TY3PR01MB1134602C189C6C63C6187840886C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <b5a3ef7c-8509-4065-ab0f-efb5a7e5fcbb@tuxon.dev>
 <TY3PR01MB11346D9CF89F7ED9B6A49C61586C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <e381e1c0-2e23-4734-a55f-cab6c21f8c5b@tuxon.dev>
 <TY3PR01MB113468EF895A0EBED5DBD975D86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <871c563d-daa5-4be4-b114-9a8072e4edd0@tuxon.dev>
 <TY3PR01MB113462C6C427DD4581086430D86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <86843e15-6791-4214-8eca-720142820973@tuxon.dev>
In-Reply-To: <86843e15-6791-4214-8eca-720142820973@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB7005:EE_
x-ms-office365-filtering-correlation-id: 2335beb1-6ad3-49e0-371e-08dc9203828e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|7416011|1800799021|376011|921017|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?TkJVZkd3RW5NaTcyaFJ5Y1pGc1NuY3JhMVRMYkNheHZMUmdWRjFLa3llNzNL?=
 =?utf-8?B?UlppRXBmUW15TFlNTVhQUmxCZjA2dWtOd3crQ084YldONTFTc3J2MmNmQm8v?=
 =?utf-8?B?c0tEQkkvcE1ubFFVZ0U4ZmJoRjQ2S25HZVJFdXExd2VFWEhJK3AzVTNFeXM1?=
 =?utf-8?B?Y2hsb2hXa2hqVi93a0dJbzhSYnREWWNRcFpyMCtYREc5ckFJZm9aeGt6dnZx?=
 =?utf-8?B?dmdjckw1ekR3OTJyVnp4T1IvcmF0VGdhSE5PVnMzNHlFT1V1Rk44TVpXbjY2?=
 =?utf-8?B?bXBiTU1mNWxoTFVNallZWU1nRkJwOEVVTy9mQkZkK21QYllVUVVnZk9uOHV5?=
 =?utf-8?B?WDN3amgzY0Rsb21mTmFGdGJmOXIzRTBVZzNJbno5ZzNKTUtWeUplOWJHcFkx?=
 =?utf-8?B?ejFCdkxXb1RrdVlzcko2QVVRNlhmV0Y2L3c3TUo1SE9GSXc1NUlZMnBTOEZq?=
 =?utf-8?B?SzFidERHUFlmU2V1Uis4cisrTzZVbXlQMnI0RjgzNkdYT0x6alFDdUJrSS91?=
 =?utf-8?B?V1hsdDZEWTNVWGlTTFAwVm9qL1QyVjZGRVptcExqQ3NJSDZQZUcvMHl5MTdx?=
 =?utf-8?B?RE53Q0xOcGNpOXhHaC85ZVhYMytFRGloZnozNkFCQWJVVkxQdWxVQ0MxUTg2?=
 =?utf-8?B?OUw0L2dzWHpCS2FHZmluZm9HTzJydkQvUm8yY3UvMUduR1VKMmNxcmFtZTFi?=
 =?utf-8?B?eGMrQ2dyZkp6WTlscGk0ZjJnc2xiNHdWTm54OTF6WHE2MXpkcW4wV0cxR1JS?=
 =?utf-8?B?WlBwNkY3YUtZalF5TWZ1c1pLcFJtRmQ3QkVheUxiZ1g4cDNtYUJTZ2VHejBD?=
 =?utf-8?B?cWRjWmQ4N1FrK0JZUERlSWNnODRVQ285NzVQVGxpL3RKUFdCYXY0NE9iY3B3?=
 =?utf-8?B?L1Q3N2UyUGRoVEdRSzJsbWMzRk1XODUvRFhpam9samR4d2g3QW1GblFCemxH?=
 =?utf-8?B?WnJHOTV4SjhoSks0dDRBbXhEVWxHcERUQXBma0huN3NDczZoUjIwSWlpV1cz?=
 =?utf-8?B?WkZOMmhaMlBEMjNyblpZNFl1VUNGcHhqd2d0amxNRU9SbFhmVnhKWjVkVkh6?=
 =?utf-8?B?QzR0MHQyOVVJaTh3cXlORmpXempMQ3luNDVEd3VnZ3czSEpXMmdJNWQrNHlj?=
 =?utf-8?B?U20rdTcrZmlxS0h2Vlp3eHVwVEFDZG9Takp0NlJ3NmtCbXdSVnFBZmQwaXRu?=
 =?utf-8?B?ZHVkVXRwcTFTVFpYYkJzS09BK09abFRlMnBKYU8rdTNTTTdBYnhqOE9SVExD?=
 =?utf-8?B?S1IzNnd1SzBHOUFNWjNIRk5nZTk3TDhWZkIrYnVZMnR5ZVVtRCtYV3hON0Fq?=
 =?utf-8?B?YkNIN0hQWlVRakx3Q2lSZ1piYmVjQWhwSjROeExhS2NhcC9hcktCOUNDWkhN?=
 =?utf-8?B?T2haLzBHOVIrbmhXZTFqanhFMDNTRFFBWUFvZnZ3YVJEc2VBVEYwLzExUFgy?=
 =?utf-8?B?ZmdIUFVIb0FHbDJFNWduSjh6cWVyb0k4UnV5b2EwVFp6M3lvK241SU5sL2dE?=
 =?utf-8?B?eWdMOGFIbHJEcnkwL3lLQkV3TzRML0FxMzZOVzNFWjBaSGlQcnlXbVVFR0tT?=
 =?utf-8?B?ODJxOHJnbm9SRVFjMVRTT1dvTFhIQlYrU21WTHdmWi9hUWxqZHUwNXhiZ1JO?=
 =?utf-8?B?Nm5Fems3d1d1RDZ0R3YvbEVCUVlUMk5GYkhBRHppWE9TTVJkT0FzUFgvcE5u?=
 =?utf-8?B?V3R5dDBRdnJjblVmc2l2QmtUbUwxVytUaWtuNE0wNjgxSVN3MjQxczJMQWli?=
 =?utf-8?B?aHk0N2dQVkxjdWRqMGpiQVBTN05ZZGQ1TVhTc0xtdmhaQ2Z1OE42aElrVTc0?=
 =?utf-8?B?bVI4TTNZZkpHS253Nk5pV2YxRXlScklrNmVUcEJYWUN6ZGZnL0src0poZkFh?=
 =?utf-8?Q?gnErUG4gh1IbX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(1800799021)(376011)(921017)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eE9RRUYvajcwNVBxOWFxOGljQWYyTHRPRFBqaUtZSFZkcE9nKzZMdXlmeGJR?=
 =?utf-8?B?L2EzdmZ1bW5SZXk1Z2tQZDhUZnN1UnY5djJXK2NrUDA0VVB3V1FNZmZWeHlQ?=
 =?utf-8?B?Q3lqcW1Zd09pQUkvb1VURDZMR1YxbDloc3hDekdqRHo3eHllT1A1cnNFRURP?=
 =?utf-8?B?K3RPZFU2dHNwbHFrVlFldzZPQTg0Y0VRbHN4UStldExxek4wKzVQRlB1Umoz?=
 =?utf-8?B?V3Q3b3lteHlWMWZOYlVLbVg5c3RRNGRvNUNsQ3dhQUxsR25xNlgvdjhDOEs0?=
 =?utf-8?B?cEZhQ2ZhQVZzamcrTzA4UlBqQTU3UjBTT2xYbDFQNW1oeUlQMndVWDhSOUNJ?=
 =?utf-8?B?ZGFORk5maWM1R2gwQmRQUVVLNmFNNlRadUwvdGs5b2hkVWI2dnNpbTZWWlRH?=
 =?utf-8?B?UjlyV1E3a2twYStPamVVT1BpSmc4dGpiRk9iTEFHSThwYWRxKzcyZ0dTZ1dq?=
 =?utf-8?B?ZmM5ams4Y3lmbDRBVFdWMHowY2VyWEprb0ttaHZ4a0JSRm1USVZWM2poWGdi?=
 =?utf-8?B?RkVwck80TVVHMmNwQ3dDczU1UXZrb1ZjVzY2eUY1b2RhSDF0cHhIN01XR09F?=
 =?utf-8?B?d2NiVlBvS216NVlnODI5UGJDeFliallFU3ZxY3A0WWozVmFjeWlJTHJidE9s?=
 =?utf-8?B?c2JvaHNRNk5PNm1tNGw1Y1hJc1hwbFVvZnU1Nm5DaG92OU5OQkhKak9ML3Fh?=
 =?utf-8?B?K0hHS0ZrbjRGZGhtc041Qzk1NHJHTnBZTU5nNkdWZ1FPS3NMTGhvWHJnV1gv?=
 =?utf-8?B?YUVTQWhhU0I2NDg3QU53SVNjekJEamJWYk91VDVKaTZ3Tzk3VU52c2Rtb3Ux?=
 =?utf-8?B?ZDNKQndGbVVISE5sNzZVUW10T1ZvcURDNHlXRGtHelVMUWxDdzA0ZE1OV2Rn?=
 =?utf-8?B?Si9KWmtSdE9lRzh4MEoyZUJMYUVRTXlWVE9weSsreitLaEhvMU9GT1llMlN6?=
 =?utf-8?B?djZpeGlOMy93RlVWVkkvMGxxbkpEZ0tlQkgySVQ4NHFxWFRpVlFUNklnYzZX?=
 =?utf-8?B?RURiUUZxOGZQZEVGNHp4TjE3SkNOdDk5Ym9xQ2VaeUlCN2F0VnJsL3k5TVA3?=
 =?utf-8?B?V0w4TktsMSt3M2RTMmNjVnlkL1Y2bHRhMkJCSjhDckVrZ09UT0lTcDVYMjUw?=
 =?utf-8?B?MUZXQ2EwRU1sZ3RhSlk3YmdVTzlZNkozYUc4NG9mYWw5QUtQSTYyMjRIdkZF?=
 =?utf-8?B?K3RzMDJsVzdFcFVrWWE4OU03dElzNmtqanBoUHZUUEVXZXdhUnBJNUFqYjlo?=
 =?utf-8?B?ZmVLZFFwYnIzOFhkamNRc3BmMjliNHF0bVpkZklucUdaZjBFZVV2NEtyUDVI?=
 =?utf-8?B?K3JZZk1xRnFETVkrVUtFYmFIdzQvZE4xZ2hibGZSVmE2TEFRczZRa25OUmQ2?=
 =?utf-8?B?cllyUUhDQ0ltSjhpYTIzTXJaT1BBMTRvWUI2ZGlONzA1Zk5UOFh1ODg4YmdD?=
 =?utf-8?B?U0t3U0pPYnVHa1o3UmhHaUR5bEZTQ0FJMW1TenhnTnRvZmtlNVJLRVRtd0Y3?=
 =?utf-8?B?ZzlBanVsTHlsUVVTMmEzT1kzVTBoYkhkUUVPcTRzYml1YzBTVmF6cG5ZWU9j?=
 =?utf-8?B?NjloUVpIcFExcmg2QWx4R2k4d2ViOWZmTWw0Q0U0T3hCM09sWlpqR3VBMDli?=
 =?utf-8?B?NEppcCt1bEdMQldoYW4wYTRxNEFTakJaQm5MZEo3U05HSUdKNWZtcGhvSEsw?=
 =?utf-8?B?aWx4TE0zbGZ3Yng1V3NkSXpKTklQUWllYy9LbVA4MG80Z21LczdxUXNWelFW?=
 =?utf-8?B?QzFRTnh6dTdiRXgvQ2Q3a21RZHdiUzZIQml0QWRDTFpYYzZLa0JSUTgyUXJT?=
 =?utf-8?B?NEpFcVhPb3R5MTd0T2Rpd0ZVazYyak53NzdqdWVPSmROL2hocGZEV0JkNFh4?=
 =?utf-8?B?djlCVE1NdkEvMm1JNTRrdGFpVTJnVTJxUmg4VS9qS1RhaitnaHRiMlBQcFZ4?=
 =?utf-8?B?UVhwRUdIY3ppMGxtcU52RHBEckdlRjZuSTFiM3VxYzcvMjlENVdZM1VNY0dh?=
 =?utf-8?B?TDhPdkxvRUhXQmNSTGI5bisvY0l3S3lyS0kzaS9URnpWa3hiMnUrRERNQmpn?=
 =?utf-8?B?anhzU3NjNnZMWlZ0TzNqbTVqNHpzdjZIemdaMXRFQXZrRHdCalJNSWFpeVph?=
 =?utf-8?B?TmNyWnJrMzR5V3c1dXY0QTR4RWo0VHhpRU1DbTNtT0QwTjkrQUhNa3NBNDRm?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2335beb1-6ad3-49e0-371e-08dc9203828e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 15:04:55.2652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iFmh2HjuvEs9qAYBwFcgwBjGvYGKE1bPUV8sdhvgl6LGATtjlLqaqtp8r2/QpD8CVaW5X7k6bMc5kZHW1mQxziEV+MAvGDouKqcDvFfLH84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7005

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2xhdWRpdSBiZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gU2VudDogRnJpZGF5LCBKdW5lIDIxLCAyMDI0
IDM6NTkgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwOC8xMl0gZHQtYmluZGluZ3M6IGkyYzog
cmVuZXNhcyxyaWljOiBEb2N1bWVudCB0aGUgUjlBMDhHMDQ1IHN1cHBvcnQNCj4gDQo+IA0KPiAN
Cj4gT24gMjEuMDYuMjAyNCAxNzozNywgQmlqdSBEYXMgd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBjbGF1ZGl1IGJlem5lYSA8Y2xh
dWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+PiBTZW50OiBGcmlkYXksIEp1bmUgMjEsIDIwMjQg
MzozMSBQTQ0KPiA+PiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsg
Q2hyaXMgQnJhbmR0DQo+ID4+IDxDaHJpcy5CcmFuZHRAcmVuZXNhcy5jb20+OyBhbmRpLnNoeXRp
QGtlcm5lbC5vcmc7IHJvYmhAa2VybmVsLm9yZzsNCj4gPj4ga3J6aytkdEBrZXJuZWwub3JnOyBj
b25vcitkdEBrZXJuZWwub3JnOw0KPiA+PiBnZWVydCtyZW5lc2FzQGdsaWRlci5iZTsgbWFnbnVz
LmRhbW1AZ21haWwuY29tOw0KPiA+PiBnZWVydCttdHVycXVldHRlQGJheWxpYnJlLmNvbTsgc2Jv
eWRAa2VybmVsLm9yZzsNCj4gPj4gcC56YWJlbEBwZW5ndXRyb25peC5kZTsgd3NhK3JlbmVzYXNA
c2FuZy1lbmdpbmVlcmluZy5jb20NCj4gPj4gQ2M6IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsNCj4gPj4gZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IGxpbnV4LWNs
a0B2Z2VyLmtlcm5lbC5vcmc7IENsYXVkaXUgQmV6bmVhDQo+ID4+IDxjbGF1ZGl1LmJlem5lYS51
akBicC5yZW5lc2FzLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAwOC8xMl0gZHQtYmlu
ZGluZ3M6IGkyYzogcmVuZXNhcyxyaWljOiBEb2N1bWVudA0KPiA+PiB0aGUgUjlBMDhHMDQ1IHN1
cHBvcnQNCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4gT24gMjEuMDYuMjAyNCAxNzowNiwgQmlqdSBE
YXMgd3JvdGU6DQo+ID4+PiBIaSBDbGF1ZGl1LA0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IGNsYXVkaXUgYmV6bmVhIDxjbGF1ZGl1LmJlem5l
YUB0dXhvbi5kZXY+DQo+ID4+Pj4gU2VudDogRnJpZGF5LCBKdW5lIDIxLCAyMDI0IDI6MzAgUE0N
Cj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIDA4LzEyXSBkdC1iaW5kaW5nczogaTJjOiByZW5l
c2FzLHJpaWM6IERvY3VtZW50DQo+ID4+Pj4gdGhlIFI5QTA4RzA0NSBzdXBwb3J0DQo+ID4+Pj4N
Cj4gPj4+Pg0KPiA+Pj4+DQo+ID4+Pj4gT24gMjEuMDYuMjAyNCAxNjoxMCwgQmlqdSBEYXMgd3Jv
dGU6DQo+ID4+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+Pj4+Pj4gRnJvbTogY2xhdWRpdSBiZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRl
dj4NCj4gPj4+Pj4+IFNlbnQ6IEZyaWRheSwgSnVuZSAyMSwgMjAyNCAyOjA2IFBNDQo+ID4+Pj4+
ICBTdWJqZWN0OiBSZTogW1BBVENIIDA4LzEyXSBkdC1iaW5kaW5nczogaTJjOiByZW5lc2FzLHJp
aWM6DQo+ID4+Pj4+IERvY3VtZW50IHRoZSBSOUEwOEcwNDUgc3VwcG9ydA0KPiA+Pj4+Pj4NCj4g
Pj4+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gT24gMjEuMDYuMjAyNCAxNTo1NiwgQmlqdSBEYXMg
d3JvdGU6DQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBIaSBjbGF1ZGl1LA0KPiA+Pj4+Pj4+DQo+ID4+
Pj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4+Pj4+IEZyb206IGNsYXVk
aXUgYmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+Pj4+Pj4+IFNlbnQ6IEZy
aWRheSwgSnVuZSAyMSwgMjAyNCAxOjU1IFBNDQo+ID4+Pj4+Pj4+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMDgvMTJdIGR0LWJpbmRpbmdzOiBpMmM6IHJlbmVzYXMscmlpYzoNCj4gPj4+Pj4+Pj4gRG9j
dW1lbnQgdGhlIFI5QTA4RzA0NSBzdXBwb3J0DQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+DQo+ID4+
Pj4+Pj4+DQo+ID4+Pj4+Pj4+IE9uIDIxLjA2LjIwMjQgMTU6MzQsIEJpanUgRGFzIHdyb3RlOg0K
PiA+Pj4+Pj4+Pj4gSGkgQ2xhdWRpdSwNCj4gPj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4+Pj4+PiBGcm9tOiBDbGF1ZGl1IDxjbGF1ZGl1
LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+Pj4+Pj4+Pj4gU2VudDogRnJpZGF5LCBKdW5lIDIxLCAy
MDI0IDEyOjIzIFBNDQo+ID4+Pj4+Pj4+Pj4gU3ViamVjdDogW1BBVENIIDA4LzEyXSBkdC1iaW5k
aW5nczogaTJjOiByZW5lc2FzLHJpaWM6DQo+ID4+Pj4+Pj4+Pj4gRG9jdW1lbnQgdGhlDQo+ID4+
Pj4+Pj4+Pj4gUjlBMDhHMDQ1IHN1cHBvcnQNCj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+IEZy
b206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4g
Pj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+IERvY3VtZW50IHRoZSBSZW5lc2FzIFJaL0czUyAoUjlB
MDhHMDQ1KSBSSUlDIElQLiBUaGlzIGlzDQo+ID4+Pj4+Pj4+Pj4gY29tcGF0aWJsZSB3aXRoIHRo
ZSB2ZXJzaW9uIGF2YWlsYWJsZSBvbiBSZW5lc2FzIFJaL1YySA0KPiA+Pj4+Pj4+Pj4+IChSOUEw
OUcwNzUpLiBNb3N0IG9mIHRoZSBJUCB2YXJpYW50cyB0aGF0IHRoZSBSSUlDIGRyaXZlciBpcw0K
PiA+Pj4+Pj4+Pj4+IHdvcmtpbmcgd2l0aCBzdXBwb3J0cyBmYXN0IG1vZGUNCj4gPj4+PiBwbHVz
Lg0KPiA+Pj4+Pj4+Pj4+IEhvd2V2ZXIsIGl0IGhhcHBlbnMgdGhhdCBvbiB0aGUgc2FtZSBTb0Mg
dG8gaGF2ZSBJUA0KPiA+Pj4+Pj4+Pj4+IGluc3RhdGlhdGlvbnMgdGhhdCBzdXBwb3J0IGZhc3Qg
bW9kZSBwbHVzIGFzIHdlbGwgYXMgSVANCj4gPj4+Pj4+Pj4+PiBpbnN0YW50aWF0aW9uIHRoYXQg
ZG9lc24ndCBzdXBwb3J0IGl0LiBGb3IgdGhpcywgaW50cm9kdWNlZA0KPiA+Pj4+Pj4+Pj4+IHRo
ZSByZW5lc2FzLHJpaWMtbm8tZmFzdC0NCj4gPj4gbW9kZS1wbHVzIHByb3BlcnR5Lg0KPiA+Pj4+
Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWENCj4gPj4+
Pj4+Pj4+PiA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+Pj4+Pj4+Pj4g
LS0tDQo+ID4+Pj4+Pj4+Pj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMv
cmVuZXNhcyxyaWljLnlhbWwgfCA4DQo+ID4+Pj4+Pj4+Pj4gKysrKysrKysNCj4gPj4+Pj4+Pj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiA+Pj4+Pj4+Pj4+DQo+ID4+Pj4+
Pj4+Pj4gZGlmZiAtLWdpdA0KPiA+Pj4+Pj4+Pj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2kyYy9yZW5lc2FzLHJpaWMueWFtbA0KPiA+Pj4+Pj4+Pj4+IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9yZW5lc2FzLHJpaWMueWFtbA0KPiA+Pj4+Pj4+
Pj4+IGluZGV4IDkxZWNmMTdiN2E4MS4uYzA5NjRlZGJjYTY5IDEwMDY0NA0KPiA+Pj4+Pj4+Pj4+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvcmVuZXNhcyxyaWlj
LnlhbWwNCj4gPj4+Pj4+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTJjL3JlbmVzYXMscmlpYy55YW1sDQo+ID4+Pj4+Pj4+Pj4gQEAgLTI1LDYgKzI1LDEwIEBA
IHByb3BlcnRpZXM6DQo+ID4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgLSByZW5lc2FzLHJpaWMt
cjlhMDdnMDU0ICAjIFJaL1YyTA0KPiA+Pj4+Pj4+Pj4+ICAgICAgICAgICAgLSBjb25zdDogcmVu
ZXNhcyxyaWljLXJ6ICAgICAgIyBSWi9BIG9yIFJaL0cyTA0KPiA+Pj4+Pj4+Pj4+DQo+ID4+Pj4+
Pj4+Pj4gKyAgICAgIC0gaXRlbXM6DQo+ID4+Pj4+Pj4+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBy
ZW5lc2FzLHJpaWMtcjlhMDhnMDQ1ICAgIyBSWi9HM1MNCj4gPj4+Pj4+Pj4+PiArICAgICAgICAg
IC0gY29uc3Q6IHJlbmVzYXMscmlpYy1yOWEwOWcwNTcNCj4gPj4+Pj4+Pj4+PiArDQo+ID4+Pj4+
Pj4+Pj4gICAgICAgIC0gY29uc3Q6IHJlbmVzYXMscmlpYy1yOWEwOWcwNTcgICAjIFJaL1YySChQ
KQ0KPiA+Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4gICAgcmVnOg0KPiA+Pj4+Pj4+Pj4+IEBAIC02
Niw2ICs3MCwxMCBAQCBwcm9wZXJ0aWVzOg0KPiA+Pj4+Pj4+Pj4+ICAgIHJlc2V0czoNCj4gPj4+
Pj4+Pj4+PiAgICAgIG1heEl0ZW1zOiAxDQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiArICBy
ZW5lc2FzLHJpaWMtbm8tZmFzdC1tb2RlLXBsdXM6DQo+ID4+Pj4+Pj4+Pj4gKyAgICBkZXNjcmlw
dGlvbjogc3BlY2lmaWVzIGlmIGZhc3QgbW9kZSBwbHVzIGlzIG5vdCBzdXBwb3J0ZWQNCj4gPj4+
Pj4+Pj4+PiArICAgIHR5cGU6IEJvb2xlYW4NCj4gPj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+PiBDYW4n
dCB0aGlzIGluZm8sIGFzIHBhcnQgb2YgZGV2aWNlIGRhdGE/PyBCYXNlZCBvbiBmcmVxdWVuY3kN
Cj4gPj4+Pj4+Pj4+IGFuZCBkZXZpY2UgZGF0YSBpcyBlbm91Z2ggdG8gZGVyaXZlIHRoaXMgaW5m
bz8/DQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IFdlIGNhbid0IHJlbHkgY29tcGxldGVseSBvbiBk
ZXZpY2UgZGF0YSBiZWNhdXNlIG9uIFJaL0czUyB3ZQ0KPiA+Pj4+Pj4+PiBoYXZlDQo+ID4+Pj4+
Pj4+IDIgUklJQyBjaGFubmVscyB0aGF0IHN1cHBvcnQgZmFzdCBtb2RlIHBsdXMgYW5kIDIgdGhh
dCBkb2Vzbid0IHN1cHBvcnQgaXQuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBDYW4ndCBhcnJheSBv
ZiBiaXRzIGZvciB0aGlzIGNoYW5uZWxzIHdvbid0IGhlbHA/Pw0KPiA+Pj4+Pj4NCj4gPj4+Pj4+
IENhbiB5b3UgZ2l2ZSBhbiBleGFtcGxlPyBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIGhvdyB5
b3Ugd291bGQNCj4gPj4+Pj4+IHByZWZlciBtZSB0byB1c2UgdGhlIGFycmF5IG9mIGJpdHMuDQo+
ID4+Pj4+DQo+ID4+Pj4+IHN0cnVjdCByaWljX29mX2RhdGEgew0KPiA+Pj4+PiAJdTggcmVnc1tS
SUlDX1JFR19FTkRdOw0KPiA+Pj4+PiAJdTE2IGZhc3RfbW9kZV9pbmZvIGluZm87IC8qIDEgbWVh
bnMgZmFzdCBtb2RlIHBsdXMgc3VwcG9ydGVkLA0KPiA+Pj4+PiBzdGFydGluZyB3aXRoIGNoYW5u
ZWwgMCovIH07DQo+ID4+Pj4+DQo+ID4+Pj4+IC5pbmZvID0gMHgzLCBtZWFucyBjaGFubmVsIDAg
YW5kIDEgaGFzIGZhc3QgbW9kZSBwbHVzIHN1cHBvcnRlZA0KPiA+Pj4+PiAuaW5mbyA9IDB4MCwg
bm9uZSBvZiB0aGUgY2hhbm5lbCBzdXBwb3J0ZWQgZmFzdCBtb2RlIHBsdXMuDQo+ID4+Pj4NCj4g
Pj4+PiBJZiBJIHVuZGVyc3RhbmQgdGhlIHByb3Bvc2FsIGNvcnJlY3RseSwgYSBtYXRjaCBiL3cg
c3RydWN0DQo+ID4+Pj4gcmlpY19vZl9kYXRhOjppbmZvIGJpdCArIGZyZXF1ZW5jeSBhbmQgdGhl
IG5vZGVzIGluIGRldmljZSB0cmVlIGlzDQo+ID4+Pj4gc3RpbGwgbmVlZGVkLCByaWdodD8gQXMg
dGhlIFJaL0czUyBSSUlDIGNoYW5uZWxzIGFyZSB1c2luZyB0aGUgc2FtZSBjb21wYXRpYmxlLg0K
PiA+Pj4+IFcvbyBhIG1hdGNoIGhvdyBJIGNhbm5vdCBkZXRlY3QgaW4gdGhlIGRyaXZlciB3aG8g
aXMsIGUuZy4sIGNoYW5uZWwNCj4gPj4+PiAxIHRoYXQgc3VwcG9ydHMgRk1QIHcvbyBoYXJkY29k
aW5nIHNvbWUgUklJQyBjaGFubmVsIGRhdGEgaW4gdGhlDQo+ID4+Pj4gZHJpdmVyIChlLmcuIFJJ
SUMgY2hhbm5lbA0KPiA+PiBhZGRyZXNzKT8NCj4gPj4+DQo+ID4+PiBiaXQgYXJyYXkgZ2l2ZXMg
dGhlIGNhcGFiaWxpdHkgaW5mbyBvbiB2YXJpb3VzIGNoYW5uZWxzLg0KPiA+Pj4NCj4gPj4+IElm
IHNvbWVvbmUgZGVmaW5lIGZhc3RfbW9kZV9wbHVzIGZyZXF1ZW5jeSBpbiBEVCBub2RlIGFuZCBj
aGFubmVsIGlzDQo+ID4+PiBub3QgZmFzdF9tb2RlX3BsdXMoZnJvbSB0aGUgY2FwYWJpbGl0eSBp
bmZvKSB0aGVuIHlvdSBzaG91bGQgcmV0dXJuIGVycm9yLg0KPiA+Pj4NCj4gPj4+IEhlcmUgeW91
IG5lZWQgdG8gdXNlIFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlIGFzIGVhY2ggU29DIGhhcyBkaWZm
ZXJlbnQgY2FwYWJpbGl0aWVzLg0KPiA+Pg0KPiA+PiBBbmQgSSB3b3VsZCBhZGQsIGFzIGl0IGlz
IGluIHRoaXMgY2FzZTogdGhlcmUgYXJlIG11bHRpcGxlIGluc3RhbnRpYXRpb24gb2YgdGhlIFJJ
SUMgaW4gUlovRzNTDQo+IFNvQy4NCj4gPj4gUklJQyAwIGFuZCAxIHN1cHBvcnRzIEZNUCwgUklJ
QyAyIGFuZCAzIGRvZXMgbm90Lg0KPiA+Pg0KPiA+PiBGb3IgYWxsIFJJSUNzICgwLCAxLCAyLCAz
KSB3ZSB1c2UgdGhlIHNhbWUgY29tcGF0aWJsZSAoYXMgYWxsIGFyZQ0KPiA+PiBwYXJ0IG9mIHRo
ZSBzYW1lIFNvQykuIEhvdyB0byBkbyB0aGUgbWF0Y2ggYi93IERUIFJJSUMgY2hhbm5lbCBhbmQN
Cj4gPj4gZHJpdmVyIHdpdGggdGhlIHNvbHV0aW9uIHlvdSBwcm9wb3NlIHcvbyBoYXJkY29kaW5n
IHNvbWUgUklJQyBjaGFubmVsIGRhdGEgaW4gdGhlIGRyaXZlcj8NCj4gPg0KPiA+IC5pbmZvID0w
eDMsIHNvIHlvdSBrbm93IGZyb20gdGhlIGNhcGFiaWxpdHksIGZvciB0aGlzIHNvYywgYnVzIDAg
YW5kIDEgc3VwcG9ydHMgRk1QLg0KPiANCj4gSSB1bmRlcnN0YW5kIHRoaXMgcGFydC4gV2hhdCBJ
IGRvbid0IHVuZGVyc3RhbmQgaXM6IHdoZW4gcHJvYmluZyB0aGUgZHJpdmVyIGZvciwgZS5nLiwg
YnVzIDAsIGhvdw0KPiBkbyBJIGtub3cgSSBwcm9iZSB0aGUgZHJpdmVyIGZvciBidXMgMD8gY29t
cGF0aWJsZSBpcyB0aGUgc2FtZSBmb3IgYWxsIGJ1c2VzLg0KDQpZb3UgYXJlIHJpZ2h0LiBJIG1p
c3NlZCB0aGlzIHBvaW50Lg0KDQpDaGVlcnMsDQpiaWp1DQo=

