Return-Path: <linux-i2c+bounces-8176-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF069D7A59
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 04:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F29FE281D0A
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 03:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC5A4F8A0;
	Mon, 25 Nov 2024 03:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="F39Z01W3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4D9374FF;
	Mon, 25 Nov 2024 03:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732505411; cv=fail; b=qe7fwQKatTO3z/QIuOZgBW7fhuHy62xNbDqEyOlTf1y4G6C9s0XHqHtt/Nc1mET/27MynzRLvZ3QNvuizFqwhB+eOfskBoVyeQXu7kZwXqR3yaY9Y4JEPOThCGcvnxlPDXdb/0UMdIfHYupzBrNewOHSMgP/YKMorrDkBW1ruv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732505411; c=relaxed/simple;
	bh=9keMJM/cfmUPR4yrXuZi2XeS1hUY05Ek73TtwwKrCVg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tnH6njnNNr8quyqCx4yhOWIG83UAqJsV0pfX0fUlCx+8cL25DKh0wsrqyak9n8GipJS3NU1/76+2xxFfwqAiaAJoG+U8+LBzlwtFgmy1bXfIh4ouFM71CmBjJA6ZSsYOEih/XPdOgsw+FG9ezYjbq6WEIGYjy+4Qp5+HnfJnonM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=F39Z01W3; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP0j2kU009229;
	Sun, 24 Nov 2024 21:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=/NZyf
	lQ17rwhTgqH3pUAYbTkbLXOxZOXSeuuDtjzE6Y=; b=F39Z01W3504T/uYO12+Yx
	/e/ES5HRPTbs/+QpLqy6dEdJ6RQuOn8iUusQwaEbDFkckLtrCZuDnTaFosWaW7MW
	sKSM17lQDTRH3ZCjP0G2kYjDMgp3zhYBD7GFYJIeteMCpB3dfGCsZ7waWYE5NJ6J
	U5ItgXsJ3rtKZxym2LNu1MRih3HqWNyj1omMF42fmQKXHZzqyd/YQ7F16grj+Y3G
	Ek48WfKkAcmnH1VFNiozzUrdrv2wPhWkJ2ELa9ETU9bPFDlDV/n06BI1ddeY7iDu
	RtZruLeDsl2wAR2nHMYEKtVAWx+bX5hYWAlqh8xqMKsiuSaq+2KduuScayhqEB9i
	A==
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013079.outbound.protection.outlook.com [40.93.1.79])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 433w1kb522-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Nov 2024 21:44:36 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWI4MzkH+nwli9yL9c74z0rPqps9P7t6nbYccXRSRfP14XnzEhR6Hu+S8XISU0gCFYvRJ6x+TcoSs782tYU4UfBBSgTAp+VIEa4auauqkjIB1OJD75b9nxyMw39aH+CzzXVgYZjMNieD8R6fP61wYdSUFGhlmTOlNCTFAdh70oO0qsQTDrUWbacYqZ3nwFxEaIH0L90Q1eacFos0yrSQRslLipWLuNaS6K6ofXW5L4PzKYxd4uw5WqzKgIr64KCZ7kPCaclPCCuXYNrPTcFhgtE+LF53Z0X4XZ5t+0C7AXPbCEPzKmHPSR5F2uXQoPjsPuxTriJaMwC1GJhI2turPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NZyflQ17rwhTgqH3pUAYbTkbLXOxZOXSeuuDtjzE6Y=;
 b=D+kcgs695iqQVs8yrso1K1Tr6PRLi+dpyWuvRj7D+HKRfKaTJS71I266whKrhtgq9rVYWG5rzL1+JVb65i/q7N1WqmgfzvKXu2noLnk/0OpBom4YaW1kvKRtt9AmIBBpl+c8mallCmBulQZLutxEArz6ZDoSfwg1cUskUTo0E8QTSgyy7UeiMX3Z69FvCRWPQbgzv61fFDuGuzs733AgEKKabqA5tZvjb8ZFcGG1cvk7W8swYsnfrDeSxFm/mCMBBI1FZVbAhAA0b5erAu9UoNByAmITW/+OYtAhvlGrP6xTyaIbQnXwy0br+tiHn/8kqL8TFHqxYmZbxgD3+ljDRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 by DM4PR03MB6094.namprd03.prod.outlook.com (2603:10b6:5:395::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 02:44:33 +0000
Received: from PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446]) by PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 02:44:32 +0000
From: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>
To: Conor Dooley <conor@kernel.org>, Guenter Roeck <linux@roeck-us.net>
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
Thread-Index: AQHbOwCMcgPGmOLviUWtaqX+Ac5c5bLAaI0AgAANkICABNdqgIAAAI2AgAH/A8A=
Date: Mon, 25 Nov 2024 02:44:32 +0000
Message-ID:
 <PH0PR03MB69389916EC3C46C3A1F228AE8E2E2@PH0PR03MB6938.namprd03.prod.outlook.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-2-cedricjustine.encarnacion@analog.com>
 <20241120-process-hulk-ecedcbf088f7@spud>
 <e2e10b1e-cce3-409c-9327-178cbf4b0d64@roeck-us.net>
 <20241123-paced-osmosis-007bf72c4b02@spud>
 <20241123-submersed-overdue-ce999ccccc72@spud>
In-Reply-To: <20241123-submersed-overdue-ce999ccccc72@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-ref:
 =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2VuY2Fybm?=
 =?iso-8859-1?Q?FcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZi?=
 =?iso-8859-1?Q?ODRiYTI5ZTM1Ylxtc2dzXG1zZy0zMGQyOWQ2ZS1hYWQ3LTExZWYtOTM2Yy?=
 =?iso-8859-1?Q?0wNGU4Yjk3MDc1MzdcYW1lLXRlc3RcMzBkMjlkNzAtYWFkNy0xMWVmLTkz?=
 =?iso-8859-1?Q?NmMtMDRlOGI5NzA3NTM3Ym9keS50eHQiIHN6PSI1Njg0IiB0PSIxMzM3Nj?=
 =?iso-8859-1?Q?k3NjI2OTU3MjY1NjEiIGg9IkRTeVJnTUNsS3JTK1VkN1JHbTh6Z0NPVHVW?=
 =?iso-8859-1?Q?ST0iIGlkPSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk?=
 =?iso-8859-1?Q?5DZ1VBQUVvQ0FBRGh4U3J6NHo3YkFiVzRpNkg1czJDTnRiaUxvZm16WUkw?=
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
x-ms-traffictypediagnostic: PH0PR03MB6938:EE_|DM4PR03MB6094:EE_
x-ms-office365-filtering-correlation-id: a553974b-a691-417e-96e5-08dd0cfb1751
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?sJEiAJ/heiygHbrKEgw9fIcAQMJ4xK/Oy3B8pUlsu+5CYL8EzwPNMXGSar?=
 =?iso-8859-1?Q?AvsQlGK7AqzQtDFxBl51NI5M185GY4S4um0Kiy7eEN2pHrVgqMVEdhPnsY?=
 =?iso-8859-1?Q?TxVNDdCDoChpU0xuwgmU0+1JN0QlQK7d51G55f7tAVtS59pJ9NweE9cXSz?=
 =?iso-8859-1?Q?5dB+WXtuZ4Ru7zg8ytgNWq+wLWXyH1aUVarnMYb1ElxgdrEFj9w5Rr1QNA?=
 =?iso-8859-1?Q?O2bpEBSSeI1V7xzRfVzxWVSpSExd4YS8PRlRH906s/fHqX9XdegE54yHuC?=
 =?iso-8859-1?Q?zlQ7rE4iv6BoDDSkXq1jpjm/zzOvZorKYgPV5XEeYUWP/6WnXAV6KsQzoh?=
 =?iso-8859-1?Q?ZftOt5MVeVps+u4AtnOgR91pUBsm4je8tzLYNAmga6qnzGbAiP4Mdnjv1m?=
 =?iso-8859-1?Q?aoAEQDqxNL7zpmNkPhsx+HH8sXa1rDz14bMQGBtYAkjWdJ8YiANFcJP4iM?=
 =?iso-8859-1?Q?XDYdj6H+FLKwc+967802+0bmKqPgmOtTROohlcaw0t6T0pG0Klgp9DwtZc?=
 =?iso-8859-1?Q?ct/4FzQ7GlOJl8D8kjjWs3EEoP1OHdjjF1MA20jxiQ0wgK3oXGSn2FGFcd?=
 =?iso-8859-1?Q?z6yTFc3mhHiucp2r6fspnVThVxKedsAkPUdgKNBuEq9olzISk89s9haxge?=
 =?iso-8859-1?Q?vA8KmhwBCOPg7hj6ncUR+upB7CK75G3Es810w9wNLE+Z2rLgRfolE0PRdZ?=
 =?iso-8859-1?Q?azJr3WKJxIBOtZzZJFvmoDSCjYpDTNsmvQc3KWlv9Bowfp7GHZ7Tg5rwqI?=
 =?iso-8859-1?Q?ScyyX0yCU5LGAtTMFb+UakUG5vuCD0NUafZSK04+iDZ5WraY9xV3foe3bv?=
 =?iso-8859-1?Q?5MJ0uwTTxPANHlmNUegl2bTgIzsntmz8U95tEpM6eN8WZ5VRFE9bWN+zu2?=
 =?iso-8859-1?Q?QheR4ZtSH73uJF6N6MBUv8geYGNXGPMXgGbnUPA3z0I4YINod9MUjF8oIi?=
 =?iso-8859-1?Q?PLhyBklFWPMfgDacokac+bF4LalYPybr24tAXxig+Gxb8eHUN/UKKWlCBs?=
 =?iso-8859-1?Q?HNp1BCMNr9CSyxF0bD4zeoYMwY7lwtfv0U1Ha7M9zWqgy03lu6Qf9Gg/xH?=
 =?iso-8859-1?Q?2v5NeGf1T5/YtKWlZGBO4SOfHdi9D+6PxRy5f94dmjMlWDUbW8piRtXmRx?=
 =?iso-8859-1?Q?8iW9xNntWdvMQ+0QN9SOHEZMt5HSfYRvlUGRKfyEElpV0/JE7WqWMmvVIe?=
 =?iso-8859-1?Q?KJRwZHIeE9QCKyvHtyACsbDq99sr4Hh1LLlmatNCHB3uf0ljYxuhhpWZ2I?=
 =?iso-8859-1?Q?poufh/ZtLsKkj+9Cpd+53wKa/XDzAlRpEjxamjIZxYoIxRrmlqk45XF7mR?=
 =?iso-8859-1?Q?6K65bcpIT18vfjgDwegZvdhBQoUFF4q+9QtdAum411F3SzY+K/vFbV+Syx?=
 =?iso-8859-1?Q?W3ER8LPuFK5lARhuNt8Hkl+YftN10Xjk0kwok34Ga60pet5tAFzTh4Mgdj?=
 =?iso-8859-1?Q?HMyxL+3vlHDLGWQncf+ZY60fs6FdDrR532AG5A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6938.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mU8fehUVibjuwWeUcLLPubpmYyV6sfsKeIikXRm/KxVn7igQ4qv18e3ceW?=
 =?iso-8859-1?Q?GE1Q8pCuZ0dtC70PLwHEJ35Tw+gzWL4G/TPth86x8lqC8l42GxkDB+F9Pw?=
 =?iso-8859-1?Q?Hvh5IOZLKDcCQgfbG1T2nYy0TpNKPuhnB0/em/Bo54T8KnptdV7IiTMQs5?=
 =?iso-8859-1?Q?+Cw55xIpRYZGMii9n2jke3FZO9UiaZjXU/9fzc1sZPr9x687rvmKU+5bVq?=
 =?iso-8859-1?Q?El71P39JRLOgxT4gZ/oHsE41ImGTVUMxc1TbnCiVUpZfI9vFxlTWpJ5hWm?=
 =?iso-8859-1?Q?ISqKhF+oDhQfb15IGe1biBN/7bvdrU3VaG26Ie8GdP1c6E9ZwcOlPgqunr?=
 =?iso-8859-1?Q?krGUIgS8urZ1vXnbEjW/bm9upsjGCwesjglVWPWSvAvC/pmATE9m52hdEg?=
 =?iso-8859-1?Q?nMYC6qBq1yG6dd7p/fB79Cx/9tzyHRyK65w6ozjEIpkHYNcNiOpZMGcAQx?=
 =?iso-8859-1?Q?Gizai8gHfnuoHxIYMQjtUrnzElDCJE9Y+6VPOf5qqSFauc+yXxTzNM+HU0?=
 =?iso-8859-1?Q?45gtT5Rhtq+bsrIo4Kt44t3YIvjY5pIqXbKeavRV6cGwNaFyPRu/ECwVXp?=
 =?iso-8859-1?Q?8pdxsr8SCMwkwa31tOtAN0kaMchKW2XZhpqqQty7P6kukxgDjgGH/InuiT?=
 =?iso-8859-1?Q?m6O94HZ25tLdOMuFgVK+0yqiOWDbrYs9/qSIbdad3oX5i2r9BAwbWzHF3a?=
 =?iso-8859-1?Q?hn2IWbJac+nprpgpAKZEJXa22TTLuGun7ky0dBXbVBpeh2jxPEPEklP0pE?=
 =?iso-8859-1?Q?gv/a4ZtSAnM0obamIftIrabJL0dR6NabR09l1riAUf8CaTih8uQOTXMYkr?=
 =?iso-8859-1?Q?5KETAnLp/OGyFh5eDjEeBEKMtXCr3+kwFkcY8wdgQWJZBnfvip3gLW7nx6?=
 =?iso-8859-1?Q?HmrLqj+dFbytxJxGmrLlHvE/gk1p+opiPZ8KaHrDB1Cl65t0I+n9pVImj7?=
 =?iso-8859-1?Q?RI8ptJ7Bac88iE/LYlpqGHa8YBf5qmpv8dGnEyh+gyAno1O9Be4wi3HIqb?=
 =?iso-8859-1?Q?AAoOyp0GpvMG5fgTnxIXmYXugn70fuuaR2G4nARIeZvH54Kv7AxirrhM6q?=
 =?iso-8859-1?Q?h1tJgZkZ+qc8jcshuZzm+fbpaiM/NBSygdkIxSrZDcAERJxbPuGYRggL1Z?=
 =?iso-8859-1?Q?hIbR76yPkhCVcTfOK9gEeVZ3awS09iHFMVcwZCcDxBJ9rOd7X+hc6E1GdG?=
 =?iso-8859-1?Q?fWD7qsQN7mG0SU5V2t95JdZDJp40R3iNFY6ze69alFq51mKqMcuq5YfLln?=
 =?iso-8859-1?Q?GubiGpwtMp4VUpM9XELX5gAQrPBXOiWghvrP2cDVnRKZ3Q9B/oSa5BGGy7?=
 =?iso-8859-1?Q?t0IKaeM2eC8LSniVEv/2zEVuLKkzCZYgoNTw/Y7bZRq2LT5Kd26LqNesTx?=
 =?iso-8859-1?Q?RyKYNiQfG7/sAzpi92UTEL3blcgo7Rsuam7vY21nYAnHfOIjYmClhhIrpy?=
 =?iso-8859-1?Q?TaOzVjuWr5xrX/ZBE3SG78Qk2Z15eZ5BneTVU60577f1E/YQ7K8ZaKwrST?=
 =?iso-8859-1?Q?IqOPt2u/8oD5x+bRMHWETp1PKk40erS+bEMihJxFOOkuTRtA94zsXtjv14?=
 =?iso-8859-1?Q?m6YV+7qDLI46k5XjzJ6AvRqJX/tT0k2SkZbVbFKMUMW/8Tu/16z/t8J9p7?=
 =?iso-8859-1?Q?Ae+dfjAoeuklETMkC3s11719n4GpaingASD6RGzcklSV5gu71TJPV8GRDK?=
 =?iso-8859-1?Q?O1HB3bjc2AmaIqtgv74=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a553974b-a691-417e-96e5-08dd0cfb1751
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 02:44:32.3624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R+PSKU7l7Al3yhZUsi/CmSzKdCh9V/wb7MeP97tK7Tq7q7cKAgjk7deZwY9WzFaNfoxsxdrhAPiCBRrJcgEEYPBl802B/rdLsHRTDcJkddhbPcFfuS+D60pmimoMiMal
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6094
X-Proofpoint-GUID: hePTdhys1FVJR8_XaDiPtJ0zXq860aqT
X-Proofpoint-ORIG-GUID: hePTdhys1FVJR8_XaDiPtJ0zXq860aqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250022

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Sunday, November 24, 2024 3:58 AM
> To: Guenter Roeck <linux@roeck-us.net>
> Cc: Encarnacion, Cedric justine <Cedricjustine.Encarnacion@analog.com>;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
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
> On Sat, Nov 23, 2024 at 07:56:21PM +0000, Conor Dooley wrote:
> > On Wed, Nov 20, 2024 at 10:00:19AM -0800, Guenter Roeck wrote:
> > > On 11/20/24 09:11, Conor Dooley wrote:
> > > > On Wed, Nov 20, 2024 at 11:58:25AM +0800, Cedric Encarnacion wrote:
> > > > > add dt-bindings for adp1051, adp1055, and ltp8800 pmbus.
> > > > >      ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
> > > > >      ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperat=
ure
> > > > >      LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC =B5Module Regulator
> > > > >
> > > > > Co-developed-by: Alexis Czezar Torreno
> <alexisczezar.torreno@analog.com>
> > > > > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog=
.com>
> > > > > Signed-off-by: Cedric Encarnacion
> <cedricjustine.encarnacion@analog.com>
> > > >
> > > > Why did you drop my ack?
> > > > https://lore.kernel.org/all/20241106-linoleum-kebab-
> decf14f54f76@spud/
> > > >
> > >
> > > There:
> > >
> > > > +    enum:
> > > > +      - adi,adp1050
> > > > +      - adi,adp1051
> > > > +      - adi,adp1055
> > > >
> > >
> > > Here:
> > >
> > > >> +    enum:
> > > >> +      - adi,adp1050
> > > >> +      - adi,adp1051
> > > >> +      - adi,adp1055
> > > >> +      - adi,ltp8800   <--
> > >
> > > This is a combination of two patch series. I'd personally hesitant to=
 carry
> > > Acks along in such situations.
> >
> > Ah, I didn't notice that. Thanks for pointing it out. Cedric, in the
> > future please mention things like this if you drop an ack.
>=20
> Whoops, forgot to mention that Cedric can grab the ack from the link
> above when they resubmit.

Okay. I will be carrying on acks in the future for cases like this.

Thanks,
Cedric

