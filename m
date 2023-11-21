Return-Path: <linux-i2c+bounces-374-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 899997F35B6
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 19:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC5B21C20FB4
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 18:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFEF22092;
	Tue, 21 Nov 2023 18:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="EYwRqnNn";
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="e6FsFpOg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com [67.231.150.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300BD193
	for <linux-i2c@vger.kernel.org>; Tue, 21 Nov 2023 10:11:36 -0800 (PST)
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
	by mx0c-0054df01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3ALGjfjk008745;
	Tue, 21 Nov 2023 13:11:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	selector2; bh=5mGu5VrTZ1uxhDkQbpjBnmRqw6c/pX66NcJSf0+xmS4=; b=EY
	wRqnNnpRII7q8+Eugpk+Uz8QtKZJzX4qPZWst1HBpSMXufh9smz+u53f7vcWR6m9
	U8/6KTZ2ZtHon6GvMttqhfV1zTTJSnMpwogGPLY3vB1bAaoSc2mNG8We35Z3gKt2
	rBAqkznLZkNuOvV+yaWaXG+1yelotOjkxjh3yS381B3F1BDFPNtwGrJAOGC7XMjn
	ZQ9nNC6oP8WW8VlN5Fo1vFypuSWxuI510MJ1gZGQcQghUSaITzwddGx/nqZhPP+o
	PseWgRW45wvdqUiRnUYxlJv9/fCac69Wg6zpgAgVtUP7wUKmREao91izbnGqdcXb
	Vaov2+DehUof8//lGXYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	selector1; bh=5mGu5VrTZ1uxhDkQbpjBnmRqw6c/pX66NcJSf0+xmS4=; b=e6
	FsFpOgO2ASBO0QmsRrWVL2WGyLrONvcb09K8NJnr7wpELPARSNiLJlTQQ6c3MFL3
	MlwrO7ZUsa++GrAbsIG0YCvDxG95FfgcdtZjiKygqAIXBQJuuFyp1amIM54RcaKt
	4J5Drwuizh+edFrjiS88XOHB8J/wjoqnh1mH4zjOi5tW0SYhvaveTL8O4Lc6Em/w
	Ajxf3NiQsPJ3zsHw/Krc/4dxxrFk/mTS8ZOfVwXIMTDbbTgpO2lriXr+wd4X4GMb
	kICK5d1SGLXQh9YZU57eoHdl23eO4oAfwZ2cbJoeP0PmqHGFY/TFT05+ttZoFz/S
	Lphw2oDs0wu+R8nuFyWA==
Received: from can01-yqb-obe.outbound.protection.outlook.com (mail-yqbcan01lp2232.outbound.protection.outlook.com [104.47.75.232])
	by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3ueu25adec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 13:11:18 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PY7huSQCtM38mnsUeEVqx2nt1WnmPkOxneuyfY/A3tEctpxZFL+EUY9CB5K0OlD6Cz/pvO0XSIXsIpKbCVaTIOCvldCu8V0hkEs/PgzhCnWZTw+eK4Ji+0imq5P2pGFCkp1xjWXCAqxwjRp6uLGga7STFzv+2oXI2PS2Xv7D/JmgCvVQIhgdazUYlvQ4Q0G1CCeEtYo5GvB36kUbe11kF0z8Ahbpuetqjuv9I4ZTbambrAlucRNgTgXP8lh2ldWPvjnbqjpVC5gRDtWck2hYM+VAW54CnxG4MkthqXf1WUiG+LH9ULi1G7rZC7e0DiEwkFjtRE9Ne3akSmdGM/cbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mGu5VrTZ1uxhDkQbpjBnmRqw6c/pX66NcJSf0+xmS4=;
 b=k5D4/laRAfZ7Yfi1qGIaZsyrEz2ywsJ1DKR3mSNYOdYEyXnfrBArEWpd6dBCsZml0kaEM472ScZB6MUn7hwhno5z+iVaWpPLrYkRUzj1+cymjHq9hZGbI/AdBEE5+WLtGy5DPdXMl+PYjLca4C9W3301rxsrqtuKoz6Bk3wsL1UKytGrPJOF1ZjPcv5z02frsRJgTYMhGi0Y5Pjek9qQJQL5UyBOljNKD49hFQBUBso7n4PYkJ4jdpzo7avDpv2/XovkU3dC0YMgoJpOzGifvVFZvtQDPecefD4u6n2IPozmHNlHAkdxsgyH8+3RciGlzdmzkcN/vuWSZMI2YxEu7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YT3PR01MB9202.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:7f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Tue, 21 Nov
 2023 18:11:16 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af%5]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 18:11:16 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "michal.simek@amd.com" <michal.simek@amd.com>,
        "ben-linux@fluff.org"
	<ben-linux@fluff.org>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 1/2] i2c: xiic: Wait for TX empty to avoid missed TX NAKs
Thread-Topic: [PATCH v2 1/2] i2c: xiic: Wait for TX empty to avoid missed TX
 NAKs
Thread-Index: AQHaHKYehxqHQRxHX0um/MNCnhIwPA==
Date: Tue, 21 Nov 2023 18:11:16 +0000
Message-ID: <20231121180855.1278717-2-robert.hancock@calian.com>
References: <20231121180855.1278717-1-robert.hancock@calian.com>
In-Reply-To: <20231121180855.1278717-1-robert.hancock@calian.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB8838:EE_|YT3PR01MB9202:EE_
x-ms-office365-filtering-correlation-id: ec6c836f-4141-4463-9f37-08dbeabd40ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lc6/5Ou5VF3Nez3o7SrI+aP2mmE0mXIk5lrUTwq51AKA8to0oTANtYRddC63sUfwRiKFtoxZdnFRDQK6PIAGUKOCClSTWgh02nZBgwYy5OUXQYVbx0+SEK3+6rKORtHkhmu5F5dQONRYgopqjC04OeZ2BIFG6jJ8PkhjU2tgDBouEyxQW1f1ShYrMWO+HHI3EBkfzksz3wZdpETNiw/qaSFCNVnK3Ru6B6iIyOZEhySzmZtwa54eQsz2VJiwBRRfCvQP1wcXjX5/T9+iL4xRtwwwXJh4bULZs52Sk9WF/Fhoa7rDt39QYveXdACaJOjHJFmT/+ACyF0ROg6iLkhdsXErxPTW2FbZRpWJjQuVnvCee6Zck1TLuS3+lzSF9NDAsuYJUONVLPIUAcxQiIx8vDC14vrYB7d6owFqCNQG8uz4FqCjq/TVJDzLUoqKYsARkjzWPOyXHkF5c5Z8exRSOpnaeD9kWs95HnMivOUD+/od3LvNQaJgK4i/Ax5UUpJHqMnIZmM9rNtmkABFtaI+XKvJ8/r3T7YsXEbk6sa89cOq45fTKXx0ikY9mRinTko68RVpYczxev8lyRaH/c+uHFN9/nya13E1R/zfVc39dV+CS+NNSYzylfDeJdG9wy6j
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(6512007)(71200400001)(6486002)(478600001)(122000001)(6506007)(316002)(8936002)(8676002)(4326008)(26005)(38100700002)(66476007)(2616005)(110136005)(91956017)(76116006)(66946007)(66446008)(66556008)(64756008)(54906003)(83380400001)(107886003)(1076003)(44832011)(5660300002)(2906002)(41300700001)(86362001)(36756003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?dma8K+JIxYldP3hspeV7b99/9xmuaSzJUu8iGibZ0vZt/XMyChAkri3LuK?=
 =?iso-8859-1?Q?CNXrwjMykAS5AWxiZWbkO6ajg4LrLXKD5gv1dG2sGD0XGfNJ8GLb5gtp5G?=
 =?iso-8859-1?Q?Hfde20ZAWMxkqUD45awmL5q2ezIz0r4nG1SRSkDYDYBSCgDWAQMSq0JZIa?=
 =?iso-8859-1?Q?Aw1FZbHtA42PUm9Q54MT1bkjNLnRr/BsCL7AVhH9joEVWdZxKPlL91NC/T?=
 =?iso-8859-1?Q?GPXvoVVC7Q0tO47r5UaJ7Dfydv5x0w3eE5rdRSNEtmXqBWnTjyqbK7aKRL?=
 =?iso-8859-1?Q?PzzKGr07LoN0d2pRDD1kTBtx49/JkDaAGq+he/+03L5bosEVBMiIqMfCMN?=
 =?iso-8859-1?Q?70ewd1humaA7s8xBFhQl/PM4DJgXUmxv31gfliCi8Vx3wDs9FTQxxEc4iV?=
 =?iso-8859-1?Q?XngrkqBsAVJqQK4qRR3wxRPWc4ilNGn0E9xc8iEyuR5KjQle3tnQE4ONgI?=
 =?iso-8859-1?Q?va/IP+GkAk9Z0ovMURoW67CQVXiFxDJhlnyjy+RWzCW497Ztug5pGEsMaP?=
 =?iso-8859-1?Q?k/3HxXtTSGdV1vaIPrittWKQbEILrmsJAIuw8WjX2cxZG09MipdDtTS7C1?=
 =?iso-8859-1?Q?WwUuw8URoRBq4mBkwUlSybWerfAwJIywYjiQ8pux8kRCLJN2zaB+czgfhF?=
 =?iso-8859-1?Q?FacdRQfzMsMSnuG0gPXofffcTkSDZK2PkriwO03p3OgcReQhJ20u656NRZ?=
 =?iso-8859-1?Q?9s3zPyjzmG0EbJoQudtGX+hU0dA5AIiOICeANFnJNov3ukeM7xro71ioIs?=
 =?iso-8859-1?Q?5YkWPQW1IXLWxjxuwueMFFTdEDqtKUFbrUTNrSWM1ngvrDTmUts46jNmI0?=
 =?iso-8859-1?Q?48BkGhscZeq/wdTfA1qL56bj4nxijiQJJY7VM4BMBXCFHVujf/Lrwo9vPN?=
 =?iso-8859-1?Q?lVC0DxBl7wcgqxUNwzENIqj0qEjz352skOxhHWzbVUhazGQhSXLtkpW4Oi?=
 =?iso-8859-1?Q?xQHJYvjeDdqa+4egu8A5yVSe/aC1TasfF+0f69cq32l6b4loh9e1N5hkWA?=
 =?iso-8859-1?Q?rRVdXEYKrOxVemhyGl9eNAgh0WNGB7l1FwDZsAj1wGZE5yUiJavImm0cif?=
 =?iso-8859-1?Q?QuEYfrZGDd+kwsDontkPOAsy9yqYzPCYUsFIHdcdOtVMmb96OLwFIy3p/3?=
 =?iso-8859-1?Q?89CLlzDujcWrI6LTLR4MXliLmP17gm5mOVUMupKbnNgfY6YqNyUmeJ9DAP?=
 =?iso-8859-1?Q?Ycj0ex0REg3bZUwljBq8mDgM+hP5KKxxTw1mOWliiEIpqho6B76dIZ3HnB?=
 =?iso-8859-1?Q?UylGUOhNHO0NAsNS7E5g03G7+JjPRDwbO5LBA+qroW0GG09GoblL3GQ+7t?=
 =?iso-8859-1?Q?KqLW+8hJMsswyKH0Zew2ihRbOf6kGUNNk/nncSp6yUcNgaQW88kGL5Wtd0?=
 =?iso-8859-1?Q?RQa/BHIN7Hmajcb1nIPC1z5wkElvy0u+vSEw6MxM4POQgvJdak+t5+bw9e?=
 =?iso-8859-1?Q?ZKJbpbKFpMhckNrODkdmDAY+GNmHXDM+TcQihT6BT41wIfYzJNlJX32u4K?=
 =?iso-8859-1?Q?mR9TnSnPMPYWrsjNjb5O9oKRLCKPC6BWrO3+yozw5e/jPXR+0Fmn2FiYDo?=
 =?iso-8859-1?Q?4MIG5h+bWZsOnEDeXukY9gc2/S1AiYd+bJCeXjCmJCIxXGxslIgaPsPJWj?=
 =?iso-8859-1?Q?bGvAPbVkqDYT6qykxWLKvBPywmCqKlTxbjXLyWlB7MWe0QQB+rB/eOtw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	wfQgVTJPhZ6pAkJyHBW6FxoEFb536tQ3yZXwiA1aeShhhnWTzEQxzDyqSgXZBOVceDNAaxAXj8FNBzUUnygnICzATKab2O9RQ/z6ce8R8ixxbD5QVFNvdkRPrzcaJkg1Qr3gtbOrA2J7QmyWYfS3/n8lygWNfom+QXXw4YT2UN0cPRRdWxR4UM6M4LLhlKPNi/1t4cdyiWyQvAjUrv3oTCnesM9xNEVjmztK+WvisnxWiazw1Natf7KnS8w2RedK2Lq92ilPuNJEFenwEA1WPfklXYb7xbqNy3/5V66hT7AN3bgozVo2I3/tt98/xosMIHSV0KVSmoRgFM09usflxIgLGJliF7ob7ozbeU5KjAmzoa6dwh+IBvFj+qrdPlEJrXGa9xZ2mZDeFHTeTLCzc99MZ2mnOIBxUxvtVFKSLm30X2TbcQAfU05+O/3DRtybjRUqy0ZqKIKRuGREEp/1jiZHNLIl2GQf7rrofDQF+dudVuFnB5Wil2/ciznQAkoq/+LkftgW8pSvJSBd+U+ab66hGVXxWnNt1VXH6q73csQ3UwaRX2bR+Qd1p4Gg171mfXRKmzygEl2KP+TqquMuUnrg/u6eCMIcQTmC+OsPOrVyyy3ODWUmCiHVwCLwZryca2upvzpdQ4DRLRQleetqbdeUiMM6yBglfahV9tU1Gk1JfW5CVpbOVNgsCxRKwdKk3KBJdJyqL/3E2OkSzdQuFlTZ8WSToet+QinWFTfmMqmDcF1EmoC+OWG5BiS2EfY3n0X0Qgkr02ajfaVW2vIOaBIKN9kwDWh8ZpMGfBFuxGsMWRCoaTMU6VrNfeh2fyjJESI6EJtwPc/NAAcMVyxtixBY6ERAQw47LJ1uqoI5Ixxl1O8bnhtG+FL91267TdjVPL1E48ImlDusMpOhRGGrUrW/oG0yvObYb4tvZcT7xmk=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6c836f-4141-4463-9f37-08dbeabd40ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 18:11:16.1658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HBCYTJrDPRCjaWSH8IGCxIbOtLnteVKlmZSV6uOIujR5t+Mnht60wusEcCH2kTHE9IldQk0ZHdwBKERWwgCBtWApSzjv0CZ+x45Ii1IpLWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB9202
X-Proofpoint-GUID: MJzUipbv880W3moQ340ANXeg4CeYtoUs
X-Proofpoint-ORIG-GUID: MJzUipbv880W3moQ340ANXeg4CeYtoUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_10,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Reason: orgsafe

Frequently an I2C write will be followed by a read, such as a register
address write followed by a read of the register value. In this driver,
when the TX FIFO half empty interrupt was raised and it was determined
that there was enough space in the TX FIFO to send the following read
command, it would do so without waiting for the TX FIFO to actually
empty.

Unfortunately it appears that in some cases this can result in a NAK
that was raised by the target device on the write, such as due to an
unsupported register address, being ignored and the subsequent read
being done anyway. This can potentially put the I2C bus into an
invalid state and/or result in invalid read data being processed.

To avoid this, once a message has been fully written to the TX FIFO,
wait for the TX FIFO empty interrupt before moving on to the next
message, to ensure NAKs are handled properly.

Fixes: e1d5b6598cdc ("i2c: Add support for Xilinx XPS IIC Bus Interface")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/i2c/busses/i2c-xiic.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 71391b590ada..fd623e8ad08a 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -772,14 +772,17 @@ static irqreturn_t xiic_process(int irq, void *dev_id=
)
 			goto out;
 		}
=20
-		xiic_fill_tx_fifo(i2c);
-
-		/* current message sent and there is space in the fifo */
-		if (!xiic_tx_space(i2c) && xiic_tx_fifo_space(i2c) >=3D 2) {
+		if (xiic_tx_space(i2c)) {
+			xiic_fill_tx_fifo(i2c);
+		} else {
+			/* current message fully written */
 			dev_dbg(i2c->adap.dev.parent,
 				"%s end of message sent, nmsgs: %d\n",
 				__func__, i2c->nmsgs);
-			if (i2c->nmsgs > 1) {
+			/* Don't move onto the next message until the TX FIFO empties,
+			 * to ensure that a NAK is not missed.
+			 */
+			if (i2c->nmsgs > 1 && (pend & XIIC_INTR_TX_EMPTY_MASK)) {
 				i2c->nmsgs--;
 				i2c->tx_msg++;
 				xfer_more =3D 1;
@@ -790,11 +793,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 					"%s Got TX IRQ but no more to do...\n",
 					__func__);
 			}
-		} else if (!xiic_tx_space(i2c) && (i2c->nmsgs =3D=3D 1))
-			/* current frame is sent and is last,
-			 * make sure to disable tx half
-			 */
-			xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK);
+		}
 	}
=20
 	if (pend & XIIC_INTR_BNB_MASK) {
--=20
2.42.0


