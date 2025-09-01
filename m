Return-Path: <linux-i2c+bounces-12538-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B5B3DE7D
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 11:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 974C62019CF
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 09:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFDC30DD12;
	Mon,  1 Sep 2025 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eS/wPYxv";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rG2eizSk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912352FB995;
	Mon,  1 Sep 2025 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756718733; cv=fail; b=uJBt3eDgvt3VD1nvibSodwXhqUPJIXmnPx3+D5ztNxd6eJ/mAJudNq8lBfIjWqPjPrgqnK5J74MphUZWJmgBQPlhl0rgFIRW3RNvcEk4XeNDvZvGlrXDnkZubMKiyxVs/9P7Un7mcDLCqJgFpHAeNOrQKxwVSAqXYyUBm5/5ma8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756718733; c=relaxed/simple;
	bh=DBiwECZ8P3cabII8E0BMdPvcAY2ApxbqJwfoIyviuuA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JZ7TpUM8lqcc3VDZnjXIxY2zt6DhI8acO0Crakjy8FR0kvDKiGOXtZH2WtcW7ftgZPVVrfN0f6liuyampywGpl6K9tHJ876G0Pgx54++iy4e/2RTJs9fHNX61mIDP211/slxNRgGiMl7nl8aIKyG/wug1sNi5oaC1Zr+DFPy5WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=eS/wPYxv; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=rG2eizSk; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 97ba024a871511f0bd5779446731db89-20250901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=DBiwECZ8P3cabII8E0BMdPvcAY2ApxbqJwfoIyviuuA=;
	b=eS/wPYxvzaY2bzK7mtlia08oaFHUk1KFnnrOSMfZPQ6uNMLJFxB6z4OUP0UMe06RLrzC8yOE5QTXDVZILxzetXPxDvJEpvt+cECExa/NXgJHhOmOof1kpnCsn/sPwDHxTNnaTeOD9j1RZPcMJWflDsTA7NfqX8Hu/z0OxsRZVgg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:eb011c21-7acf-4319-aedc-701cad614892,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:ecb94e84-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 97ba024a871511f0bd5779446731db89-20250901
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <leilk.liu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 358307128; Mon, 01 Sep 2025 17:25:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 1 Sep 2025 17:25:24 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 1 Sep 2025 17:25:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPP5/6Nhwy+sBrC2OhyCWiyCCkcVJJF/qALoobuh3BOFRgEhD9mE27TuO+rDTY1Zi+4418i15St6irxuG0zF87QUv5brUtYOGg9Y7vHcnUMsfjozigsC8Y5rwn4j5MqIknxJpd6as7/8Kn42fG16xVxFoikCE38436z/CVtlY4tv7BUQm0Bg7w7+b0sofdSYbFu57JVkG9z6QGjPcN3p27xlwRMuaOgQa9g4+B+Z3CFo+CXwWkuNVwrJJ3nEPErON1btCeQcXBO9szfbZ+n/tF61IzWX3TihpOBy9YLrqRm5SwQbO4CM9Q6vl/Mi9VpqI+FCFZz4fm9knjNkseHW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBiwECZ8P3cabII8E0BMdPvcAY2ApxbqJwfoIyviuuA=;
 b=jkcHhq09EE42rdD6IE+bW3T+HFrc4bM94Qrx8ntGXZVzAflKa5eJnkbYG72YciVPvEcnN/ZJZuD5g7JgiQH3bkDKI6ff0YBbvFkHMQaGHGBSGXcXn9Pjkp1Hr0O8EHNovIXCnD822P/faOLiJPLa4HM6g8bnsEQnQHflMeBg7XsumrfwzCosXe/x/xIbKD8/4rWg6igxYEI/6eev7I+VoqxYPof0PDz3ieH1YK7HM4dX6sm+jV2v6W+9Gw8C3XC2iCcdjkmLj3jeOMMSIcbNo6j+60PCnQZAiDRbMcfjLafqnfm2UQrAnB+e2FaaCgeaAWSOi4OJHvGLz48Pf7WpBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBiwECZ8P3cabII8E0BMdPvcAY2ApxbqJwfoIyviuuA=;
 b=rG2eizSk/JCsLueRDL9XaEc07/2+MpkopQyFpqbsVidE+qXYBFkbCPCXwltF5uWtUhh2X6F7O7u0KKa/tYCtZYMg9QSavU3Z0DO3x7gVc59PLNVWNp1YqjVXUrx47GaQf1jqMxgt/0umb5g3/tMrOTWOyD7MV4/gN4rLszp5Z54=
Received: from TYZPR03MB8101.apcprd03.prod.outlook.com (2603:1096:400:45a::11)
 by OSQPR03MB8748.apcprd03.prod.outlook.com (2603:1096:604:275::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 09:25:21 +0000
Received: from TYZPR03MB8101.apcprd03.prod.outlook.com
 ([fe80::3ffc:5497:29ed:545b]) by TYZPR03MB8101.apcprd03.prod.outlook.com
 ([fe80::3ffc:5497:29ed:545b%6]) with mapi id 15.20.9073.021; Mon, 1 Sep 2025
 09:25:21 +0000
From: =?utf-8?B?TGVpbGsgTGl1ICjliJjno4op?= <Leilk.Liu@mediatek.com>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"wsa@kernel.org" <wsa@kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?TGlndW8gWmhhbmcgKOW8oOeri+WbvSk=?= <Liguo.Zhang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?UWlpIFdhbmcgKOeOi+eQqik=?=
	<Qii.Wang@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] i2c: mediatek: fix potential incorrect use of
 I2C_MASTER_WRRD
Thread-Topic: [PATCH] i2c: mediatek: fix potential incorrect use of
 I2C_MASTER_WRRD
Thread-Index: AQHcDoMkTRTDUAkGSUms2DTW0rk8vrRqfioAgBOpeoA=
Date: Mon, 1 Sep 2025 09:25:20 +0000
Message-ID: <008e347509c5f2e9a6ec9d2343be85a7838ac9d5.camel@mediatek.com>
References: <20250816075434.31780-1-leilk.liu@mediatek.com>
	 <cf5wxalhd2536cxnj7zn2jngly5dmvoknjnb2gbq6mzqff4tgp@4syhblgi35yu>
In-Reply-To: <cf5wxalhd2536cxnj7zn2jngly5dmvoknjnb2gbq6mzqff4tgp@4syhblgi35yu>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB8101:EE_|OSQPR03MB8748:EE_
x-ms-office365-filtering-correlation-id: b2de5b3a-9724-4680-4b26-08dde93978e0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?THJkcCtOMFByT1psTzRwLzZQUjJraHZIOHVyNGRFMFV5MFdHTEVsaEI4OXhM?=
 =?utf-8?B?UWxXa2RHM0NwWlpoaEd1UnJLeFdyVW9UcXdrOVBiN0ZybVV0UFJrbVlzOFdT?=
 =?utf-8?B?ZnlWbHRDUElZYXFFcm0xUDE4N09mOWlkYms1TDh2Skw0L0E3elcwSERmMW56?=
 =?utf-8?B?c2piWXlxNVBEazFoM2NhSzIrMXRqTWk0cEdPSEc4YWRMYjdEdi9IbU9VR2Ex?=
 =?utf-8?B?K1haSlhZRWFJV0pHUFpsNXJXOGdOWk5YMzVORWl0RVhyUkR0d3pBazhTS1VI?=
 =?utf-8?B?MWRJV1Roa1ViWlRRcDBRcmFGZWVybFQraXFWbm1NMDdqMWdMZGdEM1NubmI0?=
 =?utf-8?B?Um5ITGZac1g0TUZQbE9JWnU4RTRIano2UW9oY3hWVTlodWw2aXZnZ0JFMkw1?=
 =?utf-8?B?YXhnTFliSDgrRFRVMS9XcXVCYTNuSG1PVUdPT2RkbUZhUlZ5SEtMUHZ4ZHNu?=
 =?utf-8?B?eVNEUUNrVDdGV2JJNDBPdUk4K014UWx2ZWlQUjYvVno2RHpBbVFQUnlCQ2pO?=
 =?utf-8?B?OExPbTgzc0k1OHBrZ1dqbFg0di9XT2FRaStKdHRvT1dZWkRQY3dDZDh6ZTBM?=
 =?utf-8?B?b3dYYkxBMVVzRUlWaU55ODNOWkgzazFDaGVGVmNET1ZucktObWlQRi9XeE1k?=
 =?utf-8?B?RlFBdkU2Qi9GMVVHSStQejRLbWU4R1A4NVFBT0M1azVvcnUxOUVwQ3BtSy9F?=
 =?utf-8?B?dGxOMEE4cXdOOE9ZRktQdkhrTHBsTFRMOWI1b2V3RmpvZU1pOTZiMWM0MXF2?=
 =?utf-8?B?NFRBOWtsRW5QQUVpKzltd09DTGNtTEUwNHVZMTBNRGtteW1pd2VWV0tackgw?=
 =?utf-8?B?bHlYVXZzNGZ1YjhPMVRQR2IvK0lodG1SWGlVOUpVb0hkalQ0Tlp0RUlrT3Zp?=
 =?utf-8?B?M1pIN3lLWUVzVkg0YW42ZmF5cDFlSGwxZ1VEaUU1RVhDNGNWaml3WGEwSEsw?=
 =?utf-8?B?TkNmajBjaTNaNTlrNnMyVnUzUmlQRmJpRDVvVVMzZDk3ZnJtOHN1SnBMQlB5?=
 =?utf-8?B?NGpndGQ2ZzhQM2x0RWQ0UVNUZkVtSGFVN3FxblR3bkM2UmsrRU5uMXBJdk5t?=
 =?utf-8?B?UWJBMUJBQ1krL3U3cWFOb0V2RFNvMGV0MzQvbDJHc3J0UkNjcm5PWHdWNktH?=
 =?utf-8?B?SXpVNkVLalNicksxeXBoWGpZMTJiZ0JwTmdENXA5K2xOTEt4Y1U5L1JzTmx2?=
 =?utf-8?B?Z09RdDNMV3V6NHo0R1lxenIra3pkU1ZrVG9IaE10SEZlcmhUQWRjaGFocE1F?=
 =?utf-8?B?bzNsaTlLRzg0TUZQNmhSMFpxdVh3NENlWHNsTXF2dTNQdGttTkxubGlXZVlN?=
 =?utf-8?B?Mk81dHRJOTlZdTE1Z1EreE1sUkdDUUQ5eTJDYloyQzN3TU52M3ZLNXp6SVRD?=
 =?utf-8?B?YmdaT2hCR1J2TUJMN1JPUXRaTGYyKzQyVnpYVExmTWMwM1FVeWRrSHcyUldp?=
 =?utf-8?B?T3huSG1IQlRpSGd2T2xMNWw4dmhySlRMeVlUK3lHQW5yVHd2OERPVkY3STFq?=
 =?utf-8?B?ejRySzZ5VWY1ZVdneUd0dGFlZ1FzSHQ2T3pKZVFPUnp6WWtpYXRQVHhsYTRm?=
 =?utf-8?B?TVJWanNabW83Znd6U1dxbnZ2THB5WFFBYUJ4QWJHVzJxOURsdzRCSk14MktB?=
 =?utf-8?B?Y1hlVGxhSzd0VmIzV0JHaGhIZENtZjZmWXZMMzhGUnFZMUpSaHJJcWV5N2dE?=
 =?utf-8?B?OE4vMkRzMHZld3BGRnlJenp5cXJXSDA4a2gyb0ViWk1xMWFoL3ovc3pVdHlK?=
 =?utf-8?B?TjdEOWJmc0JmZlU5QzR2RnNmbm96OEwrU1l5OFYrdW1aTDJuNUVXcDJoL1Za?=
 =?utf-8?B?VkRrRDB4dGQ1QzY1eURkTXJBQ21kc0p1bkNEakx1dTYvcUNuY3RoTFBmTE43?=
 =?utf-8?B?ZjR0TEJYdUJrc0UyZDFmbHhNTlZDci9TNkdwdzdHZkJOOHlpR1gwcnVJUVdm?=
 =?utf-8?B?NGR1a2I1ZlU5RXREajdHYS9KaXV6R3Y5RE5CRUFpa1ZkYkRaTXoxa0E2QnZE?=
 =?utf-8?B?MTJwV1FDaVV3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB8101.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFZocHV4UUFFazUzN3lhcUxtQ21Rd25iYjc4MGc0cklRMHZKUjZlZ1lDMDFB?=
 =?utf-8?B?TnFTcmZlR2drM2xNeVB5cldmMGdMMTgyNkxIV1hobFVzaTdsZS9CVFZyYTF0?=
 =?utf-8?B?WEpkdlBQVXFOQWpickZIS1hnRE9mZ1RHaTdHbU5XT3Y4ZjY3OVRsd2FuczRD?=
 =?utf-8?B?UnlYZDNjcFRScTdQQjhtdno2WnVHRzFuRExQVVphdXE1cnF2UUNzakRTeGZW?=
 =?utf-8?B?ckFoTEY2VmRySUZPaWRlMUhRVVMrcjlMemY1TVN6elRmUUxRSDFFS0I2c2RQ?=
 =?utf-8?B?N1A1WFp3TWxkekdta1FBM1o2b1Mxd0VJR0s2R1AzcEoyYTAxUkgwMW5TOGlX?=
 =?utf-8?B?aStxaVhpRk42dUx4anNYWU5Wc0NUUHljTnN5MEhITS8yb0tUNTRLUG0vNi9F?=
 =?utf-8?B?TTJua0tSOWZrdnU2cDhtWGRueThzZDJnMkZWSENjMFZJMVp1aFBEUVBMMGZJ?=
 =?utf-8?B?eU5GckJKSzduaGJPSHkyNlNNd2NKWlNPbXFRTXRJalNtamg2cVBPdXg1RDFr?=
 =?utf-8?B?MHZGNTVVd0hGUDJNQ0hNTVVVbWJFeW83dWNxclM1amJYVDV1dEtpUHJFS3dk?=
 =?utf-8?B?OGVrZkExamJpQ05MclFUMXlRYThhSFRrcHdUWGtQS0gzTGZvZEFxam4rL3JJ?=
 =?utf-8?B?YjA1eDV5OU5tK29GYy9ON0JyNGxxWmdZVHdJdVMySDUyOUtad0hYNFhKZ0lN?=
 =?utf-8?B?NjJzMHpwNDMvOStTUWQ3cXhyM1ZkL2tUSzlIdG03K3N1MTVGQzhRaTNidWIv?=
 =?utf-8?B?VlJjK0xNUnhUQ0Zia05GVzRyZlJ4eUtsbEFtV0dVcDdoK2EzMjNZUC9YZnEv?=
 =?utf-8?B?YlUxV2E2S1Jpa3lsTk1sdXRZZ2tGMjJUeW9RWFFpZ0lEQ3ZyRVQ3d3ZwZG5k?=
 =?utf-8?B?dTF4K0dIUWZMZGlEVlZlMTlqZWczWkh1eTlibTlFUnBMYlcxVUZrWEdEbTRE?=
 =?utf-8?B?S0VNYjYvSUZCalBJRlE5YjB3T3RZOUlJcTJhVzRTRkJXK1ZhQVhwMEkvTHFY?=
 =?utf-8?B?RFEvOXZlaTJTd2lPUkFNNDFGRGp1KzZ6Q0RaYnQrS2QyQ2FyVm1KRzNjVzVr?=
 =?utf-8?B?U2cvNWxOSUVRNVIyNDZUUUxwQnd1dkFaVEtsN2VmZS9PS2d4T2lGWkJsNytj?=
 =?utf-8?B?Y2I3NUgxb04xUUZ6akk1Vm82RmZ2QUhVcDNsdEtZelFiL3JoaUhUTTBpRDBE?=
 =?utf-8?B?b1hQd2hydW9LbVVsaVBwMWhLWEIyblBwazBVSEpBWnhSa0twQWl3L05lVkVY?=
 =?utf-8?B?WmpyWDNpRzBPanFkUnBPY2xGTmJUZCtwTzlBM29ycHAyV2dQRXhwZjJZUHJ1?=
 =?utf-8?B?YnJjQW1SSUdsQ2lzYm5SOE1MRU0rbzZCbGpzVkJ5bHlabWdQSDBVRytOd2J6?=
 =?utf-8?B?a3lZc20vRU96QXRDRGRROXRGY1E1YUsraUxzREl2VkJ5REdIeWtQMXNwMjhw?=
 =?utf-8?B?OHBGNlltNjJrTGF0bmgyaGlhNFhIUFlHSlRMVHJqWXMzckNGbjk3QjRNdDE3?=
 =?utf-8?B?WGxCUjgrTWNGYXJ6SStvdGJBTVpTTVBOdjZCV1Y4MGtEZE96QzdvWFFZRFA0?=
 =?utf-8?B?UjRKQUFkZzdPdnJuOVF6dzdtazdvaGxjZlM5b3R3ajJGZzRLaWplc0Yxb0l2?=
 =?utf-8?B?c0pmb2ppejJaU0dhYjF1VkduajZBQ2liMW9BZVgyOVlLdXJkaFJSVEJ6M3Jp?=
 =?utf-8?B?bm9lSWVMcGk1U05VOUFab3plV0NpQ01iTVRaczlxNEhGMlAyTStFUHpCVmJQ?=
 =?utf-8?B?dU1uV0ZWTG45UGFCNzlhOUFKREJyckwzMXNqVisyTXJpdzZBZ041Z2ZSVFQ5?=
 =?utf-8?B?SUg2LzBuNjRWREN4WlI0NzlsRE5MTmJIcnlmWkxUdC9LaEtRM1hXWG81a256?=
 =?utf-8?B?cnZLem9ER2F6UlluRWxWRUpEN3VkTmtzTlpaRDRvQllWckttUXJ0K1BCSXly?=
 =?utf-8?B?SGphVEtON1FrRVNVaVQ0VHpFVnVMeVFiajhtNzRsclg2ZzZPR2swS0QwWGJq?=
 =?utf-8?B?OWtWdU5rWG5YNjRMQlhjV0hJZllPRVFDYlpVNkV4bTNVSXA5WlZhVUZlcDdw?=
 =?utf-8?B?VEE1S2p2Rnhlbk9abVBWZDNVSXlmRndxU2h4NVZSTjB6US9yMFJrK3pmRXlT?=
 =?utf-8?Q?AevAgG6KmmIX8KEKzvOyMCfdY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F7206513DDD864E81BE047FDBCA3E44@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB8101.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2de5b3a-9724-4680-4b26-08dde93978e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 09:25:20.6812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RzZZl2jj8jgz9IzrJozimLJCzHSP4iewHmwzutYG2T+27ZbPkzq4TwA68kD4toqFBmR4WHbm0vk9+XEYJlnqsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8748

T24gVHVlLCAyMDI1LTA4LTE5IGF0IDIwOjA5IC0wMTAwLCBBbmRpIFNoeXRpIHdyb3RlOg0KPiBF
eHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50
Lg0KPiANCj4gDQpIaSBBbmRpLCBzb3JyeSBmb3IgbGF0ZSByZXBseS4NCg0KPiBIaSBMZWlsaywN
Cj4gDQo+IE9uIFNhdCwgQXVnIDE2LCAyMDI1IGF0IDAzOjUzOjU0UE0gKzA4MDAsIExlaWxrIExp
dSB3cm90ZToNCj4gPiBGcm9tOiAiTGVpbGsuTGl1IiA8bGVpbGsubGl1QG1lZGlhdGVrLmNvbT4N
Cj4gPiANCj4gPiBUaGUgb2xkIElDIGRvZXMgbm90IHN1cHBvcnQgdGhlIEkyQ19NQVNURVJfV1JS
RCAod3JpdGUtdGhlbi1yZWFkKQ0KPiA+IGZ1bmN0aW9uLCBidXQgdGhlIGN1cnJlbnQgY29kZeKA
mXMgaGFuZGxpbmcgb2YgaTJjLT5hdXRvX3Jlc3RhcnQgbWF5DQo+ID4gcG90ZW50aWFsbHkgbGVh
ZCB0byBlbnRlcmluZyB0aGUgSTJDX01BU1RFUl9XUlJEIHNvZnR3YXJlIGZsb3csDQo+ID4gcmVz
dWx0aW5nIGluIHVuZXhwZWN0ZWQgYnVncy4NCj4gDQo+IGRvIHlvdSBtZWFuIHVuZXhwZWN0ZWQg
YmVoYXZpb3VyPw0Kc3VyZS4NCg0KPiANCj4gPiBJbnN0ZWFkIG9mIHJlcHVycG9zaW5nIHRoZSBh
dXRvX3Jlc3RhcnQgZmxhZywgYWRkIGEgc2VwYXJhdGUgZmxhZw0KPiA+IHRvIHNpZ25hbCBJMkNf
TUFTVEVSX1dSUkQgb3BlcmF0aW9ucy4NCj4gPiANCj4gPiBBbHNvIGZpeCBoYW5kbGluZyBvZiBt
c2dzLiBJZiB0aGUgb3BlcmF0aW9uIChpMmMtPm9wKSBpcw0KPiA+IEkyQ19NQVNURVJfV1JSRCwg
dGhlbiB0aGUgbXNncyBwb2ludGVyIGlzIGluY3JlbWVudGVkIGJ5IDIuDQo+ID4gRm9yIGFsbCBv
dGhlciBvcGVyYXRpb25zLCBtc2dzIGlzIHNpbXBseSBpbmNyZW1lbnRlZCBieSAxLg0KPiA+IA0K
PiA+IEZpeGVzOiAxNzNiNzdlOGQ4ZmUgKCJpMmM6IG1lZGlhdGVrOiBhZGQgaTJjIGZpcnN0IHdy
aXRlIHRoZW4gcmVhZA0KPiA+IG9wdGltaXphdGlvbiIpDQo+ID4gDQo+IA0KPiBObyBuZWVkIGZv
ciBibGFuayBsaW5lIGhlcmUuIEJUVywgdGhpcyBkb2Vzbid0IGxvb2sgdGhlIGNvbW1pdA0KPiB0
aGF0IGlzIGludHJvZHVjaW5nIHRoZSBpc3N1ZS4NCj4gDQpPSy4NCkZpeGVzOmIyZWQxMWUyMjRh
MiAoIkkyQzogbWVkaWF0ZWs6IEFkZCBkcml2ZXIgZm9yIE1lZGlhVGVrIE1UODE3MyBJMkMNCmNv
bnRyb2xsZXIiKQ0KDQo+ID4gU2lnbmVkLW9mZi1ieTogTGVpbGsuTGl1IDxsZWlsay5saXVAbWVk
aWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5j
IHwgMTcgKysrKysrKysrKy0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gPiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4
LmMNCj4gPiBpbmRleCBhYjQ1NmMzNzE3ZGIuLmRlZTQwNzA0ODI1YyAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQo+ID4gKysrIGIvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1tdDY1eHguYw0KPiA+IEBAIC0xMjQzLDYgKzEyNDMsNyBAQCBzdGF0aWMgaW50
IG10a19pMmNfdHJhbnNmZXIoc3RydWN0DQo+ID4gaTJjX2FkYXB0ZXIgKmFkYXAsDQo+ID4gIHsN
Cj4gPiAgICAgICBpbnQgcmV0Ow0KPiA+ICAgICAgIGludCBsZWZ0X251bSA9IG51bTsNCj4gPiAr
ICAgICBib29sIHdyaXRlX3RoZW5fcmVhZF9lbiA9IGZhbHNlOw0KPiA+ICAgICAgIHN0cnVjdCBt
dGtfaTJjICppMmMgPSBpMmNfZ2V0X2FkYXBkYXRhKGFkYXApOw0KPiA+IA0KPiA+ICAgICAgIHJl
dCA9IGNsa19idWxrX2VuYWJsZShJMkNfTVQ2NVhYX0NMS19NQVgsIGkyYy0+Y2xvY2tzKTsNCj4g
PiBAQCAtMTI1Niw2ICsxMjU3LDcgQEAgc3RhdGljIGludCBtdGtfaTJjX3RyYW5zZmVyKHN0cnVj
dA0KPiA+IGkyY19hZGFwdGVyICphZGFwLA0KPiA+ICAgICAgICAgICAgICAgaWYgKCEobXNnc1sw
XS5mbGFncyAmIEkyQ19NX1JEKSAmJiAobXNnc1sxXS5mbGFncyAmDQo+ID4gSTJDX01fUkQpICYm
DQo+ID4gICAgICAgICAgICAgICAgICAgbXNnc1swXS5hZGRyID09IG1zZ3NbMV0uYWRkcikgew0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICBpMmMtPmF1dG9fcmVzdGFydCA9IDA7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHdyaXRlX3RoZW5fcmVhZF9lbiA9IHRydWU7DQo+IA0KPiB3aHkg
ZG9uJ3Qgd2Ugc2V0ICJpMmMtPm9wID0gSTJDX01BU1RFUl9XUlJEIiBoZXJlIGFuZCBhdm9pZCBh
bg0KPiBleHRyYSBmbGFnPw0KPiANCndlIG5lZWQgdG8gc2V0ICJpMmMtPm9wIiBhZ2FpbiBpbiB0
aGUgZm9sbG93aW5nIGNvZGUsIHNvIGFuIGV4dHJhIGZsYWcNCmlzIG5lY2Vzc2FyeS4NCg0KPiBU
aGFua3MsDQo+IEFuZGkNCj4gDQo+ID4gICAgICAgICAgICAgICB9DQo+ID4gICAgICAgfQ0KPiA+
IA0K

