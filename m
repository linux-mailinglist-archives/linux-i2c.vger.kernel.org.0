Return-Path: <linux-i2c+bounces-8174-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFCD9D7A27
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 03:45:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 424A9281EBE
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 02:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C415EEC5;
	Mon, 25 Nov 2024 02:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="v7cMg3Ua"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615C8EAF1;
	Mon, 25 Nov 2024 02:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732502704; cv=fail; b=VifVNhFJ0pk1bXOds62FD1sJQW7CcTFTat512sXEY0UsP968DN5owMdQEl/jsnDQVekl6aFCi4lFoxW0woXGD1SZe5Y7Tp6XLR2TQMJeUaOvJ1P+V9TIvtToj33GXMlzUo44zQikg9CjIvaDR+a+pQY9kOY/4aKlOKZAdjuVv4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732502704; c=relaxed/simple;
	bh=FzJFo4TJJjZBucWXBATVs5J/aEtcFi6LkLvvHcfx06s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g5iorQbEOefEdsEfFyfPDL6MAqc80Yac3rgZDHY0KE1seoDIt3Kq0GYZw5zSS9PSUjfqEpLtFTaZrudz/QYTZFbUabep9kOC3c0JcBa6aTQ+Hg/QTNAeDX0OEQzMD2cn/hm1AK7LgS3XA2x6H8QGH67bb5C9N1U6jYvETS8ktNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=v7cMg3Ua; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP1UxeH024377;
	Sun, 24 Nov 2024 21:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=LF9Ib
	ntM1wqPEyRmKVQ3/H7GzzQ91vO0RVnzk0dh0Y0=; b=v7cMg3UaTSDcpoxPb4PZ2
	xrgQ5bxokW71lHk68OTb/FKQS6ufE8LJtgVK/KDCfRw35bKmvjianlzEcr/nlRYh
	yHbqB/B+wkKrICe8ywIi8wbnDCt8jNH80O4A4p79p7ELcWKl1si9DthAZUlVn8H9
	2bBueDfL7kzxejunnB9Fzrq3uuv5622vT+NT0u8BN/a+o+js28gmNtXHcRHUkBZ8
	N55JYAeGZKDv2Jm9lL0GynKlRy+r69slJRwzCYIUc0HXHzYaYTINJxCX/FCQ35HR
	zPi47n1kfHZ1XJhFtHhXJtRlbzU0/WlADUzOx1ha+6CgiykkrgB+yEU1TEM4dRtQ
	A==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012038.outbound.protection.outlook.com [40.93.1.38])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 434fn2r9ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Nov 2024 21:44:42 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzkNTWAbVddZzEWlDDQ54ph0J9ATheaTawlh412+Gs2LdlBuH/Q6aFoQKJ3e405t6f1YYewYJXEJEyA0m+U7oXNFdKPOngpzSiFB7ut9PNA32/3po08fdobS9JiVMY1u3QwNzlDnSb8Ob+4t+BjfPlgASvzj/vlLEdAvFZpNdv8/xs8tjyQAbp58kR8J7BsoMPz5HrVV76KdFGkKnadkCoONUcAIatWYEo4hevvr0rM88efEaEHJiGfQyR6/vq1Tv6QDdlm+RwEsNSOGLoWrHOlSDKesesmOzKkZoCbrkdTNiaP3aUikNjL9K2MUkpk6/UroocwyJbV6x9lcK6CNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LF9IbntM1wqPEyRmKVQ3/H7GzzQ91vO0RVnzk0dh0Y0=;
 b=LN5HwqOlD/3NvN0RJQj0y7NRI/3jj3hrfAwv8vOSNGVJxmD3GUVScToZQxaXlxTSJTB75tDanrDxDbxQhL6UZsvNCzMY6anqFzQL3XVg+kqj1iXlczVwLXX5xc0SbV+QBJzd54sC9ioepkb0ZHyzC7n8F3obtusgt1wWTnL4fLkLvlnbXjD244JYrtUt5hgVvB9w/jl+dcXLYI6WhyRFMiyKvgnRhQQVvQXFkQM89rjz5NOTsZRCu9OSyDU0jB4+V+p++RwUs5y/SABzbVuLLzncITrKVa/BrCkLnqKc0jtB4Bwq2GoCze6iJecROTd0CnT4sXk+Fb8u6W+HRnfjng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 by CH4PR03MB7699.namprd03.prod.outlook.com (2603:10b6:610:240::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 02:44:39 +0000
Received: from PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446]) by PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 02:44:39 +0000
From: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Conor Dooley <conor@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Jean Delvare
	<jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@wiwynn.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Sabau,
 Radu bogdan" <Radu.Sabau@analog.com>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>,
        "Torreno, Alexis Czezar"
	<AlexisCzezar.Torreno@analog.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH 1/2] dt-bindings: hwmon: (pmbus/adp1050): Add bindings for
 adp1051, adp1055 and ltp8800
Thread-Topic: [PATCH 1/2] dt-bindings: hwmon: (pmbus/adp1050): Add bindings
 for adp1051, adp1055 and ltp8800
Thread-Index: AQHbOwCMcgPGmOLviUWtaqX+Ac5c5bLAaI0AgAAGpYCAAAjmAIAACNWAgAbMqsA=
Date: Mon, 25 Nov 2024 02:44:39 +0000
Message-ID:
 <PH0PR03MB6938F9DE7173FE958D645CFE8E2E2@PH0PR03MB6938.namprd03.prod.outlook.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-2-cedricjustine.encarnacion@analog.com>
 <20241120-process-hulk-ecedcbf088f7@spud>
 <dfe8e47e-6c31-4b11-b733-38e5bd0e49d3@kernel.org>
 <7e55a403-eb1c-4369-8180-1639b50cc9b1@roeck-us.net>
 <4d907ddf-16ca-4136-b912-f571a691dc90@kernel.org>
In-Reply-To: <4d907ddf-16ca-4136-b912-f571a691dc90@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-ref:
 =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2VuY2Fybm?=
 =?iso-8859-1?Q?FcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZi?=
 =?iso-8859-1?Q?ODRiYTI5ZTM1Ylxtc2dzXG1zZy0zMGQyOWQ3MS1hYWQ3LTExZWYtOTM2Yy?=
 =?iso-8859-1?Q?0wNGU4Yjk3MDc1MzdcYW1lLXRlc3RcMzBkMjlkNzMtYWFkNy0xMWVmLTkz?=
 =?iso-8859-1?Q?NmMtMDRlOGI5NzA3NTM3Ym9keS50eHQiIHN6PSI2NjEyIiB0PSIxMzM3Nj?=
 =?iso-8859-1?Q?k3NjI3Nzc0NjEyNDkiIGg9IlhidWt2amU0RW0xQUJ1dVpZK3pOMXhJcjFj?=
 =?iso-8859-1?Q?RT0iIGlkPSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk?=
 =?iso-8859-1?Q?5DZ1VBQUVvQ0FBQUI4Z240NHo3YkFmMjB3S1crOTB3RC9iVEFwYjczVEFN?=
 =?iso-8859-1?Q?REFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFFQUFRQUJBQUFBZnB5Y1dnQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBSjRBQUFCaEFHUUFhUUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QU?=
 =?iso-8859-1?Q?c4QWFnQmxBR01BZEFCekFGOEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFh?=
 =?iso-8859-1?Q?UUIwQUdrQWRnQmxBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQU?=
 =?iso-8859-1?Q?FBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdV?=
 =?iso-8859-1?Q?QVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURFQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVlRQmtB?=
 =?iso-8859-1?Q?R2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dCdkFHb0FaUUJqQUhRQW?=
 =?iso-8859-1?Q?N3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21ldGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6938:EE_|CH4PR03MB7699:EE_
x-ms-office365-filtering-correlation-id: c44cbf98-8a09-4309-2331-08dd0cfb1b61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1T30bzClxivRbbHOzuPMtqpVX4pFKQqmMr4HytPw53x3wzzlZGKdx+BZuq?=
 =?iso-8859-1?Q?+XB7Jqxcy9M7KoliYVm2HjU3HJSlNTiz4F+DKvygVweUnHcQfSH8efbQcN?=
 =?iso-8859-1?Q?MB/Cran4gph9upqIISzxlFOy0g/BWKslD9BHWzz3V/2MD1o/nesoiSlVh8?=
 =?iso-8859-1?Q?9ldqHRl4sJ0X3DNmyD67sx0RO/hO+flTcYsv4XxoHeU1LTqip9tkKkwDWb?=
 =?iso-8859-1?Q?IIG1rlksoANgcjcL0Opo6lMTd0Rtr6Wcdv7bJrONccjhcrCcq5v7ZJVpOu?=
 =?iso-8859-1?Q?eF5WZ63K74yH21xzIl2zHNhDepzeQWFXOqk+OFs1MO2mQ1UOTKZLUczaEh?=
 =?iso-8859-1?Q?e8tYVi59mad/cZQdBBDI3t+xDMCSODFs0E1wCAHJPQie95Aem6IQBadkYd?=
 =?iso-8859-1?Q?O6jhabT70oivB1+AqApu9cuwsfDbDHd2ytociTp9YQilZi6bZidZmrG22j?=
 =?iso-8859-1?Q?pGtJobCDl8wdAYLJGYuU/YjuG5ljkK5jnmVIp8see2fKhgMM072lwWWx1W?=
 =?iso-8859-1?Q?TcT6bIi1FoxrvggiKYFpDU+qseDQmi6Xm/OR2/2ZHuGoI9YALyjvzzXuaZ?=
 =?iso-8859-1?Q?2xfZvFuDoNeaPt0g3XVVsFsSXF7Rp/7TAuwFyOdEkA8PAPP8DIjHwOeKyx?=
 =?iso-8859-1?Q?PW6pBNtK4LwRHf1Em0Sr/voY75GyAmd3qySRGjWDCn4WNeXLySdC8xyuRW?=
 =?iso-8859-1?Q?7UV9mZz1Js4+e0n0IZ0ZsGjZDwL2MljIeCdFPdKQyMcGsx2ZdjOHXYZOVG?=
 =?iso-8859-1?Q?x9YTo4N0wj/Jq9cvIkzL0OB0iUZwCibj72VWONInWOWNWJu0ESIxIwJ14+?=
 =?iso-8859-1?Q?W4ZhavFB3EtTA5ID+R8ORt8WslOCsPpuSNctGuRor49aPYCvxFHlO6ChEw?=
 =?iso-8859-1?Q?51vye7EwfLrhZYtJ9d9FeyaAugKVvepQ2ZCFpQMUEYA6Zy0G+0XXCvWU8i?=
 =?iso-8859-1?Q?cMyQZqsM/e869+h5B3xvzFBfFaOTEp4oDu5bO+jM7kCgsmWw0VDJJBatlu?=
 =?iso-8859-1?Q?Qup+fopq8qeX8sgQRA4p8cKz5GjIcRLWdbI8Q+AcqbQm8Mb9r9T9feyeXH?=
 =?iso-8859-1?Q?1MrNx9yPajZcfLqw4tzTjAtNExf3RlOPPVTvB03lH7hY2dz2EOivuUWxzY?=
 =?iso-8859-1?Q?Txy2lMI9gjM1t9ukvJKUUY21x4VmXTvZUFEVtP0VO47tKUhUxEbGrSNvj0?=
 =?iso-8859-1?Q?z2BVUGNswzwF8hKcKT53Z9zN/jJXq89nYHjlYao+StIGk5p1jMEc53ve6z?=
 =?iso-8859-1?Q?78+z9zunppND4VCd73sNKiicT7LUaKOE5fHHIQBuEh56ds3NvEjDbF6Ixs?=
 =?iso-8859-1?Q?WQs5IQ8vlqE2AQo5Rx6g7GxMlpqEm/Zp/VRi4Jl2+r9MW1N4gg+MLQg293?=
 =?iso-8859-1?Q?YmfUYYOEQefR9nvrEZJM0i0GerXB7FftgNhhLyqBjuAbVx0vp9P2U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6938.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6yRcI/goQu0Tt2FC7bR4FhD2SR5TBiFZSV7DXZIFuVgCLwSFhymdIRZNzP?=
 =?iso-8859-1?Q?ym9jqTJLbh6eIG0hgixdF1z3jDvo9MQbim39vqWVACFAzMtqHQ2zvAyVk0?=
 =?iso-8859-1?Q?SZ+PUSRVIfzx7ks7wkTLs0L/F1FoxOZoVyWjI2FDAajBHDg0ppP1yK+4wL?=
 =?iso-8859-1?Q?ykiTs/1zGYVqSO0XUpmnGF0jtWNX1R8yuRbl2en0Yf7IhAEfxQg884eDaf?=
 =?iso-8859-1?Q?1LDMQOQsdWEMOs7esBlo7Wg91AZbvJW1NtiP3dDNORiZD+eI9z3RKMbsKV?=
 =?iso-8859-1?Q?7XqqfZfIxNJPLOZNQImtwd95uehxhZjQ0n4vsK6LyXUgHZfgAjd0lZAdax?=
 =?iso-8859-1?Q?ePoA0HgHoKbjseXAYPNQaHfVfU+XC8HeLOlsHCqLmds8g1r7T3eNlAWbcx?=
 =?iso-8859-1?Q?nz2d2ljRqetvsBZxUWx/U+KV//sXLRAUWuykQIR9ZOcaJmcKfe51hO0HOh?=
 =?iso-8859-1?Q?DvwMx+z2KTrI0HyRZ6kGCvQT0dJCHH1e8PgXe6iMXpDzrjpNkZu+2ZAzU8?=
 =?iso-8859-1?Q?xW9VeMGTdBDSvwrLbtTJOkQxJI+86Fsv5ZQBQcmzXxsvz7n99QpOPWIVVh?=
 =?iso-8859-1?Q?sOI3gJDkFfWYo4uQ3N+N/WkfiiNBfh8fRAdlUF3xCMJJELm9tq2D8T9TZo?=
 =?iso-8859-1?Q?Upz3vJn7DzdPucXNqTqN3VPtrh9UccMbOlaelVb7pcPodifmVeZHkDc87V?=
 =?iso-8859-1?Q?ed31zHKyJhCCipEZvYzdVQCZCzZqhaxOGaIKKc5jmmu2UvDsbcRTMC7UgP?=
 =?iso-8859-1?Q?T/Hfpvj/oc4/XRKd/4SKWmbdqN6MJQnE7DDE79/qvjs/rV2fznJwBqhWgI?=
 =?iso-8859-1?Q?yVxAKQoIyZMDfDne5N2sXXktJa1QUNspgXpUobSBebzxdnuA8pXpqJFTll?=
 =?iso-8859-1?Q?c/o9hqC2Wq0Fx3mRlCTr/Hjgg5xHsiWKCWDLBy2vEO3O51FNhHf4Fj+AgZ?=
 =?iso-8859-1?Q?gsvC0f5ZAeuDRmXjrF71L6OpTTS6yNdE2f853FGECT1v59diP8GOOqHG/s?=
 =?iso-8859-1?Q?lSx2vdxA6WFDrUUhUre5mvErBoTGrLZZtp/nZGPb1dZ0wfnt3sSZ5M5Q9A?=
 =?iso-8859-1?Q?GuYXcMWZHcriREWV+yhl6Yp2I0SBo8mN8LiAChAlz9m/iwrgtODgANucxy?=
 =?iso-8859-1?Q?gq7VGMY0ouHYhyyhg3tVNDDDr05JXDF87SwO2VBqFOt9As22zDPzZBrmNQ?=
 =?iso-8859-1?Q?H1ohCx+QuuolOJrNFiUlMhlOzU+l51PwbAW+TueHaaEkxMAsk6h9SvC9vO?=
 =?iso-8859-1?Q?OJa25OTNR3FnxdWWQVKprwmKsvStgQvo7GptnVvw5LqOkiYwxACgZ0BHR3?=
 =?iso-8859-1?Q?2zph9PoKFTeoBAPQfzg57Y42j6UBalCwPc6PmtPgYJuep94UEe8ytPB65/?=
 =?iso-8859-1?Q?YqIgWr7tXRt8ueu5A077eiixfvZDhb/nFbU/F9+jS8APNhUik6bkXgfXHc?=
 =?iso-8859-1?Q?Sx9vkVgpMywwu76urRb9j/z/Ect9wCqsk2E0S6MnIAnoZMPdx7dUluqNTv?=
 =?iso-8859-1?Q?cBjDSlaTocexDrKNt87c6aBAkaKLSb6VWCo4LPPo7hZQ3nPMATvMFnZaan?=
 =?iso-8859-1?Q?axXQSVR09cxsfaBFGhlm8LY3q2encNhvIuyRxoSgwYof7ingAIX32y9J/d?=
 =?iso-8859-1?Q?ZiiLC/3I8LegXD2mdF2svRuPZULLQxaOSL9IwbE+hvCWPPMIlLRSZUCBwE?=
 =?iso-8859-1?Q?IoOobK5yAeZ2G7yguoc=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6938.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44cbf98-8a09-4309-2331-08dd0cfb1b61
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 02:44:39.1595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gv8zZiSwf5et6yhs6URO/FcTgaDMG4FIOxKEJd37osMZgDNpasqNZyeTxinEcOYmA1q7h2oKDgwi7b4y75v0dzWjdLKycc3cjb4gPnLin8/7SMN66vwruTNub/iOAtGp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7699
X-Proofpoint-ORIG-GUID: AB5xy5m5hd0zfrc-vfcgbd1jgyktBx1u
X-Proofpoint-GUID: AB5xy5m5hd0zfrc-vfcgbd1jgyktBx1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250022

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, November 21, 2024 2:39 AM
> To: Guenter Roeck <linux@roeck-us.net>; Conor Dooley <conor@kernel.org>;
> Encarnacion, Cedric justine <Cedricjustine.Encarnacion@analog.com>
> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> i2c@vger.kernel.org; linux-doc@vger.kernel.org; linux-hwmon@vger.kernel.o=
rg;
> Jean Delvare <jdelvare@suse.com>; Jonathan Corbet <corbet@lwn.net>;
> Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Sabau, Radu bogdan <Radu.Sabau@analog.com>; Uwe
> Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>; Torreno, Alexis Czezar
> <AlexisCzezar.Torreno@analog.com>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>
> Subject: Re: [PATCH 1/2] dt-bindings: hwmon: (pmbus/adp1050): Add binding=
s
> for adp1051, adp1055 and ltp8800
>=20
> [External]
>=20
> On 20/11/2024 19:07, Guenter Roeck wrote:
> > On 11/20/24 09:35, Krzysztof Kozlowski wrote:
> >> On 20/11/2024 18:11, Conor Dooley wrote:
> >>> On Wed, Nov 20, 2024 at 11:58:25AM +0800, Cedric Encarnacion wrote:
> >>>> add dt-bindings for adp1051, adp1055, and ltp8800 pmbus.
> >>>>      ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
> >>>>      ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
> >>>>      LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC =B5Module Regulator
> >>>>
> >>>> Co-developed-by: Alexis Czezar Torreno
> <alexisczezar.torreno@analog.com>
> >>>> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.co=
m>
> >>>> Signed-off-by: Cedric Encarnacion
> <cedricjustine.encarnacion@analog.com>
> >>>
> >>> Why did you drop my ack?
> >>> https://urldefense.com/v3/__https://lore.kernel.org/all/20241106-
> linoleum-kebab-
> decf14f54f76@spud/__;!!A3Ni8CS0y2Y!7Q2KluGdg8cJW_wYUd-
> vh5mP66Ns62VZOkPG4Jf7NY9ULtTfjiwYqrUHbik_tI9X4izI6fAQS_7eVscdEFK_X
> OEm$
> >> So that's a v2? Or v3? Then should be marked correctly. Please start
> >> using b4. I already asked analog.com for this in few cases. Feel free
> >> not to use b4 if you send correct patches, but this is not the case he=
re.
> >>

Okay, I will start exploring b4 for future patches.

> >
> > In general I agree, but this is a combination of two patch series, as m=
entioned
> > in the summary. I am not sure how to use versioning in such situations.=
 Is it
> > v2 of one series or v3 of the other ?
> I would say the highest and keep the b4 changeset. This allows to use b4
> diff easily. Choice done here - v1, no usage of b4  - breaks everything,
> look:
>=20
> b4 diff '<20241120035826.3920-1-cedricjustine.encarnacion@analog.com>'
> Grabbing thread from
> lore.kernel.org/all/20241120035826.3920-1-
> cedricjustine.encarnacion@analog.com/t.mbox.gz
> ---
> Analyzing 13 messages in the thread
> Could not find lower series to compare against.

This is v2 of one and v3 of another. For the upcoming versions, should I
proceed to v4 which succeeds the highest or continue to v2 based on this
series?

Regards,
Cedric

