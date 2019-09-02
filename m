Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D300A53AD
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 12:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731216AbfIBKL7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 06:11:59 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:2666 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729690AbfIBKL7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 06:11:59 -0400
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: max52IFBu8GgZQANsOUOhZSUGROA5BLI+W9nH+roz8dqvCtWobpn02P9UjwfUS3KlT5JUKMwAJ
 sS+57X2JFVJk5U/OkmyHkONDlVLxaqgX+toiPPRN9H+1O0Wn4KpMlXq8mYei0h2hXsM9b22Eqi
 /EatTEF8aWyarU1mNwzksZ6mZ5PqPMr7cq6nKyJPBo8jujJw9Ze+3DI711Tqudnpzw2UzA0V+e
 DySIdLO5728LY+je3r8Y8llnSBACWCfdEi25I0PNy3woQrN5Fq+U7kZ/vs7r0/j3TLgvMfDKi3
 /i0=
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; 
   d="scan'208";a="47374250"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2019 03:11:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Sep 2019 03:11:57 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 2 Sep 2019 03:11:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhoXju99gNeX7C9UBY1WWmGf1MNDAwU79hrd19CWxeK9zlw5MUriSRASl8xo27uHrxjVTUYr6TC3BsDIndkVTvR4q01bQTkYQTPvsIloO0ETgzwdumh/v2uXwBYKsfx5Q31KICKYE36sH4VH4DMexySkhaNWmCJIUwcX7tPN1l9MrgLadmRtyqoSzqJiRZEyeeOZpOs/i42t48AN/QcJhCt26/47UbDPxGphuDGlvxBrbjbc3A7AMKh6FZycUHuLFv28NjXosamnH/y1eTJZc6+10slNHSmBAkPqoNDjkjILj/E7ZjLmmMBwFhDYMEYf45cm4rCEGb/McwcOGxz77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXQQqGElMSxRZX+kwpKbIvJmtvk2M+mOkmYxeFkJFXE=;
 b=UQZzDizUtAsQsu7SL/9iYlQOcTtFl52DaJC0SXQKVtG8FXa6TAs9KptQNV7i9dgOFzEbyhbZvqjzNvoNqFmx5/aUC9NKPi80m1QSJ6C6TorHvIJ+sKRE+82v3x1WLpjwQlIelEaUVfLJ80K11UKO9Ulnx2x2yppKkxRQVTW2J4TgP/mNc4oSgB//gdhKfdlX0s2BiLABDhuLN1aAOE+4XyVmNiZIlQW62KkWTIdNXKV3UhABnqmZfxRf7cqb11nDE1w2rTWQBMrOC6TX7VX5TL67xxLY7qSmf62q8xnq+KcwG47qKYlb/9r+2v1svNFjKcFOcRF0gJGziKeaLjBUXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXQQqGElMSxRZX+kwpKbIvJmtvk2M+mOkmYxeFkJFXE=;
 b=OYddnlBow5hFRSCIXDoha7k/6mr9UdWeJjZoVq4HbshoGsPqZ+a/OeBbT0NFsNQM5jU9U3RwwN7deqx+4rewJtYaUV6nDkxg1frBnt8qbPMEskdEs/dK02D73mDFxrGyZH5Q17s8PJmoR5Cy2g2GbL/ZqkCmMMJwrFB1R7EUCCw=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0044.namprd11.prod.outlook.com (10.164.155.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16; Mon, 2 Sep 2019 10:11:55 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3%10]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 10:11:55 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v4 0/9] i2c: add support for filters
Thread-Topic: [PATCH v4 0/9] i2c: add support for filters
Thread-Index: AQHVYXbZTI6KOW7JKE29tY8X4gGgDw==
Date:   Mon, 2 Sep 2019 10:11:55 +0000
Message-ID: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::31) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8bd832b-9204-46ce-b6f4-08d72f8dfb6d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB0044;
x-ms-traffictypediagnostic: DM5PR11MB0044:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB004408024811417B46185C23E8BE0@DM5PR11MB0044.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(136003)(39850400004)(346002)(366004)(189003)(199004)(2906002)(66446008)(2201001)(66556008)(66476007)(64756008)(8936002)(305945005)(3846002)(7736002)(66946007)(6512007)(6116002)(86362001)(36756003)(5660300002)(52116002)(2501003)(476003)(2616005)(256004)(6486002)(486006)(50226002)(14454004)(386003)(6506007)(53936002)(186003)(99286004)(66066001)(81166006)(110136005)(7416002)(4326008)(107886003)(54906003)(71190400001)(26005)(102836004)(6436002)(71200400001)(316002)(8676002)(81156014)(478600001)(25786009)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0044;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6F6UdEQt8hm6CufdCXv9IvHTagO4OYqK6X9EqELXHoIM4N1eQIUEuKK/kwnklMSSMthGayJYM5jd7T9auwasHZrvzJT6+50o5yYrQrX3vzwnv6C0BG6VBrBtQJ0iLZD6C/gxydY0mm5+z9YMA7JVuzMYjo+CtJ7KqMVynbN8THsshaDkskdFq594ItKp8jddcVH5titWVD04QLABLbYym/83MOyYmsz06VxrdFkDrMBUyhQW7dmDR8dUwQFApQWiSMEU1uS8c1rE1unVe1dOoG5rHMhEJESE52lg71obxYPtvb34hocoPnbHMNgG06xsh8lxY5+tTPDAQFftYrhR5Hix8cAOtWVUH6jn8rKZv82SQfbEfTeh0wW9k+LIvlnVIjhmbyyv1ER7BjlYHh1LmWF0RHHtwECxClhh7/RmVtg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bd832b-9204-46ce-b6f4-08d72f8dfb6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:11:55.2729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FMEYlN+kOZes1VYwg0C3rSK2TQY42t1MuMrf7u0HwpXfINMPtLnpAB3jWCYPmm6K22tfkXrElPo3bzP/WUAaRC2swYX1HCxGPbIFmjNXPs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0044
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
'i2c-analog-filter'
'i2c-digital-filter'
'i2c-filter-width-ns'

The support is added in the i2c core to retrieve filter width and add it
to the timings structure.
Next, the at91 driver is enhanced for supporting digital filter, advanced
digital filter (with selectable spike width) and the analog filter.

Finally the device tree for two boards are modified to make use of the
new properties.

This series is the result of the comments on the ML in the direction
requested: to make the bindings globally available for i2c drivers.

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
  i2c: add support for filter-width-ns optional property
  i2c: at91: add new platform support for sam9x60
  i2c: at91: add support for digital filtering
  i2c: at91: add support for advanced digital filtering
  i2c: at91: add support for analog filtering
  ARM: dts: at91: sama5d2_xplained: add analog and digital filter for
    i2c
  ARM: dts: at91: sama5d4_xplained: add digital filter for i2c

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

