Return-Path: <linux-i2c+bounces-213-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B02587EF767
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 19:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40A011F24AB1
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 18:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071C3374C5;
	Fri, 17 Nov 2023 18:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="JGNMHHdV";
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="QrPlAKdR"
X-Original-To: linux-i2c@vger.kernel.org
X-Greylist: delayed 201 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 17 Nov 2023 10:19:02 PST
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com [67.231.150.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415C1B8
	for <linux-i2c@vger.kernel.org>; Fri, 17 Nov 2023 10:19:02 -0800 (PST)
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
	by mx0c-0054df01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AHI3xS7007392;
	Fri, 17 Nov 2023 13:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	selector2; bh=IH0Se88qxNerFDbGSd23aN51txbzvZGW0NYrVV+aMSw=; b=JG
	NMHHdVI2X1zREJb6dW8YGkf0TbJZIhHATsAPsnbGEcRL8eGx3iM7S+ae2LP9ELJN
	c4AvRI4Q5hG08FUN6st8PTqvIcNEMC36uWm0BpXC8ikEsm91NUgySGklZih8tlOJ
	yEj5E2zXYSVoYMhIGxGxZMZcGTD7GmhCZTo95pU9eRlHcwvTF1DgpvZRc/mkjDXF
	0P6lhGsOmI3vLN0/yx6UIXHILxFvsIVImeRLKvL19SqWAhSkIATmU0Y50MnuOtxv
	i8wHDB8u0oa96+vwWHG0Uro88huVwsxlWG+izduLLpq8W/cSWMsl/nl8PeEoIGDH
	zWJpdAhNmdvAs/hcVFfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	selector1; bh=IH0Se88qxNerFDbGSd23aN51txbzvZGW0NYrVV+aMSw=; b=Qr
	PlAKdRJ3b0kCj4wV2aQywdhOXGDDmDOIdsN9gZW5w9zoxAQ2h2foUJhFrdCpxWcg
	VAPReHHALkl81Pr1kvGdaTNsvqUhQwNii7fkniLtoJA+fepf8/t4htuk9uQZoI6Z
	5tvjtGSZ2HnbpZWiXYT7kyH5PJ7Yl/2b5+yThSX2MOX6rs+YjoPr6+W7zeNRgJN4
	NfmWg6Mpi9MAd24cDwb4LOa9M8Rhu0u+kVsQr7hEx/CgLIQa/AansVaMPzL1aK5A
	UCfU8Q9NV8LxxbIH0N/sVJVNNNesi+ZgXCtUgO9kOUcHkHCjS++QfkZL+oTRTOcV
	tMv5/VSKIgl8os5xJp2Q==
Received: from can01-yqb-obe.outbound.protection.outlook.com (mail-yqbcan01lp2233.outbound.protection.outlook.com [104.47.75.233])
	by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3udrng0wk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 13:14:59 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpKXwuSeky9irsa+HgrryVblNZeE4qfcbMlM4NK1xLoa7jmoM4iKvy47L5snoWdIe+4MvhAEBvexVKGwknXvPJ4qqk2wa0FWLQJcJe+iuCO45mt9CcEn4mRkjAPIdPV9k9KrzClFe87gggBttc85fQfH7SrfXL6fk1D03tekaFBX3kQV2cYouejUsGnR6ljUyY9IPCnFAODX0qF3uORZbcnzX2ZI61W7cCDuht2eqpUur6wsuHKTcd8uyU5daRmOJso9UPPy0FHsDgUOukq3J0snu4nUmOc2vZ9nfpuclFIS6MmR7pM8HO2yC9Jrp75mWy97skQLYqxb+Wy+kRdXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IH0Se88qxNerFDbGSd23aN51txbzvZGW0NYrVV+aMSw=;
 b=fg4tvo5p7NwCMjGN80Cr4rjbr+KGV+Bo/9mJw2dSo21ZCNYuru+tOOXpp3rOtLuMwSm4ID3wZYdg/vtbF5xyiziJk/XAFnn9/HJ4+WLPHx7b5LC/aqHMK9OyMQAQQKW8ffFiLIGafo7dHP+w1D2rMTi1hAvziVD33xWnLhlsYMIn3QB9fepU4VLVtLwl869czmMGGDMCGuKgE/arf3bbtUBtijfjyT6h19l4aYssZiNO0qt0xNmB57bjuyKTKUbGfzY3HktJTGSxIrufU9sl0jI9c1hDUw73k8pBZgWzyPiMwoB0DGLWyIVdRw4131hY4djqF7eles5yo2JhYtoTpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YQBPR01MB10797.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:73::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 18:14:57 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af%5]) with mapi id 15.20.7002.021; Fri, 17 Nov 2023
 18:14:57 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "michal.simek@amd.com" <michal.simek@amd.com>,
        "richard.rojfors@pelagicore.com" <richard.rojfors@pelagicore.com>,
        "ben-linux@fluff.org" <ben-linux@fluff.org>,
        "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 2/2] i2c: xiic: Try re-initialization on bus busy timeout
Thread-Topic: [PATCH 2/2] i2c: xiic: Try re-initialization on bus busy timeout
Thread-Index: AQHaGYH41/AHDHR55ES9zmu8RHrsHQ==
Date: Fri, 17 Nov 2023 18:14:57 +0000
Message-ID: <20231117181238.3989861-3-robert.hancock@calian.com>
References: <20231117181238.3989861-1-robert.hancock@calian.com>
In-Reply-To: <20231117181238.3989861-1-robert.hancock@calian.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB8838:EE_|YQBPR01MB10797:EE_
x-ms-office365-filtering-correlation-id: d268c4e6-1dab-4904-5712-08dbe7991b51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pVR9jYiQSzb0cjT+YUSwkqPCyINBOrjPzfNlAINpCWuvhLHK0lYMtkN4bprjSec7VGJLgTdVu9LZPO90ijTt03sN3Dfae0kYxUoOfTDuuovjBO9qKr6qLyJY6HmyLPiyBZFA/0KTUECnNA898JopDnOzkHC4uuLsD5uLLbea0AtGhHFHqQRGW/uUiTfZsP6n03YIjjPNlac5uYgqqVkXrvg7Hnfyf+3dI9NSU4Fa60ANZp3e4BBTGDylCNdFSDDdqFlqZeNIlAfhLMxC9rnXuop2dCKUGqMh/rBOdKIJVOz7p5ULxZUq5puP5YJYuCwkAjU9rATGu8OGESOIUcTaiibR2JnwIyfs+mKoUiY2LEaFM+q6tDblKBCPUovPy3aOiVUDyJC5ahmPoR4OjQFUH5HdSHoJSv808k/Vhpi9kdxIFZMdJoHwvAJsCNkg6xX3Q5oWEc0G0sVlZVc55GiD5DxD2hy6ZX0lZ43woaQU8VBZVBtsVJm6gnfwtdZiDtb2cgBJu9Yb0ZbYQRApbluIHW8t9GF56f55b2/4g2VJj5GRRc1b3VjS6/MOseTuj+xYdrzy29bVyLRypUDdSsrSSzMNJd4s2oSyJEKt7ifZq47Fk2fYAO4NLbB+FxZtDdMK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(54906003)(66446008)(5660300002)(66556008)(66476007)(64756008)(86362001)(110136005)(66946007)(76116006)(91956017)(316002)(38100700002)(1076003)(26005)(83380400001)(8936002)(8676002)(36756003)(38070700009)(4326008)(44832011)(2906002)(41300700001)(6512007)(478600001)(6486002)(122000001)(2616005)(107886003)(71200400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?t7LDB4YYaItqzfFiMBkQWHLn6gXwTEtXMwsgiRm6Lqh4ElqKNEe/7TYNvP?=
 =?iso-8859-1?Q?gngAPR4ZpWlhL0+zIOr+eEHbrSgf0qNboxwOwSXnMJuDe2/S9m4tf3Pdcs?=
 =?iso-8859-1?Q?BaizHnN3Hc8M801fbdSFHBJuQ+vlpBINrST5g+ZTQdWoLIE2DItvWadhHI?=
 =?iso-8859-1?Q?b+Y7bpUw1iScagPSZy5rnPfRH70OQg6geX75n6YVX33NvJSwO+KGwa5LEj?=
 =?iso-8859-1?Q?KsmMxoXjvjgTl1IruYICOYUlpR4A+7IzIamZ4fWTcnbqsVSfx1TtdHzMwn?=
 =?iso-8859-1?Q?YWtBuRYiJxd6yLdDf2lAkPmmjOLNv/O3yVh+0SJKxVboKGVAcRaQMJ3FTE?=
 =?iso-8859-1?Q?H9y6QG0e6IlRpt8LeUql+2vOPkzn6woU5sp/vZAVSV6N1NdzOOG7kxx9Ot?=
 =?iso-8859-1?Q?CefwhAZYlt24nWXjWgd79dgguFViLGsI1BnzAdG17wBGsSMZIwSWGjMrRN?=
 =?iso-8859-1?Q?aAu7l/BUBABCITtKt3vGCy90gFlstNoa/803j6in1m9XqjbIJV1+Ce76bG?=
 =?iso-8859-1?Q?RaOoJM+f0DOCjz2Gd9WSWubC0K26e80z/fjnAfbe40oULHAAMEl1cEMppK?=
 =?iso-8859-1?Q?f34l2Q352oQdc4c5691FlZ5aerybIM0aXWDMad3EFdu2vhcJWRiSOeHFz1?=
 =?iso-8859-1?Q?IBaCa8ShLFniRIc4KL/8C/4gvGOFtCvveQsI0B6XDCCTjnIZF4tEvzT2CG?=
 =?iso-8859-1?Q?MjP5a0KA764/ZKMQC2ZqqDX20EVcb93KQ9qBhwPyXJi70vzpLI9DjE6aPM?=
 =?iso-8859-1?Q?8Ko2ftxEGjfk+gSsGzgZMa5kCaMsFeFN/J1jmgK3XLYp37hKQNB56fn4RD?=
 =?iso-8859-1?Q?s4sRzFxlioYaNeOteV7oad0TJQsFe/RDxkFTpnj6jSE5BSX0bwuC9iuZVZ?=
 =?iso-8859-1?Q?/XSOkSwrv4YhuO+IxgsybLQgyB1FfyxFASV3u4uXfPjltkl/wPmr+Dgftj?=
 =?iso-8859-1?Q?es4W5rLPsvNLnI9ez3UbmrFtJ1yIgbWI/9yLRbTopbj/IqriMDpMI+/tXl?=
 =?iso-8859-1?Q?ZiwfqtyAB4fnAs4BAzTiMAPn1NkSu3jdmJ8uAr/RPRPOZd/VBzKaSBbl0R?=
 =?iso-8859-1?Q?5QhuAtzCF+ubf9/cdr/qI2O1bWnRZK81Zw5Z6TKHIyMg9ELYzsgU71HmmU?=
 =?iso-8859-1?Q?AH27CsXm2K03g1puz3b8Pe5RnT6o+zPZaxIl+A1fdmi4GE4A3EhUeKSuxh?=
 =?iso-8859-1?Q?I7s4PWZ2FXO0mueDW2+Tswv/NlIluHR10Q+qIFu4EDj9pcrOoxGMl8wUtd?=
 =?iso-8859-1?Q?LgnieV0ScJb6VauGEz9ty5hiaFhfTucMgItJpi5GO5DTRNYmY6eSUDLEx7?=
 =?iso-8859-1?Q?8FVLFSmuQzgpD99bJ9eLXu2DKduPrsJYDyd8w1nFVNYbWv1eyQcV0c03UG?=
 =?iso-8859-1?Q?D8tk8TBKdcXlxPMSPUGy/nPtLuycSJOYwP5Q9EVv/rOby0Xhg75BxScf2m?=
 =?iso-8859-1?Q?UKh2JPjz0ib+MG4Zzz33ihsVwE4MILUiH/T6k2FWM/tJBSUzIYq9kE+rAP?=
 =?iso-8859-1?Q?fmMegi7RujK9X3RFNRDtI/eOgSGlufGXpJlaNSZ9RHPPBM2hrjQg4+mn3T?=
 =?iso-8859-1?Q?bYn5xqbdqy//t39XG/IYMCOoPy1ZTk3WD+wRhA6oG0sjLfVIAJ5QT53F5Z?=
 =?iso-8859-1?Q?5jFM00Xjrj2YvppmFauOoI35zA3fYlKShqqyquG1O/Or33b1arymRdcg?=
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
	=?iso-8859-1?Q?leGFloDXb3SIh0mDpu3DvmtkMzEBofMiMbSWRU0ZjucbyGDETRDpv43FuW?=
 =?iso-8859-1?Q?Fs+hQ4r1SNaPotKwuc017/I8tZwkwsXUQui14d9m4/pAs3hHzBX/R/wYQh?=
 =?iso-8859-1?Q?v4rqChzHK+03b/j+XeYOuNvXtaeeN7GMhBcYUDJ8/izHsacGPFDHEg5kZC?=
 =?iso-8859-1?Q?nXofHlc/h5IJxVaJKhQcDaQZAKMWFy92ssYKLUmtlL02OwGE+J0j1/VPN3?=
 =?iso-8859-1?Q?TnIndrpF69CHCxO8AzHiaOTjS2cyzF4Z4wMAgVYtNDh90D06tv06FQEiSS?=
 =?iso-8859-1?Q?KMBXRQnWJ8yRV8Jp3Xa7MVbGXiAdRfyJRiwIwVgQHIYFCCuHzhAP4r9oPi?=
 =?iso-8859-1?Q?RAsls4ejQjm4vEMFmG77e031CWpfk6hi8qHfOLAyTtNdrOMxoPxjyT0C76?=
 =?iso-8859-1?Q?dtjiDjayptk5UGh8psnWS9HGoCS0OhBExTcpZpB5ZZhZPirG8sEd0MJbEo?=
 =?iso-8859-1?Q?yoNaPIFExy2PhW+cHM60RKVAAcdIyIh/YTkxDm0+sfSqnP8flK2qLMPNQg?=
 =?iso-8859-1?Q?aTIa0HsC5x4mOnAg90bZfBpf2c58lvnXsACrmvjA4PCH1fUZzIKdWYxV1y?=
 =?iso-8859-1?Q?+MuwG8KWOpr3R+AooHhy18atS4zdD6qSWShVxnp3qkUvuIT+Yb4lAAjCZB?=
 =?iso-8859-1?Q?r4AGlKkwBuK7gHaFLuzr5TOkFg3eZulidVr4pOTlU2dbrhGbshZDQriH6C?=
 =?iso-8859-1?Q?OReAiWU5dfaTB6c5c9NKBQvWYFMqi/JSqm7VUaI7Y1L53VqhPD0NTBT9GE?=
 =?iso-8859-1?Q?202X5zpxpAgFPsTs8v9negZK/49Vvz3oX0Aja+9a6zyowPLZLo948oVxen?=
 =?iso-8859-1?Q?cLm/lZU5F8a8iKuRFXypELeIx7lY9/GfzUroUr1LZSVQW+SfcTe7JQeC1Z?=
 =?iso-8859-1?Q?8j3uyhWFjAzg5ka7K5QriS8d/PmiQCIFvoiunj827p5b5H95llDAvH0g9u?=
 =?iso-8859-1?Q?PGsnFsUq0e4J+t2XmHvBZB1PrMLpNk6nEo5vxGYBfAvbdBiZ/Rua1A=3D?=
 =?iso-8859-1?Q?=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d268c4e6-1dab-4904-5712-08dbe7991b51
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 18:14:57.6837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+Thrjkrcwdo6kPoRaD2QmprAAORT8dnj5Il+hLg1IGP5Ynot1smxPMHNjrq2RmVuWDk27gWVh3D9RgWB9J5f/EN1IYrJNc6lor/CG3jKLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR01MB10797
X-Proofpoint-GUID: A780P-LXJL9G9i2fkStfCPsSvGVxCThi
X-Proofpoint-ORIG-GUID: A780P-LXJL9G9i2fkStfCPsSvGVxCThi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_17,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Reason: orgsafe

In the event that the I2C bus was powered down when the I2C controller
driver loads, or some spurious pulses occur on the I2C bus, it's
possible that the controller detects a spurious I2C "start" condition.
In this situation it may continue to report the bus is busy indefinitely
and block the controller from working.

The "single-master" DT flag can be specified to disable bus busy checks
entirely, but this may not be safe to use in situations where other I2C
masters may potentially exist.

In the event that the controller reports "bus busy" for too long when
starting a transaction, we can try reinitializing the controller to see
if the busy condition clears. This allows recovering from this scenario.

Fixes: e1d5b6598cdc ("i2c: Add support for Xilinx XPS IIC Bus Interface")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/i2c/busses/i2c-xiic.c | 42 ++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 6e84b4d67fd9..a396560a7ba9 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -843,23 +843,11 @@ static int xiic_bus_busy(struct xiic_i2c *i2c)
 	return (sr & XIIC_SR_BUS_BUSY_MASK) ? -EBUSY : 0;
 }
=20
-static int xiic_busy(struct xiic_i2c *i2c)
+static int xiic_wait_not_busy(struct xiic_i2c *i2c)
 {
 	int tries =3D 3;
 	int err;
=20
-	if (i2c->tx_msg || i2c->rx_msg)
-		return -EBUSY;
-
-	/* In single master mode bus can only be busy, when in use by this
-	 * driver. If the register indicates bus being busy for some reason we
-	 * should ignore it, since bus will never be released and i2c will be
-	 * stuck forever.
-	 */
-	if (i2c->singlemaster) {
-		return 0;
-	}
-
 	/* for instance if previous transfer was terminated due to TX error
 	 * it might be that the bus is on it's way to become available
 	 * give it at most 3 ms to wake
@@ -1103,9 +1091,33 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, str=
uct i2c_msg *msgs, int num)
=20
 	mutex_lock(&i2c->lock);
=20
-	ret =3D xiic_busy(i2c);
-	if (ret)
+	if (i2c->tx_msg || i2c->rx_msg) {
+		ret =3D -EBUSY;
 		goto out;
+	}
+
+	/* In single master mode bus can only be busy, when in use by this
+	 * driver. If the register indicates bus being busy for some reason we
+	 * should ignore it, since bus will never be released and i2c will be
+	 * stuck forever.
+	 */
+	if (!i2c->singlemaster) {
+		ret =3D xiic_wait_not_busy(i2c);
+		if (ret) {
+			/* If the bus is stuck in a busy state, such as due to spurious low
+			 * pulses on the bus causing a false start condition to be detected,
+			 * then try to recover by re-initializing the controller and check
+			 * again if the bus is still busy.
+			 */
+			dev_warn(i2c->adap.dev.parent, "I2C bus busy timeout, reinitializing\n"=
);
+			ret =3D xiic_reinit(i2c);
+			if (ret)
+				goto out;
+			ret =3D xiic_wait_not_busy(i2c);
+			if (ret)
+				goto out;
+		}
+	}
=20
 	i2c->tx_msg =3D msgs;
 	i2c->rx_msg =3D NULL;
--=20
2.42.0


