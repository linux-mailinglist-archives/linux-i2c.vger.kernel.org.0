Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51E40678737
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jan 2023 21:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbjAWUGs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Jan 2023 15:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbjAWUGq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Jan 2023 15:06:46 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50A3D35267;
        Mon, 23 Jan 2023 12:06:30 -0800 (PST)
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30NK2LFY014648;
        Mon, 23 Jan 2023 20:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pps0720;
 bh=7LAWZ9PDVlP6Ota6MntEcIt+FuaCxLDgbTmA8RzXIaY=;
 b=g1cinfin9zrbpaymPc01MGX4uu5g+iFXSwdgBMK00OFnRhpIzkCqJlsX3gWpYNWDzdAU
 ifUFROaDBQs+b8AgKVgJmxUHfsr+zxeY1N6ThBT11z14zTyFz696kJyBP2kZfiTsuYj5
 m5arIY8tymBU7h21+hYZ9s0z9nZTo1wyhyR6cEhLnmAW9igurvqQ2AMYCYeCA8/cGkZM
 o8MO4MzlwI6bp9NE0aUKZVuFHG5gyQE2l/qNwidtrYiC2N2xHMDzq8G+tyvMR53F4isp
 QgavYOZSFmBYO4m20oBARaxFlosbkPI+FaH3aiecPl36quugmtbaYfsETQOOCFs/QXXv 3w== 
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
        by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3n9ypt0stu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Jan 2023 20:06:09 +0000
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by p1lg14878.it.hpe.com (Postfix) with ESMTPS id BD0C9301BF;
        Mon, 23 Jan 2023 20:06:07 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 08:06:01 -1200
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 23 Jan 2023 08:06:01 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15
 via Frontend Transport; Mon, 23 Jan 2023 08:06:01 -1200
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 23 Jan 2023 08:05:39 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiYpKLx7BdxruVUm6qFe6DVzVpASho43i4J8EnQcDKgQB2XJMHDkcypcT6XxNSbz4dwUX1cWVSofvJCxy4VgUiqk6niJt4ikkqFUzH8iAlRNc2CBqNaZzhEswKyv9EqO96Y0OXjawJhKXj5RkCAQULWgcp0eFrBtw8pAam/DJAFBtMTX3K1NxRmdJ/LZemNQqA0PP+ijj6clTUoU7phF/LNy6PpHBDzSSJMfHLzK6m9QzwCFx37cQMqebobsX9j/HubbIQDsmIumBFvoQTMBgWp4FTqPqrQSFlIciFwZOU2P1QJGLzqVB5IPGjijSoLtWKMCOOEMi6gqkywHJq5C9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LAWZ9PDVlP6Ota6MntEcIt+FuaCxLDgbTmA8RzXIaY=;
 b=T3hbzNgGmVmVQiV9W9GGcJkP2h6zkhbWZVo7N+pAV5PWfSsw9BwTWKDZC3HSiDu05jhLRFBNpvFadEkDvLtj7tugpN9qtQqHdLGSYquxhTnfBv2EBNXPIs7Nfk3jylm+bY4T+3SxNwb1tPnMc+OwGyjKtAZx1WWKbmp+1jlhcbP7EVck6yvevLJACYH/qrJu+6l4cV4Xj38QFrsAfPxG9lt7t8nzA/+MrOiG8ZdMqJGXwP/SBa1ilijVF4nFlVAutmBOsokAqIapP7TQYW1Z9OCk4TD0nnxk6eDpeWw/JDgM0a9EyNACtLE5DRdXY6xMS60T+oVawFe+uPtQ94k+hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 PH7PR84MB1416.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:152::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Mon, 23 Jan 2023 20:05:37 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 20:05:37 +0000
From:   "Hawkins, Nick" <nick.hawkins@hpe.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: i2c: Add hpe,gxp-i2c
Thread-Topic: [PATCH v3 2/5] dt-bindings: i2c: Add hpe,gxp-i2c
Thread-Index: AQHZLQH85GIN3INqqUKmNqzALoyCzK6qemkAgAGTGgA=
Date:   Mon, 23 Jan 2023 20:05:37 +0000
Message-ID: <12428676-2923-4AAD-9963-AA701A2A5E90@hpe.com>
References: <20230120190159.23459-1-nick.hawkins@hpe.com>
 <20230120190159.23459-3-nick.hawkins@hpe.com>
 <d63231dd-38a7-2cf4-3433-8f28018665f6@linaro.org>
In-Reply-To: <d63231dd-38a7-2cf4-3433-8f28018665f6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.69.23011802
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|PH7PR84MB1416:EE_
x-ms-office365-filtering-correlation-id: 88985395-0d94-4b64-5b63-08dafd7d31af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SVa2eaTbVh6AcQDyOTDP8uTtToY17yJrgjFl8tZiEuqLz8iLc/6eF4SNtPsQhwV91l/Dze/gMiVBiQGjlv73I8BbBPAoh7ZPBUX5kLldLUPlCgTYUimAwbUDTkyP29Ys4vXicw4D9NI/kSmK7occ3xGGpvI8mus3XHDCrbGPMYyeH7OVNpLvcmhRZE1p40fM9aZtJnivlRQvUU+Spsokehy9olBEsxdrVBrCtib8slFFFZSmoAhOXHpDUPaUWwOHl9CwSo/zHGLSTUaZ6xgsphUtd0H592M0BTaEev0byuv0W8pLUrpx2g1S6J7tu3eEqn5YFwjja3QMQd1qKCUhnFY/5XCIM+ja1TTjBbKDTlEF9SAE7IXJ+xM5wVICFxH6tFq3K1esQKYbRD8d+YKsCcxU+Re8rS14+rFBBni4KLMCVN3hqkrRsy6UoGhOyQ559LZvE6yhHo2txF4IHKFzisXmKwMaBqTd24+r3/QOReIgJGAxh83Sb/enPUXDxYL99kZhf8PkJrxmUmT4A+8if1zxVrGJbI9T055Og6Cnz0G0Grir2z0I9573r4uD00xXhx+MhXjqrtGCwMgnA+hk/G+b3fAZuE+Lr1FJdRoOS6xqNJfAvfEoU0D/ctrU7cKHWFTnlnfYq8TjDcYdXE2HOr9F66mn2rl3DpAghp3YBZ0PEe10WBhmevxCR+Ems9DewIWsgpflPM9w6CGbJ9U2p6rZmE7pJ6KmyiK795Sre0k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199015)(8936002)(33656002)(2906002)(4744005)(5660300002)(6486002)(186003)(6512007)(478600001)(2616005)(83380400001)(6506007)(316002)(66946007)(8676002)(66476007)(91956017)(6916009)(76116006)(4326008)(64756008)(66446008)(86362001)(66556008)(41300700001)(71200400001)(38100700002)(122000001)(38070700005)(54906003)(82960400001)(36756003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmtkUEJXdXFPSkg5K3E0aG5yTjVXUG1HbUpCcDV3VTYvNStuMXlyMDJ4TGd1?=
 =?utf-8?B?WTZIQ1dkTlFSYnlPM1RDTzdFZEZZZ2JkSjhHZHdmQU96TWE2ZkNJcC9mT2FO?=
 =?utf-8?B?VlFUMVRWNUUrWDdrZHFINmVmWW5yVktNWUR1cERrT1ZYTkVUME5oOTJZVmRi?=
 =?utf-8?B?S2JpNjViam0zNVZIRGpEM0Z2S1N2Mm0xTkJRN2VKZHkvL2JMRDZQakFXR2dH?=
 =?utf-8?B?YlZrVXhuK2NsR2ZZUFlXN2I1ZU8xRTJseGt6QXZrT2ZIMTRaN2doWEpJMzl4?=
 =?utf-8?B?dnA5ZXRNV1VuMDZtbDh5NTcvNU1vUnJ6WWJ4aFZ4ckRETDVBQ3dzaGNtVXZu?=
 =?utf-8?B?NnVydWptQjgxbDZOYW5TcFNwVEsrSXBtUHlZSHlROHlLTnQrbzdDS2JXQklB?=
 =?utf-8?B?dEFjd2p6MGE3azV2ZGxKbzB2ZmJMOC90ZDNna2JFMWZyamdGeFBabjZMQXk1?=
 =?utf-8?B?anI3NmVac3RKNDh0Tk5mank2UDBEOVRQREpLaU5HQ2g4Kyt3aDhyRWxLMFN2?=
 =?utf-8?B?QURBQnNVazdxRWdnRVBvdWVVNjRJY1dyelZjeGdUQ05yUG9YSER2K2N5aUhx?=
 =?utf-8?B?OTIvdVM2a3d6cFZxd1RacmVyNDc3THRkZGU1OUNmN25aejFwTmFjL1RUSWtz?=
 =?utf-8?B?TFd3QS9Lcmw1YXlaMVdDb25wNE52QzV0WXNCbTVsdVozdE9xZXJpVUdhem55?=
 =?utf-8?B?RlZrTzV2dElyK1dwQVJqZDV4Q3lHd1o5cGJsenRwSURFRkNSZTdmTTVjWTRw?=
 =?utf-8?B?V2RTN0c1eTBmclcrUWZhVFFBNUZXeWVhMThuNDFUSFFyMER5UzhVdUtyS3pz?=
 =?utf-8?B?WSt3S2NBN29IVCtjVGRVU1NQTk1ZUDh2NERNaGxYS04wWTYyZUdpWEdPYUVo?=
 =?utf-8?B?WGJKWDZiUmdjRnpBVTVIeHE3clJWL1dkQnZvbDBkbjdROTd4UzJMcWxPeTJz?=
 =?utf-8?B?cHJoUEtxenVhS0VKaU1TNW81VUdmandrMjFibEkzSUtFMEU5R3NkdmRzTFUw?=
 =?utf-8?B?M1d3UDVvbXRmbEZZUkxkUXVKYm4waS8yaWQ5eXB4cTZjdXdpeG5iY2RyY2xB?=
 =?utf-8?B?ODFQTDNOeW9ZMzczckEvSHJYUTZ4SklaYlM2K0FKaHBpYW9xUUZnOXEyNmFh?=
 =?utf-8?B?aDM2TDdaMDgzOUN1LytFSU5YZEIrUXkwbGF1SmpnMGtxaU8xeUJZMnNzdUd6?=
 =?utf-8?B?Mk1CSlpIeFRIR3NNUExwWkhxajhqVHEwd293K0RMTWJIcExvVGx3ZUkwWkRR?=
 =?utf-8?B?Qy9ublYydStEREgxa0hBVFBJOVV2bmZsS3A3VC9nYWNzTC9lS2hCanF4UWVH?=
 =?utf-8?B?SU1RbmxBQ0tWNmo4VlpkL3Rmano4R3NPSDZlTW9HUHF1cTVVQk9mVkNXbUtx?=
 =?utf-8?B?UlNsRGZBK3c2TjJlajZtWWpEKzFYR3g2cHhZcHZaN1I3RllPWlZmNTRxdzkw?=
 =?utf-8?B?VmN2Y1dvOFVlT3hMZ3NuQk43QVdBMmMyVGJTWmNZa01Nb3V2MDB3VU9Mdkhn?=
 =?utf-8?B?elJKeVVYWlF1ai9wL0dBQjBGdUtPdkRkNVFUSXhocFFJUktVUEVwUXlGdGZQ?=
 =?utf-8?B?WngxUnRUOWIzdDRmMUNnR3VkcWJHdFJCTk94YlNiei9TQ2VvcVpzMGFGZkNx?=
 =?utf-8?B?TlpURCtwRnJxM29DclRBNmt0UllXRmxFS2l6L3IyS1dxUlpEeGplMDJzTmt3?=
 =?utf-8?B?cEhRaTlJSWRzZWJZZDZLOHBtakpTeElQUzEzN1RuRmZTZ0xhc0N1eTJiaVZm?=
 =?utf-8?B?c3FXbWpNOTNPa0xjVDlnOVM4c3VKa2QrUnROcko3UW5xUVlJZDEzQmlmbFZG?=
 =?utf-8?B?Um85YUJXUHI4VXNJVm9UY09LZ3V6a1NIR3h2SmxDU1FTellFOHFrUGpOeC9K?=
 =?utf-8?B?RENnbGMvb1NNU2Zhb3RTQkh1TDdhQ0Izek9Kb2tXRWRNbVN0NktRd1ozMmFk?=
 =?utf-8?B?NU9EUHhHVGREU1NIdHhnR1BCUGx0UjBETU0wMm4xZGh0b3FST29NeGVlekgr?=
 =?utf-8?B?NHdodkdoZ21kR0c1Zit1UFhXaVdyNml1SFk0MEVVdWJGSW5qUDlKdUVCeVVG?=
 =?utf-8?B?RVVVekhYT0t6S0NDQWNUUi8rZmF0YTc2aW81QjhpbEp4eUpNMnEyWDFleTBw?=
 =?utf-8?B?UWwrNlEyQnVxd3NRT0F5OG5tbEtSc00zZWh4Zk1VWFRYT3JCN2g4SHJEdzk5?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FF1D2B9574A67469E07412E7530D9AF@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 88985395-0d94-4b64-5b63-08dafd7d31af
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 20:05:37.2036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RdFfqcHU3j8vxs0/WFna7PhxRDRKtdFVzmnFW8jZMP77vHAWdVAqMo0HpBf10kwLXNYrQve8OoTQyCzW5Z0Bjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1416
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: YC3gASIu-OFG1AlFleGfF9co-cP6bQ9j
X-Proofpoint-ORIG-GUID: YC3gASIu-OFG1AlFleGfF9co-cP6bQ9j
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 clxscore=1015 mlxscore=1
 mlxlogscore=189 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=1 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230193
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+ICsgaHBlLHN5c3JlZzoNCj4gPiArICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3BoYW5kbGUNCj4gPiArIGRlc2NyaXB0aW9uOg0KPiA+ICsgUGhhbmRsZSB0byBhIGds
b2JhbCBzdGF0dXMgYW5kIGVuYWJsZSByZWdpc3RlcnMgc2hhcmVkDQo+ID4gKyBiZXR3ZWVuIGVh
Y2ggSTJDIGNvbnRyb2xsZXIgaW5zdGFuY2UuIEVhY2ggYml0IG9mIHRoZQ0KPiA+ICsgcmVnaXN0
ZXJzIHJlcHJlc2VudHMgYW4gaW5kaXZpZHVhbCBJMkMgZW5naW5lLg0KDQoNCj4gQnV0IHdoYXQg
aXMgdGhlIHB1cnBvc2U/IFdoYXQgaXMgaXQgZG9pbmc/IFdoeSBJMkMgY29udHJvbGxlciBuZWVk
cyBpdD8NCg0KSGVyZSBpcyBhbiB1cGRhdGVkIHRvIGRlc2NyaWJlIHRoZSByZWdpc3RlcnMnIHB1
cnBvc2UsIGFuZCBmdW5jdGlvbi4NCg0KZGVzY3JpcHRpb246DQpQaGFuZGxlIHRvIHRoZSBnbG9i
YWwgc3RhdHVzIGFuZCBlbmFibGUgaW50ZXJydXB0IHJlZ2lzdGVycyBzaGFyZWQNCmJldHdlZW4g
ZWFjaCBJMkMgZW5naW5lIGNvbnRyb2xsZXIgaW5zdGFuY2UuIEl0IGVuYWJsZXMgdGhlIEkyQw0K
ZW5naW5lIGNvbnRyb2xsZXIgdG8gYWN0IGFzIGJvdGggYSBtYXN0ZXIgb3Igc2xhdmUgYnkgYmVp
bmcgYWJsZSB0bw0KYXJtIGFuZCByZXNwb25kIHRvIGludGVycnVwdHMgZnJvbSBpdHMgZW5naW5l
LiBFYWNoIGJpdCBpbiB0aGUNCnJlZ2lzdGVycyByZXByZXNlbnQgdGhlIHJlc3BlY3RpdmUgYml0
IHBvc2l0aW9uLg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2ssDQoNCi1OaWNrIEhhd2tp
bnMNCg0K
