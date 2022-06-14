Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3CC354ABBF
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 10:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352517AbiFNIZx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 04:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbiFNIZt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 04:25:49 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449AE39BB7;
        Tue, 14 Jun 2022 01:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655195148; x=1686731148;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=+gZ1o/6G0JfWwF8nApVTBve7SVqOrzcYs5inxXopF10=;
  b=FkKioztnIsom4SwsTt4fd8bNB2fqdnuINPleGf2ptfuuZklbmzo6mFLF
   lfoW14zPVr0AGQqhF1X13nGB/Dv1DWRlbBP1zSrOayXBGeQtLEGtAPKqe
   3SVwENdLUVofzNe4UyMRNq5ppKB6P9dX4iIHFoC/Zdh3j7zYBr577kQFF
   nYuZcbOEtseD3nKon04Me8jiPznz9rciVbqUacaKBLjS3gTJbLh22efX7
   /UIRg+v+3M3Lw/qjzgN5UeqEyCYbwHG3oldzMb7AJpPHlG2DYVe/FSZnQ
   4YmgOntLvPwqZEvear0b503u59QWXSujmHgUAGUyRuqG3c7lnYP7xZqe6
   g==;
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="99914483"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2022 01:25:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 14 Jun 2022 01:25:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 14 Jun 2022 01:25:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Po/oQbPggplAqP35MS8cS3vafEMDr4WPTa441xEz+2OiiisEIn31Ux2tvDDhMVl/4Q2cfjX9koIRTYPYkp8ewyLAvvu38Fo+uzCoF3PzdHSP5EjM8/RzEg230eBCrp00RDQQTkwmFozKd8dNnw0LhPt8Ibn3p8zUAA7+E+gfjN7n6Tt4NNufdpFV8XxYgHL7KqqjhbHIfOo22l2WCkT5bTzORUlMCVifyO08tOd1JvYIUYFcp1zOa1/q6N2GbBytBRwHsSamxAwXosX8j5frdMCHnIGzsGG/DMM0YQOhcIn18emQpM2muREdO0lxc+MbilHnKE2HP9m7IBGa3K60ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gZ1o/6G0JfWwF8nApVTBve7SVqOrzcYs5inxXopF10=;
 b=CzYEc1dnckFahcDkU2gZ5GR0i5LvObqrGI6nL0BVPoLi1aOiwgiN63Kp9VE9hYW2B8M537bkSo/4yFxGuT44b8baFEVszNo4SPe6rXdXSyDv1VaVHoedyW46WVQ8iL1xePDcDvTe7fHl5x2MlU0bKQ2M1AK4Xxf/FwnGTkm1keBHZXVnCerDfNukBfCTYyOGXQOhRVrIFtYoLz0b8CfW7cc+6N9ELYITybYzxFWxu/T9Octu9KZ6osfD2cl1IbmYqFVrD8gJQo/2dq8foAtW/4CDbzhskZIFDgQBz/toayVPbZuRH+QfBZI+zQTF4JE3leURS3qhslFqgWmjFYNtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gZ1o/6G0JfWwF8nApVTBve7SVqOrzcYs5inxXopF10=;
 b=O33crtR7+mqkzE6DIGCUG+kbU1ZKdv0eFCzl+xslLA1b0NjlB5YGkECRBdazu49aLrrFd/QT/mWbZGaMZz+2eSZHOTlSm3Fj7Ot6ZkXOTnBjpUbfrTfJg9oaSrTHzlk6RWVBjjyN47mipN7v+ITm5RRRRy7WGp8fhw3nyK/3Guw=
Received: from MW4PR11MB5936.namprd11.prod.outlook.com (2603:10b6:303:16b::11)
 by DM6PR11MB2955.namprd11.prod.outlook.com (2603:10b6:5:65::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Tue, 14 Jun
 2022 08:25:41 +0000
Received: from MW4PR11MB5936.namprd11.prod.outlook.com
 ([fe80::ddf6:11cc:3391:d4e9]) by MW4PR11MB5936.namprd11.prod.outlook.com
 ([fe80::ddf6:11cc:3391:d4e9%6]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 08:25:41 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <peda@axentia.se>, <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>,
        <kamel.bouhara@bootlin.com>
Subject: Re: Regression: at24 eeprom writing times out on sama5d3
Thread-Topic: Regression: at24 eeprom writing times out on sama5d3
Thread-Index: AQHYfA01c45T/mrWhU2n/5J6R8aiEq1IQRKAgAUy9QCAAAyngIABF+EA
Date:   Tue, 14 Jun 2022 08:25:41 +0000
Message-ID: <ebadf90a-066d-1cbe-b15a-3a99e3ab2bd5@microchip.com>
References: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
 <2bb4868b-90ab-887e-bf13-9de8b79231bd@microchip.com>
 <YqdQoJbsgwjQ9PYh@shikoro> <0ce8b9d7-8a9e-cded-1762-71e230f4246c@axentia.se>
In-Reply-To: <0ce8b9d7-8a9e-cded-1762-71e230f4246c@axentia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccdd4da8-31b7-4277-e7fc-08da4ddf7835
x-ms-traffictypediagnostic: DM6PR11MB2955:EE_
x-microsoft-antispam-prvs: <DM6PR11MB2955B07918D1279E788C78A8E7AA9@DM6PR11MB2955.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kbCDqVGfJux64vmZqj5KQHbdZ7hdPngWcOjIdnTwq0zU/Xf4/1bd1vL1YgMbXqcgihfWcS9wJcbA4gAFhb51hf3G0q1jg9ewKlBt1cQ7ebefHTuZsdM3KT+0HQQjU9UwkN+WXCN9kqjhJhsPnwKnQgJYrrbfRiqtfM7D9fJCTBA60C2SO97eHGMDuiBl3sf2HnadiT49WnVbjU9AELfHlp46F87DKQp1SGXq2JtwXClIa2VNWh4L+8BBScn75gxXfwJvieOXGU2q38+9DxDSOJEJgHudGvGTkx3uXkeatOkkkOCuDqfuFH4xRVIOYTi4K415tjTWv4PZyw0a9UjC4PwhK3jJpbRmYyHp9Rr39nt3E7DWRDNUuDyFvcJHJXip9AnzDE00zQUGBHAKrYqZTaQ2AI9xug6kiOWRafNmkYIz3oCGHqxt6NsWHY1vG0SgZjEXAZuWsbQMMogWol13u8UpcTO9l5skUiXw2/vfIEDxc5tvqBV5LK4Fw+/vLlGOQWx0r9gtv9NxZ2rCjo0CcV+3DAyCdzJaVZQZI2eajKhs/bFeePTEywzXe0eSJ81Hag7m651gg3V3PJDIwSF9F9v1PDKam3/Y9rFsfiUSnY4SVBAiQOIx/mfVCSwKDDHDVv7RsthW/FgGZJLdqhvIJCdZrjEwon62MxXBJRIzmLgrII+lztk2gMHOZqFlBYfKp/0eZPbWUJWuMLQwZgcEWzyf0jYPSf9JQv99HGr/DOv7MfBPTLaXUUOQQxBwyHWpxG0RnHBT5JE3WJRVKV1aKwnWAP8Ps6gH9Ya6BahQPfk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5936.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(2616005)(186003)(38100700002)(36756003)(31696002)(8936002)(921005)(122000001)(4744005)(316002)(5660300002)(38070700005)(66476007)(66556008)(64756008)(8676002)(2906002)(508600001)(66946007)(6486002)(6512007)(6506007)(91956017)(76116006)(26005)(66446008)(110136005)(53546011)(71200400001)(31686004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0R2dllSWTBDMmpmWUxZVGlFQlFGTGtGZmw4ZkVZTUJHOWpqVWRpUzExa1Rs?=
 =?utf-8?B?TERlaVFSV0ROL1NlRjRvNWZDa0JybnEySTMrRW1VRWdJcDQrdzJsczJHNVls?=
 =?utf-8?B?VUpFNzdqUWZiSDdyVnE0NW9SRXhSK05DZDBXQS9yUWZGODBzbEMwYUowU3NO?=
 =?utf-8?B?REFmaWdCYzZ3d3g3VXVqYkYzWi9OYVlyQTBWWWZPQmloNmJ5UUZYdWtrckhM?=
 =?utf-8?B?T1NyRE9qNEpuUy9JZVgrTjF6MC9veWVPMjNNWUhOMENNYXhkeVpFbmtwdlJn?=
 =?utf-8?B?bzRNbCtEMnFNbStyTklpN0FZckxXUXkzc3JQRzlXOE9nREY1TlFpK0k5N3Yw?=
 =?utf-8?B?RFgrWUc5eHVLZVZuOHp4emFzbGc3S2xyM3VReDVFY1NNMFFvMVIxNlAwdE5x?=
 =?utf-8?B?OUJMSmJtdFBaRGVXcTBqUXNBdUJzUUNSbzFncnNBVFpPV2lLZnNCTllURzFv?=
 =?utf-8?B?L0ZOalgvdHNRdXFxUVRPQ0xLZ2N5L0t1aEM1dEs2UkhTcWtCd3pudld6T0Ex?=
 =?utf-8?B?amFtU3RFdDV4NU9HRXR1V1dCTDEyaFg5b3hYQjN0a3cxRjlxQ2JpY2VFRXlo?=
 =?utf-8?B?U3VVVTVKdnBTYXM0T0RSZmRseUlGeUJWQ0hTcStDdStnOWxzcDhKcDl5S3VD?=
 =?utf-8?B?bFJIcXdHdWtxRC9Kdy9QajVOdnZWYmRNTHp2cmtPK3JoQUU1WXJNQUFoQlJq?=
 =?utf-8?B?REpGREdST2lDM1Jqc3crQjBoR1M3d0pUY2NqUjdjc3pEckUyQ0o5NGFDV1hM?=
 =?utf-8?B?eG1KL2lNTVJ5WTU5Q0lrVHBxbzNKSVR4eVVWayt0UUZXYmxEaWM1WVBvbys0?=
 =?utf-8?B?N1Ayc1ErZnc0UTNrU2RYZENZbmU1cGczbHpqRHpYNHRYV0tkQ2JPZXJubXJy?=
 =?utf-8?B?ekJJY3BBbUhxY1dLV29ncGlKUmFodnN3eDUzSGRKZnVUVWVLQVR5VXRQS1c0?=
 =?utf-8?B?Um1ERDROSU9wUFVEaURQK3FOTCtWSWtKdXBJWjZweDAydXBrOHVBSEpMWmht?=
 =?utf-8?B?V01UWmxGWGU0U29rSXVLTXlVcTNUU1hnb25BWTl5SW03RVpNRVM1ZVZEN09Y?=
 =?utf-8?B?ZHdaREYxVjdBQ1JoeFY1Y3FmOTU0K0ZmQXU3a0txYnJBZ2RXWTVjbGl0Ulpp?=
 =?utf-8?B?RkltYWV6V0s3UUxPOEJ5VkFUbjlkTW91TzhITm9yc2taUlE2b1I5ck1GUWpJ?=
 =?utf-8?B?WWZab2Q0UlQvWC84TDhtdDlWckx3UVk1Ykh4aUlLZXByZkZuYytabzZBM2FK?=
 =?utf-8?B?R0lscHhtQ3VPQjNIdm1zOVQwOE5ISXZJMlFBUVArNFZWWCtlRno5ZEx3R1Ey?=
 =?utf-8?B?dU5BT2Iwbm0wcVBwSjYvVzJuWGFSZXluNnYzTkY2NHhHaTB2Ulpyei85UnRp?=
 =?utf-8?B?SXFSMkkvYjl1V2xwY0RQaExuYnpSajlSckYwVHE0ZEl3VUl2eWVKOHQwcVdM?=
 =?utf-8?B?MEdOU252R2laVUdITzFwNlcwV1VpSTByVk9wdlF0UUsvM0gzWis1Uk0wVElG?=
 =?utf-8?B?bGVld2Y4RVQ3MkcwdHF6TGdyZTVWb0lqUm9XVzR2bXZvR3ZORk50T2N0dTNi?=
 =?utf-8?B?UnFSUGFKRmZDQTRQNEd3TVZyd0R0UENnODVudGRMN21UVWthWm0wR2ppZTR1?=
 =?utf-8?B?aDJkY2xraWZpSTdpSjA0bUNUTWFHZWdPRWpHM3JYQW5vbXUvM0JoMjlqUHlN?=
 =?utf-8?B?TTZONlVQUThOMVpPN0RYaU5hNmlIMW5hQVZLS215d2wrV3JkdzJQL0E5NkhX?=
 =?utf-8?B?a3FjVVlwdEtCUHlvUEw2UkZRU3JQNEhIazAzK1Qra2FXRzBhcE1ZYWlFbTYy?=
 =?utf-8?B?Z2FPcVFXdTVDSVFBakhySituVDVVb0VXRnYrZHRQbWNxK0pEVFhSbGZ6d3Rs?=
 =?utf-8?B?M0QwanNuQnlQOXB0MzZXNmR4amZBaFI4TnZtYnR0UGQ0SHlZT2gvTHQzYU5E?=
 =?utf-8?B?dFBwMmlDNlN5WGU4L3A5WFYrSVplK090QjVZWGZvNHBSUUpQRWhNT251bFhI?=
 =?utf-8?B?MjdDOUQ4c01vMktGOUxvWVdlM3BtNXRkeVM4bEZWMEVrTTl6RkNiZ3MzTnpm?=
 =?utf-8?B?ckhJcHhKWmtrd1JxeXhFaVowWkRYVXRaY2ZKVnk0SzlvRi9ZZWVsRW5HYUt5?=
 =?utf-8?B?a3l6SnR1azZqL1RCMGEzWWpTNSt6bFdTRER6UkNEeVhtdWtMZFQvbE9naXI5?=
 =?utf-8?B?N2M2OVRRYktZTlRTMUNQVi8xa0dDdHFJVTZadWdxVlh2Rmg3Ly8xL2Jhalpm?=
 =?utf-8?B?b01kV2lqMEZ3cjV4NEROVloycGRKM0Jmc3ZoSTRQVitqWG1iL09VeFpGLy9v?=
 =?utf-8?B?ZUFMa2ZNNEZ2THpsNFV4eVNWelVSbEo2QzNBUVlTYWh2TjBUQTF4SVVQRHYr?=
 =?utf-8?Q?WsLcLpqgOCdwOhww=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B8A55632084864E9D08A0E4A3FDE1BD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5936.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccdd4da8-31b7-4277-e7fc-08da4ddf7835
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 08:25:41.5554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PyVfb+Fr3RKkq06rGh2EuNI/nRTb8otGSYSz2X5KeaWp3HKX/TuYdA3NVL+pBgY17LHgkIoB9axL7gNW3FRjKscKqKkeh+1rj+9rddG3VWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2955
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTMuMDYuMjAyMiAxODo0MywgUGV0ZXIgUm9zaW4gd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGkhDQo+IA0KPiAyMDIyLTA2LTEzIGF0IDE2OjU4
LCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+PiBIaSBDb2RyaW4sDQo+Pg0KPj4+IGNvdWxkIHlvdSBw
bGVhc2UgYXBwbHkgdGhpcyBwYXRjaC1zZXQgWzFdIGFuZCBsZXQgdXMga25vdyBpZiBpdA0KPj4+
IGFkZHJlc3NlcyB5b3VyIGlzc3VlPw0KPj4NCj4+IEFueSBjb21tZW50cyB0byB0aGUgY29tbWVu
dHMgSSBnYXZlIHRvIFsxXT8gOikNCg0KSSByZXBsaWVkIHR3byB0aW1lcywgYnV0IGl0IGxvb2tz
IGxpa2UgbXkgZS1tYWlscyBhbHNvIGRvbid0IHJlYWNoIHRoZSANCmxpc3QuDQoNCj4gDQo+IEkg
cmVwbGllZCB0byBwYXRjaCAxLzMgYW5kIDIvMyBidXQgaGF2ZSBub3Qgc2VlbiB0aGVtIG9uIHRo
ZSBsaXN0cyBhbmQNCj4gcGF0Y2h3b3JrIGFsc28gYXBwZWFycyB0byBiZSBpbiB0aGUgZGFyay4N
Cj4gRGlkIHRoZSByZXBsaWVzIG1ha2UgaXQgYW55d2hlcmU/IFNob3VsZCBJIHJlc2VuZD8NCg0K
U2FtZSBpbiBteSBjYXNlLiBJIHRob3VnaCBpdCBoYXMgc29tZXRoaW5nIHRvIGRvIHdpdGggbXkg
c2V0dXAgb3IgDQpNaWNyb2NoaXAncyBJVCwgYnV0IGl0IGxvb2tzIGxpa2UgaXQncyBub3QgdGhl
IGNhc2UuDQoNCkkgY2FuIHJlc2VuZCB0aGUgcGF0Y2hlcy4gSG9wZWZ1bGx5IGl0IHdpbGwgaGVs
cC4NCg0KQmVzdCByZWdhcmRzLA0KQ29kcmluDQo=
