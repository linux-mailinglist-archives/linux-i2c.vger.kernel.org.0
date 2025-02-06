Return-Path: <linux-i2c+bounces-9319-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50255A2A40A
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 10:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1AD916754A
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 09:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FC2225A5F;
	Thu,  6 Feb 2025 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="W6zmNysa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7F8225A3E;
	Thu,  6 Feb 2025 09:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833591; cv=fail; b=KOmrSPhLkG1uYFPBOdrRhxcri9VbyrDalgN1cw7cWRPa7VwezvHQj0e5Let6Ntz5Crv2cg4JCVFqouNrNdtr14agwgCXRVZiCcxn53latt3gnK/Ubkv3xXZQIYcCEAwarumiD5TXyoKJekYFY2562NQiNf1aQGKqyaVdTPZ2VIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833591; c=relaxed/simple;
	bh=r9NRtGQrmW10TVfPCLwy0VtbjeE2PWIgmYixbAOM9Yw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oia7FFB3lGK3vWOh44RFd9hw9+HjbLJgYZAzfXDfZUg/5WLmn+nO9j5Op+kDfmpM/IxrNODObXOWm0SkizV6sELxhGTJPv7Ags2Nmvf+7fajEqLfE3j64BwTTKpSx8N5V0s5HP2CfRwjG7sdLk5g/J5c5C78rVWx9JSND/vWKNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=W6zmNysa; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5168en3j008449;
	Thu, 6 Feb 2025 04:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=r9NRt
	GQrmW10TVfPCLwy0VtbjeE2PWIgmYixbAOM9Yw=; b=W6zmNysaWVKsPciYTu+kI
	2sE0pZB23zfyghC0yhaqMHjmF2n54maoBB+K9YcF+dgcvfCSbqyh82uzQVX4hJQb
	mX+jd7LLyI4/tB0v1RMHbagGFf35pLFzvTqWiiYlFKTPaFul5SnU9BxcUXDlLFMq
	CXAZAMvcuS73fl3PjIjKHeaS3vVVWW6hcSW1MEzptlCABy2W0jZUcCK/b2qMGRbF
	F4UcTDAJuviSu73lNsNzzGCTRg7/k12d6UUpnNgXT8Qg7oVD3JABM/IqJf4WokVL
	MY8ukzmFZ0kij3smjCPapECTQ3vygof/8Yfv6q3g4qPJ4wNNWYDZ4uaCAJaB6qyP
	w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazlp17010001.outbound.protection.outlook.com [40.93.11.1])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 44mssh82we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 04:05:29 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoINrzxZeeW6U/X87AnTUC3UiAnyzEqgFC8EdgIQs1SXlMYLwAJlyEl3EFoGQJYwIBs7RjLYAv/ZmiglP5QqtIOZOvTCZmykV+UnwObb6T/XF6/xGtutS8SUZ6BoUaeqmY2EnxdUzNbjcHedqH6YikvS2FdgyjpfxNzKhTwfHy0TDzXtwnBk2wN1R0TF6lbXTrU9ZdsPHr4n+J/YSK7b0liAuKdIJMUGtY7DUOPsAHBHeQcHL2uB/6sO/EC9rqbbpczBpQIoVVKdPz375yrnoezXb1KHRv8DIeQHXJaWVbFeNZoXF2ybpGE0gkBfZt5YLZtIEN9Bhu/pYBiTf7pjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9NRtGQrmW10TVfPCLwy0VtbjeE2PWIgmYixbAOM9Yw=;
 b=srKK/WYgmuaI2Mpip80da1vOi7OHsG4cQ10CVfKi3DGuh5UXj7RAof9lzXZSZz6IYGJA8ZhIthdi7WAdEofzH91SxCmWsruTlpSHQw3Vige85a9O4ZQG723hTa0R+57KhqIIzHBkn45Ny8Icy2HfudfOOT0lUmTznOZc5WIVXUKcrGmUFTf4CyC83elMbXtD3UIpXhZGzeX1JfRwYIl6FRFZcxp3XvbhnXNYfuJKHhn1s99D23AA4uTZoJB8LWmEGoAaoWhNevk+jMUgrudOCJY7cIS6/0Pi/Fh5T0Np1jPxDUBSA2sN5dwrAGSf7l8/TkKzNDQKIV2ncOUFQ1QoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 by BN5PR03MB8079.namprd03.prod.outlook.com (2603:10b6:408:2aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 09:05:27 +0000
Received: from PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446]) by PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446%5]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 09:05:27 +0000
From: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter
 Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC
 Chiu <Delphine_CC_Chiu@wiwynn.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: trivial-devices: add lt3074
Thread-Topic: [PATCH 1/2] dt-bindings: trivial-devices: add lt3074
Thread-Index: AQHbbnYvInDA7tfAaEmQRrSmjEJRdrMqQ+CAgA+7WbA=
Date: Thu, 6 Feb 2025 09:05:27 +0000
Message-ID:
 <PH0PR03MB6938B71327DAADC17492A5538EF62@PH0PR03MB6938.namprd03.prod.outlook.com>
References: <20250124-upstream-lt3074-v1-0-7603f346433e@analog.com>
 <20250124-upstream-lt3074-v1-1-7603f346433e@analog.com>
 <20250127-outgoing-ibis-of-respect-028c50@krzk-bin>
In-Reply-To: <20250127-outgoing-ibis-of-respect-028c50@krzk-bin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-ref:
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2VuY2FybmFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy03ZmM2ODhlMy1lNDY5LTExZWYtOTM3Yy0wNGU4?=
 =?us-ascii?Q?Yjk3MDc1MzdcYW1lLXRlc3RcN2ZjNjg4ZTUtZTQ2OS0xMWVmLTkzN2MtMDRl?=
 =?us-ascii?Q?OGI5NzA3NTM3Ym9keS50eHQiIHN6PSIzMDM4IiB0PSIxMzM4MzMwNjMyNDgz?=
 =?us-ascii?Q?NDE1NTYiIGg9InlPZU5OWjBFVVdQN2p0SVJUOGJtTG5UNzFLVT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQU9nQ0FB?=
 =?us-ascii?Q?QTBxaDVDZG5qYkFTazczT00vZzFOU0tUdmM0eitEVTFJRUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQUI0QWdBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBUGdGM0JRQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
 =?us-ascii?Q?UUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQmxBR01BZEFCekFG?=
 =?us-ascii?Q?OEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdrQWRnQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRR?=
 =?us-ascii?Q?QnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURF?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVlRQmtBR2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dC?=
 =?us-ascii?Q?dkFHb0FaUUJqQUhRQWN3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJoQUdR?=
 =?us-ascii?Q?QWFRQmZBSE1BWlFCdUFITUFhUUIwQUdrQWRnQmxBRjhBY0FCeUFHOEFhZ0Js?=
 =?us-ascii?Q?QUdNQWRBQnpBRjhBZEFCcEFHVUFjZ0F4QUFB?=
x-dg-rorf: true
x-dg-refone:
 QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBIi8+PC9tZXRhPg==
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6938:EE_|BN5PR03MB8079:EE_
x-ms-office365-filtering-correlation-id: f8247da1-4fd8-4c80-3306-08dd468d6634
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?BR9+oTrzAr7amsYb7cwaN3NPB94pPbQCmu9oDYQj8uDy9cb9OB6d1Se4w9iz?=
 =?us-ascii?Q?U22xP3G+TsTxGosBgizTMiUboPK46/FI+5vjrULJHnPDJhCWqiB8yfMXCub6?=
 =?us-ascii?Q?+WntWOFbWUQJbbtek5XmEMI3+u1olYHBF1/nT8DY2hMvFegsuqTM/Lb4OSmD?=
 =?us-ascii?Q?uSW3+UucIcgmyCDcAI6DdPLdKRocut3lRpWEAxmEMF4Xm0Ydt3vgQCzSYqD2?=
 =?us-ascii?Q?2r0zU42yzmC4qhO5thiJnvr2b21b1prPz+uLCRW9FoNO2Cyap5QZaomV9Oo+?=
 =?us-ascii?Q?C9eZfRBC828yWuX9MYjCds0jy6vJDKzWKLKGOGGLQyScA8Ou9RNwlw4WHk8N?=
 =?us-ascii?Q?RsEl/5+arsh3+PJBgawKthehb13Q1CTfuH+T1iRkhgalRfV0EZyh2GlXM7LG?=
 =?us-ascii?Q?jGsloghdt+gd80RsbS/bYg+17bqCfk6MRIfmq6k+xuoZ+BbehH/B2foeVr7E?=
 =?us-ascii?Q?AHqSHRZx+7jUMeIGmrS4wAX31vnCsPfz0GRYVBLLIfcjgODTFWXOJd2QfFAu?=
 =?us-ascii?Q?PUNLgM1wGU66KlMWv54an1BqMWOakKsmRnZzMU6QflJHq9TUHzEZtpZFQdzz?=
 =?us-ascii?Q?vwctidV5x7ACCgUudKPyGYe0rVSPY4DBCa9fu2EBvvtPYSFwvpQ7wPatUaMN?=
 =?us-ascii?Q?Fzqbjw9kQtRPznBlg5d2hNJbEadQdliB6zZ+1BWfdrwslj3AiJhuP+c6NWkU?=
 =?us-ascii?Q?qNWBCNXu/IgF6/uEC8pJIoohYxVFewIXAbNDkJWf8fyDFYvA85TeeZHrPDBa?=
 =?us-ascii?Q?X7vR/h0EzglzfyPiSJNNHbMge2bvlh2oP+VXFcROyRV6YlUJRtTv04p6PE6h?=
 =?us-ascii?Q?vCnz5R9K1ivjtVoukOGrjRgVfejw7ryk8r+UQ3LgcJdTToaMhkPJCuHiM6O7?=
 =?us-ascii?Q?9HeX7Iwz2UgpdZnPcCcQIvGgGFXHaFGpSYaWs8LTpUOURfkqFL/pszn5QGn7?=
 =?us-ascii?Q?c8ixZqVsI1etHLhns6DYaC1f6YntWMh4P9AFfZniKgwYSRzUkzWp/ktU8udJ?=
 =?us-ascii?Q?WXD/2nrapw5feEmV8WNQW7FWrR98jnFb5zh6yG+zA3Erj3nVz3EZlWzRuVXr?=
 =?us-ascii?Q?LMadF1hCxSZSHqs20Oa8UJYCWmstKZPoXWyTpATV0fY37Uy7S/EHosqLXzJ2?=
 =?us-ascii?Q?K12TEJMeV6zcnqWi4BC0yC8dbLlBy43GgpTv3HA5bX76hzHgdNrwOE1W6b05?=
 =?us-ascii?Q?EA921PeZ3aciJL3JQb6ZSzlm+M3XnfSDjm/dX9fLTnPMPkcdgmclXw8LccKr?=
 =?us-ascii?Q?kvwGU6Eta3MShgLDqZeRjDWE5ZfixWNHcPQSwuJvATX7yBGAg64HrzlI9naK?=
 =?us-ascii?Q?Fmi+KVmXmoDVN0b6wZxjr0eJFU3o7mjmuA4w+SQ3NvixmnliB4A+0eNIdUzj?=
 =?us-ascii?Q?8Tg8ipOs+PM+YECe1zNE/QtAfR+iF9ZFwZGHIy0hrDBBORbwDJFiMrkYiO1I?=
 =?us-ascii?Q?mRtDcH+dmGcfhCHQUS4cbvwp/wBE6B/E?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6938.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qk1f/E6PFY8dxuDR6/NYBYWXSw4HznaU7aqs+Ug5zejY2vTb7IIQu2lqclqP?=
 =?us-ascii?Q?wf//Hq25A99JSiZzktbDndVyfG89u0kF/et+5V/6xX0B21vb+Pg3QcOeo+ha?=
 =?us-ascii?Q?HYulm/vbsc+SoKy9JypIEWO+3d5mBfqbD7G+2h5bVLAw+SZ7CX05ePkK0v/U?=
 =?us-ascii?Q?AeG0ynnk1NKt7xb9iHAGA0nV3tLNjDy0wgvU2UY/ja2kIvHsK6H5Ts7tdVXP?=
 =?us-ascii?Q?nSL6fckVPWq26AwX7Bm7+XEEIz1p0nnQFlRAsF2hFeF5ASKFDWpzQhUiZ6lq?=
 =?us-ascii?Q?zk3GEqm1cRAl0LWvLfbtaITg4Kju4rCkM6Q8CtClGlix0weqC44fzN49a/px?=
 =?us-ascii?Q?K17bvMOYL9MyGOznN5n1yr8OVwJFPVH1QYfB9O2qpgLOtmPpYiRIxDs4DDb1?=
 =?us-ascii?Q?LnytuT1JtyNetH4Xtw8SToM/s0F8dfzIwrknssdnbxqF0P/clewBmViScjd+?=
 =?us-ascii?Q?PVQaOdH+RmZwBxxCt8jtH+bKB7m/f4zZyMQ6dEFkFyIj+tKsnAbVYgWDf1Ei?=
 =?us-ascii?Q?Pd2i/vDxy/JgB9siC/2kYBubjf2sJu3+naIlT9kNXVBE5GPHgxWKobI+6q3i?=
 =?us-ascii?Q?/6/nvFL7C+bJcVgOtBBzLp7e3+ZBhv1Rm7x/jULXSGeeBAKvtdGM9d0gIfXP?=
 =?us-ascii?Q?BemgW2FsFYWZ425XmjfPWeIipofoIrECVdAC3RYaCVzl0+DE2t4EpeMdSpfr?=
 =?us-ascii?Q?YykNmNMP4vULui2691sP69vFz20GYNB5iM/kvO46yUMpmDkDiVhpOx78oF+f?=
 =?us-ascii?Q?O8BC0fd5DsegJlpe3kTjVKXP0hLGsLteDu/5sybUynlX2sfr0v2sDW0K31S6?=
 =?us-ascii?Q?wESLh/xx/1KikMLYDPqAtuWSmk3DiWTfy+HEBc7oaWFxYWK9YkiJXc3vvbBZ?=
 =?us-ascii?Q?CzWBv+JhKpFdJi/tq4XFZ3r9+Fi0yzQhWmexcZ3uEJe3dUYHnE6HTbnmGSoJ?=
 =?us-ascii?Q?05fdRCh8hHX5hbtdxDzXuoCUuNl8uZryzOb+pGanDkzjcspDzknv/6chZinL?=
 =?us-ascii?Q?eeaCoXFqEF9YIs/G3Q9flWlDnFyzmvGspK8l9An+I1XttrBip68uAgDUT+dF?=
 =?us-ascii?Q?k3mb9ec1lchaLD13Po4iS1mjRWZAJWk7o39u1Jkb7buPt+P48KWbe/FiQRsu?=
 =?us-ascii?Q?f6CxP6y2vpScxNlCgeR3vmJOW4jetP3birDWB6wL3lyT1TnFLbXW9UVlGnhl?=
 =?us-ascii?Q?cI2pIFozCqd5xHlmqF3pikLh/xNhx5ZdWWDIi7iGCGaJvTfYTi8aY8qg7DVU?=
 =?us-ascii?Q?qFepS8Yt/kfUYom6wuY6zRx6X8Aku3Rpdfw3HlsemWgI/y8TzmPY2/YvglXx?=
 =?us-ascii?Q?CGKmGyJjyWBri3GwWcymAnPfb+XqXfx065/0UGHAU1HdIYK9We7tfHvh66Jw?=
 =?us-ascii?Q?6SVcADXiLp6uck7p4Cx+o76k1b7SpXS8JSAwxC5zvK2x/9sIhM7gMCfDo9tZ?=
 =?us-ascii?Q?Im3u6BOVpVhJiXTkrbMVFNJl0YETCNft9AXxZMB5tcchgHJmJHqzRa/8AObP?=
 =?us-ascii?Q?lCEmy72vuq/ZO6ji6ENo9Edzm9fsOkUhOB3kfUhy9vmV1ARMKOjQ7aize6QS?=
 =?us-ascii?Q?EcjkNT2gjkCSG+b9fYeTylwIay0SQKhcmMfYX6x7gNW3C9TysVxRGkdn6qJI?=
 =?us-ascii?Q?YBqrj8O/4oQTfQhrluUxmnc=3D?=
Content-Type: text/plain; charset="us-ascii"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f8247da1-4fd8-4c80-3306-08dd468d6634
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 09:05:27.5065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EdFi79Jr3MK6x08cRHoPfuxytaDEoIcZjK9NR8wKMWsHvoqTN1vjBtcJgQ9YglzJjv1ZETY4s/D4TIqlqpR2mo629vfV2A2B3ILD9qPTSnIrr0d5WILN/3B8ZdTG/Kx3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR03MB8079
X-Proofpoint-ORIG-GUID: e6wZpdTG_9PUAgKozBYn5r-Me_pqT6lW
X-Authority-Analysis: v=2.4 cv=SdcNduRu c=1 sm=1 tr=0 ts=67a47b5a cx=c_pps a=EAKrnwHpvcqzj31csKCFmw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=T2h4t0Lz3GQA:10 a=udXclQch7WkA:10
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=iox4zFpeAAAA:8 a=_jlGtV7tAAAA:8 a=07d9gI8wAAAA:8 a=cPYzWk29AAAA:8 a=OsOaOoTI0JQnbyvEblgA:9 a=CjuIK1q_8ugA:10 a=oVHKYsEdi7-vN-J5QA_j:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=nlm17XC03S6CtCLSeiRr:22 a=e2CUPOnPG4QKp8I52DXD:22
 a=oSR2DF9YFqZEN4IGatwP:22
X-Proofpoint-GUID: e6wZpdTG_9PUAgKozBYn5r-Me_pqT6lW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_02,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502060074

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Monday, January 27, 2025 3:52 PM
> To: Encarnacion, Cedric justine <Cedricjustine.Encarnacion@analog.com>
> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.or=
g>;
> Conor Dooley <conor+dt@kernel.org>; Jean Delvare <jdelvare@suse.com>;
> Guenter Roeck <linux@roeck-us.net>; Jonathan Corbet <corbet@lwn.net>;
> Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> hwmon@vger.kernel.org; linux-doc@vger.kernel.org; linux-i2c@vger.kernel.o=
rg
> Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: add lt3074
>=20
> [External]
>=20
> On Fri, Jan 24, 2025 at 11:39:06PM +0800, Cedric Encarnacion wrote:
> > Add Analog Devices LT3074 Ultralow Noise, High PSRR Dropout Linear
> > Regulator.
>=20
> Regulator? Then why is it trivial? No enable-gpios? No I2C interface?
>=20
> Best regards,
> Krzysztof

I based this driver primarily on the LT7182S dual-channel silent switcher
regulator. The LT3074 is a single-channel device with basic enable and
power-good GPIOs, fewer registers, and fewer functionalities than the
LT7182S. Like other PMBus drivers, its GPIOs are not exposed.

Here are other PMBus regulators/power modules found in trivial-devices
I also used as reference:

- infineon,irps5401
- delta,q54sj108a2

Best regards,
Cedric

