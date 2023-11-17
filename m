Return-Path: <linux-i2c+bounces-214-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95287EF768
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 19:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F695B20AD9
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 18:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEE5433C4;
	Fri, 17 Nov 2023 18:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="WoFrOLMT";
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="DeFiHQSs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com [67.231.159.91])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645A6D6A
	for <linux-i2c@vger.kernel.org>; Fri, 17 Nov 2023 10:19:07 -0800 (PST)
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
	by mx0c-0054df01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AHHo8SE012164;
	Fri, 17 Nov 2023 13:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	selector2; bh=7GoMAZT+cFHI5w2j68ZleiTSqVJtBTZFGotaf7W7sck=; b=Wo
	FrOLMTY7DBS0BsZsyrTUl0ZMytnk0RDKgKnZW+NTKqSKaR78C+CPZV8jwFNMX8kV
	xUrSRrW0DLrE6VRNvo/SB7jP/ZGn+ci7Di2lxK7ToXV8sPALMLORu5X8frvSQ94L
	SBzCyd4cXOFJATGmtanL0/jTXpWiQoCVoIV3Hhh1SYHjt/p8Pg1QiwK4IvtszmkI
	gKB9wSBwP4hJ8PglUmYaWauO8Wm6RmPLkgO95Rscr3SamDFAM99Xv0L/QLEFaHDZ
	jW05vCbWA6hEVy3lFGYFGtu7odXI6sKr/Mdevv7rNzlhDFDXo9MN4H1+z+UySE5A
	xXLWzxg2gJm7acKFFwjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	selector1; bh=7GoMAZT+cFHI5w2j68ZleiTSqVJtBTZFGotaf7W7sck=; b=De
	FiHQSs6bAtCSa6sGjqobm8xHjbFnuRGiEgHRobY+Kqv/9bIqjqpNigQ39WkUXcyy
	xw1SyVV+S0xt5LKl2far10zN/R20l/btqY84W4NDHE5+4ImDas+UXbFkqqDfMtZK
	Sq/V51HRI0y4z4E/9HE/+NQc9N3NzsvgwrnhNbyYQYo6NlKuJW86sfQ1g6vqHPq7
	trgzByPqxzy4t13LtnG5xiDfSSaD37SEsuaiL8mfSvSdGNpPmTzLvT8VbmvcXCDn
	F3iD9co1vK8mtpOSamWFvlvCaRYchvr6u7yauoDFn8BXofWlpk0+5wqpBmXWlNSD
	d+1hi3qLW1nC7XFVH+qQ==
Received: from can01-yqb-obe.outbound.protection.outlook.com (mail-yqbcan01lp2233.outbound.protection.outlook.com [104.47.75.233])
	by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3uduwq0u2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 13:14:39 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQhamM57c6MgSQtZzoO63TUqFJjoZxEXMxduafhZuXeONufogcS1UbP65Kklrp36vTgW5sDBuKXa8OwxvG9FSktlxA2ONRLO9LoPu4OhNowe66N/MD8iCUU3vKlKqF/cm74i6NA19pCIj8ggnTJX9y/jTjcJOU89z3ZCuNMQR+LVhmOqYH4kv6bMStjTY1bFDRm3180yCJP3kl+pe6We0Av7Nw6A1rha0Ky0zLnNFAd8hRsqOhwD778pB2PA6t6EBf3iHAWYFHFhD3e310y5A4uWkGJFxkdzP5ntrLA5NxdVu02n5JFQtydcJk0d6U3AQbMFU+3eCH+Hj/OYlytlUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GoMAZT+cFHI5w2j68ZleiTSqVJtBTZFGotaf7W7sck=;
 b=H2vWXSwYAzukILobD5sDHOyU7g/69ZtViN2UYyUCsN6nKg4rpxQrAis9zWNamqGr2vJeE4xkmFiAw9BGt9oXed/j2RWAgO+kEjYs7nNpAdmrziInQSuxF5aVSSacth64phPk4jngJf74Q9ZbM3DLWgfSO/GLuBh/BTt0yOq+Gp+dxBe1SlZ7TJ6Xr7ZKJb4j31Mpm3/IN06rkuKkKSeH7M14sUFEH9YZAjHda7G4Ay5WVvP/beZd+PXphALhiPOlfMCBrbYOrIr4NL82QYaDWGpJlJFLcVxXwjBQrqpQCsRS8y5NfiY1wem3GqHAzAMv81xY/0su7PN13Hwj7ditlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YQBPR01MB10797.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:73::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 18:14:38 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af%5]) with mapi id 15.20.7002.021; Fri, 17 Nov 2023
 18:14:38 +0000
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
Subject: [PATCH 1/2] i2c: xiic: Wait for TX empty to avoid missed TX NAKs
Thread-Topic: [PATCH 1/2] i2c: xiic: Wait for TX empty to avoid missed TX NAKs
Thread-Index: AQHaGYHtEoEebCqWzEavNcJ8AuRGbQ==
Date: Fri, 17 Nov 2023 18:14:38 +0000
Message-ID: <20231117181238.3989861-2-robert.hancock@calian.com>
References: <20231117181238.3989861-1-robert.hancock@calian.com>
In-Reply-To: <20231117181238.3989861-1-robert.hancock@calian.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB8838:EE_|YQBPR01MB10797:EE_
x-ms-office365-filtering-correlation-id: 980777b9-afd2-4f58-4d9b-08dbe7990fc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 K5E09Eyk2J170p6yt95SBEdh0EYBberOfw8JO4/11zZdZxfOQ+KS6+OJMkcLdBCrBQZGoogCffeHIVshyUGtr5oz0RD4EaDM7osTdRucIuEqshTFVZmkdCWYYB9s8VWqKRebgIDL40PQQHA2mWb7jSa3w6Q25U96jsekXsueDAE/xwQVmQcdAcBw6uINu+GA7wdXlk5yp0tdfTGpj62h0fDoBbfW/1nCL8+qX0eup7xlHO7rm62gYhGk8jY9Cvz+UGg2e4B5GyeAOtsqcVaWU3Vv5W6YsxYGy460ykHbOliCtIPtnIba81zOzsw77z76CW0ia40HNqctYKrXL8pPYGiLQGJDgMat32eSH6ZOKyWM9ozA2nbuD61nZrRIgeOnK04NHxHJI4Pm0lHeNOjf0Jtf3Ikyg9gc58X42iYK2f73tNCroShe0IBtxI74sI50iKp+xBOhaXTYw9TEN5Ch/swVTybtNrgaLBSkJqld97gJnBdj0m3WAgSmEgvzM2y6vXHoWLxxiteUpZQR99p/4cvNey4LMWmJ0VWFdKOrJkmV/bUeMoiSKluSv+dl4kJK+bS9N6v/722Gq+C/+pt9U/XUiOvFDREI3WrYoNR6uwU47oJEj7TLGZPEgZi0oU7Z
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(54906003)(66446008)(5660300002)(66556008)(66476007)(64756008)(86362001)(110136005)(66946007)(76116006)(91956017)(316002)(38100700002)(1076003)(26005)(83380400001)(8936002)(8676002)(36756003)(38070700009)(4326008)(44832011)(2906002)(41300700001)(6512007)(478600001)(6486002)(122000001)(2616005)(107886003)(71200400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?6KqorO33tsW0PtfhvHsIOgx9kC/aHQoGXHgBqkSHtXnXqV/PF7+/+a0edj?=
 =?iso-8859-1?Q?N6qaMsmEwh0GNvwEn3AZRkadM5lbQtcLAfoCGlgzhA2X8pHwNXYt8JpbQ3?=
 =?iso-8859-1?Q?mT5Yc0HPuVnPlZ1uQCMSym2XeIBtXXmg/jvI6nZFN03HHG6LFRg3KnTn+q?=
 =?iso-8859-1?Q?geG0+6nXwjoJRdXHfSiAXhAPoOyDvjN9Ru0nTY/2xB3ckO9JPY4ufwJjUF?=
 =?iso-8859-1?Q?NURelCeQCjR3XQJNh3patJHj3s7mqYsKnkjeFoNy1lVtwTj8txgjuKwnUx?=
 =?iso-8859-1?Q?0vkT6MJ7bIEBI6KP8rN1HoqwKkzsx1mt5iHZqgBMYppGYzL/zlYkgam/1L?=
 =?iso-8859-1?Q?nVnUMakK9tifZa/wtApQjcbwxw2/YJZeXFol/El4AonEFG6AoMA49iuWzQ?=
 =?iso-8859-1?Q?WToU8lsJDH1wuaOOXdZgUJjD9vOHg+JT+j1bhPPlmIMIorYkvd98qhyWd9?=
 =?iso-8859-1?Q?wpj/V39ZHADNsKzDj/tVakN3mm8yxxw+nzSnd8z1ww0taNvlcyRo2Y92YM?=
 =?iso-8859-1?Q?LO6dw1bMLFV5RA/nH7NXJdDWLxr8zhYJ2ZP3HYgSba033CKHSWm7nSJwxE?=
 =?iso-8859-1?Q?p8AsLOKpd3v9s76OpbPrmF3I+Tyc4Ef4nZH6b1D8/w4lDhiyf/OXxrjEcF?=
 =?iso-8859-1?Q?92x669NHzOilt5ODVtJHLDF1l3DYk2PUzDE7cuZNzkIfI7JUsVlTny/LLO?=
 =?iso-8859-1?Q?ayxk5pKEz0a2Bf1Z5Ye4V+9MWFFA63nkGzNDvsLnLVfTL4gqzZKd7zQAGI?=
 =?iso-8859-1?Q?qgZKQTOhKxMNXAuckfqNgWJRrdpV+VVedV8VNMh1nEAN1RYbOtXJQ8w+Ut?=
 =?iso-8859-1?Q?nvjsXz+ZOP1//FpBE30T/jxXhPAM4fcQwxfjAyiK/U3ANgTgPZ+0JvqLiz?=
 =?iso-8859-1?Q?1HK/80riJmxoX5d0Q8iABVjNEmPQsdHAK2rBHVWVQ5HJ3NfOY4+sK9kvw+?=
 =?iso-8859-1?Q?d3YwMr6h6xYCJWTiHOskD43RkIpJBoi3GIdT3PRvcjuB0uUDa5HmtWFhpJ?=
 =?iso-8859-1?Q?e8G6WdsuowgY7IXRvYtKdfHZnxcAtTTkuEPc8Ji5ozNEkuFGKuohbqit99?=
 =?iso-8859-1?Q?Leg+fCXzCXhW5miUJt+B623okEbGbT8dTQ6BAzABmN+yzAYS4jf+TZfhYG?=
 =?iso-8859-1?Q?hQ7UDJMqI0xWVt6JPeCxH7sVR0uSaM1dJN9BSVX3ypOOHCYDTwx/IzVIzB?=
 =?iso-8859-1?Q?Ytr2TbrbvAA6gH0mO16Jgg1WSJgr/ScFLsuNz1tQjC6J0K7aTUrfVV1f7w?=
 =?iso-8859-1?Q?Hoiw6P5zOYcZUqUkIaNOMLl8J3hDFpvm9LQVxzlQld0dzw1ssay2yCIBXS?=
 =?iso-8859-1?Q?c70RVm+AAMqewrYDWXdiLioaXtRiI2K7cyOh/nfT5NzslP/6+UsHb2pEWc?=
 =?iso-8859-1?Q?d71l3XS4dQpSmg/4IrSWsuRjImx0tKCyNVGrCAPsZT4qAbE2GwIl7+LwaY?=
 =?iso-8859-1?Q?HiGKD+Stzxw+aDquApekrWjyWaM4rGCAe0OYJwK3BfZKUkief1U0CvxcI6?=
 =?iso-8859-1?Q?v4nvbP9AUCuHWvZpSmInZ1+xEW1FfZVyE++iY6JQbje7I8gkaoTQ7xqPbR?=
 =?iso-8859-1?Q?rIHYh/agaQTTAHpVuetc2gQOLZ80Dj5mI90cvzaW4u5h7EbISABsXAcV9A?=
 =?iso-8859-1?Q?5YY0u0w5LbWw/7fzJfNDFZRsmJE/NRB8akumeItEJhI4mINV7DWPuX1Q?=
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
	=?iso-8859-1?Q?CD3LcoW41pVVPABVMvxqutaWrlTlIqNRH1kzvaKvINag6yuJaINKpP2A0j?=
 =?iso-8859-1?Q?viGwXZNkFUUswH8lNV2G2LNo8Mr0IdC9mLTFKPoiTFSFh8mXthQbn7Ai/y?=
 =?iso-8859-1?Q?a0ekurYZ3RbYjequv3BPlP+dE/Pnpy800+SMCfq6ZKMZm/q7FmVMrLnxft?=
 =?iso-8859-1?Q?eabnoTwssbx96AesVIH148TEf1D/l0Dr+J9qmhoWzf+kNNyhejLJOwnIRm?=
 =?iso-8859-1?Q?Qc3iFgmrtoMQAkkqKbMMb0Wx2h2r7kJSa0ZIdR/N2OKIeOnd2IzW/hBbtQ?=
 =?iso-8859-1?Q?pvw9SpsC+TsyBj35d+UdRQN9jEdJ5LgkFhqQEfxqAoz6899Ek3g2ATgQfK?=
 =?iso-8859-1?Q?YOAJRjGWECnEN/rG7oix3rLQXLXf15//wbyP70U+3Hbyy16A4yKU/YqNNk?=
 =?iso-8859-1?Q?4+EQaipAqSI27U+e2aJ5jj7Dln4hUqa4KZm4ykh6+6h8G0XtSM//lJGT8S?=
 =?iso-8859-1?Q?d5OO+0HC60CV7KV3IW8g0p2wMD3KcDl0Rz1VXfQi9Rih9IZdNlW0lVwR+H?=
 =?iso-8859-1?Q?dBiw5QWBqPpuL0YayCOMXXAR4ptsMRQxon8OmVoN87Atbg+KhcCRU6IkNB?=
 =?iso-8859-1?Q?QZV08spjHtxQYPX+cl3yzuyT+3NbyDQMP7IR36UjnhFw44vOMveBX8ko/h?=
 =?iso-8859-1?Q?IQK47eGOd2GaD+lGEcTWcMI+h2bLfreTI2ld1S4V3goxSF0oXHVmvKrWWq?=
 =?iso-8859-1?Q?pjAJtM7OMqkbDwKvh1oT5WR9K/RnDbGD5rs/j8h/tp2AHD+dZH/es47o1G?=
 =?iso-8859-1?Q?VWJtlxtKHT/EAjii66MkDpxI9UKgdz9NlKFWCyBbjhXnegjWX2kP607vC/?=
 =?iso-8859-1?Q?VRzO7GMim17JqK85uEO0UymscE5kChyKl8g8OHcgbqBuVEpuEQDBNlYxBW?=
 =?iso-8859-1?Q?Zc82WXEZNi+R6R+egz+G2Zg6kCFSlNeSx/s/rSMJPQPSxmE0utttEt8/QY?=
 =?iso-8859-1?Q?NwgwcJMD0DYwKv0OSQB6a2FJO8SC4M8qhPlH3SNQfHwnvsTSBKOSlQ=3D?=
 =?iso-8859-1?Q?=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 980777b9-afd2-4f58-4d9b-08dbe7990fc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 18:14:38.3645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mxYtha7vNHORn+LsI/G6WXwqVMTkgj3o9Aez0wtdqmMN4jAyGN/easa1vp+U4TQPnzU1lpRwGS9jjFukzPKHDr2Pe/2N8g1SKChO1OdclII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR01MB10797
X-Proofpoint-GUID: 3KcSas8zGU5-LnbVW65Wo2NuPKDc1mjK
X-Proofpoint-ORIG-GUID: 3KcSas8zGU5-LnbVW65Wo2NuPKDc1mjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_17,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Reason: orgsafe

Frequently an I2C write will be followed by a read, such as a register
address write followed by a read of the register value. In this driver,
when the TX FIFO half empty interrupt was raised and it was determined
that there was enough space in the TX FIFO to send the following read
command, it would do so without waiting for the TX FIFO to actually
empty.

Unfortunately it appears that in some cases this can result in a NAK
that was raised by the target device on the write, such as due to an
unsupported register address, being ignored and the subsequent read
being done anyway. This can potentially put the I2C bus into an
invalid state and/or result in invalid read data being processed.

To avoid this, once a message has been fully written to the TX FIFO,
wait for the TX FIFO empty interrupt before moving on to the next
message, to ensure NAKs are handled properly.

Fixes: e1d5b6598cdc ("i2c: Add support for Xilinx XPS IIC Bus Interface")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/i2c/busses/i2c-xiic.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 71391b590ada..6e84b4d67fd9 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -774,12 +774,15 @@ static irqreturn_t xiic_process(int irq, void *dev_id=
)
=20
 		xiic_fill_tx_fifo(i2c);
=20
-		/* current message sent and there is space in the fifo */
-		if (!xiic_tx_space(i2c) && xiic_tx_fifo_space(i2c) >=3D 2) {
+		/* current message fully written */
+		if (!xiic_tx_space(i2c)) {
 			dev_dbg(i2c->adap.dev.parent,
 				"%s end of message sent, nmsgs: %d\n",
 				__func__, i2c->nmsgs);
-			if (i2c->nmsgs > 1) {
+			/* Don't move onto the next message until the TX FIFO empties,
+			 * to ensure that a NAK is not missed.
+			 */
+			if (i2c->nmsgs > 1 && (pend & XIIC_INTR_TX_EMPTY_MASK)) {
 				i2c->nmsgs--;
 				i2c->tx_msg++;
 				xfer_more =3D 1;
@@ -790,11 +793,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 					"%s Got TX IRQ but no more to do...\n",
 					__func__);
 			}
-		} else if (!xiic_tx_space(i2c) && (i2c->nmsgs =3D=3D 1))
-			/* current frame is sent and is last,
-			 * make sure to disable tx half
-			 */
-			xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK);
+		}
 	}
=20
 	if (pend & XIIC_INTR_BNB_MASK) {
--=20
2.42.0


