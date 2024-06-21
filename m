Return-Path: <linux-i2c+bounces-4216-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C540912668
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 15:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5130C2877D7
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 13:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701E01552E1;
	Fri, 21 Jun 2024 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fwgLXwUK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2042.outbound.protection.outlook.com [40.107.114.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB1515218A;
	Fri, 21 Jun 2024 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718975462; cv=fail; b=bwsv24yU684mOS4ACjgpiM5ZF2k2B1Y1LyKl4wqgHRE51F5KreXghBAVFnGLAFM0wMPS92EeVuPePqfjXxLJwb5eAj5J7FDOdPyIVnswYrP77LG+UwiEVVRM0wmd4P/HJyaWSHBXmtJDtwaHBPdJXJB/oDocMFl2TFCduHGUuOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718975462; c=relaxed/simple;
	bh=4GUKnTrI/aS9teb4uiPDNUMVWorkkdpio52sZMuDUb4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EnFlI1HP7F//H/zYMb7adP9bhkKNkPbPFTsKNUtRCKisVHdciKU9xXwd3OKIhZ4p03Pl0/EFBZStE4yCy3ArS6OYX2v8kkEe72Q4/HZ6rvHLMjteoZmk3TA/C/lbjs8e7q79I2MDuQGWsBRJJ2LidPeZ+D0e1qmhBpeJlgZ5h0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fwgLXwUK; arc=fail smtp.client-ip=40.107.114.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEPoQWvqaIEk2S41uZ71VRpNV0+03i0tA4DUTY9PlfVhB4MndPOyWvlAFf4SnCHEB5D/HIxYUiMy5964MHp6kIB8UzmSDadSsMRonzmOvvyViQ7p9kMUdW4Yutkgnhl/2urTdrUSSN3Rajm3lgTdpis5rptjFImn42K7CnQMOjzhiHkNLBKHCrDcDf/VVDvJVqMvCj3F5ct+SQ5R0LJjvf13S10UwUeqfaNhE5CZuggXhpQ6WAQjMYy1m1TEJYQrSWPmFvwB2NlZqQEgxsi8ehTPZ+c9zQv617xhiPe6vhQ8Hn4uvVkQACYCo12hc0DIehOh98pdDVEe1bouZvsXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GUKnTrI/aS9teb4uiPDNUMVWorkkdpio52sZMuDUb4=;
 b=BnLsNR1i0KdUg95m9MIJae2lChCHb32bK5mP5wsi67AJyh7K4rMBzQM9ltL9ReYrrhJHw97z+qH8VMi6x8gjE/GOb/E4/JmqL1V3VzeJIz8zpvT9XCh+hzLT04dziS+n6sJpIVqIYsST1eO5DegtHg5faqFTbep1z7huRe0GvrMOo9IFxm8CcQwKhdOi8Y9PlyFjynPtvxtg3xtBoIjtW8xoTD3Rl+kzEjYWzpBzI+t/cf8oXlTnjE67mUB6eqjctJ36gHH07LY5wwSAWH1pO6DPEPkz9wu24ZNKoin7oKKkgVJ52PuU/59lsEfvg1nIrCnUgbYOBhqkpZlLFgL92Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GUKnTrI/aS9teb4uiPDNUMVWorkkdpio52sZMuDUb4=;
 b=fwgLXwUKWtr6M5HxGXxBBRCymWRdg07qP5VGqYt7VmlVXjGLNBQnOmaZH1cy107jenFDEM2Tw+3JD0DyL9kbPhhHHr7x45BN026KVXNh83P4HRFwm9uzGrTUnQLezWYNbZlO0Z5h3L/GgTXtnjSY8pBu332CyvJ7eBUthxDhpHs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS0PR01MB5555.jpnprd01.prod.outlook.com (2603:1096:604:a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.34; Fri, 21 Jun
 2024 13:10:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 13:10:54 +0000
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
Thread-Index: AQHaw83CoDfPceNxD0KOSNXxIs1DTLHSJmsggAAGUYCAAAAcwIAAAxiAgAAAHEA=
Date: Fri, 21 Jun 2024 13:10:54 +0000
Message-ID:
 <TY3PR01MB11346D9CF89F7ED9B6A49C61586C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346105D3D3DD46AEF8CD44986C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <0bc78e5e-de37-4ff6-ac74-571f615b97f9@tuxon.dev>
 <TY3PR01MB1134602C189C6C63C6187840886C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <b5a3ef7c-8509-4065-ab0f-efb5a7e5fcbb@tuxon.dev>
In-Reply-To: <b5a3ef7c-8509-4065-ab0f-efb5a7e5fcbb@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS0PR01MB5555:EE_
x-ms-office365-filtering-correlation-id: 29d7cca2-ca9b-4ca6-21ca-08dc91f3955b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|376011|1800799021|366013|7416011|921017|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?TzVJUXZDbWZ1WURLYUJlR2FDNFpheWZKa1lab2hoNk9CSW81TmIyeFhFR1gz?=
 =?utf-8?B?RWlnM3lsSGxqcEEvQmtGZHVpeUhlTXR0MGdNSzdRQ2NVaTdzeU1XbHA2bXB1?=
 =?utf-8?B?b2d5OEkyaWpZUThyMkdqUy9OcWVtNndIbnZidExyTlBkNGQrQm5LRWV0NkhT?=
 =?utf-8?B?U21SaU5SNkVIOHQxYmJvUzhmc0RITDlGVVl3NGF1U0tKZjNYL21IRlBlaC9J?=
 =?utf-8?B?SXA5TldFSWRpRTNVbHg2Y1g1UWlTY2t6YXhuaEw4d3RxNWNTK1JaNXNNVGJF?=
 =?utf-8?B?cHVGbnVGaE1qVEg3UnRWaExlTnV3MVgvK3E3MHFUOGRsdURCS3FidWtYdUlh?=
 =?utf-8?B?YzhQcldPR3k3SUdtNWZ3dzcrQWdUQ0l6SmpiWTNKd3prLzJ5UkFVcnp6U1Ja?=
 =?utf-8?B?RytSSDBnZmVDdFloK09iZDJYMFBFVmNkTFhGQUxMcEtNbUFsSGVRTEh4bkla?=
 =?utf-8?B?Zk9lNzlIWllnNTdBVEJTNTcySnRPUTBLVzJpd3ovNDJuTDY4NWZ4RDBlK3Qx?=
 =?utf-8?B?b2loWHZ2Nlp6ZHgrdm9mUWVYSXZBd1VoVWJsZ1lxOG9HU3RrSWVsaCtzZytl?=
 =?utf-8?B?R1ZPekRZWHRWU2FvSXhDaXZOeEpvWnZoejd0V2tzV1BVaEFxRXhwV09TcVU2?=
 =?utf-8?B?OE10VU5WQmVQQTVpakpFMnMyZlFwVWlkaVNkY3llM2czekcvL09VaEFCMWtu?=
 =?utf-8?B?L2FCdlN0V2Qza1RTeEhlR01QWWZlTTZ1d1hadnJObUZOa2FtT0RmZDNIOGJL?=
 =?utf-8?B?RmpRNmIwZXltQ0lTa0tXRFVnOGltby93LzF0LytUbWJmemtyRmI3NTB4R3BO?=
 =?utf-8?B?Z1AxZThmTStUekg4OTRTUkVXdmx4MW1aYW90c2M3bXo0TTMvUVE2N0RiTkZ2?=
 =?utf-8?B?Y05MOUM4VmhJc3YxTzlZZS85N2JyNHpFUUhqR281d2RXbEo4RFJ2YjdWZjFI?=
 =?utf-8?B?U3ZNNlVYcUFKYWQwRWlHcGNGMUphOUc5d0lPNW1Qby9EWmNWbHlmbnF4ZE1t?=
 =?utf-8?B?YlNidTBKc3pZSExZekgvdHJ2a3FnSmFDSmMwQ3hhYjd0ZW9QT2JGVGdqRGFF?=
 =?utf-8?B?dHVLYnFpQlNZajdjNE5jbEh2Z1BKRHUzM01rcE1MNGtkcDRJRWpnZnhsUjJu?=
 =?utf-8?B?cDVGNWJtTHFoUXQrNU8yd28xS0RIOWxkNFdqSkZmQW4ybkxWaWZVZklRRGlw?=
 =?utf-8?B?UzhPS0JYWExJdUJOUkp0L3ArUVR6YWZOYnBnM1RER1ZBRDRlSTROcVY1QS91?=
 =?utf-8?B?aUtYTmNMVjJTTkc2Q3RReDVmRjB0enJSaUkwdjlISUswTmIzQjcyeUh5WW5N?=
 =?utf-8?B?V0dGMHpMbU5HU0UwMVBFR2xnVktCM2V1RktuOU9CdVNleElBUWVZNURHQjlr?=
 =?utf-8?B?THQxd1kvK0ppUllFbkNpS1NKeUhZVTNVNWhQRkJCMHNEUlA5M21lanJIVWxn?=
 =?utf-8?B?OHpvdFNFTjlzajY5ZDRMem1CV3E5dEFEbkhKckJZcWU1NzF0TEp5ekdQN0hW?=
 =?utf-8?B?U2dvL2p3N1lmUnJNeWRlV0dua2ZLRER3dlhaWGc2QlB0b2h5YTh1elA1OUlr?=
 =?utf-8?B?d0N3TGw1eGdINVI4SmhBeFplTWtEdjJHOXlwQ1RWanBHZnlZZHNmSnBpbEVn?=
 =?utf-8?B?alViSGxlRnhJRExVbkc4aytCU3I5OEJjV0kzK0JFeFZSNWx3eXRTU3hTdzdX?=
 =?utf-8?B?azlKd3prc3ZaZEloVWRJSkROVnYrOVZGODJ3emN1aTZ6bUl2TE1JTVNJUmhJ?=
 =?utf-8?B?RnZSUmVNekZMY2tPc1BreWtaL3FYZXhTaDB3eDNWYVRFbUhkbTNsN0JCeFM2?=
 =?utf-8?B?dVErZ2FObkZHaWJ1eUwvamZVcjI2UW9aRXZ0U0dIaFgxN3VBODhNYzdobnRl?=
 =?utf-8?Q?rq0q3qXMMye8J?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(7416011)(921017)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VFhZUW1STCs0bEZralpVWXJxRmFaV3pBSmN5Y1FBY1NpVVZDeFlQZlBJb3pk?=
 =?utf-8?B?R25qcFBxTDl6THlVTFByUzNZM0Q5Q2MzYjRnZ2MxWmQ1ZG1ML1ZLMENwQkhl?=
 =?utf-8?B?WnBUc3R2YnpyZG5ScVZ0VFRiMmNSRHJ6cEJja2F4eTNadm1kK1I4cGdJV1RH?=
 =?utf-8?B?RDA1THREOERQeWRWZlJlcjhUcUNpbGVwdFUvVGZKL09uWU5tWGx1V0VpbjVV?=
 =?utf-8?B?ZlRzcTh5dExnWnVPRmRzeENaNC93YXJCNWU4eDBaTmZwKzBJTWlsTnRsRWp4?=
 =?utf-8?B?YzZBWncwTkRCblllUDd3QytjVWRYNEtiNFpoMXYySEdWNjJsQ1JLUUkrQzkx?=
 =?utf-8?B?cTJXdlFTZ3VNdzBDZDJZcEVId0tCYW1zbk1HS2U0RWZFelN0eURyL3VCcER3?=
 =?utf-8?B?eXRuTEM4NDBjN3E2VDdhMzIreXlVWFk1RWtjRCtjNHhoallGMkM1dTc2Q1Bp?=
 =?utf-8?B?N3lqTUdNdTAxVWVQeGVGOVZUZzlmcFBmSDRrUmVMSkdzNzVmTCttMytmQ2lZ?=
 =?utf-8?B?YXM3ellObGJYc0tFTTA3d2RZSlZPbXpJQnlRcmlLVU90T2JIU0c0VVlGSGFa?=
 =?utf-8?B?alh5ckliTitRZFhicVBseHhYR3UrLzhoWW5RdlBlK1ViUDhyU2txSlNyUmk4?=
 =?utf-8?B?SFR3MHN5emcvWUF1c0NyZW5wUFc5dm45VEQ3Tm0xeVEvY0twbDBVUER2STJM?=
 =?utf-8?B?MTd1VWg2dXFSei93dDNEeTBHUjhKK1JMT1lvcCtPS0JiK1VMVzBCTEhmRXhE?=
 =?utf-8?B?N3NYR2ltZDU5b3RzaURwVXArajJhd0MvaVJ0cjVCazZ0OXMxdXBJN3hlcVNa?=
 =?utf-8?B?amFMR2pjb3JJakZwQlBQQlljVXVKR1NPU2VTQUw4ZU9ya2p0YSs5dGdJYU41?=
 =?utf-8?B?M21QcmkwOXRuUjRqZGoxQWVPWUtncThUcVJOQUVrS0VBRU5mejBWT3lzYVlM?=
 =?utf-8?B?d0t2b093ZlhQOCt1ZTVWUUhKbEpka0lnRlNnUVlUbm1pNEYzeGZsY1hXZnhS?=
 =?utf-8?B?OC9sRSt1WGxKVldTOTRXQnY0TnJHcmp6RVR6NW94WkVPTFFOejFSbUdlK2Nt?=
 =?utf-8?B?K0N4ZUlwWVlpYThOYmN2OGVUZDdwODErZ25BQXR1RWFVM094Wlp1U3ovWXpU?=
 =?utf-8?B?aU9jYWtCMG9iYWptKzVQOXZuUzhvdjNlZXJCWFNFaGJRRDhTbWg4NXBMUmJD?=
 =?utf-8?B?bTh5SlBhR05QdkxtbzZiQktSbUNCVEtFMldBdUxlL3hsalMzS01aVVUxOWtR?=
 =?utf-8?B?Nmxoa0tTQ1Ztd0FBVDNpQ2lsbk9mZUtXc0hybjNCS01aUElpdGVJdjcxckVu?=
 =?utf-8?B?L08xbDRVeml2TDdCNjRiV3I0aWFOTjFkNjU4Q3N3Tkw2eVQ5cWJCUW8rbW4v?=
 =?utf-8?B?VUQzS3lzRkNuaVk2NXZtMVRsK255Zys0dHF4bU9xUzBxbmVIMjJxQlVEcjBr?=
 =?utf-8?B?NjZ6dHNoNGhzeklieS9vM2tENDhjZjJYenA5N05ZVXJjR0pONW1QS0VoK0Fm?=
 =?utf-8?B?R21aSnkyTmpuS05vR1hQNkN1M1dkOGNWZmpWODZFakV6NGNURnVKcjYxSkc1?=
 =?utf-8?B?UDlEYTE0SERkZmRkL3BpSGdiaS82KzNZTTg1WFhiZWIyTm56d3dJZFZLUkc1?=
 =?utf-8?B?aVZDTzdTVlh6aDVGR0RreTBsYS9lZmJHdzdqRkdvKzNVVVVQb1BIUm9SdTUx?=
 =?utf-8?B?SmxQT2ovK1gySmYzd0tKNmRiWWN3djFDbEEwN2diMFhFb2oyWEZTUFhnTWJh?=
 =?utf-8?B?eE9WRnB5VkUxRFN3NFVDUFVFSjBzcjdyNXB2QU05aFpHVVBTYUMycG16cnl5?=
 =?utf-8?B?V1EwN3VHV0QvYmU5QXNNV0x2SWx0VTh4aU1Dc1dFQVdRLzBYeXBGbEFyb25R?=
 =?utf-8?B?MTBSOSt5elJmbzF4bnFKNUtWQjdLQkpSSEZmRDVXaG1qcHY1WnMxaC9yQkRL?=
 =?utf-8?B?REJJaVBiOEFXRmV3VkxFTXN5WEdNdzh1Q0U4TmF5Ky9nc2RRK05DaUpudGhG?=
 =?utf-8?B?dno1UjBvSzQyYis4bnVKU2JndHZ1cnRmNnJLTGwycGNZbnNsSE5kNHlWTlh2?=
 =?utf-8?B?Um5xK0ZLbHFacy9ieWpFZGx5K3BsTW95dGh0VnozMUVOTW5IVWZweThkNUlj?=
 =?utf-8?B?RkZhN2lkN3Z1YkhsaE9QSGE2ZDNRNjNaejBhL0RBbmpxZ01lWEJtUDNLNHp0?=
 =?utf-8?B?c3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d7cca2-ca9b-4ca6-21ca-08dc91f3955b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 13:10:54.8053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lpjd+torZePfO6Lxm45jAmy04ihN88yXFGcQ5jtBkX+QKwMGg3/jusAs8ZQEJuwU6LiXWbyZpjS98xD1Cfe/dwx6fKSsOa8pfc3Nw2NZ0os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5555

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2xhdWRpdSBiZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gU2VudDogRnJpZGF5LCBKdW5lIDIxLCAyMDI0
IDI6MDYgUE0NCiBTdWJqZWN0OiBSZTogW1BBVENIIDA4LzEyXSBkdC1iaW5kaW5nczogaTJjOiBy
ZW5lc2FzLHJpaWM6IERvY3VtZW50IHRoZSBSOUEwOEcwNDUgc3VwcG9ydA0KPiANCj4gDQo+IA0K
PiBPbiAyMS4wNi4yMDI0IDE1OjU2LCBCaWp1IERhcyB3cm90ZToNCj4gPg0KPiA+IEhpIGNsYXVk
aXUsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogY2xh
dWRpdSBiZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4gU2VudDogRnJpZGF5
LCBKdW5lIDIxLCAyMDI0IDE6NTUgUE0NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAwOC8xMl0g
ZHQtYmluZGluZ3M6IGkyYzogcmVuZXNhcyxyaWljOiBEb2N1bWVudA0KPiA+PiB0aGUgUjlBMDhH
MDQ1IHN1cHBvcnQNCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4gT24gMjEuMDYuMjAyNCAxNTozNCwg
QmlqdSBEYXMgd3JvdGU6DQo+ID4+PiBIaSBDbGF1ZGl1LA0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IENsYXVkaXUgPGNsYXVkaXUuYmV6bmVh
QHR1eG9uLmRldj4NCj4gPj4+PiBTZW50OiBGcmlkYXksIEp1bmUgMjEsIDIwMjQgMTI6MjMgUE0N
Cj4gPj4+PiBTdWJqZWN0OiBbUEFUQ0ggMDgvMTJdIGR0LWJpbmRpbmdzOiBpMmM6IHJlbmVzYXMs
cmlpYzogRG9jdW1lbnQgdGhlDQo+ID4+Pj4gUjlBMDhHMDQ1IHN1cHBvcnQNCj4gPj4+Pg0KPiA+
Pj4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNv
bT4NCj4gPj4+Pg0KPiA+Pj4+IERvY3VtZW50IHRoZSBSZW5lc2FzIFJaL0czUyAoUjlBMDhHMDQ1
KSBSSUlDIElQLiBUaGlzIGlzIGNvbXBhdGlibGUNCj4gPj4+PiB3aXRoIHRoZSB2ZXJzaW9uIGF2
YWlsYWJsZSBvbiBSZW5lc2FzIFJaL1YySCAoUjlBMDlHMDc1KS4gTW9zdCBvZg0KPiA+Pj4+IHRo
ZSBJUCB2YXJpYW50cyB0aGF0IHRoZSBSSUlDIGRyaXZlciBpcyB3b3JraW5nIHdpdGggc3VwcG9y
dHMgZmFzdCBtb2RlIHBsdXMuDQo+ID4+Pj4gSG93ZXZlciwgaXQgaGFwcGVucyB0aGF0IG9uIHRo
ZSBzYW1lIFNvQyB0byBoYXZlIElQIGluc3RhdGlhdGlvbnMNCj4gPj4+PiB0aGF0IHN1cHBvcnQg
ZmFzdCBtb2RlIHBsdXMgYXMgd2VsbCBhcyBJUCBpbnN0YW50aWF0aW9uIHRoYXQNCj4gPj4+PiBk
b2Vzbid0IHN1cHBvcnQgaXQuIEZvciB0aGlzLCBpbnRyb2R1Y2VkIHRoZSByZW5lc2FzLHJpaWMt
bm8tZmFzdC0gbW9kZS1wbHVzIHByb3BlcnR5Lg0KPiA+Pj4+DQo+ID4+Pj4gU2lnbmVkLW9mZi1i
eTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+
Pj4+IC0tLQ0KPiA+Pj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3Jl
bmVzYXMscmlpYy55YW1sIHwgOA0KPiA+Pj4+ICsrKysrKysrDQo+ID4+Pj4gIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykNCj4gPj4+Pg0KPiA+Pj4+IGRpZmYgLS1naXQNCj4gPj4+PiBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvcmVuZXNhcyxyaWljLnlhbWwN
Cj4gPj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvcmVuZXNhcyxy
aWljLnlhbWwNCj4gPj4+PiBpbmRleCA5MWVjZjE3YjdhODEuLmMwOTY0ZWRiY2E2OSAxMDA2NDQN
Cj4gPj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3JlbmVz
YXMscmlpYy55YW1sDQo+ID4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2kyYy9yZW5lc2FzLHJpaWMueWFtbA0KPiA+Pj4+IEBAIC0yNSw2ICsyNSwxMCBAQCBwcm9w
ZXJ0aWVzOg0KPiA+Pj4+ICAgICAgICAgICAgICAgIC0gcmVuZXNhcyxyaWljLXI5YTA3ZzA1NCAg
IyBSWi9WMkwNCj4gPj4+PiAgICAgICAgICAgIC0gY29uc3Q6IHJlbmVzYXMscmlpYy1yeiAgICAg
ICMgUlovQSBvciBSWi9HMkwNCj4gPj4+Pg0KPiA+Pj4+ICsgICAgICAtIGl0ZW1zOg0KPiA+Pj4+
ICsgICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyaWljLXI5YTA4ZzA0NSAgICMgUlovRzNTDQo+
ID4+Pj4gKyAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHJpaWMtcjlhMDlnMDU3DQo+ID4+Pj4g
Kw0KPiA+Pj4+ICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHJpaWMtcjlhMDlnMDU3ICAgIyBSWi9W
MkgoUCkNCj4gPj4+Pg0KPiA+Pj4+ICAgIHJlZzoNCj4gPj4+PiBAQCAtNjYsNiArNzAsMTAgQEAg
cHJvcGVydGllczoNCj4gPj4+PiAgICByZXNldHM6DQo+ID4+Pj4gICAgICBtYXhJdGVtczogMQ0K
PiA+Pj4+DQo+ID4+Pj4gKyAgcmVuZXNhcyxyaWljLW5vLWZhc3QtbW9kZS1wbHVzOg0KPiA+Pj4+
ICsgICAgZGVzY3JpcHRpb246IHNwZWNpZmllcyBpZiBmYXN0IG1vZGUgcGx1cyBpcyBub3Qgc3Vw
cG9ydGVkDQo+ID4+Pj4gKyAgICB0eXBlOiBCb29sZWFuDQo+ID4+Pg0KPiA+Pj4gQ2FuJ3QgdGhp
cyBpbmZvLCBhcyBwYXJ0IG9mIGRldmljZSBkYXRhPz8gQmFzZWQgb24gZnJlcXVlbmN5IGFuZA0K
PiA+Pj4gZGV2aWNlIGRhdGEgaXMgZW5vdWdoIHRvIGRlcml2ZSB0aGlzIGluZm8/Pw0KPiA+Pg0K
PiA+PiBXZSBjYW4ndCByZWx5IGNvbXBsZXRlbHkgb24gZGV2aWNlIGRhdGEgYmVjYXVzZSBvbiBS
Wi9HM1Mgd2UgaGF2ZSAyDQo+ID4+IFJJSUMgY2hhbm5lbHMgdGhhdCBzdXBwb3J0IGZhc3QgbW9k
ZSBwbHVzIGFuZCAyIHRoYXQgZG9lc24ndCBzdXBwb3J0IGl0Lg0KPiA+DQo+ID4gQ2FuJ3QgYXJy
YXkgb2YgYml0cyBmb3IgdGhpcyBjaGFubmVscyB3b24ndCBoZWxwPz8NCj4gDQo+IENhbiB5b3Ug
Z2l2ZSBhbiBleGFtcGxlPyBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIGhvdyB5b3Ugd291bGQg
cHJlZmVyIG1lIHRvIHVzZSB0aGUgYXJyYXkgb2YNCj4gYml0cy4NCg0Kc3RydWN0IHJpaWNfb2Zf
ZGF0YSB7DQoJdTggcmVnc1tSSUlDX1JFR19FTkRdOw0KCXUxNiBmYXN0X21vZGVfaW5mbyBpbmZv
OyAvKiAxIG1lYW5zIGZhc3QgbW9kZSBwbHVzIHN1cHBvcnRlZCwgc3RhcnRpbmcgd2l0aCBjaGFu
bmVsIDAqLw0KfTsNCg0KLmluZm8gPSAweDMsIG1lYW5zIGNoYW5uZWwgMCBhbmQgMSBoYXMgZmFz
dCBtb2RlIHBsdXMgc3VwcG9ydGVkDQouaW5mbyA9IDB4MCwgbm9uZSBvZiB0aGUgY2hhbm5lbCBz
dXBwb3J0ZWQgZmFzdCBtb2RlIHBsdXMuDQoNCkNoZWVycywNCkJpanUNCg==

