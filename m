Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC10C68E32C
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Feb 2023 22:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjBGVyC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Feb 2023 16:54:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjBGVyA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Feb 2023 16:54:00 -0500
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B463B3C0;
        Tue,  7 Feb 2023 13:53:59 -0800 (PST)
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 317JW3b5009051;
        Tue, 7 Feb 2023 21:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pps0720;
 bh=EMSahtD+nFsySazFj2mnWNoNHR+4JgCzOankS9pXvvg=;
 b=V0KKqrEd1g7EdzzGvVzm7gR9geUDhJ8L9RMCxKgx3Q+SbGURISNi0kGvXISe/aSxbIoC
 fEN1Na7+FsGR8gB/gv94n/KenEh0yJ1kubj47vvnnzJZOWgoDXht1W7aruo5/fdLV0x/
 1tHW53kLwQLAsNtC8OyRhn4xWKCEzqhNWJmP/JAA3X6HHeVmmjp/QnxzFAn7elQ4TR+Q
 EFSAK0gnylOJ/PFM826bUgtz2/zQnH5FViKeeevAWDLbYY7olnNW5Qx84kQGdOIPhyIY
 PluGVDzO+ax5JjS/WQgKF6TCt+bNqbxkJBj599v7ALOLB0bjwkORWKQ0iAipPU23vvOV qw== 
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3nkt4daghc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Feb 2023 21:53:29 +0000
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 62F08805E5E;
        Tue,  7 Feb 2023 21:53:27 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 09:53:08 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36
 via Frontend Transport; Tue, 7 Feb 2023 09:53:08 -1200
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 21:53:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9hQaSLzXUl5vP76pnSGq9E0msuhnLvJmymYT7HdE38bjrg6qHP5zd19/benxn5XHl0NAmfAN8L6Sdn8kOrE5OVNcDK//BkSA/xIxx5KnaSBTuafjxSLsM59rBuRw30Scy54ty1/oHVyvRq+npJIzujrnITuV9JbKtWFMZ24ZBdK3Xtps8Tnn9Ej9Ij2cl6KGMuundQyXdVZz3/QqQ/1RyMfuU3clmWmsHVfs3OioUfMdFFSlmWol6wH9q3VkfgKhlvuPH6yOgjWGDBgbvPGPfGqINC20+3OX8ZXfSarlagaMf2VRFWOu3dxogBLymcxGMKu4dcwLQkF/XKusHUiIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMSahtD+nFsySazFj2mnWNoNHR+4JgCzOankS9pXvvg=;
 b=bPAFoAu7p+aHQjxTZDvCOEQQid40RDNqCT0pN7Djr3dDTcWZiUtOXzjUDK+sx3VzQRRjXl/+bYs6LP3FedXe5rtOlJJlhUHqDcEUf5MVxMzpIVliuxI7bgTvdHKYK5Puh28Xj4TBvJw5tItJNSZu9TEddtIVh86RTkIlSV7KZdGBAAlCb/TSIcSC4LSV1kEI61Sg5zmCvfa7NmP0UIVUiW7P5mOGaOBirqHt18HTSXVltpw7KA0iByLb3KzVESi4VeENrxsQ0dJMYuy1rb8OVz4OyhXMFjnPTIo0NF99Uk4lmfLAsePGmNMXtAMXUQhZWg3iLdxnbTwDqpo0MrFP2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 SA1PR84MB3192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:806:257::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 21:53:02 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87%6]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 21:53:02 +0000
From:   "Hawkins, Nick" <nick.hawkins@hpe.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "joel@jms.id.au" <joel@jms.id.au>
Subject: Re: [PATCH v4 5/5] MAINTAINERS: Add HPE GXP I2C Support
Thread-Topic: [PATCH v4 5/5] MAINTAINERS: Add HPE GXP I2C Support
Thread-Index: AQHZMO1xKLe5o9gXTUe1qZvV6dkcF660LYmAgA+JHgA=
Date:   Tue, 7 Feb 2023 21:53:01 +0000
Message-ID: <6B334EA9-3E6D-4B40-8C55-A539C504439C@hpe.com>
References: <20230125184438.28483-1-nick.hawkins@hpe.com>
 <20230125184438.28483-6-nick.hawkins@hpe.com> <Y9VrnQxiFjVqtybb@ninjato>
In-Reply-To: <Y9VrnQxiFjVqtybb@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.69.23011802
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|SA1PR84MB3192:EE_
x-ms-office365-filtering-correlation-id: ee4c106c-02af-4d0c-891f-08db0955af47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eNjrZGsQNeeCOJuBFhL8IcCw2zbtaejuC8hnrWEVVO+qV4PG0E2Q1Nigsrf1Pwb7fG3mwBU4BRmi+UCFC8mUMgHI697r+EyTsynkOJbl7gCL4OazBXh/xkXRKPh2/044BuzUYz0+uD87earNxUs2oFxZ9FVcIR25IUu2OeC0NPK6csmw7PbV0XugztnSj3X0hYO3wJSwxdZqFQmm+7qlbWJjuGzDzlsb1A8xm3lNuHqVEblcBQN8VPv0g6BxmeTFQYymMUiW9nYfSriEW2FJoqotxYZBlgBXjJHzSGiWWm8R7+k+s5ZzGVUiNLN3rCv8lLCzzWM9tcox4UvVcm7QypHxyVRTtifH35wgh0NtJfuq8E95LE6OMWmf5ujmm+2T0+pJ5FYIS6WYGxFKJxjamA7GxAu0niClq6QqY+EBX90kjkGwWgwj6K5GnuEev8+zsW/QppVMRGvZ8j/pXrq/o5j/cp+U5SzP45I1TMM5d9u57FctLdM4qw3CT2wXiEvSxecToX4/Tg1Ol57i9A9GzUyIb5QAPj+569Jg3Gi2HTdzmLmofBTwm5EKUQTcv4EQrQ/o2fFcAXoel2aH5+54GcI8J6YRm4ULi2jHQeD9yEQlvIke1OVT/64mvncDcqDEAo6+2vMxRRA7HrpC/criFt9UIpP22Jef+G80uoFMaOv7X7/EVLySvRNUB9muzsg3u0cV7EYcEiE7AT0lLNBZO/pwJMTM+PAPkXdtKsNBsyw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199018)(71200400001)(316002)(478600001)(54906003)(6506007)(186003)(2616005)(6512007)(26005)(6486002)(558084003)(36756003)(5660300002)(33656002)(86362001)(91956017)(82960400001)(122000001)(83380400001)(38100700002)(38070700005)(8676002)(2906002)(66946007)(6916009)(4326008)(76116006)(66446008)(64756008)(66556008)(66476007)(8936002)(41300700001)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0I3Vm41TUdaUURMUFdIVW1mczhUT3ZyZUEyN2hOWExkSkN0ME1MeTB4UWZT?=
 =?utf-8?B?TkNWU1FCN1BrcHAvVXloMGw3MHh4alFkMVJoOU9tMklxQXVPSUNTUzhNRmtX?=
 =?utf-8?B?NzBHTkptZFY1d1lIU1VVSlFGTVU1Tm5WZlZRVnZsbkhFM0F6SVBLNG8ycW5D?=
 =?utf-8?B?N2xXSHNWWGN2elhZTis3NllVTGxTbFNUYkcwTmRIeTltLytKQWplN21DTDNU?=
 =?utf-8?B?QlRPalVKRDZqYzNrb1RrL2ZXNkRMN1RwaHRaK09zdVlJWmZja3hUMHROaytV?=
 =?utf-8?B?N0ErYjVPd1dQVkhwcDFjbDNpK0pVZ3BkbWFYUWRNRWJMQ3FORUZuRWZvb1Ny?=
 =?utf-8?B?eVNDTEt5OTJFSFRybjAza3ZqV1J3d2lqUzZBYWRhS05kS3VqTWNCdUNKY2dT?=
 =?utf-8?B?c0Z6ZHlFVzF3QWhmcWJHNUhPMWJPNjJnOWNIdExqc3hpRHo3RFl6L3htWE94?=
 =?utf-8?B?ZFZSc243SXR5YmxHL0hOY1BLN3NxbHhnaUVQejF6VW5zMzdsL0VmY3dLVDFh?=
 =?utf-8?B?QzVxcSthckRDdTJ2MXVpRDVEQUlCYmRLTlFIb2YwWGJ4Y1dYYVAvc2dRL0pr?=
 =?utf-8?B?WVlxOWFERmYwelI0dzhFd0tqckkwbGtiQWR2blhBdDY5Y09DenlpeTJrOXk1?=
 =?utf-8?B?Z2c1SmkxUSsxcVdUclFWdGJlWDd1NldFbVl4YlBOV2FaV284ME9rblFnSG1Z?=
 =?utf-8?B?YWMybmNSYjRlci8rOERqdXRrUDkrdTN3cnRiTFRWaEQwMjhhVWMzbmJETzAw?=
 =?utf-8?B?Z0JzdDRpb3dtOTN6U20wY2RvQ3ZNOFpMNFJsSVk3b1BkOVdtUGhRSTQyczRw?=
 =?utf-8?B?QUxwNjJReFZRYnZ1V1o1N2tYV2NQUUpDNmJrRnJnQzlQNHM4QXBxUXZ0NXM0?=
 =?utf-8?B?TDNXTC93a3hyZ0J2NEZDVkxzV2Nvb3JpK2wrckZBNVBvSVZzUzJFcG9DS3F4?=
 =?utf-8?B?MWFNdS9zYllWek9kTkZ5UjFzYlFHbUJWTVJtWkt0SEZyTWNkb3hScGpkTXFV?=
 =?utf-8?B?UlExVWpLNWh6Y1JXU2JGRnd1cEhEblovRG96cTM3SGtJV0FpVHVIamlSZGQz?=
 =?utf-8?B?eTJZZ2g3OWo5aldKNVdQSGFtbU9PWElUdFhUWXNFNk1lWGVNK05sUytLMXBL?=
 =?utf-8?B?RUZSeWRkRjhxQkNQRzRsMUdSMkdKZGpYT0FtN0EwMk5GblBuVVlseExJTkZu?=
 =?utf-8?B?S1pGdHA5WWRKb1pxdXcrZGlHWkF5U1I4VXZIUkxJcW5Bc2Z1ZnlNY3BsRkF5?=
 =?utf-8?B?eFpJSW5pVDJkN1pSMUlqZUxPRkJLYlJUaitPWXhaRnp2QXFZd01nSWI0VzhM?=
 =?utf-8?B?UGdLUXVOeVUrSHM0aEk5dm9YdlBUemFpNDN3Y3BhT3lidnNNb1F4dHFvZHZw?=
 =?utf-8?B?WGdXYlI4a21tNVdwR09jZkVjT2paS0JWblZqNmo2SkYzYUQxZExjb1FHUkpP?=
 =?utf-8?B?aWpZRXNIU2svdjNTaWtJV28rYTkxQXVCQmNqcm9NTDQvTHlGMlZrODFKTlJr?=
 =?utf-8?B?WDE4SldTNTdJSWZIQUludDlTUU1KbkMxNGMyUlp6TUpEVnZFNkdhamNzekJC?=
 =?utf-8?B?L0tBOFYwRVlyNkVlNEczektweldPMTBIYldIcVRZczdqK3A3eFZ4VnBuVEFQ?=
 =?utf-8?B?TzhLL0s5V2lhSFp0OUNhUkdPNTRzYitPOHpYUENQa3BJM3NLSmM0QXZiTHZy?=
 =?utf-8?B?blc4OTVmc0RRYllxTEJNZC8yTm5qazg5VW5oQ2svQWR6N3liUjlGQSs1SldD?=
 =?utf-8?B?RkZMOUk4NVdOTzRhMnBvKyttUCtxOFZRQm93YXBBMVhvZHRkMTJkY0hLY3pX?=
 =?utf-8?B?VlAzdkpnQTBYVE9vdlRPNlpSM1hrcGtQNXlDbGMxbHpqUmdKZ3hzUExyZG9E?=
 =?utf-8?B?VFV1bzE3L0RVdytPK2NGMGhHKzlrRWVtalVudzBNR3VYVzFyNVhORXVaSW1q?=
 =?utf-8?B?dU5CZnNHZ3U2MzVwWWJvRmxPRzNweE85OEFiem1aK2JMWUhSaUo1NW9nMWIv?=
 =?utf-8?B?a2ZDb29aeUw4UWZ5bThoQlpSaHR0dmR3aHpGQUV6UlJiKzVTdmNXWGJvK015?=
 =?utf-8?B?U2R2WjQ2bmZNb3dlWmZaNEpzTzJIR2UxcHovTFVjY0xxd0VJaUhFOE1GVVU3?=
 =?utf-8?B?RXRYZ2RYeDdxY1RqU2hrNUkyUGlDYVBEMkdRc0xiaEJma3RPd3doTTRkVGE1?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65132F18B52A8D428598350584FE53F5@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4c106c-02af-4d0c-891f-08db0955af47
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 21:53:02.0160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1lkLIsZhLsyNLeNPkbemOcf2iyNB57FiL+63pZv/I/GH4G8PznLstCDdD92lKq77FowfvZWXZAZ11dmSTUJ+8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR84MB3192
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: vwt-WDyYZpz1O_OinELAVq8qZIg_LmVc
X-Proofpoint-GUID: vwt-WDyYZpz1O_OinELAVq8qZIg_LmVc
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_13,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=671
 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302070188
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBMZXQgbWUga25vdyBpZiBJIHNob3VsZCBwaWNrIHRoaXMgaW5zdGVhZC4gV2lsbCByZXZpZXcg
dGhlIGRyaXZlciBpbiB0aGUNCj4gbmV4dCBkYXlzLg0KDQpQbGVhc2UgaW5jbHVkZSBpdC4gVGhl
cmUgbWF5IGJlIHdhcm5pbmdzIGdlbmVyYXRlZCBpZiBNQUlOVEFJTkVSUw0KZG9lcyBub3QgbGlz
dCB0aGUgZmlsZXMgYXQgdGhlIHRpbWUgb2YgeW91ciBjb21taXQuDQoNClRoYW5rIHlvdSwNCg0K
LU5pY2sgSGF3a2lucw0KDQoNCg0K
