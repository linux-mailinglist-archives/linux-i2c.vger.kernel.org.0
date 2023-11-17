Return-Path: <linux-i2c+bounces-212-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B04327EF766
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 19:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6455A28122B
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 18:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D620374C5;
	Fri, 17 Nov 2023 18:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="wWCibgr/";
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="WzrKWVES"
X-Original-To: linux-i2c@vger.kernel.org
X-Greylist: delayed 214 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 17 Nov 2023 10:18:44 PST
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com [67.231.159.91])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 044E9B9
	for <linux-i2c@vger.kernel.org>; Fri, 17 Nov 2023 10:18:43 -0800 (PST)
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
	by mx0c-0054df01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AHHo8SD012164;
	Fri, 17 Nov 2023 13:14:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=selector2; bh=muaEIHN
	dWUI5ffYi178XpOMzDOtg9EBidDbkdwktTzc=; b=wWCibgr/prKq75aIr3RciFi
	k4dnYjed/1CtafxxgiWqRUX4dUyFOcBg8Wf10no/gPvd1HVgN6+xJHdOthVFo2xc
	fpQPPFrXpPlqn82kNhLpW68H8E83URoUOpUCcAu2AEL2/GhOKKDmrQwV+xU084FY
	bQxVC3WnMQbnKSCopU5c8aZcNiMZq+H4WGR+ag1sQH4loKOOjTSoZ1OKk7OfxWfk
	TDin1E8Bh+HdI9CAG59A7fRcS2PK0IdivBXoycAzT2+YS0OPMvPLReWQUNrMh/To
	+KP6FUUNOudiRXluBKZxMEmn0AK6DX290mHVqkDBxYnmD7WcxEOcYl3cglZSAvw=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=selector1; bh=muaEIHN
	dWUI5ffYi178XpOMzDOtg9EBidDbkdwktTzc=; b=WzrKWVESmX4/A3qOULWmyxb
	/exsuIuCRnifYzX1EVeXD1KpS7U/nBPpCuEBmgE2qRXkGmkt2S4YKNGMZ6rkTMN5
	SC6uzXgvYS50nF+KVa9lV0YO6AjIDKJThD/50THYELgG0jAeLuKbm2DIBzXkQEDJ
	W0rwLCEPFVKAm51nDBYbBHzVNOqLBRN8CgxIwkxNZpUHUiknR87Gw2Sc/PIPJvH0
	1eB0byv0Bk9hS62XCyIL4peE4onZPQoglwcK/aVLCi6U5ORKJ59dXJWH/n74hcMm
	hMyiXNB1H+PpnIo8BUcDPo6BQf/B/WubpLWiVhDaKkfQzAQxD3tlGPnTUUXWSqA=
	=
Received: from can01-yqb-obe.outbound.protection.outlook.com (mail-yqbcan01lp2232.outbound.protection.outlook.com [104.47.75.232])
	by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3uduwq0u24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 13:14:24 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5hnhw4SjgS/uEjb3yRQnxip9fbYzOYF+3GyaUveNGlJNOKvFoJnC4agEyiHQJwAP01JZmbYHy6U3IXDE+Hiz8s45Ob5owSI++oVatQOuleXtlyYhegNr8nx8CYjhaqInc257GO28s3eMqNC1AD6qzuNP2GDLcIDiL8nHr9bQ95dKkAX1KvNjNB+YewyJCXw5Yd7p+qb58sWReWFiyTF5F6gszQXI4OygrOG2A2YQwNTp/+IxKIZFZ6wLylJOowCVnva6LkveC0qdKOcWGWnNcCbDYwN7hqf9Oc8rdmhnLyR2/P8IAT2pUMP9S7dIdneU6S3Iun2e0j3589S6EpRfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muaEIHNdWUI5ffYi178XpOMzDOtg9EBidDbkdwktTzc=;
 b=efAEL75TEcXWQfgnytXqPCJU9CU8ROSinj8ziP9kIFkrqR+tAw2vrkbijjR8iPmc3IqKsZDNX4aH9LCR1ZGKboyXXNQI11OOKKc1KHnlsDMmb/+kmCPPnSR6+5M90ieZ4pUo63JaMw3dNmnJkQG3xIaHc13QBtVLVG22rHSCsHwWH2W1QQQJEK7eoQxGI65izR14uG6r6f3o2YlWoFkRDDBwTxcaEHzJtJhAAGz/sLXedgkxEO/rezmwRYIJ9Rnhkv4pj5Dy4uArJzFt6bBhW5gidFUgVUSjMBKMk3qQumw6W2PjSF7on4YR3V2MWtMLaIWjrvPszV0HaDDrXGFYCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YQBPR01MB10797.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:73::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 18:14:23 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af%5]) with mapi id 15.20.7002.021; Fri, 17 Nov 2023
 18:14:22 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "michal.simek@amd.com" <michal.simek@amd.com>,
        "richard.rojfors@pelagicore.com" <richard.rojfors@pelagicore.com>,
        "ben-linux@fluff.org" <ben-linux@fluff.org>,
        "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 0/2] Xilinx I2C driver fixes
Thread-Topic: [PATCH 0/2] Xilinx I2C driver fixes
Thread-Index: AQHaGYHkFcXEXQBbU02jwHMBhqeplw==
Date: Fri, 17 Nov 2023 18:14:22 +0000
Message-ID: <20231117181238.3989861-1-robert.hancock@calian.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB8838:EE_|YQBPR01MB10797:EE_
x-ms-office365-filtering-correlation-id: a2620f86-2c58-4e49-eef4-08dbe799068e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tgb2ISDrvTHrboTLh3TuIi0wktnn5+sbkHXIzR3U+p48uEuwehW94WtSTUUf+B64lSFQ7MR3rJe0nAhdAw5YdzRYc6/ECezISWhS+8loxnpyjuZ2DURmSTkDP7zbaJz+P2ch3CCNTXNZbAljmZ43T3w5tsCQLywwC1HNyQgWcqkJlJhHPd+rjuI0SRl34n3ftKXEOHAJsswltRV1DIOEmyLMYk9TlQ5X4iZoMDjOFX8W7yjIkqB9dB+LpympR11+d3z6fdTU0pogLM7KqlrOzWEnWFG3r96eJWEwfLJfe/oB7UITz2nqxpCit2JfwTcn/yn+8gHyzqgVhy3OUO4V8csGVlf/xR1fLnfjRl/Ltdzjb5yiWVpFxJ3cKaN8oi/FKHr3gMLvBsKCzv9SVJCYHCnoQ17pQzwwNm6H40gjDEQA9GuBPw10tfB101efDOfyAgu46a1xA/OrEkbKCRONSVhezHyHCFfY54ljvuCB7KNL6nbDKKGn7xJMXO9RuIOocSQUOv+R9rJCEub5j/Mjx3oaUxzHIkoxac0bYrGCUweBUkEseUusAvBH4SayJAlBDo/OYorNe49JrpjKisHbiKfaWeWh4sKB4zw76LZWJQSYEpkbRwMTmMPZRlBHFhU2
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(54906003)(66446008)(5660300002)(66556008)(66476007)(64756008)(86362001)(110136005)(66946007)(76116006)(91956017)(558084003)(316002)(38100700002)(1076003)(26005)(83380400001)(8936002)(8676002)(36756003)(38070700009)(4326008)(44832011)(2906002)(41300700001)(6512007)(478600001)(6486002)(122000001)(2616005)(107886003)(71200400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?KFLRZg7PTIkh0QgPndyaqi5QrK/kxpNEDnl0ZejbPgyI3HxFiY5OUUrSHJ?=
 =?iso-8859-1?Q?aAiyNaVilXeCxV46TRe+JzOTmn46REcXdV1V5nkGNCzcQMw7ttEJGiPE43?=
 =?iso-8859-1?Q?2f3Yt2U1QEM4P9dAkw2zZu4RRSjADfMXhM8b4LT7IvlNtojTpA+KX5T+j8?=
 =?iso-8859-1?Q?6evPEZ2FCaCp7Z5IgU0xZFrwdhVUsgieRoVpfJ1kUSBPQ/demhanXZcLdC?=
 =?iso-8859-1?Q?VwZnTyURa89ZfuZpeBpu3Dz21avvxBtdEgmH0xja81grrdCk4YtHwz3xfy?=
 =?iso-8859-1?Q?89T+j+aKvHpjeJ/VGe5M4iaxmZw9OBlogFAJTPXDqrFHtkTYT/F5PAtVJx?=
 =?iso-8859-1?Q?T3RlaEAPOeCTAk0hffNrMdtdIauTvYFP9z5JlFK97TVbNj/uSfXgCOUPB7?=
 =?iso-8859-1?Q?FzK2BilAsELeRXQymxiqVcFQV2BLzobvsijXLEJrtyRNAc4zmmFgLmTYIr?=
 =?iso-8859-1?Q?NLiZlaY7pLP3M3ED0FUcmMe07JoyZxTYxu3xKWC1HDl6uP8t7+K1ZSlwwK?=
 =?iso-8859-1?Q?31PSnPYoMz0fusaAFdtL6vqzRXNzeJ25EE/kwPGkzWDSz1076v+v4MH4bo?=
 =?iso-8859-1?Q?IIgsxXdJEixsju9H3a72vuf3CTa6LLU46IOhni8UT1DHE8YJzB7MPAE4QQ?=
 =?iso-8859-1?Q?N3N2X2gJeU/XETFUbxSdS9oVYGcRcDKGlVvZvkdB3GNPgnDkw+oBzAuZAy?=
 =?iso-8859-1?Q?KyNzwGT7aBwluXdQrpMT88Ql6fULlG5WmIyu7P+d/23jgy51bMBBeTQIQR?=
 =?iso-8859-1?Q?EUz8PvfoZ9slQo/l7fJjKKSDxGfqJJfXj26Wr/KydS/nselN+HTe5Tp8Cb?=
 =?iso-8859-1?Q?Yg+DUMYJPsdzz/3ZTMxHCE7urOm2LmZXvOVJGF9TheatQJ+WYSGzSVswMd?=
 =?iso-8859-1?Q?WSmdbY48Ih5fUiT5DrGjFERsBqiDCeAyBzWCnQSo6AVUxgr/3djW1z2KOY?=
 =?iso-8859-1?Q?+Vnzp6rZFRiUp9kqVzAEhg3nTC+4qeQ+GVOwE27LXbY45OGf244PWQ2F+U?=
 =?iso-8859-1?Q?NxhYcG29AtgcN4IOD144+S2eRPVAsfLmEtixF2fTKUC0KcKopw1j4CK0rz?=
 =?iso-8859-1?Q?ShqYTsLAyUypeceecSQYjMmOOe/tNRVxH32kvdCrBOFdkYm/cPrjoZPJs3?=
 =?iso-8859-1?Q?cZaHJ1Pcpwg/IXXLscV73lh/0pIca79shvV7ZFLwkjBd4MGLhyUbGo1sdA?=
 =?iso-8859-1?Q?MpLOpmp8VNiRMGIT+xQrCRBPFqDh/bLfyBl8txpryNCedFvrN2TRaVPE/c?=
 =?iso-8859-1?Q?K7ZgAeLVkGu8NYCw8rv/2sWktNshpQVjobbrttUkzvQK7CjuSINKAzCCIp?=
 =?iso-8859-1?Q?AZ8htXtJpJpB6dEvVnRsY84HxMlFWaq8QbdriGhIvb4YF/A1AVri722csC?=
 =?iso-8859-1?Q?f4iIC0uw8JKC4OBF6JsqrLWEbIrm2yKA0JCzhb1BuAjm12x8Sazfy8WLRI?=
 =?iso-8859-1?Q?+NzNZtwv4HGnDGgXPzICd4c9iYMmnS7vWaYO28Pyv/4a8gZzceSeCSDOBH?=
 =?iso-8859-1?Q?BTnbt4AXaTLRhbWlKS8r+cDqoed4AHUxxJ1pxX4Mv0HEMJNaf14OYx2VxW?=
 =?iso-8859-1?Q?awnh3nmt15ZFOtjXDbe6ked0J6ZCshBTVc6b3wsCDasJvcnSOqUtqqIqv3?=
 =?iso-8859-1?Q?exXqGBIkiQEd1UXAekt2z3JfQmT0zN3Bfo1BoXFszaNQgkwWNHUD/j0A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?iso-8859-1?Q?SJsaYzqkJ/CN5IsS+fYfFJBi+IUQ7ILrzfxmm47rRLRtXRL3FeuSWcK6H1?=
 =?iso-8859-1?Q?BJ7VlMeu0z6rRQ60YGELNxLaDX1TEg9mEaHQnI6cUqc8JVF/Rmgr80vhSm?=
 =?iso-8859-1?Q?+axXUmwkPtY2GPcc4PM865Z+PrClMhNSXq5sNIB4LLUdTv1lTclYgDG2Rh?=
 =?iso-8859-1?Q?inoqsLI7acwj/j5+foT63NfQ1xNYnshJHVIkcb9q5n1Crr9ipTdhLJQmS3?=
 =?iso-8859-1?Q?9YBM9szdMh4I2twin6yEIu3DiHVsLdBcITvHrDDnnebsJmg2kvILAT7zu7?=
 =?iso-8859-1?Q?kFH5Clqr+SQ+QkCcvFbRaPVJs8cTKzdIoDIK0pciqHiRkaLnQ8iyEIbhuI?=
 =?iso-8859-1?Q?ACVrM1YUXo+KUHu/AQBLUrof3eokb6pqTIg+MrU9bkostOSViC04tF3PPf?=
 =?iso-8859-1?Q?M37LRgGdXEtTx87bjSWRSdgklDHqogt8EV0zaRZCAGXfNnziDnMJtJgJmi?=
 =?iso-8859-1?Q?7GihTeJi9cDLHUX1acj12ShXtosTX02reCra8HXcZ11GwMH97jjXvbb9BI?=
 =?iso-8859-1?Q?uzHB4Oo+LlUd5OiSpRkVaBxZUKYX7Jz0jR+6VMbRFrWXznNX62zXZ4/oo4?=
 =?iso-8859-1?Q?vTlaNjSh5WbYfd2iAekcTXzX7Rgr5y6vwvWyPvtND+AjJoaIR75KI8/5eK?=
 =?iso-8859-1?Q?xKixpLN/uiWuYkXFf/CEFf/23iAOa/CvGtJBuqCzPw+SfBk8iVQsOy8jZ/?=
 =?iso-8859-1?Q?ixH7rJGpzBlOxE8vzhGacHpVfwBqPaC2FE9dAfTTupn6P5WOiW6bueKZuk?=
 =?iso-8859-1?Q?0MBZy3qAzeeZctfB+6QhNyxDZysVeNonEit6Bc9d6aLO641Mw6DPcMbHzT?=
 =?iso-8859-1?Q?1hn0B/SHFQR1zpRX987wohQHqPTOd+CyYT+fxd6Xo+Q10jK/j0U8REDU70?=
 =?iso-8859-1?Q?rlPX3ZHXUVNOo1DKuZoRrcj1v8wZm+20s6EIsdEiangyydpBVayXqfHyua?=
 =?iso-8859-1?Q?EcX7J+5nmcfJR2QeSQU0K75Fydll0qrzk6rl4SHMu1x3nPckppgxHA=3D?=
 =?iso-8859-1?Q?=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a2620f86-2c58-4e49-eef4-08dbe799068e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 18:14:22.8794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ckz2Gh3fA6/JoR4E9C6Un6zs+5DxwupZiki8MtDZWKszvyOfDwH9OqaZwg9D3mrBPgMrsER4Q+vyFrDvLe23NGJhZj/EjPGkI8m7umDPyu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR01MB10797
X-Proofpoint-GUID: WT9gQbeLeMSiyoPFm-CzRjlrPEBrh4vx
X-Proofpoint-ORIG-GUID: WT9gQbeLeMSiyoPFm-CzRjlrPEBrh4vx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_17,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Reason: orgsafe

A couple of fixes for the Xilinx I2C driver.

Robert Hancock (2):
  i2c: xiic: Wait for TX empty to avoid missed TX NAKs
  i2c: xiic: Try re-initialization on bus busy timeout

 drivers/i2c/busses/i2c-xiic.c | 57 +++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 23 deletions(-)

--=20
2.42.0


