Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9024950E175
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Apr 2022 15:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241937AbiDYNX7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Apr 2022 09:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbiDYNX5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Apr 2022 09:23:57 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5077124951;
        Mon, 25 Apr 2022 06:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkMDWFyF7nMLNVXrACrGVIUKcR29X7XaAvvhH4B3itqLykPq+XHr+rulSv2XhA86l7Yf8p1UAvRn1pwxf/3xDZaKO/l7dLRDSi8j7a8pJqMtShFdUhHcMtJdeV9UgSK9xxYI1WKS2flRsoo+MJeXGvHwtZQ5qWkAgcz5xlSpgUfJQ4ThWw8pYMNWFvLBudZ6Cy31FLUGly77xUhjAGU8SYQD53XNT7HBUluq93svCnlV1AfTHyJqAcqkdhPzq3iWDhYTxwQ24Pr2XFDsojZXyTkXztDZGsfVZbz7a3oAbZMp/eo1Qcnvwqs0T30qq7mk2mwW2T7LPratnAOFQSpGyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4c77O2LJOCcfMeB0f/BaWGE4BZo9NUko4dv+pVjopmQ=;
 b=lu+19xbw12oWB+9OPIutKUxCE3mJM/4QNiYpK3F4+tkuXpCZyGTWQ06Prh7cAPbeCB0pErOag+Ec5iH024Su3XI3iXZ17DtG9NV5q+DLuMNXDg4+iik1YjRcH+dU6Q69yYWr+ogbLolvHDQ3Epjz2tKXc5eRIE8dIkSlGg0Z/VMOVuNVMrjZP2WcAR4CJvYNnR2mPjLbzS6gjloToyPxIWN+6nIejsVFZ6QOv9hjjun3ehj1ok+AevSH3fU+kHewTSii9CAnI0xYCzfPosjGmIyUury/VO9w1iSdhwcNJYUAJPLvsmBhBnfbrFz5fzdFmxv36rPSoPOfRQiES5vRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4c77O2LJOCcfMeB0f/BaWGE4BZo9NUko4dv+pVjopmQ=;
 b=ispxs0veDxugoW2g6fEtG5+RTyTVhwq5xSHCdpHVBuG5ORbc+2WoiNYAeTh46ZO429anG0tIFtzrA0FklVaVUQtoGNLyb8+K7AFkwJ7uCYVwJJ8Cq7WmjhlJI9TTl6YP9OCRyhx82B3V53CQ1pGFJiWHkPM/5/socUipenjmatw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9784.jpnprd01.prod.outlook.com (2603:1096:604:1ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 13:20:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 13:20:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/G2UL SoC
Thread-Topic: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/G2UL SoC
Thread-Index: AQHYVxTzT2WyYzdLek2aV246e8uxKq0Ams0AgAAFYBA=
Date:   Mon, 25 Apr 2022 13:20:49 +0000
Message-ID: <OS0PR01MB5922618CAE5E499E3CC6207786F89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423132043.139672-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVu9ha7TYEDpZXjDBWDroEukzA0GwDhkOuohH7godG8dg@mail.gmail.com>
In-Reply-To: <CAMuHMdVu9ha7TYEDpZXjDBWDroEukzA0GwDhkOuohH7godG8dg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fe1c9e5-d0df-4ced-d7bd-08da26be6a56
x-ms-traffictypediagnostic: OS3PR01MB9784:EE_
x-microsoft-antispam-prvs: <OS3PR01MB978456FAD28F68AA0194F2D686F89@OS3PR01MB9784.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yxpf56i3NJXqLvVYOufKhVLd2aEmG6XQMYC60rb0ze/qfoHjEzUe55aaqnUqmybDckhLEH9W/hbk0EI8CVhIxCrjR6MfgGjy5N0KZ1MIpWFCif6kjthrUhKBsavT4NSErx7rSOz/ekrQCBDKa99Jtkyw8a1tIGaArjcCGJyBkMsJoh88fAmX/OiwRULZElDOQAvnJ2cPY85yIKn0hyNdwc83HZetggfzcScyE/0uWvSMqQtNoybb75me2mzOE0HQk+EVmNXRuR27E2vw5pYOdhH6V9I+TlKfOU5H5c9dW4Mn+ZssBzBXNKYF4jQxGgsqJ6BCBU2AHoyRK+zJ1dInrg4sP9Fx9DPsvmQQr4hhNvhwkSEeFApnKTuiSZWpmaiS9q7sAB/XWwr1VZlrBFX1gMWKx0Sd73XBd/t3o+SsVi9L4yOjg+pqoOtnt/yKXlYJvI4AhN6pmBuCcAuWcw4YCfUXkHsvJgXI9n1NmieVRzpPeAx23iUGPJ0LkFiZAEbE4/Us34RUNB2uff8tM+Q5i04ku9G1rh560+eCFtkYDumWB0Bf6dBopk0ElNtLfH6WSwbNukU4dwkNJRfiZuuX6SHWAXDnlKad1PLT0uItwYk5+f2IxxzePp1AR3FuzXzw5yQLk3nqwHExWbQqIsWdjbC37tnr3J6VlERMQMeP96rOe+yVm0FbZJL87QRpep9lFTrUdeuQyoKvfqeqMhhtaw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(54906003)(8936002)(53546011)(55016003)(316002)(186003)(107886003)(71200400001)(4326008)(33656002)(52536014)(8676002)(64756008)(76116006)(66556008)(66476007)(66446008)(26005)(66946007)(122000001)(38100700002)(38070700005)(508600001)(2906002)(9686003)(5660300002)(6506007)(86362001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0ZzY0huRzNwUnQ4elVwQUdtcSs0L0dEUVVWbU9RYjAxM0I3UmExY1c5bWsv?=
 =?utf-8?B?dVkyaHBpckNCYlh5RFdXNmE2WFhGbzVUWUwzZStCRFgwaVFrZnhMSzhGSlM3?=
 =?utf-8?B?RTlFVjhOVGw3dHlRT0ZxWSt5aW5zOVhyazltcmhITisyZmcvQzFPVHAzc3FW?=
 =?utf-8?B?Z1U0TlNZUSttd20rdHpPRzYveUxoeTBNMUJkN3F6NHFsU0NiNnN4eHhTK3VI?=
 =?utf-8?B?Z3FHRHhUdnRkVm15cm1oYWE2TStwNlVEVytlcFMxSWxRdk0zMXUyKzkvbUI4?=
 =?utf-8?B?VUhjM3lCVGhTVjlLb044SEFab3hleGxxZzZBS3UxTnVYaWpkeEExQnRSYUJo?=
 =?utf-8?B?Y2tnMEVSUm93bCtETDFNMldydzlBZUlrSi9kcHVscFRCbmFpL2xBQ1Q4akZm?=
 =?utf-8?B?MjBJa0pGM0RlTHdwa0FpVTB0T3RQNmp4RUdRSjAyMVgxd1BUbEZlajhZTGhL?=
 =?utf-8?B?WjI2ZHZ4MkprUzU5SFI2VzJ5Wk8xWG11YzBuaU1jRzhOTC9LbEl4RXMvV1lh?=
 =?utf-8?B?akIwaUU1ZUNxOEhaSnlyU3RzZ1lTWkpaM0c3QVNFZStzZjlmUzhiLzNXcm1O?=
 =?utf-8?B?ZVpFWDV0NzFOLzNudElqS3F6eVAvTTkzdW5CYU1mVWF1VnBvRlFsaWF1U090?=
 =?utf-8?B?ZVNWY2hocmZCTmVDVkgwTncyUmpvT3p2M050ZC8vemMwTEw1TEFiOFg1Kzk2?=
 =?utf-8?B?ZHVCZ2JaSzVOL3l4bUR0U3R5U2tabGVZbGxNMzdxWk1KSjZxYlRVK3AvOXox?=
 =?utf-8?B?Y3NpTDIyd0U0R0NJVzE3R2ZObVdOclVkL1JxMXJ1Y0FwYUhMYldncFZocFgz?=
 =?utf-8?B?cHUzaXJBNkZ5SkZOQllrMEhqbzNyTWEza1R3SmF6c0dHclQ1MXV3ZE42ay9S?=
 =?utf-8?B?Z3cyNkJ5YkdGb0pXcmdheHFrMndBVWdtdmpvWi9uM3NKQU9KTmc4TzRiYTAr?=
 =?utf-8?B?blptcktlSkZudmpyMmhNdnR1R24vbU02M1lxMHpGRjB5UEVZQ0V2eTRmTHVL?=
 =?utf-8?B?ZXFsYW5adkJIb0tZQ29MOTRIRnd6akFxUHp6alNUSUZZQkNZVE85KzFhTzIv?=
 =?utf-8?B?YitMNVMyS2xmdkNJaXAwNmtiR3NOUGY3S3pVYXQxYmRjWlQ4VHhabTQ3OWl6?=
 =?utf-8?B?bm4yM3NjSzVjbThFMnZOejFkUmRMZVFVR2ZrcVpoMmlDSTh4Mm0vTDFHcjVq?=
 =?utf-8?B?NXRZR29zMmNDWlJ3Nm4wZ3MweVhsS2Z1Vlg5ZEpRN05rUStXa3JtalNVWmJs?=
 =?utf-8?B?Vmo5RUpNbzBBQ3doSnBXZWFDYWJDUTBLMGRFdnEzM1ZsZVVJMXpUVDVHZWVX?=
 =?utf-8?B?cUg5Y05pbmpaejB1UkwvMlMxSkJxbzhqM0JSTFcweXRFK1VHcEdIb1BabDRz?=
 =?utf-8?B?WndrUC82N3ZUcHdCV2gwLzJWZzdGU2EyR2JBTkt4NDRxM0FOSU9JdTVwSU9l?=
 =?utf-8?B?UHVVMXlCRHE2eklqQjZRSWkvWklBM2Jqczc5blZYcm1XbGhTc29BQkIvVDNM?=
 =?utf-8?B?MEEwNUZ0Kzc5M3RkeVZvTndVUDA0ZlZQWVhLd2d5ZWZ4N09haVRDbkUyd3Y2?=
 =?utf-8?B?L3JJN2lYdENnNC9uNkdTNXNNVGpDNXBHeWYyay9IcmVVL21oUUw4QVpCcys0?=
 =?utf-8?B?UjVLUmhGdGdYWGNXVXUyelIwT05PSDZaREcyeUtIeVY1aXZ2NkwvT2lTM1Ja?=
 =?utf-8?B?bmtZbHFpSTRHUjhOU0VJNWVSaHY2dFZhQXBWSnpCZmJnRjVlOGdoVGtENEow?=
 =?utf-8?B?b1diZnJrcUtwa0ZqNkVUejVPQ3JOeE80dmR2aURPMS91MzVTWGtWbVNHckov?=
 =?utf-8?B?R3d5b3FuNk1lYjJmWHBvVTU2WnI0TDVJV1g4ZXB2YWVDWWFhUjlMejRBbmJG?=
 =?utf-8?B?SnJvT1Q1cEM4TjF5OEpHczFoelJNOFc0dFlvS2hOQzRmczNpaHVyWDJBSDB4?=
 =?utf-8?B?VlhuUmxKOTdnNy9UYXBpTUhRK21vVDVuU0VpSmJRdGtWa3MyU3ZGQmhzN3lp?=
 =?utf-8?B?akJ0bTlPSU9vNFVFeWJFejFDOWhHdGRxRFU3c0MxOVFxNS9GRTlWaHVzSHBK?=
 =?utf-8?B?RUFiUHY0cTJhSGI0TVZzQVhJTldlSDJMMnJ4Wk8xSEUyTXNtcW5SUS9vOGJ6?=
 =?utf-8?B?eHpYTnBvV0ZPUldoejhBTVNFQXRYYnk3OXRmZ0tQOUVGclFqN2ZjS09PQWdD?=
 =?utf-8?B?MWw3T3lILzk4ZnFCSDFNNzhOZGFyQTRuY3dXU3piS0VvOEFLZ3ZJNGUvVzlo?=
 =?utf-8?B?cDFMTUM3TEVCZUc4T3BJclcrbUttZCsyRmlsQXNMVXNJbXZPZlgrOG40OFZD?=
 =?utf-8?B?WFh0UGM4REJDTy9LcWV3REtHZU14di9udDBQYStyOXBxT2pmcEROUkpCM0la?=
 =?utf-8?Q?qkRBS1HcZw0cBhNg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe1c9e5-d0df-4ced-d7bd-08da26be6a56
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 13:20:49.5908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AsgpytUxOw7RzOT5FHYja7wdjgIST98/l8Zr7lhbIB5FK609bAiDjER7iAkoExmGTUh2eXRkEDTBpu7k0NUpm6zG+ckU0+XBUtOoAW0alr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9784
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGR0LWJpbmRpbmdzOiBpMmM6IHJlbmVzYXMscmlpYzogRG9jdW1lbnQgUlovRzJVTCBT
b0MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBTYXQsIEFwciAyMywgMjAyMiBhdCAzOjIwIFBN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gRG9j
dW1lbnQgUlovRzJVTCBJMkMgYmluZGluZ3MuIFJaL0cyVUwgSTJDIGlzIGlkZW50aWNhbCB0byBv
bmUgZm91bmQNCj4gPiBvbiB0aGUgUlovRzJMIFNvQy4gTm8gZHJpdmVyIGNoYW5nZXMgYXJlIHJl
cXVpcmVkIGFzIFJaL0cyTCBjb21wYXRpYmxlDQo+ID4gc3RyaW5nICJyZW5lc2FzLHJpaWMtcnoi
IHdpbGwgYmUgdXNlZCBhcyBhIGZhbGxiYWNrLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3Vy
IHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTJjL3JlbmVzYXMscmlpYy55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2kyYy9yZW5lc2FzLHJpaWMueWFtbA0KPiA+IEBAIC0xOSw2ICsxOSw3IEBAIHBy
b3BlcnRpZXM6DQo+ID4gICAgICAgIC0gZW51bToNCj4gPiAgICAgICAgICAgIC0gcmVuZXNhcyxy
aWljLXI3czcyMTAwICAgIyBSWi9BMUgNCj4gPiAgICAgICAgICAgIC0gcmVuZXNhcyxyaWljLXI3
czkyMTAgICAgIyBSWi9BMk0NCj4gPiArICAgICAgICAgIC0gcmVuZXNhcyxyaWljLXI5YTA3ZzA0
MyAgIyBSWi9HMlVMDQo+ID4gICAgICAgICAgICAtIHJlbmVzYXMscmlpYy1yOWEwN2cwNDQgICMg
UlovRzJ7TCxMQ30NCj4gPiAgICAgICAgICAgIC0gcmVuZXNhcyxyaWljLXI5YTA3ZzA1NCAgIyBS
Wi9WMkwNCj4gPiAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyaWljLXJ6ICAgICAgIyBSWi9BIG9y
IFJaL0cyTA0KPiANCj4gWW91IGZvcmdvdCB0byBtYWtlIHRoZSByZXNldHMgcHJvcGVydHkgcmVx
dWlyZWQgb24gUlovRzJVTC4NCg0KT29wcywgV2lsbCBmaXggaXQgaW4gVjIuDQoNCkNoZWVycywN
CkJpanUNCg0KPiANCj4gV2l0aCB0aGF0IGZpeGVzOg0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IEdye29ldGplLGVldGlu
Z31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25z
IHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcw0K
