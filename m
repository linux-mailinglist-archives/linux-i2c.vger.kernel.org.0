Return-Path: <linux-i2c+bounces-9059-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD345A0BDB4
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 17:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5114D7A04FD
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 16:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA88165EFC;
	Mon, 13 Jan 2025 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RXTH05Y+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB2B24024E;
	Mon, 13 Jan 2025 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736786352; cv=fail; b=iiXU0GXMGczXkfxTh2dln2SP1DTTe7YZ/4ISVAQVcBkhtHZDOF0U39g//Dv2VY9W7AO6S48M1DlnB54nbkQJo8+GHOSfHRfWw9wmCFdy8rrF4tq9FDkyx3V251xMkOqAw+5yB6JF0qzPq4f+0Orfkrp7j+fhPmszvDtt2Evr4fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736786352; c=relaxed/simple;
	bh=Ck/M9RHAdG5TxHbn3Ia3G/uV/E65wr7SUgyrGf4Fkwo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qqi5VbtiDTsMalWXS7DaofJFOWIGppkCUdbTW3dQIfFshbeRxS0oEEwJ7CfgVl7TT33y3yA2RbpSYxDeqAhuTJXRXVRO0XpQu3nfNpxe9KX8CT9U9Tpn1RfmkfsowfdKpRbGWrW0y2sW2rslGLRgCLzZcoay1aa7YvXdN3yeC/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RXTH05Y+; arc=fail smtp.client-ip=40.107.223.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNuvYNKDgfkOB6eoQaqLy/UGMmQOf8/YsdeZ8c9dc/44u4vK1lg1KOR4eZPi1JkL0mQyrBlP0CHI7cu7HaHmyitxTpXt6I4wkNUfb0Y/xpFe4cOiXMP0BfYNVQgtVJaoDRQ0AZ+QaT6DnzDyw3VsDZEnXx6XzjKlWkWwMGiTQNgD8kBfERTUBCW9JibS0Wu412PQloUu0wOphTkeA6AUdBpheBbEwQEazHnPDox5Y9HSjjmgXBSUUqdV80b0k4zsh5lojX2kEH9MLYWVwLIV2g04QecRFrGROUcM+wdIe+nTViHMprCqmbjjf96U7TmDJxCPcLYsNZEl6XszPCc6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ck/M9RHAdG5TxHbn3Ia3G/uV/E65wr7SUgyrGf4Fkwo=;
 b=BYd5V+lF8Q4VHWxSdKqufWybvSRCMxFJI2lB+yS6UOz9yNpHD7J8aGNOcMgv1eFVr0ooU4Zpm9w8LMC840SXS481giQZLhqUPQb7PnxB55YPgjwq3qpRHoJ76Hzo7w8OMQPzEcGrIPJksCa61keMYpQYTz9lL2Fttm1nguDsevjz3d3SNO7b2JGAGoNzsjVuM8smFJEVDPIAdCjOYZq5vz3u1jTN5PnFld0qaB0LM3JY1P2YDmqf9wLb9M1TTgJ4jWZqWvZuzAQLOLqan8OWwECWldtQjUSHx7kcZkmZfGgPbP/5oxvLqxA2v5LOxlDoMiVOfWn+RJRePgcRBGLb4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ck/M9RHAdG5TxHbn3Ia3G/uV/E65wr7SUgyrGf4Fkwo=;
 b=RXTH05Y+LFdfbS6EMMTx66YXTtAj5Uh2G+yyunhGyCkKqpnNn820VL5Ft91m/PRdGnqIMkVaIDaAdlcgxVufQcaxOBDdOwiP/5KVNmd8sGT/dVQDM3x5WhwBf+SpFVJ4dd/oW24cyJ3+1lI4tlrMaxrLC6WbNtV/QsbcVH0iORAYnAJkSUvWv2PU2hXcMnPIeWUdT9SOELDX5mtPKGkw6Q1WnSQxqXuNjij9kcAxSJP6bYq38DZBJSwLaM9aCv3pJkdbvd7FzVl1S3BZmIqmXEUCiRBbMwb2Z/ZXmBcr2dU3Gv5lwHzI0t3pWZNdJ/yDD2l91XuE52fjlUc7stkJlA==
Received: from BN9PR12MB5196.namprd12.prod.outlook.com (2603:10b6:408:11d::17)
 by DS0PR12MB8017.namprd12.prod.outlook.com (2603:10b6:8:146::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 16:39:04 +0000
Received: from BN9PR12MB5196.namprd12.prod.outlook.com
 ([fe80::6a:6f30:3c6c:43a8]) by BN9PR12MB5196.namprd12.prod.outlook.com
 ([fe80::6a:6f30:3c6c:43a8%7]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 16:39:04 +0000
From: Chris Babroski <cbabroski@nvidia.com>
To: Asmaa Mnebhi <asmaa@nvidia.com>, Khalil Blaiech <kblaiech@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>
CC: David Thompson <davthompson@nvidia.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c-mlxbf: Add repeated start condition support
Thread-Topic: [PATCH v2] i2c-mlxbf: Add repeated start condition support
Thread-Index: AQHbOsfFpOd1tz8dDkaYWmnI5dVqn7MO23oAgAANAYCAAAEkAIAALs6AgAYdRpg=
Date: Mon, 13 Jan 2025 16:39:04 +0000
Message-ID:
 <BN9PR12MB5196216AD3B780419AAB2B03C61F2@BN9PR12MB5196.namprd12.prod.outlook.com>
References: <20241119211215.352797-1-cbabroski@nvidia.com>
 <db3daq7guy52ywmgslnmphx4mxyp2l7swq2y6erezokolg3v6u@p7ufvbi3tarc>
 <xmm226aebgwmpjzekxlvhcgstzss4uq42vpj3zjp23ffhv76ma@y7hqbw5a56md>
 <BL3PR12MB6617CB02D6014B6A2FF77E3AAB132@BL3PR12MB6617.namprd12.prod.outlook.com>
 <CH3PR12MB7738D030A080E3B3EE7AA536D7132@CH3PR12MB7738.namprd12.prod.outlook.com>
In-Reply-To:
 <CH3PR12MB7738D030A080E3B3EE7AA536D7132@CH3PR12MB7738.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5196:EE_|DS0PR12MB8017:EE_
x-ms-office365-filtering-correlation-id: 7b23a2c0-e3d7-4453-fbcd-08dd33f0cac7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/+1aUh15HCAVXl1c9J9vFKS3k6Wj2bQ1FZOLRkRUIrYEZOGieiIozHNQ0w?=
 =?iso-8859-1?Q?oifARJV+PIBn2OxfmHulFH2z6bV7iGzblJa45q3sEcRnWmBWxnBBLW3XW0?=
 =?iso-8859-1?Q?Fc/6zxRq8OgTIkCc9mT1i4HmgNF+IrIRLVR7Kol9eUkk7uBsjkpp+WfQqy?=
 =?iso-8859-1?Q?6cWH0KfC87sO9XpowbP/U5dHTHbKjiUH9ORUAN6xbdMiXXikbwXTuTpSkA?=
 =?iso-8859-1?Q?Avx7EvY9ZIhHOkZ0ZlcRC6WjKl6cuXUNymIgOOL9vPuUzUzNtU77OWVIiL?=
 =?iso-8859-1?Q?+XDLbYEKr+wA136yw//0RkRW+18jKayRAu1AE+4LiAMrMSOfq0blOG5Vm5?=
 =?iso-8859-1?Q?jy7LyfsbBzkBAoZ8Xw4+K9Kd6ZhfIHvQJGaDEcFzqy1XWlw5lin8qs2RPc?=
 =?iso-8859-1?Q?TPjal0A+oyJwylx8Jlez5XX+eUxFf4n9rJEhb5jbanbmZsFm8RuqPDT8GU?=
 =?iso-8859-1?Q?/i+QP9/yVA/QSbYXMippi0tONS0/M4jSPxy1VV07xQLeX8nNB83xYURj0I?=
 =?iso-8859-1?Q?3E8SorKIgCfNZaxU78QP1kArvPSH7yCKXmQoHFGkTwNiHEssniSd74v7q/?=
 =?iso-8859-1?Q?P+Gpblyvl8TBPytPBMh/99v1YPG3/6FEbqYv64U24ytrDHhtJpCSY6zlxX?=
 =?iso-8859-1?Q?XBCtVuBqGTMyXz0PtkgkI9fnF3Gvz2D56NO5HjoJ8reohTDCbx73lftxbz?=
 =?iso-8859-1?Q?eyzspHww0PrHlHEdHJolB4ZIpIOE8YybNt5qn9ivqWw8jNqVu1r0p4uTzz?=
 =?iso-8859-1?Q?5WuyTnqHg3/XpC+V1EOYqOshcOxCdOvD9lFwybr7s9s89LO5Nn90UGc+V7?=
 =?iso-8859-1?Q?hazDDUZJDqKEPkIcz8zF0o4bcU9pzOb5MGRwoYcKSjO/hhG0N52rDPUQj0?=
 =?iso-8859-1?Q?vFVLr5jQR8j7x3gfAOfEjgUFc0Ppl2zKz/oYVK7ghgemSQFR0sYNH8go12?=
 =?iso-8859-1?Q?6lRCh1i9yNXeT4fpyj6PSDBnyxQ6yK5dvWS+M7v8F1++DXeLKtQ9lLUa3J?=
 =?iso-8859-1?Q?WKtR14piTpPI230k5CfecRH0KBCEizOllVoVquluiJmTYY9XpbONy0yCqS?=
 =?iso-8859-1?Q?JCCTclfZ7bqWKGveN/ud3JP57swrPALTjFfMn+iadq9zwbuxB+QZELZi2j?=
 =?iso-8859-1?Q?0q2iXkCqQF2zAzn5GjWY/nDAMY3PMrjppDgkZmoLVKTl/ap9pUE1DYDR1q?=
 =?iso-8859-1?Q?9Gl5y8niKheLT6QMcVuKmLQ0MrWl38Lgdlihau+eBSgSHVEeZodU8Rr7HS?=
 =?iso-8859-1?Q?gvW0sTd1lIFErf0Hf1eQn1lcipII6FuejHksjZIBXdOPs8xNNNbpfAA+Nw?=
 =?iso-8859-1?Q?Z8NCyPwJGB5UjtYNCHjbDjmwPXdJr+nSlJzJUCitrhXPxKJYTxKKejzthC?=
 =?iso-8859-1?Q?wzti0soCTZ56TWYn+Y9F5aNdPabEC8xgnDrEJP0SY6J1PxgKx9XR+66BuG?=
 =?iso-8859-1?Q?5t+4Rc5zjM0kG/1Er+4bAiOQcWeGG1281LEfjWeGjP92LDw5+BsMgT5zFs?=
 =?iso-8859-1?Q?K7BGyFJOeNjvI/4+rwv25k?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5196.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ol7aP6xT7B+DUNl4uKVBPcOXW4MF2MCzPlWjPOAeznBDe52kofTE51yoe0?=
 =?iso-8859-1?Q?ExhMqZKld9SFXi5JgrWhxLXW1IN8zNEXGzR9pVm5/nZDSjQXRD1uSl6QZl?=
 =?iso-8859-1?Q?PVZTaG1rj6PLOs+50KWvLYiwz/0yrrYz9aZhabIgb/DacexiNkH9EOuGTt?=
 =?iso-8859-1?Q?VX3A0RTTSwcmuVaomI4/IRHn1bH94AW5h26SfMmdLZbRtmY1AF5WI2K+Nu?=
 =?iso-8859-1?Q?3vfYUcB4r4rZIbrDfwKNPO+gOWM5TjL77VstAg06DujWA2O41PUbmDPeZk?=
 =?iso-8859-1?Q?br1v2iXv1JDHfInmnNOQ/2CUwEbUekPM8byvC9AALstTrQFb93nRKychgV?=
 =?iso-8859-1?Q?u0Ijjd/vLMoE4enL4k7rCz4LcDY7RkD+/slEzT67x/Mmq1+4YpCfz2ka3T?=
 =?iso-8859-1?Q?fLb9wDZQ2x8DagzQPHBGEIcS6VRIniydrxZZ5NCLH4tu3NWF+tM7MyFVFu?=
 =?iso-8859-1?Q?TgSICXRPjOKVSKgSkjVPH1uw2rqmiGbtv7BayTA8ohzBbd3z+1D7dkYTDI?=
 =?iso-8859-1?Q?yESLcO6qjCfoYEb8qKNA6apJWKabQWznCzk52ucLM49RqqENX4Q7ViUK4z?=
 =?iso-8859-1?Q?hZ3kIhw8K9gNS1Xj5ohbrRpy8Wo4zkvhj3sHyxBd52TcRzBbmQU270D+PK?=
 =?iso-8859-1?Q?lYJM3YP77sjFeffqinoNcwMGBPzCoWpvyRQKk0TVC/aVbGKJKznPyrMufi?=
 =?iso-8859-1?Q?WoZYJhxrfafnnZb7NSXu6wLU7qD/JqDQ4uDrh9v114La7KJelk8i+34uss?=
 =?iso-8859-1?Q?v8hHmFjnPT/7CZZllsbw/jGEqptLE0UyYBZnFOZK9+S1thcC8USH+nkSpR?=
 =?iso-8859-1?Q?Xp3oyjScdyBEcgwhOdmfANeaqJVHW3XPVxzAxKKIuyRRZHLa75eZfcxQ1a?=
 =?iso-8859-1?Q?zzcglaZP7Jtr7mverrsFjoWqRf2SqbxrdB24dtf4TuNdydAJTT3Jxk2Xie?=
 =?iso-8859-1?Q?/oIpXWucVhaiCBgE55vTWUgfspOPsIK0KnHF9taXnyQRE/bCSzIPNvDonI?=
 =?iso-8859-1?Q?hAEPjQTS4ib3aVvCAH79FWJ4dO8zHyTHvSjfyGQy4dCRojinHEa6XkMRzo?=
 =?iso-8859-1?Q?jVgIlVIzft9Gzt9Llyu8mtTVsSCj43UaOgwMqqGtZF4sn0kCvjVZB5SSV2?=
 =?iso-8859-1?Q?sZTwFNXEvzKCQ8MN83ay5J/N3OELiYZmzENkb0QMTluuVMJzctozbY0w3m?=
 =?iso-8859-1?Q?ZXLP01wOyixqfY1wRSAQuUV8R0lQlDs1lu6GZEHy9pSRTWTtZY7WQoW3v7?=
 =?iso-8859-1?Q?fwcQTEI/gKSqMbdUvM0XzR7ymsOxnYlTXtHIf25zQz/NRuP+zJsQJQl/Em?=
 =?iso-8859-1?Q?GeO1czP2IueVsQilb1MFisGLlRJDUHR5DF2Jyw+EcDD/eWrDtDO/lYusRs?=
 =?iso-8859-1?Q?giueBNpVLp9ydVPxsf8jCESlRcILvzkFN4H4NMfhqezbvl064qsThYy4yu?=
 =?iso-8859-1?Q?10z3v88R3HRXZuQUK7xi9v+JxkufMjoGq/VJXCW4N2zoVxAJclWDwyOMay?=
 =?iso-8859-1?Q?ucKrutHrk3xPwSUy8naIYLwmGCIL3qE/EhwZ00UpWkyFjGqpDN5T6mhUCT?=
 =?iso-8859-1?Q?KzXImYdvAycqnp2tgSiJ722RND9Y/EjaBvwFE9v5Ez14d2HIdDf10XlueN?=
 =?iso-8859-1?Q?LFZUFk+xYEEKIqjEBLfJg2WXPALYvfU8DL?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5196.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b23a2c0-e3d7-4453-fbcd-08dd33f0cac7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 16:39:04.3313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WuOOXIpRclHeWYZgqWFffz/7RXiXpn7URZiS5tjaaY0rM59G/7r95K++jKYDRa/618okdRplqEOJriIGuFa9pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8017

Hi Andi,=0A=
=0A=
Thank you for reviewing. I will send an updated V3 patch with the changes y=
ou have requested soon.=0A=
=0A=
> Can you please explain better how the stop bit affects the timing=0A=
> values?=0A=
=0A=
There were two changes needed to get I2C communication working with a speci=
fic I2C device on BlueField 3 and are contained within this patch:=0A=
1. Support repeated start conditions for SMBus I2C block read. This is impl=
emented by removing the stop bit for the first write of a block read transa=
ction.=0A=
2. Increase the time that the clock can be held low before an I2C transacti=
on is aborted (the "timeout" value in the bus timing configuration). Withou=
t this change the bus will time out attempting a block read with this devic=
e.=0A=
=0A=
While debugging to find #2 above we noticed that the "timeout" value, along=
 with several other timing values, did not match our ATF I2C driver which c=
ontains the latest bus timing configuration and has been fully verified by =
SW and HW teams. When I updated the "timeout" value I also updated any othe=
r timing values that were incorrect to ensure our Linux kernel driver uses =
the complete tested bus timing configuration.=0A=
=0A=
Testing this bug fix requires both the repeated start condition and I2C bus=
 timing changes which is why I have included them in a single patch. If you=
 would prefer for the timing changes to be separated into a different patch=
 then I can do that instead.=0A=
=0A=
Thanks,=0A=
Chris=0A=

