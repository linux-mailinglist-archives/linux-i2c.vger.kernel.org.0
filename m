Return-Path: <linux-i2c+bounces-9585-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 711EBA446B8
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 17:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A44D4165FE3
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 16:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5B9199385;
	Tue, 25 Feb 2025 16:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="DeapmnyM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86151197A7F;
	Tue, 25 Feb 2025 16:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501610; cv=fail; b=UQB659ACLRhbl2vuGoUYnIsY3w091pGY8DoolHBeosLSOwNsBxAikb03rbbOL373x6S2Pzn4CqIIZv3bcNqRmbmK+fGQuataeKFqf0TeQCefsy1s6yyNqnvRH/RKLXb3b2NuFyRE+jrnHhu2E9UsVyNVRpDJ3HA3iD5xU0iqdpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501610; c=relaxed/simple;
	bh=SmtVU2p3I3gUcPY3M/KHXuEzS6KJk7wMgChNW5hh3DE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IJl9p/+R9za4PrFAr2l9yVBI1nzZkmdK6KRDbmc0oV2Pv4VNu7lp1Nw29WWljGcZUc/+zxgJHeZAXjhPgXMXf1FwEauorxaFK32MD2YfhEdOpN7XBRTjajnSiwyquJcIfhtu81T22/bYQPKQWsEk5EweMnD0bQOcaNcZPj/AGRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=DeapmnyM; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PF6ijE032103;
	Tue, 25 Feb 2025 11:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=tOnU7
	vjXUl7ht+mtrdBvau5TMBgQs60pEavvwer4o4A=; b=DeapmnyMhDl4QdFhoWyEt
	y34xG9Fp00MxrQ1Jt2syKV6Io1eRxumTB6Swde7x4nM2OfrdgeZIDSvejze+fqkE
	zReCLREI7eTdMLHAtdU+bgcpORmdzBgo275zCEB+C97Os3GZgGHiUFO7Mzv+xoH3
	n8yFWhjZN9iKnz2ZZcYxgtXtoQM6L+OzofHPUYPz5ou20IIjj6LfIgRrH5ogq39g
	mw9MHJBsBWk9czGsvUpCj+nSkOP0dJ6osJHKZWOi9Ku3TZ9UmHQToqO2mexNNu0Q
	NkYn8Tf2B7ABt5/T6NYRrSinbP2LxJcKFcn/7VuYR/CtJMOGp1kbIF+hF34hV6Y8
	A==
Received: from bl0pr05cu006.outbound.protection.outlook.com (mail-BL0PR05CU006.outbound1701.protection.outlook.com [40.93.2.9])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 44yccaqx9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 11:39:52 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFhXx6/2MIMvxoZs6ywiEOXISGdFGJY2UqbQwBIMJc9LjEYRU1V24W9nJeEwFTRrnfPfx9CPzsUg480zYnKcuqWoIiPQWSIXnR/xno4IrtctPTx+YQBjni6CWQERmf0nSuw+aiXKchOWI977kPc5R8yefVZc1q/dXUZ48Iorq+zFzDoP1AKbfHyKxQENCwpjqWgsVKoYIo1xGMof48TGB4IEoxV0EsthNlpLhU10vEn39EEk670NAzwjVlx4MWQhGswzl07FXChd9IPAHFN1gkcIDgjtHOclBX+WRHxtwSdjVUKmS4MfNxGCh0p5nEb/tvoK8f31RpAfyMhBSU+1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOnU7vjXUl7ht+mtrdBvau5TMBgQs60pEavvwer4o4A=;
 b=YRNer5OOZYCI8who0nzfBQRE0x4fzIY/Lz1RMMYKFyZIBGctgQ3zOHCefUa3nS+srQICoxepaQaHKuKEyPvyoVgd2dPwbspA7jOYfr4K2ivNVoVaGkiOtjangmfTIIIUomxyhf2xasDZrucjF4qC5/4TwncNAFKrHcuiFCX/h6FATC1WTLHoClVpEnbCEml8UiVku9K2M927qBEu+FPGhkQjqSnq+Eu2zw3If1jXFoJ4TW5W8qxSmPdOtYQh6vvgWE5jlKT96QVlL4CnS9hKkeWrbv5qpXYSSbvEIbpFHwsB75/vYlQx92BYotlSLKv9zGdgSfrpFqHvYn4YtbgyJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6512.namprd03.prod.outlook.com (2603:10b6:510:be::5)
 by SA6PR03MB7759.namprd03.prod.outlook.com (2603:10b6:806:43e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 16:39:50 +0000
Received: from PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28]) by PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 16:39:50 +0000
From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
To: Arnd Bergmann <arnd@kernel.org>, Peter Rosin <peda@axentia.se>
CC: Arnd Bergmann <arnd@arndb.de>, "Rob Herring (Arm)" <robh@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Thomas Zimmermann
	<tzimmermann@suse.de>,
        Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
        =?iso-8859-1?Q?Uwe_Kleine_K=F6nig?= <u.kleine-koenig@baylibre.com>,
        Andi
 Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: mux: remove incorrect of_match_ptr annotations
Thread-Topic: [PATCH] i2c: mux: remove incorrect of_match_ptr annotations
Thread-Index: AQHbh6OEmuHB/N7jSUGk19fQspp36LNYOGAA
Date: Tue, 25 Feb 2025 16:39:50 +0000
Message-ID:
 <PH0PR03MB6512C35E04DC43D004B6C35D8EC32@PH0PR03MB6512.namprd03.prod.outlook.com>
References: <20250225163700.4169480-1-arnd@kernel.org>
In-Reply-To: <20250225163700.4169480-1-arnd@kernel.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6512:EE_|SA6PR03MB7759:EE_
x-ms-office365-filtering-correlation-id: cb87ea44-1ec2-4427-19e9-08dd55bb05ce
x-ld-processed: eaa689b4-8f87-40e0-9c6f-7228de4d754a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Ogpv2vZEVfRHLmj4KppChO3sdyu/J3br+MLKAbARyDu5OdY0HYyc/gWA4E?=
 =?iso-8859-1?Q?S6X2Cf5gKxry+y/xeU8OB5HSG4JF4tck6+gEo+GcCfFKGZHMxbTAjzn8FB?=
 =?iso-8859-1?Q?V99u9fnXiY/G+20GBY4tEYqGmOd/aiRW7cGPrOrEntXl4AS7HVwMS5Ex9b?=
 =?iso-8859-1?Q?ge0hkdg24wYs9wPr8BoD2rqQaW7DakxUfr4PxJbDppduU+yxWk9hLu69rG?=
 =?iso-8859-1?Q?7CExzbMgEmlL1uPwz+pVtMHHlRoEOWvELKas9RwqPy5nCgFJ52MSfLFhL0?=
 =?iso-8859-1?Q?OLY1RNuB7rqYtlu5redZDq1lrnBZHQ1I78hWKdTRvFLGzWnQylbDld21Ic?=
 =?iso-8859-1?Q?+xTsTSO0baxguyyer5U03x0H16cpzbRzrzcuf68jFX86wtfsKsPkvaTD66?=
 =?iso-8859-1?Q?1bk1IQpZDEvi1aTqSkFCQxHzECpzRXVB78i4Baq4X+2S82VJE7rJuSEWVP?=
 =?iso-8859-1?Q?bTvassO9zhqpU7cDVJTvEcEJr4SRKy1aEtnBKQz3dnFmpuLmX6m9Pbjmb2?=
 =?iso-8859-1?Q?69lLbHthmrVwbMES+sks0E7DyuVEHCweFPPDqZ7RHg5qD9gQdY3zcPptyS?=
 =?iso-8859-1?Q?Oua+A6HPsVP1SNeTtQwkKNRLkb6A4vH3qKTli2hjPWgn4KjyUficucBMx/?=
 =?iso-8859-1?Q?jZefxkQBLdQZGt3sek5KbKM/U83bmqgd6QCBYyMnaNH2k2wvC6rQW8gjqA?=
 =?iso-8859-1?Q?rAIeMrMpHVHz1yENBjFbUP8j7Fy+ckpfQ3TbakY/4KdmIFlcMDVPdymbLh?=
 =?iso-8859-1?Q?3GKKALFqLMWumj1muqNK8T8Fzua2i4DgawwpHrYNPxUNBY1ofIvEqaGly5?=
 =?iso-8859-1?Q?CkiJDF2YBTL49zGExgaoVBQ9rY9xVq+3p8OiUlrB63+HOANivvduvINWi0?=
 =?iso-8859-1?Q?GvOk56knogvlBNzIDyjBypiBy+7wmQSoP4EiumOqEvqMHu4cy4F6koXLHM?=
 =?iso-8859-1?Q?z58ENBklflf0tyqLVICqNufj3Hki2pUfX+bX54+xqfPzA/G2h4tn8WUPuQ?=
 =?iso-8859-1?Q?OHcyPKSgQoZVlVqBP3oVBHipVFl5DwzwfKpoT62SImvB/BCVHkNxhToNLA?=
 =?iso-8859-1?Q?Cfu7KnA+9mFyIgvaaJm5mFZFc5x73Ts+W1mN+VdRT6aizITPhpG13ZgQ6H?=
 =?iso-8859-1?Q?F65coZ715HB/v2hrau5/LiHNOucmoovvISQk1d97/AZmP1r/IGvLVdf2oM?=
 =?iso-8859-1?Q?NKmPdUiy2EVqLAdfy3J6TH53iKBXll3f4s03F/ZyGtbwM9u35WnbsjWwj1?=
 =?iso-8859-1?Q?88cxcyaAJtQGXix+jP4xJEe1+NR1Vjhq4ZuYh4gehVWrTQqzthIWk8qcvm?=
 =?iso-8859-1?Q?g+A25MKvzmcjB6THL34qHajh3FFHAMns7LMaE9VhNplwtNuf8jJFP8yhk/?=
 =?iso-8859-1?Q?GwdQw/WGgqptzr0KMJUDtwEqmpg/65U2QkfxD4nfsoDGlZ02jHHvYyvYF+?=
 =?iso-8859-1?Q?aJ+ZrDwEYakTTJ48h+SFBKHXjercc+eh4YVqC2zO5FCLTuQKP3D+uYusfr?=
 =?iso-8859-1?Q?tpQ2dLLRWq7H8FDB4TGs8A?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6512.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HdbFlIO8uaW8p+lA/HJCQd3qo1OKHce+BYQrTAulTenNiv2pME5/eMeTnn?=
 =?iso-8859-1?Q?Ym0I+2xoJhxqZ69NSQskco2O1dvlalv3hMo9aMVgHWaRzQGz2zEGtiqf9N?=
 =?iso-8859-1?Q?F+2VW1ivSdBIBnDBZ9viEbxgUYDu/sjM5YwG2NeqyUDD13A5f9KnvEcySQ?=
 =?iso-8859-1?Q?f6GkJh4yXA0B3lATHp+xeJeP+TatIEyYt6K+OQe6lGcxJpZxTeS+sq3a7S?=
 =?iso-8859-1?Q?zt0bQEXVqZTI8n0hd7qEKyqu+aNpPoRJs/qwz3ZKaffLb9gedmd3MZgbQi?=
 =?iso-8859-1?Q?5rlkD9OwGzVTePiZQuxD9D5hav4+gYp9pGE0wR+/2EoVN5zCUGfIBqW67o?=
 =?iso-8859-1?Q?DDWLYCoP9Cb+za0gjs8Zg0jpr9lCQSh0tNyrpXT0FdmPyMACd3vlX4ReeD?=
 =?iso-8859-1?Q?Zi6XLnNQaeF+QOlJdKkI0YXfpHzT1XCN5X+eOhBYYTAZNdCnq9L8onvJce?=
 =?iso-8859-1?Q?+B4hnUu2UD38S9oS+sbXHzepBxj1oYYINOj1MGU3gDdtOgGYlxPqIk62m5?=
 =?iso-8859-1?Q?Zul6AMIsFz/MSCt8G+Om6fw0zdxyQcKoAt8TT5c0+tqhWHZShIBReMUvAl?=
 =?iso-8859-1?Q?9LAvcpqbVEHaZI1YWElobEBKYhXLY3gabTxlPxNFWjYtpHTceA1xD76LM+?=
 =?iso-8859-1?Q?p5jS2gRRpIYWHlf/jyCRDU8bM8xgSYfqxm5QGSmj8QFylO9oVLPEj56zM2?=
 =?iso-8859-1?Q?UG5IDSJdA9cG7INXHUrCVbq4nyejGslNx1k3u9XhWv6Ko/9BnJuiUfdOsv?=
 =?iso-8859-1?Q?+8FwV60TB+NdvdDvWfwrzbS6UbDLCrMcIlxS0NFGEc/kgsW65ApGS7Uakz?=
 =?iso-8859-1?Q?3B1z+xIFDdhCgpWppoSAjyCkQraFOtYxkVng8z/Xwhm64QC62hwVLz+f/j?=
 =?iso-8859-1?Q?zXsHAWPzim4RnJCgjsX5N3Advp6T24SZ6CwJznRvaqCMZVS58J5ag/Rw+W?=
 =?iso-8859-1?Q?/Ou2UN3+TUw3ymYfbTOnxt0NR5TEkjGWhM7ejkkWptn49RAOybJtUDYCt4?=
 =?iso-8859-1?Q?A2wQO6jHxFXsa29sTrzjrNxQxz7yTKu85+8xi3zOg/j/c59/oVjoBoRSCc?=
 =?iso-8859-1?Q?wXTZdE7yqqm4N09UAxta5WEYMJF5XZQldCynMoExlFTKeF2sfsHrOiRaad?=
 =?iso-8859-1?Q?tIRn9ugwOqKUEG4oP89RqE3UegXxDQB2tDjXJp89zFEliAIQZdS5cEN4Sg?=
 =?iso-8859-1?Q?gVLO0NHn3YZN9tKfRSLiLnZoSDCzqf9JROHBGS/4uA/dpSCt0vDFmXYhpl?=
 =?iso-8859-1?Q?N0y2nz82kLfw3fC2E0wH5mtwxKwRJguieVoRR56w04aCirr9oLRZbdBZrY?=
 =?iso-8859-1?Q?ZwlefworUNaFHEWhoWswqvL24JTeQLpvVDGSCDwedRNCyWpNYJo2xvRIUr?=
 =?iso-8859-1?Q?U5r7LvsNMJ2cPOaYTaXxtMZBuWkw8m0AERGaz3JV9xTHJK8FtY2P6OnO8B?=
 =?iso-8859-1?Q?aAefJSMULG6lSgxvDCvO+iJc/+Hia/pveuNAunvkH6JWmt3QmKZkh4BBgi?=
 =?iso-8859-1?Q?mo+2tPYG6W5ji8d3gZH53fex9MzclFrnlTJqJyYK5Bc9L2MsdIC16trbcO?=
 =?iso-8859-1?Q?2Tto+tcxnjsWq6S0dRfI9yUC/ksXOXeVPTdcYJ2uHq6Pd+sHWY5AB824QB?=
 =?iso-8859-1?Q?AKTm9zV3JgO7kWel7tIxgupjnSQKX35kHSB59V8J4QiFfvKRzlrChzng?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6512.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb87ea44-1ec2-4427-19e9-08dd55bb05ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 16:39:50.0766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MzBRkX0X+qjKOvDc5S51OFac+VOxA0CQ+COHWYxtRxI4MPUvsDsPRUkv9RcOIAS2/ed3GGB8Z6n4Z6+YnrEyF9tRL71UXHnqxFkW9WZj47I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7759
X-Proofpoint-GUID: waYfXE0rEiy6cD8IiNAuTCtM4IIZmo3y
X-Authority-Analysis: v=2.4 cv=SPa4VPvH c=1 sm=1 tr=0 ts=67bdf258 cx=c_pps a=yfQ+ne3pfVgCfke9fm/9IQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=pGLkceISAAAA:8 a=P1BnusSwAAAA:8 a=IpJZQVW2AAAA:8 a=nC5DeQSkqL12w0jMVf4A:9 a=wPNLvfGTeEIA:10 a=xjj0GC5SL0ELW4ibpBgG:22 a=oVHKYsEdi7-vN-J5QA_j:22 a=D0XLA9XvdZm18NrgonBM:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: waYfXE0rEiy6cD8IiNAuTCtM4IIZmo3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502250107



> -----Original Message-----
> From: Arnd Bergmann <arnd@kernel.org>
> Sent: Tuesday, February 25, 2025 5:37 PM
> To: Hennerich, Michael <Michael.Hennerich@analog.com>; Peter Rosin
> <peda@axentia.se>
> Cc: Arnd Bergmann <arnd@arndb.de>; Rob Herring (Arm) <robh@kernel.org>;
> Heiner Kallweit <hkallweit1@gmail.com>; Thomas Zimmermann
> <tzimmermann@suse.de>; Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com>; Uwe Kleine K=F6nig <u.kleine=
-
> koenig@baylibre.com>; Andi Shyti <andi.shyti@kernel.org>; linux-
> i2c@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] i2c: mux: remove incorrect of_match_ptr annotations
>=20
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Building with W=3D1 shows a warning about ltc4306_of_match and
> i2c_mux_reg_of_match being unused when CONFIG_OF is disabled:
>=20
>     drivers/i2c/muxes/i2c-mux-ltc4306.c:200:34: error: unused variable
> 'ltc4306_of_match' [-Werror,-Wunused-const-variable]
>     drivers/i2c/muxes/i2c-mux-reg.c:242:34: error: unused variable
> 'i2c_mux_reg_of_match' [-Werror,-Wunused-const-variable]
>=20
> Acked-by: Peter Rosin <peda@axentia.se>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>  drivers/i2c/muxes/i2c-mux-ltc4306.c | 2 +-
>  drivers/i2c/muxes/i2c-mux-reg.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-=
mux-
> ltc4306.c
> index 19a7c370946d..8a87f19bf5d5 100644
> --- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
> +++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> @@ -303,7 +303,7 @@ static void ltc4306_remove(struct i2c_client *client)
> static struct i2c_driver ltc4306_driver =3D {
>  	.driver		=3D {
>  		.name	=3D "ltc4306",
> -		.of_match_table =3D of_match_ptr(ltc4306_of_match),
> +		.of_match_table =3D ltc4306_of_match,
>  	},
>  	.probe		=3D ltc4306_probe,
>  	.remove		=3D ltc4306_remove,
> diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-=
reg.c
> index dfa472d514cc..1e566ea92bc9 100644
> --- a/drivers/i2c/muxes/i2c-mux-reg.c
> +++ b/drivers/i2c/muxes/i2c-mux-reg.c
> @@ -250,7 +250,7 @@ static struct platform_driver i2c_mux_reg_driver =3D =
{
>  	.remove =3D i2c_mux_reg_remove,
>  	.driver	=3D {
>  		.name	=3D "i2c-mux-reg",
> -		.of_match_table =3D of_match_ptr(i2c_mux_reg_of_match),
> +		.of_match_table =3D i2c_mux_reg_of_match,
>  	},
>  };
>=20
> --
> 2.39.5


