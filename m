Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED535AADBF
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Sep 2022 13:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbiIBLdF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Sep 2022 07:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236053AbiIBLcS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Sep 2022 07:32:18 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314E5B85D;
        Fri,  2 Sep 2022 04:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662118293; x=1693654293;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SitHToWpgNciVKzWPFYrDTr6rrTL+hKkZLrO8un2utE=;
  b=LIyG82wRmpyMf9aeJYYjOr2Z3oIWu+fRCPwT2Dx36VasimWZjT2lsXhR
   QMv1Zb3jy6Wq37ebpAlKMw6t1uthfqY2lqgCmexEXDwhzHivujc7AEGKp
   KIU2PzvFzYhDYlAyQf4Avux66bDWZwx+e3T9QI8opXXmSzx+Peo6zmrzd
   bYXtBtol5Nfy4egfeoPkQKhVfvz1gGI+MZN0ozYNGsmiU3E/lCpEwWyau
   GQ5fHKdNLD+Uqmbolb4BdjEZ/5BOAq7WcxLqC0daSaEOfDqiN0LtqTb3n
   hWvZX75bp18jdsOBjAHCNmO4ss8gSFCjJZk9Blrb++/qg6A//ZTQRjr41
   g==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="111911091"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 04:31:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 04:31:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 2 Sep 2022 04:31:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgUJvhK+Aculb+5WFDOQz6MO9IUyR04YPVtd8dYjGt0jq5Rba03bga4zSNGoTIBaIyIvgAojQxvVlgild3OwSHsMaqF+/Hqu06bP4WNDJGrtzEl0EqYZYgwJMj0qeKeJzLSdbNdkHnPUJrf/kN4vX6VpsOeg4x0xpVuD8Uinfhf2j46vDN54SoE+Sok0NadQhO+OvDCqVkXljvWLupkHxyqkTVs/+FDXlWvLGgnd6vsCFOxIDmTwr29VUD8stSp0AKXlDAWb/qfGWmBzRFM59s2U1ioSarUUQQgVgebF2o1qL6T6lTTnQlKm0TCr5ny0tU1E7T9Yrq4of00qY/stQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SitHToWpgNciVKzWPFYrDTr6rrTL+hKkZLrO8un2utE=;
 b=KJqAgW3X1/CNXdHsmM7/HZOtEOl3tih0+NpEPPaIMK1fYVybRKCF14Ab0s6sX3hgkxenav1yLvmF8n9LQLLdDxDeq2G19cpeZFfIs1adQtvMpCSUvscSeX+3b0CX03II8W8m8CDp4/JlRTpn9sa6FAP+XR5yRuGiCWkCU1MyFwFnCQAfpsC9xpH8Mph2JEoKO4KSDvjVux6kr42o/2EIlb45AK/P6sxHPgu2lk6b/XYEp+u5IYMyM/YabjuZnfcgtHnKqRJ+zXYzbO+okYpdr4EOsmNFkBPfjyGTLUHVVkXCUjLGgEnbAASWuXf9OHhoyDNhIZ+0PplJ4v0eNraCAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SitHToWpgNciVKzWPFYrDTr6rrTL+hKkZLrO8un2utE=;
 b=P6spc1n1XTWzTkA+L/C9rZ19folNNevQ12Lm6vI62PJxG2C2Du4TTAYwCtgMS83W/fK+EXGGSPEVTQuF2mOKhn3ooz7B1g1DOM5S1yFfeUootoqKrhVjI5/kTJBrIQqQwQiTsVwMSwFgbTEl0JA4lTNIo/Yie78l5kgBUDxzSKA=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by DM5PR11MB0075.namprd11.prod.outlook.com (2603:10b6:4:6c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Fri, 2 Sep
 2022 11:31:11 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::61bf:18d5:c7e7:f89c]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::61bf:18d5:c7e7:f89c%4]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 11:31:11 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <andriy.shevchenko@linux.intel.com>
CC:     <UNGLinuxDriver@microchip.com>, <wsa@kernel.org>,
        <krzk@kernel.org>, <sven@svenpeter.dev>, <robh@kernel.org>,
        <semen.protsenko@linaro.org>, <linux-kernel@vger.kernel.org>,
        <jarkko.nikula@linux.intel.com>, <olof@lixom.net>,
        <linux-i2c@vger.kernel.org>, <jsd@semihalf.com>, <arnd@arndb.de>,
        <rafal@milecki.pl>
Subject: Re: [PATCH v2 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH v2 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYvaNOFAimyTA3MEynxJY7CGXjha3K6z2AgAEY4AA=
Date:   Fri, 2 Sep 2022 11:31:11 +0000
Message-ID: <2345b4bcd0c529878307b2a84364ea849005eed9.camel@microchip.com>
References: <20220901013626.2213100-1-tharunkumar.pasumarthi@microchip.com>
         <YxD+NTWok2vkYos/@smile.fi.intel.com>
In-Reply-To: <YxD+NTWok2vkYos/@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52deef3b-e990-46b6-ba07-08da8cd6a312
x-ms-traffictypediagnostic: DM5PR11MB0075:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M8g//cwx8agmD+gc88pB2P/fPiDQ8GI6EjVik0TiRuplVUtuggf8cDB7R+Df99qUFUYT31TRPrngsOR2wV/RY2FUmmhRC8joKICtEY56P7Hk/szTjawfJMbic5iClZvCbfkx816qOVwd5TDD1Sdv6DtPXZK06VhxRx1YLD/z+nsI6SQMmv2B55ZoCqdLKRmjJrFm3A25UOUKrIWjS26tBJCsomZRf5prdo/OF0F8oD7f7n6t15bWYqo/dRH1YOo1sIbrKFHykDXV5IHIZ3pj8NPqtL6m8SDeCBIBXAslin8IQV1iIAAY7cpZxJlLgpCycJ5CL/hEv+mLY9j9mSXRm5Ml66k5UScWgp06SykQlkSLCkqQH0CTz/v9BHv7XFuVTOjKuFq149Mw79SacakkkDEniAoSdC+DtaBQQ1HZ/6IMhnucSA8xiAEK9513nsKKglbBCYQ1du6uj55CK/Lo37LY/S/T3AjlwTdsD/5tzHkKSV4Pt+I6iQO1SoP1mPMdq0z+Jm+lgkeCAeuJpFEyjdLVlDU0MwcAgvVpnMS/yJtEi2mXY18JpPLTmsquZnxaVnQ8UXeYGQfpsj5wmyKzTpts6L+UmVdTVigKTkIrutsRwMII76vV7ANzyen3phyNHywIRWqKe/Ehm5aMnJlXt4DKzwp2uvWzYprP7fWkEp64MlMbrqFCSgHajUilXL6Xv2Qv8K/6bOzrZPUDsjViAIP7h1zzh0laHYvSgVjjVlmm1fkY3RzV9efAYE7uqOawh2rpfwgrjPlCJN2KJ6cMjtjhAmO8qEr/ICkh7kevHdI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(396003)(136003)(39860400002)(346002)(91956017)(478600001)(71200400001)(41300700001)(316002)(54906003)(6916009)(38070700005)(6486002)(186003)(2616005)(38100700002)(83380400001)(122000001)(6506007)(6512007)(26005)(2906002)(36756003)(5660300002)(66556008)(7416002)(8676002)(8936002)(64756008)(86362001)(66476007)(4326008)(66446008)(76116006)(66946007)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTM0bDZDRUtHMnJxWE5qR0s5d3pqdXloenplRExQR2czbU9jcjJaRS95YmRa?=
 =?utf-8?B?RlAvbHdNLzRZQ1VsRE5qMjUvc3VDMkRhclM2YUxnTXVWR2h5blhRL3pTbVBV?=
 =?utf-8?B?WWJZQisreDZlQ1NOSHdpMjVwVDdsWWRxRnZ1ZzZScFpwVVlDTXBlOUtUdUlB?=
 =?utf-8?B?YmJmVUZBVjh5RGZkSTBqVnpCcmpJSmdESk1HL0ljM2QvdGpaMXNNbzZGOE83?=
 =?utf-8?B?NXpVV2IrTEtrNmszZ3BtZW0yVjNSdXJndkZNK2pZSmFzZ2FqWlM5WHFSQkFi?=
 =?utf-8?B?cW1jaGUvN3htbHpuYnpLbGduT2t1YnpvRGJJY0I1RHVpUUg5T3Fic09nRldy?=
 =?utf-8?B?ZmovNU4zSGpPeGhNNHBId1N5aEx6aDlJMW9lMUdWZFlqdWhFL0RpejlaTnpR?=
 =?utf-8?B?UVJ1R2VPVmZiamxXOVJacUdaeXB5VnlDWnpKMFVTTHQxUnhjN1dDUW9tWU8z?=
 =?utf-8?B?QTZtVFBXS2pPWUNPUWxnS0tkMVhVUVlQaHYyM2RJUXVTRVFOamRMUmxieml2?=
 =?utf-8?B?WTFhQnd5ekZiK2tDYlhnNTZydHF2amhFRkpWczVVdmFrZkx5ZFJvVHNiTENH?=
 =?utf-8?B?UGluZ2doQmVUVGZ1cklhWW5hQzdSUFZYb0tsWHNlWUhEbkxhekZFT1F2eUF0?=
 =?utf-8?B?NEd6Y2w1WEd6N3NNY213bHIwaFVPWGxDWFVzK2tIeGhkREcvYXZUSUxiNnA1?=
 =?utf-8?B?Uis0clVnY2M3RVpvVTFLSzRFNjMxTWxDeXN6NUhhQ09XRE1FRk04Z1NTcTN0?=
 =?utf-8?B?QzdpUUhwSksrVGd2Q2FoVUt3eE9rZ3ZSQzg1bUlhUlZsZzZ6T25ZcGVaZmdG?=
 =?utf-8?B?SWJTeWFOcnAxYjdUR1NobWdOMFRad0Judml3RlZOamV4dVFjWXhQdDE1RkYw?=
 =?utf-8?B?NmhJYS9jT2FERW9VaEQ5eE54ekZHamlHbThzVmxEdUpBejVzRTErdmxjNmxj?=
 =?utf-8?B?VlVWblE2YmYyNGRDWGMvZlA4ZUdqS0pZUUpnOWFpUDZ3K2RUY0NqSDRzRXla?=
 =?utf-8?B?UDE2WFJhNE0vT005T01qYWRiL3NnbkdMMTkvMTc0SzduOERuQWowZXV2RHpx?=
 =?utf-8?B?Y2NtdThxUUd1dENwRVNMNjJHQ1g5N2J0NUlSTXpSWTNBS2RKMm1jOGlyY2Q5?=
 =?utf-8?B?WGtkNFljK1RlT2V5UHVYT0dNWG9UZk1wZEo1aEEvRzdpVFphclBrZm02NjNp?=
 =?utf-8?B?MDV6OUhXczdQS1NBUmlXWEVZK1dCZ0RVcnY4UGgwSnJ3WHh2Y3RCNWwvNU9j?=
 =?utf-8?B?MHFhb3BBUCtsRWRpU011MDdvY0ljK0dUVC9hejhPdTdOaXR6V2lEdnJ0Mis2?=
 =?utf-8?B?aW53ZE8xekJRY0ZwRVJ2TFh5a3g5bFlrUUl2T1dHdlJ1d05QS1BuRTA0SkRJ?=
 =?utf-8?B?d2ZINFpDYWs1MnpNNW14VHFhRGJrK0xIRDZwRHJpOTNtT1FIUzRFeUV2bHVh?=
 =?utf-8?B?Q1gyWXJEbmI4Q3hHZVBCaWhuNmRjZWhXbEJHZzZPMXFkMXlJdFVqdTc5RndY?=
 =?utf-8?B?bVcvUnQzN1JINlY0OWp5eEhaNkhIc3RGTkNnS0tkQk5iWWlyR0t0MGNCeHU0?=
 =?utf-8?B?SDFndHBubmZES0RUcDNOblpwV2dkaTR5cHErdzVMWUlkVkxhcXNUdDV0T2xQ?=
 =?utf-8?B?Sy96WlIrQ1RPSWUzY25FZEVRaFU3M2ZHRTVlaHgvWUNpSXN1WDlvMllvaU9D?=
 =?utf-8?B?OEtweGU0VFN3OVpXc2dMVE5LbkVpNVh2TDgxNWs5Vm1PUXNBR1JXYlBCQitW?=
 =?utf-8?B?d050ZUJQYU5acjM0VlNiaG13L09qaFViTGo3UEt6R1lUemwzdTQ5cEYwcHBw?=
 =?utf-8?B?eEwrVDl2UStwQVZ6SCtpTzU1SlY3YW5vVjM5azR4RWhFdmdMYUd6aEJnTTZW?=
 =?utf-8?B?ZTFGQW1wY2l1UUkxSytYdEl3Um1yVEdoMzN3c0VobmhyNmZVZTE5VFIzaTFD?=
 =?utf-8?B?WTlISHJmSzc2OG1idXoxRnlvZGxvTlF3SjNzVHVOdDZkVlpoU1R5aTQ2YXVU?=
 =?utf-8?B?OXNQNDZKUFZwa00yak1YcEd5L2dBUmRhQlF3UVVrOFNrU2xnNVdVVlA1VGxw?=
 =?utf-8?B?Z1hWK0kxMytPUnp3YXdaNjJtSEZ6RzU1M2VzNEdyM1QzQ2lIcjNENG54dDR5?=
 =?utf-8?B?cEpoRHJDSElJeWkyS2tGUHJOTFJBNnpyVWxKcUYxYVE5QjdoNTg3SVlHcWF5?=
 =?utf-8?Q?MyTDDCjPivxiBC4cP+4FHe10TmTSWj71eNSjH/pTeVs1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE100C2AF917AB4F86698EF9769536B8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52deef3b-e990-46b6-ba07-08da8cd6a312
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 11:31:11.2525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B5JuEbgo4Teup5jICkGmeEmSckczp+bZPlrGvd/40AtE/cOGCvZyJ1NhDj8cXniGf4ox+0DH2pgaJC5ahalveKa6lBPr61xC2Zb33NRv8S39hYZaG8+cTejz+azOxG4q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0075
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDIyLTA5LTAxIGF0IDIxOjQ3ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IA0KPiBUaGlzIGtpbmQgb2YgaW5kZW50YXRpb24gaGFyZGVyIHRvIHJlYWQgdGhhbg0KPiAN
Cj4gI2RlZmluZSBTTUJfSURMRV9TQ0FMSU5HXzEwMEtIWsKgwqDCoMKgwqDCoMKgwqAgXA0KPiDC
oMKgwqDCoMKgwqDCoCAoKEZBSVJfSURMRV9ERUxBWV8xMDBLSFpfVElDS1MgPDwgMTYpIHwNCj4g
RkFJUl9CVVNfSURMRV9NSU5fMTAwS0haX1RJQ0tTKQ0KPiANCj4gRGl0dG8gZm9yIG90aGVyIHNp
bWlsYXIgY2FzZXMuDQoNCk9rYXkuIEkgd2lsbCB1cGRhdGUgaW4gYWxsIHRoZSBwbGFjZXMuDQoN
Cj4gLi4uDQo+IA0KPiA+ICsvKg0KPiANCj4gSWYgaXQncyBhIGtlcm5lbCBkb2MsIG1ha2UgaXQg
a2VybmVsIGRvYy4NCg0KVGhpcyBuZWVkIG5vdCBiZSBrZXJuZWwgZG9jLiBJIHdpbGwgYWRkIGNv
bW1lbnRzIHdpdGhpbiBzdHJ1Y3R1cmUuDQoNCj4gPiArICogc3RydWN0IHBjaTF4eHh4X2kyYyAt
IHByaXZhdGUgc3RydWN0dXJlIGZvciB0aGUgSTJDIGNvbnRyb2xsZXINCj4gPiArICogQGkyY194
ZmVyX2RvbmU6IHVzZWQgZm9yIHN5bmNocm9uaXNhdGlvbiBiZXR3ZWVuIGZvcmVncm91bmQgJiBp
c3INCj4gLi4uDQo+IA0KPiA+ICtzdGF0aWMgaW50IHNldF9zeXNfbG9jayh2b2lkIF9faW9tZW0g
KmFkZHIpDQo+IA0KPiBXaHkgbm90IHRvIHRha2UgcG9pbnRlciB0byB5b3VyIHByaXZhdGUgc3Ry
dWN0dXJlIGFuZCBvZmZzZXQgaW5zdGVhZCBvZg0KPiBhZGRyZXNzDQo+IGFuZCBjYWxjIHRoZSBh
ZGRyZXNzIGhlcmU/DQoNCk9rYXkNCg0KPiAuLi4NCj4gDQo+ID4gK3N0YXRpYyBpbnQgcmVsZWFz
ZV9zeXNfbG9jayh2b2lkIF9faW9tZW0gKmFkZHIpDQo+IA0KPiBEaXR0by4NCg0KT2theQ0KDQoN
Cj4gLi4uDQo+IA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGJ1ZikNCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1jcHlfdG9pbygoaTJj
LT5pMmNfYmFzZSArIFNNQlVTX01TVF9CVUYpLCBidWYsDQo+ID4gdHJhbnNmZXJsZW4pOw0KPiA+
ICvCoMKgwqDCoCB9DQo+IA0KPiBXaHkgZG8geW91IG5lZWQgYnVmIGNoZWNrcz8gSXMgeW91ciBj
b2RlIGNhbiBzaG9vdCBpdHNlbGYgaW4gdGhlIGZvb3Q/DQoNClllcywgYnVmIHdpbGwgYmUgcGFz
c2VkIGFzIE5VTEwgaW4gc29tZSBjYXNlcy4gU28sIHRoaXMgY2hlY2sgaXMgcmVxdWlyZWQuDQoN
Cj4gPiArfQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWd2YWwgfD0gKEkyQ19JTlBV
VF9FTiB8IEkyQ19PVVRQVVRfRU4pOw0KPiANCj4gQW5kIGluIGEgcGxlbnR5IHBsYWNlcyB5b3Ug
YWRkIGV4dHJhIHBhcmVudGhlc2VzLiBSZXJlYWQgeW91ciBjb2RlIGFuZCBkcm9wDQo+IHRoZW0g
YW5kIGluIHNvbWUgY2FzZXMgKEkgd2lsbCBzaG93IGJlbG93IGFuIGV4YW1wbGUpIG1vdmUgY29k
ZSB0byBzaG9ydGVyDQo+IGFtb3VudCBvZiBMb0NzLg0KPiANCg0KT2theS4gSSB3aWxsIHRha2Ug
Y2FyZSBvZiB0aGlzLg0KDQo+IC4uLg0KPiANCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJlZ3ZhbCAmPcKgIH4oSTJDX0lOUFVUX0VOIHwgSTJDX09VVFBVVF9FTik7DQo+IA0KPiBFeHRy
YSBzcGFjZS4NCj4gDQoNCk9rYXkuIEkgd2lsbCByZW1vdmUgZXh0cmEgc3BhY2VzLg0KDQo+IC4u
Lg0KPiANCj4gPiArwqDCoMKgwqAgcGNpMXh4eHhfaTJjX2NvbmZpZ19oaWdoX2xldmVsX2ludHIo
aTJjLCAoSTJDX0JVRl9NU1RSX0lOVFJfTUFTSyksDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHRydWUpOw0KPiANCj4gV2h5IHBhcmVudGhlc2VzPyBXaHkgaXQgY2FuJ3QgYmUgb25lIGxp
bmU/DQo+IFRoZXJlIGFyZSBtb3JlIGV4YW1wbGVzIGxpa2UgdGhpcy4gRml4IHRoZW0gYWxsLg0K
DQpPa2F5DQoNCj4gLi4uDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBjaTF4eHh4X2kyY19zZXRfcmVhZG0oaTJjLCB0cnVlKTsN
Cj4gDQo+ID4gKw0KPiANCj4gV2UgZG9uJ3QgbmVlZCB1c2VsZXNzIGJsYW5rIGxpbmVzLg0KDQpP
a2F5LiBJIHdpbGwgdGFrZSBjYXJlIG9mIHRoaXMuDQoNCj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnVmWzBdID0gcmVhZGIoaTJjLT5pMmNfYmFzZSAr
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFNNQlVTX01TVF9CVUYpOw0KPiANCj4gV2h5IG5vdCBvbiBvbmUg
bGluZT8NCg0KT2theS4gSSB3aWxsIHVwZGF0ZS4NCg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbWNweV9mcm9taW8oJmJ1Zltjb3VudF0sIChpMmMtPmky
Y19iYXNlICsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTTUJVU19NU1Rf
QlVGKSwgdHJhbnNmZXJsZW4pOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPiAN
Cj4gVGhlc2UgYWNjZXNzb3JzIG1heSBjb3B5IGZyb20gMSB0byA0IGJ5dGVzIGF0IGEgdGltZS4g
RG9lcyB5b3VyIGhhcmR3YXJlDQo+IHN1cHBvcnRzIHRoaXMga2luZCBvZiBhY2Nlc3Nlcz8NCg0K
WWVzLCBIYXJkd2FyZSBzdXBwb3J0cyB0aGlzIGtpbmQgb2YgYWNjZXNzLg0KDQo+IA0KPiAuLi4N
Cj4gPiArwqDCoMKgwqAgd2hpbGUgKChpMmMtPmkyY194ZmVyX2luX3Byb2dyZXNzKSkNCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1zbGVlcCgyMCk7DQo+IA0KPiBFYWNoIGxvbmcgc2xl
ZXAgKDIwIG1zIGlzIHF1aXRlIGxvbmcpIGhhcyB0byBiZSBleHBsYWluZWQuIEJ1dCB0aGlzIGVu
dGlyZQ0KPiBsb29wDQo+IGxvb2tzIGxpa2UgYSBiYW5kLWFpZCBvZiBsYWNrIG9mIElSUSBvciBz
by4gV2h5IGRvIHlvdSBuZWVkIHRvIHBvbGw/DQoNClRoaXMgaGFuZGxpbmcgdGFrZXMgY2FyZSBv
ZiBzcGVjaWFsIGNhc2Ugd2hlbiBzeXN0ZW0gaXMgcHV0IHRvIHN1c3BlbmQgd2hlbiBpMmMNCnRy
YW5zZmVyIGlzIHByb2dyZXNzIGluIGRyaXZlci4gV2Ugd2lsbCB3YWl0IHVudGlsIHRyYW5zZmVy
IGNvbXBsZXRlcy4NCg0KPiA+IA0KPiA+ICvCoMKgwqDCoCBwY2lfd2FrZV9mcm9tX2QzKHBkZXYs
IEZBTFNFKTsNCj4gDQo+IFdoYXQncyBGQUxTRSBhbmQgd2h5IGZhbHNlIGNhbid0IGJlIHVzZWQ/
DQoNCk9rYXksIEkgd2lsbCB1c2UgZmFsc2UuDQoNCj4gLi4uDQo+ID4gK3N0YXRpYyBTSU1QTEVf
REVWX1BNX09QUyhwY2kxeHh4eF9pMmNfcG1fb3BzLCBwY2kxeHh4eF9pMmNfc3VzcGVuZCwNCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBjaTF4eHh4X2ky
Y19yZXN1bWUpOw0KPiANCj4gVXNlIG5ldyBtYWNybyB3aGljaCBzdGFydHMgd2l0aCBERUZJTkUg
cHJlZml4Lg0KDQpPa2F5DQoNCj4gLi4uDQo+IE1pc3NlZCBwZXJpb2QuDQo+IA0KDQpPa2F5LiBJ
IHdpbGwgdGFrZSBjYXJlIG9mIHRoaXMuDQoNCj4gPiArwqDCoMKgwqDCoCAqLw0KPiANCj4gPiAr
DQo+IA0KPiBVc2VsZXNzIGJsYW5rIGxpbmUuDQoNCk9rYXksIEkgd2lsbCB0YWtlIGNhcmUgb2Yg
dGhpcy4NCg0KPiANCj4gPiArDQo+ID4gK8KgwqDCoMKgIHBjaTF4eHh4X2kyY19pbml0KGkyYyk7
DQo+IA0KPiBIZXJlIHlvdSBuZWVkIHRvIHdyYXAgcGNpMXh4eHhfaTJjX3NodXRkb3duKCkgdG8g
YmUgZGV2bV8uIFNlZSBiZWxvdy4NCj4gDQo+ID4gK8KgwqDCoMKgIHJldCA9IHBjaV9hbGxvY19p
cnFfdmVjdG9ycyhwZGV2LCAxLCAxLCBQQ0lfSVJRX0FMTF9UWVBFUyk7DQo+ID4gK8KgwqDCoMKg
IGlmIChyZXQgPCAwKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwY2kxeHh4eF9p
MmNfc2h1dGRvd24oaTJjKTsNCg0KSSBhbSBub3QgZ2V0dGluZy4gQXJlIHlvdSBzdWdnZXN0aW5n
IHRvIGNoYW5nZSBBUEkgbmFtZSB0bw0KZGV2bV9wY2kxeHh4eF9pMmNfc2h1dGRvd24/DQoNCg0K
PiBXaXRoDQo+IA0KPiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+
ZGV2Ow0KPiANCj4geW91IG1heSBoYXZlIHNvbWUgbGluZXMgb2YgY29kZSBuZWF0ZXIgYW5kIHNo
b3J0ZXIuDQoNCk9rYXkuIEkgd2lsbCB0YWtlIGNhcmUgaW4gYWxsIHBsYWNlcy4NCg0KPiA+ICsN
Cj4gPiArwqDCoMKgwqAgcmV0ID0gZGV2bV9pMmNfYWRkX2FkYXB0ZXIoJnBkZXYtPmRldiwgJmky
Yy0+YWRhcCk7DQo+ID4gK8KgwqDCoMKgIGlmIChyZXQpIHsNCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRldl9lcnIoJnBkZXYtPmRldiwgImkyYyBhZGQgYWRhcHRlciBmYWlsZWQgPSAl
ZFxuIiwgcmV0KTsNCj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwY2kxeHh4eF9p
MmNfc2h1dGRvd24oaTJjKTsNCj4gDQo+IFlvdSBjYW4ndCBtaXggZGV2bV8gYW5kIG5vbi1kZXZt
XyBpbiBzdWNoIG1hbm5lci4gSXQncyBhc2tpbmcgZm9yIHRyb3VibGVzIGF0DQo+IC0+cmVtb3Zl
KCkgb3IgdW5iaW5kIHN0YWdlcy4NCg0KSSBhbSBub3QgZ2V0dGluZyB0aGlzIGNvbW1lbnQuIENh
biB5b3Uga2luZGx5IGV4cGxhaW4gbW9yZS4NCg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIHJldDsNCj4gDQo+IEFmdGVyIGZpeGluZyBhYm92ZSwgY29udmVydCB0aGUgZXJy
b3IgbWVzc2FnZXMgdG8gdXNlDQo+IA0KPiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZGV2X2Vycl9w
cm9iZSguLi4pOw0KPiANCj4gcGF0dGVybi4NCj4gDQoNCk9rYXkuDQoNCg0KPiAuLi4NCj4gDQo+
ID4gK3N0YXRpYyB2b2lkIHBjaTF4eHh4X2kyY19yZW1vdmVfcGNpKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKgIHN0cnVjdCBwY2kxeHh4eF9pMmMgKmkyYyA9IHBj
aV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgIHBjaTF4eHh4X2kyY19z
aHV0ZG93bihpMmMpOw0KPiA+ICt9DQo+IA0KPiBUaGlzIHdpbGwgYmUgZ29uZS4NCg0KSSBhbSBu
b3QgZ2V0dGluZyB0aGlzIGNvbW1lbnQgYWxzby4NCg0KDQpUaGFua3MsDQpUaGFydW4gS3VtYXIg
UA0K
