Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490F028272F
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Oct 2020 00:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgJCWqS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 3 Oct 2020 18:46:18 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:61377 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgJCWqR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 3 Oct 2020 18:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1601765175; x=1633301175;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fJXu3MDUzNslK7ukgDP2lMIodbRt2PJPY4SmvSFMsFw=;
  b=FaocotEfv9wSJjWDQ8v/Da3a1bvHXITOJPbJ8EO2uw2guRk43txgnGqa
   LJrhNPY60wL8tq0t5TuopaLO97AfZFb2yQK8gsXgIWpTcKLWINBqa8Il9
   7Lz6CdvegsJh6iZ8wLTjvq0wkkDD5r00pSWPmFRrp1+ZP3MdZEmQonb1j
   dPivt/+5XKfxM1+5/7UEvWpQ8kjVWDj0kShmgYd4UG6gm6dB90gWKMGYk
   QJdDvonOJ9oKDlLKz+6MbNfxW2aEuUtN+hp915hc5QDrFC4CvYEgPHUKY
   RTFfsnef7A8QENVwVafXQRl7eRWpjR06aRixFT25Lsyi79p4z+61DQC/O
   g==;
IronPort-SDR: PEsOOj5DFQCGJ1G1dUu8gILOX5uRsCUFhtwadMZTKpcVkde3fw2Z8BH/gffThUH0WsM9tHTOR4
 U02PuBO0lH2VpMcJkIan308VgS+Q70hbia1ksix6Xv7kj5OFIIS9wJ63ancpCBxQ6f0qWBykSM
 MXH6POs8fddp3vr51Ch1ZhCqnEUmyO+ep3fhzOCFTymVCaxH9cTft9gJlrcLm4K4NEHz1fwZHT
 TWpHr63zNQyITm2MI4htVeqZetdJmKZavJ61KiqQHJ/R+21zVA0agqa6XXshQH4TxfRuAzKvdE
 /BA=
X-IronPort-AV: E=Sophos;i="5.77,333,1596524400"; 
   d="scan'208";a="91334750"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Oct 2020 15:46:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sat, 3 Oct 2020 15:46:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Sat, 3 Oct 2020 15:46:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpnZZBe7mgqft3aE15Pl2ARfRoKfAycD77na+SXkDkuVsQ1CFSl1Duqwq5sTOVyFEnlXblpE9SNbuxG90GRfkVC7GmvN4aO6D9CH6mgRoTZNXF7VbyZ2Poyc3b0xsCmyOKRxQO09nKYln+2wzPwdt1m0l17Te5RG3PGyP5O/7AUBISYMR6uGNN9t8RPkMa1pYush9mYbghXDov2FV8027BzS0zC4eWuGP5F9EPLw6T4SLV6MTUvYELsdDcVPQjis74WK77gv6JLctEHk0/hIRjpe5IvK8cBONrHU+QQCGA4yokr+wZ3keHWwaM31r5rPvxouSyYbwELQg6elKas7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJXu3MDUzNslK7ukgDP2lMIodbRt2PJPY4SmvSFMsFw=;
 b=mX/TvcG5OwjMGnu46glGY9dagleEqafvBhZprEvRFtHQtWiXPvfhyNs5qtCLpzNfI2iK1EC+QYF3vM2KzCVVUSjLclYpfLfSAo9vhNeZeq1C+Hf2i+fdDbhND1xmmaIJ8NllReInn2k1M+8iJ0/JsZo/+L/xs4GBXjYEfXzisKP44Fx8mmwSxRcOUxd3/NjH445U8FAJWx8CY1qitrmEc/3ZqaaQ9BqjLdM8rfQyqJ4Vz+sYq41HMuTu7Ookq40bzTvDqKAS/+Gv6yNSddockQrP7aVmniA9o4Zd2VWjymA3zCPDtH+oZVEFb/49rx8DiPWNuVr16OyDl2sxRx9XLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJXu3MDUzNslK7ukgDP2lMIodbRt2PJPY4SmvSFMsFw=;
 b=SvICjAXyydiAIAC3ihFZHIZy2SNTSqQ6LHLRqfxloYlRI/Y3BcM9cPdBTRJ4ARECumd8pAG8AQA5XNnvoX1+/FSxHBClgTwVGJBCjEbonOFn6QJtd0x0eth5QXiPLFgSjYOw4gVV4ibOQ5NXXUSWA2gBBT6+nqlMvsbfngtTrss=
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 (2603:10b6:903:b1::22) by CY4PR11MB0072.namprd11.prod.outlook.com
 (2603:10b6:910:76::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.29; Sat, 3 Oct
 2020 22:46:14 +0000
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::908:a628:69ca:d62e]) by CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::908:a628:69ca:d62e%7]) with mapi id 15.20.3433.042; Sat, 3 Oct 2020
 22:46:13 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <linux@armlinux.org.uk>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <wsa@kernel.org>,
        <alpawi@amazon.com>
Subject: Re: [PATCH] i2c: pxa: move to generic GPIO recovery
Thread-Topic: [PATCH] i2c: pxa: move to generic GPIO recovery
Thread-Index: AQHWmaFbBZ8ed2vmCEezMTnByxu//KmGOd4AgABA2wA=
Date:   Sat, 3 Oct 2020 22:46:13 +0000
Message-ID: <dde8b782-9193-a044-a328-98955e9fa35e@microchip.com>
References: <20201003162141.925518-1-codrin.ciubotariu@microchip.com>
 <20201003185404.GH1551@shell.armlinux.org.uk>
In-Reply-To: <20201003185404.GH1551@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.121.164.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ada7d1ef-c78b-4100-0e02-08d867ee21c0
x-ms-traffictypediagnostic: CY4PR11MB0072:
x-microsoft-antispam-prvs: <CY4PR11MB007278CC2048DB85FE9AEF84E70E0@CY4PR11MB0072.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4sVt6eCfghMAjPkKSJ9ZZOcaY8CaJQMA2381b1yl/wizAn/wGN7rv16qFn4tNt4Wlq5Fjx7M6WGTDnXL/tN01aviPt1WiKUNdY29WFdz0h0GshCZ7Pq1/td09EYTP1VHKRwt4mQwAefbzm3SM9+hyzsR15pnQv+xjUd92e58NqeDY1Hz5r1dRlozsHx/eyq2q0C/tuOnhxGuQ+eR/R0zEv1LbV8h0FvojRKmnw3y7EIXKtrrN9VLoI003a4ezQ5W6v9Co9eFugLYwNtAzZH6x+l8IuFrtlNv1RmTL9mPILcX4a42WNtK6YyRxf0fVoVYu3xWr1vzgP4fex17e1aLHzaCsVS1KVtRInVPTJwsRxK8V5sFfE9l/iwxpcN92xo1HPfuONkd216GSxbBmFSWEz/4bkDulD36yPvFfSWhYKLxjHsqoCE+3zIpBbe2KpXBX6yw7Jx4y+d1/Z/qxajkxQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1101MB2341.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(396003)(366004)(39850400004)(36756003)(186003)(4744005)(26005)(8676002)(6506007)(8936002)(2906002)(6512007)(83380400001)(31686004)(64756008)(4326008)(6486002)(66556008)(86362001)(478600001)(66476007)(31696002)(6916009)(66446008)(5660300002)(2616005)(66946007)(71200400001)(76116006)(91956017)(316002)(54906003)(41533002)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: rKiNMf+XwQIZVPB6CJ7D55S/HrTruDPJrbLD3SXDWlqrbmKMNjKpYLVNNGeVtlX1qGeBCI9IaBZ5uygvMClUzjfTxnSx4JAKOOnXBk4/U57+ICQEXHDymn3WUNsg1JMPIqEw+O+gWg3HnwcMkbdI1qsQV4Oq4bBmOe16Y29PfzqJH8eu5+wHWC3nxeD62WbCvoyj733lU/DzUUfmn8IZ/nuLY2nyCvW1a21ZF1kF/mdTw72YjCajjynP5O0CJ9OnGMbIf3ygW0kILPHF7Ncjc4F+aE06TVkykv1HvTk0FBzekULTUpfmToq4mVDMwCAoodT1fPU6Sm684iWBeNv3CJOtc4SnR2lLZM044j+Xg5/P4u8P9sPzCOIOPbnFv2glej97JUZpa39hT4DeX83nhkxn20tttr6h5wvL+DkkyPdskyqJqNvzvPgmCkoUuc5J1hk57cFAcwQ0FVMOwxD2+vzEvEU6nIOw2uI6IzPuac1cv8jh5Xz/QfzWZ+HmLuGp4ATcG1NOCtCfizqtxdaq5wCc3K0yJUqjGyzJUy2qu9Ikdmb1IpgH8XpIIZfAPX76EIdqGO5T4VuvYM/SVSqGGisVb9AFDltO5R1Xq5bHJ3JiWIeRsVw/RGNJ/mMZrib/mJ75dVMoWbLBNODipJbh3g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5C2F45F5DBEFC429BF857DE14E6CEF4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada7d1ef-c78b-4100-0e02-08d867ee21c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2020 22:46:13.7927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UdLcsda7lHJFNSopI5cyiya15UoDhHgY0kel0U7MA3zte/E2HUDy9Joh81pRhiZTJf+aG5o0Yc/115tSUfD+VHLSCYJOfsflpSXr8vh+KAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0072
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Pj4gICBzdGF0aWMgdm9pZCBpMmNfcHhhX3VucHJlcGFyZV9yZWNvdmVyeShzdHJ1Y3QgaTJjX2Fk
YXB0ZXIgKmFkYXApDQo+PiBAQCAtMTMyNSw4ICsxMzIwLDYgQEAgc3RhdGljIHZvaWQgaTJjX3B4
YV91bnByZXBhcmVfcmVjb3Zlcnkoc3RydWN0IGkyY19hZGFwdGVyICphZGFwKQ0KPj4gICAgICAg
ICAgICAgICAgaTJjX3B4YV9kb19yZXNldChpMmMpOw0KPj4gICAgICAgIH0NCj4+DQo+PiAtICAg
ICBXQVJOX09OKHBpbmN0cmxfc2VsZWN0X3N0YXRlKGkyYy0+cGluY3RybCwgaTJjLT5waW5jdHJs
X2RlZmF1bHQpKTsNCj4+IC0NCj4gDQo+IFRoaXMgd29uJ3QgZmx5LiBXZSBuZWVkIHRvIHB1dCB0
aGUgcGluY3RybCBiYWNrIGludG8gaTJjIG1vZGUgX2JlZm9yZV8NCj4gd2UgcmUtZW5hYmxlIHRo
ZSBJMkMgbW9kdWxlLCBvdGhlcndpc2UgdGhlIEkyQyBibG9jayB3aWxsIHNlZSBsb2dpYyAwDQo+
IG9uIGJvdGggU0NMIGFuZCBTREEgd2hpY2ggY291bGQgY29uZnVzZSB0aGUgYmxvY2suDQoNClJp
Z2h0LCBJIHdpbGwgYWRkIGl0IGJhY2suDQoNCkJlc3QgcmVnYXJkcywNCkNvZHJpbg0K
