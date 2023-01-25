Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF50C67BE97
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 22:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236791AbjAYVch (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 16:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236809AbjAYVc1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 16:32:27 -0500
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E1E2692;
        Wed, 25 Jan 2023 13:32:24 -0800 (PST)
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PL8Dl2006292;
        Wed, 25 Jan 2023 21:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pps0720;
 bh=fH/WyUTvaJj0hUotjvVXp9Cywio0UpZvJbuE5/cZnkU=;
 b=EgcG2/s4qse99jlgVgWkTMQvKSwwrZJ25Q0h3sT0GOGj+Tpe20Q9JeueOCNpu8qdqY1h
 TC3ncAZANaxsBkDhS3cERqLxtR1mvopUB7Ww8rOJs7MWRNw6OcE+PUkJtJh8uNl+SD5p
 5K5sHlY035QEz6jN47TqFJlF/Mh0uk+POTLH+KRjUEm5W4SRFf3N2ca/3iC8K3CpRBp0
 2BYO14rf1dJ1Mtwy+bp0EYCf7LWJQA0oJ1Rdw0UGWDsPAbpbPQhKbnmMMcloC4K250pw
 w/HnqLzqW/5RGr1eGS+q1Q9wYdTkYkovxsIuAFk07qjejzxYr21mwjVeBC0K86mm5/Zr Nw== 
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3nbc2j062h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 21:31:47 +0000
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 93496802B9D;
        Wed, 25 Jan 2023 21:31:46 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 25 Jan 2023 09:31:30 -1200
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 25 Jan 2023 09:31:29 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36
 via Frontend Transport; Wed, 25 Jan 2023 09:31:29 -1200
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 25 Jan 2023 21:31:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0N5+D+0XBV8HPHm7YHkUpPTRCm+zflT/EKNt35iy73vwbivMKNDIL80N0j0VdGBA/WeRJ1MoIwYAy/+1eI1aEdt1e33+Xs5sxF0cPxNNH7kqV9N50zpk66bxNiocbX96thLWZEI03Vo0jtTE7T7LYvXA4toSwJHIKS/Pmv4jps2O28OPO3ROAYUac8DLsNQ75JW7qMKaO7GT5+5J39q8XJHH+8zjhrg42n3XHo0pKZ6rCCacIFPNy+nu9NDnM/ZEBF0o4HcQHs6/CLfSM8IrKinfFmySzJKRQCUH5PbOuG+t2nOWi0ZFTNA/b3CaQ679ks5Lh3cQfVxGX8oLEN7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fH/WyUTvaJj0hUotjvVXp9Cywio0UpZvJbuE5/cZnkU=;
 b=dbT8sZ1xT4ZgEo92VIGW7nyWop9XJLWcpuSafCQSMzxe7lI4vyxFIfMd0I1B0o4G5bzf+4dcbWIKOAwwZNeLwfdI5VaaTiCrv1J2LPMd99US3RAS7pQ7kT/VFiFT12+8pB/oAYpgz9nbrMhgBWEh/Z+/OAlkSscyRbn+zfIA0e5Hra3+m23azSj1TUZbF6D8r2Kh8LI2jvF6L2qXXJHkgp8bM5FpKmwKiVkPT3yhW+ymB8W2LofLsXfDDVuJvWKTSt9KnMHJ1Q0V8NZQQ34EMaUrYNjOrsn369VLp2YKKfpnPn+MIgOyOsWHClahhnYQWIMJz7S9n/gragayHuKYAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 PH0PR84MB1761.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:173::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Wed, 25 Jan 2023 21:31:26 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87%7]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 21:31:26 +0000
From:   "Hawkins, Nick" <nick.hawkins@hpe.com>
To:     Rob Herring <robh@kernel.org>
CC:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "joel@jms.id.au" <joel@jms.id.au>
Subject: Re: [PATCH v4 2/5] dt-bindings: i2c: Add hpe,gxp-i2c
Thread-Topic: [PATCH v4 2/5] dt-bindings: i2c: Add hpe,gxp-i2c
Thread-Index: AQHZMO1wnbaF5tW2iEyfaq4bLYGCR66vozOA//+fHYA=
Date:   Wed, 25 Jan 2023 21:31:26 +0000
Message-ID: <399C2A3B-703A-4D67-818A-27AFA2F1B742@hpe.com>
References: <20230125184438.28483-1-nick.hawkins@hpe.com>
 <20230125184438.28483-3-nick.hawkins@hpe.com>
 <20230125211811.GA2902717-robh@kernel.org>
In-Reply-To: <20230125211811.GA2902717-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.69.23011802
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|PH0PR84MB1761:EE_
x-ms-office365-filtering-correlation-id: 4cfbe8e1-65b7-4d37-00a4-08daff1b83bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TOT4uny/iKLHLOGo/VtDlrh+VrMHqCVewiNAJlcCT6thoIX4QX0JSVTA5xHI9pVIDSf9cR3zdWEZAlvN65MTz/JqmRgy24wlvteBP1zUu+dIHWYHIj4bpZUlnV7laVjzdaQZXH2obrCrUsAMXFXq6f7hFeYxIldLIQ0agXB/qPbq4czMyTuUiQQRUmsG/0iKHh1m1kRo51rzn7u6ruHeRfmoRx7co8wdcC+LAulD9SPTf4yUmP7NwgWN/uhkhAGJFx3nHu96Mt3OA9HbamCugc72/9GY2tvZh+bsWfZWs6bNutKPdmy7TYvf9Fg28OT0NcoT3ZRLCdG9nGcW5CN+PNzQZgjcGDki5+cF9rN/yyjB26QDNTt+YELPscfMq1cVTnhz4poG6Q+SveMOkcMyKk884YVUIjzSCJ4gY1Q60E460y7iTABosP60GyDbPyAQibqyfMhqwV29WtT/ULydoqRX6/FB0rCNlJNf/dOmQcwvnUS+OVgfYy6tA+m92ecEMpGkN9h8KhW1FIXqnoeF7+YOyqrZHGDB83EFGxlUKNf4C6hsW+yL01basg3Ig+zLOVrqIX7D0Xigd3CRC7u8nV0fxcEKIafPcar2MXrv5kzc+7f2FR6emoFpFZLU429g93SrjaRd14OQdIYKLvuTMBA8B/e5PeriNaMhwzwRdQZdK9NhldWwHXLl/aY/vu/uqAqf1D/F2Rga9M4wtqj6/HazV9gxgQIIBL0uPwwR49s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199018)(83380400001)(122000001)(4326008)(33656002)(38100700002)(66946007)(66556008)(6916009)(71200400001)(6506007)(66446008)(186003)(91956017)(478600001)(76116006)(38070700005)(54906003)(64756008)(6486002)(2616005)(36756003)(2906002)(41300700001)(316002)(82960400001)(86362001)(8936002)(5660300002)(66476007)(6512007)(8676002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUNKVmtXSHg1Mk1kNzNhN1VrQ0pmb056K2laNDJwL1JxWnU1TC91dVVqblRW?=
 =?utf-8?B?MWVNUE5lUWVMY3BMMlEzbTA1SkpvdE52K091WDdzMDRLaXAraStPaWt6cFVq?=
 =?utf-8?B?U1Z2YTlIZThvY3VTOHIvNkJsdlFBaExBbDNadStHZG44Q3FuZldlb21uNWp6?=
 =?utf-8?B?U2JBOHpZWEUrTEJJczJrdHRtNFlaaWVqV2xPcEZRK2ZoTmp1MGNUUWoxNWYy?=
 =?utf-8?B?UXdwSS9GRTBwQlMrQ29SclhzQlpaZmYwcW4zb0c5M2hWY3ZJRm9iem5XSkJ0?=
 =?utf-8?B?WjhmZ1o1b3p3VGt4bVgvWTJCVWUvVTVTVUFTKytSVXk5NTNIbUx4NjN1aWRm?=
 =?utf-8?B?L3NQOGxKeUl6aWthM1didm9XZUZJYldvQlRUYTUwSHpLaUxvVkJvVzhYQ05W?=
 =?utf-8?B?RVowZjd2TFhEeTUrbVhZd2tpVjJwL1NuMzc4a3o4VDdiRDhuemwwVWhWdzhm?=
 =?utf-8?B?Q3RGQmJUN0pISno0OVR1OWMvTXJLM3lGNjZDWktpK1VxTTdKd3BpRjA3Ti9R?=
 =?utf-8?B?c2lsUGdZeEpRMUpLNlpGSlY2MHpSQWtNd2JHUUhIckl0L3Exa2tCbTVjbzFP?=
 =?utf-8?B?cHVVTTFtMk5MVXZFUUJPaENSYko1RzBOci9QZVVQQ0V1bVpubWUyUnhPdXM4?=
 =?utf-8?B?clozdTlLOWJJTmExSlUxd21mKzhUSmU4RFhwTjU4b0dzRnZSNTVvenIvVDQw?=
 =?utf-8?B?cHFvTDVuT1hDWE1qcHVXM1VPdENaaHVNcEU4c2tnQ0RkMGpDekE0VXprZ2h6?=
 =?utf-8?B?WUZFazhSODl0WGQ2THY0SHgyL2JDUEsrcmlIVzlnQzE0TlRMRy9qYmdmZnVp?=
 =?utf-8?B?bEI5aFltTGZ0UzU0VlpjdWhpb3d3SWFwRnZKZDBPN0tjTHVuWDZ1UTlLU2dC?=
 =?utf-8?B?YXR0L2dEVWhrbmtBQ0p6YkFuU2NJaU44YXp1Q2diK1pZTWFndzBkNkc1aW5H?=
 =?utf-8?B?VjdtbGNzRGlWL0VjZ254d3V1eFZzbmM3N1BWSk9wZENFMlV2N1pXVW4vYmxH?=
 =?utf-8?B?cUQ3NWhjcXJEdGhISlQzMUpVNFJXVW56VGx5UGJiWUlPc2dpOEhDclRqR0Vk?=
 =?utf-8?B?U2VIREYyTGdPcFhndXN0K2tFZkFuUHZRM1NnaU9xZWpLcU51ejJ6S0tvcnlY?=
 =?utf-8?B?L01uZUJYWUE2c3BBWGkvN2w3djNIZWNsZk85UkZHNkZoSXIxcEZzR3NhUHpo?=
 =?utf-8?B?YkFVSWJveGdaczM1VW0zdVlDcEtUNTEvbVo5eTN1c0Y1UFNzUStwU21zamtJ?=
 =?utf-8?B?c3M3aVpMcTdrMDlVbmVZdTFEU25DbklZaDJseks2SkpOd0EzbEhycks5UHVK?=
 =?utf-8?B?ZjIzRGVmZklBVllpcE53MzRGOFRRSGQxMC8xNWtMMTMxNDYvZzNJNlpRdjYz?=
 =?utf-8?B?L3BReGJnK2s1dTlMN0g4UkFmam8yTTlKbHNBVnExU2RadzE0UjlUUmg2QitF?=
 =?utf-8?B?RVIyMlNqTmRYZTJOcjB4R29wblJkVU1jRVdFR3lVYmZadGdoSGpnTVBUOUdw?=
 =?utf-8?B?MXV6bUYzbWxLMkR1andoeUgrZ1RBTGpqVG5TQytFNTVNajQ1UTZPWVc5M2NV?=
 =?utf-8?B?bXRScVk5RnZMK0N6R3p5N3JPUzRnWE1qZEJrZnplbXE0WUd5dHVBZzJCUTBw?=
 =?utf-8?B?eUk0ZWsvKzBBbUlFNTBkQUVqZW5Pc2lpd2dCSm8reVRoZjQ4dklMNmRkeVkr?=
 =?utf-8?B?NUR4NnlKdUJrd0NoaUFiNkp2Z3pYUmFJV3loMGhlWVJ2WWdIYlc5aDZaZTRZ?=
 =?utf-8?B?cHdGb0NoaWJOR1lKajNrTzFvcE9QT0FsazdUa0svVng2QjFoNncwRFVXM3Br?=
 =?utf-8?B?NGZxaUsvMW95NXJ6V28vWm5GUVlKVVowWVRRQ25BZGd2dnhrMkhiRXlWYnJ2?=
 =?utf-8?B?NTZRdVQzbEFPVUVPa041MGt6TnU2SXQ5cWphdnZtaVFlQ0lQY01tNXdlblFa?=
 =?utf-8?B?aTVWS1FHckM3OFBtU0ZkUFJ4MGxrNWFzbHFIWEtQMThiZWlEZitOUjFtQWNy?=
 =?utf-8?B?SS9MS0JJL3FuRkVCcE0wRkpOeHdPMU1nalIxb0ltZFdMeXAwLzRiQjJtb2Nv?=
 =?utf-8?B?Qm5YZitLNnVWakg2ZEhBYW95VkRxVzNTcFA1QjFjOTYyNVhhaVFRVEhSOFBy?=
 =?utf-8?B?ZVhkc0FoVmRPSllQQkY3TVpPYXNZMWJYaXVQdC9ZVVNYejlKSjBYR3FYelAy?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CAE7DF6A3C9C341A906A91C029F5029@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfbe8e1-65b7-4d37-00a4-08daff1b83bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 21:31:26.5123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8aXy1ODiWXaU67EJuCX14en7Lh2N/I6iYGJPZttAlh1kyGw4NQneUPj2FeUzi9iY99QNcOznb8eZftILjLNCZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR84MB1761
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: YPP8f5J5OESf6vFuGksDkMRKpWkzVTUw
X-Proofpoint-ORIG-GUID: YPP8f5J5OESf6vFuGksDkMRKpWkzVTUw
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_13,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=286 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250192
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+ICsgaHBlLHN5c3JlZzoNCj4gPiArICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3BoYW5kbGUNCj4gPiArIGRlc2NyaXB0aW9uOg0KPiA+ICsgUGhhbmRsZSB0byB0aGUg
Z2xvYmFsIHN0YXR1cyBhbmQgZW5hYmxlIGludGVycnVwdCByZWdpc3RlcnMgc2hhcmVkDQo+ID4g
KyBiZXR3ZWVuIGVhY2ggSTJDIGVuZ2luZSBjb250cm9sbGVyIGluc3RhbmNlLiBJdCBlbmFibGVz
IHRoZSBJMkMNCj4gPiArIGVuZ2luZSBjb250cm9sbGVyIHRvIGFjdCBhcyBib3RoIGEgbWFzdGVy
IG9yIHNsYXZlIGJ5IGJlaW5nIGFibGUgdG8NCj4gPiArIGFybSBhbmQgcmVzcG9uZCB0byBpbnRl
cnJ1cHRzIGZyb20gaXRzIGVuZ2luZS4gRWFjaCBiaXQgaW4gdGhlDQo+ID4gKyByZWdpc3RlcnMg
cmVwcmVzZW50IHRoZSByZXNwZWN0aXZlIGJpdCBwb3NpdGlvbi4NCg0KDQo+IEVhY2ggYml0IHJl
cHJlc2VudHMgdGhlIGJpdCBwb3NpdGlvbj8NCg0KWWVzIHdoYXQgSSBtZWFuIGhlcmUgaXMgdGhh
dCBiaXQgMCByZXByZXNlbnRzIGVuZ2luZSAwLCBiaXQgMSByZXByZXNlbnRzDQplbmdpbmUgMSBh
bmQgc28gb24uIEkgd2lsbCByZXdvcmQgdGhpcyBob3cgeW91IGhhdmUgYmVsb3cuDQoNCj4gQUlV
SSwgZWFjaCBJMkMgaW5zdGFuY2UgaGFzIGEgYml0IGluIGl0IG5lZWRzIHRvIGNvbnRyb2wuIEhv
dyBkb2VzIHRoZSANCj4gZHJpdmVyIGtub3cgd2hhdCBpbnN0YW5jZSAoYW5kIHRoZXJlZm9yZSB0
aGUgY29ycmVjdCBiaXQpPyBUeXBpY2FsbHkgeW91IA0KPiB3b3VsZCBoYXZlIGEgMm5kIGNlbGwg
aGVyZSB3aXRoIHRoYXQgaW5mb3JtYXRpb24uDQoNCldlIGFyZSBjdXJyZW50bHkgdXNpbmcgdGhl
IG1lbW9yeSBhcmVhIGRlc2lnbmF0ZWQgcmVnIHRvIGRldGVybWluZQ0Kd2hpY2ggZW5naW5lIHdl
IGFyZSBvbi4NCg0KSGVyZSBpcyBhIHNuaXBwZXQgZnJvbSBwYXRjaCAxIG9mIHRoaXMgcGF0Y2hz
ZXQgdGhhdCBpbnRyb2R1Y2VzIHRoZSBkcml2ZXI6DQovKiBVc2UgcGh5c2ljYWwgbWVtb3J5IGFk
ZHJlc3MgdG8gZGV0ZXJtaW5lIHdoaWNoIEkyQyBlbmdpbmUgdGhpcyBpcy4gKi8NCisJZHJ2ZGF0
YS0+ZW5naW5lID0gKCh1MzIpZHJ2ZGF0YS0+YmFzZSAmIDB4ZjAwKSA+PiA4Ow0KDQpUaGlzIHdv
cmtzIGJlY2F1c2UgZWFjaCBlbmdpbmUgaXMgMHgxMDAgYXBhcnQuDQoNCkkgd291bGQgaG93ZXZl
ciBsaWtlIHRvIGNvbmZvcm0gdG8gYSBzdGFuZGFyZCB0byBkZXNpZ25hdGUgdGhlIGVuZ2luZS4N
CklzIHRoZXJlIGFuIGV4aXN0aW5nIHByb3BlcnR5IEkgY2FuIGxldmVyYWdlPw0KDQpUaGFua3Mg
Zm9yIHlvdXIgZmVlZGJhY2ssDQoNCi1OaWNrIEhhd2tpbnMNCg0K
