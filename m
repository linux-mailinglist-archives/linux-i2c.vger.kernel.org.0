Return-Path: <linux-i2c+bounces-357-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58AF7F2179
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 00:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAC7DB2173C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 23:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AA63B2A7;
	Mon, 20 Nov 2023 23:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="U/PP47ES";
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="IbDIkbpZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com [67.231.159.91])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BD8C3
	for <linux-i2c@vger.kernel.org>; Mon, 20 Nov 2023 15:37:18 -0800 (PST)
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
	by mx0c-0054df01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AKJti77027413;
	Mon, 20 Nov 2023 18:36:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=selector2; bh=+51ISPeNkcI1CzO2537nwDrsMXIZ3/6CkdLjqqiIYX4=; b=
	U/PP47ESGIgEeDEvOON2kL2P3jztelSGes274KdLs3t/6iarEJzJWXDg2E1b6940
	vH8mPC37iFTg1EDe/COWBx//rxF7QXL0BfSHfo+ZAP/1ihPvqLOI3Ashw3oLHONQ
	hj7VgcOygKtFGLuvzIannAXkW8dvdI56MnBfo1Ka0267My/7U78vuFAdOsjH06vd
	G+uJ5EDerbUgXQ5GdFquh1Yc6bqNtuqZx+dpCiT8684qYr9O4A0qAppV1DYrDFbZ
	JEAPc1CYq2tnOg8T/zByGg+w8YZEjR2EG/86X/J1BUXpRXNUceC4On6ll7I8gtIl
	Cc1HD3agzUtvJobiEJ9wsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=selector1; bh=+51ISPeNkcI1CzO2537nwDrsMXIZ3/6CkdLjqqiIYX4=; b=
	IbDIkbpZxQBe5mmEmNHBAswkY7YcRlGVZEFf/qHq55FxHsYnwoLO1usc+u6DL8r/
	0yrVg+5Ro2LwzZc8yFFAlBQx0GsqG44ctaAe88Yt4pFsvzMk4a5NuhcCTcAaC6Cn
	j5q+5i7DqMcLE2yHiNh8jTVhV/tkmS0HytijfjarQKF9Q7qb8guwxKf7jOcbt8dl
	yuSgelbUsvHwnakbU0pgb7O00riDFZoqVO3NY3R8glgonchoEQnltVmpYFGX+Eps
	pYIeGEYK5l49yKPq414MEinA/pIhSHuVHEIinSJ3nOm/FFPz5yo4c3G3djifELXN
	bOVc2/Yv9JzPNqLAihYTmQ==
Received: from can01-yt3-obe.outbound.protection.outlook.com (mail-yt3can01lp2169.outbound.protection.outlook.com [104.47.75.169])
	by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3ues8xja08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 18:36:55 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKgJ+IDi7iO5X3BVhvoh8DC0GkWfr9Gz6NuXTINIALzMg7mBcPpeXUZ/sNyTN4Qb4gjIZXnfImf1hT+e4qMsZRvqCKnDHcOvQOR9q6R48KX/jkNac7i050SlReh6K35fVeGerJLU3Vr+YGgui9QTRtaZqZ5k2I0lucCwKINIkq4rFrTmwWmqq8Sjdu6UnwAIgt25q+yfLc2y9HmyEmJRrGVIxoSi+6i7fMKo4Go8ygTgtWhHQiW9THmAR2LDf7+dTgxefPVl2TTHbABRKaS6UKpPl9YdLpGI2hs3ZA5hy1cGRmsDysHl1rvyER+M1Id3OmK7I84//qSxRoRR+VLTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+51ISPeNkcI1CzO2537nwDrsMXIZ3/6CkdLjqqiIYX4=;
 b=GAUf8JlgaZLG585hgY32xsh1jhfGSPfg1NcnM2OT4z5T44octkmELWm6074mbrENeyEN3cpBBOwVU4uwCB4fn8D/2md8ajzsLVmGOdrkeQPm8IwUl7xoIc+RJtyBbbBSCFfRa/m2bYiT1xA+hB5LZQES1khRuOhi+qQ8Q9nPOdA9BrYWXWx93ZUR4Tcxe80P982voWOLRscu4EZXCZtC6Fnhtb8DdbdFK+QHb0eJZD4IKOQY2koPHeN4qR2oMs7wmWh50jpHIiigh8eCHKlfaVH9B4u6gRUftoXA46r3O5lco/P7Yzfm9QOgWaT/bOZmPiHLrApQ6U/wSrALdTq9EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YT3PR01MB8659.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:78::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 23:36:53 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af%5]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 23:36:53 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "michal.simek@amd.com" <michal.simek@amd.com>,
        "ben-linux@fluff.org"
	<ben-linux@fluff.org>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: xiic: Wait for TX empty to avoid missed TX NAKs
Thread-Topic: [PATCH 1/2] i2c: xiic: Wait for TX empty to avoid missed TX NAKs
Thread-Index: AQHaGYHtEoEebCqWzEavNcJ8AuRGbbCD4dwA
Date: Mon, 20 Nov 2023 23:36:52 +0000
Message-ID: <a1801c692aadf68d5ffd642eb3db7827ad8e87b1.camel@calian.com>
References: <20231117181238.3989861-1-robert.hancock@calian.com>
	 <20231117181238.3989861-2-robert.hancock@calian.com>
In-Reply-To: <20231117181238.3989861-2-robert.hancock@calian.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB8838:EE_|YT3PR01MB8659:EE_
x-ms-office365-filtering-correlation-id: 0a9d9a07-47d3-42a4-b329-08dbea219351
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AgeMXTblrBo/r1T9VtEN+/VKXr+TbUzlmrhic+BP8QlCRee/BMdvtaCfT6VBGIuhAm2yHYSmZJCAncDQ/OR5josjSJjrY3yCI/Q4ISfUa2BxMdO9AIEblKaWxPB7PPYcL0d4QloHjEk0arZ01Loa2ysZZO31eIwcfqxjv/qgJKD76tg4VENO7chYjexDwnGmnuYGVymrUGISOuw3LSDvTb1PHv6zbisMqGibfVKJFnVH8Qw1LnS+HzR1iESBf5giswjyylll1EpjHEr3pr7814E1apX0pirCe96DStu12A1oAGIGekqqbIh5o2f64sr7m5UH66sUx1HJpOdpECbCKwhu8DpnXmdcCU2yorqzgWq82m+6Dg9th53cyYqCzlrqK06gjfJ9FQfDlPv+cIpevWiHzcuXYDpwo+DwH6qj2QuwjYT2VkI/g+th5GKgH6A9ny3pHATOa6JuW4mw8yRqbAs1RswKCMtUIdG2CUzJFHfgVhTs8Dhq5vixqe7+PqHXXD2r5bpmoVwUy7hPxOdG7JRB0eNIJyH2mNGovaac2APXRGGbz0+K8hgQZsBoTI6QX27S6dzaXZN7MXqlU3Aq0cj/cZgnU2EUmcWdau2TrHVFvTMOisFtw0gC2kpybkFG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6506007)(2616005)(110136005)(91956017)(66446008)(64756008)(54906003)(76116006)(316002)(8676002)(38100700002)(4326008)(66476007)(66556008)(66946007)(8936002)(122000001)(6512007)(478600001)(6486002)(83380400001)(71200400001)(44832011)(5660300002)(2906002)(41300700001)(86362001)(36756003)(4001150100001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UkRyT1Rtc0QxREpGRWN5WTdtVnlyWWJKdENUN2xvK1Z3eGFiUzhucG9MR2M3?=
 =?utf-8?B?Yzlob1k3WS9iak5zdkFzMjg3Qm9NVG9HKzFVd1RHOS9ER1hmMzNkNUNIY2Jt?=
 =?utf-8?B?algzRTRyNjB4N2lBbWpuSmZVMFNhemJJQ3hYSzRpMnFuSEFHQUxnbTJ2bm5O?=
 =?utf-8?B?N2wybHNmRzJtTkJ0KytlRDR6eUZISzdMdDJpRytGZE1hbHp1Ynp6aTEzbFF4?=
 =?utf-8?B?Qk1OTWJGZG1YUDdBdkpWVnRQWGFnQ1prM203N25hd2p2SnZhMWpEelFOWThG?=
 =?utf-8?B?K2p5ZUtkL2FxSG9VOVRvbHdNTHF5aXdNci91WUdCWTFzL3I5ZHJiQldyckZS?=
 =?utf-8?B?RE5aN0NQT0RLNzRYVUVOdk52Zit6aWVKYStZMC9ZelQydVR3c0FkSGtPNStk?=
 =?utf-8?B?bURKM2dOSThFVWducCsxZ2hjS3JjY01oTUtuVDhlSGFlVy9ZdzJHVWgzQWdY?=
 =?utf-8?B?clBVRlJkTDY3V0J3ZkswemEvQWd2UktMVUtkQXFvWWhIZHRQYlNRbmRMYmlP?=
 =?utf-8?B?QU5KOVNpc2lSZzc5OXUrL29EaTFEejUxN0l6NDdyTHFEcGhMRVArSHBMVnA1?=
 =?utf-8?B?SEdseTRyalk3QnFOVU9zZTlMTUlQZHNPeDE3UlptU3hudmdqK1QvWGtWTVZH?=
 =?utf-8?B?b1dBa3NkaThWUklzVFFnZzYwb3FZNDc3NFI1QjBIOCtsWG5DS3ZLMTFLczRP?=
 =?utf-8?B?MGpkem5tWDZaT0c2Q0FDNzk3QjNWNDhpTXIrbjFXYjhKUkV4dWhWK045WHo5?=
 =?utf-8?B?ZmpGWVk2VERVUk84WHFreXpOZzUrUGl1aUtzS080ajRuUlpUMUhNRlg0V3l0?=
 =?utf-8?B?dGh1b1ZEdHF0emRzdVoySENTRG9zTUN4UDUrQjdnVHQ0UTJOYXJvdmFIeTZI?=
 =?utf-8?B?alhHbkxlQzdFWEQzamF6VURBRk5wWTYrMTExQlN0VEdCOU9sck1kVTZDVG9m?=
 =?utf-8?B?b0g3VlROcllTdUlxWkpFa0hkRTJIUU1xMHhOSms0OUtQU0VmbER0L0J1amlj?=
 =?utf-8?B?U29GV1EyZXB1UG9leG80RHRWVUJhU244cHordVlhQVRmT0hNUS9tYjlrYlUy?=
 =?utf-8?B?S1hJUjRyYVp5WGlVRHNkNklaV3pyV09DVWNjNGpranJXM3Q1OEdKR1V3bVdD?=
 =?utf-8?B?dUY3ZDBHSGlrR1J2eGRMbWptRFlUQksrQkFLbHZDZVVoazdhdlhIUjZrVXZJ?=
 =?utf-8?B?cU13V1VUVFdSZmI3ejY5MDMrSXN6b28xazZJUTM5ZC8xd0lHYlJ4SEVBd3Bq?=
 =?utf-8?B?NFk0RjBRcGZYeS9XMDhJQ0JnOVAxWHR4Yy9jVzNpVVVRT2h3Ky9NRU9HSjVy?=
 =?utf-8?B?TjJ1OFNPQlA1MHJuZkFGbTQwaVp5TlVPeTdUOVZQbmxsL2oyZUpuK0lsaXVP?=
 =?utf-8?B?RXJLNzQ1amk4eVc4L1g4MWNVaTROK0xBWWs5Z2VMcitLMHE1MDVvYjhWM1Mv?=
 =?utf-8?B?NjJuV0o2TmMvek9RelFyNk5XQk9NSU9nS0VmbmVOZUFzOWpJT2Z2aFU3SXhQ?=
 =?utf-8?B?SjhzUCtwNWVwaCtKRWVEcEtiN1o4Ukh2L2pjMmpqelFHRlNDOUJMTXBCczdS?=
 =?utf-8?B?R2QyZGRGaUZMNXhwZnF2ZDZSVWljMUtvR2hMdlNLUU10cnhSUnkzVm03UnZj?=
 =?utf-8?B?a1RYZzB6S2ExSnZnZ3hyMzU4V3lYYWs2YUs4MzFGSEJzWXN6NHd6ZHdhTWtK?=
 =?utf-8?B?UFVvY3R6RXBBa08vbmNWWXBDWTRJd0tlTUIzdnNHYUZNakZzb3NZL25nOVZU?=
 =?utf-8?B?b252TWNSc0VJOVpReGYvUUNPR09RcDhocFRkYVZyUTc3TzhVSHBFVlBZYm56?=
 =?utf-8?B?a3ZSbVRCTWhMTFFwUUdBMGthYlpBY0J4TU1UTlM4YkUwUVBXRUdIM25kY3pm?=
 =?utf-8?B?Vnk1cURPa0M1NGU2WUdUVHB0Y0tmL0xaS0JqKzFVaXE4eEh6WGR5aVBqUUtq?=
 =?utf-8?B?U29ETXU2L1VMbll1bmF2MGpjc0VwLzRQb2d3MUlnZVV1QTVRc3IrN0c1Q1Bk?=
 =?utf-8?B?eEhhaU9OTngrL0NiekNLRXhKSUVyS1EvOVFCZzU3ckhCampSclBGL3luY1Qv?=
 =?utf-8?B?SjhwNkw4YVdHZVVMRUlBbVpPc1FpUzA4eGtyN3RXL0lybGRLWmhtK0ltNjJ0?=
 =?utf-8?B?a0pIa3pVWUprRG5yelJUcHU1WFYxN2NrVGVycytKVFpPZjRraExMaGk3NHlS?=
 =?utf-8?B?a292R25Lb0F4a2twN2lERm50V0lsVEh5cDFWZEJpUWhNekcxOUxyR1Zjek8w?=
 =?utf-8?B?V1BNSEI0bHlnVWJpRUFpWUpKdWJRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6C81B4598ECFD4D9DC81B84F2F6E9BB@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	G9eO80QrBcqCijTJupFFViQbalWl2av/Xyuv1yceQ5djI4rD5lMEGgmsUZukgSAHh4uJ8z0+HSh/A/87v6ZAEvqQbSq4I0fOlT+jiwJVJ66p/OLmOOfX4lDmoWEg6qAwUWJOzmGSYUUy6HJxf1I3e8QJKw6mxXygvPKRD2obEVDDoqKA5zrYE1xQBZcwS3U+LS5LUw8/irx46zGtMqguVHSnzvicmyM9XaNUKR7y9W8zzdF/RlqOiq4CIEw5JFIXrhTsNJ9iPlQzI2K7VysS0drD1Px9ibn0cZVNryhGRfdj+JH33ceFnln/3V2WBDLjEDCA1T3xCt2sxTX6ijIY2lz1+mOp9nyPtQupaEt3o27pSZzps7IOAFCovqzyXeZ3zRE6FeNbl1TREVOmOUdsKP0F/7M8OslzYAxQAg+f8fLOsegupaoU90jRs3O29B7hgRDQF50xOtzIbOIG3dVXn5n7uc7QNxQY1nd6xVLUvANblB1DnUybH+08ujxfV4XgcjplMO++Q5hQbmXiQvYBty3vfGPx8/v1z7dPGyBAPEZyd03PfS36cyWuWz5TolXeRM7sk3aSJYMqJetwEwoWPN9dx7dRkfiLyDHi3J3T6UrJ82yluT+e3JLVwEq7e8nB2248eO0k/EO1Bb4ei24/0/chb4ewAqn/Db92rqtgzcGK6PC07YuQlmgqgj2mOVXxrUzPcVJmFMRimoXtmxZMCviAAnPGjllB8WUusukNE5hGmnxuDNS3MwXi8+KeSW34W/NoI3jjpRHEzuuPF3Gqm+a+lh5HKQrmRl8qhEBw8x4oL1EGvgkuSMNSWba50U4swF5txJrJQVtECG3pcP/OqyqP7o+zW7MD2BL0ezx867cS35G3D9WxjuuZ1PbItPyjtNCVLN/7z1xb1xN01J65b1S2azz8/flbAHLSSQVBAiM=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9d9a07-47d3-42a4-b329-08dbea219351
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 23:36:52.9224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xoewjs3RjEBu2BXppWqWxtPl7nDu78kJ1r3NJGIMNEW3oUS/aEiXGXbze2V8gitqJU+faRJA1wKI0LUsntdts2sKOWo3+fWgpY60Eqfz/T4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB8659
X-Proofpoint-GUID: L_pYS_GQDHp69lUctxDWn9Ra2nsOfr4o
X-Proofpoint-ORIG-GUID: L_pYS_GQDHp69lUctxDWn9Ra2nsOfr4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Reason: orgsafe

T24gRnJpLCAyMDIzLTExLTE3IGF0IDE4OjE0ICswMDAwLCBSb2JlcnQgSGFuY29jayB3cm90ZToK
PiBGcmVxdWVudGx5IGFuIEkyQyB3cml0ZSB3aWxsIGJlIGZvbGxvd2VkIGJ5IGEgcmVhZCwgc3Vj
aCBhcyBhCj4gcmVnaXN0ZXIKPiBhZGRyZXNzIHdyaXRlIGZvbGxvd2VkIGJ5IGEgcmVhZCBvZiB0
aGUgcmVnaXN0ZXIgdmFsdWUuIEluIHRoaXMKPiBkcml2ZXIsCj4gd2hlbiB0aGUgVFggRklGTyBo
YWxmIGVtcHR5IGludGVycnVwdCB3YXMgcmFpc2VkIGFuZCBpdCB3YXMKPiBkZXRlcm1pbmVkCj4g
dGhhdCB0aGVyZSB3YXMgZW5vdWdoIHNwYWNlIGluIHRoZSBUWCBGSUZPIHRvIHNlbmQgdGhlIGZv
bGxvd2luZyByZWFkCj4gY29tbWFuZCwgaXQgd291bGQgZG8gc28gd2l0aG91dCB3YWl0aW5nIGZv
ciB0aGUgVFggRklGTyB0byBhY3R1YWxseQo+IGVtcHR5Lgo+IAo+IFVuZm9ydHVuYXRlbHkgaXQg
YXBwZWFycyB0aGF0IGluIHNvbWUgY2FzZXMgdGhpcyBjYW4gcmVzdWx0IGluIGEgTkFLCj4gdGhh
dCB3YXMgcmFpc2VkIGJ5IHRoZSB0YXJnZXQgZGV2aWNlIG9uIHRoZSB3cml0ZSwgc3VjaCBhcyBk
dWUgdG8gYW4KPiB1bnN1cHBvcnRlZCByZWdpc3RlciBhZGRyZXNzLCBiZWluZyBpZ25vcmVkIGFu
ZCB0aGUgc3Vic2VxdWVudCByZWFkCj4gYmVpbmcgZG9uZSBhbnl3YXkuIFRoaXMgY2FuIHBvdGVu
dGlhbGx5IHB1dCB0aGUgSTJDIGJ1cyBpbnRvIGFuCj4gaW52YWxpZCBzdGF0ZSBhbmQvb3IgcmVz
dWx0IGluIGludmFsaWQgcmVhZCBkYXRhIGJlaW5nIHByb2Nlc3NlZC4KPiAKPiBUbyBhdm9pZCB0
aGlzLCBvbmNlIGEgbWVzc2FnZSBoYXMgYmVlbiBmdWxseSB3cml0dGVuIHRvIHRoZSBUWCBGSUZP
LAo+IHdhaXQgZm9yIHRoZSBUWCBGSUZPIGVtcHR5IGludGVycnVwdCBiZWZvcmUgbW92aW5nIG9u
IHRvIHRoZSBuZXh0Cj4gbWVzc2FnZSwgdG8gZW5zdXJlIE5BS3MgYXJlIGhhbmRsZWQgcHJvcGVy
bHkuCj4gCj4gRml4ZXM6IGUxZDViNjU5OGNkYyAoImkyYzogQWRkIHN1cHBvcnQgZm9yIFhpbGlu
eCBYUFMgSUlDIEJ1cwo+IEludGVyZmFjZSIpCj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEhhbmNv
Y2sgPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLXhpaWMuYyB8IDE1ICsrKysrKystLS0tLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy14aWljLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLQo+IHhpaWMuYwo+
IGluZGV4IDcxMzkxYjU5MGFkYS4uNmU4NGI0ZDY3ZmQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMteGlpYy5jCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy14aWlj
LmMKPiBAQCAtNzc0LDEyICs3NzQsMTUgQEAgc3RhdGljIGlycXJldHVybl90IHhpaWNfcHJvY2Vz
cyhpbnQgaXJxLCB2b2lkCj4gKmRldl9pZCkKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeGlpY19maWxsX3R4X2ZpZm8oaTJjKTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAvKiBjdXJyZW50IG1lc3NhZ2Ugc2VudCBhbmQgdGhlcmUgaXMgc3BhY2Ug
aW4gdGhlCj4gZmlmbyAqLwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXhp
aWNfdHhfc3BhY2UoaTJjKSAmJiB4aWljX3R4X2ZpZm9fc3BhY2UoaTJjKSA+PQo+IDIpIHsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogY3VycmVudCBtZXNzYWdlIGZ1bGx5IHdy
aXR0ZW4gKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCF4aWljX3R4X3Nw
YWNlKGkyYykpIHsKPiAKCkxvb2tzIGxpa2UgdGhlcmUgbWF5IGJlIGFub3RoZXIgc21hbGwgYnVn
IGhlcmUgLSB3ZSBzaG91bGQgb25seSBwcm9jZWVkCndpdGggdGhlIG5leHQgbWVzc2FnZSBpZiB0
aGUgRklGTyB3YXMgZW1wdHkgd2hlbiB0aGUgaW50ZXJydXB0IHdhcwpyYWlzZWQsIG5vdCBpZiB3
ZSBqdXN0IGZpbmlzaGVkIHdyaXRpbmcgaXQgaW4gdGhlIHByZXZpb3VzCnhpaWNfZmlsbF90eF9m
aWZvIGNhbGwuIEFub3RoZXIgdmVyc2lvbiBjb21pbmcuCgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldl9kYmcoaTJjLT5hZGFwLmRldi5wYXJlbnQs
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCIlcyBlbmQgb2YgbWVzc2FnZSBzZW50LCBubXNnczoKPiAlZFxuIiwKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgX19mdW5jX18sIGkyYy0+bm1zZ3MpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaWYgKGkyYy0+bm1zZ3MgPiAxKSB7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBEb24ndCBtb3ZlIG9udG8gdGhlIG5l
eHQgbWVzc2FnZSB1bnRpbCB0aGUKPiBUWCBGSUZPIGVtcHRpZXMsCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB0byBlbnN1cmUgdGhhdCBhIE5BSyBp
cyBub3QgbWlzc2VkLgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZiAoaTJjLT5ubXNncyA+IDEgJiYgKHBlbmQgJgo+IFhJSUNfSU5UUl9UWF9FTVBUWV9NQVNL
KSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpMmMtPm5tc2dzLS07Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGkyYy0+dHhfbXNnKys7Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHhmZXJfbW9yZSA9IDE7Cj4gQEAgLTc5MCwxMSArNzkzLDcgQEAgc3RhdGljIGlycXJldHVy
bl90IHhpaWNfcHJvY2VzcyhpbnQgaXJxLCB2b2lkCj4gKmRldl9pZCkKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCIlcyBHb3QgVFggSVJRIGJ1dCBubyBtb3JlIHRvCj4gZG8uLi5cbiIsCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBfX2Z1bmNfXyk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB9IGVsc2UgaWYgKCF4aWljX3R4X3NwYWNlKGkyYykgJiYgKGkyYy0+bm1zZ3MgPT0gMSkpCj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBjdXJyZW50
IGZyYW1lIGlzIHNlbnQgYW5kIGlzIGxhc3QsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBtYWtlIHN1cmUgdG8gZGlzYWJsZSB0eCBoYWxmCj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhpaWNfaXJxX2RpcyhpMmMs
IFhJSUNfSU5UUl9UWF9IQUxGX01BU0spOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB9Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBpZiAocGVuZCAm
IFhJSUNfSU5UUl9CTkJfTUFTSykgewoKLS0gClJvYmVydCBIYW5jb2NrIDxyb2JlcnQuaGFuY29j
a0BjYWxpYW4uY29tPgo=

