Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 963E5AF7B8
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2019 10:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfIKIYX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Sep 2019 04:24:23 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:41398 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfIKIYW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Sep 2019 04:24:22 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: L0u4jR5yduQ+iqio9ZPjlHtUu5+OYzkayQmqmmZicr3Aln0nfF7HMMSIcZj4mMKmurwQdkaVDT
 VKIxkNpY8SmHtxtJlyddsYvT3MNN2Qotuag/hds67FO2kUSa2TX7PX+2SvSnjl7eUO/3KVzhmn
 ciUA3NYp+RoCUgG10Fr28Yar1vVU8DPlc9zLtEZF7kAMuhykp7phAQXaAFv6vcAnkNXqeUb3+d
 fB9t6HTLB9TNJsotBK1VfTwtlqkpBZ9Qcbw9RQHWUKjLeoKPdP/7Qck2Bsc+iAERcefMsKZ4PG
 CAI=
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="48642329"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Sep 2019 01:24:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Sep 2019 01:24:17 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Sep 2019 01:24:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N62jA5r/qKG8bPGn/bVhNgbxFkoSGIIvRQoWdQPpUXWEW/ZmTp/mZMShzyw/VOzUBXe5sYKJm+g47YeKoLNDxR3mPPguNH9igQwyfqk4V0ALdkdN6kF4le4T3N62COIA33Bng93CIrmRgTQj7Xkc26yPyJVrN4umfZ6rl+cN364FAfwd8/IfVMAmwUUfPy7qRlsUExEcZKHg90f+pJqQpX0x/xwb3xWuALgzaGi6BnyBW3wiJeomXU2tmHDjSU/2nOC/KyzrOkUOuXUrKrsflZlQZ976eGF3LJbfnO+ksRrN2MTmIow9nx7rLK/BNhYVpJYTfUSgVuhvSl5nSpHMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35IFG+Xf34QFpoHfJHsfSoScCqAUS+jX9A9SkKyJNx0=;
 b=meFIiuFuCopnnYh2i0EjM9pGruVm3XyH2ii+zKY5ognYeVxNjLxjgIhkDzJPTlDM3LoIaZmhNKoYhe0je8FF35zZ3d0Zwza8srqZ1+t4iNMBrAcU1xtabKujZrtNV1kQ10Szc44Dd4PVaiQj27aAuMaMdxGHXpclo30skEGiK02UVBM9AVl5msQSA/3bAGf+zYf3M0VrOSXUIj9LpmxTW6GP5EI4JwraE7biZmMmTwwfiyAj1cQssYL8lnpG08602Yl1vfjPR5ngCm8xsIMh/A4iEiyS1qIkySPKoM7cvKv+UmlfkurWJWn6XPi+n0RYFqtbTHPT1COQFbZutmyFFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35IFG+Xf34QFpoHfJHsfSoScCqAUS+jX9A9SkKyJNx0=;
 b=GB8BUC1jMY9ZC9nUoFBzObZXpy1eeSaVY5aZWk0/zOv9QZl3RcUtgmLw0ZhuAvaK0cEZQnui789BHoBAvY55CYYIPFZ1C0lD13nOTEjCcJX+Xt0dDp5cL3Im9thqs5QwTWDP7i53bDb2Rv7o6KVxszmevvcqBbViWroWmWWZasA=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1452.namprd11.prod.outlook.com (10.172.36.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 08:24:14 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2%12]) with mapi id 15.20.2241.018; Wed, 11 Sep
 2019 08:24:14 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <Eugen.Hristev@microchip.com>, <Nicolas.Ferre@microchip.com>
Subject: [PATCH v5 0/9] i2c: add support for filters
Thread-Topic: [PATCH v5 0/9] i2c: add support for filters
Thread-Index: AQHVaHpLr7113TR4Hk2itVe9BFeajQ==
Date:   Wed, 11 Sep 2019 08:24:14 +0000
Message-ID: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::21) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: baa66c79-36bd-411b-8232-08d736916e23
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1452;
x-ms-traffictypediagnostic: DM5PR11MB1452:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1452716D9DCD95F663157E3FE8B10@DM5PR11MB1452.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(52116002)(3846002)(2501003)(66556008)(66476007)(66946007)(54906003)(110136005)(478600001)(25786009)(316002)(6436002)(6116002)(66066001)(386003)(14454004)(2906002)(102836004)(486006)(476003)(2616005)(6506007)(186003)(26005)(4326008)(8936002)(81166006)(81156014)(7736002)(66446008)(8676002)(5660300002)(50226002)(64756008)(86362001)(2201001)(99286004)(71190400001)(71200400001)(53936002)(36756003)(256004)(107886003)(6512007)(305945005)(6486002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1452;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FU2c8nyrDhiRXvjneemGrOtUMzAuzl9nYdXmolGmiVVnlGEudCJhDCIIDXeVz+TpfpBAMiCos9yYtar1LlXJzd3XYJdUkfuCKXtmTAvRVx7MvVqBc+2BDLAPktozJHKhQ9rDlFEK4pjGf6XY+o66yHT/yF3HWh7lxDKRllpFNCReKxXK0+We69jnrl5VbjZG8dLcam/YgcTVrRNcV8oGd9xmKchAZYfnS6IwPhyILwUo6fZRT7qCzDVq7XA83gqJqUsbqAbNnPCi/ipRXrkQWhD9RFibEgipfkiKfFNvDEYol4VIjVCx70pe7V09OI3DZ5cB7O3tbmDdBFDYFcQlURhUQboHShxH0d86L2sVhOzt/h74pcT/MsB7Q0p1ffjkhqxu94zDsF3CVIMkIplrMKoIw2a7iN89Qe2YxFS+X6I=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: baa66c79-36bd-411b-8232-08d736916e23
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 08:24:14.4852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p0BugN2odvcBkhXKrhdNsvNrmkuxwsvyhgItxnDE2EEXI8THYUk1dNR0dhSSUqa/+iwrfQJelSlHeKHeolkfgiMryPAtFmV6uOCH70kGprM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1452
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Hello,

This series adds support for analog and digital filters for i2c controllers

This series is based on the series:
[PATCH v2 0/9] i2c: at91: filters support for at91 SoCs
and later
[PATCH v4 0/9] i2c: add support for filters
and enhanced to add the bindings for all controllers plus an extra bindings
for the width of the spikes in nanoseconds (digital filters) and cut-off
frequency (analog filters)

First, bindings are created for
'i2c-analog-filter'
'i2c-digital-filter'
'i2c-digital-filter-width-ns'
'i2c-analog-filter-cutoff-frequency'

The support is added in the i2c core to retrieve filter width/cutoff freque=
ncy
and add it to the timings structure.
Next, the at91 driver is enhanced for supporting digital filter, advanced
digital filter (with selectable spike width) and the analog filter.

Finally the device tree for two boards are modified to make use of the
new properties.

This series is the result of the comments on the ML in the direction
requested: to make the bindings globally available for i2c drivers.

Changes in v5:
- renamed i2c-filter-width-ns to i2c-digital-filter-width-ns as this
is applicable only to digital filter
- created new binding i2c-digital-filter-width-ns for analog filters.

Changes in v4:
- renamed i2c-ana-filter to i2c-analog-filter
- renamed i2c-dig-filter to i2c-digital-filter

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
  i2c: add support for filters optional properties
  i2c: at91: add new platform support for sam9x60
  i2c: at91: add support for digital filtering
  i2c: at91: add support for advanced digital filtering
  i2c: at91: add support for analog filtering
  ARM: dts: at91: sama5d2_xplained: add analog and digital filter for
    i2c
  ARM: dts: at91: sama5d4_xplained: add digital filter for i2c

 Documentation/devicetree/bindings/i2c/i2c-at91.txt |  3 +-
 Documentation/devicetree/bindings/i2c/i2c.txt      | 18 ++++++++
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |  6 +++
 arch/arm/boot/dts/at91-sama5d4_xplained.dts        |  1 +
 drivers/i2c/busses/i2c-at91-core.c                 | 38 +++++++++++++++++
 drivers/i2c/busses/i2c-at91-master.c               | 49 ++++++++++++++++++=
++--
 drivers/i2c/busses/i2c-at91.h                      | 13 ++++++
 drivers/i2c/i2c-core-base.c                        |  6 +++
 include/linux/i2c.h                                |  6 +++
 9 files changed, 136 insertions(+), 4 deletions(-)

--=20
2.7.4

