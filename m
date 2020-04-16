Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 740921ABFD2
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 13:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505689AbgDPLlJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 07:41:09 -0400
Received: from mail-vi1eur05on2052.outbound.protection.outlook.com ([40.107.21.52]:6216
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2505750AbgDPK6V (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Apr 2020 06:58:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnEwid3Qog2oTAQsJXjysCWv8qWbuzIFp+JlgvLZB+GWhsbtIZJj7BTVqKa3tGWJ6tbQ8XbZq6nvg9L7sH9kM/AvvcoYewZCRquFp8wH+nMtWITtN1DhaPwjW/5BoNyw4fnM7XgJMPAcYffgib1ChpAXF+v+YXW1Sl6KzIlOFBkGlfhxLXIvW3/B4XG7OXk3LLt7eIVAYn0pczN5+EBuRMx+1J70ZXzWQ1M6Ign/sYLOby9sxlOrZuGACDztWSbYmNK0Zs6wtzTlfqPm03DvIweqmYwTRPh0iLb9AHqBUV/9OWK0kdbPxiau79Ci8Me8FFP2jZpcpKW2FDQ/LCx4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UCHZxiywBcI2vc+aPSE1LvwxbfguLXQQwVJmGbFubA=;
 b=abTJ8ErtxgE5BfEEJuiG9HRXgejeBfWOwPDk9YjYqpnQMiNRkFuhbsQ9kdFz6zba2Yxv89NIuj2Qb0iBIWd9wxlx9KgtzZgZCxXSOOjx0xMEBRUNvBxgOmxXCdNBNckNkFY0cetfNwNoyR8NqxJ4GB1ZmcJO9LcIoVWMxLMxHf7jWUtsk2w8twDABxD1Man6DIy5nACH4m9MWwbxfY4HMAjQ//pI4JTGn19HU5QCJ6yVsw6Em49invziXYow+7+pvPcfv0l6kYiirzJlXqSOIoq9zUvOh4xKRmGwocSqSlPFidocD1yaMAHkEPlgH/dhJTYUWcwD5R+QC8KwCyNdmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UCHZxiywBcI2vc+aPSE1LvwxbfguLXQQwVJmGbFubA=;
 b=Kr+C2UvVHp9V/V+zr2eWwMIo88hnE4+KhefDS3T9MhOFnX7FWu59ASGX0vkH+QJuI4mO4oegInKBt1UKJSLCdy2fBpv9vVknoQr1Eh+QRUpk6EbXXGG2qX8ZOpwjl9ZV82iZdz0O/bpsggGRyploc8A8MHHLus3nWFHjH+Qzejc=
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
 by AM0PR06MB4145.eurprd06.prod.outlook.com (2603:10a6:208:71::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Thu, 16 Apr
 2020 10:42:02 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3c0c:c6e8:c7b6:cabd]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3c0c:c6e8:c7b6:cabd%5]) with mapi id 15.20.2900.028; Thu, 16 Apr 2020
 10:42:02 +0000
From:   Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
CC:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Topic: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Index: AQHV5mNyTIn2+pYf+Eu7yiopaV9KGKhOcmGAgAAnv5CAATwtgIAAAa2ggCwKeCA=
Date:   Thu, 16 Apr 2020 10:42:02 +0000
Message-ID: <AM0PR06MB51859B579FED9A4CA9761C79D4D80@AM0PR06MB5185.eurprd06.prod.outlook.com>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <CAKfKVtFf+VpinkOGsBFZ2-_PKvx-C1L7G7_uhY2RCvV5dy6L_w@mail.gmail.com>
 <AM0PR06MB5185E501349E06428093B62FD4F70@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <CAKfKVtGSq5rJ0EvZgyg1Rw3=d5Q4ReJUYM7hTSTPP4sXaJyJTw@mail.gmail.com>
 <AM0PR06MB51854C1BD04607231214750ED4F40@AM0PR06MB5185.eurprd06.prod.outlook.com>
In-Reply-To: <AM0PR06MB51854C1BD04607231214750ED4F40@AM0PR06MB5185.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Enabled=True;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SetDate=2020-03-19T10:25:58.2071358Z;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Name=Restricted;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_ActionId=0a9cfefb-3854-4650-a383-5328eaf57882;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Extended_MSFT_Method=Automatic;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Enabled=True;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SetDate=2020-03-19T10:25:58.2080956Z;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Name=No Label;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_ActionId=0a9cfefb-3854-4650-a383-5328eaf57882;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Parent=d5842b46-9b7a-431a-b662-8cc44ff92a4e;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ext-jaakko.laine@vaisala.com; 
x-originating-ip: [2001:14ba:21e9:fc00:a497:c71c:e5a:cb27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3e0ee4f-ec5a-4351-a4be-08d7e1f2cc46
x-ms-traffictypediagnostic: AM0PR06MB4145:
x-microsoft-antispam-prvs: <AM0PR06MB4145F6F0DD0CBF5AB9E71470D4D80@AM0PR06MB4145.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB5185.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(136003)(346002)(396003)(39850400004)(86362001)(5660300002)(6506007)(52536014)(186003)(4326008)(54906003)(316002)(9686003)(7696005)(55016002)(64756008)(8676002)(66946007)(478600001)(66476007)(33656002)(71200400001)(2906002)(8936002)(81156014)(66446008)(6916009)(66556008)(76116006);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FOMfdd08/12EwimCHrNzlBUrJ9IzJgC60+V+DkurI0KdyqmD1VkAT9qcZ/W0BuhN0pyBo7ynOU+xlCDwkmPwtp4fjdu+L7yoJehyAnvKyIdxp+eHad5akHb08mA+n4czJ0gV4tlfZT7U/XNSo52QZvdMte/24Q8VoQjuKoL6LL0OnQAZadIihRY1GEZTJxa21vnmmSwN4LV8h11bf/XGs5CCg2kqFoe1ZdQUbfvcx/jffBXNmJRIeGweqAAjB6kptJnc7RSlm8R6pL3nqcSxNAj9A3Tz2XlvArv7h0XEhmjMqD8q6XcBfy95ICgH6cD4lxI3HMf/PR11i/qcrbJV5+WzSqSVcnuYVlmv+D6AAohe/omE5/MDcy6GOkKULyYFv0xXEDLSSh5ixHCh0veqyt/t38nRPzHwrAKrrsyNbS9jXsPWZmddQmRJ39AZEuOI
x-ms-exchange-antispam-messagedata: J2DB8Pn1bj56sBFeevmZDu+xG9dfrFtf8BhJVCVbFazTj3mz7WKtNm3rDYBxsWxGauQnSvMeAouc0GROCsmpFzF6wxG5Ccv9vEQIQGN4B1hZ9sxqTvAwjFK1tVj3GIo3a8/mmwM1jw3QK04M5RClB7N0HRpd9L2tN6JSHiqcjs/lw/dLSbpNJh1k4C/EFau2iCLfZnGrAO/x12Zn7bSTbQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e0ee4f-ec5a-4351-a4be-08d7e1f2cc46
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 10:42:02.0592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYRJPpObfmpuOSSiBPhejoqzvkp3Tusm+IvMJPte5qMhI/A/b/ZXmCxPqanBNiTuhGgfUQFqUYpMFxSmvbYBqyrv0no2010rF5KlkjLOaU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB4145
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+ID4gPg0KPiA+ID4gPnRoZSBvdGhlciB0aGluZyBpIHdhcyB0aGlua2luZyBob3cgd2lsbCBt
dWx0aXRocmVhZGluZyAuDQo+ID4gPiA+U2hvdWxkIHdlIGhhdmUgYSBsb2NrIGhlcmUuDQo+ID4g
PiA+DQo+ID4gPiA+PiAtICAgICAgIGVyciA9IHhpaWNfYnVzX2J1c3koaTJjKTsNCj4gPiA+ID4+
IC0gICAgICAgd2hpbGUgKGVyciAmJiB0cmllcy0tKSB7DQo+ID4gPiA+PiAtICAgICAgICAgICAg
ICAgbXNsZWVwKDEpOw0KPiA+ID4gPj4gKyAgICAgICBpZiAoaTJjLT5tdWx0aW1hc3Rlcikgew0K
PiA+ID4gPj4gKyAgICAgICAgICAgICAgIC8qIGZvciBpbnN0YW5jZSBpZiBwcmV2aW91cyB0cmFu
c2ZlciB3YXMgdGVybWluYXRlZCBkdWUgdG8gVFgNCj4gPiA+ID4+ICsgICAgICAgICAgICAgICAg
KiBlcnJvciBpdCBtaWdodCBiZSB0aGF0IHRoZSBidXMgaXMgb24gaXQncyB3YXkgdG8gYmVjb21l
DQo+ID4gPiA+PiArICAgICAgICAgICAgICAgICogYXZhaWxhYmxlIGdpdmUgaXQgYXQgbW9zdCAz
IG1zIHRvIHdha2UNCj4gPiA+ID4+ICsgICAgICAgICAgICAgICAgKi8NCj4gPiA+ID4+ICAgICAg
ICAgICAgICAgICBlcnIgPSB4aWljX2J1c19idXN5KGkyYyk7DQo+ID4gPiA+PiArICAgICAgICAg
ICAgICAgd2hpbGUgKGVyciAmJiB0cmllcy0tKSB7DQo+ID4gPiA+PiArICAgICAgICAgICAgICAg
ICAgICAgICBtc2xlZXAoMSk7DQo+ID4gPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBlcnIg
PSB4aWljX2J1c19idXN5KGkyYyk7DQo+ID4gPiA+PiArICAgICAgICAgICAgICAgfQ0KPiA+ID4g
Pj4gICAgICAgICB9DQo+ID4gPiA+Pg0KPiA+ID4gPj4gICAgICAgICByZXR1cm4gZXJyOw0KPiA+
ID4NCj4gPiA+IFdoaWNoIHJlc291cmNlIHNwZWNpZmljYWxseSBhcmUgeW91IHdvcnJpZWQgYWJv
dXQgbmVlZGluZyBsb2NraW5nIGhlcmU/DQo+ID4gPg0KPiA+IEVhcmxpZXIgbXVsdGlwbGUgdGhy
ZWFkcyBvbiB0aGUgc2FtZSBwcm9jZXNzb3Igd2lsbCB3YWl0IGZvciBidXMgYnVzeS4NCj4gPg0K
PiA+IE5vdyBteSBjb25jZXJuIHdhcw0KPiA+DQo+ID4gdGhyZWFkMSAtPiBtYWtlcyBhIHRyYW5z
YWN0aW9uDQo+ID4NCj4gPiB0aHJlYWQyICAtPiB0aGlzIHdpbGwgbm90IHdhaXQgZm9yIGJ1cyBi
dXN5IGFuZCBhY2Nlc3MuDQoNCj4gU2luY2UgaTJjLT50eF9tc2cgaXMgc2V0IGJlZm9yZSBhbnl0
aGluZyBpcyBzZW50IHRvIEZQR0EgYW5kIG9ubHkgcmV0dXJuZWQgdG8gTlVMTCBhZnRlciB0cmFu
c2FjdGlvbiBoYXMgZmluaXNoZWQsDQo+IEkgdGhpbmsgdGhyZWFkMiB3b3VsZCBhbHJlYWR5IGV4
aXQgd2l0aCAtRUJVU1kgYmVmb3JlIHhpaWNfYnVzX2J1c3koaTJjKSBpcyBjYWxsZWQgYmVjYXVz
ZSBvZmY6DQo+IGlmIChpMmMtPnR4X21zZykNCj4JcmV0dXJuIC1FQlVTWTsNCj4gaW4gc2FtZSBm
dW5jdGlvbi4NCj4NCj4gVGhpcyBpcyB3aHkgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHhpaWNf
YnVzX2J1c3koaTJjKSBvbmx5IHByYWN0aWNhbGx5IGd1YXJkcyBhZ2FpbnN0IG90aGVyIG1hc3Rl
cnMgb3BlcmF0aW5nIG9uIGJ1cy4NCj4gSW4gbXkgdW5kZXJzdGFuZGluZyB4aWljX2J1c19idXN5
KGkyYykgcmVhZHMgdGhlIHJlZ2lzdGVyIG9uIEZQR0EsIHdoaWNoIGNhbid0IGNoYW5nZSBzdGF0
ZSBiZWZvcmUgdGhyZWFkMSBpcyBhbHJlYWR5IHNvIGZhciBpbnRvIHRyYW5zbWl0dGluZyBpdHMg
ZGF0YSB0aGF0IEZQR0EgaGFzIHJlY2VpdmVkIHNvbWV0aGluZyB0byBzZW5kIGFuZCA+IGhhcyBy
ZXNlcnZlZCB0aGUgYnVzLiBUaGlzIHdvdWxkIGxlYXZlIGFuIGludGVydmFsIG9mIHRpbWUgYmV0
d2VlbiBjaGVja2luZyB4aWljX2J1c19idXN5IGFuZCBpdHMgcmVnaXN0ZXIgdmFsdWUgY2hhbmdp
bmcgZHVyaW5nIHdoaWNoIHRocmVhZDIgY291bGQgYWxzbyBjaGVjayB4aWljX2J1c19idXN5IGFu
ZCBwcm9jZWVkIHRvIHRyYW5zbWl0IGF0IHRoZSBzYW1lIHRpbWUgd2l0aCB0aHJlYWQxLiAoVW50
aWwgaGl0dGluZyBhIHRyYW5zYWN0aW9uIGxvY2sgbGF0ZXIsIGJ1dCBvbmx5IGFmdGVyIGl0IGhh
cyBhbHJlYWR5IG92ZXJ3cml0dGVuIHRoZSBwb2ludGVyIHRvIHRyYW5zbWl0IGJ1ZmZlciBpMmMt
PnR4X21zZywgYW5kIHBvc3NpYmx5IG1lc3NlZCB1cCB0aGUgdHJhbnNtaXNzaW9ucyBmb3IgdGhy
ZWFkMSkuDQo+DQo+IE5vdyBpdCBzZWVtcyB0byBtZSB0aGF0IGV2ZW4gd2l0aCBpMmMtPnR4X21z
ZyBiZWluZyBjaGVja2VkLCB0aHJlYWQyIGNvdWxkIGdldCBwYXN0IGl0IGJlZm9yZSB0aHJlYWQx
IGhhcyBzZXQgaXQgdG8gbm90IE5VTEwsIHNpbmNlIHRocmVhZCBwZXJmb3JtcyBubyBsb2NraW5n
IGJldHdlZW4gY2hlY2tpbmcgaXQgYW5kIHNldHRpbmcgaXQsIGxpa2UgSSBtZW50aW9uZWQgaW4g
cHJldmlvdXMgcmVwbHkuIFRoaXMgaXNzdWUgaGFzIGFwcGFyZW50bHkgYWxyZWFkeSBleGlzdGVk
IGZvciBzb21lIHRpbWUgdGhvdWdoIGFuZCBpcyBwcm9iYWJseSBxdWl0ZSB1bmxpa2VseSwgc2lu
Y2UgaXQgaGFzIGJlZW4gdGhlcmUgZm9yIHNvbWUgdGltZS4NCg0KPiAtSmFha2tvDQoNCkp1c3Qg
dG8gdXBkYXRlIHlvdSBhYm91dCB0aGUgcHJldmlvdXNseSBtZW50aW9uZWQgcG9zc2libGUgbXVs
dGl0aHJlYWRpbmcgaXNzdWUsIEkgdG9vayBzb21lIHRpbWUgdG8gdHJ5IGFuZCBmb3JjZSB0aGUg
cmFjZSBjb25kaXRpb24gdG8gaGFwcGVuIGJ5IGFkZGluZyBzb21lIGRlbGF5IGJldHdlZW4gY2hl
Y2tpbmcgYW5kIHNldHRpbmcgImkyYy0+dHhfbXNnIi4NCkkgd2FzIHBsYW5uaW5nIHRvIGZpeCBp
dCBpbiBzZXBhcmF0ZSBwYXRjaCBzaW5jZSB0aGUgcG9zc2libGUgaXNzdWUgd291bGQgaGF2ZSBl
eGlzdGVkIGFscmVhZHkuDQpJIGRpc2NvdmVyZWQgdGhhdCBJIGFtIHVuYWJsZSB0byByZXByb2R1
Y2UgdGhlIHRocmVhZGluZyBpc3N1ZSwgc2luY2UgdGhlIGJ1cyBpcyBhbHJlYWR5IHByb3RlY3Rl
ZCBieSBhIG11dGV4IGluICJpMmNfdHJhbnNmZXIoKSIgaW1wbGVtZW50ZWQgaW4gImkyYy1jb3Jl
LWJhc2UuYyIuDQpJIHN1cHBvc2UgdGhpcyBtYXkgaGF2ZSBiZWVuIG9idmlvdXMgZm9yIHNvbWVv
bmUgd2hvIGhhcyB3b3JrZWQgbG9uZ2VyIHRoYW4gbWUgd2l0aCB0aGUga2VybmVsIGkyYyAtZHJp
dmVycywgYnV0IGl0IHNlZW1zIHRoYXQgdGhlIGRyaXZlciBpbXBsZW1lbnRhdGlvbnMgZG9uJ3Qg
aGF2ZSB0byB3b3JyeSBhYm91dCBhY2Nlc3MgZnJvbSBtdWx0aXBsZSB0aHJlYWRzLCBzaW5jZSB0
aGV5IGFyZSBhbHJlYWR5IHByb3RlY3RlZCBpbiBhIG1vcmUgZ2VuZXJhbCBsZXZlbC4NCg0KLUph
YWtrbw0K
