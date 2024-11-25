Return-Path: <linux-i2c+bounces-8175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619A9D7A42
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 04:08:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2FD3281EC2
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 03:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D9617BA9;
	Mon, 25 Nov 2024 03:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="LjNT52uI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6C4383;
	Mon, 25 Nov 2024 03:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732504078; cv=fail; b=u7Ssc4KTtoWfweJbTOBGGCDrl9ZasRDTtxXKl4XMJgNSX/CCP2orn4iEIZJ5fAjxx/r5xze0UVYobWWPiDauJPUTIMBRzwV6y59w7y0Ij5oGGn5wAOLAD8DacMVRZQcPwtv8/2D216M3APJgiMqPRcCEhS441jxGQ0tC7zYKRLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732504078; c=relaxed/simple;
	bh=hUH4mgnWN1Bh3gIkKeoFyCuQwTUHe+inPar2rb7RC80=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SmxP2T3VXXiSJ3RK6YK86UHILtPgnPY1N3sqMoODi6tL4QAMdXe4AiI2ZW7rNVRf1lTOxSYGaoZ7yY8h/PQnUpvlKeE1hqcWyj9sjQczAU2TVG3e2fQcGlXtTgveVMB569tBmI8xquY5BKR+URmur2V7sOpO/N+vN/G0pjhvdgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=LjNT52uI; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP0j705009316;
	Sun, 24 Nov 2024 22:07:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=usCj1
	EoyXAcCfrcpHB/2H7JeGA/tBmDge9nFonWAMTY=; b=LjNT52uIeXLopTUiZ1s1v
	9S9vtG8eSVy6aP8EGrjFVBWpVi9CTCEDJPfZVeBp/bjbBlOxITZGHwNUNWRf5j4g
	NvRMByIH4qNOfuYQZa587gGYHCMPDQcy/adZh+t7ql8gncEVeEQd5y4wCkThihTe
	9ijB89IRozUnm3w6QAeN2sr8csy391Xeh+0SEFSydU0OUs+BLiDnRRwxJIwFuD4m
	+KVLyOMLhEtCjxLm1dWuPg17NY1PEiYtWsTbrl1CgrVoGRUX9u8igftpbQ913tjZ
	ybXUs0FltCtj6xDAGpqSTCmOjvqYLs3GTVtk4sGHnSx7Vbp6RKoia5THeMEs1FW1
	w==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 433w1kb7vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Nov 2024 22:07:34 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NipTqb6zuLQnZa7AkUVuDq+e3tV0MjoswayM4lxSeaaWg/HCBY5MZ2/A0PfFT+GH9VNwwhsPckEfM58kdXbkikx4Mcr5bO3loZR+L72aWPxtl8n9x8/AsS4O8uJJz9INLGZ1BtP+yJNhIYfFoBuFhKg+48kzJ3VCv1vWXX/L0WXOM0IT2xbprmReirCYyzaAKg4XDnAjZX9bxAvPEsB5T+Cpr/h/j6jlXj8rCrbrqQUeb2+638HFngGf0VbBWw1aqYKzVTced2s6voPIKN/jW6UK6KIQurzFdQIY5Uk57FqqFZSc3xuD2X5DG03TzYv6FWMwoY718pPlXPu/icqmCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usCj1EoyXAcCfrcpHB/2H7JeGA/tBmDge9nFonWAMTY=;
 b=FySwLBzDxmZx6eo+0qCqLxRyHgF1PxdK/CVrS2zxQSsza5WJdcaEX0JuWrPywCnYskROvlRXGaZkUntOJI7wg0a3c5b7URtVow0yOtCMqQ8a/uporlSkwKnKLquUDjJ62DpHn13ym+5nGX9e+Oy+Dg73XeNM2DQOl97Wfk+y3pv1y28G+Y4wSE7+anSpqEHo+R+gXjnhjOg0At9LZ75m0wUbZAp9ACALhYgxNDWF1FfGHJWMPEe0BOdrB9ObZeHReHez5ggxOuBoSVB0NgsX3kVGxMGmWTuLyBb+lhyrKvRlX5aytE05+gmoEetmrz9F5hO2fsEeZe1661i7azKrgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 by PH0PR03MB6336.namprd03.prod.outlook.com (2603:10b6:510:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 03:07:32 +0000
Received: from PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446]) by PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 03:07:31 +0000
From: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Guenter Roeck
	<linux@roeck-us.net>
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
	<AlexisCzezar.Torreno@analog.com>
Subject: RE: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051,
 adp1055 and ltp8800
Thread-Topic: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051,
 adp1055 and ltp8800
Thread-Index: AQHbOwCOYv6FSaMl5ki5lLfMwC7S6LLAMNWAgAAROACAABqNAIAG98Bw
Date: Mon, 25 Nov 2024 03:07:31 +0000
Message-ID:
 <PH0PR03MB6938294669F61BA99DC90D168E2E2@PH0PR03MB6938.namprd03.prod.outlook.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>
 <Zz3plZOyMcxn54_h@smile.fi.intel.com>
 <4cfb8bd8-4ce7-4474-b7c0-0fd2693ce34f@roeck-us.net>
 <Zz4OTBF66WfvnP2P@smile.fi.intel.com>
In-Reply-To: <Zz4OTBF66WfvnP2P@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-ref:
 =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2VuY2Fybm?=
 =?iso-8859-1?Q?FcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZi?=
 =?iso-8859-1?Q?ODRiYTI5ZTM1Ylxtc2dzXG1zZy02N2MxMmY2OS1hYWRhLTExZWYtOTM2Yy?=
 =?iso-8859-1?Q?0wNGU4Yjk3MDc1MzdcYW1lLXRlc3RcNjdjMTJmNmItYWFkYS0xMWVmLTkz?=
 =?iso-8859-1?Q?NmMtMDRlOGI5NzA3NTM3Ym9keS50eHQiIHN6PSI2NzE0IiB0PSIxMzM3Nj?=
 =?iso-8859-1?Q?k3NzY1MDIyNTI1NDAiIGg9ImRkKzUwTUtFYjB1c1g2SmtQOGdDcE9wbEVW?=
 =?iso-8859-1?Q?MD0iIGlkPSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk?=
 =?iso-8859-1?Q?5DZ1VBQUVvQ0FBRDhveGtxNXo3YkFZekx4QktBM3ZsQWpNdkVFb0RlK1VB?=
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
x-ms-traffictypediagnostic: PH0PR03MB6938:EE_|PH0PR03MB6336:EE_
x-ms-office365-filtering-correlation-id: cacd3ce6-f2f0-4ea7-0bab-08dd0cfe4d8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?FjBl10wFMO+7dA1UClgp7p3DeaHMn8W+QVOoPUJtd4hEUDz3NiKbfUcZy2?=
 =?iso-8859-1?Q?10hMkiR7V4Fm0z9oEk7sUnJkROiq+zqhoJmyOulpQAA/qNEIgT55eof+ug?=
 =?iso-8859-1?Q?j7G86AM8PG54oPsnrPofkDhRDsZz1W8u/hcfJ5n+wpBWFL/zmkcZ3/tZ7K?=
 =?iso-8859-1?Q?JaWJ0EJFnlYYtdi3X9c+BhedCJ6GVkYwhWMbfoY0pcd/Xl/WKil8YZS9Bt?=
 =?iso-8859-1?Q?K1YSevKs2XcU6/MJQ3YmNhE35gdlL+6hmo0rdpMDGOMWuYsix6uo+7Nkd9?=
 =?iso-8859-1?Q?LURHYNofUpZvVtmFXLnEqUGcWQuv/NckzVu26KGkA9uRmDs7j2eXgUfwUQ?=
 =?iso-8859-1?Q?oNDmgFJwUIOfcPcKmwr6chOBnPDGnJ6Dp9D05cjZOHU5shhjI8MnL4YGFT?=
 =?iso-8859-1?Q?IAFfvKu6XoZfka3E4+z5Xu+og8guV1w5nB4of/N9iRAARIrvWMOL30Q/qy?=
 =?iso-8859-1?Q?pDWmi74zuWsUtmTlTWyj+baKdfp1/Ebg7qULrLF5NALTrwzZqLdSY1dfQq?=
 =?iso-8859-1?Q?VI8ktmBYfBelSdw+r24HHYyyx/Gasg9F9nd4R3N10nfT9T7eeHfqkT3bAi?=
 =?iso-8859-1?Q?j342hdWtL3k5hlg/FF8XvvFE5W/IB78Z4DqBxSYZgugdKy2m9n73OqYBQT?=
 =?iso-8859-1?Q?jDNVhq3jo+00aapmnZxrAbRQ1Xnd21ImVy/ncnGuD+q1qHzF/rLHtRBJg+?=
 =?iso-8859-1?Q?q2wkWwsER8RpMdeq2EiQsg7vX0mS8QND12+aTGDPcsuo7xFw7tnRTIahKN?=
 =?iso-8859-1?Q?joePc9l4fJ4TwaTiY2i93cT7ivIAgii+Sli6LYJrgEjUElvqoK2JDeYg33?=
 =?iso-8859-1?Q?yKbzEs5Nal4E38SYkOcoukle0Q9ZgGZS9NpSKDr073glnp2mKh/IkBS1Qz?=
 =?iso-8859-1?Q?fA0m7jBeZneVYxsdXXqQhJY+rKukgXFDu5i4AYkj+r1HFbSbvoVPftUiKY?=
 =?iso-8859-1?Q?4SYBIvy/SM4olszdWV19/AaIeIoDxG1oErfn3hvlLVgQX2dyUzyt/ZPY2W?=
 =?iso-8859-1?Q?JQHRrWeuO1qj/bDLwPFRUIXgNTmjyun3+BoC56YD1R7cWRUI6cg+LHtrND?=
 =?iso-8859-1?Q?4Afp8Aj0IJYqZRmumBG762D1mA+8oav7/D1vlaJLYYvj+DL1Rc5SIu/eUu?=
 =?iso-8859-1?Q?HsBvCpCLCMCfWEhcrQU3qFu+s7tdsLq9BrcIxf5q1kuRnmimbXtmbu//Xd?=
 =?iso-8859-1?Q?ThHkXeKDgWlcXWCayyUDZoXeJYbNUZ/Js54cmCfmqY6c5CDW5V0XxPPu7M?=
 =?iso-8859-1?Q?uFcEHjtccED2PKYf6siukxQkuNRv+jyLyf6AOetkmQi4eoLR8iFoz/12Pk?=
 =?iso-8859-1?Q?JKP/Y8Z4mSX4AGOCFAE3h9U0srXXG3TO9GYorBTvkxSgOxsZunRWqMpXDr?=
 =?iso-8859-1?Q?R+ygiRvph0kKB51sVjlN0E6eSvASS0cBnmk76uJ4+YFj1dPE9gQ2vbkqlX?=
 =?iso-8859-1?Q?FNZxS/4aKd4L/qU2By7GgyHl2NbW6lJj5xaUqw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6938.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5wKd4bnqiBmN9w0djlVFCid9uCpedqi+8YUgZIBSPQVurc7mHjRylRUH86?=
 =?iso-8859-1?Q?metcwngn96HtI/UXhWcJvdQ6DKEwUQB9d3fIFxr6VCsu6+BO0aMjI+q6OC?=
 =?iso-8859-1?Q?xiWUn7/gYUdfVQC+QrVL3UL+h8h0F45SbEOyIUCrqNXGdBGr4wjOJO1Lk8?=
 =?iso-8859-1?Q?aZ5NldI+JSeFpEkONedzxaDXSfV1uCk3viPJNnl4+i+wOD2xFN4essbgGw?=
 =?iso-8859-1?Q?NIRwuKXZpEmbrAidFO0r8nFfl91nFR5qR7e0iESO8ccREuiXeTKpjcJ2xR?=
 =?iso-8859-1?Q?1vkLfWVPuozv4DJURS8DbHAN0QzekeaeZcN5Dr/GR2U9X0aAOladEY+X7P?=
 =?iso-8859-1?Q?HhQd+PGn7F/8PrbGbKWSyqXjTjPFsM87eF2+dI3TkXLRSQP7S5JGCPhI4R?=
 =?iso-8859-1?Q?V0ys22Z1B53jXw50B4cbkZaB7lzB4eunvLTKDqamQnUsvSty9YGtldOAtU?=
 =?iso-8859-1?Q?gX3bQSZMTi3ZM4La6a9JSKCCQKze0NjlWcZqd7PEDwKRI4hwxnTU/th7FM?=
 =?iso-8859-1?Q?rw1NeeTptk6ks+n7x/4So6dSZjKE4TEiIwGBQVaau5b0qf9sKzLMBylsQ2?=
 =?iso-8859-1?Q?S4gj7nbs41X0m4EwHOGfYGiXKDzP0pFJBQfLkljIj0Ymrzvb0aOV/ovVAo?=
 =?iso-8859-1?Q?dMRaSXUv9CXQsCn9GHDWzGOIFp9cW2Lg7rhRqkTsOOkquhEMf3HI2DHEPL?=
 =?iso-8859-1?Q?H+vzqwqc5podCKL1A5JeLCWZBluya0ELZcMbVyupdPQPafBpui47KlfgNd?=
 =?iso-8859-1?Q?XM2LwWf01Xag1G2ta5heeA/zYEjc77aLlUL70lk8HHzkerm3f59AT6DBp/?=
 =?iso-8859-1?Q?jdHLQgcoJTzcztzshXUMokSBu3gqxJGFjFc8RH9WutnIiwFqqvyNkDbvpb?=
 =?iso-8859-1?Q?Rx4VB3315DwzxL9ota+Bjm4KUqSnVofZriEQvWHgDA1yMscXZg8d+jeL1q?=
 =?iso-8859-1?Q?pCTNCQA2kgKaT74Ys3nV/xbC89Ec8azjx/dyHxSSyt7WbFzWZarpaumdAt?=
 =?iso-8859-1?Q?iKy9ODHw1pGyLCKz+Ryen913xxNNpBTSrimelMLxKmB3Gf9p3DeFsUQON/?=
 =?iso-8859-1?Q?2VFxZUx3K46gbMu/t/daqUMG3KvWHu37bPEFrLClhq41jL3pvxkr4xAuBI?=
 =?iso-8859-1?Q?V6wUkHMR53zw9LbslD3fSIjd1B3Fv+3dZnbhWc9VSR8zRHt2ZGS4h22dqh?=
 =?iso-8859-1?Q?fXxMAAZq8UUQH70Qgf1ENbEgljbPySsBWHiX2BNHc2aXqKo2cWuIMPA2o6?=
 =?iso-8859-1?Q?h9A+gvi+CyOH/KkpndOKEtXl7cPcPSlNVdbbYdv0NFtZNPGQiKnTWmBIaA?=
 =?iso-8859-1?Q?M2a257I/ovJfdGkHi1b6p8DAN88bn7xq6/TKz0qNU5kzGfkQByf9pcU5xS?=
 =?iso-8859-1?Q?1awzkxAkNdyZjfC/pGELctUzuLXEuiNiMQCajeUrjXA7xfomUN4PwnTHd0?=
 =?iso-8859-1?Q?JQ3GUGJKZjhtk19+wkkEd3k2RjFYM+crEHGD4CpbKQL7j5YTBQfHvUFhIn?=
 =?iso-8859-1?Q?lTQv5kaO4Jz0UKqvmpTrJAK9uvJO7z2tQa+WAh+cg9R8TdA2udrECdosFK?=
 =?iso-8859-1?Q?1/oZj4W3+yMmVuoXReqeSG8/CFyshDR4d6kn0vpgDrC9kDdTSMWDsQIK1b?=
 =?iso-8859-1?Q?Eko0N0NuksLUtW23FocnFcd7+9idvqBTgYccUCPo5aH2F+OR7g1mlQzpzw?=
 =?iso-8859-1?Q?E5DZ5+fXaBYSWTQxs9I=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cacd3ce6-f2f0-4ea7-0bab-08dd0cfe4d8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 03:07:31.8494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mdqiCFUeGQtbtfMImdNf4fSE8Sl+FejQtk5KL70PMrVkCkH/3OT+Ix/dqyOt0Dydc5wesRlt2MjKjj7LKj5Z4LxEdhm043OxvnMADl7kaQUtiJ8rYGyC2/HdFOS6oX7z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6336
X-Proofpoint-GUID: Pd-Hlwn0ZDlJSU158A35kt7R6bNRiVNA
X-Proofpoint-ORIG-GUID: Pd-Hlwn0ZDlJSU158A35kt7R6bNRiVNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250025

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Thursday, November 21, 2024 12:29 AM
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
> <AlexisCzezar.Torreno@analog.com>
> Subject: Re: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051,
> adp1055 and ltp8800
>=20
> [External]
>=20
> On Wed, Nov 20, 2024 at 06:53:58AM -0800, Guenter Roeck wrote:
> > On 11/20/24 05:52, Andy Shevchenko wrote:
> > > On Wed, Nov 20, 2024 at 11:58:26AM +0800, Cedric Encarnacion wrote:
>=20
> ...
>=20
> > > > +#if IS_ENABLED(CONFIG_SENSORS_ADP1050_REGULATOR)
> > >
> > > Why? Is the data type undefined without this?
> >
> > Look into other drivers. That is how it is implemented there, and not
> > really the point. One has to know about an alternative to use it.
> >
> > > > +static const struct regulator_desc adp1050_reg_desc[] =3D {
> > > > +	PMBUS_REGULATOR_ONE("vout"),
> > > > +};
> > > > +#endif /* CONFIG_SENSORS_ADP1050_REGULATOR */
> > >
> > > Note, this can be dropped anyway in order to use PTR_IF() below, if r=
equired.
> >
> > FWIW, PTR_IF() isn't widely used, and I for my part was not aware that
> > it exists.
>=20
> Yeah, it's a relatively new one...
>=20
> ...
>=20
> > > > +#if IS_ENABLED(CONFIG_SENSORS_ADP1050_REGULATOR)
> > > > +	.num_regulators =3D 1,
> > > > +	.reg_desc =3D adp1050_reg_desc,
> > > > +#endif
> > >
> > > Ditto, are the fields not defined without the symbol?
> >
> > They are, but they must be 0/NULL. PTR_IF() would be an alternative.
> > It is a bit odd to use it for a non-pointer, but it is type-agnostic,
> > so using it should be ok to avoid the #ifdefs. We should maybe adopt
> > that mechanism for other PMBus drivers.
>=20
> I see, thanks for elaboration on all of this.
>=20
> ...
>=20
> > > Please, split this patch to at least two:
> > > 1) Introduce chip_info;
> >
> > That would really be "Use driver data to point to chip info".
>=20
> I agree on the title, what I meant is the rough description of what shoul=
d be
> done in the change.
>=20
> > > 2) add new devices.
> >
> > I don't really care much about separating those two (after all, they
> > are related), but adding regulator support to the driver is a major
> > change and should be a separate patch. On top of that, it isn't even
> > mentioned in the patch description.
>=20
> Indeed, that's why I mentioned "at least" in the reply.

In this case, I will be separating this patch into two: one adding the new
devices and another adding regulator support. I will also be sticking to
using the #ifdefs but let me know if we should start using PTR_IF().

Thanks,
Cedric

