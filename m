Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32667636A3
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2019 15:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfGINTa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jul 2019 09:19:30 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:4899 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfGINTa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jul 2019 09:19:30 -0400
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: SmOgdNKh9HiZ80OQVIkR3Ce6HthdBYmV9l7jpamc5XkEOotUPWPEKWCqIAgQDYOVY+OFD3cH7f
 ROghGuGk82L1W8ya1IX/XtFPw/iM25+QwD0XCfOIYCIRlOiJPc/fKHkEy2b8jYw7lOPE7KnTyL
 c+D8jJtkx50iD5ZffXUlogVn9ij0Z1RMzxBpVdvZffHDDrzeExb7MjEWp+Xwy90rgvuGSKG0jR
 SDCLjYl95pCHo6jSEshRk+RYBmbczWgatWY3PANPA9Z9jpzxM6lr5oxcZMBTy8kkecSfZeqCBJ
 KCU=
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; 
   d="scan'208";a="41983854"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2019 06:19:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jul 2019 06:19:27 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 9 Jul 2019 06:19:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiV+H+OvU5mTtAeCVYDwtLApn5ex4belhc+VQ52jQJw=;
 b=fH7DwuaRFn41HpTtargKY7oA7d9uj7Tn9pD9V6slpYXERr94CNA3PegMZttmVAC3A+TBETisvqeHUeZejniIlOzb/aCDIioed1Z71gRtSJhfzyi7iOYbygRFd/N9LdSSVGrDfDzrHkfEv5+IuKn9uY2W/dI66KQ9cteUsPLXIcM=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1785.namprd11.prod.outlook.com (10.175.88.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 9 Jul 2019 13:19:26 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925%8]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 13:19:26 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 0/9] i2c: add support for filters
Thread-Topic: [PATCH v3 0/9] i2c: add support for filters
Thread-Index: AQHVNljuO/4Zfm2qEEOYNYIbMTanpQ==
Date:   Tue, 9 Jul 2019 13:19:26 +0000
Message-ID: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0141.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::19) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d38cf48-6e0b-4be9-106d-08d704701114
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1785;
x-ms-traffictypediagnostic: DM5PR11MB1785:
x-microsoft-antispam-prvs: <DM5PR11MB1785300C2085BE6F2302C2DBE8F10@DM5PR11MB1785.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(136003)(366004)(346002)(396003)(376002)(189003)(199004)(71200400001)(7736002)(305945005)(2906002)(476003)(66066001)(81156014)(7416002)(50226002)(6486002)(2616005)(3846002)(110136005)(66556008)(72206003)(66446008)(54906003)(73956011)(8936002)(478600001)(81166006)(71190400001)(6116002)(6436002)(316002)(107886003)(64756008)(6506007)(14454004)(4326008)(186003)(36756003)(26005)(102836004)(5660300002)(66476007)(6512007)(2501003)(53936002)(99286004)(86362001)(8676002)(52116002)(256004)(66946007)(2201001)(486006)(386003)(68736007)(25786009)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1785;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /2gyFE926xbEZiB+ZqOW1fPOC0yCP9QoJUAZkcPIZX8j/KScV/GeZx6bCWkv98xYVn5JlRhMfwUMoP8JiitArrrFWsFSRuUfvViZn89wwmKUUBm5UtSqHTYWMt2aEa4AxOgovikABydZR9r5kBbJ3R6YIjh9mOoBXL3ZxIhjr3Yl6EA692bgNcNiwnbp93rgp0D0AWZpQ5LbStsaaPAF2ErmGASyDS2bna3yPx9g2DaLu0gesp2P8sTtBrQUUf0Hyw+A5ZLI5MqmYij+T9eC7o1vN2YR8nox0gMiTDCPJbyyYpcsQLK/s4Qq/1085FgxhKCjwjEm4mDCQoXCaJ/Vm+fpC9WVFRD6Ua5LISvKHBUvnuc52g8d5+sElGDfGdrokB38AZzxKpn47h5f/OhZuPwOGQgJsyOxXr5oKMznbDA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d38cf48-6e0b-4be9-106d-08d704701114
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 13:19:26.7561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1785
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Hello,

This series adds support for analog and digital filters for i2c controllers

This series is based on the series:
[PATCH v2 0/9] i2c: at91: filters support for at91 SoCs
and enhanced to add the bindings for all controllers plus an extra binding
for the width of the spikes in nanoseconds.

First, bindings are created for
'i2c-ana-filter'
'i2c-dig-filter'
'i2c-filter-width-ns'

The support is added in the i2c core to retrieve filter width and add it
to the timings structure.
Next, the at91 driver is enhanced for supporting digital filter, advanced
digital filter (with selectable spike width) and the analog filter.

Finally the device tree for two boards are modified to make use of the
new properties.

This series is the result of the comments on the ML in the direction
requested: to make the bindings globally available for i2c drivers.

Changes in v3:
- made bindings global for i2c controllers and modified accordingly
- gave up PADFCDF bit because it's a lack in datasheet
- the computation on the width of the spike is based on periph clock as it
is done for hold time.

Changes in v2:
- added device tree bindings and support for enable-ana-filt and
enable-dig-filt
- added the new properties to the DT for sama5d4_xplained/sama5d2_xplained

Eugen Hristev (9):
  dt-bindings: i2c: at91: add new compatible
  dt-bindings: i2c: add bindings for i2c analog and digital filter
  i2c: add support for filter-width-ns optional property
  i2c: at91: add new platform support for sam9x60
  i2c: at91: add support for digital filtering
  i2c: at91: add support for advanced digital filtering
  i2c: at91: add support for analog filtering
  ARM: dts: at91: sama5d2_xplained: add analog and digital filter for
    i2c
  ARM: dts: at91: sama5d4_xplained: add analog filter for i2c

 Documentation/devicetree/bindings/i2c/i2c-at91.txt |  3 +-
 Documentation/devicetree/bindings/i2c/i2c.txt      | 11 +++++
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |  6 +++
 arch/arm/boot/dts/at91-sama5d4_xplained.dts        |  1 +
 drivers/i2c/busses/i2c-at91-core.c                 | 38 +++++++++++++++++
 drivers/i2c/busses/i2c-at91-master.c               | 49 ++++++++++++++++++=
++--
 drivers/i2c/busses/i2c-at91.h                      | 13 ++++++
 drivers/i2c/i2c-core-base.c                        |  2 +
 include/linux/i2c.h                                |  2 +
 9 files changed, 121 insertions(+), 4 deletions(-)

--=20
2.7.4

