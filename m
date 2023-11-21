Return-Path: <linux-i2c+bounces-375-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6893E7F35B9
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 19:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F051283454
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 18:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED242209C;
	Tue, 21 Nov 2023 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="V/XU6pM+";
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="rgkI3fIx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com [67.231.150.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118D0193
	for <linux-i2c@vger.kernel.org>; Tue, 21 Nov 2023 10:11:50 -0800 (PST)
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
	by mx0c-0054df01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3ALGnCri016324;
	Tue, 21 Nov 2023 13:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	selector2; bh=Ctk4/1SGNEo9jbIdbG0Ka3GzY01ED/7Ve8LUg38n5qA=; b=V/
	XU6pM+/sXhAt6eRC8bUqOLvNXa42cIWQvbKDgGNaH0WlNl9fFRN3hQNjSTgzO3KW
	A+cy6LELafed7jqGGuLhk44omx7/7P+7/Fus5wHRs0XwITMv4F0rKbxU6FH8cKqX
	iAwn50HTdONlseoxs8A8CY9r6q34tLPAzTzVkyflwSfISsLgoh+3SoJkvkRF120G
	AD3u6QscvrOgweBPzUpi/zmMArtNIB9qitR6Uv1k0/PTaD+tPM7/YQBDKLHVg1/e
	GB17EEWUCLIM3Ohl4Ik/W2iuJ4GSvlQtyZ2T6bRN84raoAojRZbtUlQO3LshWpQI
	qCdhSCwD+sU+96HuBtwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	selector1; bh=Ctk4/1SGNEo9jbIdbG0Ka3GzY01ED/7Ve8LUg38n5qA=; b=rg
	kI3fIxH/Pk+NsRmy/EcxGl1OraV6szqtcENG1/MbTfVOvY9VzKRSjwhiTpJLNyvz
	gn/plW7Llzlo4xkjU8VV55CFeK8KGxdxgV2gWWmcvjpqNLIxqHBEi7DNdw8i9XXj
	8zhJnqkTS+dWZ373rucM9gLAu2r+Y6Rg4Vkpo/j0ay23EunURouHtlYQuSNGdbc2
	xsAdA3IHvOFqUlaHhBc7b74WL5jXtfPz7kP7wHXJqEYUaJt1oZ0R1cG3eAIZu//O
	ZVqEqFxttYXaUmiMviBU5z63GMXxYs6XQwRsPhKEQHgrolhNxn7Wrbt6Ri3jzD7y
	o/WdM0bjukpSLYrYiffQ==
Received: from can01-yqb-obe.outbound.protection.outlook.com (mail-yqbcan01lp2232.outbound.protection.outlook.com [104.47.75.232])
	by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3ueu25adeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 13:11:41 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hjrqpj7V69fBpL9nU41bMz07UGl7TLcRg0OWgs8tFX2x+9zP5SkomRmxxP4wg9Bp3fb9XIwOPy9z+oA5VaS3QElHelyqElJOyTZQyvrmhWdiH/zgpxeG1Q3g0WF4Zp2h8lVpecRfUyGivdmcTPnYBtdIZchjW5Ifxs9BT4VpTYLRwQ5plbIqC60rk4zETBVlpigheA8QDPPjYa9qcoD/pmsZotatvwAUCgbfTpUbUet8i/K5fNS0ogzuTnxI3Yrt3il2S8EGomLBgrFy3sqhCekOQzkMGs6uZY07DsKHfr14i+vHoeqLpp/nRLfAPaczPJHMqiCO8H67l/VRzyi19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ctk4/1SGNEo9jbIdbG0Ka3GzY01ED/7Ve8LUg38n5qA=;
 b=AuyKwK4Q/bHQ/lK0p4bTu9ciaVfgyeSDvmFg4e8cOTuIBbzxz4kHW6YLXUD4jlab1TlHYdBcP1fwtxUvQ6EgWQZDqcqSYlDJb/B5V2vHTugKNHbOPAi/bzbOCAxvgojdWf+57iGECwQCYCxYNvdPg2mWjyhfwpdK2O+sHBGQ/0FRIc3JXIRrw6Fu/0feBeRPYP7X1MOkYEQgGZ9IgETOGaJnFXHz/ZjjmunXfZ78GxyBC7LqtaxwRU1gWoAAZFDazAYnde1nC4XD9KaaqSgemBDhI+mOXkHp4xTm1McJR7ldL1cnuP8cU5j9F0saYI/5rtfJ//HoQZbmXbXnxIAYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YT3PR01MB9202.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:7f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Tue, 21 Nov
 2023 18:11:40 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af%5]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 18:11:40 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "michal.simek@amd.com" <michal.simek@amd.com>,
        "ben-linux@fluff.org"
	<ben-linux@fluff.org>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 2/2] i2c: xiic: Try re-initialization on bus busy timeout
Thread-Topic: [PATCH v2 2/2] i2c: xiic: Try re-initialization on bus busy
 timeout
Thread-Index: AQHaHKYsDs5uhos3i0Gs2OVv35zHkA==
Date: Tue, 21 Nov 2023 18:11:40 +0000
Message-ID: <20231121180855.1278717-3-robert.hancock@calian.com>
References: <20231121180855.1278717-1-robert.hancock@calian.com>
In-Reply-To: <20231121180855.1278717-1-robert.hancock@calian.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB8838:EE_|YT3PR01MB9202:EE_
x-ms-office365-filtering-correlation-id: e849c788-af0b-4dee-d32a-08dbeabd4f6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oWEHPnN0nWJxp52gj4grZ04C07R2wmaJzO02KPOwXhoG3MLDkvEFBInk9tOJ0ve86Rrdq4PLMIw4H2ppVQStsYeFAN2nqUvlSDIndYcd28WR8v6FB+oRJUX7f140HqGYHrTvqsMlIiVvnwoZckYzBpMTud4AOwHdPu0gul/5GKQz8x8TP0ZKMzZ8nmK/RwRPgrMWtGuMq8Y+W0w4m+XynTeQqHrotEP2RCHi1agxamol+3putOgzOQ9DgaR7cs1Chz8ppQZJXzvTTroQvq49u+rskezkVao3cXAXAlwWTJZgoq2HBKFggTr3a7Eh3AabLqWNXCM3sJ4xXVher16NWmFaYF/W4REjKPCQzUdIaS5jdJ13bLRzkwut+1lz+4nx+7rJpQeRLMkGUhtwr0tvNN+rIp1KB9HoG0JaK87shNPFtH3Ao0IGadYJy0MVpMBpizzf4coq36uukGAvJHtgwxclu1961XSyKvq7lPJO4gOGyagGMhrOJHtFuVXtyePAB3DvNhhc5uGho4r/oA3WWzM6AQlF7J/zP7brwRehhaibWvhSCD3LDldNxwoKLlfZVb91ZTD16xWdrvF62V5X+alJ5frbcGbF+g387vu0LwrGvYgNltXNg+E7guYLYWi2
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(6512007)(71200400001)(6486002)(478600001)(122000001)(6506007)(316002)(8936002)(8676002)(4326008)(26005)(38100700002)(66476007)(2616005)(110136005)(91956017)(76116006)(66946007)(66446008)(66556008)(64756008)(54906003)(83380400001)(107886003)(1076003)(44832011)(5660300002)(2906002)(41300700001)(86362001)(36756003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?XvaOw7Q5X6V5++V7aVZv8jZeGrY8YT2AgoKnVNYove9hpDGMnNdbbbDKIK?=
 =?iso-8859-1?Q?xPJkstxNeoy85o1cUVb+EHgIVGVnLgcwNS9JziaGB9rvh/9U+NwsLUnNwN?=
 =?iso-8859-1?Q?cE3JOqifX1jiJbG/OiiyNQs0s2OGFS1isfZ2u2lYfAf7FmLRhNzLyBFihi?=
 =?iso-8859-1?Q?V5Vztvf0W+G/OT5UgAUxRZfWZn2AVnZteKn2olH7F3aUSfLjdkvL8arMmx?=
 =?iso-8859-1?Q?a9yCMpyI9qrANxvoCD6bY0cCjrm0UVfgXsn+ZZ6063M4mNfukIs7SGALr4?=
 =?iso-8859-1?Q?hDma3QYOIGT7V5VLcm/ZdEDv4ji2IgYfKTHkI2hQYZ/QiwjUJLGsTKjcB5?=
 =?iso-8859-1?Q?kZucctUEWBETwXbXtTdcigbuuNc07W3qtbBdeoEfq9vxmTZnpA5TLzbB8k?=
 =?iso-8859-1?Q?rerby1vboiQdMthS5VKP1bc4vZLyj9OzY78KdQmm4hnIptIvE2QC9ah0ec?=
 =?iso-8859-1?Q?bArQuE/CW34AYU4NURyjDzgbDoMn7SAxmkj6iOUghc3u7lzQBtw8yI9x27?=
 =?iso-8859-1?Q?Wu8h/CBglHU9cN8Bp4ny5ecFRlnXxcbfeI/heasjMQ7NurP5HO44HQMMw3?=
 =?iso-8859-1?Q?qKSIXPtIPXFCR0sDywe1zztX17dsQI7TjKSeZbN4RlvmWmsaWc571w1N/H?=
 =?iso-8859-1?Q?XJOoEKMt0WYzLzPjBT6299bYfN//K/FV/oCaqczvvcpZfhNG4wTUA4BePZ?=
 =?iso-8859-1?Q?nY81oWEvLPz96a5F6yMJJqCBr4NT881rfpZySbDKqTrkB+hnbzSQ2gB888?=
 =?iso-8859-1?Q?ZQGtFZe+bXK4BYkLi0XxcUnVHUc93nzSVDNbxgpnf24QbQsRx8XSf0KQ8d?=
 =?iso-8859-1?Q?bWyl1Qt7b6F6pgE2J1jR0tT8bNsrAKPnmveHyxo3wXNwjB/SPSr/AUD+b1?=
 =?iso-8859-1?Q?xm/w1H1ZLMT1DJ6wc2PCai9Ea3m2WduLOFwgHG3BFeaTuOEiQbuTRBp0Vw?=
 =?iso-8859-1?Q?aQJ/wT1smO1hHxKMFsNeesORtHHl/8PHM9dQRxfP/FfPetEY52e/4/e+52?=
 =?iso-8859-1?Q?hIO0cxer6D5VindBgYjwLabstprUtOlTY/ytdRL7kh/p+kWSlutGKI/XEa?=
 =?iso-8859-1?Q?/6QE7XrCzURBkC1wHPddaDPrDskoYMDsuL9IPVmuk1smSrXYaHChIpvTwp?=
 =?iso-8859-1?Q?PWxSqMnYSglGHWNWtN0VqhYxjlfH505jSwSVGIxDQGKAk1xGO/rbOpGOPl?=
 =?iso-8859-1?Q?CHWYHY087e1f8iReZDhxwSacNYnqQ4yKhaPHpbHcveRCNDwvL8HjSm+yf9?=
 =?iso-8859-1?Q?CvfLX8PlFQ+VTVSjetoAsezHYUoSKCIjVVDXSxjDjo6oeuj6ufV9+gZrlv?=
 =?iso-8859-1?Q?GXSZt9FGOpq0Xj92yydy+RiEuwLxsTdyobkVtcwUWJ7f07d/RykDHgPu29?=
 =?iso-8859-1?Q?jaAKbDyxy/+zyKlTcZIdLBdaxqvxGW4KBOX5nUjhIOh4T0kZ+KoK+VXs2f?=
 =?iso-8859-1?Q?oOQo8/Pa+U8/jGAIGzeL71zFUVxZibZGeWnEGPdcdQIUY0cb4awiAHhZ5I?=
 =?iso-8859-1?Q?hVOkEW0bf6c7QeNGOJpsDXZixUjoUh0Zz6oLlloQaA9xWOIJdxwG1Z4QFg?=
 =?iso-8859-1?Q?nwv+09N8Xn/3rot2/kio6CMUQY7mWc8zTUg2l7SO829BMRRAU4vBykxApT?=
 =?iso-8859-1?Q?uFJpQWHVQQN7Ql1Zsx1ZQa0cgkbETqyQaCZVIf9f5iwxhyStHm0rfOLQ?=
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
	DYKunyqUm65SS5tjr5C2lw/EcrGICNZboUz91KMBT6PDu+dpvMX7Vr2HYiLj8MyCDsid9McsfhOE5D+9kZthBn1VSC0MARG/JsMq6cp/aI3QQ/Znj9Y3UKiU82tkd9I+Zqw4TNAebZzzO9NmpvaJTwBN035XYlo54CTy9O2SwVAmX1zOxCJrYXRo/qzm6xeXWEihQNXOp4L8BC1OY67CvJQHQx6EkBFo93CG2/JMi6KtyT3lfy40wDyjPdOP6EkR0Irq+jM5k9OILc8lHGlnaDQMapRmTMC+Yjal5//kEdRdv9tonJ3+KEwgvGwzXNDz691xs/FVwh8zm0Qau1JlDQIIMo8h/+9xamwvit0UkDh5gbc7p8owTBadisIqHMAGtJRggOYe7w1wJg5ysnLV3bMVedVXudhkfouMPdGjAvepK+z9aPSbxGzdgAMmhGHJ9bplLKObAkMFoD86366dFMPCSIi+9dzs73q/7eeyVI6NAgb9rrBPJFQHCK7bziyYgsyob7DKOAtfj4yJHreYDY4yFLjgr8SdOvHLsZZIhAAM/+8xR2GEpktSesL8DXmKrcY1y15pkkg/OVAJOen1fKG3BTeXa4mOVWhL1FrVwSoQYLucSzPCANzoQIpM8WysgpVMbDkCglok96XaSv5eRyPRO6NsMSREizOoCl0sy1ht5sxwwY0pNRPAlGg71FMe3MO8/4Cp5FqzWQKhoW8V8Udz6kQq/wd9NTs1BKUDHgzZAYQUzu6m71OISvDwH4+bm/kzNkByjbJdtZoEDnviI7LjPlIrgAtdcu0AU5lz7gO3wpaiNFf0l0ZO2ZA/Ag9mIPm9ZkZv4zX24reqX/nvFfNAc/TkfFhFXUVsfLko7n4kyUZ4KqAdWPnLLMDpJEqMr5nWhdB9LVCP5IFMb2xmaLIifxoqozbLj3EQrUrOQWY=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e849c788-af0b-4dee-d32a-08dbeabd4f6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 18:11:40.5409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I8FEAk7HuEeUUBSme6Bxiwkv4na4DqyRRrdGx/BozvuqrbgY9rA3i2StFK/pZTx0689zQZoUphGOdsY8sOvJMwk/ppYh6RsdqqoLo+0nqak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB9202
X-Proofpoint-GUID: fX_Z6wvyCKpfZ_TZZu-DQzi0CJrORJfn
X-Proofpoint-ORIG-GUID: fX_Z6wvyCKpfZ_TZZu-DQzi0CJrORJfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_10,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Reason: orgsafe

In the event that the I2C bus was powered down when the I2C controller
driver loads, or some spurious pulses occur on the I2C bus, it's
possible that the controller detects a spurious I2C "start" condition.
In this situation it may continue to report the bus is busy indefinitely
and block the controller from working.

The "single-master" DT flag can be specified to disable bus busy checks
entirely, but this may not be safe to use in situations where other I2C
masters may potentially exist.

In the event that the controller reports "bus busy" for too long when
starting a transaction, we can try reinitializing the controller to see
if the busy condition clears. This allows recovering from this scenario.

Fixes: e1d5b6598cdc ("i2c: Add support for Xilinx XPS IIC Bus Interface")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/i2c/busses/i2c-xiic.c | 42 ++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index fd623e8ad08a..0950fced2f91 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -843,23 +843,11 @@ static int xiic_bus_busy(struct xiic_i2c *i2c)
 	return (sr & XIIC_SR_BUS_BUSY_MASK) ? -EBUSY : 0;
 }
=20
-static int xiic_busy(struct xiic_i2c *i2c)
+static int xiic_wait_not_busy(struct xiic_i2c *i2c)
 {
 	int tries =3D 3;
 	int err;
=20
-	if (i2c->tx_msg || i2c->rx_msg)
-		return -EBUSY;
-
-	/* In single master mode bus can only be busy, when in use by this
-	 * driver. If the register indicates bus being busy for some reason we
-	 * should ignore it, since bus will never be released and i2c will be
-	 * stuck forever.
-	 */
-	if (i2c->singlemaster) {
-		return 0;
-	}
-
 	/* for instance if previous transfer was terminated due to TX error
 	 * it might be that the bus is on it's way to become available
 	 * give it at most 3 ms to wake
@@ -1103,9 +1091,33 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, str=
uct i2c_msg *msgs, int num)
=20
 	mutex_lock(&i2c->lock);
=20
-	ret =3D xiic_busy(i2c);
-	if (ret)
+	if (i2c->tx_msg || i2c->rx_msg) {
+		ret =3D -EBUSY;
 		goto out;
+	}
+
+	/* In single master mode bus can only be busy, when in use by this
+	 * driver. If the register indicates bus being busy for some reason we
+	 * should ignore it, since bus will never be released and i2c will be
+	 * stuck forever.
+	 */
+	if (!i2c->singlemaster) {
+		ret =3D xiic_wait_not_busy(i2c);
+		if (ret) {
+			/* If the bus is stuck in a busy state, such as due to spurious low
+			 * pulses on the bus causing a false start condition to be detected,
+			 * then try to recover by re-initializing the controller and check
+			 * again if the bus is still busy.
+			 */
+			dev_warn(i2c->adap.dev.parent, "I2C bus busy timeout, reinitializing\n"=
);
+			ret =3D xiic_reinit(i2c);
+			if (ret)
+				goto out;
+			ret =3D xiic_wait_not_busy(i2c);
+			if (ret)
+				goto out;
+		}
+	}
=20
 	i2c->tx_msg =3D msgs;
 	i2c->rx_msg =3D NULL;
--=20
2.42.0


