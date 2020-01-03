Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0493012F90D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2020 15:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgACOJq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jan 2020 09:09:46 -0500
Received: from mail-eopbgr20117.outbound.protection.outlook.com ([40.107.2.117]:49125
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727523AbgACOJq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 Jan 2020 09:09:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDVNu0jAvGZtgqvtBMPHyssmUzt8teKYJVp9EogUGixCQrnudS/t+0+pyI7PfngXq5tUtlX9TCKxlbbJbIkrh1EnELJpxZ5YEEL3jzrjcbPoR3Lo1zqCMUZeYJIqk/MpdroiaBtUYWpJ+j6JEOboanttgFNYdkZScNmeeVS2mOYP2N0L6W6swTDfKDJ4oezy3kSKWts/+phMoTXxzSGLkc2Ob+DKtSiemIO30uW/iK/p6yZ4WbFU8LYFnWqaX4BwFZ6R05QkXIHx3BibOepG8eiEdVbcz7QoWhWRrt8TxeSIKYRgtL2m+SknL8xLPdS7V70LMr9DbQpEd2fxQby+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cShSEfCVVMryirvGQoXMoi9ICBV4ncbKW0T5GKBLZus=;
 b=dElmaKIiQvEGBUK+VDZRneQK+ccX/L9zZh5NvDWpfmSktdhMOoXLCANWt5LLi8MTls601n5ogvG3qA1LU/18sAR4KfTxjj7CmdUMU6aE9HmQeczsKmKS+gJkkW2vk7/Bii75tOdP94oIKYNaEqEXts4c1CFZVu0nmJC29fEZ5hZmgf7MECIYz5SvXjOUY03+F/lmVEpdTWl/nNexifltHY2nxGNIBk2hICNQKwS9EaVv56FJpeDGZuN9GeHPlA/gQzr0387I8tdEuXqI8No3sMKuklXWQdxM8LL+kiMS8VPD0CQlfAI4PNLz0aIIGlDZp5QMBV0MTSaw5SEiiOosJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cShSEfCVVMryirvGQoXMoi9ICBV4ncbKW0T5GKBLZus=;
 b=Cei77W7yw4M15hwooHm/dgMVLUoc9C7Ux2bJw3BzxkKj7B8frWzgVrjFOWkvWuumWd0mVVraj3L1VxDjyEQVD9uty0A+mo8/PktIs7g+/HCq89jEbbF6HE+O2ftOqIlIButsx+Ste4rNBox8P9nNik4x6Mi547/zqjMCN6SBzRg=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3339.eurprd02.prod.outlook.com (52.134.71.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Fri, 3 Jan 2020 14:09:41 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2581.013; Fri, 3 Jan 2020
 14:09:41 +0000
Received: from [192.168.13.3] (213.112.138.4) by HE1PR0301CA0009.eurprd03.prod.outlook.com (2603:10a6:3:76::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend Transport; Fri, 3 Jan 2020 14:09:40 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [RESEND v6,3/3] arm64: dts: fsl-ls208xa-rdb: fix an errata
 E-00013
Thread-Topic: [RESEND v6,3/3] arm64: dts: fsl-ls208xa-rdb: fix an errata
 E-00013
Thread-Index: AQHVuw9Ujcuz4BtLx0O84aN221u8IqfZCL8A
Date:   Fri, 3 Jan 2020 14:09:41 +0000
Message-ID: <d91b3dfa-e0dc-9697-b69b-463ee7a92945@axentia.se>
References: <20191225103624.48342-1-biwen.li@nxp.com>
 <20191225103624.48342-3-biwen.li@nxp.com>
In-Reply-To: <20191225103624.48342-3-biwen.li@nxp.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: HE1PR0301CA0009.eurprd03.prod.outlook.com
 (2603:10a6:3:76::19) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67fbf095-bcfb-4623-c957-08d790569384
x-ms-traffictypediagnostic: DB3PR0202MB3339:
x-microsoft-antispam-prvs: <DB3PR0202MB33398336D02189BCBE551728BC230@DB3PR0202MB3339.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0271483E06
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(346002)(376002)(366004)(39830400003)(199004)(189003)(66946007)(81166006)(2906002)(8676002)(4001150100001)(31696002)(31686004)(86362001)(8936002)(36756003)(81156014)(4326008)(66446008)(64756008)(66556008)(66476007)(6486002)(16576012)(316002)(956004)(2616005)(16526019)(186003)(508600001)(53546011)(4744005)(71200400001)(5660300002)(52116002)(110136005)(54906003)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3339;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i53TtIKP7BRTfZoEB6SdimBIu/OYXiZRPG5SE04Aqy64RFZALU8ajFp5jpoQKEYiVkGqb/44Z8L91jTWhJPodarLrqrpR2UVfvcTi+9qMJVLcZ8ZjDeHTvnSfIox4KLvNkgRS4f428WnRAttYfk5k9U+pNtOtYxa9jmSc7AHpH2eFsbBQCPaGI8c7b/HCCYObL7CnuhnsO4nGZKf0lRxRmON12HrQg38uwHf/7/k8l8o8PoZUXN8GgFwQe0OfNrfwgkPuvB5q4pX51SMampluE+OEkJm+TngsF690gRmx1Nz7oFFBlTpJH+MYGOpyeHdwN4m8nNVzr8niUGSqBZfWSst6kwutNyDPX+izIPC2lNERWiDSM6v7Od1PRXTUscihhqfORW1tVjKNLXeEHVoMwwTqzG4EzC7yxYuHRNMrufh9DjF7enHQTBigwZOqu8B
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0182C24504F98C44BE63F353BF72716F@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fbf095-bcfb-4623-c957-08d790569384
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2020 14:09:41.4563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4VvNziGgr53XnubFZ7BZRx+NvnF+jpN6bgDU7CmU0HEFBYrokHQRHNSoc4G1N2sP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3339
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMi0yNSAxMTozNiwgQml3ZW4gTGkgd3JvdGU6DQo+IFNwZWNpZnkgYSBjaGFubmVs
IHplcm8gaW4gaWRsZSBzdGF0ZSB0bw0KPiBhdm9pZCBlbnRlcnJpbmcgdHJpLXN0YXRlZCBzdGF0
ZSBmb3IgUENBOTU0Ny4NCj4gQWJvdXQgRS0wMDAxMzoNCj4gCS0gRGVzY3JpcHRpb246IEkyQzEg
YW5kIEkyQzMgYnVzZXMNCj4gCSAgYXJlIG1pc3NpbmcgcHVsbC11cC4NCj4gCS0gSW1wYWN0OiBX
aGVuIHRoZSBQQ0E5NTR4IGRldmljZSBpcyB0cmktc3RhdGVkLCB0aGUgSTJDIGJ1cw0KPiAJICB3
aWxsIGZsb2F0LiBUaGlzIG1ha2VzIHRoZSBJMkMgYnVzIGFuZCBpdHMgYXNzb2NpYXRlZA0KPiAJ
ICBkb3duc3RyZWFtIGRldmljZXMgaW5hY2Nlc3NpYmxlLg0KPiAJLSBIYXJkd2FyZSBmaXg6IFBv
cHVsYXRlIHJlc2lzdG9ycyBSMTg5IGFuZCBSMTkwIGZvciBJMkMxDQo+IAkgIGFuZCByZXNpc3Rv
cnMgUjIyOCBhbmQgUjIyOSBmb3IgSTJDMy4NCj4gCS0gU29mdHdhcmUgZml4OiBSZW1vdmUgdGhl
IHRyaS1zdGF0ZSBvcHRpb24gZnJvbSB0aGUgUENBOTU0eA0KPiAJICBkcml2ZXIoUENBOTU0eCBh
bHdheXMgb24gZW5hYmxlIHN0YXR1cywgc3BlY2lmeSBhDQo+IAkgIGNoYW5uZWwgemVybyBpbiBk
dHMgdG8gZml4IHRoZSBlcnJhdGEgRS0wMDAxMykuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCaXdl
biBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4NCg0KRm9yIHRoaXMgcGF0Y2gsIGdldF9tYWludGFpbmVy
LnBsIHN1Z2dlc3RzIGEgZmV3IG1vcmUgcmVjaXBpZW50cyB0aGF0DQp5b3UgbmVlZCB0byBzZWVr
IHJldmlld3MvYWNrcyBmcm9tLg0KDQpDaGVlcnMsDQpQZXRlcg0K
