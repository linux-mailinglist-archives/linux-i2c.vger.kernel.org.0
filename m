Return-Path: <linux-i2c+bounces-12352-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7985EB2DFD7
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 16:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 513B81C4757E
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 14:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD80629ACDB;
	Wed, 20 Aug 2025 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=persistentsystems.com header.i=@persistentsystems.com header.b="l3sZ+PHR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00856c01.pphosted.com (mx0a-00856c01.pphosted.com [148.163.156.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE0B3FE7;
	Wed, 20 Aug 2025 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.220
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701240; cv=fail; b=N4lCZZ8CYs/GfSxkt5b7WNbuWwn5Evb36Ennbsj2ORptfv2sIyHjHl6m1NebioeLptnt6HGCoUIWqU2gNuBggLAPRRwGkMm1hNO+z8lo21LSjwkWkRFt7rdtLvOoz7WvH1X5QLWBWCeVnw3kh0TLLOdaIgQJPxEgnQpAA0/Wggw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701240; c=relaxed/simple;
	bh=vIP1gvSkDc3/hgBJrA/lgCA4SvtxbWCLgwD/5uspgQk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sc6bzIsevPhspE9jbgEZrh+2bmJQSaD/C429j9aaPzKA8pvc4/kkyFdLXcfMr/kgv61jyvGp50rfRpYK1jRPyELykwvu8jHnxbQCyzSLG9pALP5p7t3zqiulO++872ZDgod+yX3qb84BSiwNN0Oe3WX+Iq0fRbkshE8PmkLFxF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=persistentsystems.com; spf=pass smtp.mailfrom=persistentsystems.com; dkim=pass (2048-bit key) header.d=persistentsystems.com header.i=@persistentsystems.com header.b=l3sZ+PHR; arc=fail smtp.client-ip=148.163.156.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=persistentsystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=persistentsystems.com
Received: from pps.filterd (m0350632.ppops.net [127.0.0.1])
	by mx0a-00856c01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KCskwS023099;
	Wed, 20 Aug 2025 10:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	persistentsystems.com; h=cc:content-transfer-encoding
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps; bh=PQmUExCo//+H4rwaGeiFXZ5lJb9reN
	jN5y2lLMIs0dA=; b=l3sZ+PHRVBBYHby7T3LyFRjJNiCYOU0RPJmE34UO8YQMHo
	3AF8l0sDE1NKJDC0xW3AEjy376qeaN+Wi/2CMLgd/RW/YEOBUaqEdsDXSCho0Xu0
	hJRKHv9czJhA4PDLRauWwymb3TkHZm5dEOurXe3+HkRdlhA1FPUNGwnHaJsuP4gG
	3xhBiMDqW0/Y6uz3JQ/04xIL111tWV73JQEzEU+t2mRNHykt8NJLubyDIrjbOKlt
	CNVrzgC6EfY/Sju0nc3BOGlwBCs+nJoc93QxHqyVdH+S8l7pm4kop3aaluKjOtVw
	mNI0LRVL7W/rCvrvh3Xq0teQXeSe7Frg4lRQ0qcw==
Received: from sa9pr09cu002.outbound.protection.outlook.com (mail-southcentralusazon11010064.outbound.protection.outlook.com [40.93.193.64])
	by mx0a-00856c01.pphosted.com (PPS) with ESMTPS id 48n0v20a43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 10:47:15 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKKoEFdtcm6MYoEXk+zd1+EYYZnLPAKg4fNubcjhKNpvUAa1nebYkfsCIvOvlut5oGFvLi1t15dg3tmMqUXtV13YEQIX36FwSmEsjviPOb2dmNtx0so4/VN3lKwBYwrWKIVJ+ohyvZ6YXrs8ts3q+FMh43pYASBhFLPX/JrnxorPbOUF9RSReS3iI3BXDB4a3yGuxo9MTXVbQV+tB9PYDetrMtOkCJVgsjIa8jSv6J1Y3iqm3MrL+vUFeEdGBxHXoFjZstsQpXkYt36X78WwM1h9uvErNoWvGPx6kVlwDnXdg2Ni9tmjmUjCbfuh1Y1/n5PyvPoW1gsZQXTmLQVgMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQmUExCo//+H4rwaGeiFXZ5lJb9reNjN5y2lLMIs0dA=;
 b=q4OzLlTxIkxehcgT0w4ZwL5BVtpjsqJH2NaC232Xg75fs1fKwhQLqXEKkhuoBhpPSB1z/odM2MSG0PeFN/4DhOk1hvtd1cjHPpNyv6I4kVIaeOfUTYN3MOpZaEfcNRCY7yUvkWwTIfFdjxi+DO+TxTcQuP4j3r4hmNwZVZtMFPJGAMt2QEM3O1baiLXOsDlMxMtE+HvZZR7+DPNUbq5GEBMFx0ogN1QlLoThPnHTfHJLdZMrd8M06Syq1QArLsd0b7e14P5dBckl+UoOON3xD0fylwSnS9zdQtTd7tF3uc4NzCzptJYIEduRNpqqKv31zhuZVcYKHCnh0NVj14iAmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=persistentsystems.com; dmarc=pass action=none
 header.from=persistentsystems.com; dkim=pass header.d=persistentsystems.com;
 arc=none
Received: from SJ0PR09MB10822.namprd09.prod.outlook.com (2603:10b6:a03:513::6)
 by SA9PR09MB5936.namprd09.prod.outlook.com (2603:10b6:806:43::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 14:47:14 +0000
Received: from SJ0PR09MB10822.namprd09.prod.outlook.com
 ([fe80::b2eb:39f1:81a0:75eb]) by SJ0PR09MB10822.namprd09.prod.outlook.com
 ([fe80::b2eb:39f1:81a0:75eb%7]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 14:47:14 +0000
From: Feliks Peysakhov <fpeysakhov@persistentsystems.com>
To: "gupt21@gmail.com" <gupt21@gmail.com>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [BUG] hid-mcp2221: I2C timeouts cause permanent bus lockup
Thread-Topic: [BUG] hid-mcp2221: I2C timeouts cause permanent bus lockup
Thread-Index: AQHcETHVVcD9tCR4XE+722cARKrxbLRrlryQgAAJH5k=
Date: Wed, 20 Aug 2025 14:47:13 +0000
Message-ID:
 <SJ0PR09MB1082298BDEECF4744431DE726C433A@SJ0PR09MB10822.namprd09.prod.outlook.com>
References:
 <DS0PR09MB1082645B489866447C7166858C430A@DS0PR09MB10826.namprd09.prod.outlook.com>
 <SJ0PR09MB10822B683C8306136D37C01B9C433A@SJ0PR09MB10822.namprd09.prod.outlook.com>
In-Reply-To:
 <SJ0PR09MB10822B683C8306136D37C01B9C433A@SJ0PR09MB10822.namprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR09MB10822:EE_|SA9PR09MB5936:EE_
x-ms-office365-filtering-correlation-id: 23b95e24-7470-46f7-5676-08dddff8738a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?QAGwWRrZBORamkhnAXbL18v8OXB+Y6fHpTn+jAMWzGwcVMpXKa6UISgA9c?=
 =?iso-8859-1?Q?uze147zauPZaldA9/efsO3zC+wTTEXhS99w5TZz80caNjNu30tVEtXL2J/?=
 =?iso-8859-1?Q?eX1yQ5dSfKDQvJy/xROD1uF+535hoQfqIrVHJmoJXHkpqS1b3/EZUVSmKF?=
 =?iso-8859-1?Q?9lMGxZNhXvp5LGsbhLXkplOHJbiD1LRUmFdRUMoVL1jGZA1/yzFQjkRg/2?=
 =?iso-8859-1?Q?K+2rFVCxQhfgVyRvbUVQYSCivjg4zH/N+VwgOWoR9lClkzYW0rl5YXe7OK?=
 =?iso-8859-1?Q?SYFzZP/nCfJWp5bAaLYfvAkppCvZYLB0R1wLH5TkTkxenMRhYJN5X+I3I8?=
 =?iso-8859-1?Q?NXQawmYcS/S4uRnWkpXucHn77NTV2FO9NkkuuS6nJteWvHUQ+V8NqaZPoO?=
 =?iso-8859-1?Q?y18JgLbnjVweB2WHdqmydESQv1AEi/ZnmARYVSY7LpLL495CHFKwUIZ4bY?=
 =?iso-8859-1?Q?zUWjUoIsqtyjXTxRUvEd7tKO8ftbwisP+ntZ98CXJij2v59swjfSWrjclW?=
 =?iso-8859-1?Q?OP/P0QTkzZDDQBhEuC4LyQR+JRQjIP9CISdjwN0YMa1M4Um2C40QmjlNnR?=
 =?iso-8859-1?Q?hw14bOhLEiMOX7+LKpeQAVXRvUc1UvIaIPiEF7q2U8H5tK5YbD7SMAtmnT?=
 =?iso-8859-1?Q?0kQNQC7C12McSr3/FQu/O6HWR05h9sHneEodwQwzOpvSupovk/qs29DHNv?=
 =?iso-8859-1?Q?UCDLmnar3r9bLZ6ovyoPyyzg9xrqqehlfX0vuENsE4OcntMLENwbBsv/S3?=
 =?iso-8859-1?Q?yPcJJek4iaARDzT2R+y40h8ps82TPosw5thkzooRWZ1hrHZLgxyU4dgsa8?=
 =?iso-8859-1?Q?3QEmm06g/pRHKq+l0UmHyxb7hfZMcRz0MDZUG2g2GgNVqQ0LPva/6QBG55?=
 =?iso-8859-1?Q?MYcZuiW8hEP+ZCwWKkT6hMmq9vhDu2KJNOQBwEsbyi0GBkCZ0uTPORxus5?=
 =?iso-8859-1?Q?7Opc4jsfYIJ41ufr2g8yf4MQ3mjWuO79orKhujoZ9qB12EAq3zKry+tzS3?=
 =?iso-8859-1?Q?mnkNyUZxyBZ2XySLRBll3Lvx0fICFpaFPnjlQX4kvAi+kq/fSYBS4B6Ref?=
 =?iso-8859-1?Q?La2smYmh63yWeNe94It5BBc+IdcS20YbU0eejQP1J4qebgi9/Oqazv2SxT?=
 =?iso-8859-1?Q?89La4ILhQz2Fi9gJ6/Qa21sGErFBCRBt5yvyX4fA6o1rrXGZS5VVCFRFYY?=
 =?iso-8859-1?Q?utb8zbkk8mZ+lfPe9z6FlyIf+1zrb/+5EUXarXt2zwzPiokJy4Ry/7TlVa?=
 =?iso-8859-1?Q?FC3jRPN6SrV9dKwvS73l0C7kOtmcMfxYn3kh3h/mgtXPsWZSk9+pK09rKH?=
 =?iso-8859-1?Q?RgebrF6D2BIjqmjKDzkSMvjdRY4JhUcCytlgicl4LyMbGv7XlyThgjWQCp?=
 =?iso-8859-1?Q?Aq1U8+PeTOQNHMaMcrlOhxsGFHKr9PspLJFSbHkNDUk+ewgv7PuLRER6Et?=
 =?iso-8859-1?Q?No2McLb0RUqnOY8L258ZVPW7Au7aRfHpzYtvXfeVuveiWIKZrocTWO+MnI?=
 =?iso-8859-1?Q?Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR09MB10822.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vlguqC/c9JZ3QBP3uPzGA4YmfSKJhUKqdwj0qYBI2mS+THBrIZL2kXxqfX?=
 =?iso-8859-1?Q?H2aKWhkOGmLlihEY7WlV7rWsuY6Ekn7ss7YDRPKT7/OwU5IE8E3bX7+Nm7?=
 =?iso-8859-1?Q?pCwSwoZIRCSNYpvZwhFZMl3+Gvj4y1UJOW5zm9ZKvCMtQhD7j2B/rBOgUv?=
 =?iso-8859-1?Q?PuVIGlYbZURpLEgcbuqEdiEJJP2cnhq2hMtfbIGqSNVOoSSWRZJIfMqwox?=
 =?iso-8859-1?Q?SptEUA59NHNpXx+PoxnyTz98+WBHRBmtmlT6iX+kxLK6ztieBnRf+lqb7I?=
 =?iso-8859-1?Q?H/V+3+Um7xqpV+XeHGsq0tNG4zMVmgdG8IsdED/StAvQt5JGNdKCb1yObm?=
 =?iso-8859-1?Q?IG4T9oBYszs2cyXUchAdKyouWz+1bn1FLW4EPG2NsOnLlm9WQhoaOCG10J?=
 =?iso-8859-1?Q?oA/zYb7S9WGxzKrkthQcko+P+d3/+t8uj7e02dSdyRtIkRO8ZXsY6CTO4e?=
 =?iso-8859-1?Q?GO9Q5s5Bzs9sLGE4esNMy2OcIUyQVGiQC4LXKkUDjZL6Eyem7r04SKkxw/?=
 =?iso-8859-1?Q?qa7w5/xXpH/n4N8wgYfwJd3Mnfo7brAmcj7Kqa8yOYQbU71MT+WyyKIKNV?=
 =?iso-8859-1?Q?wWAyMKiv28mlxIu3GFY16QXJAh9HJEJ9pvNgjlRBZ80S9+XHqLZCpMr5Gp?=
 =?iso-8859-1?Q?zyLnrJWXeONMtHmv8xLxPWxHfWec/ZLbUC/p/8IeXdPC2SWYTrXYV/QPXG?=
 =?iso-8859-1?Q?5Hcg0MJVhNLD6D2jKEZerYyaE1Jn6MNRcYSwB3+KGkstikE9H+QqfN3gYU?=
 =?iso-8859-1?Q?ZV5irgWZWzfue3yPqEOse8O/QzeOoEafk9aktAh31sO9YEGyTyf7DnbRoK?=
 =?iso-8859-1?Q?PaiE5bOJLpJ6q3J2Hjr3EfyFrtjF7NHJUDadyaxq35I8ZnX5wxtiDrFnor?=
 =?iso-8859-1?Q?bPY2pZxg6TZORVtp6jw4w4NSZRKgy9igkpYYnM+tfuBRyKWVmxP7pUKMdp?=
 =?iso-8859-1?Q?+vMhE6Ufgbp+4L5n21uG6n7hAFqTJAww4AIH0uWxjdEtNMhC7qbXwayjo8?=
 =?iso-8859-1?Q?1o1ZtLyPp+XGvBpx4YbZr4CmA7PHGmLRcWI0TTNCcYjq3ynfm03lpQl8YU?=
 =?iso-8859-1?Q?YrYbAZG3GXahqjI1XqOpom0Qfsdachh6NWnVztzg5xOLQ+iLSCDD53tKt8?=
 =?iso-8859-1?Q?97G5TdUSAw5gVrTZ6XB1y//sIHU+GVSyG/s4Wj7yuZ3lLuJ8Y4abR9COgc?=
 =?iso-8859-1?Q?Bi85nVa/xFwXQq91SUR3Epi1ZRfoTEUhVGAUuWWNHH3Iv85reoItvzfk2t?=
 =?iso-8859-1?Q?5iDcns3S0Ai7UORwUZl/B7CerzWx66L1xJ4hekYISCTc/Z+IKhne8k9cBu?=
 =?iso-8859-1?Q?98HrO/LQANO5xMS6k08c/zo6U5vEO95d3n1WGHjGzlmUwV01VLfsuWM3a3?=
 =?iso-8859-1?Q?59N4LrfHLthwhPga0z4dyFIglQj122EKtbi7EZb4XtKauyTTrHvj4ihlpn?=
 =?iso-8859-1?Q?1qb7lgrmjMQ6/HvGmyla807HS81zV7jmctihrl3bmIKAHtdGu459NjhWy2?=
 =?iso-8859-1?Q?osfk6FfG14aX6+Xgg0YRl423o9RKVzsFppALqN7/JTeOpqbBgzw9K5LuR3?=
 =?iso-8859-1?Q?ILg7znJv7NITa/UZX7Vy35RMTT4g7CKM0CT3h/NnwN1M8TEOc+2m740gaE?=
 =?iso-8859-1?Q?kfnZmKcVMb6ZlhTfdTcLF5qwq+fiI6d6/OvjBxoW7lsFfGr7lzCQ+0LQ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b95e24-7470-46f7-5676-08dddff8738a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 14:47:13.9370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cf020604-ae4f-4402-9ee7-1b018a65703d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA9PR09MB5936
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX+tNqFzEx2LZc
 0OmmWMFwt0EFtEbL9p0CyxNw2n7C++UHk7Mo2GDvtxg+IzKmzaOeg62OM2BzNTI1cjM+x+sOZXV
 2DrtfGq/QqzuPQ7ArmyWjsenqzeXBM0f6gCzzguEUIXU9MiRGy0WQTpwwUTe38TdPWb5qbo0oS1
 4s+Ext6E3ftjiXEoXV3IG9i9ZDfpOzYLZCxAMlOEgfAQB37Xe39vJVWbWHRSA2/uudmP2aAMlpH
 Qj7XxT/eBRlL9WTgDYi8gjZbygZVEuHpuOJR+62v7PW0eSTnoSF1uci1jPZhk45meVXSOdQL02F
 c5nvYmkAxngtXm0PudaN+yCiodjUaT3nBunytPpk5CuC3uijz26yYx9DAs2ItMCrHGByaMmo6pd
 XiEhcI3Zifv2cf8+ns8F1tHXM2HoMQ==
X-Proofpoint-GUID: xGs9vk8emX2JsaDC4gss2x8bm1XiJOC_
X-Proofpoint-ORIG-GUID: xGs9vk8emX2JsaDC4gss2x8bm1XiJOC_
X-Authority-Analysis: v=2.4 cv=GpMbOk1C c=1 sm=1 tr=0 ts=68a5dff3 cx=c_pps
 a=cLuZufyk34MbHPgqdTxtfw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
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

