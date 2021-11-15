Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD9C4508B9
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 16:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236495AbhKOPmj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 10:42:39 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:35579 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236354AbhKOPmW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Nov 2021 10:42:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636990766; x=1668526766;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=iNQ4kapYpqHy40kNWzLAMx2QgBhfBV7QH1wAuWiB9nw=;
  b=lB2SzWmEM6xbNgtuCrnEQ4dPOTmARY6N/4Y+Tjh+yfUQLulti3MB/El+
   7GbGBhugwc0sXrK1QlmCccy+zbpsH0zCTjfLQ1T1X5xvQO/dvIBVfu3LQ
   VcB0++zHyb4BZvUEHn5DQafOh8xaQk8G1wfUW29oaQrRCCy8Hn3oBB1bt
   l11PVaLLMFPQHPM3uefW1zNZHiWH3XBBfd8bXcsiKNl1sxrQ6C79myCWo
   8FHSMx1HpeLnuRAVrM88qpuFDi+7EB/1h79GPA4to+JYbPV27E7q8Br1M
   PbNMkbp87DHtOk1kyYib+pNCrKf/ZzE9khyA2nMX1ge38KgxmA5N3iZMa
   Q==;
IronPort-SDR: K7+qllSP5FSRC7Lm2ryF5oGBrxvAp8WCkL4z8A04TYSqxX8AP5IJHN5sQG0Yf0rTIvYR2e3c1B
 kjuDe99yxRoLgU3FNlxMFqaQJeqH/YMiEcZHQXN91PGQt6VcTp6GFA+NwaW9BXRrWaW7eTLsnh
 r9BfGpdjgrhAjvYyacNJipfpwjMU4N7aCtPMxHwVjBWeiBO4zCBRCuFWNobZPCzdX9fJ1yBg3F
 epzpoqgIXzWmc/8qwuLgH//O+YRCqVhivRWHChQfCtSCu53Frf3/mHEV1lWKJ8Nz8d1/0iWNOU
 5nT3j/tNzhIutf6CDB1EWd1k
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="151955128"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Nov 2021 08:39:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 15 Nov 2021 08:39:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Mon, 15 Nov 2021 08:39:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kti6pL8M3TxWrfIy5ZjeSkOcNHGV1OocBL5PGmck9Zo8QDb81CwXkUQfgN7PsVOeZPr5gGHqdnx1F0NLCPXux5TR6ukUt9EzQH1v7K8esNRkQUECbD4KTaWEhF3Sc9y9ywbAJUpR19BgKMOf6g2TZl1sIJiPjR6vuha9q5WRAwjqEVm2wXPIhNkTMDUXquGEOMm6xlJGXCAiNEVBmQ/Qms5dG14j7y4PFui02u2bzpPtEZXIj2oH5L0FgfTBDAg0jyIQLk7wlMxhvWdglwZqMkaHImrdQsFaUyohgg2zfLp4Yci53STxVtJGh2Pp6kCOU42RXuiFKQneOuouqu+cwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNQ4kapYpqHy40kNWzLAMx2QgBhfBV7QH1wAuWiB9nw=;
 b=nXfl4jfWlTfodb19C7a/kJ0jBlaKacGK5l4G25YWxCrqB141CXMwO5wsMI5UIveRXg9rcxUTGA4lWyh4WSHrabFpe/cyYhI3IlV9mXxdPxXK865oTlCEJec51qmmnm9f6Sa9E2Bdilj7SdGbfGQFGu6rV1D1Tux9lfuI9WNu7G/Od/oFxU1+3t59O6weWJ//UE++9+YxzQmlsp9nr3XMzEypvb/FBebYSsCf1W1NU45o7e6Zh5M4urrUa+LER0JxNWgtBeiDKzYe+lv+2lRwYhIKWzDcjDcrBz5K4j4SxyQyC1gIn11PvsflH2zQDWvoVkYrYjYvLIclNwbTjPxTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNQ4kapYpqHy40kNWzLAMx2QgBhfBV7QH1wAuWiB9nw=;
 b=llsLswJUUtLv3rlzOOg6Md4v7I4xakJI80Suabu4eiKXqy2Q8ikQOVjZ8v8mmi1uLdxaPDxsqhEDXm+lBtvg0CIyvD7oq8Ah4JCzOzqarVCETqNvMCt8IH4GVBwP6sOCVDsGD4kYODFT8jmTyez+u4RsevGWdOHGWbPL29WKCG8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1472.namprd11.prod.outlook.com (2603:10b6:301:d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 15:39:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 15:39:11 +0000
From:   <Conor.Dooley@microchip.com>
To:     <geert@linux-m68k.org>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <Lewis.Hanly@microchip.com>,
        <Daire.McNamara@microchip.com>, <atish.patra@wdc.com>,
        <Ivan.Griffin@microchip.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>
Subject: Re: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Topic: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Index: AQHX1LJ2yk8h5UAHwUis11m3Urxauav66E+AgAHqiICAAAqfAIAH5zOA
Date:   Mon, 15 Nov 2021 15:39:11 +0000
Message-ID: <e91ebf36-5a8b-9d9f-d4f0-aa9e38e7a41f@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com>
 <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
 <0e379411-2469-8c78-1a3f-0645579a967c@microchip.com>
 <CAMuHMdULO5gJcbnsDzZcVShmYkByyM30f9nYyDD8e4PJ6nrnCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdULO5gJcbnsDzZcVShmYkByyM30f9nYyDD8e4PJ6nrnCQ@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2dd43283-f701-44e8-482a-08d9a84e11fc
x-ms-traffictypediagnostic: MWHPR11MB1472:
x-microsoft-antispam-prvs: <MWHPR11MB14720AE7B41236B60FB26C1D98989@MWHPR11MB1472.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pdz7xDJLAS9u1C1ra/u8gOgh1f2T8hYBUvgp75CKh/zie2X1kgmWYK5WCNAlePWdZAoerO8guFDIQg41vQ1pnJc+EHIfwQGSDTGfs+gChdN9IwwmI2HnKLzvd6ERf/5DpcScBRztaGXYhQsf3ewNbMhLRaXWXmrmcgzlie1VRRd+r1VE/Ugkk7QcgCS8bt7iG2gDiWqCaQDI4VmpqS6MMSVlj3o0NwC64A+YpbBpd/kIFVjdD6sBPsPcW3y8t4CCzYeL9oRr/SsREgeLm0k4cHTxNecOG+8/qz3Idv9FESu4NHV+oBpiF7lTPDvU2b6vzCwFVCkNsr/6J1wLbUccZZkxiLCrJ8/EUcc5yfHEZGyZI0urWtbQixkRSjNPKCQcsVRwYHKMGd40GPOCnWgKod7NxYgSCpsazLXLyM/wJ6Klgv80K6tEVsw1SLRasD4JdrjDJ3KuQ6/vHj4Uoo5GQpdWV6cCX7oN8jZkzgVhxWZvWli1wyixAGTIr0gMJR72mLHmrgkUiCtAgMB8M8jnytB0IJLyDuQsm8LiriKmi+7Ptz5k7bQ4uuk7LqJ3SvWN/NPSUJljhlRl74MNTZ4wYD6k57Rb7XO6rTPE/NcihRGZrkUXS8BpVSpq2sUvY4AQPChLGg2CWGnwnjkdyJOz14HvnXNQVoOWBlDwQlrDfNEBcMlqM+oxPxTx5uFNAwmebPWyXBUR6AT25TBOeoAI9dsVJqZNpcMbATIQG7FwodhqrdKU47lrKkWBoY3IyIBy5If8sa3fpGa+0GLxos78ew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(6916009)(6506007)(2906002)(31686004)(316002)(8936002)(36756003)(71200400001)(54906003)(4326008)(26005)(66946007)(86362001)(66476007)(66556008)(66446008)(186003)(64756008)(6486002)(508600001)(7416002)(2616005)(6512007)(31696002)(91956017)(76116006)(122000001)(38100700002)(38070700005)(53546011)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmFhUnpuREVEZHgwRTdSaG9McEFueFpybStTMVppNGRjRlNsQVQwa0lWbmpY?=
 =?utf-8?B?TEoxWk4wUHE0ZnZwa1VIV3VZOEM1bk85Q0hySmhVY3hYT0RtRjhRcmw5V1lC?=
 =?utf-8?B?Yld0UE9FL0J1dlBMdGVWMFdCWmdGTGE3dlAyVGVtY2ZoczBhM0U0M1dJK2dn?=
 =?utf-8?B?MFBPWmMvZ1FVSkVVY0xSdGczdHRBRTZLMXNLdEJFb20wUGFTaEJWa1ZIZS9Y?=
 =?utf-8?B?NnlmeXdZNkVWWUJKNCtvQklJbW9RdmdTU0Q3L1hEQzFtdWRja0o5T0h5MFFY?=
 =?utf-8?B?c05rdGVlOTFVU25CN1YwN0hmMExBN3JNMFArblNROUxpN0VlaDBlTmYrczFq?=
 =?utf-8?B?bm9mN3BMVzgrbkZQdHRNOU5HZVNRcWNGeWkxakk4Y01NTUw5RXhSTWU2ZExV?=
 =?utf-8?B?QW1mbnduVUhUV0dsK1ZHZU9WTjRwUzNaaFJLdmtOTVZrMXVzWVN6UDJvWHNv?=
 =?utf-8?B?aXpFNzIxSThWeFYxak4xQ3g0ZzE5cmtNck1Za1lZc0dpMjNLSnVzcndHN0Fa?=
 =?utf-8?B?Tm5oTi9hQ0wrUnZPVXVHdVgwZERMK00vcFp4Umo3eHRKZEk4NStncnVnZ0Nn?=
 =?utf-8?B?UHBjNXMxNWRZSWF0bjVoVnFlQlI1K2E3a0RWcjk4Vjl0ODVXU21sWkpxZC9N?=
 =?utf-8?B?TU5pblhGalRCQThxZGJuNldpelRycHA0WHFoaTFiY1NFaXN2WUNkMGlvM3FR?=
 =?utf-8?B?TmtJWEF3bnJYNzhFZk1vL091eFpUWEZnYnJOMkppNjZFeHJmK20zQ2ZTR3lY?=
 =?utf-8?B?MWIwMk1YdVMxMTc2OVlLelJyV2FvSGxmOGVmMWM2Z3J6NnM4UEs3REEyOW1P?=
 =?utf-8?B?c2NXTTlIcmczbVI4T2V0bzAvZlZpSXlhZ0NNVzcwdVBtL25VQUg5NE9qdWZk?=
 =?utf-8?B?K1h3SUtzVndBQ3hVR3EyR0V0ekVKZ0lPRlVxSVcrVHBDdU9KMHlxY3FvUkhz?=
 =?utf-8?B?YU1LSk5uanBIb1loMWFFY08wdTk2aTV5ZHQxckcrQSs1UTlVQTVKVDl2ZXdO?=
 =?utf-8?B?WFNiMjc2MG81b2IzZjVFN0JIMmk4d05wbmxjdGtYbU1XcnhkSGUyd09QTllY?=
 =?utf-8?B?UlNhMEh2SkovRVUwTUh1cXFFaGV3RCt4RS83akx2YlBzbVRXZWt0c3BrQy9o?=
 =?utf-8?B?V0ZpVWRrakIrOEJ1azVYRERrbXFET1dXNjJVdWtTbWhNckNmU3ZhcWdwNTdp?=
 =?utf-8?B?djltdXBpdCtUeUhOWDFGVTUvOVJneGVocmdIRnBYc0I1dXdoN2xpVDlZWGVC?=
 =?utf-8?B?UVplank1eE1wSFl0Q0VRTUh6YWpIaFQwRlhVUTlROCsySWJpak1aT0E5c1RG?=
 =?utf-8?B?R2JrMjMrWndHZ2paVlU1VzJhcjRIVm1OcDVCbi9RUkZ2ZkVIaXRpTk9RS1NC?=
 =?utf-8?B?QXQrZk0zKzU3enN6MUVYcUtUdURnUzhDNzlTSXR4eXd4SFNycDFldkNidWZZ?=
 =?utf-8?B?OERCaE1DTCtublNma0gyRlJUY0pVUUFnLzR2SlA0bzZMVnJQSXI0My85UC81?=
 =?utf-8?B?eVRQdHZTNFN4WTRmbnRBOW11YzVqNnBFNWF5QkZCMmxsUjk5SDIzTEZyZk1p?=
 =?utf-8?B?OUVYTlJVdGJDZVU5NU9TcDA5M2VpN2ZVSjJSOFJZck9tS1E5Ui83SHB0ejFV?=
 =?utf-8?B?aEFMRVNmWSt3d2M4VHhTTFIrM0drVEU3L0lNVXdPMXBWYmIzSW5CVU5NQXlD?=
 =?utf-8?B?SG02TkYzOGtpalhtNmhrVUxuQ3N4dVZEK3MvUWtJditnSjlMdytUa1FXTnNw?=
 =?utf-8?B?OXVDU2V5OWplT3U1N0wza0FJSFJuakFHSzVQODlrSmZLQk5YY2ZWZUlPS29o?=
 =?utf-8?B?aXFtaGdVNi9VUS94N1p5dXFSVnBURDVDQzg4MFNnbThWbmF3N01vMDdjNi85?=
 =?utf-8?B?bmFzK1pET1d6SitYRW1kdDNlczBmQWFRK1FnV25jTkZzdG8wMmRtMWlzK01Z?=
 =?utf-8?B?QTFpN0VURlpFYVZ1QXVIV0JJWTdwM0dWSFhEYUNEck5rSVBWWlkrVkNDeWhL?=
 =?utf-8?B?MDJMN2J2SG1DWDdpdzBCbFVkOHd2WVdYZDhpLzdlQlkzSTRzcWNCU0Z0V3RN?=
 =?utf-8?B?SDBBOUNQWG8xeUdHS2xOQTF5eG1TYTliZGc1SmdUV2JUL0pvbS8xYnNJS2ZU?=
 =?utf-8?B?MW1nOE9udENETGN4SG42aVJ2RnFTR1ROUkxVcjQxTEdRck93U3ZTN3AvNXg0?=
 =?utf-8?B?b3pHalN0RnNDN2JWdWtqeTkxdUFoaEpaellhK2F2TU9LSGtCVSs4TlZiemJK?=
 =?utf-8?B?VEpNM3pPenFVM0RuTHZGNWtDOWJnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7FA8787CD30744DA4BA9B1D6E424887@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd43283-f701-44e8-482a-08d9a84e11fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 15:39:11.0814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qd4YoKxIBlEVYiWDdCr1Q0YPT88UIx1A8VtgIfRSxtBRwzmr2ZYKYgmI012uJbMb2bU8DQNlsnAH9dxSLduA1Jz2tsvDJKMno1yztKBGc9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1472
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTAvMTEvMjAyMSAxNDo1OCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIENvbm9yLA0KPiANCj4gT24gV2Vk
LCBOb3YgMTAsIDIwMjEgYXQgMzoyMCBQTSA8Q29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20+IHdy
b3RlOg0KPj4gT24gMDkvMTEvMjAyMSAwOTowNCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0K
Pj4+IE9uIE1vbiwgTm92IDgsIDIwMjEgYXQgNDowNyBQTSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+IHdyb3RlOg0KPj4+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPg0KPj4+Pg0KPj4+PiArJmdwaW8yIHsNCj4+Pj4gKyAgICAgICBpbnRlcnJ1cHRz
ID0gPFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNf
SU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8y
X05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJF
Q1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4g
KyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAg
ICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBM
SUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQ
SU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9E
SVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+
Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAg
ICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAg
IFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5U
X0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05P
Tl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QN
Cj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAg
ICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAg
ICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNf
SU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8y
X05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJF
Q1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4g
KyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAg
ICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBM
SUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQ
SU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9E
SVJFQ1QNCj4+Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+
Pj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+Pj4gKyAgICAg
ICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1Q+Ow0KPj4+DQo+Pj4gV2h5IG92ZXJy
aWRlIGludGVycnVwdHMgaW4gdGhlIGJvYXJkIC5kdHMgZmlsZT8NCj4+PiBEb2Vzbid0IHRoaXMg
YmVsb25nIGluIHRoZSBTb0MgLmR0c2kgZmlsZT8NCj4+IFRoZSBpbnRlcnJ1cHQgc2V0dXAgZm9y
IHRoZSBncGlvIGlzbnQgZml4ZWQsIHRoZXJlIGlzIGFuIG9wdGlvbiB0bw0KPj4gZWl0aGVyIGNv
bm5lY3QgdGhlIGluZGl2aWR1YWwgZ3BpbyBpbnRlcnJ1cHRzIHRvIHRoZSBwbGljICpvciogdGhl
eSBjYW4NCj4+IGJlIGNvbm5lY3RlZCB0byBhIHBlciBncGlvIGNvbnRyb2xsZXIgY29tbW9uIGlu
dGVycnVwdCwgYW5kIGl0IGlzIHVwIHRvDQo+PiB0aGUgZHJpdmVyIHRvIHJlYWQgYSByZWdpc3Rl
ciB0byBkZXRlcm1pbmUgd2hpY2ggaW50ZXJydXB0IHRyaWdnZXJlZCB0aGUNCj4+IGNvbW1vbi9O
T05fRElSRUNUIGludGVycnVwdC4gVGhpcyBkZWNpc2lvbiBpcyBtYWRlIGJ5IGEgd3JpdGUgdG8g
YQ0KPj4gc3lzdGVtIHJlZ2lzdGVyIGluIGFwcGxpY2F0aW9uIGNvZGUsIHdoaWNoIHRvIHVzIGRp
ZG4ndCBzZWVtIGxpa2UgaXQNCj4+IGJlbG9uZ2VkIGluIHRoZSBzb2MgLmR0c2kuDQo+IA0KPiBT
byBpdCBpcyBzb2Z0d2FyZSBwb2xpY3k/IFRoZW4gaXQgZG9lc24ndCBiZWxvbmcgaW4gdGhlIGJv
YXJkIERUUyBlaXRoZXIuDQpUaGUgd3JpdGUgKGlmIHdhcyB0byBiZSBkb25lKSB3b3VsZCBiZSBk
b25lIGJ5IHRoZSBib290bG9hZGVyLCBiYXNlZCBvbiANCnRoZSBiaXRzdHJlYW0gd3JpdHRlbiB0
byB0aGUgRlBHQSwgYmVmb3JlIGV2ZW4gdS1ib290IGlzIHN0YXJ0ZWQuIEJ5IA0KYXBwbGljYXRp
b24gSSBtZWFudCB0aGUgYm9vdGxvYWRlciAob3Igc29tZSBvdGhlciBiYXJlIG1ldGFsIA0KYXBw
bGljYXRpb24pLCBub3QgYSBwcm9ncmFtIHJ1bm5pbmcgaW4gdXNlcnNwYWNlIGluIGNhc2UgdGhh
dCdzIHdoYXQgeW91IA0KaW50ZXJwcmV0ZWQuIEFtIEkgaW5jb3JyZWN0IGluIHRoaW5raW5nIHRo
YXQgaWYgaXQgaXMgc2V0IHVwIGJ5IHRoZSANCmJvb3Rsb2FkZXIgdGhhdCBMaW51eCBjYW4gdGFr
ZSBpdCBmb3IgZ3JhbnRlZD8NCj4gDQo+PiBVc2luZyB0aGUgY29tbW9uIGludGVycnVwdCBmb3Ig
R1BJTzIgaXMgdGhlIGRlZmF1bHQgb24gdGhlDQo+PiBwb2xhcmZpcmUtc29jLCB0aGVyZSBhcmUg
b25seSAzOCBwZXIgZ3BpbyBsaW5lIGludGVycnVwdHMgYXZhaWxhYmxlIG9mDQo+PiB3aGljaCAx
NCBhcmUgY29ubmVjdGVkIHRvIGdwaW8wIGFuZCAyNCB0byBncGlvMS4NCj4gDQo+IA0KPiBFeGFj
dGx5Lg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxv
dHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IElu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0KPiANCg0K
