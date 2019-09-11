Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88B42AF7BA
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2019 10:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbfIKIY0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Sep 2019 04:24:26 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:28418 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfIKIYZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Sep 2019 04:24:25 -0400
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: CHlb1AQHipyEuxe2l4HIO474e9QMwS3V2kDuNJXNJb1JVTw9PdyHmisPkd9W5Gx6Hp9H/etDte
 jMhVPodYuefxUIC1JMAC6v1usT7eFDHyrvIg8cMtzp9GvzqS4pYoPaSfvKwduB6ffeIAcerkEE
 A1cmNEjDD3mtg+X2oZYA9UmhPHSP7ITwxTT6cVh9RtzJC/UncDeJiU3nBygcgeBz4QmJi50fwX
 laPtKtK/wD2EWHsIIOGDXYJ1NBaVw+4rABfX7WyNUovTi1jg+QuHcN7pICnkDVRtK81BkjIGQp
 +XQ=
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="47514808"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Sep 2019 01:24:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Sep 2019 01:24:23 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Sep 2019 01:24:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIV51iuekqUXaaBzYcuo/Testtu7jR0p1JZq0RArGnLQeP1RZUjjrsrNHmf58g1NALLJ4WW037F183icL0BvxD6OZz4OOi4yKDbosEbPMaaYRcyocJq8mJO/2fmHr6MmLTOoIwshmEtCexJu257Xf7TrGZOetcivi78BGJFprkbwaYQqUJb30kfKI3/1fZckU+dJUsprOf6noV9UEGSihFMS/XgwZiYLhk22WH2s/WBTD1P90VVscspAIHoD8gGym3H69LK9K2Jh0qDwHFSRzVo1LqGwUMk7f5RFcsFEBQlQr1Lh+ovt4WxfTV7D8aqY3YuAI1oj4Y3YAzmE4BMUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9klXs1ltqK+KHZSYDYhMQ3xgbH0lFyld1DpTD+ECdaw=;
 b=dsBTfczaQCw4LFJB3AcOI67gdar3Xj1d3M5hHODqJ0y/R3o1TKhABIlxggJHRHLAzQHWpG6TKfJoXZYtdL/Iy6ik5oUwT/EFiYqAWMa9l354/AAhQ+jcVHTQToBQdyh/E7YH8O4GJdthhUefPfaSmiab8OqBu43IyvNYaAGkpXy0zwYs26ywYsS6C0MNCY1C2RKCN9OEfbsKF8S1gRggm1ZJTeIUaf1cEjuqOUBCJMiCEtXEmajIq/c/+MI5AE+v8PxjRI96M7EgdcJUF4wwD5jlTKdewB510kDnLJvJTsFlKVGc791ErRpCpp6+8nD0SrZHK3G/3JAg05BZr/k+ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9klXs1ltqK+KHZSYDYhMQ3xgbH0lFyld1DpTD+ECdaw=;
 b=etA1hZJKEQtXe25pgpr6gfo+FJ0sibtpYMjKxeZ4P1iKonbNv0ONW5capY28G1b9N5qi6sTv/LUWgQtXr0hqxdcyZueWMzhGfYcOEYd1gVJUWBGBrhffFHxhaFRLqah4yc8BbceVFCOPqEcTHSal1sGN5uYoHLAugSVKtjeyR2A=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1452.namprd11.prod.outlook.com (10.172.36.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 08:24:23 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2%12]) with mapi id 15.20.2241.018; Wed, 11 Sep
 2019 08:24:23 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <Eugen.Hristev@microchip.com>, <Nicolas.Ferre@microchip.com>
Subject: [PATCH v5 3/9] i2c: add support for filters optional properties
Thread-Topic: [PATCH v5 3/9] i2c: add support for filters optional properties
Thread-Index: AQHVaHpQ2X5g0ID8eka9rBrVOgWzqQ==
Date:   Wed, 11 Sep 2019 08:24:22 +0000
Message-ID: <1568189911-31641-4-git-send-email-eugen.hristev@microchip.com>
References: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 48f96db6-4719-4b00-87a6-08d73691732b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1452;
x-ms-traffictypediagnostic: DM5PR11MB1452:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB14520038A2F8A2EFD002CC31E8B10@DM5PR11MB1452.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(52116002)(3846002)(2501003)(66556008)(66476007)(66946007)(54906003)(110136005)(478600001)(25786009)(316002)(6436002)(6116002)(76176011)(66066001)(386003)(14454004)(2906002)(102836004)(486006)(476003)(2616005)(11346002)(446003)(6506007)(186003)(26005)(4326008)(8936002)(81166006)(81156014)(7736002)(66446008)(8676002)(5660300002)(50226002)(64756008)(86362001)(2201001)(99286004)(71190400001)(71200400001)(53936002)(36756003)(14444005)(256004)(107886003)(6512007)(305945005)(6486002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1452;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YVwxQCUsNBAlq7ddpfpxa+LGPhFgUnbWNsb0mcMbCSHKrh9Qr/e1QPSXos0UymxS/rMuYSAjGnXS+cXsXN2ULMH9eIw2G8nYU8OKf05Mcyb0uVEgfDqgY+bdx1w3c/2wRBX+kMGYX5nPpmcpgh9jTXmB+BDhaICgGqst4Mss/9Zt4QCRe63r4ZI73C11CbIEDLlqcyCnDyyOL/N35qEYY5B0zIg4Bmk5WYwOiCqbTaw0GpnF2Y5kWk2SokR8ELcFBsfGGqQZuz7GZ0lhAQUc3cAfa1faHDytMX8URu3lUZatxMunmQTy2ctBF9qJsrrPb+NK/MtvxM+N7toxCpL3ZVMoEnS+eAOlym/oRCB4O8+CnY5Axz6s9q3VQP4gDDnFtNoY5zJcShjlWbU5Tme7mUcigmcVlwJ3imYJlSOn+2Y=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f96db6-4719-4b00-87a6-08d73691732b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 08:24:22.8903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vLpIeajVpfqhvhsjHTYyCJ3ontjVkgRC711bJwiOTV82mjpMaPDHz3u5RYcNzTdlC1BW7aDBWXOBLdsIwc1IJ93Qr/NzAToUciiuCYtXwzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1452
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

i2c-digital-filter-width-ns:
This optional timing property specifies the width of the spikes on the i2c
lines (in ns) that can be filtered out by built-in digital filters which ar=
e
embedded in some i2c controllers.
i2c-analog-filter-cutoff-frequency:
This optional timing property specifies the cutoff frequency of a low-pass
analog filter built-in i2c controllers. This low pass filter is used to fil=
ter
out high frequency noise on the i2c lines. Specified in Hz.
Include these properties in the timings structure and read them as integers=
.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/i2c/i2c-core-base.c | 6 ++++++
 include/linux/i2c.h         | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9c440fa..c9fcb16 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1658,6 +1658,12 @@ void i2c_parse_fw_timings(struct device *dev, struct=
 i2c_timings *t, bool use_de
 		t->sda_fall_ns =3D t->scl_fall_ns;
=20
 	device_property_read_u32(dev, "i2c-sda-hold-time-ns", &t->sda_hold_ns);
+
+	device_property_read_u32(dev, "i2c-digital-filter-width-ns",
+				 &t->digital_filter_width_ns);
+
+	device_property_read_u32(dev, "i2c-analog-filter-cutoff-frequency",
+				 &t->analog_filter_cutoff_freq_hz);
 }
 EXPORT_SYMBOL_GPL(i2c_parse_fw_timings);
=20
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fa5552c..26ce143 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -575,6 +575,10 @@ struct i2c_lock_operations {
  * @scl_int_delay_ns: time IP core additionally needs to setup SCL in ns
  * @sda_fall_ns: time SDA signal takes to fall in ns; t(f) in the I2C spec=
ification
  * @sda_hold_ns: time IP core additionally needs to hold SDA in ns
+ * @digital_filter_width_ns: width in ns of spikes on i2c lines that the I=
P core
+ *			     digital filter can filter out
+ * @analog_filter_cutoff_freq_hz: threshold frequency for the low pass IP =
core
+			      analog filter
  */
 struct i2c_timings {
 	u32 bus_freq_hz;
@@ -583,6 +587,8 @@ struct i2c_timings {
 	u32 scl_int_delay_ns;
 	u32 sda_fall_ns;
 	u32 sda_hold_ns;
+	u32 digital_filter_width_ns;
+	u32 analog_filter_cutoff_freq_hz;
 };
=20
 /**
--=20
2.7.4

