Return-Path: <linux-i2c+bounces-373-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD627F35B5
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 19:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2A39B21D0C
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 18:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3D322098;
	Tue, 21 Nov 2023 18:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="b3JnZtq3";
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="jlpW2DSO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com [67.231.159.91])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E9F19A
	for <linux-i2c@vger.kernel.org>; Tue, 21 Nov 2023 10:11:13 -0800 (PST)
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
	by mx0c-0054df01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3ALHD4pd011817;
	Tue, 21 Nov 2023 13:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=selector2; bh=vutH4jQ
	EScM8xBbLc9p3QNg1LJeF8miH/xa/fcTkQ08=; b=b3JnZtq3ecvm/otEPZ2HnWK
	ARQrQGfOXEfN9fEQD00+4XLIJC6sUUNkpUC60uQOzQHdGc+vEuESh0wDmUiYlEUB
	k9MY7/fGnj7/hzPhwEgiUEnMIHOr7Ik8w799nJrt30ig+lIwa8pN/lEZFI5yXYu6
	FkG2i5u2vC4CqtwRu82de6gS/VZmvmGb4KE97eqmdI53bbcyyegbFHGAdAq2pdP5
	Z1kgnAyjOdLQikTn2pxJ9LfUEWmT1dbV2IaVN2XhTGwUF6JEILctTuA+t5pF+QOx
	Jc6mlc71MJ2oDWsU1XafCRV/0Y/jpoLjMqE0iVJc/6vB5Lz4BCRiP/e42GrOpNA=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=selector1; bh=vutH4jQ
	EScM8xBbLc9p3QNg1LJeF8miH/xa/fcTkQ08=; b=jlpW2DSOUwBnxuaOcEb1XyE
	3//EBA6s34MOmWn2z37jEqviafwA6Mlr4WqTBWn2lXBqp1BTRU70hUrmtPyMHfLK
	ap3oEHjR2+4/W1q4sI/BXqAK3SdyPnawVnQSDqtt/mfCzlHUDhGW1qSWp1vtTTbH
	eBOQ1oiHk2lcMbfGtWHfZyDPjQ9chKTVyU4xnGNhdXwtqXoMihPrlbvXZFVhX1U7
	eQLcacSgW/F01kAZidav6iql1saPmeUyk0UXELb2TBnEB2zvvhDokRAMX9vqPq7b
	OwybeyTi+nZVw1jr8xoqwvMlzQ8C2SNNcNHfPBMx0GI3XVmhnFB8nJBpKLvjo5Q=
	=
Received: from can01-yqb-obe.outbound.protection.outlook.com (mail-yqbcan01lp2233.outbound.protection.outlook.com [104.47.75.233])
	by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3ues8xk5vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 13:10:54 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrN+YTuhh34FErP6J4+CFebJRz912xY5qkkucB7+82SupD7QSfFMt2TnU1GnnWRTUvg1xQcVLG1/C3SA3lPo8dNaMp4/PERhiComg8CCau80HQMXXbhX9sGcHs4YHBLdhBdYMLu5nI3mrY4O+301nww9MdOJu8fm58qyDWbwD+i5yoN7jNEV33lBgPtE9BRJQLv3Erd+7UpSWfxMjzec7qgqkMcAyTGfcXjibTki/sSPUOwtdtL9CEyTKbnJLTMnXeReeduUjUJb+78A2NBA4x4nTrIX8IeQ1cgBGfuOv8LjtF+vsIbxta38iM+UvMXJztaigosfTxYZjHU3haTxBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vutH4jQEScM8xBbLc9p3QNg1LJeF8miH/xa/fcTkQ08=;
 b=mJITiRMHEvh2lxlMoYF81hx3a0giP9toDzXe10bYU+Jsiw1J638xkEKm5wDgpvs8QXTjcmCxpnc4CsNGXUE0G9uruuFDZxnSpdgPkeBSTzwOfT4PsWMPWBQbwRqItlZABtJRML4t7RRgI+rx1/1hnQWditumIv+qMAyeHPVugQgeEqF/G274yt3FeNn1SAWRcPJQ/OE5z9AtkEYKMUrMfSjaf8WduOYN0Fx1jWY030BxKLxe9Tqjde3bWv0Be7BWvDFGfcaClu3hDGoWF/Uj7Iz/d2BEjZ0gYiRjivkMWG+JtivOv9a47uIy/CjniSyOktkHyB8G3SpLz5UFvfPK1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YT3PR01MB8561.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 18:10:52 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af%5]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 18:10:52 +0000
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
Subject: [PATCH v2 0/2] Xilinx I2C driver fixes
Thread-Topic: [PATCH v2 0/2] Xilinx I2C driver fixes
Thread-Index: AQHaHKYQwYuAaxqoTUK0TRr8PhRYYg==
Date: Tue, 21 Nov 2023 18:10:52 +0000
Message-ID: <20231121180855.1278717-1-robert.hancock@calian.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB8838:EE_|YT3PR01MB8561:EE_
x-ms-office365-filtering-correlation-id: 92e8e94e-2a2a-425b-52a0-08dbeabd32d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NtUNO2uZd9he7N1j6qzqsNgdS/EYu1wmKHRag8Sq+VylULFw/RchEeLDl6dkaIh9Cf7iE3p97Ta9twXhcEMaZVQlVwQUJ27QxDeTSHD+gT4ygUKMqpNQBiQwtjC+DzbOMbX0xLtwrmvHjjEUbpOoV+RVyhRnndyLzCw9optogt+cyzR+fFFq5Rz90WoiJhYspxx/B2r+gv1oHjiBKMtz0135g4MmyYN1i2VyQYY+ZPRZXM9L0mITonBXTYlTvoMD/Q3cWWIYcdz+ayqb6pZn7Ch6q9vUL+F3v+V+tJ+vhdNK7WHYI5t3554Wn01NZJQOY/olpnAQcoAaN2DinlCNsCPkhXkgoyIyYYhejfS41iFCSHqG6NfVCZg52Y6WSS611vE7OVD8bO07mv66Yyx8u+74T14xVRuG4mMeX0CPTk6Isi+dMXyxwgHN0eVYT9WXNps4exjm0U9RJ/H2mf4rsi9XHO3rNjddJCNu6arkOU61OzIkPJD4kn30zD1iLAZVsHdgM1uhRQSwIiFRtL29UC+235pWa8rOQDYsqgq5LOsGjIIbAl8GFqn4XS5+kvOuRhpmK+J8p4Tnj1+NPr8Y5CGPuvH2j6p42KmS55eoAtd7MzTl0g70wwbrTIF6KzgR
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(4744005)(2906002)(4326008)(8676002)(8936002)(86362001)(5660300002)(44832011)(38070700009)(41300700001)(36756003)(26005)(122000001)(83380400001)(6512007)(6506007)(2616005)(1076003)(107886003)(38100700002)(316002)(66446008)(66476007)(66556008)(54906003)(64756008)(66946007)(91956017)(76116006)(478600001)(71200400001)(6486002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?V2VOGADRdJDSiMQjVgk17zDw2tFwruQAz28K3OPkyPn56YAlsTH0U3yCV5?=
 =?iso-8859-1?Q?H45PpUavPwdqjYl/kJvO1Y4ZJuw+4xiLvjwbtE4iws5mdWvd6cK2LfS7l6?=
 =?iso-8859-1?Q?TsUyUY7lEswr3NEY4WE6sBpEZOFN5mjZeuo/Xytfqb8PD1rIqtkSllIgq7?=
 =?iso-8859-1?Q?tV+HBSEZottnnG1sJmf4KT4w3ypxEouOg13l9tiC8PllewshtzVx5KSPfY?=
 =?iso-8859-1?Q?JeESSJ+HBr80Ro88ZAugF8JrkZbixJv1SPOw76k718kKWK/lQESA7nAQtA?=
 =?iso-8859-1?Q?+ObjepMcVzotS91End+Q70ufzAxoYrQ0BTSaDQ/7FZn7kAOiZmrSgFlKOq?=
 =?iso-8859-1?Q?6BdirEnNmcNpPvBKCyG1d8n00IAFDpNR3c9UceaTVC8lMXByGz9TbRiq+D?=
 =?iso-8859-1?Q?EexLCUvCVL/vy+dZyF+tc5TuAPXg4GWvHq9+V6fsACYeptVcTB1mw4eHYK?=
 =?iso-8859-1?Q?7R12TpyoAis7qwASxHn3f7iL5o8p6z0/6s0EceGQCqZeD3yMEgi/8rmHPR?=
 =?iso-8859-1?Q?61Zx+W4oCuKn8xKkkrxAHqqNa9YcyTaoGhzhNC9vGSK8woqKX8z5Iapujp?=
 =?iso-8859-1?Q?a+X5Ikq0z+TDOs2pQVTdwuZk0Pt9f0v0JaR+LJD6q/Y/zUz1wEJHm8iU5Q?=
 =?iso-8859-1?Q?93Br2BRBRHdJJ+cym8Fq3V8T5qDfn5z7MGmjZz6vwDk3x8sFkOmgT/W4GJ?=
 =?iso-8859-1?Q?tXifgCwKVleZU+e1ZaKuAQ2WRwoZZ12PoPmgZZWG0ZQTehvXsNNdJHA5nk?=
 =?iso-8859-1?Q?U5h+OKkaNrJnH3AcIWtIfzeTTyVucDszw2PPS99Ev/mIX/wrrnk6ycsFOZ?=
 =?iso-8859-1?Q?aqs1Qug2r8pFm9n9Nkai48O0nQZg8W0WUh421p2W+y6oXjB2lI8wZztNBi?=
 =?iso-8859-1?Q?AFp0JvOFa0tQETlxfVR50JnZyZuIH11WUw+b4S3LF8gntx3ILnNDMqFgTx?=
 =?iso-8859-1?Q?kyBUEn80o8J5iW8dqyVqSpwgEQbVugn+mSSiAdAnFgJ5IFRHjIoMOmcK/4?=
 =?iso-8859-1?Q?187HNYITVmgBiWs+///4sowbkOL2hFQnZHGSQMgH+LTM5qNOR4yhb+9lmc?=
 =?iso-8859-1?Q?egqqYkxDYtrqQOIpL8EZUphjQLoQBZIUEIWghL5KN6pOBXx5s9Wj0Ft44c?=
 =?iso-8859-1?Q?6NDSjsLbOs0y6IBA1K9Kk16AAKqtch4lVPz+W/Qz4ZDiA4hA9jXZ+GKzUh?=
 =?iso-8859-1?Q?wR7761lPYcG2Inf9DuJP+y+0cLOcbRVAif7Ehbxy9dL2nh0YmRVlfurgJ7?=
 =?iso-8859-1?Q?OFDtB5mtXixJr1t3YEfi3D1On71q5wrjt4jIdEH2dxNYRBRbrF1aDe704W?=
 =?iso-8859-1?Q?l6Ve+g9eXoJZzZUb2DoXPZQqsxOLNKHRj+4gPB0Ns+Vw8pgukx7ypeZKGZ?=
 =?iso-8859-1?Q?Lvkxd9kQW6zAWuI2inlt9aPyJBdv2f5iiJmfiSVS2brA4HVcjXP5eD3RVU?=
 =?iso-8859-1?Q?lgCKtgAW2n/X3gWc1T5BpnlhEaFU+m6EDEsFt2zbQjKrk/BetsBT5HSbUI?=
 =?iso-8859-1?Q?Hgcp0geIoN5UbpYT8d366MjSGaxtq8uFI0ow66w3KGi1paVae6lNUBIxSI?=
 =?iso-8859-1?Q?Kb7Nq4gNO8NzGX3hwtJ4uy2EAWP7lCKt4HizhMI45BF8LkNiU7MlWGxGV0?=
 =?iso-8859-1?Q?z2LbQZb/JEJ/FL/bfg6Gh6+L3NTOxiFpon18h/ht/wi/USGyd1h1aWHw?=
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
	idlLnMfbHgLqG597Cn6rCLo1lb8lHDD9DgrMpeO3YzotAbxojIGCrMxJGghdTb9qEOLKjbpqHpxZaoAidNojWrbMF1a7IifjLbCSE7pprPXswsdtaoPlmv79woAMFtOQS9Chj5ts9yT+HQPPYDsL1pblJfRKr7Y0QobOuCOTpTVPBgYuE48YDYV6pKU1YP6rjGuOVRNOokUfCQ1bEGPcPxo/yIQV85sOoohGOVM0jFtwhfBHOnmM4+xqvQpsBqATupX/leOINiCXMYqJ/seQNrk4zBZwtanLkbG+1OTBIyVwSCOYFQW1pDTXS6fDIjrvStgK87OtjBJQx+ly2dqZR0flRoUBO4uv9I0hd45xMbKSze6F+ttpJGCGgOkUAKVmsjeQafhk7zzGDlvrXX1ktl1XCr7uhPu61YhVeZy+qJM6zYTeUBuv76S2whP0vB4Ddx0R9/Nm8vv0vdbnIkpIqG03lAaMXEQjmF6WjLW8Fy2aGMe8au9LjDvMFQP3U4bu+JXL+LVs00PSPrGVCDdF7eG+TQ4L3h1blQcVAri7dnORQ1y6Z8PV44Fq1utba/bcEWdxCng9HwDBTqVzu+x6yoRa+LIgF8GNLHkAMeysDDPV+5FR0h73Vz3YaDaz6B/P8jxWo9jmB0/Qq8lhI0e4qWeRdV6FhCoimI0es1MeDqQSvgyFkoQ4b95zPMvkEQ1bhfxr7DTNBwpJGCorro9F0X3wJhl2+5cLVieEgpuRF1p5LO1wP84LwdqkoEwyH9Ns1p13ywKI5bED29Mc7gjfTqF0NsysqRSYmnIVVUY2FbwyBiBeemLsAHJNH1o81xBiljfH+zFrZ77hG4Y7HzrFD9SO+GaIa2YCidnw4jrMPmfuxNOWI6GvQ+tT9+cT1DDHx/VNhJax+OSrxcSCrHpAlkwbMuWSmOVZLuZ9cYUVkI0=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e8e94e-2a2a-425b-52a0-08dbeabd32d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 18:10:52.5519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bBu9WfkYmsG4mVBkfkZC4o6Au28k4XOPT7hjTIHshcWlhdnHwglpDU3eBVhnB71vcq8rnBNZarpzmXkU8mPZx+p4yd4F1x8+aEE/zJ+eLZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB8561
X-Proofpoint-GUID: WZbP0DPvhb4Nid7_Xckx-LbO5c6F8aqL
X-Proofpoint-ORIG-GUID: WZbP0DPvhb4Nid7_Xckx-LbO5c6F8aqL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_10,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Reason: orgsafe

A couple of fixes for the Xilinx I2C driver.

Changed since v1:
-Fixed an issue in first patch where an additional message could still have
been written to the TX FIFO without waiting for it to empty.

Robert Hancock (2):
  i2c: xiic: Wait for TX empty to avoid missed TX NAKs
  i2c: xiic: Try re-initialization on bus busy timeout

 drivers/i2c/busses/i2c-xiic.c | 61 +++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 25 deletions(-)

--=20
2.42.0


