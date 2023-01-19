Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA36673D00
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 16:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjASPEl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 10:04:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjASPEe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 10:04:34 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D0F5DC39;
        Thu, 19 Jan 2023 07:04:20 -0800 (PST)
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30JEQNas029658;
        Thu, 19 Jan 2023 15:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pps0720;
 bh=tKMhP6/gpGCDlmbqusJlm7zd0+p2fQ5A4lVRSanR7XU=;
 b=cDGeeSSBQQVp8utZY6s3W1thAIvAw/y4xMvo+WM0eTXt5huo+9xoRl9zSpyKTFu2ctqG
 DpvTN88IgxEV3Q+hHr7Ge79D6Dp1NqnQSwlny9AW3c30kTXoEYunsAnKHlyPOKM7H4e3
 VgAF3ON1PC//Ov/kdKRD/DnDWuvRAZEGFLVOQ35MOQTps+bjhAovfJ6pJYZbrpif1qgh
 nA6Zgn7bnVrhwbbep+i6ODISkSEzagFPkNp+iw5PRoJG5ZZ0U5feCB98y+iiGk4mRgqZ
 dX11bP+IFoEZ3ElpLfFHTt03NjkuF5VaEvd9i9Z649SoqJjxuW33yREFpYzkyWEKFpL1 WQ== 
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3n73w5t73s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Jan 2023 15:03:56 +0000
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 63C6F301B5;
        Thu, 19 Jan 2023 15:03:55 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 19 Jan 2023 03:03:55 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15
 via Frontend Transport; Thu, 19 Jan 2023 03:03:55 -1200
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 19 Jan 2023 03:03:54 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClQ6uvqkmO65YaCQxqsF+jUjXDF1IyPq74ADW3C1woJQfVOKwqXz5ekDv2xfDBSJq28C5lA5l23lvSY+r0H3PvXIgZDoeE7au6g7XmRN5M3VQnAupAD7euGdu4TnaJ2Hb/R0ASiNzPcLktHfqOF18s/y3yBFTPr1mVp9Q4VfZ3SI8pd6DgSDVRPZeJO2OZXLA7bTPxkEiZO0Qptmm5HqNWjjoPr6otPS2q8PRHytZJCWiOx5d7riNveyS20goZgZ1jMmQyo0zqC0cnhLcuY4l3sokgLGbYjDJ5fZsFYkxPsy7ifVP2xuKoCTtpwbKJ3VEamoOw6zr3GXH7hQ0KuySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKMhP6/gpGCDlmbqusJlm7zd0+p2fQ5A4lVRSanR7XU=;
 b=eSkFC477Xug4hCgsfio+ZEnZWU3O7N2AD+ly+Yx5rBjYp+VWySziTOIdjVUGBVUaDLbrC3cNasYLGB3jexqvHa4D7ORpf5dmvcPnTrcVJU0oFX7t37/sTusrW1yd543XSsf67nSNY+NZLWxQQvrf6oSTZhk9o305Q4glEYTVzkv+KiK7rJ1XMIK6Qhc1+nuIpwQcBek6ILl3B0b6LxBS5+ORRD8GT3R/ns8C87LTiFmGSo1bc5CCeXz7Z8XHF+8J7ecX8AYXw2wjDFWkS51lNBuCAIxEmVVJxAcFuI+eWKTBk/Ev7onTxDil5KPHEu8nk4rId02gvB5JFqyTNLGLRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 PH7PR84MB1653.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:150::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 15:03:51 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87%7]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 15:03:50 +0000
From:   "Hawkins, Nick" <nick.hawkins@hpe.com>
To:     Lee Jones <lee@kernel.org>
CC:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/5] ARM: Add GXP I2C Support
Thread-Topic: [PATCH v2 0/5] ARM: Add GXP I2C Support
Thread-Index: AQHZKrTXNpoJhpgmhkqmb9sGeizDM66lzkQA//+mNYA=
Date:   Thu, 19 Jan 2023 15:03:50 +0000
Message-ID: <899B72A1-4084-4221-800D-EF28B99F497D@hpe.com>
References: <20230117204439.76841-1-nick.hawkins@hpe.com>
 <Y8lSyJWm+JAQw3AW@google.com>
In-Reply-To: <Y8lSyJWm+JAQw3AW@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.69.23010700
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|PH7PR84MB1653:EE_
x-ms-office365-filtering-correlation-id: 4f02868e-f6d6-40cf-7e3e-08dafa2e5fb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b8xEog+snb+93Fqk8m2GvEPfJIkulHeTQkyELILjlnIefImPWsygSR4ma36Qf2HzHRsQ38NjQB5FJEn/v7l+qEe+Uva/QQOJzXbZ0ClEFVP/bHzV3wAGyiJei352B71+iKbtpBra/KcMLYM6l49+jbNvUk8IHmjnN0AWlYRw72kWt/WnX5jbfgewOQlO1dBUIIeyWXeqHGHATTkrdejTpHoSxA/SEdIVXmJ2dmuVVmOEON+qNADH5Gfhh/HNYFyDb5l3lpCJiDpEVURFAkqko3S6QxiBk6YeGS7JYNKTMERd15n8GWNXZgCDXFTil7ZGW6H2ycno9uc0yzDy5eilKTurHhd9wP6Mf/ZOGchx4PyWzpe9mahmXT7oAzlE+38cNNuMglNsM7FHPWmZKhQrQzWsx9Ey0JFQ/rv4ctwgtWoouaOTFZcQ76B6m4gYaF+ex5cwkqpatVFgjHuPZfUvdhW22jK2RpXKM89fPUpKlkw9swnRwEPqseJ8B1HEN+j7lUktLdTgH+1Yw2pdCQoOGyahe9j+InlwfT/jPK1krl5XP5GP9+i5r/6uJ2UB064jbaM5UbTebVFDc/JR+MX444lo93YleOjbqKXt7St3q2+cwdUwe4OFVEwC07j8iJBBvmH5KwO3Rt8EGC6Umrpggo2sYdbkIaU1oywGotNeNA7QERg4tbcLf32Q+uDNaFI0prwFxz5CV2Mlx5PAAxog/34WcfZ9zLDdLSYL89TFpxw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199015)(86362001)(2616005)(4326008)(66946007)(66476007)(76116006)(186003)(66446008)(558084003)(8676002)(64756008)(6512007)(66556008)(6916009)(41300700001)(33656002)(8936002)(91956017)(36756003)(82960400001)(5660300002)(38100700002)(478600001)(54906003)(316002)(2906002)(71200400001)(6506007)(38070700005)(6486002)(122000001)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDQ1emJDejcwUmg3dEY2TEFVOWtwNCtKYTNoSzZnMHk2alpGaWhubUhSellO?=
 =?utf-8?B?YmdMSDZrWHJUaTFnaVd3QlAreUhDSDZjb3UxZXlzQWtacXF1WlozYnFiRk1q?=
 =?utf-8?B?dENlbzBXM0VmSEdrMUUyOU0xazhvWTVvOVIwYmdnZUhMQk8zaWpuS3NJVW1L?=
 =?utf-8?B?S2llYVNWVU50eGdqZnN2YnlqQkVmRGlCWUJZcWgvOVpjRVlSZmdUcFpMUDNp?=
 =?utf-8?B?cUc3NFdPWG11WGRkWWMwV1Q1Nkl4VkYwZVc4M0k5M21iN09TOGlOVG9lT1Nz?=
 =?utf-8?B?U3NnYllZSWhKSk9VZVU5VUpxempiVVFGUEpOWVNJU3pzNWZ2aDZtcTdXbU9S?=
 =?utf-8?B?ZmRmSWpISFd0TnZBckI1U2ZrQ3NhaXJzZ1R0bjNHc05OY1VSbzBFSjdSOS9x?=
 =?utf-8?B?cUpXdjQ4T1U2R1BDVkgxNXZqYnpoNk1wMDV5TlljRDBSVUxzUm1WMUpyckJp?=
 =?utf-8?B?bVZBaDdPUHRINGNvTUlJcW5CNU5vUG43TjJrOGhoVmp2cjZ1Q2lzNTRJME56?=
 =?utf-8?B?V0NzZmdFTmlLSXd1N052NDhuam92NXlwZUVZOEFTUk94MmxseE8zSjc4VnFT?=
 =?utf-8?B?M3dEem8vdjFVaU5LYXg1dGZNZE9JZ1dKTWV2Wm55UlZIVkF1VlJ3dnVGNDF6?=
 =?utf-8?B?ZWhNNzZYT0VLK2N3dGFueEZCalNVQVY1dFlQM3l0YzdtMDJhV01JNmVMNFBU?=
 =?utf-8?B?aHN4Z01ja1k0MEgzSko2VDNjNFptUWJ3bzZvMm0xbnZ3T29TcGw0eFEySi92?=
 =?utf-8?B?MTJDc040UGdaODNneG8rRlRsVnZFT29NVjBxbjhFQm5xOUZaejZWTTF2N2I5?=
 =?utf-8?B?cWRPVXlWYTQ2ajBpd2VOdWo2YVBmMmcwTmtGN3NnUjJFQ1VaT2txUGc4b29N?=
 =?utf-8?B?MXdoVHNTcldka1pDL3Q5cThESWFkeWFXNkpOaFhXRkpFUXc2b0cvTDd2ZzVm?=
 =?utf-8?B?WXAvRzBHaE9od2lScmIzZ3NqRTYxOGZBQXNiRDkvTmEzSjZhelRWR0R6S2JN?=
 =?utf-8?B?N1daeEloSFo5OFBDV1h5ZGhqTVZobzlNTGdUS3BoV3FIQzcxZmR4K1ViR3lh?=
 =?utf-8?B?ZU9LdjJxNmxyZGJFZFhlMk9GT1ZKcU4wT3IvNGNYL0lBVm0vV1F4YlNQUHNE?=
 =?utf-8?B?Qzd1ZWxaUHFwbDdtOGFYQzVOeitKaDhuZGlQdjEzS1hxYm1NQStuOWRKbVlw?=
 =?utf-8?B?US92cWkrVGhObXNpUWF6OEVFSGxYV3luS2IzRC9TUGp2cmdJOEFHcnJJMnNP?=
 =?utf-8?B?a05FL3VKWEczd1dJYmppQXZGQXhFUHNCVDhqSk4xNVpVL0srNmwvY3JYZ3dY?=
 =?utf-8?B?TjBFdFFYemd6a1llU0w1SUtDYkFEaTZqcVhoTlFFOWU0TmZtaDVSQUtReXdN?=
 =?utf-8?B?ZGROU3NTSENpR0htQ3JyLzduVkl2cnFxV0xTWUF0RndBOXQweEdRQ0xkMDFu?=
 =?utf-8?B?NGJLZGtuVmVrWkZsTHlGVFZnaWtEeGFodis3R1B1ZjVHUHZZN0NHTkpVb1NP?=
 =?utf-8?B?bUJaMXlRU1pDVms2VlZGcGZVaEkwZFcxRWttaG4xeE1jSFJHTzlXK3dOM3hN?=
 =?utf-8?B?RE9WYWoya2N2NW9CN29JalRReG1MTWlWZW9VWktXMVV6MStrNkJFazA1ZE0y?=
 =?utf-8?B?THRQZFJCWldDZ3QzYlMxRExOSUU4OHdLK3A1Mi9BYW04TkVPYnlzWUhGOGVt?=
 =?utf-8?B?T3k3WWxtc1JxWmFmRG51RFFXUlI5TWNKczg3ajdkMUNQR2dwUFNjRWUrZFp5?=
 =?utf-8?B?YUZ4NGdlN2VFZnBRWU11R2E1aXhwV1VUdkE3cFQ2K1phYVMvY0d6czVQNWhQ?=
 =?utf-8?B?VjFXV1ZTUGNKVzU5U2ZZeDg5RGh0L1RNNUxvR2lTVXFOcFp2UTBnSXJLZEhx?=
 =?utf-8?B?Nk0zVW9GQnhlOG9aNy9ra01kUUJlakxwMEh2MXhzVXcwc20vbDZjbmZCcmpz?=
 =?utf-8?B?OUxwN3g5Ym9CMVl6NklGVjFmM0xjZ05yQXJ4OUZ3eFJRTDF2KzVMbXJGYnNG?=
 =?utf-8?B?aCtWazJZL1J6RkVPYWNRVUNtWURPSWczSm9LMDBGcTdqODlybjRIN21hSFlF?=
 =?utf-8?B?ZVBQVlJlYzEveGIvemM4cC9jV3BndmpkRlpzeDZDY0ZoUmJmL1J2R3grOVBo?=
 =?utf-8?B?NUpkSHRVR29NbG5qaFdXZnZLOWZZL0x4ZWNrWmgvaTJzR2hCUFFhQzdKd09j?=
 =?utf-8?B?M1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B4CFDD096CD9F46ABF1C0021F404685@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f02868e-f6d6-40cf-7e3e-08dafa2e5fb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 15:03:50.7269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jRRRSCGgCzl8t7L6DhtLVoAj6s5AObXvAQMZgaTDo+5mgLPxBWsfbB+TOcchf1xTo/D+iTnk1OIsOuyCuv6v+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1653
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: SAtYpYLxAma4nKY80iE8JSblfwJy6YRq
X-Proofpoint-GUID: SAtYpYLxAma4nKY80iE8JSblfwJy6YRq
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_09,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=551 spamscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301190120
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBOb3QgdHJ5aW5nIHRvIGJlIHJ1ZGUsIGJ1dCB3aHkgaGF2ZSB5b3Ugc2VudCB0aGlzIHRvIG1l
Pw0KDQpBcG9sb2dpZXMuIFRoaXMgd2FzIGluIGVycm9yLg0KDQpUaGFua3MsDQoNCi1OaWNrIEhh
d2tpbnMNCg0K
