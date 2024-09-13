Return-Path: <linux-i2c+bounces-6701-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813F6977DB2
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACFA21C21C0D
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD83C1C1739;
	Fri, 13 Sep 2024 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="el3sPBs1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2043.outbound.protection.outlook.com [40.107.104.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E780B;
	Fri, 13 Sep 2024 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223857; cv=fail; b=Fxx8uFRui2X9WSF2cioh/PORQmlx9VSyEc3D5jFEWvct9/LauGR+fmqvHA0Z2T+T/cnFyZuLXV+BHWSfN0GuyVPMey1zNMXkNzJMbkqAfEORb0b0oZL61wl1a3PeTdnKKDYnQ4ZQVTJ6Evqx05AB+uC77T7RpQRVDm81+AEq3jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223857; c=relaxed/simple;
	bh=B6rVBiHEre5aw3k00IOynDZyCjkwj8pNUcpe4HHhXW0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=u8XAif4EPaN7VWEyIY+a137kheLC78bDRZWFPz/1E2PhlM0GEafz7J8M1sZEemzn1y/EwLcAawPtw8/bhwKKMbsBA/ou4X5ZKOvboNCre62xcDYMw20qfQUrey/vg5dy1gapnv/MbiPZsY78H9nPNbZuGOmXKxJqG43k2xn/wdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=el3sPBs1; arc=fail smtp.client-ip=40.107.104.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lpkb/xfZ2U01XIRkNiH14tGjgvNFvmjWna67SJVKSVJ6qtipAfCp8CUDp2Eg8D5ozA/DXQTQzF8jXyFSp7lPR+K7mNV/c5EFdm4tJITdFRsJma4HAppD1Z4OYx76pmsRovIK5KiuxcaWKJC384+JAwPSTn5RloSOWwAYl2l3hmxkn5+1SfzbF+lOEg6ZQYWnmFVGVVs7uWLtBK61xBLh4cq8Y46z5D7DKvfF9B2H3T8Nil3df+upDeQN6ajYxhXdr8A6NSJkF7qUYfTNYvWXQRBvz7apj1SfKAn8OZYRL8Se452lUcGYgAsCZODMYxVuQ2HMmoqJNPRUQrxb9sQJtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBWD1K4+3RfYOz6ml5XAu+I43C6yVC4FsoCZR6m1a4I=;
 b=HsEwP5147sMH1JLwuwUa6S7SjuD8gcWePyfj+fkqwsVqwzMqu4viTyd3r5Zt1kP5ydnaIzz6FAuUg+g3go1MnWMBZCuRZ+e+5ayuU0bLXPfXOBwhLLsaP7XTpjoB6LTZfHd4EjCNiVUykbi54LdYd5U5FqFkVA5i3kFWnwItj4fbUqyX06nJE1JYzq7Rx6jSwVjSZV0JONuMb5LYGAQbw/wMMNLlxuyj/kCu5ZowTbjpDqkw6d+GNOEw+9IrTDL68Gt+qzBtzSXeVOQTVsU6CLdDiupRJH1fNx4+Da0wKo3EKTn4dfiv/dUozLcWRNz8NokHK1je//iAM6C6HZsbQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBWD1K4+3RfYOz6ml5XAu+I43C6yVC4FsoCZR6m1a4I=;
 b=el3sPBs1VeCIdJC3CrClpj9sMNHspsF3hhvCb8H4comCe3Q8XeqzH94ih/qT3gjgXraX/W/amyTkTMBhuK5xIL191y0vb2CS7ZwkrOLSREf/cEwkfsl6TZAxpvZ93M4ugBPVub+wkHQnmkbmsi1+Iwy2oB9nzmPm/gZQf8/F7wJ52FFth5zDoSA4pfQoORvUpqLYCcKaAbdMtiTm7nm8mFUB6apneJUHiQVbONXE+L5zLJfwroPOwcvjXSX/nT22h0aSnQtn1eoFFmNt7LdHQl2LYnZoOG5ppun9OKSRwcmBSJ3ugz/hUsmbvJxQH2kwouklrm1jYEC8Cu5VSnggvQ==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 VI1PR07MB9408.eurprd07.prod.outlook.com (2603:10a6:800:1c3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.17; Fri, 13 Sep 2024 10:37:30 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%6]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 10:37:30 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 1/2] dt-bindings: i2c: pca954x: Add timeout reset property
Thread-Topic: [PATCH v4 1/2] dt-bindings: i2c: pca954x: Add timeout reset
 property
Thread-Index: AQHbBcjQ3MHOkSAFhkWJk/Sp2JYEzA==
Date: Fri, 13 Sep 2024 10:37:30 +0000
Message-ID:
 <DB6PR07MB3509DBD6C72832E8ABE7FA539D652@DB6PR07MB3509.eurprd07.prod.outlook.com>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|VI1PR07MB9408:EE_
x-ms-office365-filtering-correlation-id: 8a6149e2-9181-4a9d-2ed8-08dcd3e011b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?BbFkpTWiK59j7ZresLUjN+UsQxzylUYtWLgP9Aa9Sl+SQnV3ZODu3/iz5M?=
 =?iso-8859-2?Q?6rdKEhtlGjFErQ1rJOAfjH3h3iIqZyuy/nOqr9D8VcQ8+/lLLX8cXM9ZQm?=
 =?iso-8859-2?Q?KvH5BvWfo/akoEynFjvWHGlJv27E33U7vEHIuGJ6wL3M/SAfUCuGYjY8Bo?=
 =?iso-8859-2?Q?Ii644nYwVIjoA/lyGq+OLCShcnndWRsbYAMd9Vc7JzVav7Hv67JlQazaIk?=
 =?iso-8859-2?Q?wumySnD24eSB1sKGW6rAZZvRwtx1ewn5Cc8pZq4F69A1tTNS8b8zcZA2SM?=
 =?iso-8859-2?Q?JitHYQRbq4pHM1DpJsNXl9XOf9m6NnuJpjtAjD/iutljmnVnfeG5YM595/?=
 =?iso-8859-2?Q?oXJxxGy6SpJZCmkmZn5r4BFmZgNuXSSWmj3i2Oc1TokvSoujGNu8lGULOF?=
 =?iso-8859-2?Q?PITG+18VmjYZZPHnfzxspOc5PJdH1An+9L/7DMkhPicloKLANq0hOmX760?=
 =?iso-8859-2?Q?PAVfyVb81DaHIqG+OnZIoTEx2Z/5i4ltRzPzqwtPuUze41GeIgLEXPmpCd?=
 =?iso-8859-2?Q?lPb0pWzHzRrfBg84k5HTLz0y1AsK581CszPWiC527udXDhud7zJ8YdJjI8?=
 =?iso-8859-2?Q?wsUZ93gN+SuN6IfpKen7VaYsvVpl2hhzjV2nlVj9xQgR2oQnuJWX53mewY?=
 =?iso-8859-2?Q?07oeVXPOklx3NY64hO3ttYlRSMXj8tj9RqQqPevG7HqWERvakuVmdMchF7?=
 =?iso-8859-2?Q?LhB+3O20UHZ0cMbkS1DBPw+uVpElUQis9e1QZzENzZcBt7gND6JbtRkvH2?=
 =?iso-8859-2?Q?ClCp4Nne72E8OH3UYzlYkCSLenTHcAfufEEvuBPsUUUNO1k4wLoNRZX6yf?=
 =?iso-8859-2?Q?f2j2del/vPpFqCvTpmg7HZ60/wsxekZSFUe0IXXQHqdIteJCqdRtgJdqkb?=
 =?iso-8859-2?Q?0FSqq+GIkicOM5tk6zXpYGrJtMwsk52y9s22Rpb7EDjyZW798wreU4UIiZ?=
 =?iso-8859-2?Q?qf7AHZ8PmJYxS0kTSe9fV32LdcOcPMEbE1OWUQDvDthUttvs/Yylue2kmO?=
 =?iso-8859-2?Q?8yqP3o+z73Aq2ylZaKBY4nc0I5uCZOf1AxZJsJh8f78GWaNSmEAdnWSAVh?=
 =?iso-8859-2?Q?/c+gJ5RxUS75L9ql13kTkIVgVg5iVMT0Ejjo0jawLVXYv+GUIxgH4YnC8W?=
 =?iso-8859-2?Q?y7XoalVs6/ApyOPhkA824rbjZ/h9IMuLwzIMhMCGbtKHhz8R5cGn/PiH38?=
 =?iso-8859-2?Q?HZQH2dWDFXGseDUtLfZrX2ZH+Li3S6UmL+ho8bYdbLv8SySpYpiL6mEvKu?=
 =?iso-8859-2?Q?SfhrHojO53dGQx52E4RvuYAdgld0moE/+BLn+BEzAbe/qqhJOdpUol9ZCF?=
 =?iso-8859-2?Q?1i+I6z+0owfuoJCNMOcJSximPSqfxXChEi/1YGyudM1HnnVXvfCTAjmQTZ?=
 =?iso-8859-2?Q?V8hUOxsnukEHUe6fTBOczhZnPuQFuvUQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?QsyDaAtJNXNOZa9gC6jAVr6hDpIMjDtWZxOSpNJCjV0bdfrb8YNIcaqiLv?=
 =?iso-8859-2?Q?sJpZqbC1/Oi3BqOEY5+pEZCkRlOz/XnExNXOFUTWUAJNx8F9IBJqlrb9+Y?=
 =?iso-8859-2?Q?4ImqEghm1bTEoWZ4J/u8mjy0ipxVuiPIC+KwLeCO9qJJXQMd/HMzbiuZ1y?=
 =?iso-8859-2?Q?VV0l72NhOmAtvIWbhnXKqFkBNTPGQ4oSethlGRQCu9lHOoTdBG7bCsPoX6?=
 =?iso-8859-2?Q?mNluqijzn0LPv/L7NudTQ5qY21+J6UWzSqIGgYH4udYpSvmKJz0Esn3wYU?=
 =?iso-8859-2?Q?1RUmSnfDQcgpICZXaQcm68hCOGCNIVuQwXerPvRmYfvefbNMaTCSSdsOOf?=
 =?iso-8859-2?Q?LeTevn7jH7p7Nejl7VXinbEbS6Loeic+sIlm/AHYuo/e0dwRitsxHzLyPz?=
 =?iso-8859-2?Q?S6j9/7+6K9yCzz+zZLWK9CAVY0J6++IvCRXu7q5YdDTROqZzsPuOWboko6?=
 =?iso-8859-2?Q?X51XXaXEWw6svi19D/F7CnT1A4oZZLdY6tqxvCTprV4EDrIBOpScpd6nv/?=
 =?iso-8859-2?Q?gSdFNLDlB1mcoJI5J/OxNDCayU8WP0YpWNCfARzVln+/X2oifgK7buGBd3?=
 =?iso-8859-2?Q?YTObFkIVP7LHLWpYgk+ySgtRPghDC8kKECvCL3SIrLIElZA1Bpl6SJM2qW?=
 =?iso-8859-2?Q?cyNtdcGL0x51eZ0qiPJPvXK49NlNRowPzPPCR/c6Ye3dTpRsNQqlM1lpml?=
 =?iso-8859-2?Q?GfdWZhl9F+2m2LSWMmEy+/Yhs1JFh4j+5HaFevxi43d3V8PCehrvRiEboW?=
 =?iso-8859-2?Q?Km9FIXDvDg8X12bsVncSxQXyaYXlhBlZb+VCH4YlcNZrpgahFi9H2pdW42?=
 =?iso-8859-2?Q?knD8NtYxFmV5pBgz3Tkp5Xp2wOQMWyH/+BJ+aJ1zNrvqFRdBwSEFD+JlPo?=
 =?iso-8859-2?Q?gbsV/L3QKmeF/lpLysjOq244qokJGATLzYCpP9lQ9X4MLyz9XM/jBhmVzj?=
 =?iso-8859-2?Q?2z7mqT3Jh2iZBlgAw/GpfXFOzdDX0Kl5e/9pZXJAfxRZjD5fQY2GhX9jNg?=
 =?iso-8859-2?Q?TmFJ1uSDsXHswUnjyEdJjhiye8Nh95jwLsv/iulnu/uPDy/jX9giBnVcBX?=
 =?iso-8859-2?Q?pUFEChCkhFuYyIKIU9Yv+/ZRaviMkdaY0D+RRL9kPFB/LpGmVbw16dl/We?=
 =?iso-8859-2?Q?x7z3iY1o3sm+n6hNcn5NxODDv8SVfEpVHCM1m1Qie8RlTB9Yg7USvsmgIX?=
 =?iso-8859-2?Q?22vflRvP5ntTBX7Ajqcb3b52Zc5V12L/lcHJTuG42WrThGVmbURiE5s0IO?=
 =?iso-8859-2?Q?sLhd6o/iCuUz64bEoUMTZyqT4f74vjrJEgE0w5u/dIcbtCH7VDy67L8nnz?=
 =?iso-8859-2?Q?HqENezn2G8n996zUjS18u3rv9ljcu89SyAhGhLOS1dD83jKotcaCq7XK56?=
 =?iso-8859-2?Q?53dHls+9L3ooNv/dQY82j/BHXEMEkCZcpx2TQ1ARq55v/5sERBaUDSuh9a?=
 =?iso-8859-2?Q?gr6mvXLzi0ljhj2I997m3hlkCcXDgl+2fqvp8Jh/fs9cUY4sCIdN2tnceJ?=
 =?iso-8859-2?Q?DMMGLA9g8hq39tbV0H3CNlkqfrrYsRicue4tMnWVi1AEu1v1LvvHelYpvP?=
 =?iso-8859-2?Q?nDIbeNEd0eCszOiu+5BH9MM2GaYACEI2BnnwK3ahtTkmSoF3GRzQ4p2keD?=
 =?iso-8859-2?Q?SNWPkzzzcLtQzRSRy9YqHmqISuDCnKLD3r?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6149e2-9181-4a9d-2ed8-08dcd3e011b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 10:37:30.2284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EOARj+p+gDS+FnpKYR16PlzTzWtsoZ9syneSldSTKXuklz0uenoUFRaQdpTo+gBm7GsN1JN8hBNp1n2lLxn4ky8zu+bkQSH85hMFMOJ5bvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB9408

From: Wojciech Siudy <wojciech.siudy@nokia.com>=0A=
=0A=
For cases when the mux shares reset line with other chips we cannot=0A=
use it when channel selection or deselection times out, because it=0A=
could break them without proper init/probe.=0A=
=0A=
Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>=0A=
---=0A=
 .../devicetree/bindings/i2c/i2c-mux-pca954x.yaml          | 8 ++++++++=0A=
 1 file changed, 8 insertions(+)=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/D=
ocumentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml=0A=
index 9aa0585200c9..872be72da965 100644=0A=
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml=0A=
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml=0A=
@@ -63,6 +63,12 @@ properties:=0A=
       necessary for example, if there are several multiplexers on the bus =
and=0A=
       the devices behind them use same I2C addresses.=0A=
 =0A=
+  i2c-mux-timeout-reset:=0A=
+    type: boolean=0A=
+    description: Sends reset pulse if channel selection or deselection tim=
es=0A=
+      out. Works only if reset GPIO provided. Do not use if other chips sh=
are=0A=
+      the same reset line.=0A=
+=0A=
   idle-state:=0A=
     description: if present, overrides i2c-mux-idle-disconnect=0A=
     $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state=0A=
@@ -146,6 +152,8 @@ examples:=0A=
             interrupt-parent =3D <&ipic>;=0A=
             interrupts =3D <17 IRQ_TYPE_LEVEL_LOW>;=0A=
             interrupt-controller;=0A=
+            i2c-mux-idle-disconnect;=0A=
+            i2c-mux-timeout-reset;=0A=
             #interrupt-cells =3D <2>;=0A=
 =0A=
             i2c@2 {=0A=
-- =0A=
2.34.1=0A=
=0A=

