Return-Path: <linux-i2c+bounces-3017-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3DE8AA70B
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 04:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5144E282960
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 02:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBFB5664;
	Fri, 19 Apr 2024 02:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="fpr/d7bZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC6810E3;
	Fri, 19 Apr 2024 02:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713494802; cv=fail; b=MZdrbI7828OZatEwxEDGc4wWEufvPlcBuGFNArqfnQNaYxi+BFTHOf8OGaNIwLJNGsxmC4KPtgYfC2+vCsQ0Kbrv6jmhPdibrXxVlK3cQWShNT/ub99J6NxdF3ZFLEO4Dz9nSvT5lZmMph3+7zLNj5INFAEcXh/jjnywX/dPUX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713494802; c=relaxed/simple;
	bh=+DLXXfGBH7aF0qdydkZEk56zuGHgWoT004sjwHzqWpo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ry0WDAzcqFRJ51NYrI0mVHLRWzzld+3IQO7n2D/dEp9NHF4ZFMudgEG+Jhol0j4kE5nAAoms9QVmSxBAfCvPdqL2+aGI4h89N7ldxwUBZd26vRy2UdSG3qWaKvLPon7FlelDXEIUyeKDPp7zIJYWtRSwQrDb2I0IB870MCV1Ru4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=fpr/d7bZ; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43J0ZrDf007540;
	Thu, 18 Apr 2024 22:46:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=DKIM;
	 bh=LIrcfQ6XgqYkU1lZ2W1MFNw3Mued5zwQ+uw3l0RzIyw=; b=fpr/d7bZCZS2
	96HjyLKezP5j6b967H5Dj/ny1hAeV4FXqMiT562kw+pEy/RdXFlGt7DXiSGWGI9C
	6wAQYhPXugbByPGnKsvRGkMeE5dXl4A6hBAGtpj6xodS13gII0rfume0oErQQZ7Q
	UAuUXau0YLGPFiGqmeTIkrWQH/TlV2oAglxvV+5SY8PUnaXWK6tjis+TwGUfUSid
	MRUglErACZOHSySHa2sS8CoiGP2ULzcLR5XPifjUen6VZ9Qu16ZHGMvB8s7Gb/c7
	j+OuQy5HBZ9HXvvMOw1iDn9sKW2kDPS4dma8McVdBI3CDrwb4iv6sskrcu21jCtG
	1bsYyaK19A==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3xk021krak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 22:46:19 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwCGX9LFh+mI2EQj9kPmeQFv6zKUcNRBE0UTBKmc6552seMKkO6QMT1eApw5HuThhvZdz4141oo8jb/LW1UwUHc2Q8TflHA8gIRQoszGmf0nJFYOiw9QebVcKFVTYIyqW8pEFiyn/rjQ/aLgsQrH5kgDp2t2nvqkbYcLeLhP94f3ucJIDXsbu5RcBUpfk6zmC/RnxP2K/6PJNekOE3zqisZFSEdEe8ccqE9CBJnr1rHxMAW1whq9LSXNuwtR30CSHGrqO/iyYZte3zaMh3pQYAz2nL3pCkqOGBUpjag2lgq0J9xl+5+DmOQlUJIX8O8n1IAiy22UUlqxxtYs+0x1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIrcfQ6XgqYkU1lZ2W1MFNw3Mued5zwQ+uw3l0RzIyw=;
 b=FRy2wqY81PD8M78mSkUOYU6etsrsKxEo+3wVoEgK3zRrsg1sgksG0gEkew5kY42qJ3g+qtjbXONwM09qrBNiK1N1arbwv6Kvpr1cP69BzJlM0wXD5yZNXjBoBm1khhQFTDz+0B15WZR1npst99HpPC7cfU5LMz1HWx1tfG61KTrFHa1/MxxIczLavd4lfYUoADNQy4F5dG86YEI588A4mpElMph3kfg79Oiz27Rn0503HrMjFuQUJFPVdIIniFMbsBFGOKtPLXRgPqc06I9nYnOE1ptfsgYoH0VtH8wsqqUjmMxC2GvqBXQpX/IwzwNHTjriv2588777gVq90FVd5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6600.namprd03.prod.outlook.com (2603:10b6:a03:389::11)
 by SA1PR03MB6545.namprd03.prod.outlook.com (2603:10b6:806:1c4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Fri, 19 Apr
 2024 02:46:16 +0000
Received: from SJ0PR03MB6600.namprd03.prod.outlook.com
 ([fe80::32a3:52e4:dd92:6a6c]) by SJ0PR03MB6600.namprd03.prod.outlook.com
 ([fe80::32a3:52e4:dd92:6a6c%3]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 02:46:16 +0000
From: "SanBuenaventura, Jose" <Jose.SanBuenaventura@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Jean Delvare
	<jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>,
        Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: RE: [PATCH 2/2] hwmon: pmbus: adm1275: add adm1281 support
Thread-Topic: [PATCH 2/2] hwmon: pmbus: adm1275: add adm1281 support
Thread-Index: AQHakFtauod9nx2ctkmgfFu2ML+2/rFrnNIAgAD5SICAARPjQIAAQ8cAgADsb6A=
Date: Fri, 19 Apr 2024 02:46:15 +0000
Message-ID: 
 <SJ0PR03MB66008186E17D3920B5B58B92EC0D2@SJ0PR03MB6600.namprd03.prod.outlook.com>
References: <20240417000722.919-1-jose.sanbuenaventura@analog.com>
 <20240417000722.919-3-jose.sanbuenaventura@analog.com>
 <b36db2c0-db31-4304-8e58-aa358ab811c5@roeck-us.net>
 <62f878f4-a4fb-4e3c-8eec-d1be5ba165a4@roeck-us.net>
 <PH0PR03MB66070CAE5E8D99158003D58FEC0E2@PH0PR03MB6607.namprd03.prod.outlook.com>
 <1221f2fd-758e-4c10-8551-ed571fb1577f@roeck-us.net>
In-Reply-To: <1221f2fd-758e-4c10-8551-ed571fb1577f@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcanNhbmJ1ZW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1mYjNlNDZmOC1mZGY2LTExZWUtYjgyYi00MTU2?=
 =?us-ascii?Q?NDUwMDAwMzBcYW1lLXRlc3RcZmIzZTQ2ZmEtZmRmNi0xMWVlLWI4MmItNDE1?=
 =?us-ascii?Q?NjQ1MDAwMDMwYm9keS50eHQiIHN6PSI2ODUyIiB0PSIxMzM1Nzk2ODM3MjQz?=
 =?us-ascii?Q?Njc5NjUiIGg9ImJBL2t5WjhvVlh3SUNKaVVTcWJhdWNtL29QQT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QmRtSm05QTVMYUFRbHN1dnE4NVowNUNXeTYrcnpsblRrREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBdnNHSmtRQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
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
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21l?=
 =?us-ascii?Q?dGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6600:EE_|SA1PR03MB6545:EE_
x-ms-office365-filtering-correlation-id: 5a6d3bb0-b54d-463e-41de-08dc601ae23d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oWjIVbvCIRDF14Cu7+cbG2llovHFHXJYWl4+FjyDFYzFUSSnBwHVI48MCCI0M8ohM+F1ircJh5ybfxdaNC3pYnBg1WSj0fpKGojR5WYxqK2U6Y82pHPUyDBSDh8L/OQyLqo8lVYIF/AZ0QWzPn/ueL6PZxdvIRftYOcqHWr5SjQzXBEaq/IG3S4Wb7Yv2v8yGABKf5ZoIJvRMeC3sUHcLI1UsuzLOodpOZRO/Zs5wpH70ue01y2hyDx5rmRH9dYc/QYQJA9DCLhqMH2TRtHvQDrDYlDRhuAMPAVirvScEzEAIDYjzqzzT5WbLzGeHrK/5TEhHKBhwBiSUguwMCPgMIi2z87FKPHRaJfNwvRWwAcvS9uEbilSm9BuHZJFOlnK0Yac4e5K8qBtzwPuzNR8Obvh5dRWmYQlM6U/BZrqtSgIINSPWJxnW5NJORt5iXjvpjM948Qr6AocGOutKQmf/agyZWX1NZlWt+D/pvYX9mlag8rwn9aNwBvvYBQ2EDAmmUD62m03tSwDqpmnjAGjJgutg15P7Z0U8ayBmgYmxx6eRxLGhGhWADHuAgJ9aCjUMd87lzh4sQXhowyjHv+vXA3DtC3AWhTD21dOx6O40DpxbO9hr4ehNIIEZb1hViyq+2dD/I9zIwguergjgKrKwzVOXMyJzP8HmEOSEbtsNvc3oKitsJ1Tu1kesv6tZP/lRHBkUpy4POx3jwl6XmEOLovz4VTXiGL4QSDyjoq1WjY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6600.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?tTLoc7ysxU4BlQ7p6YYOHT2BNBFD02wREeo7cSYvB21IhqFG5tKk+QMJVUEf?=
 =?us-ascii?Q?9WrpRCQlmp7x5yrcmAdKXXmyGL4HrFGBbVswBm4qHcfyNk0FWxkXDJ4zWroA?=
 =?us-ascii?Q?62jmR13kTDvjEMyA3a3TUnQetFnRTIpoDBTMQrGoI5CihKpAbQyzjNZHJuqv?=
 =?us-ascii?Q?jYACZfv/WG8KzINCTXw/Knv4MROLDQBrukwEUYRtVd+GXhXXrvLRkhGWsr7l?=
 =?us-ascii?Q?PP0XPaA0j/LNzKThMbwG5Iw+2E+3tzCW+0/ibN4Wk+ng67CPKHxD993LPxGR?=
 =?us-ascii?Q?nRwCEQo5nFXTfpoz15oZtTgG9oQZLhxU1hnz/csQiEZa81tdvYfGCXuv932V?=
 =?us-ascii?Q?HOIQws54NLBDdc49QidxCRpKFyTmXzcbHoOrxQHA3TFp8dqvxEhJh+4BEfaJ?=
 =?us-ascii?Q?YMttB1t6miallU9aii1n8gn4LWm75mWNNoeehSJb6nRId4SKot83DFq+zPnC?=
 =?us-ascii?Q?7jRNvneB5+3xNeS8vBv+CrO7y9J66EnA06akwgTXB42OGvLd6MfSOylv3sg7?=
 =?us-ascii?Q?u2AX+/WOWPJq1HawDAp8z7VmtYHpPCww/RsrP8DChPjlFZIfOZhdAyiQyrRM?=
 =?us-ascii?Q?/jN3QtoaanOcN5QEb3k7uPpDwhi4y9gQ5YtdQE8DjyMzG4VGCF1KS6Ph2br6?=
 =?us-ascii?Q?T8RsBeINrZA+IBB7RSLC0BEcyjlVrtLezgpm6oxKf5unY9naIzx0TmKuRzWX?=
 =?us-ascii?Q?1BOxluZ1kaTnfc47851hA/2spcdsxPJFaCVYEnc9acNvmAi98nhwMxn7heOV?=
 =?us-ascii?Q?9WjoX0THgDj+Bn+FzrFm4ST73ZEWy2tlDLD3ZcZlViB+Vw0boF4W+OwFKVLc?=
 =?us-ascii?Q?cil6/xR0dNCGcVkBDSBNfVozspNufxX6iisfD7dskmUv4t7bm7JEY2hdiDbD?=
 =?us-ascii?Q?/n/othLfQNA5bW3IPYRvmPwmQrZCk5MQbaecRi6ZyOeiM9ineZexrWlIzm2I?=
 =?us-ascii?Q?ULEBfrvjY5masvoxplIGyPbBuEsSbnS8cN4R7Jb/1+fTempH/l0yDPe8laTv?=
 =?us-ascii?Q?gyPaI3CMhPLbh1am6l6LzwmOHUqaDyx+JotD4sv89xjH3o3fWbWYRP5y07Ca?=
 =?us-ascii?Q?+GUJAtjsYFIMUj3N8EHI/0wPJQZNTfXKsD4M3I+VV81SykGaloQaqmk18Hu5?=
 =?us-ascii?Q?x/5J6FBdrRwSC0U8G7ZHUro0BLzo3D5Zvx8IKCkbf3s8y1mq976Ssv1UBoLT?=
 =?us-ascii?Q?wSH4cslJhRUQaDo4sAV5breoKpmZuLmpCEtSwS+IcYV34ysyRHYlk99aEEgr?=
 =?us-ascii?Q?fH0aBl8f/xxyW+OtZr7G3kKjA8eM66fjSKV7pgx9A9Q/A80k4KUkQJKsVy+X?=
 =?us-ascii?Q?Kl/u++1m13yfxbdPVad6FlqZyRW1fpRp6V8q3ul4ti96J1vT2pPRPbaZohbo?=
 =?us-ascii?Q?oeEGgCJ1opMqlXVXMTonNhL0GNsJuD9rxbf1MQQ1szoEzM/vFWpmsMwOPyn5?=
 =?us-ascii?Q?LKX0cjTECotz5UCk73zLyx2FIbAleLiTfLHek2j/493JJGhf6jRjCocRczM6?=
 =?us-ascii?Q?Lh8bqrhc7EHwTtwHqqAZBC8l5qqLtWFXJgozVqSVUdbcDdEnevlxvc+BJvAt?=
 =?us-ascii?Q?/TC5LGzAdTrVZu5nMqWEPmNcXF+oABRKJsIYSk+tatwsKxvi3tXAUeOsAj4I?=
 =?us-ascii?Q?3Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6600.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6d3bb0-b54d-463e-41de-08dc601ae23d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 02:46:15.9417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Khr6YLsC+DYLCv5DLHa3J1FitO791pNbRvgGuCt/CNbkjBjkHCgq6j9/9YzWYcdKSff8CC5qGRz94EIyNDtt+lpvefBkLcl7Leb2tqEJlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6545
X-Proofpoint-ORIG-GUID: 8ZhvK84037sUy3-4L5KridXIlgf_pcqN
X-Proofpoint-GUID: 8ZhvK84037sUy3-4L5KridXIlgf_pcqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_22,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190019

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Thursday, April 18, 2024 7:55 PM
> To: SanBuenaventura, Jose <Jose.SanBuenaventura@analog.com>
> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-doc@vger.kernel.org; linux-i2c@vger.kernel.=
org;
> Jean Delvare <jdelvare@suse.com>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Delphine CC
> Chiu <Delphine_CC_Chiu@wiwynn.com>
> Subject: Re: [PATCH 2/2] hwmon: pmbus: adm1275: add adm1281 support
>=20
> [External]
>=20
> On Thu, Apr 18, 2024 at 08:31:42AM +0000, SanBuenaventura, Jose wrote:
> >
> > The lines mentioned were added initially because the STATUS_CML read
> capability
> > seems to be only available in the adm1281 and so reading the said regis=
ter
> with
> > another device shouldn't be permitted.
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> Why ? Sure, doing so causes the CML bit to be set, but the PMBus core use=
s
> that method throughout to determine if a command/register is supported.
> There are exceptions - some chips react badly if an attempt is made to re=
ad
> unsupported registers. That is not the case for chips in this series, at
> least not for the ones where I have evaluation boards. In such cases,
> the chip driver should do nothing and let the PMBus core do its job.
>=20
> > It seems though that the functionality is redundant and is already hand=
led
> by
> > the PMBus core and maybe these lines can be removed and CML related
> errors
> > can be checked using the status0 and status0_cml debugfs entries.
>=20
> This has nothing to do with status0 and status0_cml debugfs entries. The
> PMBUs core reads STATUS_CML if the CML status bit is set in the status
> byte/word to determine if a command is supported or not. This is as
> intended. There is nothing special to be done by a chip driver.
>=20
> Thanks,
> Guenter

Based on the feedback, it seems that the lines mentioned can be removed sin=
ce
the pmbus_core.c handles the checking of status_cml through different funct=
ions
like pmbus_check_status_cml and pmbus_check_register among others.

One thing we observed in the pmbus_core is that the invalid command flag wa=
s the
only one being utilized (PB_CML_FAULT_INVALID_COMMAND) but there are other
flags for cml fault in pmbus.h such as PB_CML_FAULT_PROCESSOR or=20
PB_CML_FAULT_PACKET_ERROR that were not used.=20

Given these observations, it would again seem right to eliminate the lines =
you=20
pointed out since those items are already handled by the pmbus core and tha=
t
the status0_cml debugfs entry can be probed to check the register content d=
irectly
and see if there's any other cml fault aside from the invalid command that =
occurs
and the user can address it accordingly.

If ever there would be changes to address the other cml fault errors aside =
from the
invalid command it seems that the changes should be applied in the pmbus co=
re=20
and not on the chip driver itself.

I hope that I understood correctly the points you brought up and identified=
 the=20
possible next step to address those which is to eliminate the added case in=
 the=20
adm1275_read_byte_data.

Thanks,
Joram=20

