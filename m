Return-Path: <linux-i2c+bounces-2468-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F47885A84
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 15:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4A5A2816D4
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 14:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675728526C;
	Thu, 21 Mar 2024 14:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="YOlQBiRK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CDE84A50;
	Thu, 21 Mar 2024 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711030693; cv=fail; b=LLMJlc05+ABBRgyZcJrC024Y1p87tpaI2Q6rsgMKKbr76xNL0woIIrnxo7ICmHYI/dPtZSNP82IE/k7phvEOGcsMyOnrR7+WK2vtDkQkwHIBJpu37+SQnhqgQdXaVGId+s/XipY2XzPkL787KcLwAc6PNSt/iLYkb5iAO3jJ7vE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711030693; c=relaxed/simple;
	bh=lEMF2KYWoysD1rT/Hq/e6avj6X1hRgqzH61tISoTp7w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CHWgm9X2TzDtzSov4uEOl8F7ZRxssFd9H0gU0hWw4t5y2WhaQ98+DOvSl8lARGQZSiE682/XgqlHWhtjjNVnOtOWXKqIvTscy6GeVHV9gUniXR0dUsCWtAgFNAS75uTtXKI+kaRXAhGBPVYzuQ1JyiCzWZxGCWjtY683Mzvc2ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=YOlQBiRK; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LDIgiI012502;
	Thu, 21 Mar 2024 10:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=DKIM;
	 bh=CVe4YtBIm4QZ7uqcs19/XZpRyVMUGyMUa1lsXuoIEVI=; b=YOlQBiRKTdvP
	QCfugiyemI9g7MqaKsFkW3MTDQt5Sewt2tJQc1jbLtvpXNeNRTx1Y1I3izWzI5AK
	4Yq3Gv7I19ppVtOT2Oe1ZGfD7gd8HtwnHKSjm2WVlY3uG4tzmAptER4JRlCI3VSv
	8/trSa2KWS7g4byBol+AJeLC1O1lLx1RtuTQ4fy+Za6bcfIg8BvBP81xjCH8Y9TQ
	f3o7NZgUkdh1BfUzTj1HZCAb10BQ/w57Ybn2mPqqDF+8aQ3tuKzPPMEZp0EooOH4
	bAIILP3PMnvqerwFtC7cjRdvRIueqFhPMwj+yyEjOczolrccfV3eULhhbgc5fKbf
	eGEK93TjkQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3wwr8njw6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 10:17:42 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6uLtxO8rXRuXf0PVu18zDamAd27ro9RhND7KbhCCbUqyhyn73l4KYY7pVfzy56yHSJOpeNDJHvh4uqf9vCGpCSUnPkGtS7eM3lvhFWM622dmi9Hw+8LWahkybXqbgzLISdkRd6pXU5sB8shp1nr3uLbzIgVjEU9ku8s0tf/UrxbX/rsVT8K29H+P6OkmHNcDFXdYeODWa5mcsZJ95KhA8n2cj1voS3+rqZGb/0z34kgcL4vUKx4/igGWXHuOvMbeolUwLFJWD2rjPdWwcqWC84OmvgOtiglzwAxSzm8QQRVJNvXxORrldU+wbN4rYBp2zkPr3TZwGC2WLEJq2YMnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVe4YtBIm4QZ7uqcs19/XZpRyVMUGyMUa1lsXuoIEVI=;
 b=mUZgKEZ0wFmkP/9DGym2jHf8WwvP0DxIuYIP/kDrTw2kHdtMp4DTqAuoQLt+haP9C/PA8cjXSzjxL7nH97TqU4vmQ4XQGpDsb2l8i5TXqh1tuKfrE/kSGQybxioGw98zVm6NU/77NBR3Nke6S2bfOwQfVL4JJL6wTHs8gXvXhq26nOhmuN3tAQNmVV0CnukOOJdGadT6oMiIfRt14eeZ1rnbaSXcUwadrus5OCnv0qYvq6AwxR4poqna9+bsUpaOobL2W3sCl1rIo1uRBeIn6hDU9vyO6EFON5/+2vpWsMllO265J4Ay4B+FVrNhWyuV5MuBXlBNFegqp9R4UDQblA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SA1PR03MB6499.namprd03.prod.outlook.com (2603:10b6:806:1c6::8)
 by PH0PR03MB6979.namprd03.prod.outlook.com (2603:10b6:510:169::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 21 Mar
 2024 14:17:21 +0000
Received: from SA1PR03MB6499.namprd03.prod.outlook.com
 ([fe80::44:7752:4ad:9382]) by SA1PR03MB6499.namprd03.prod.outlook.com
 ([fe80::44:7752:4ad:9382%4]) with mapi id 15.20.7386.031; Thu, 21 Mar 2024
 14:17:21 +0000
From: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>
To: Rob Herring <robh@kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@wiwynn.com>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: adp1050: add bindings
Thread-Topic: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: adp1050: add bindings
Thread-Index: AQHaesZY8/L4JyPv/0i6z0YwzuVy6rFCOqiAgAAC9VA=
Date: Thu, 21 Mar 2024 14:17:21 +0000
Message-ID: 
 <SA1PR03MB6499E2601776F43AA42BFB72F7322@SA1PR03MB6499.namprd03.prod.outlook.com>
References: <20240320125727.5615-1-radu.sabau@analog.com>
 <20240321140017.GA1644231-robh@kernel.org>
In-Reply-To: <20240321140017.GA1644231-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccnNhYnUyXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctYjdhNTAwMWQtZTc4ZC0xMWVlLWE1YTItOGMwNGJh?=
 =?us-ascii?Q?ODVkZjE2XGFtZS10ZXN0XGI3YTUwMDFmLWU3OGQtMTFlZS1hNWEyLThjMDRi?=
 =?us-ascii?Q?YTg1ZGYxNmJvZHkudHh0IiBzej0iNTk4NCIgdD0iMTMzNTU1MDQyMzYyNzE4?=
 =?us-ascii?Q?ODczIiBoPSJKRWF1eFRRK2x0cHUvU3VBNk9oM1BxeDJVVWM9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFFb0NBQUNa?=
 =?us-ascii?Q?K3YxNW1udmFBUU9uV1JwNnpCVDVBNmRaR25yTUZQa0RBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBSEFBQUFEYUFRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBUUFCQUFBQWxHVEdWZ0FBQUFBQUFBQUFBQUFBQUo0QUFBQmhBR1FBYVFC?=
 =?us-ascii?Q?ZkFITUFaUUJqQUhVQWNnQmxBRjhBY0FCeUFHOEFhZ0JsQUdNQWRBQnpBRjhB?=
 =?us-ascii?Q?WmdCaEFHd0Fjd0JsQUY4QVpnQnZBSE1BYVFCMEFHa0FkZ0JsQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFF?=
 =?us-ascii?Q?QUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdFQVpBQnBBRjhBY3dCbEFHTUFkUUJ5?=
 =?us-ascii?Q?QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3QjBBR2tBWlFCeUFERUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFB?=
 =?us-ascii?Q?QUFDZUFBQUFZUUJrQUdrQVh3QnpBR1VBWXdCMUFISUFaUUJmQUhBQWNnQnZB?=
 =?us-ascii?Q?R29BWlFCakFIUUFjd0JmQUhRQWFRQmxBSElBTWdBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBQT09Ii8+PC9tZXRh?=
 =?us-ascii?Q?Pg=3D=3D?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR03MB6499:EE_|PH0PR03MB6979:EE_
x-ms-office365-filtering-correlation-id: 0403c825-a018-4646-af35-08dc49b19f6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BkDl0OH39cVO62Dd3sNek7rFMhfylNxTzGl4pIFK0QwIiKx2hH7Rn+eHsn/FCLXE6+QbmSgZri576V8udD52LynStbDe8fzaL6A+zEgEf/pj4xSR+/JqPXNO8FNIR0xMVvotnse8EKZveQG1HNfMgeqpP5rQPz1rPAWPzYhaJnSfWOXvba9EZqHRYfq0ey1krsmIz2avrcCrxP8bWJ0DgR48ZgZOPreQYrH7LxY2bC5s6dmrmdqrP3lyrHUBEkblh2Jd4R7HjWsn4pzgVCrUmjeZ9o5/VGTD1xMb+9NeMwgpqOS/TknY12Y0syk/gTTN1Bwkhg2w4zTxZfIHk6UTglqVztqvUWSBGMkMB6h68F4+WiftO/tvWsgDl8/z8h7B2MMM6T/+9Ib10hXDdpNCFWCsZ4xl11n5brIMhUC+0HQS9GAEbsgEra3//gEOhcG38gTN79WDKGknAhK0++hleDYV3Mx4PA/gfHMgbUtaCCvxUYopo7GRur3QyzZKzd/Ss/aHBUvnNYP/Vx+Rl9t7sOMtN2oWovgmne/JZTlAL7GeuaqaX4C8I0R3eCsc07jkV62pjpX+5uy+OFywtX1N8zq6pZ7B8VBMmLRiIbObAkrcZMaCPQgSFaQ7I6UCL2v6llG7JecjE74pBIME6yWA7T1JpX3c/nxzlbOJaFuKsPs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR03MB6499.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WX5nLTDPuDUiNfRLDt/7ycIkpAMbWOm19B/vQNjR2rEls/LSeTeWZM1zvchu?=
 =?us-ascii?Q?X4N57z86GzqMV4qEdCSxGD7jH0PlCfrJlDJdM4KoigFx4oU50EGVkkpwgyMs?=
 =?us-ascii?Q?s9Eg36AWUeDocClUu9uBLsAMrItfw7J3K0nDJTkvTXk69p4nB/tdbDYK7ALd?=
 =?us-ascii?Q?ZU853qC6epDB7+fVXex8EvkKenzjdCReEi7rU2A0LjA0SyWPUzyeIB/fa98t?=
 =?us-ascii?Q?7GTwHn+1n7iwr8wa7vq7aD1gZtx7QzzKUJsoi9NzPy8XNQd9QNjQrvpR/9pz?=
 =?us-ascii?Q?+MsdzJVMsq5gQUQ9P35ZjM15UmVlTPj4c7EnkYoATocaBtcuSitpZFcspsXj?=
 =?us-ascii?Q?Y1OqHgmOKEz+wZeEwTo3i+CCZuajareWzn7CoyYV/yE6VuwldWi5Ok6/WkX1?=
 =?us-ascii?Q?7N7WeYJ/Q9fLZ78dfMWbZ1DUWGq+qwGbpjpf/99kJ2TGHtWLwZOgpl76J8Mn?=
 =?us-ascii?Q?t10LO6x7Ph2IOuNXe5hMfnTz5XUhuU4gslYLBQZn+fKZgWpsFkLhW7kLsHs1?=
 =?us-ascii?Q?o8KP3HfIqqJ2PTTcP51XUtxcBnzweXx+SPbakH75Pa1UodvV9y9GiZzCxcbT?=
 =?us-ascii?Q?EJw8KZt6z8BAV2BypqpRxZxhtb2+QB7wbv2KcoaCAK4zmNARi1EIgGrdSln2?=
 =?us-ascii?Q?XPpvhHvW46GbnVzmQbMX7Mi0+KC49oK8Gss3OIAx+KyYkw8/hpp6JObFz7+E?=
 =?us-ascii?Q?pnhKZ0TAAUlUt5H4vBINPRiiB/YH1ctnYdxvR80Ue3NnNrIOJUpP31Gs5jE+?=
 =?us-ascii?Q?96vZqzKmAyTqB7So2nhamD/udkN3U4GMA5Rll/DCNMDj/IYF+Z7vDAmupEZw?=
 =?us-ascii?Q?dvZl2AeNFM6lD+rVqlcDsVEOnuR2fdNearlkkc0v7npkuCHj8cMTc5YBQ8Pw?=
 =?us-ascii?Q?mWMUvyhUKCE1AGQSxFspCvIxEiA/0zg6tmOkUP/7RBjU1bEVaZm5FAACuNnq?=
 =?us-ascii?Q?yoiBuglDFgLGFJAykvCeDPpvhwUATTDRMLfgHuySPy5rQGZEZDKBP67T/heb?=
 =?us-ascii?Q?DqNfuILkSUCR/X8LlfcHWAvmOY7m7he9zmMjg1O6N7xl0YWZFFfJ6jYkJJ2K?=
 =?us-ascii?Q?g5qa8BFp7RPg5+7lGe0bPz7atso6eZU9R5mjY/oD5VBRCEGRpg1fVZmbBhMn?=
 =?us-ascii?Q?/eHllSSpW3yxStzx9MRK9sCwmS6aE6BAf3HRU1IKY9Vpr3KpMLQObUUBdDdH?=
 =?us-ascii?Q?IAJxGRJa86DHsDGcb+rO/uMOsGE5Qf19337wIXX83HVqQ4Jdk2kkWURq9x3D?=
 =?us-ascii?Q?C7MrhRj24RtK/A3EXdn+mnQ5u0sy0fVbcBqQOeQx2ce1xKfbPAbcZ5+gsu7U?=
 =?us-ascii?Q?LShGeg/KGRX2QaME+gJmcyF42EueHu22kVaxbYIerfqqOjTdUR2IjuFvmZA+?=
 =?us-ascii?Q?eMv5RmRKg8lKBRLxo/9kXYtQ4yRUSqTwFbSBOhAyWq113WrUrVMkx3sfmBqy?=
 =?us-ascii?Q?ntuoczI1wNxUb+wqQCigy0Dx+Zr8Z/g8yqQ6l1SoxIvMgqgWi2xP6gYI0MUy?=
 =?us-ascii?Q?HaG4DDPVxBjCykRdaGIBcIAMlih9rs73pqWxf3xdD3DFfvQVIO3uZ2sVKFv8?=
 =?us-ascii?Q?+zKaMnlGN6OpdlXbG7G34xjWXiZGTj3N+F9+j2j0?=
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
X-MS-Exchange-CrossTenant-AuthSource: SA1PR03MB6499.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0403c825-a018-4646-af35-08dc49b19f6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 14:17:21.2331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LP6ceoAI+1EyuCZQdY5lbLZfsIQ6LBc3nx94UfYwddj5Tjn55ia6Y2CCfqgFYq3dccRCe5jEZ1MtpPo6+fq4dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6979
X-Proofpoint-ORIG-GUID: 1bm_rZQAyEtlc9qnDOSKiryVQesvH-lv
X-Proofpoint-GUID: 1bm_rZQAyEtlc9qnDOSKiryVQesvH-lv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_10,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210102



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Thursday, March 21, 2024 4:00 PM
> To: Sabau, Radu bogdan <Radu.Sabau@analog.com>
> Cc: Jean Delvare <jdelvare@suse.com>; Guenter Roeck <linux@roeck-us.net>;=
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>;
> Conor Dooley <conor+dt@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Del=
phine CC Chiu <Delphine_CC_Chiu@wiwynn.com>; linux-
> hwmon@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kern=
el.org; linux-doc@vger.kernel.org; linux-
> i2c@vger.kernel.org
> Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: adp1050: add bindi=
ngs
>=20
> [External]
>=20
> On Wed, Mar 20, 2024 at 02:57:11PM +0200, Radu Sabau wrote:
> > Add dt-bindings for adp1050 digital controller for isolated power suppl=
y
> > with pmbus interface voltage, current and temperature monitor.
> >
> > Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> > ---
> > v3:
> >  *Remove extra line before '$id'.
> >  *Remove 'address-cells' and 'size-cells' from adp1050 node.
> >  *Rename adp1050 node to generic name.
> >  *Fix typo from 'adress-cells' to 'address-cells' causing errors in the
> >   dt-bindings build.
> > v2:
> >  *Fix identation for example.
> >  *Remove 'adi,vin-scale-monitor' and 'iin-scale-monitor' since they are=
 not used
> >   anymore.
> >  *Fix typo for 'compatbile' to 'compatible'.
> >  *Add blank line under datasheet link.
> > ---
> >  .../bindings/hwmon/pmbus/adi,adp1050.yaml     | 49 +++++++++++++++++++
> >  MAINTAINERS                                   |  7 +++
> >  2 files changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,a=
dp1050.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.=
yaml
> b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> > new file mode 100644
> > index 000000000000..42cafd8fec25
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://urldefense.com/v3/__https://devicetree.org/schemas/hwmon/=
pmbus/adi,adp1050.yaml*__;Iw!!A3Ni8CS0y2Y!-
> 8d2ef4ArhRTDUHLiMXbulDz4xJmONqhQqWKLN35O7oIBsTYAjH2h1LFAT8T03nuAi97Q_kk4D=
5m$
> > +$schema: https://urldefense.com/v3/__https://devicetree.org/meta-schem=
es/core.yaml*__;Iw!!A3Ni8CS0y2Y!-
> 8d2ef4ArhRTDUHLiMXbulDz4xJmONqhQqWKLN35O7oIBsTYAjH2h1LFAT8T03nuAi97Qy7d7H=
ZZ$
>=20
> Your issues are here. It's "http" and "meta-schemas". This is mostly
> copy-n-paste, so how did you get it wrong I wonder...
>=20

I ran the build one more time yesterday and noticed that there were typos
in the links, I guess it's because I decided for some reason to write them
by hand (don't know why because it doesn't make any sense).

> Rob

