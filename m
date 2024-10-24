Return-Path: <linux-i2c+bounces-7529-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1009AE066
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFB261F2216D
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA9A1AC8B9;
	Thu, 24 Oct 2024 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="Vcm/ba10"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349DFA932;
	Thu, 24 Oct 2024 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729761495; cv=fail; b=Rb2t6rsloiNjlC0A2OLxS/sSf3qL/G2OVc/7dm3uirvajnJ6CbFkQIeOJxr1TXEIKk16oWatUU4fWDl+a5I/esHG8OdYntKZbukC7XSA231yBX9+kTUuLJbOzQh7Cr9oF5Pdii9hiyKZQbaOtnG6nix6DT+WTREbAb39hCd9qUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729761495; c=relaxed/simple;
	bh=d49OjI1BzCbSTXG4uFvFAOczdWGcdBhC3x444jtEo2s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qm2tARwN42ru62ug/2i+HAnsAPmXdcYjI5wO+xm+V2phiPxZIt+pPXh+0xnMqwSsgQjKe9z+uVv0INInigL9vifgP9iYIXSIPkV4dDbxqD6vRTi17Vq6pAjCknEoZyoxRt38Wf6u5ZyVPu+tvyDb/dRVXtu4Iw5UPvjZ6FPUwrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=Vcm/ba10; arc=fail smtp.client-ip=40.107.21.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdcDsFuQwVuMpVMOoI96V52rtaqcFQuN91J144owNOJQgw0O8NzgntTsFx/YMBgHnxYyYxW+RViQW2CgAQxwTLDuIrlmIihCSYBF+SV5PJJwRAVLRqfytAwumWmov9Or9AOqKMCS7HS47z8duXXAQrj6gQfr9DBWGXihX5y8z0fPF4ALSvAJ83m7A76e/stftlvpnYDwOtAoz+aKHdwzp4KHttRe+zQ/FAMA1t3BDOrLg3UHN4T7IG7ly+Dxuo0mlSdmwJ5tzCu3ETBeuOD8PQJ6ddh8VK6wqS2UjSdqSEvypf0fbvl5BuC7Vxb/e+26yfvhq52nW23Bk1/kax2WgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWWfn+K8HrKNUocwr35yy052KRUhPm+osw8n0Q7daZ4=;
 b=t/CXHhHT/UUMEGo2dDMtsPI/WYS8QsQE6KOBSLrodCaxeqVRV0suifMA4PVLttUXIT85wvVSYpRvfPqopWRdCKKeJgmpMBuQcJLShmSE/aLOiuSa8cjoQO3VEB+yg2cI9EEy4CkiRDUyz7kR0nif/FFPYXtXPLmSi3ZRHAzcIlxTmIYQMZJo6ogZh6wKXAuEltLi8wRqtdsIbzwNu4dWC/dzpER7Bh31KavzZKDP344WETVeOn36WvYE4jcsOG/dxBS77fjCiwnAFZshMSVlmKQujG9bF2pLZzEwVCk5vHYRAbVczjfnk746Z0wEVJDbQpO4dsX4xotsbkvr9LFNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWWfn+K8HrKNUocwr35yy052KRUhPm+osw8n0Q7daZ4=;
 b=Vcm/ba10i3C0Aae40ftTvzk58TnuFJM5bzwIZf/rTbZg7JGg+tJptJ9J5RF2/Cu19X82KiYllsHbRwrQPnms9+fZdqlF0qFyjXTkVFUU9X1NJoZcJtXDe0oz/WDA3wyYgRhX6tzNNuMblKTOXe904o2qGRFmPfwBqN4pSehZEGMVHPDkAoflwFhx3U5okTRp/62k/AGYegJKQubWLOtLQXakawMN9uxj4lm9W1Z74jMPQDXtsFGNaHCgSW5SNwuQhwcNuC64hqJsFRRzBC6A5M0xk3rA96hY6rAkb6trx6qNX2e5/fEdX9tjbiMTMKM+CMq6HS7pk2B/hg/wfNM0yw==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 PR3PR07MB6921.eurprd07.prod.outlook.com (2603:10a6:102:7b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.18; Thu, 24 Oct 2024 09:18:08 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%4]) with mapi id 15.20.8069.016; Thu, 24 Oct 2024
 09:18:08 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "peda@axentia.se" <peda@axentia.se>
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: pca954x: Add timeout reset
 property
Thread-Topic: [PATCH v5 1/2] dt-bindings: i2c: pca954x: Add timeout reset
 property
Thread-Index: AQHbJfWjzt742AQ7LkSiP80g2IfYGQ==
Date: Thu, 24 Oct 2024 09:18:08 +0000
Message-ID:
 <DB6PR07MB3509F0612D61254728D49D279D4E2@DB6PR07MB3509.eurprd07.prod.outlook.com>
References: <20241018100338.19420-1-wojciech.siudy@nokia.com>
 <20241018100338.19420-2-wojciech.siudy@nokia.com>
 <20241018135314.GA91900-robh@kernel.org>
 <DB6PR07MB35091425FE5CBCD782B465A69D412@DB6PR07MB3509.eurprd07.prod.outlook.com>
 <pkse4jc6muqwo4zrvb6auhcdv4zrt6zd5zmp4yea5usagw62o3@lgzwggtz4uv3>
 <DB6PR07MB350922B1A1458EE3D7EB3F019D4E2@DB6PR07MB3509.eurprd07.prod.outlook.com>
 <655e9afc-cfe9-4b52-8308-7ffe1011e6d5@kernel.org>
In-Reply-To: <655e9afc-cfe9-4b52-8308-7ffe1011e6d5@kernel.org>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|PR3PR07MB6921:EE_
x-ms-office365-filtering-correlation-id: fb18389d-3ce6-47fb-3ac7-08dcf40cc625
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?aTfU6LgcMWxanY+m3dzwj63D/mV07+vN+lPcAIYyYaq3IN0xy1Hgv3tuze?=
 =?iso-8859-2?Q?2THGRnxCXBJ21KGZwYYbYWS3FpX9jnBi9SBqBlVaGlWpL5Qc60RKgfYcqr?=
 =?iso-8859-2?Q?LwxHKgd1c+9ogq0upPGY9+kOm3BsfJIAII58pLS8c+nbOW4clm728fZm1Z?=
 =?iso-8859-2?Q?PTdK+vKKWcCHmfKbG5HwI3Uq35VHApV6xzprP57to6gcMSjWiBF/5Nx6Pv?=
 =?iso-8859-2?Q?rFtOg1GF0J4sfNVGYujZ39SuAB2U0zY9ClR0vMTg+kdogy6HZOM2WtpG6S?=
 =?iso-8859-2?Q?z+ohconQmhkX2n1OS67Pa3clA7QVU0Te/2653DOU9Fep9+L1RpeCsQFGdJ?=
 =?iso-8859-2?Q?fuRZbkP6AAfoA1HI6500TqdG6Gblc7UsXQ6QwVxPRwPAiGTBvShA5C5Fi1?=
 =?iso-8859-2?Q?UzetfnOCpBT0x0KC2FqaUosMsI6/xTimR7t8zbcczsU82ef6W0jkBkvXv+?=
 =?iso-8859-2?Q?MLxKAE/SkeI8EhkZSUeyOZzNaLG11s1Z6xyf+cWjXGtwYaTdpDSUyL4dDk?=
 =?iso-8859-2?Q?Mrf3NRDRd6grcoBRKdXv0iBseuswWy2MSNUanC4SFmLIjwE9JORNj5XgMD?=
 =?iso-8859-2?Q?GNa136MbGbi25kHN5pddIukN/fp8hW5sqsmNbN/0quvRDmlgfkW1/d8fpU?=
 =?iso-8859-2?Q?yuP4U3iQVjmtPG660wxDdgAbDAUAbgY5Uk8UbAKOJAgM/txqNR6WkcQIpM?=
 =?iso-8859-2?Q?Fvnx5eSmU51s4R+Dq8ITDPHTo1CN/iImNdIRVPx+jeVvp3JqU3mgcctwEG?=
 =?iso-8859-2?Q?JAhAdANEh3ochkLfvnMhDwIOsw+1A+ScEywQsVqfKRfSEI0KoygnHRe27K?=
 =?iso-8859-2?Q?oYZGPUF5zg9dtP8Iz+xjrBLI0Lrxy66fna4O9lz/RkSfVwYlloF/1wnjtj?=
 =?iso-8859-2?Q?cs5vVHVV5hzN9cAJgD0CsEN+DKv/o3+OSn4YeDv98OQS27rxkFl5tg6q/8?=
 =?iso-8859-2?Q?kXkdPG5eErghKDqTqQNhEtQ6ivDAJWMkAtRg7CIUr9WB+P2o7WPyRihOpC?=
 =?iso-8859-2?Q?hNDRNGrCue/SlODucPDjOBrz4YvUNVKvLoiBTXbXPZkvUBxxPdhhK8HiTZ?=
 =?iso-8859-2?Q?7Qx5TRelN33Tct5fUXm1/5uabm5xlU73lrYIYN1xZMZVyQynRBe1fjrVAA?=
 =?iso-8859-2?Q?phgJai0ROYkYhtTz2/GgEw//zvvuqpbHFNeDCc8B7emopWxZnIPwoOHF4L?=
 =?iso-8859-2?Q?3+Us8sJ4Ch3puKlqeSu8P2W+S2XgCNgv40qy+s+gnlt0EZSPJ82wotSMFq?=
 =?iso-8859-2?Q?BX5TbDAN/usK6bzd3Ddc+rE5oGLAVC22HejZWn8GkK2rIxG0XRIRiJGokb?=
 =?iso-8859-2?Q?afvTa2nQP37bm0LmAwLg0a9ReVyuoxP//cJRi+yVAT2lx4TzqtlA45VXfi?=
 =?iso-8859-2?Q?tkZHmQmdC8c8rH8bFLHWhNc+NvZ10TQn4aEQlEU7shvm4Y4xim3AM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?Q3PVKR24A9tePzqYIGUmRJjDUwltf8ChR89dMvYRoZt3NuWrtwyvrmimtY?=
 =?iso-8859-2?Q?8npXH+akUt3xIypsjtG6d2Q8IA+RFLOg7dn3YVup/OYFcySvpYRID6A9xD?=
 =?iso-8859-2?Q?E4wCpzLADfKtiz+Awtbpqqowp2zkTIIYlvXCSaBhwDahF8E5dS3bvdxm/K?=
 =?iso-8859-2?Q?BR8ZcsZbHyx7+grCFQM+VTDnqcEHJhP0ZQmgoU4y27Bxr4JgcZIBE0RjWX?=
 =?iso-8859-2?Q?LRhPZsZmQ1dXkc3QJmIzw98/dvH7/2BywiygHEQy6NSOHdDniRJojflckV?=
 =?iso-8859-2?Q?r9VtmzqsM90udjoVl/TIsLRqNvcnYzGzJSH/vIEe0JKHn8NQnQ8RGImt5V?=
 =?iso-8859-2?Q?ab8tN2Vb1j/BJiDclSi6JGtzo/86lsVOLz26+p6pIZAVPZLa8lHDZuRuyx?=
 =?iso-8859-2?Q?TzcGEA+T8MBiMG3qFVyITR/y8U74wlVh/n484hCydZw6Ru1nIoGHsif9HC?=
 =?iso-8859-2?Q?M5uzbusBY6yOa6/e8C4P3TGi7EgRSaEB95nz6utSW41DifF6542WuSlUEB?=
 =?iso-8859-2?Q?tR/ZCvqecAecFAzsb8kCCZl9aMP9m0CWRdi2XpYS/dRx5Z5k39IA+tk403?=
 =?iso-8859-2?Q?fLjuFrswmnwOUveNgP48/kJTKGq8ZVVcMMPh6Inv+E/Yy2MeaVc3gegpWi?=
 =?iso-8859-2?Q?KpAb7sjYdRzl6Eng+nxrY0WBFpWQSf/PqDDs222a9RRMPJxmpfRXa9FY5d?=
 =?iso-8859-2?Q?dlXjs+aJGSTFSIQwWGcR6DfMR+5qrqWnkd7LY6QmXlZnBlQfjaOQspswC4?=
 =?iso-8859-2?Q?Jqx6u+NRGrrlNiPZ7a8s2RLeX0JwyVCyntWtsHr3s1pl/ID8T6XbMC88qf?=
 =?iso-8859-2?Q?aUuYvk+g0yWNbUG4pGIT8Burkz5wyot32+czMVpzoECPYmQ91m2adMAFYw?=
 =?iso-8859-2?Q?zAFW/IzEZWqHn5tLlZmURXBATbDlEgAkDeaWmZ4nQkCaAGuz7m464mSjfX?=
 =?iso-8859-2?Q?SC1C3We0B05r0e4+Xw1ZXscmxbHIWsExqGMRsdA/KSZbewDn08RynNch65?=
 =?iso-8859-2?Q?JRRo0pcidHN2le+9+BMBB297CGDIYj7hSAQI0dbkPMGZeigaTBkDpllwO+?=
 =?iso-8859-2?Q?cSofHJVwRdeKg/RWNLImGCXXJThavRKtloRCzf4Z3U2vKPWxUFVHEDJYbg?=
 =?iso-8859-2?Q?/9wZW8Np7gve4X9dg5vwpGVcty3fuzSqApUJQJBABNDUH1WX0z2x+NCWpX?=
 =?iso-8859-2?Q?j4CAFg3CSQC8kHGRDWb9T4ETnHfKe6FkPBUbs+GHU9O+JLeGqN6AJfabTa?=
 =?iso-8859-2?Q?3wlSVS+4VqX/p8CSN8tc+mAfNZNO5qqwgUfVT7vxqbEnA0MgxtUubZfXKJ?=
 =?iso-8859-2?Q?Z7xyDOqrrIgBVDbu597+DB5Fk+3FiGGp/YTwp3Dg4umR/Mx4ydGhlz+k8y?=
 =?iso-8859-2?Q?xoPtGUA7Lx00mHxux2ViQkO7MgnQu715KgpRPaj09IhRfmyhskY0t3hbUj?=
 =?iso-8859-2?Q?WocH3u2oB1ZSLWYcB5wHisRLFk5TLsJgoB+zBbQ6D9pIsNLK/1diW0XQie?=
 =?iso-8859-2?Q?E1Zoc0OOObxMkXWarO9org0geFoQn/jRI0N9OyIsq26WO/Gz9keEcl0mAb?=
 =?iso-8859-2?Q?FKPxRBfneGTtTg+7JKWD09HIXJYjf8MKQKAlftBXS+F3V6T6t+Yw8iodb0?=
 =?iso-8859-2?Q?mbW9hjVAcDju88WJcO6bCLrk1KYbiFAPAz?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fb18389d-3ce6-47fb-3ac7-08dcf40cc625
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 09:18:08.0804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wjkC5dVM0D7thOytTQd6fPLdcfJMssXDL8rY/92Ughv3ywKndQsSGnmpIHMbVtMxuzkQcqN7vp2xnGPhuXatS+wlm3oJ4qbyibC9GgSawdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6921

> I suspect you are adding reset for some other device, not for the one her=
e.=0A=
No, I reset pac954x chip in pca954x driver.=0A=
=0A=
>  I suspect you place property in inappropriate binding=0A=
Many boards provide reset-gpio for this very device, but it was=0A=
used only to deassert the reset during initialization, so shared=0A=
gpio line was not a problem until now. New binding is to=0A=
reset later in runtime if necessary only if explicitly specified.=0A=
=0A=
Best regards,=0A=
Wojciech=0A=

