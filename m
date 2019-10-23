Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C93FE1AE6
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Oct 2019 14:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390647AbfJWMkS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Oct 2019 08:40:18 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:45986 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732361AbfJWMkS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Oct 2019 08:40:18 -0400
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
IronPort-SDR: SzpqzQEN5+FUaVsDQt9S24yfGZaDHg1Oj5OikdNNoV4NSYMb7bfFwCUBvurfTq71IxoByvn6gA
 BQz+EuGSLU1yl8UP3GVLoWgcFH9it0tgEmsSu+xzbFj1AHZQ+jmSyNU4rokai6UZiKXbBSQnzE
 Ff1XlzI0ecSEZpp7ZkKemdvP/N5HTpDWyHH8Ap/Wg7bC1pT7fRKlRX5dAHwiYb+G8brkJ4eBqH
 OJmnZUTvpjTM8uc5oKl/dCr4Rw0BPg54ODmVBR/cLCS/tjH6tXHv8rHsZ1wwGAHcNzMCWA/1hE
 rms=
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; 
   d="scan'208";a="55338755"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Oct 2019 05:40:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Oct 2019 05:40:15 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 23 Oct 2019 05:40:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmKczHQMvz2GBZP6tK7s4UbB6xXQe7duMxhLqL6ZBEFAqQkKW/lEqCiyGd41w+NHKUNipngEVzr1PnKOTJECA+RjWTYs6IQ/K4TnIvj9GCMgnfG6zuC3WaHOXYn6O3KEngmw8amiWiJnFRQrqmHnhWPZHaximOf5RBFhOLZrP/IGrePgum86FvKT3OZsqJGN/OJlYlIib+x2JEPvm0cZi/N/4WetvacLbjvvbmrvS3baY8e2i/Fm3SkbCc2p/uTKVnLVnbqqCdntQJN8UuGZJFSxTTRlpUnY46jbfCCAUIZ8ZZTGVriyguuWZv9URTngPu5s58pBsIeB9rdPJsJvcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OAziD565bi+FCwA8JoD/DHQfByjBDR/u2LXTDTxz18=;
 b=LPmaduzgBtptpN/4UTuDbiUI9aOmVauPxE9/imsqoSp3+CGrScZtduG0oBPLBCq/2vHZCTGPwjWw/bIAaKX4JleFzi8PEHF1zmyqg28aEhyQv+XBad97OP1MoOG6NCfLfNvTfXJ5lAkmfkRvks3JSr2QKjajvV5OTLzEi5Ar6DVLYN7ayPGiR2aliewj5pMdGJrDUn7gxxmR5DpMKRFiZjTsc5yQNNFUVieXPL9E4vgHedcQuMX/AZ9wUmmMlBt0IQtsK5O+zxFKzTNf8NxVDN0E9mnyQ8ewsW3p9jGoDK46+p6vQ1+SjLV3Kbrx22nmOP4X/yb3xWLdeqFEO6IfMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OAziD565bi+FCwA8JoD/DHQfByjBDR/u2LXTDTxz18=;
 b=GEFDqWLM7LixQQ++UryGUYJYRbCvffYqAXpcw0iBEAj2DxeiFJTe6PKzSpQA4BzIR82qr3JXzS3dK3KGirmVfvKzr/3Zjghz4nTp3eKrNav3IKn0uhwrIVFP458LsOr6Qcg95a8UcNnlEFLfg40YFTiiEr7Qmr14rqNWllt8b1o=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1276.namprd11.prod.outlook.com (10.168.108.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Wed, 23 Oct 2019 12:40:14 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4%10]) with mapi id 15.20.2367.025; Wed, 23 Oct
 2019 12:40:14 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <wsa@the-dreams.de>,
        <peda@axentia.se>, <Ludovic.Desroches@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v6 3/9] i2c: add support for filters optional properties
Thread-Topic: [PATCH v6 3/9] i2c: add support for filters optional properties
Thread-Index: AQHViZ8EmqljGdrD10aSBxnDJd1ZDQ==
Date:   Wed, 23 Oct 2019 12:40:14 +0000
Message-ID: <1571834060-31580-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0096.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::36) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 527f708c-15ab-4338-adb9-08d757b62699
x-ms-traffictypediagnostic: DM5PR11MB1276:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1276EB92610121842431745DE86B0@DM5PR11MB1276.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(376002)(39860400002)(346002)(396003)(189003)(199004)(14454004)(6486002)(50226002)(8676002)(81156014)(107886003)(5660300002)(256004)(14444005)(36756003)(4326008)(6512007)(6436002)(81166006)(478600001)(476003)(66066001)(110136005)(71190400001)(8936002)(25786009)(2616005)(71200400001)(64756008)(66446008)(6116002)(66556008)(186003)(305945005)(66476007)(386003)(7736002)(66946007)(6506007)(2201001)(99286004)(86362001)(316002)(102836004)(26005)(52116002)(2906002)(3846002)(486006)(2501003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1276;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9jCsnqYapvXDxFSVwohndTWCwnbUyso+JyLYmOeBQg1Z0g2JMTnMzhaqoxHz4+oc3/pmDOTaz1rexk6SOsEBSq3aHF3gHhngp8CAxCqt0brJg3SELxLZPI5vmrKEmL4uGbVoqMEpsk2jRiQpgqchH2w8kA2DU6aGqmcCZl5/csaziU7v3lK9JnDwjx41S2qc/Mk04b36/e+VTiF1jb61BcVM5LTOBFa1kbSPwq9Nxd4o1/I/IgeCfnYqogceaJyN197jI/jTu4czMM91QY43yV5Da+oASgorjrI8hCCBA787XYEqBSQ7BJpDiFsBhzZC9eQEHN2xqQgOyk8seGE24N1GeSfbpmqpXtm9vr85q+4sZr5sisEgR28VR/9UznM4i/SH0qAKGYYQrcLLY/NUidnlx0qIJ/r1fwXuAqXjD0vaYvs4lspi0G3PYh9qTN7H
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 527f708c-15ab-4338-adb9-08d757b62699
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 12:40:14.3192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AcMEzcFZFGKSl4Sg+LkKQfMYfuWPzyCUwIKJVUM6H2VjKZT6K7kNKG9O6FB8MZzB/qXC8rq6MUSCYQh/N9HyV2Rt24H8XdTGNN1AjcXnY7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1276
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

Hello Wolfram,

I modified the comment as requested.
I only resent this patch.

Thanks !
Eugen


 drivers/i2c/i2c-core-base.c | 6 ++++++
 include/linux/i2c.h         | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5f6a498..6a5183c 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1656,6 +1656,12 @@ void i2c_parse_fw_timings(struct device *dev, struct=
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
index 1361637..aaf57d9 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -575,6 +575,10 @@ struct i2c_lock_operations {
  * @scl_int_delay_ns: time IP core additionally needs to setup SCL in ns
  * @sda_fall_ns: time SDA signal takes to fall in ns; t(f) in the I2C spec=
ification
  * @sda_hold_ns: time IP core additionally needs to hold SDA in ns
+ * @digital_filter_width_ns: width in ns of spikes on i2c lines that the I=
P core
+ *	digital filter can filter out
+ * @analog_filter_cutoff_freq_hz: threshold frequency for the low pass IP =
core
+ *	analog filter
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

