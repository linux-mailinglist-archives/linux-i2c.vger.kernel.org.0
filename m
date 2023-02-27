Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC9DB6A461A
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Feb 2023 16:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjB0Pai (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 10:30:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbjB0Pae (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 10:30:34 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC6A2311B;
        Mon, 27 Feb 2023 07:30:32 -0800 (PST)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31RF5PqE014106;
        Mon, 27 Feb 2023 15:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pps0720;
 bh=QmXtMT0pl+gbgcimoPq/D85HV0a9v1loaI8mu/urdLA=;
 b=Nie2Oxwtc2nhwGPZqf4Aj69YWRHQCdXU30q2viMRyq8I00F0qifJNQgwpe+UpLAR+mHN
 h5a9XpwNduJ1Hnsw1TwcK3PwevOKgEs13pduZJYxX/GVDFmFU1T1ud1LEqDDOqxt/8+7
 7Du8mQpB6dDO3k8ySD2cV83+hwtcBhoWxxM7/7cRNtDLsRgyJH4AWfmLaGRtL6dbeCUQ
 IBuuqu9i47jyfCstePR7chJPP0OttX2LfcBflRUL0iUkThNXNTWYPfNajS5/CQvU35CP
 PW7NK++kzOXWH2jFhwCHCDRnEyc+C2unuYc9IjSptgDbyCp0cTQkzNHYnG0dOO9cfF12 cw== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3p0xuugbat-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 15:30:16 +0000
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by p1lg14880.it.hpe.com (Postfix) with ESMTPS id DCBFF80035C;
        Mon, 27 Feb 2023 15:30:14 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 27 Feb 2023 03:30:09 -1200
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 27 Feb 2023 03:30:09 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36
 via Frontend Transport; Mon, 27 Feb 2023 03:30:09 -1200
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 27 Feb 2023 03:30:08 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnZ/a9N21AHnKItR9FTmlf8COFUK9w+XlSiVWViAW1OWTp7YqUpWBjDLkO/Jg9epoS/CQ985tKILZsABf9sXX9YVjYWrMvzM8XuSR//2XulnD+yE0wJABepDrNrhcU0479cnKvyuO4EO00KjvxRLgBaA+drsnQBpJ35yTiN0iLda2NauRJb+BPdcnjUziGIIQsCp0gqF07UqnTeVkSAAXD6WTi7CgflvnX40CgwyR1AzqzowY7Z+iOgcxKLEJdebYwt9EH4+qRmK9tbGDORNwEqhWNZsDowOZj1UL/C6Kc3xAPsBQeNtba+oQksazQ5L/TYtiriTuIkGd1E/eYHEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmXtMT0pl+gbgcimoPq/D85HV0a9v1loaI8mu/urdLA=;
 b=UyPvRlwAVDIMdmcEeeGmQ24a65Da13NAwkxLtO3QuN2dyB+HyERJqWMmQKGvtKCDcv19fv5AMbIs9mO0t3fvD7C0X7sepjVeqmQkUOaKvgYlaCPd3lf4kpg1sQyiQ176CXuEHXJemUbjsran6cTi/6zTjpHph4rev9AjExXO8sD/GU5jaghvDuiiEhbxkofk93MPD0/ckuQLbVRTU1lxSakloLjuOWTuATM/I+IcGRv59bEcgwtZKTQ5P06IJWIEw/izE0re6AWHG6BAspdJW2TfT9ADcoISAOYffhLXYXqz/qxInrI1iE9HcgVAASli/FiRPf20Df1fStdvasM82Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 SJ0PR84MB1386.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:430::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.28; Mon, 27 Feb 2023 15:30:07 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::ee74:bb9a:75ba:71d3]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::ee74:bb9a:75ba:71d3%7]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 15:30:07 +0000
From:   "Hawkins, Nick" <nick.hawkins@hpe.com>
To:     Dan Carpenter <error27@gmail.com>
CC:     Joel Stanley <joel@jms.id.au>, Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] i2c: gxp: fix an error code in probe
Thread-Topic: [PATCH] i2c: gxp: fix an error code in probe
Thread-Index: AQHZSpM8niLXQca85UaxcksNQTSQv67ihwAA
Date:   Mon, 27 Feb 2023 15:30:07 +0000
Message-ID: <58B3E913-D162-4672-90C2-66462F0468BD@hpe.com>
References: <Y/yAqRlSTN5VygUy@kili>
In-Reply-To: <Y/yAqRlSTN5VygUy@kili>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.70.23021201
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|SJ0PR84MB1386:EE_
x-ms-office365-filtering-correlation-id: 375685ed-41cb-4ec3-ae9f-08db18d78191
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EVCVBrXFhf1R1NS0Ui2985OZQMW7Wa4U/1cgtfnjBupynSQ0VLdBKdO0mSyK8jaVHm/LnTM+L4JXG/phO73BNQgn41yYy0hphcGQU5KZsgKKiViyz6ngnlOvSnyoD5MAS4FoiHwd5IoYs43HSGk/e1xi8Ui5uoiTgSRf3K/mDjhk0IK6ptkskx8qD4eCVQTr+D41AoFig1W9bGHyop6xTXnw4Xhyrfw6L22ojOH42CSSwP3tUifdsELINdbTPY4s3kxEHpyvR2RNJRpgdfYEoT+sZjZAptB5TS88LpVrFvOjsm30sk5JK27RFnAZqnhOCbKGsfe6QKUnSFm3fDepmbyQBMYS/8cMBgbU066hSL+U85gFuPWu19fHouy+4v6S7A0PvON8ETYyQVScM2lJq1NBZ5UJPZrtnk+u+cXyOOjYt8KANoRHJHaRGYBL6IRDKEERbOQtxOM+8v3IDy4pG0gh30vCL+MyDSYLTVUqyxL0JVrpZUOitR3JU/pu/4pF+8GpNqxcqOzMmDSdVU79oA4hW+IR5DHknu2zihBpy4YG9C2AsgE51n3j1i2OHe9CXhL5pIMB8XW05UIB2TvrKs2KvVlFcJBs3P6RZrTwgW5GNfA4fqvdXqadRjq8SFrbRvDJG4f7ohW2bGiJiQdsgkPo2fpf6+aUumN6QLVEqNwTbEfn4EOeQad46jGw76SK20b8RwmK37acw3cu0s1XkS7nAagt04+rgvoCSlijp98=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199018)(558084003)(33656002)(54906003)(36756003)(316002)(6486002)(478600001)(5660300002)(71200400001)(2906002)(8936002)(91956017)(64756008)(66476007)(76116006)(66946007)(66446008)(66556008)(6916009)(8676002)(4326008)(41300700001)(122000001)(82960400001)(86362001)(186003)(2616005)(6506007)(6512007)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGdKWUZYbWN3cjIvckJuNEx2cUhsMWd3WlRyMjl3dzhvUDFyQzZ5TVd3Qlhx?=
 =?utf-8?B?a0dEWFhubHVGWjdJcTNKVmtmSnFwTEJCclBmSnY1ZDVjOWpTaWNBaHlJWEQ2?=
 =?utf-8?B?K0JXZHBiTGt1d1VCcFRBUDJ6L1VQdHVVU0VDcU9mcHQ5NkZ0OVE0WHN4QlE3?=
 =?utf-8?B?VnRrWS9JeEN2dmpWa2tJcHFNOVVMZXdsY2FnTnBNcWh6dnd4UzdFY05nMmto?=
 =?utf-8?B?SWo5MHo3c0UrWXlhZzlJUjF3cU1kcnFoMEd4VS9mQzAyL0xka1ZKeFRnTGtr?=
 =?utf-8?B?dHByelFHcWhLUGpGY1ArbnRqYlBUTUo0TkZNTkxZaFVjRDJzUkM3eEp0d1Iw?=
 =?utf-8?B?WUJLZWRFZE04RGVoV0J5RmxtYUhiSGpaaTROVDlrMXAvY3RUeHdkcE5TM3Fq?=
 =?utf-8?B?U0dXUExsbTJFNElTVjdQdVBuZ3dJVGNwUVhtZlBCMGw0bkNOTTlKbjhyUXZP?=
 =?utf-8?B?T1BTSyttMXJJUWpJUG5HQk5VSUZMUjYzQllTWHBhTy9DZEtXNjgwenpFU3Nj?=
 =?utf-8?B?K0c4S0hPbEtuMDlqRUk2STZhOWs5Yy9oYmxnZXl0ci9ZeFpzSTVaT2ZYK1Er?=
 =?utf-8?B?Y1NQMmphTnZTQzMyc2djRXVaTkkrM0VPOW5yZlN1TXUvUVZzMUVLQW4vUGFW?=
 =?utf-8?B?bEpYb1BrOWNHZ0MvOXAyZlFRQmFvRDZhZk1ERTRzeHZndWxoTVBjU21CcFdS?=
 =?utf-8?B?WGJVNzV3RnNDMG44Y3paN20wdlpCL05JRHMyU0tBR1dDZlNsdzYvVWZjU0Q1?=
 =?utf-8?B?OEczVWdRNWlUaWpLempjcGVWd3Z0cklYTElud21JaVdKS200OUZERkF4NGVo?=
 =?utf-8?B?OWlCU2NJU3NmZWROTXhhRTRTNVhidFMvejhEcVUrUllrVzA4bWxhMUxGNXZ0?=
 =?utf-8?B?RmtZWUNBblhXaStnc2dqTUx5Mzk2Vm1SY1pSa1VJZndnSmcrQ3FqTDU5NW01?=
 =?utf-8?B?aWdzenJaZWdIMndpenBGRStuQmkySWtEVXp4cXNEVjdQcmxLNnNFTG56SURB?=
 =?utf-8?B?a3JuOGNNUnpveTdWZkd0NUp1VjB1Rk9leHNLY1RDTytTSWxRNUg1VHJjeTdr?=
 =?utf-8?B?V2E2MkpoWTFaWXNybkNPN1gzeU4xcG1WTldhQldLQmJMaHdnQmY4aVpreXNa?=
 =?utf-8?B?azl4dFhIVlc4Y0VPbzJLN1AyTzBFelJrNDByYjM0T3VzcmE4WXlRMHBBOW53?=
 =?utf-8?B?UTRDdmpnbkRHMmVCTGxicjJzZ2JielFlZ0J4cUZ1Ky9Sc0tlVVNuVHVURUxp?=
 =?utf-8?B?cStQSVVKV285dFVDeEZMK1ZlWllOaGFOZnVLdkxFUFh5WkJsYnp3bDRwckQ2?=
 =?utf-8?B?QkFLelZXWEFiREdieExqSFJPNmRMZ3pmY0MvajFSdlFXenU1ZU5zcERpcWNP?=
 =?utf-8?B?b1pQZkxoNlNxRGVnVERiZlk5QVg4c3FwMitIckhmbFUvMHVKUHhiRjE3UFRK?=
 =?utf-8?B?dzlobzRzVHRNQ2lZa3lRdGZ1OWJQRVhhL1BxTE4wdTVWN0JrNXlkWFhvV1g2?=
 =?utf-8?B?SUphRCtKR254aWNHUnhIZUtKbEUyTzc4QlV2ZkJQOXlzZW1ORVN2bElBdFNu?=
 =?utf-8?B?N0JqRTJMUkJEUG1ldWtweVd1NDREQXZDZUdQZzRRWlo2bjlLNFZMZHR4TVFX?=
 =?utf-8?B?eS9XWEFmWmR6TmRaOTc1ejRZZWJIUXZOT0djNXhPdy9hMTNWM0hIc1lpU2xL?=
 =?utf-8?B?cjgwamJwSE03UUVoTk1LbThTMEZNeXdXeXV2b0RQSjl3VFhxWFFQaXNWU1l1?=
 =?utf-8?B?L3JEV1BENWdWSERhbzNhZTMxT1dEejMyMEJGUDAvUklWNERUTC91R3lnQzlk?=
 =?utf-8?B?M3Rja3Q3VlhpeEpGenNCTWNxUzNCYzQ5OHFxLzVzSTRRcTFXZGR2V3gzbHA4?=
 =?utf-8?B?UWE0VUMvU0d4TTdaRzZoVUJwc1J0ZmcvMFpoc0pTNjlFZFB3b1EybG14NHFs?=
 =?utf-8?B?dXR2MEJjRnVsRWlkVUQvaE0vZXlNdmhNUjdneDY1TDVQeVFQcGUxOUJKanNL?=
 =?utf-8?B?d2czTXhGZ3ZKaytQdWM4VngxU21NRjJWOUdPR1crZ0N0UTk0UGZZSzlQTmpY?=
 =?utf-8?B?ci9NZ3V4Nkw5NXJDQzRZSURhU2k3UmQrYm85czNhYWVxS1QwNXNQMnJFUFpj?=
 =?utf-8?B?c04yS2ZvUDZBNDVvSWxnbDNTVzhzQWNiZFM0VXFkbW9lNEM0R2M2WHAwYXNV?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34124F8D969A0344ACCAC4E78E9FF69B@NAMPRD84.PROD.OUTLOOK.COM>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 375685ed-41cb-4ec3-ae9f-08db18d78191
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 15:30:07.3275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LA42epotivc35uRmzoAMd8egm6ZqVH+pTweAun61yWIgr+a/nT//ps16mlmv5fSHLVKUbBa30V6CJhmm+Rllug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1386
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: y-GxqDqSX3vm7JmTSMMV0evNXLECGe38
X-Proofpoint-GUID: y-GxqDqSX3vm7JmTSMMV0evNXLECGe38
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_10,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 mlxlogscore=445 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270117
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBUaGlzIGlzIHBhc3NpbmcgSVNfRVJSKCkgaW5zdGVhZCBvZiBQVFJfRVJSKCkgc28gaW5zdGVh
ZCBvZiBhbiBlcnJvcg0KPiBjb2RlIGl0IHByaW50cyBhbmQgcmV0dXJucyB0aGUgbnVtYmVyIDEu
DQoNCg0KPiBGaXhlczogNGE1NWVkNmY4OWY1ICgiaTJjOiBBZGQgR1hQIFNvQyBJMkMgQ29udHJv
bGxlciIpDQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGVycm9yMjdAZ21haWwuY29t
IDxtYWlsdG86ZXJyb3IyN0BnbWFpbC5jb20+Pg0KDQpMb29rcyBnb29kIHRvIG1lLg0KDQpSZXZp
ZXdlZC1ieTogTmljayBIYXdraW5zIDxuaWNrLmhhd2tpbnNAaHBlLmNvbT4NCg0KDQoNCg==
