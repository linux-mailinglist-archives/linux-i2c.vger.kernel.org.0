Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 999704D44C5
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Mar 2022 11:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240256AbiCJKfG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Mar 2022 05:35:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232932AbiCJKfF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Mar 2022 05:35:05 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D8CB10C;
        Thu, 10 Mar 2022 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646908445; x=1678444445;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aN5tLtxlrM1WR8yK+MQvT95pP6gERdbEXePLROVdNoQ=;
  b=p5ZRpjIitbVN9AJRhhEQs2Eb4y17xKno+gV24+fjeZRIc5QT55HJW/uX
   /esGe54TmsEhYmcVJY2WJsI4Ouna2riBIvKXBPN/ye8a0EgTKRelOR9Yo
   GNb+r2RIzwFl0BdtHbQ2ykQY0dWhhEykvhBocuvCZWLOzNSCRessiKCRG
   DMLUR73ilLvNzHWH/1YElwibamT9uOJxLeKLMUpNzCJ3Yj5aQzVjTLcSB
   2mQxt5ncQ4D41upNL5+sQnvPdWGbjwZ32YbyigMrDM7BlAIfOyIXw/d6G
   knpzvGmYS+rWI8v6Apo3UqrihMDgNzEcvIg+wxGZxIXiWC14y5IAP2RGO
   w==;
X-IronPort-AV: E=Sophos;i="5.90,170,1643698800"; 
   d="scan'208";a="148750518"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Mar 2022 03:34:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 10 Mar 2022 03:34:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 10 Mar 2022 03:34:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4m0vYIdvhsB3prfd2hm4K8kDTpoz4BidHbXzdXZMeLaNyiedpr6hjutSWSX9ZMSpn17BLIgqvUyQFzlkprReCQlxbalxgAOWNHmUGQ3bD5OzVYiGji6mBDrgiYWOFgEJ2qrYmuHLpt1UPEgman48jyhABZrVsuyEJep9o8fZc1ideQCZqIwk1W8cMamy+bAm80Ri2yLXoVOZ7vy6Zfn2tYU5mB58G4nfZtW7tz+zLlwDgZIRIvX8LUiX4VFwIpmQaD0/uVSFaeyymIUUUK3hEMNoqfTvzA7GtoRHS5XVSwxh+luE0Pxu7oAu8j8ERunIExxVPC8JevtzLs+9H/Oag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aN5tLtxlrM1WR8yK+MQvT95pP6gERdbEXePLROVdNoQ=;
 b=AU3QlO6bhHcGQBbcC6BkABFLOwOfqP2lSfcCQQs/nOoCIB2Bon/OuT1DpyUBefcrXe/oKkt/ZLvAI1jvbouhTvNA/sEbxtw7gDIJJR3Utlkr0m5oqu15oQfQV7/EBENh8KznON0w58Ywp8HkVCmTp6e/G62aMA57m/Cq1PDrmGpuL2pjJkDItVZo32zdC4TW82BLMIbERnMD+bWG0DvQrWQcr9W6xyzF71BIaNse5LjsN3MPjAHFEamMqhfCydcKuuCKMNBy4Z9dLMlRIVgVLqx5ou7aDbNlPWfG5rc4zR6rVX+A8I4k8SzG9/xIXp9kkYDtMKh8CV9gtA7qBIGCdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aN5tLtxlrM1WR8yK+MQvT95pP6gERdbEXePLROVdNoQ=;
 b=bmlVWyRWhe520L6LA47uff1rcMGxCchRL2UirMtPb7K9yIMb2JL9ej+sMOWr0q8k0EJuVfF7ODK06DSQoKxAFgYUOZxTB92MyQWkam0g44VxAMVKF8XawZoTlQ4PIlhl5OFBpz/BTY/AxAKV8sqK1N+YeEB2rScwo+L7tD8lrJY=
Received: from BYAPR11MB2758.namprd11.prod.outlook.com (2603:10b6:a02:c9::11)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.29; Thu, 10 Mar
 2022 10:33:57 +0000
Received: from BYAPR11MB2758.namprd11.prod.outlook.com
 ([fe80::381d:1e0a:2ec0:38b6]) by BYAPR11MB2758.namprd11.prod.outlook.com
 ([fe80::381d:1e0a:2ec0:38b6%4]) with mapi id 15.20.5038.029; Thu, 10 Mar 2022
 10:33:57 +0000
From:   <Sergiu.Moga@microchip.com>
To:     <krzysztof.kozlowski@canonical.com>, <robh+dt@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Claudiu.Beznea@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: i2c: convert i2c-at91 to json-schema
Thread-Topic: [PATCH 2/3] dt-bindings: i2c: convert i2c-at91 to json-schema
Thread-Index: AQHYM65JDP+e4Vyvwk6s9L3mjp21Oay4N6AAgAA1tAA=
Date:   Thu, 10 Mar 2022 10:33:57 +0000
Message-ID: <0a35f2ae-0c89-1859-0375-de4fb3a1ab3d@microchip.com>
References: <20220309120714.51393-1-sergiu.moga@microchip.com>
 <20220309120714.51393-3-sergiu.moga@microchip.com>
 <4ebce779-63f5-a7b4-6cd7-5152ce345531@canonical.com>
In-Reply-To: <4ebce779-63f5-a7b4-6cd7-5152ce345531@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e079b07-9423-45cb-daeb-08da02817b80
x-ms-traffictypediagnostic: MW4PR11MB5870:EE_
x-microsoft-antispam-prvs: <MW4PR11MB58708DD3B5F75E7058E217A8E80B9@MW4PR11MB5870.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L3rCzbDQ3ZGl2wdGZHBpyF5pa355TYDxZz4PgrvE+cjDdnJ9l8stW+hdhen8Ozki0bVtL/t43IJ7BftsxYKwTWnMll67SrmlAR5TXDmV2eNObC0nY9QRqgD/acVn9rSsWLptwzWEyrVyUSCFIIW5TKFOEwddYPVR4d+dG+bRXGegXvcpNetxihGPa9nhdsswoOkJbLXIuvqQ5MUwtDqHoNlChI3GBZwtiAWmyWE60Kvcobfe7U/Mokgr1nENGbObxLmqMzRTk+oDGw2tt9fQP4PGSO0nDbx8BpkzyaY7hi1uCSN2xo86tGEhkgjJxEWjD9y7tadmlrNolhBpYVGe5J4mWvEnOYvT5HH3x8gfOgsjXycsn182CHKHShEn4gRYtSapjsCFis20UEYopBCmIdou6F/McYmWAwVRzBKalWIpD4JcEvx1PXAUZnK52Q9tJi/1Yg8ldgK2LFkhcveJPlsBEoEINYQ/YCkvgRiqP/SGzM6dGB6Wr+hoZrLuvy0+AWMefetg6H4E8YXyon5GuT4RvnzLvoEZq6YbSEHhfVGzNixnS1OQlApR16xYAydECglvVVZImEM5raTullGzBlge7xzA16BZKV153CjBCrTqH/tgnoGdcUBaJyJI4ZzQ/69EAH9P7tVPyhPhnvV2auv8zcrGJB9pDiWisJEVCv7D7z9PbcxMp+HndicZAbMQ9Ya7glyPxy/+M4AG66VxGmbhC3UyU1NOxD33NYOUxdObVx8cslRMEtvM2EYUcQIdIMQFrUe36IVeMQ2gapEuF20+Rsv/W3OB7VYi/hlmMmmz6/bpEBvnA7kk+6BjnP4P8Izb0qjkRy3lJD4f+l4DADgZEy8I6KrW3J+LR02h0gw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38070700005)(6486002)(31686004)(966005)(110136005)(6636002)(71200400001)(54906003)(316002)(508600001)(8676002)(91956017)(76116006)(66946007)(66556008)(66446008)(66476007)(122000001)(64756008)(4326008)(6506007)(31696002)(5660300002)(53546011)(2616005)(186003)(26005)(38100700002)(83380400001)(6512007)(36756003)(86362001)(2906002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjlQZFVzeUhVRFlRdHJ1bm1qZytDbXR2Y0h3MUlMamxwWFNrMW41ZW96aWU0?=
 =?utf-8?B?WThYR24ycXlYUGNZR0YrUy9GQkxFSlVBQmRoU1Arb3Q2Znl6REI4V0xMZW9B?=
 =?utf-8?B?TzlldHF4Qy96ZzBRd2tacUtRMWdXMjRnOXZNQmV3Um5ZdlY2TXVBR1h0OEVB?=
 =?utf-8?B?VUVKZ3IrZFpSU2dhMEp2dnJIdUNUUWlUd2hZTktiVERFQ29PS3dPTUR6Tlo0?=
 =?utf-8?B?WmYrSGl1amNSOTR2L1UxbWp0OEVtTFlET2lHQXVaT3hjQ0dPZWtWVXNlMXds?=
 =?utf-8?B?d2tBM0pjZ21CWnV1VTlKQjhwMlhhQmZLcWFmRjVraG5YMWx6KzdlbUZGUEts?=
 =?utf-8?B?Zy9VenVuYnRsNHFTZzZVcUdYYnVHUXJTdVp2ejhCeFVSTnBwTXNVakhVNUlj?=
 =?utf-8?B?d282enpwWjJFdEdRajBaRDlyWGs4ZTVGMU8xV2NoaG51eTFUZHpGbFV0bHg2?=
 =?utf-8?B?VDcxNmUrbkNIM3hiazZyRW9jbUFNNDdHNjE3bzRrTzdvVnQ2VDU0QU9UUkVw?=
 =?utf-8?B?SHB6Z2I1djFKLzVUdUx6aUVmWFVNVFE0MDJFbHhpQlhVVHVUcVhJaUEzak5D?=
 =?utf-8?B?cmhxU09JRzVsUnZCdlZ4KzE2c1RGT05yNFZVdXpNWUQxWnk3RG00cVVGeW5W?=
 =?utf-8?B?cENsckZ3RWh4bE5iWnBRT2w1TDRDYXJwV29adzZTbld6ZWx1eW1IVWdEQWFL?=
 =?utf-8?B?RGtpSWdCbVdlSXR4ZWJId2xKQjk2RjRVSTdUVkNhM05TZFRISUxxaE5VQnk3?=
 =?utf-8?B?OVc3dXZ2dEh0V0ZBTjZ6UGxjWGVxVlFVcjFSUWFnNmlOemFnODV3SkFoQkwx?=
 =?utf-8?B?SWQzdnRqZlVkb0UrN095WlJ6SFRDNnV5MXBCNHJsbFJlWHYxWTR3WEdqT2tN?=
 =?utf-8?B?cFJvSTlWTVNNVGg0dzhYcXRIVzRuNGVUdFc2SzMwemMyQ2kzOENBRXRRSUFU?=
 =?utf-8?B?RkpqWUVxVFRHdEVjUUlIeVZQcGY1YW9nUUcxUGc3TzZYRzFBMmY1aFBMaUJ2?=
 =?utf-8?B?RmZHZmI3TGNmWnh4bDkycFlqNVo1UjRqWXBEKzRObVNZM01ibFcyR2Z3dVF5?=
 =?utf-8?B?VXJUZngrM2xPbUdkY3hjdjVEbDJOWnEzbnQrakhndTBjWlBmMWRhbmdrL0hm?=
 =?utf-8?B?VGpYbEdPT01ScEFueTAzZlpvMXJuRmxmaDl1OERuRDM1WTZ1NThyZG54dHMz?=
 =?utf-8?B?VGgveGNlRUJiaG9YeTErSXhpdkVEUldKU1hMNzl1M3duTmlRajRwRGZ4THR6?=
 =?utf-8?B?NE53Zk5UTjl0YmUxQWZQSFN0RHArMUpCVnpiRkMvb0UzdTJzRk9UYk80WHlt?=
 =?utf-8?B?dEwwWXltUGE3a05WZ2xsZEgyYWZ2ZDJxL05OUEp0WFVVUTdYdjRBU0h2b3lp?=
 =?utf-8?B?c3BYNi9IdVFqZTFELzN2RjM2UEUvN0dyTVVmTlIwR3pBNUJCV1o3a3dzWjhn?=
 =?utf-8?B?VGZtUGltT2tyTDV6QnNTbWJONXU2UTRPVXNBb3FiSGpiRDZBNXV2bDRHd0RT?=
 =?utf-8?B?ZlozMFNlMEtDMk5hZi9yaEZoQTFLQmZQY3c0MWJja29uN1lpZ0QrcXUwdE9n?=
 =?utf-8?B?dExNTWhaOVNGZExnZnBpYmcwSFRxTWVkaWlCb1BQSmU3ME93azU5amgyR2xH?=
 =?utf-8?B?dUlEMzdtWURhNVZDczVOaDI5SWgycDNydmdGZlpzaVIxK3F3NDVlR2dNNXVH?=
 =?utf-8?B?L3BXdWw2ZkxVTEJWK2oxZXlIVWt0WlVPNW5PSHZ2VWxRN1ArdWc4N2htMWRQ?=
 =?utf-8?B?a3lidGNiUW5KV3g4RGlyMER2Nkx0WGFDcUpETWpndEIvQ2g0bG9acmthcXBC?=
 =?utf-8?B?N0Nxay9LYjQzSExhR1JUKy9HZ3lybnlwZWdpQWdVc1hLWE5LTnNDcUFVbE5u?=
 =?utf-8?B?UG4vSzd4dUZKUUpxMU52YzNRc2tHMXZpa0xOSkhWWTR2UkpabVdYK2VsdWVx?=
 =?utf-8?B?eDBjTGExcGpjR0Y4ZnhnUEpMeS9rVm54Uk5JZEpPc3pJT2MwczBOWi9KOERy?=
 =?utf-8?B?K2N5YWZYY3g2ajhLTnpYOFFnR2VMa3preEx0UUNsU1BNeDlUalY5OUhJZXlo?=
 =?utf-8?B?RnVHRTR2WG9QRDZoRStvV1RSTFVYcjh5WXBrS0dTbmhuMCt4WmRZamxCSE9J?=
 =?utf-8?B?ZC9FcnNRRk5mdWU1WmpWTWI5M2NzZCtMdklxMk9DSUo0T1NKKzdWajJzMnB4?=
 =?utf-8?Q?Tv52BajzemI+0ceoVnDnJRRy1PMfEZL0qrqEOKAKftso?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51A799E56E181743AAC2757750E4D1B3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e079b07-9423-45cb-daeb-08da02817b80
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 10:33:57.1175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XDQY3Jp8jQeJ5rk4/UkV3tNsp2gWfu/JD+zRrBO/aJ5BnEMdXo36QMK2lfOacOYgHNPMPsWxYwBF5IyICFmloCUusEOhxL/WSNvvwpeHyVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTAuMDMuMjAyMiAwOToyMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMDkv
MDMvMjAyMiAxMzowNywgU2VyZ2l1IE1vZ2Egd3JvdGU6DQo+PiBDb252ZXJ0IEkyQyBiaW5kaW5n
IGZvciBBdG1lbC9NaWNyb2NoaXAgU29DcyB0byBEZXZpY2UgVHJlZSBTY2hlbWENCj4+IGZvcm1h
dC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTZXJnaXUgTW9nYSA8c2VyZ2l1Lm1vZ2FAbWljcm9j
aGlwLmNvbT4NCj4+IC0tLQ0KPj4gICAuLi4vYmluZGluZ3MvaTJjL2F0bWVsLGF0OTFzYW0taTJj
LnlhbWwgICAgICAgfCAxNDQgKysrKysrKysrKysrKysrKysrDQo+PiAgIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQgICAgICB8ICA4MiAtLS0tLS0tLS0tDQo+PiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMTQ0IGluc2VydGlvbnMoKyksIDgyIGRlbGV0aW9ucygtKQ0KPj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9h
dG1lbCxhdDkxc2FtLWkyYy55YW1sDQo+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1hdDkxLnR4dA0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2F0bWVsLGF0OTFzYW0t
aTJjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2F0bWVsLGF0
OTFzYW0taTJjLnlhbWwNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAw
MDAwMDAuLmQ0YWFkYmJkMWExMQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hdG1lbCxhdDkxc2FtLWkyYy55YW1sDQo+PiBA
QCAtMCwwICsxLDE0NCBAQA0KPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPj4gKyMgQ29weXJpZ2h0IChDKSAyMDIyIE1pY3JvY2hp
cCBUZWNobm9sb2d5LCBJbmMuIGFuZCBpdHMgc3Vic2lkaWFyaWVzDQo+PiArJVlBTUwgMS4yDQo+
PiArLS0tDQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pMmMvYXRtZWws
YXQ5MXNhbS1pMmMueWFtbCMNCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+ICsNCj4+ICt0aXRsZTogSTJDIGZvciBBdG1lbC9NaWNy
b2NoaXAgcGxhdGZvcm1zDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiArICAtIEFsZXhhbmRy
ZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4NCj4+ICsNCj4+ICthbGxP
ZjoNCj4+ICsgIC0gJHJlZjogImkyYy1jb250cm9sbGVyLnlhbWwiDQo+PiArICAtIGlmOg0KPiBh
bGxPZiB3aXRoIGFkZGl0aW9uYWwgaWY6IGdvZXMgYnkgY29udmVudGlvbiBhZnRlciByZXF1aXJl
ZDouDQo+DQpVbmRlcnN0b29kLiBJIHdpbGwgbW92ZSB0aGUgYGFsbE9mYCBhZnRlciBgcmVxdWly
ZWQ6YC4NCg0KPj4gKyAgICAgIHByb3BlcnRpZXM6DQo+PiArICAgICAgICBjb21wYXRpYmxlOg0K
Pj4gKyAgICAgICAgICBjb250YWluczoNCj4+ICsgICAgICAgICAgICBlbnVtOg0KPj4gKyAgICAg
ICAgICAgICAgLSBhdG1lbCxzYW1hNWQ0LWkyYw0KPj4gKyAgICAgICAgICAgICAgLSBhdG1lbCxz
YW1hNWQyLWkyYw0KPj4gKyAgICAgICAgICAgICAgLSBtaWNyb2NoaXAsc2FtOXg2MC1pMmMNCj4+
ICsgICAgdGhlbjoNCj4+ICsgICAgICBwcm9wZXJ0aWVzOg0KPj4gKyAgICAgICAgaTJjLXNkYS1o
b2xkLXRpbWUtbnM6DQo+PiArICAgICAgICAgIGRlc2NyaXB0aW9uOg0KPj4gKyAgICAgICAgICAg
IFRXRCBob2xkIHRpbWUNCj4+ICsgICAgICAgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICtwcm9w
ZXJ0aWVzOg0KPj4gKyAgY29tcGF0aWJsZToNCj4+ICsgICAgZW51bToNCj4+ICsgICAgICAtIGF0
bWVsLGF0OTFybTkyMDAtaTJjDQo+PiArICAgICAgLSBhdG1lbCxhdDkxc2FtOTI2MS1pMmMNCj4+
ICsgICAgICAtIGF0bWVsLGF0OTFzYW05MjYwLWkyYw0KPj4gKyAgICAgIC0gYXRtZWwsYXQ5MXNh
bTlnMjAtaTJjDQo+PiArICAgICAgLSBhdG1lbCxhdDkxc2FtOWcxMC1pMmMNCj4+ICsgICAgICAt
IGF0bWVsLGF0OTFzYW05eDUtaTJjDQo+PiArICAgICAgLSBhdG1lbCxzYW1hNWQ0LWkyYw0KPj4g
KyAgICAgIC0gYXRtZWwsc2FtYTVkMi1pMmMNCj4+ICsgICAgICAtIG1pY3JvY2hpcCxzYW05eDYw
LWkyYw0KPj4gKw0KPj4gKyAgcmVnOg0KPj4gKyAgICBtYXhJdGVtczogMQ0KPj4gKw0KPj4gKyAg
aW50ZXJydXB0czoNCj4+ICsgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICsgICIjYWRkcmVzcy1j
ZWxscyI6DQo+PiArICAgIGNvbnN0OiAxDQo+PiArDQo+PiArICAiI3NpemUtY2VsbHMiOg0KPj4g
KyAgICBjb25zdDogMA0KPj4gKw0KPj4gKyAgY2xvY2tzOg0KPj4gKyAgICBtYXhJdGVtczogMQ0K
Pj4gKw0KPj4gKyAgY2xvY2stZnJlcXVlbmN5Og0KPj4gKyAgICBkZWZhdWx0OiAxMDAwMDANCj4+
ICsNCj4+ICsgIGRtYXM6DQo+PiArICAgIGl0ZW1zOg0KPj4gKyAgICAgIC0gZGVzY3JpcHRpb246
IFRYIERNQSBDaGFubmVsIFNwZWNpZmllcg0KPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IFJYIERN
QSBDaGFubmVsIFNwZWNpZmllcg0KPj4gKw0KPj4gKyAgZG1hLW5hbWVzOg0KPj4gKyAgICBpdGVt
czoNCj4+ICsgICAgICAtIGNvbnN0OiB0eA0KPj4gKyAgICAgIC0gY29uc3Q6IHJ4DQo+PiArDQo+
PiArICBhdG1lbCxmaWZvLXNpemU6DQo+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMg0KPj4gKyAgICBkZXNjcmlwdGlvbjogfA0KPj4gKyAgICAgIE1h
eGltdW0gbnVtYmVyIG9mIGRhdGEgdGhlIFJYIGFuZCBUWCBGSUZPcyBjYW4gc3RvcmUgZm9yDQo+
PiArICAgICAgRklGTyBjYXBhYmxlIEkyQyBjb250cm9sbGVycy4NCj4+ICsNCj4+ICsgIHNjbC1n
cGlvczogdHJ1ZQ0KPj4gKw0KPj4gKyAgc2RhLWdwaW9zOiB0cnVlDQo+PiArDQo+PiArICBwaW5j
dHJsOg0KPj4gKyAgICBkZXNjcmlwdGlvbjogfA0KPj4gKyAgICAgIEFkZCBleHRyYSBwaW5jdHJs
IHRvIGNvbmZpZ3VyZSBpMmMgcGlucyB0byBncGlvIGZ1bmN0aW9uIGZvciBpMmMNCj4+ICsgICAg
ICBidXMgcmVjb3ZlcnksIGNhbGwgaXQgImdwaW8iIHN0YXRlDQo+IFRoaXMgaXMgYSBnZW5lcmlj
IHByb3BlcnR5LCB5b3UgZG8gbm90IG5lZWQgaXQuDQo+DQpXaWxsIHJlbW92ZSBpdCBpbiB0aGUg
bmV4dCB2ZXJzaW9uLiBUaGFuayB5b3UuDQoNCj4+ICsNCj4+ICtyZXF1aXJlZDoNCj4+ICsgIC0g
Y29tcGF0aWJsZQ0KPj4gKyAgLSByZWcNCj4+ICsgIC0gaW50ZXJydXB0cw0KPj4gKyAgLSAiI2Fk
ZHJlc3MtY2VsbHMiDQo+PiArICAtICIjc2l6ZS1jZWxscyINCj4+ICsgIC0gY2xvY2tzDQo+PiAr
DQo+PiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4gKw0KPj4gK2V4YW1wbGVzOg0K
Pj4gKyAgLSB8DQo+PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJv
bGxlci9pcnEuaD4NCj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2RtYS9hdDkxLmg+DQo+
PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4NCj4+ICsNCj4+ICsgICAg
aTJjMDogaTJjQGZmZjg0MDAwIHsNCj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiYXRtZWwsYXQ5
MXNhbTlnMjAtaTJjIjsNCj4+ICsgICAgICAgIHJlZyA9IDwweGZmZjg0MDAwIDB4MTAwPjsNCj4+
ICsgICAgICAgIGludGVycnVwdHMgPSA8MTIgSVJRX1RZUEVfTEVWRUxfSElHSCA2PjsNCj4+ICsg
ICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8
MD47DQo+PiArICAgICAgICBjbG9ja3MgPSA8JnR3aTBfY2xrPjsNCj4+ICsgICAgICAgIGNsb2Nr
LWZyZXF1ZW5jeSA9IDw0MDAwMDA+Ow0KPj4gKw0KPj4gKyAgICAgICAgZWVwcm9tQDUwIHsNCj4+
ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gImF0bWVsLDI0YzUxMiI7DQo+PiArICAgICAgICAg
ICAgcmVnID0gPDB4NTA+Ow0KPj4gKyAgICAgICAgICAgIHBhZ2VzaXplID0gPDEyOD47DQo+PiAr
ICAgICAgICB9Ow0KPj4gKyAgICB9Ow0KPj4gKw0KPj4gKyAgICBpMmMxOiBpMmNAZjgwMzQ2MDAg
ew0KPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJhdG1lbCxzYW1hNWQyLWkyYyI7DQo+PiArICAg
ICAgICByZWcgPSA8MHhmODAzNDYwMCAweDEwMD47DQo+PiArICAgICAgICBpbnRlcnJ1cHRzID0g
PDE5IElSUV9UWVBFX0xFVkVMX0hJR0ggNz47DQo+PiArICAgICAgICBkbWFzID0gPCZkbWEwDQo+
PiArICAgICAgICAgICAgKEFUOTFfWERNQUNfRFRfTUVNX0lGKDApIHwgQVQ5MV9YRE1BQ19EVF9Q
RVJfSUYoMSkpDQo+PiArICAgICAgICAgICAgQVQ5MV9YRE1BQ19EVF9QRVJJRCgxMSk+LA0KPj4g
KyAgICAgICAgICAgICAgIDwmZG1hMA0KPj4gKyAgICAgICAgICAgIChBVDkxX1hETUFDX0RUX01F
TV9JRigwKSB8IEFUOTFfWERNQUNfRFRfUEVSX0lGKDEpKQ0KPj4gKyAgICAgICAgICAgIEFUOTFf
WERNQUNfRFRfUEVSSUQoMTIpPjsNCj4+ICsgICAgICAgIGRtYS1uYW1lcyA9ICJ0eCIsICJyeCI7
DQo+PiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+ICsgICAgICAgICNzaXplLWNl
bGxzID0gPDA+Ow0KPj4gKyAgICAgICAgY2xvY2tzID0gPCZmbHgwPjsNCj4+ICsgICAgICAgIGF0
bWVsLGZpZm8tc2l6ZSA9IDwxNj47DQo+PiArICAgICAgICBpMmMtc2RhLWhvbGQtdGltZS1ucyA9
IDwzMzY+Ow0KPj4gKyAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgImdwaW8iOw0K
Pj4gKyAgICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzA+Ow0KPj4gKyAgICAgICAgcGlu
Y3RybC0xID0gPCZwaW5jdHJsX2kyYzBfZ3Bpbz47DQo+PiArICAgICAgICBzZGEtZ3Bpb3MgPSA8
JnBpb0EgMzAgR1BJT19BQ1RJVkVfSElHSD47DQo+PiArICAgICAgICBzY2wtZ3Bpb3MgPSA8JnBp
b0EgMzEgKEdQSU9fQUNUSVZFX0hJR0ggfCBHUElPX09QRU5fRFJBSU4pPjsNCj4+ICsNCj4+ICsg
ICAgICAgIGVlcHJvbUAxYSB7DQo+PiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ3bTg3MzEi
Ow0KPiBJdCBzZWVtcyB0aGlzIGlzIHVuZG9jdW1lbnRlZCBjb21wYXRpYmxlLiBDb3VsZCB5b3Ug
dXNlIHNvbWV0aGluZyBlbHNlLA0KPiBkb2N1bWVudGVkPw0KPg0KSSB3aWxsIHJlcGxhY2UgaXQg
d2l0aCBhIG5vZGUgd2l0aCBhIGRvY3VtZW50ZWQgY29tcGF0aWJsZSBpbiB0aGUgbmV4dCANCnZl
cnNpb24uDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KVGhhbmsgeW91IGZvciB0
aGUgZmVlZGJhY2suDQoNClNlcmdpdQ0KDQo=
