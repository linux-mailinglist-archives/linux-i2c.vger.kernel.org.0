Return-Path: <linux-i2c+bounces-12351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CE3B2DFC9
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 16:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3463117F6E3
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 14:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9FD2DBF52;
	Wed, 20 Aug 2025 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=persistentsystems.com header.i=@persistentsystems.com header.b="WCnTCEyt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00856c01.pphosted.com (mx0a-00856c01.pphosted.com [148.163.156.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFF52DECBB;
	Wed, 20 Aug 2025 14:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.220
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701082; cv=fail; b=PiUn3O/SwtT8cFbJVvhO+bohNfxu5GwjuzyqOrOBwmAqQmJwrYqefoQ1ijNRS9rmq4RA3QfYh9PUUqGf28b28+YphiDLATDnEUE0EH4TrzfmwR0YJGcTeyEoTpsNnENU+YVYx6ougK77yVi3ybexpfBuupwDmcsUzDlGoSxhIsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701082; c=relaxed/simple;
	bh=NhXMpargBtWqDrwsif1gezezNpFF9DA6AuKoXmXInVE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ov8yAlLJlPaaTMF/BYA/BqXBGuqwJXsEp/sa3Yv8tnBIxUtitRQ+cyGHh5Tl69UspmBhK191NZfEVB1a/xp2hgVlSZ7rfRyT/O6ApVoV/DcbZ7cX+YBtNQu7ZNgs1EbhIYAuLPr0ErcuFj+eHm5HDku0yXJOWQ06vWiFgkSq8g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=persistentsystems.com; spf=pass smtp.mailfrom=persistentsystems.com; dkim=pass (2048-bit key) header.d=persistentsystems.com header.i=@persistentsystems.com header.b=WCnTCEyt; arc=fail smtp.client-ip=148.163.156.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=persistentsystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=persistentsystems.com
Received: from pps.filterd (m0350632.ppops.net [127.0.0.1])
	by mx0a-00856c01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KEhODl018085;
	Wed, 20 Aug 2025 10:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	persistentsystems.com; h=cc:content-transfer-encoding
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps; bh=PQmUExCo//+H4rwaGeiFXZ5lJb9reN
	jN5y2lLMIs0dA=; b=WCnTCEyt6U8xwE05+hDjwrrLZjKEGAnD5JLhpSaBG+wWn1
	gdCeUaCsVu4mDkM5TtC42TWliScpb5BUlr6B0qgyViM6jFlFR8wXYo3C5ETn8cG2
	6irLt6Sii3wgiPF1eS+pGPhMWD2W1bZsWa9bD5TH+dsQfRIHjGBfS9OuPefbwrGV
	IyEQJ9M8fNslEYHDCiG2V35GO/NpmotKDLQfsTtxXtVDoWnpjKLtUx4iBVn2BNUq
	gvihw1qowpr2mfsNWNzKIxOqBMLROJ8z4735Kg/mKOythEj8WsIgRTcvzudVIxfU
	hkVlOaCR3OjuWML9Pb4tg/sX7uDskxxRaiOqYLRQ==
Received: from bn8pr09cu001.outbound.protection.outlook.com (mail-eastus2azon11012063.outbound.protection.outlook.com [52.101.58.63])
	by mx0a-00856c01.pphosted.com (PPS) with ESMTPS id 48n0v20a0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 10:44:39 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuondhCSHhrvKgIuVbWPVHMR4x0RoOlt3w+8r3bEVtdTJkfF2AUTDIoLeOZvxOhjKqgZiWLiQwJKMASXMeaKMx7Ta/mrFAfnQBmytpPkXjQs3J5wZPRAdfxnFY7IRd96gOqyw7OdHVL1BAgV8dnd33QOHFgpiPvaHqoqwGl2aE0+E/r3eBeyFwJ257u5BmmV1Gi/jBs5Xa4qdvkCnaPz4yaEDamM94BMk8+keY2tM3ylMG4P4dnSp+rQBFE7pmBPhYIovwl6A3Rs0d3Mg2Qdy4YJufclXzCG9QM6fCYQ8I3KJPmr+TM7x7qHGUdQHVvEJw+iaMdqA+Ma5QyxU+OoXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQmUExCo//+H4rwaGeiFXZ5lJb9reNjN5y2lLMIs0dA=;
 b=yfu8r+qxPSk1wZR2mwPuFJkiRPQ8yzBVHJQobWsnFd+uRQd/CWn0z4YnYag+BBOUdvTgWleCqUV5xsBLq4w4d/Dc6fAsmdxEnqkHs5haAo+dwuZT757mcCCEem2IUNyz3u0tGyDdTBsCNrSOFg6BHMf8lwIcQL6uUo/EgE5kNI5wPH+vPt6f/8wRztlhR2kjqgYDal4tsPWkCo8mfmxIcnmcloiyCO+Mt3HgT6v1GZ85znxSePSm00p6h9Kh9GMNvtCNicUxWbKwHy/22KIknM+TfCMOj2rU8fqis7DBfAilmB31Ev90bvVeTK9OMxG2afz4m9RHncAhNRwNMoGhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=persistentsystems.com; dmarc=pass action=none
 header.from=persistentsystems.com; dkim=pass header.d=persistentsystems.com;
 arc=none
Received: from SJ0PR09MB10822.namprd09.prod.outlook.com (2603:10b6:a03:513::6)
 by SA9PR09MB5936.namprd09.prod.outlook.com (2603:10b6:806:43::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 14:44:37 +0000
Received: from SJ0PR09MB10822.namprd09.prod.outlook.com
 ([fe80::b2eb:39f1:81a0:75eb]) by SJ0PR09MB10822.namprd09.prod.outlook.com
 ([fe80::b2eb:39f1:81a0:75eb%7]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 14:44:37 +0000
From: Feliks Peysakhov <fpeysakhov@persistentsystems.com>
To: Feliks Peysakhov <fpeysakhov@persistentsystems.com>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Fw: [BUG] hid-mcp2221: I2C timeouts cause permanent bus lockup
Thread-Topic: [BUG] hid-mcp2221: I2C timeouts cause permanent bus lockup
Thread-Index: AQHcETHVVcD9tCR4XE+722cARKrxbLRrlryQ
Date: Wed, 20 Aug 2025 14:44:36 +0000
Message-ID:
 <SJ0PR09MB10822B683C8306136D37C01B9C433A@SJ0PR09MB10822.namprd09.prod.outlook.com>
References:
 <DS0PR09MB1082645B489866447C7166858C430A@DS0PR09MB10826.namprd09.prod.outlook.com>
In-Reply-To:
 <DS0PR09MB1082645B489866447C7166858C430A@DS0PR09MB10826.namprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR09MB10822:EE_|SA9PR09MB5936:EE_
x-ms-office365-filtering-correlation-id: 9ec02217-32d7-41bc-4ec7-08dddff815f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?keZBZaO6FODVniOn1GTknAqefwmQrvrBwBwVIb2x3+hERvXElztLELFifr?=
 =?iso-8859-1?Q?Fbw12P927f427OHhN+/MrL4VfhBQjTkYDWnjCUobJRAbtsd5Vm122DxhN9?=
 =?iso-8859-1?Q?fwbNajh4xPSvLhqx9nMOhVOK2ircQVJFqD5dglpjNZ1HkaOG0/JwENVOdi?=
 =?iso-8859-1?Q?lQtt6kWI6toJ+VcROkkgpKKUo6v9PsrTiBbzNmkiau00V9f3eAbI2QmtCm?=
 =?iso-8859-1?Q?4W3ezqHPD5tkMXEr8w+tbUByyDHKbehSrCI5q2zjjlDTmMDddAGPUZZmEK?=
 =?iso-8859-1?Q?78uZSo0SLYl4wsS9iv0qc93bKXl1Mw16+FSNqKbadCXfYGK7RfjC82GHWo?=
 =?iso-8859-1?Q?pZsx+2m+RjnN9sGfgom38jubbhUsQzjtMshySXSQCAIP+VSv+90jE6XUmB?=
 =?iso-8859-1?Q?szjwWQ7vXu4mralxod58UCHN/7R+OFeXORZdsowLDZE61cvc1vyB1YxSCh?=
 =?iso-8859-1?Q?+roIJy160FTsXqUJgnnSCZT5XdWfR9lX5nV2DXCR4mJSnERvjTnr54ncyp?=
 =?iso-8859-1?Q?7yJEhRxpkZ2sZVeAjuUoxEqvGkHWTWtk+Q2omalLL/ExrBply7rgwqgTtC?=
 =?iso-8859-1?Q?EJoGpoLtjjGYyYjZztKA30ycOMVwUt3PJ5k4hPPuGlyCIRYM153FHMzUmi?=
 =?iso-8859-1?Q?GN2HiijZyB4Pv6uCb0PLxTsCcUw2dBKH9yVu+ndeqYY1P8/LafMzX6xhXh?=
 =?iso-8859-1?Q?ut3UJDYpAmWfzjV/BiHxfVRFr4jX3wye59PqVfwBVHhLt4wl7U6n629f+B?=
 =?iso-8859-1?Q?EOaVUHNIk/KgX8eSbd73cKEcAE568sC7+O/Cri5ylnDuFtEpTCI77naeWe?=
 =?iso-8859-1?Q?+mNSf1LLhjfd6kBup7udO6Puc3AhKwZXTFJtF9miEM5e0fWebMiZHcbkFu?=
 =?iso-8859-1?Q?TpT2qAQBdLj/G70GFcxTZQ7i2nLdJfiZ1bZHIgVBBYXbB9Dw9efH+rjVP+?=
 =?iso-8859-1?Q?fwTQM7cmqipLQ+td+vdUHyVN6I2YWPApmHX4ByFmyrub3i7q8qiTom22c/?=
 =?iso-8859-1?Q?zAJP1MsPccQZis1dhXwW3bvurOOXWKaEZ9aDJi/hhUK/gXUNtunoo2XnWR?=
 =?iso-8859-1?Q?Hj7NaP3wocX+kLMOM0ndMjpw6sxkLaUn1xUJhjYRniGp66Gsl9bHYS6mCa?=
 =?iso-8859-1?Q?O8IGc1KntpIepDSZrPXzIw0ksaNFPafl8EORhPUWDVPe1gokZMIFV8dSWu?=
 =?iso-8859-1?Q?JsOxtgIt7zcq+mmvfDku4Y4/k1UridROhtRQDnVmcIP5rOMPTnNvi6kF3u?=
 =?iso-8859-1?Q?qGB6U4Fe3JvBtYtJBMrgRct7FmNgP44uaOHy4g1wew0l8whJxAIMTucO5e?=
 =?iso-8859-1?Q?UD51l7vM+ANfoD3u1QoJ53pl1aOpOZUiiu20wTn4Pvr3WN+djaiDd93xpv?=
 =?iso-8859-1?Q?FuuUcwqWfYxYm4+qTrjDLBs+5ty8z+4aK7sN1Nfh5YI8939s2Z+PuBC2+j?=
 =?iso-8859-1?Q?8pL36pUU0JaoTXGbw3rcDl4SmoMRdWo4VQXCOAyJ3+z15WLE9Ahtw3L1B4?=
 =?iso-8859-1?Q?A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR09MB10822.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mA8o8tpHg4wg2s1lB6Cfb1VeDr9rVuUqhqAiMYe9Dl4VxUObaL1QGZff86?=
 =?iso-8859-1?Q?v+4jq7SeWn9fh+VmWs+4lrF7E/uE0UUEUjWztoNS0Ox7S2w9tx2TO+DZgK?=
 =?iso-8859-1?Q?WiiCGJJ0ecSXPAhgIQ3FcWywcmLnYsL4nl69+uDBghrSTjQvx74LkU5SvK?=
 =?iso-8859-1?Q?zjlLDJ8ga/IiQ5C3LFtp7JQn2nxPBzZmLF8o3h4kYgTaEp3Xkw7l/I4Ny6?=
 =?iso-8859-1?Q?nixhcLuxyDQrkpBAgKvI/nGX8ltF0X43zklia0gUaoHV8sCnpj5A1ocswe?=
 =?iso-8859-1?Q?7oJopBMt2IMCEB107lPed5i98gH9w+3ZYtRb2189cHAuSKrer4hzQYc70a?=
 =?iso-8859-1?Q?42oeJhOSbtJZrrh1mae5nLTwMNcSDHeFgCyj+15jF6bGBzbX7FaKb/qK+s?=
 =?iso-8859-1?Q?f14kEXvOxH+puYEGrLm88113MpadfawVOGTOAEm53NKp2mwcICB0WwSzZo?=
 =?iso-8859-1?Q?45g2NwPPnu2XGcJACHtoWUWczRlD1p7WVoB+/52PUx1AYPGCxUqaY5vjH4?=
 =?iso-8859-1?Q?RuRNCnnES5c66rX7pnVAw4SpERbGJWmsymlNQkFqcdSOGw5FHf2s0aWRHM?=
 =?iso-8859-1?Q?2cnx6zW1OePDmIU9q7b/mBQ2GPKIOCAEax531iiBswdtgxLUODXvwU1e+f?=
 =?iso-8859-1?Q?Uvc/9OtpAE7eyeZHZxK/Yt1GwKLCci5uDXY10xoF8Yr46QFnWXPA1vGtaT?=
 =?iso-8859-1?Q?bURpRpOBpdYfFNoEDgn3nHcNai1Bhp80cJl+VbMAYykYekBcx8vWvLj3x5?=
 =?iso-8859-1?Q?utIp0AN/Cb/XvTPcZOtFbfDrG/Mg4As6qP1ktZJEvZRSIbN9j+Z0VDehwI?=
 =?iso-8859-1?Q?0KT9Nc50KFnEUb1ThCF5liOGF+SU7L6GO6fCcwgof40+cZoQ4mf6caS8+/?=
 =?iso-8859-1?Q?tmhg35JNzYC4PZo4E9ly1f2Z2qgzzE6pXGvN8PxybSE2sNHWmCTh8D0w4u?=
 =?iso-8859-1?Q?bFQr+Le/HEVVew5JNDFgDM74bZSjb8U7rjHzzDOQg58tf3/ElF9FOt+t0M?=
 =?iso-8859-1?Q?f9/53sWUmr+u4B4NPt0eps7RPrcE8G+IcT9ck02E3bzELjbaY5zwKYzCzp?=
 =?iso-8859-1?Q?eDT2Skn28nawXEbAGAPgiHGdRKZg+gkUMtoQh1guYswtqJNo6ev/ZLgKP0?=
 =?iso-8859-1?Q?CiL+mZgcjnR8vXj1w6w6hMs0NLR+XfTng0df8Yb94ZRssOfiqwjFbHIfa+?=
 =?iso-8859-1?Q?1JpHZocwpUn7PUc7Gamga2i0aXsikOMmOZrmAmDQZNOSjWnjcDSmS2cgrD?=
 =?iso-8859-1?Q?XgWSAaoNcneLOvn/i6DDP69nP41gOc62fAT1Wx7cKiJUe2zcoGoPNn5DxO?=
 =?iso-8859-1?Q?d2DLIr4EY86I23NnT32VfaGn2dGTpYI++WIdEwASkEYcxOtaXMyexQJAXF?=
 =?iso-8859-1?Q?UUU8ywEv3QH47282l6r1v9vwRQfsIF1m7Zm6v8QMq7DDafUzk3xAn2z3Qk?=
 =?iso-8859-1?Q?pZ5fPqrDznnHpvB9cHqOJV07R/cS7AOV1HzK8uhNLTKb0GUQsw6zBCLJqV?=
 =?iso-8859-1?Q?7rhDN7LmKDvbJEHQr7b1LskC1tbHugjT12eTrRSNjTH/aqakC+uXypKk15?=
 =?iso-8859-1?Q?Ssq/MeRJU3jRqsw/Hl7E0p4BJprV/MQnD9UjAgHxVwOi5udKaiZNizffAu?=
 =?iso-8859-1?Q?OLGliRjbqUcR03v/vXZKcrGFDnuNVFwWeXhN2zSO0yoWdb0TBUGoPs1g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: persistentsystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR09MB10822.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec02217-32d7-41bc-4ec7-08dddff815f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 14:44:36.9174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cf020604-ae4f-4402-9ee7-1b018a65703d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA9PR09MB5936
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX1VJeffSkTNzm
 gDcOx1/+3nCnZT/pm9egQ59pJUB5ecY8WflE3UItZuor7YevElw6KVkiJkOdPlPKPEHoxTCketv
 14DS257ZGAA68ziGh77IV9OzSNKm+JfNlCdCThNbtM9tNtOPkAcqTAZnKjmnJEJujjJq5tJkngG
 yFy1DdfPsxaJdv+XN6P2YrdSVIViabzpKh04SJcauoVI2LEECG7RFOhGuOKwqTH6dxHDdE4cKlq
 zuiq/sP1NblIvzciKxNBgb4L3bAZURWb9IXuJXHJjCujnjdNtSnEPjiQIm1kZVEj30/9zbEfw/0
 GMrk0N6QH9Qhy0dGOh41gG4OA5Crx0ATt58Nzn4hbJlu/fRLu2VxTaZ1npFxO2Qmen0pNlbJHUh
 jGct25EhC7RcqUCKW1IcdgjLfF7KqQ==
X-Proofpoint-GUID: MQsmS7BoygEjwBuZxk_bxf9fYqeQpz-N
X-Proofpoint-ORIG-GUID: MQsmS7BoygEjwBuZxk_bxf9fYqeQpz-N
X-Authority-Analysis: v=2.4 cv=GpMbOk1C c=1 sm=1 tr=0 ts=68a5df57 cx=c_pps
 a=lj7jQ1xIh1KHbq/KAgm4rw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=danhDmx_AAAA:8 a=NEAV23lmAAAA:8 a=JsMfjHRbAAAA:8
 a=1dVwtWwagfwfTViSMZQA:9 a=wPNLvfGTeEIA:10 a=YWTD54lXyBypdVhPORuv:22

Hi Rishi Gupta,

I'm experiencing an issue with the hid-mcp2221 driver where I2C operations
to non-existent addresses cause timeouts that permanently lock the I2C bus,
requiring a USB device reset to recover.

**Problem Description:**
When sending an I2C command to an empty/non-existent address, the operation
times out and all subsequent I2C operations fail until the MCP2221 USB devi=
ce
is physically reset. This can also happen if sending a command to a valid a=
ddress,
but there is a connection issue and the request is not returned.

**Expected Behavior:**
The driver should handle timeouts gracefully and reset the I2C bus state
automatically, similar to how the Microchip-provided driver handles this sc=
enario.

**System Information:**
- Kernel version: 6.8.0-59-generic #61~22.04.1-Ubuntu
- Repo from Canonical: https://git.launchpad.net/~ubuntu-kernel/ubuntu/+sou=
rce/linux/+git/jammy/commit/drivers/hid/hid-mcp2221.c?h=3DUbuntu-hwe-6.8-6.=
8.0-52.53_22.04.1
- Driver: hid-mcp2221
- Device: MCP2221A USB-to-I2C bridge (04d8:00dd)

**Steps to Reproduce:**
1. Send I2C command to non-existent address (e.g., 0x99)
2. Operation times out
3. All subsequent I2C operations fail with timeout errors, even to a valid =
address after that.
4. Only USB device reset restores functionality

**Comparison:**
The Microchip-provided i2c-mcp2221 driver (from their example code) handles
this scenario with some form of bus recovery. In fact I noticed that the LK=
 driver
used to do the same until it was removed in this commit. This includes a fu=
ll
reset of the I2C bus on the chip via a set speed command. I can see why thi=
s
was cleaned up since its not efficient.
https://github.com/torvalds/linux/commit/02a46753601a24e1673d9c28173121055e=
8e6cc9

**Impact:**
This makes the driver unreliable for production I2C applications where addr=
essing
non-existent devices might occur during bus scanning or device detection ro=
utines.
For our use cases the greatest risk could be a board that is not powered up=
 fully or a
mistake on the user side where nothing is connected forcing the chip to loc=
k up
for any subsequent R/Ws.

**Proposed Solution:**
The driver should implement automatic I2C bus cancellation/reset when
operations timeout, similar to the recovery logic in the Microchip driver.
I think potentially there are some cancels missing in the mcp_i2c_write
and mcp_i2c_smbus_read functions.

I noticed there are cancels in place that are trying to be called but also =
failing
since the chip has a successful return status, but then sets a NACK flag. T=
he
cancel commands themselves are failing at the chip. I noticed that cancels
do not work until the chip actually reports an error state.

--- a/hid-mcp2221.c
+++ b/hid-mcp2221.c
@@ -318,6 +318,8 @@ static int mcp_i2c_write(struct mcp2221 *mcp,
              ret =3D mcp_send_data_req_status(mcp, mcp->txbuf, len + 4);
              if (ret) {
+                      usleep_range(980, 1000);
+                      mcp_cancel_last_cmd(mcp);
                      return ret;
              }
@@ -399,6 +401,8 @@ static int mcp_i2c_smbus_read(struct mcp2221 *mcp,
      ret =3D mcp_send_data_req_status(mcp, mcp->txbuf, 4);
      if (ret) {
+              usleep_range(980, 1000);
+              mcp_cancel_last_cmd(mcp);
              return ret;
      }

I'm happy to provide more details, test patches, or assist with debugging.
Please let me know what you think.

Best regards,
Feliks Peysakhov

P.S. Sorry for the duplicate email resent to mailing list as plain text
This message is intended solely for the Addressee and may contain informati=
on that is PROPRIETARY and CONFIDENTIAL. If you are not the intended recipi=
ent and/or are not responsible for delivery of the message to such intended=
 recipient, or if you believe you have received this communication in error=
, please do not print, copy, retransmit, disseminate, or otherwise use the =
information. Please notify the sender immediately that you have received th=
is e-mail in error, and please delete all copies of the message and its att=
achments that you have received. Thank You. Persistent Systems, LLC, www.pe=
rsistentsystems.com

