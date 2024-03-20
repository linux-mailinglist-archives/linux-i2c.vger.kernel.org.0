Return-Path: <linux-i2c+bounces-2452-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 825F18812A2
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 14:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36F37283FEB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 13:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37954AEDA;
	Wed, 20 Mar 2024 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Z9WCJCnN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C47339AF4;
	Wed, 20 Mar 2024 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710942264; cv=fail; b=ai2p98JCCLo9HABaCycR/uOkCsu1GPmKXLyv/bFZ1zwPslaX9OBRasFRxAn7s4FWDA+oQ3TjKyEhPtFzObch7d+tTxkj4DkU/wwfM4EH1zjaf4UafcXZZ3shAv7ZPosHTHCTvNPZ4jtcL1NKfDVPGIXFoA5KQj4Pu6z7ZwYxb2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710942264; c=relaxed/simple;
	bh=8j/G1HZRBB1QlmcSjneHncCKP/TQRAeNzQpSDwUDAYw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jUed8cG/je6Ngi4yETBhYlVY7xSHP2YK+bKQuhX84HMCro1bP1UDP+QLCE601iHBaGdD1gvLU6Wlb0zCHf0PWE1XVus6g7SMjNnH+R8FQtCAX+EzIPlz8X9nBgnuNYOQrlgb5vdo/ONIKgy7cemNwBQKaIRuFFX/T/tDZxn/tsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Z9WCJCnN; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42KC2ZQt024287;
	Wed, 20 Mar 2024 09:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=DKIM;
	 bh=ytpGb+naXW3DvEieU50CJn9v+yTZ/zVBH7wPK0HWNRE=; b=Z9WCJCnNhYCO
	zmLwyzp06cp23r/BHeCwE9QCET984ARS9G7WLUN2ELl/loNlYqj2ynjfk/mBljH7
	UUwiUweFzrdgov3AeYIYZNVJsAp0h+aE7kcpG/hLJKGOFfT56vemVKd5zavAvnT7
	ZKdFvFp1hUFjiQ6vDPivb6m4VQ4mDEJk8nID4zd5ZP0OLuFSqMKpxLf5EbSaZrYi
	zDZLt2SrcIXD2tvlKtMqGf18HeVl2UNaLOHL1VAKpADNPrKhQTvbHGY3OmBPtXrT
	Hai7XiNbIxE7J7ReYCcm95Yq6xKqI0I4/kfn9o3HTIFaIrKPVcI9Ydalim/jHg7k
	h9sU72FSDA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3wyyf5g689-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 09:05:08 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrC1p4mYSzLxHEPXofTLrNFBUxzImuqlr51HLPoo6aU8STm87aWqdzfPsj9AqYONcWSHKrnuEUqF7AEQO1l9BBIfq9oaOwh5Gm7t7sG+YprdgvzPLVaRD7/cMpn6dP8StkOutvPh7E6NCqf/iLKNGkl1kNvz0psOLjU26iBveDANCw71bQUu2WQ8LwKkFKhN9Z0XGtJ+5OB2BBo8x9ofDeQH6ScD+EyJORNr0J4G2HRmH+69MLtW2/PFdZXr+8s15HMicPcyRYN0ta462kSjNtePXMwRbsdCdxYM+Oa1ZICBkf6BNTtQDI5bwB/pEXIxctzlvH2VL/9SoSMTr4ZW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytpGb+naXW3DvEieU50CJn9v+yTZ/zVBH7wPK0HWNRE=;
 b=Zmj/XHWWLAzcA8TNpOF/9ZnXM8SOmX+1Y7vI5NBz3OoooJ4KJFggN9L6PPof/SE+0sJIoj72sBlzv/VPINJwVAxJnj1ppQ3cm8htxsVSxv7xiK7HtZy9NbRa0GG/IAl5z30+OlEkZhNTLsUXWNiNTmvjmz5FDf2tL7A/VdVVxoBF8lpBVxG5lRWKdJAq30EJGTfpcT4Up15Gqzgc7p7Bkmy3Q5Jh8jspIpeFRB9F3MVYUuBxUd9c9lN4wxqoNytseFvy3TzqLkXeuKKYVkynU7JozSOS2yXo1u75Ev2Bj7USh4bllFJgKuB3itUx9k1vdRlWc6Wd2KWYFo0PJDpluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SA1PR03MB6499.namprd03.prod.outlook.com (2603:10b6:806:1c6::8)
 by PH0PR03MB6740.namprd03.prod.outlook.com (2603:10b6:510:117::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.34; Wed, 20 Mar
 2024 13:05:05 +0000
Received: from SA1PR03MB6499.namprd03.prod.outlook.com
 ([fe80::44:7752:4ad:9382]) by SA1PR03MB6499.namprd03.prod.outlook.com
 ([fe80::44:7752:4ad:9382%4]) with mapi id 15.20.7386.031; Wed, 20 Mar 2024
 13:05:05 +0000
From: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>,
        Jean Delvare
	<jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
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
Thread-Index: AQHaesZY8/L4JyPv/0i6z0YwzuVy6rFAmCIw
Date: Wed, 20 Mar 2024 13:05:05 +0000
Message-ID: 
 <SA1PR03MB6499527C7BEE83A3E4EE6AFBF7332@SA1PR03MB6499.namprd03.prod.outlook.com>
References: <20240320125727.5615-1-radu.sabau@analog.com>
In-Reply-To: <20240320125727.5615-1-radu.sabau@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccnNhYnUyXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctNzY5YmJjMzctZTZiYS0xMWVlLWE1YTEtOGMwNGJh?=
 =?us-ascii?Q?ODVkZjE2XGFtZS10ZXN0XDc2OWJiYzM5LWU2YmEtMTFlZS1hNWExLThjMDRi?=
 =?us-ascii?Q?YTg1ZGYxNmJvZHkudHh0IiBzej0iMTI1NjIiIHQ9IjEzMzU1NDEzNTAzMzUx?=
 =?us-ascii?Q?MTk4MSIgaD0iL0x6dklSWS9pZU9GZzRkeWR6bHV5VDBGYnRnPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBRW9DQUFB?=
 =?us-ascii?Q?dEFQVTR4M3JhQVE5WU5yMjhjYjV1RDFnMnZieHh2bTREQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBRGFBUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUFsR1RHVmdBQUFBQUFBQUFBQUFBQUFKNEFBQUJoQUdRQWFR?=
 =?us-ascii?Q?QmZBSE1BWlFCakFIVUFjZ0JsQUY4QWNBQnlBRzhBYWdCbEFHTUFkQUJ6QUY4?=
 =?us-ascii?Q?QVpnQmhBR3dBY3dCbEFGOEFaZ0J2QUhNQWFRQjBBR2tBZGdCbEFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHRUFaQUJwQUY4QWN3QmxBR01BZFFC?=
 =?us-ascii?Q?eUFHVUFYd0J3QUhJQWJ3QnFBR1VBWXdCMEFITUFYd0IwQUdrQVpRQnlBREVB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWVFCa0FHa0FYd0J6QUdVQVl3QjFBSElBWlFCZkFIQUFjZ0J2?=
 =?us-ascii?Q?QUdvQVpRQmpBSFFBY3dCZkFIUUFhUUJsQUhJQU1nQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUE9PSIvPjwvbWV0?=
 =?us-ascii?Q?YT4=3D?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR03MB6499:EE_|PH0PR03MB6740:EE_
x-ms-office365-filtering-correlation-id: ac187ea9-4de8-432d-7dc2-08dc48de5cb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iIZE6+o9tStEbijv+03XQcjEYCZgkKMGd4u8FOrbpnBE29orRIHqLUagItNEOqAU+FUJFaFVpoFqUi/1J4KRvOrPEoG+2JaJuvRRP9V5MYHnpvK2yyzc8WANdRz4mLT8lYUOB0SS/ug8rbY+nTpzNiBEk7OLjE7YD/TgaFZYotaScwIDt7XfD6RCdhYNLsDfxem+8SUGm8re5IlebSqSYY8akfJgLx8ThijQlJ/zuz/mpHjQt4eVVaFH4Fbe6rj2KlrkvJx9VjW3i+XCo6Mg9CCfMPD7pQ8srVgWWx4fpr00rzXGxqB0xW3jras5bbQ5dRYlHt3FKghpgPHGkdMvd2ghKpnL5w1X6V1APOI40IFGUqUwbqqe34txP1FnTEVAu+dWXzWmHsrc/1sI6AOf+CQZOp02XQk1j1UTBn9dsHF0IPaOJFLH2hAMQLGAIgA2sVJw9PE8BgMKw9l/YYyCdBrHbXWxIDFkj6N0/ReMFdEWLlc19o8P2OVzwH1dO/P04D1jmijIv2+7OHtM9PZYDRaU+VSiMNmDtJBx1XxKi4eAOQGvScQ9UT/XCA7VTDoIC3FLOEoIGvrNITtMi4vvzZH6gAfaCqxb7A2dajqamStyjs9emSvFZEybq+ICmjvA+RAczLTQrlxmNHL6m7AB9cV88W8ZbqfBQqpATHJock3xUzGkpr7gO3RwImwfh/jE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR03MB6499.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(366007)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?PjwWx+ddBAA1IHDZaUV10n+3JfgFwPaPlYi6FTFbavYk7Rj6vmUqbUk7Ru48?=
 =?us-ascii?Q?t6Vor/AFHFBBAWS6kSXqdvJO44yv5GYv6jkuUKV91cvQcTTEi0B0WLLJ2hsv?=
 =?us-ascii?Q?vmYmQEljBsvXAgEbJA8Qlc5uabVjxl0rDcLtlh9EmZyUBSdEMMlCWqy4fv9y?=
 =?us-ascii?Q?zZ8FLPmko0fxgXodRG9+JhXiO0Q/sjqJ/GnGEm09tnNxpPdvmnC1U55ZRE9t?=
 =?us-ascii?Q?uc5TEzpir2ZgFzNhMghG5i9ZAwFgF8DX1W7lNRgwa3ATtYEZG6JQUVaeEabr?=
 =?us-ascii?Q?W8AIoBFsD5Frjghf0q5zI6pv6g5If4vptyyL8jRxbuwuuUKC9xMWAnmPb80/?=
 =?us-ascii?Q?XG+MrYk/SzAl+vSvRt1pkSbhiJ95rCcW2mwGx2fGkPTD0MRU2sJ1Ztjn3B8l?=
 =?us-ascii?Q?go8hEnNcCcdV+X3yYVLR6YvhZ9rq74nt33zUgQ8D+yVAOML2XJVElQfnvKKi?=
 =?us-ascii?Q?7MR7/1+0rpa+SUCi4BLTtzCEUGor7Ti551UTIixEUoRWOJW+G1vmbBbMZpW6?=
 =?us-ascii?Q?73qvC4Cfh0kDUOEl7ndATiHYsJrRBG4ZzJT9xO7vgk9mBVwxf+fALKKv1M2u?=
 =?us-ascii?Q?SoqeAwlj+h7gDXwVCW4cCZ6ATf9wLJSHMRsjsvcAXbgR5BMzBseTPCqK/u7k?=
 =?us-ascii?Q?bb5xtlk0S3slemZcAqrKpITf/qOAlhxgG3HYljBs/5tZhLfS4FK4T/RXquEE?=
 =?us-ascii?Q?D8IElb4aR+/e6tY3t0/US3Iig4B84OhpKaBArjRbdZoCM5sRz0fj5rU2iMlf?=
 =?us-ascii?Q?0p7jrZ0o42fkn7qxvfbFNZrwQ6IliEqcltPz9lUSXUuTXMlzx8SEit8eKh2C?=
 =?us-ascii?Q?AZxz2/Tg+LdZ1TOnzsywVZLoeVMzgwoscvrozzsP2ubLii7gBfolFdlwKl85?=
 =?us-ascii?Q?tcuUTSN6s7aiTl3xl1S8TxN8wUaOUvqz/0mMcVFLRPkasDkJLasFKOHp8Tb2?=
 =?us-ascii?Q?EStszrLVsVqdDvvNC/NOhK0MfF6Q8qLUvQXYFFbxIl+1Og4jDGgGUys/Cqbv?=
 =?us-ascii?Q?VSIECJW1g1P84vR1VfD9/PO+hr7rQfbFg2RNsdqMhA9suMXkDtnUcR1RpGHw?=
 =?us-ascii?Q?MU7J2tu97vSIJp/t+7FXW6158sN0zRz3I6Uq0o9je8ZiM+Jl/Yn8ddcpWpRi?=
 =?us-ascii?Q?PSdgqDBHy2nljzxZ+kYOEK484nM4FMRYbQJC9VSAGyYNcEXErJ58IHQMVCoq?=
 =?us-ascii?Q?Y+LlyjZmj8l2f9UWyKE8Vtnf2tKM2SnklzHPRIgP+BaZO0TCiBOjGJ+kmJtd?=
 =?us-ascii?Q?ZDX1w20ENeVsbWJ0uOxeG+kes1KvesgGxfPN1dwH6g3ofE2l8dhKGsoHfMAM?=
 =?us-ascii?Q?UPTTbIiX/M8Z5ai3gXsOo6Ve4XmJxc7ju8JUF5gDur7S6i2rRqFrYhSPIMs3?=
 =?us-ascii?Q?TMjHryvLgz0BqNzglHgaHbGq3myrAsvmP1qwAs+eiYV03W0voWAipSSmOIzi?=
 =?us-ascii?Q?tjnD4aUpyaBE9us8lMjAhyYt2oXST7M23dUwfVXQO24zYHkFHRax4BiR9GWZ?=
 =?us-ascii?Q?NevzsrJbNecQ8xVfETWnd0JNudjt5HhhtIJitdRh7EZ5/fIbJUvlyNquc7sI?=
 =?us-ascii?Q?mwwq5yRzj9JUVgtWPoTfpZLJNIivLctDvZJk6Me2?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ac187ea9-4de8-432d-7dc2-08dc48de5cb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 13:05:05.4940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TJ5o4O/eBKJo3/MHmNX964c2RGVMTQxMskLUj/crXFNcTBSt39zzcZ1xk5lmIgqP9xpFu1IAaZg0eZgrOINwtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6740
X-Proofpoint-GUID: NPX75es52fE7nJb4LJEetVXCW8t-8zzo
X-Proofpoint-ORIG-GUID: NPX75es52fE7nJb4LJEetVXCW8t-8zzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_08,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403200103



> -----Original Message-----
> From: Radu Sabau <radu.sabau@analog.com>
> Sent: Wednesday, March 20, 2024 2:57 PM
> To: Jean Delvare <jdelvare@suse.com>; Guenter Roeck <linux@roeck-us.net>;=
 Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>; =
Jonathan Corbet <corbet@lwn.net>; Delphine CC Chiu
> <Delphine_CC_Chiu@Wiwynn.com>; Sabau, Radu bogdan <Radu.Sabau@analog.com>=
; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-doc@vger.=
kernel.org; linux-i2c@vger.kernel.org
> Subject: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: adp1050: add bindings
>=20
> Add dt-bindings for adp1050 digital controller for isolated power supply
> with pmbus interface voltage, current and temperature monitor.
>=20
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
> v3:
>  *Remove extra line before '$id'.
>  *Remove 'address-cells' and 'size-cells' from adp1050 node.
>  *Rename adp1050 node to generic name.
>  *Fix typo from 'adress-cells' to 'address-cells' causing errors in the
>   dt-bindings build.
> v2:
>  *Fix identation for example.
>  *Remove 'adi,vin-scale-monitor' and 'iin-scale-monitor' since they are n=
ot used
>   anymore.
>  *Fix typo for 'compatbile' to 'compatible'.
>  *Add blank line under datasheet link.
> ---
>  .../bindings/hwmon/pmbus/adi,adp1050.yaml     | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,adp=
1050.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.ya=
ml
> b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> new file mode 100644
> index 000000000000..42cafd8fec25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: https://devicetree.org/schemas/hwmon/pmbus/adi,adp1050.yaml#
> +$schema: https://devicetree.org/meta-schemes/core.yaml#
> +
> +title: Analog Devices ADP1050 digital controller with PMBus interface
> +
> +maintainers:
> +  - Radu Sabau <radu.sabau@analog.com>
> +
> +description: |
> +   The ADP1050 is used to monitor system voltages, currents and temperat=
ures.
> +   Through the PMBus interface, the ADP1050 targets isolated power suppl=
ies
> +   and has four individual monitors for input/output voltage, input curr=
ent
> +   and temperature.
> +   Datasheet:
> +     https://www.analog.com/en/products/adp1050.html
> +
> +properties:
> +  compatible:
> +    const: adi,adp1050
> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vcc-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        clock-frequency =3D <100000>;
> +
> +        hwmon@70 {
> +            compatible =3D "adi,adp1050";
> +            reg =3D <0x70>;
> +            vcc-supply =3D <&vcc>;
> +        };
> +    };
> +...

Results of bindings testing :

  DTEX    Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example=
.dts
  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
Traceback (most recent call last):
  File "/home/radu/.local/lib/python3.10/site-packages/jsonschema/validator=
s.py", line 912, in resolve_from_url
    document =3D self.resolve_remote(url)
  File "/home/radu/.local/lib/python3.10/site-packages/jsonschema/validator=
s.py", line 1015, in resolve_remote
    result =3D requests.get(uri).json()
  File "/usr/lib/python3/dist-packages/requests/models.py", line 900, in js=
on
    return complexjson.loads(self.text, **kwargs)
  File "/usr/lib/python3.10/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
  File "/usr/lib/python3.10/json/decoder.py", line 337, in decode
    obj, end =3D self.raw_decode(s, idx=3D_w(s, 0).end())
  File "/usr/lib/python3.10/json/decoder.py", line 355, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)


During handling of the above exception, another exception occurred:


Traceback (most recent call last):
  File "/home/radu/.local/bin/dt-doc-validate", line 8, in <module>
    sys.exit(main())
  File "/home/radu/.local/lib/python3.10/site-packages/dtschema/doc_validat=
e.py", line 66, in main
    ret |=3D check_doc(f)
  File "/home/radu/.local/lib/python3.10/site-packages/dtschema/doc_validat=
e.py", line 29, in check_doc
    for error in sorted(dtsch.iter_errors(), key=3Dlambda e: e.linecol):
  File "/home/radu/.local/lib/python3.10/site-packages/dtschema/schema.py",=
 line 120, in iter_errors
    meta_schema =3D self.resolver.resolve_from_url(self['$schema'])
  File "/home/radu/.local/lib/python3.10/site-packages/jsonschema/validator=
s.py", line 914, in resolve_from_url
    raise exceptions.RefResolutionError(exc)
jsonschema.exceptions.RefResolutionError: Expecting value: line 1 column 1 =
(char 0)
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
/home/radu/torvalds/linux/Documentation/devicetree/bindings/net/snps,dwmac.=
yaml: mac-mode: missing type definition
  DTC_CHK Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example=
.dtb

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 43b39956694a..b45753e94756 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -479,6 +479,13 @@ L:	linux-wireless@vger.kernel.org
>  S:	Orphan
>  F:	drivers/net/wireless/admtek/adm8211.*
>=20
> +ADP1050 HARDWARE MONITOR DRIVER
> +M:	Radu Sabau <radu.sabau@analog.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +W:	https://ez.analog.com/linux-software-drivers
> +F:	Dcumentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> +
>  ADP1653 FLASH CONTROLLER DRIVER
>  M:	Sakari Ailus <sakari.ailus@iki.fi>
>  L:	linux-media@vger.kernel.org
> --
> 2.34.1


