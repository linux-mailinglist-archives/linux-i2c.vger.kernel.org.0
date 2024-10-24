Return-Path: <linux-i2c+bounces-7514-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 134099ADD0A
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75B56B23FC1
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 07:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C4D189B86;
	Thu, 24 Oct 2024 07:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="A9NiiRDm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2056.outbound.protection.outlook.com [40.107.105.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9B3175568;
	Thu, 24 Oct 2024 07:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729753523; cv=fail; b=r3KEkhW1mXsN5b23GdA4/9H9QlHqKa4HSru+kHgVZZqbLY+5UBA9ahQoTJvt2Z8pP6kzyjfr9udujcKA9vIppW+PZhRTH3U6sMCA7bidt8xH+Ul6vB3F4gkIWQwPS5QwUMKKz8PRoWjeVPMO5MMGMEHB/ly5l2IdqTZdJ8aZuVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729753523; c=relaxed/simple;
	bh=+FVXWF3rnkCIV0aOEuyvyXZCCVgOmBMRSSu+ERrzkvg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B7wbcXunMbltLvx64RH/kCX6EefKJr5F7nKR/acObHOMGJdt2MmnUN/IniaxwZhnwZdL9DUPCHC9jz0atzFRNhwLtO9UPC+CDXaDH6jtRNzs3JUFlEP1n5OH8ZUuKoCb1GlPSHeSPM7NcME6imesg3QZb2yFtF1zRy7VgKzN83Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=A9NiiRDm; arc=fail smtp.client-ip=40.107.105.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzHigutDUytzO+1OVTqBQxqD/+BOqy65QpzDT9AlEArpcsTc4vnAbMjeHHJcD0tQXa4CAhl9KP/Sv77bXNTKdhVh6x+UzxF052XILqDhwtjvIZWqWug3IY5YnUq1rpkJOxSP006mxNzIJPiUr2sop5UeuxPtVzdLfqikmrtNwAR06EPxQkdikYiaE/9fsKMts4l/F80FduMVJxArpOp1Wde0iDrXMaq751UXumU++kLGVSo6JwOEEvxJGLcHqtjFWvkjUgGUfRzDz738By5zAoXJK7z+ul1WA72it7Ug9YZo2CF1MAQIRIzaPeNgmto8ghN2JcgIkLLj7jYm3VVFKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCsOP3gzfzwEaTyUIYYGFi0VHyHB4dsM4H6BJAofKUE=;
 b=d2G3ZupoK1iLQ3SBcfwgJzu1kU1W77vCqPEsqnZDfG30PSOV8xmgpbPUlLQMrET4f/2v2px9Wfvn8m+IKDIEcBMmmjcnjPDg8hB0/r0K6aD9q3aj9mTp3HSkbTx12P6Gci75g7qEqmS5ddTWcq5AeJUt5Mo8PcFqE4MzU9ZZ9qYomemXZzE2whpCe+2aapaS5N4o06fvnpOd+l4x+fF+rtuYaj5V3LTRl0QXrFpn6muCV9hF8dJEpFVBl2MSOvD6eLKJRlKsm/J4CXru6Y6vXzeeX3VTNzJ4ZKPNsOALOAQgGS/8JihnTrEwllSILmbAOYBQPQP9piLjKE8YgVYTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCsOP3gzfzwEaTyUIYYGFi0VHyHB4dsM4H6BJAofKUE=;
 b=A9NiiRDmmFpIU0IiuqC1ZKgjlEA8NHoKkmHEOc+iwjkziIYqTuu7Gg3NXxkaPtKnye/OesQkHDsR1/yuz3vvdWmJR18WgbuoL6wfrZ+63xK1L9yDkYPSTjViG6oGsZrZxi4vVTCgC47tDUO3FY4IFZM+hDd30j9z7kK8CUFJoRruXCqfxP23FyX4jRUH4suzPYQ86OOk/FTd6J7y4D9mLCdQ+dlzG5ZGm5MCtWdOpaZ+Z32mA4p2kuEN4l2Fii83HthgsgR+FpYJQMHssNiffU1J+OY21ez3zV+eKbUPlfGPFbSNdSAxuQKjL6BWFce5oIES7L3NZ/eqI5EPkGjR1A==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 DB9PR07MB8749.eurprd07.prod.outlook.com (2603:10a6:10:30d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.18; Thu, 24 Oct 2024 07:05:17 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%4]) with mapi id 15.20.8069.016; Thu, 24 Oct 2024
 07:05:17 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "peda@axentia.se" <peda@axentia.se>
Subject: ODP: [PATCH v5 1/2] dt-bindings: i2c: pca954x: Add timeout reset
 property
Thread-Topic: [PATCH v5 1/2] dt-bindings: i2c: pca954x: Add timeout reset
 property
Thread-Index: AQHbIUUFrG6WthXGGkih0sA3DyggLLKMh5wAgAFjS9+AAugMgIAErybZ
Date: Thu, 24 Oct 2024 07:05:17 +0000
Message-ID:
 <DB6PR07MB350922B1A1458EE3D7EB3F019D4E2@DB6PR07MB3509.eurprd07.prod.outlook.com>
References: <20241018100338.19420-1-wojciech.siudy@nokia.com>
 <20241018100338.19420-2-wojciech.siudy@nokia.com>
 <20241018135314.GA91900-robh@kernel.org>
 <DB6PR07MB35091425FE5CBCD782B465A69D412@DB6PR07MB3509.eurprd07.prod.outlook.com>
 <pkse4jc6muqwo4zrvb6auhcdv4zrt6zd5zmp4yea5usagw62o3@lgzwggtz4uv3>
In-Reply-To: <pkse4jc6muqwo4zrvb6auhcdv4zrt6zd5zmp4yea5usagw62o3@lgzwggtz4uv3>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|DB9PR07MB8749:EE_
x-ms-office365-filtering-correlation-id: d6b3d0c2-d25e-4eed-3e9a-08dcf3fa377b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?t3CFTDWjBZ6FsQ98romVn/GrcppWAavuE00tGpqF/PTWx/XuI09OPV5XHt?=
 =?iso-8859-2?Q?4MK5mcjNAEpYjreOqt3Am1UB7Yas4+m0mokEb/9fQ4OxWn4FlcuPHgu03C?=
 =?iso-8859-2?Q?CUL30jTOifZZ2MsovglQJ7TXMTdkygdzfYPLarsREc2FYLqbH/b2+EgAK0?=
 =?iso-8859-2?Q?jRy1NrIDLvlmgEKY7goeZaDZTQ7KaoMw25wg0zUyQnXbawMlBnUhpCUD81?=
 =?iso-8859-2?Q?AV/kMU0mW3vycse+gjRRWuMK5qnmoBrlpEEnsX47qfVW9KiEhF4cVb2t7k?=
 =?iso-8859-2?Q?/VToMprW+lhE3qgWx0TiSopGUxAwi5RSuYL/DDlt32u3sB+p/54+7Nrc1M?=
 =?iso-8859-2?Q?ujpmEV2CgjvJ0bma6XaKrMjiFMwqToEKAl8oWLo/D/7r/sLTCrJtwCO4+6?=
 =?iso-8859-2?Q?+rLv3MjHmkuanUjTLcJ6S+lNV6y/4vnfrfqi478vepQ79GloW3DBrYl3DC?=
 =?iso-8859-2?Q?kL9H99C10ySmB8Xw7JrMy9z+HM+p1M08xr69HvoiKa0nTfzvlnKBvbqBk+?=
 =?iso-8859-2?Q?i3vkocxWRNsVkr6uCPyZ6lh5bequIG60rvdc63Y96EB86FhgCxM6OA05lh?=
 =?iso-8859-2?Q?8MB2MD2T2g0gkcmvUNibugcQvF/EaQf0DiC27xiRQO5U02XPbpl0H9hH3u?=
 =?iso-8859-2?Q?JKosV3d7RdsxqNwi4F8KojT6+1RAsCMts3f3RBktYuGhIoUdmE7qQTakUp?=
 =?iso-8859-2?Q?Soy68nuwpxYE0aZWUuUxZuAotDPmuxfLmz8WbeNt3C8gky8nNN15um/P+q?=
 =?iso-8859-2?Q?HkqbshK3rcL/JTC1hjrpeHw0Ln1TUG58CS347JE2XZJlgAbJjwHu4Ntqp2?=
 =?iso-8859-2?Q?57G4pH6qhmkl76/o3A69f0AnHL+V5jWLZtfVbPj7mRtX2skCsookgw1khD?=
 =?iso-8859-2?Q?UtshKN37lf31/EqdC8kH1bKFLgp4fue6youUzKkyWtElRazpfEe7rkB2Kk?=
 =?iso-8859-2?Q?fqoMAH/LwPWdXtKi8ERkOCYeaTnTPGx0IAr+SH2BtMRhLwc4xdoukxyhhV?=
 =?iso-8859-2?Q?u+Anqz6+TS9XXT8MXcKbbcuQ1rFMVYUVACYCKJ6Qv/en86Mqu1piTJs82h?=
 =?iso-8859-2?Q?vIEOfu3GHO8fIGR7+JhfQMc8w5DTDil7c7W1pISPoMU0lJfLyeyyELPG8u?=
 =?iso-8859-2?Q?zyzg9H1oHdGSxnC8Havj6m3ZBmdtoJEcP0n2c6/9YrvSYmwArE+dXKFDdM?=
 =?iso-8859-2?Q?3GMy+7VyGqpDBrN9DWEjISv8bk9TpZaN0ma8XN9L7JOLsEhSF4Jw5gsfbg?=
 =?iso-8859-2?Q?l3u6kcnOZKax7kx/1tCM+nB4GapAGNmfkL8WG2CmxFK2h+kh4aaALQi3Ul?=
 =?iso-8859-2?Q?TKmM8e4jExaYJ62MjjhqKbLh0UAM7yhpqip1RkT9/HVcdOqUJ75LUHyRU2?=
 =?iso-8859-2?Q?L6fnx7mx+wIlcWzH8P3YGEJCSSYJJP2bv9tklP2V5ijrG4YkRNBgE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?6jN7SIbx7K3YzLbmxm8Js0CBTmfJLoww/jlzoESYhKbVjFrTZmHDcR5Wwk?=
 =?iso-8859-2?Q?yRQAm0MEPYKkYxguptkjqvjV0r7qHNcKNv8Bu1WZqEKFWQO9KDTonODnce?=
 =?iso-8859-2?Q?TSRNgoF+A2Ww4h+qIaN3HkIEISRAa+QqbmK3dAes4nkdsGk1f3osqpyWNT?=
 =?iso-8859-2?Q?vf8pvcOguGLszYdUzbSYYffV7IazYejckp8tTneSt/drz/RCwP/HbYD6Fw?=
 =?iso-8859-2?Q?muaM+nHPzGwSzKmCADvDlE9na1qRII7ilshnl3KDhV7WPdWq1kEJ0pxI5l?=
 =?iso-8859-2?Q?+lhmOlE1Wthz4UUSce136LyHSX/wIV8ASGwGSC9lCJyRELbKTZZenLECAA?=
 =?iso-8859-2?Q?R83xDV+LqYOC9RNcGshLSz1onZQa9Q94BC2Ohknl1iJRoFw/kFVm90neRM?=
 =?iso-8859-2?Q?f9zbDIs3O1eisXIRYke/f1aof+3lGLINJi6cWECuT1yrnv2VmH4OFNkHW2?=
 =?iso-8859-2?Q?SM90WxXLYYqCpCIbmVZlqTHj6UciMESKdFlSKJ18ifdBILtcIy6T9kfHLA?=
 =?iso-8859-2?Q?ZqWKPEwA/ZVXdXO0Pr+iU5NBSDuZuv2NHAw3+homP7KY8Peagi1c7rFNXx?=
 =?iso-8859-2?Q?65ggiEUyKF3YzRDcuVkCoZSfRn610M3KkmEeQdcX1jcalWS1AgGhD9b3YA?=
 =?iso-8859-2?Q?lUEphCKRlDSPf41y2qkJDMHcqXXnDVvBwuVESSG6fYpkxorY0ZyeEYP1lY?=
 =?iso-8859-2?Q?qUQdlhXAP1MqNn+yG3yHvXthfb4j6/TFH1MXE9HNUBTAij+mvP5y8kMISe?=
 =?iso-8859-2?Q?pJ0tgdhoAVg/ID5rr2iwhrvnHQqOZe0LBtYR9I6i9yWzGOniQ++nhWdiTe?=
 =?iso-8859-2?Q?bjOCXRCe5lV2wAFEVMQOakAvVBGmhRl4s+lGSHTm3+Rf8rUpW1/U0myRVi?=
 =?iso-8859-2?Q?wxWn5aOJdskNf/1ROENQAy2VA6o+8t64nlUldeHYycfYx9PFQZS8BqKU6J?=
 =?iso-8859-2?Q?sqUjM/hZGhVJrIDFTO+cXdsnAfBA3jVvHICLQNDqtWHtiAMWCT1/eCCAzF?=
 =?iso-8859-2?Q?vqT7AFrVFvoto2cH+i50ZbE/gtTT8VSj/B3LeFOQNrkxFZosf/VdQE/KzC?=
 =?iso-8859-2?Q?vQ/J9Q4f0CkLOFt4/w/yZUSQiseYNK97Apw+ddW37y7mUAjCc6DNHSxSqA?=
 =?iso-8859-2?Q?m3QEPb89whSlofQIZdQNnMYchXL3WInD5O2HE5mOGUs38m/tCQ8bGNnNxL?=
 =?iso-8859-2?Q?st8Ai9D4rV+daXTax/avsYdlcR8KX5T4Y4SG83f0Fnx1Pd5etuOnb07L59?=
 =?iso-8859-2?Q?yRvpz2IM8udbJknNgkbsuW7Qi/xnWuwFWgUYVnnVva5V85qzRZ2bB/hg0a?=
 =?iso-8859-2?Q?SHWLLrJnBWODO+Bt4xNTGz9zGEKDSMxsm/IHMCKcnmwb6cs1BC8Kl3m7ma?=
 =?iso-8859-2?Q?Yt61Y4VaSj88SWWxyA5VAdDwpRo9VmRmA1Hxi3+oe3yDHR+azNSX3VOLkq?=
 =?iso-8859-2?Q?OjsXNJLrhRBT7Tzgzlf726oHNH0zRIKZv+2ZhNs1WkOvP1zQIP/qturITV?=
 =?iso-8859-2?Q?fWlUNcu/pVH4Twxmn6Vyh9DIyZ4NSGdSUbhAgv5xjPOhqszAhzbBObvDwP?=
 =?iso-8859-2?Q?ADy48ZObYppKzYwdi7lBpk1WsxC57RrMjNOZL7nadfiLZqTDlW8Ed4Omsp?=
 =?iso-8859-2?Q?8pRuhzoArRwcxHP9XWYjpv54I5YYFOxkmR?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR07MB3509.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b3d0c2-d25e-4eed-3e9a-08dcf3fa377b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 07:05:17.7394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1154e5rJWZPaGnvxs+E15SJ9VnoEWPNkiO0gszaCtRl/5+jrDP7++CNDGsdAKTd/RUfr18lD3BCZU1CE7rXi5MmrovqT0BG37dMNtfsK1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB8749

Hello,=0A=
=0A=
> This is reset of the I2C devices (children), not the controller, right?=
=0A=
Right, the mux is child device.=0A=
=0A=
>  switch to reset controller framework=0A=
Please note that I left the function pca954x_reset_deassert() unchanged,=0A=
just moved it up and implemented two corresponding ones.=0A=
Do you mean that we should get rid of gpiod_set_value_cansleep(),=0A=
because the reset controller will handle it? I can agree but this is topic=
=0A=
for another submission since there we change when the reset is done,=0A=
not the way we achieve that.=0A=
=0A=
Regards,=0A=
Wojciech=0A=
=0A=

