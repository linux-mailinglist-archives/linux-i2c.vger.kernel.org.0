Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADB8A53B1
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 12:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbfIBKMD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 06:12:03 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:2666 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731233AbfIBKMA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 06:12:00 -0400
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
IronPort-SDR: MS6JKgmzLeev6gGwMsd62lvWN4drsXirWthSX/XXQ1xfSc9U7HtNjNhpl72lyXqwxaamsK4QvM
 RhEh2ti7Mv1NbBbemKngPaWAtoIIFzn+NtPOTBe+f/1bSVow7JcAmG41apnlvthvuyecW/Lo48
 d/Yx/rtKMsrtgMZnTgJn4FSISYIW7TmPzDo/36F6Ivjs32o2GL6c+8Vzns9D3bnas2DTyzWz5F
 uoaMafaAlK0hNU9O0NMyLBsVlWMJx7ewYBM4HqmgNNRU6dkmzxKoDFDkL3qcQ+gLauwVhsohYM
 TPY=
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; 
   d="scan'208";a="47374252"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2019 03:12:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Sep 2019 03:11:59 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 2 Sep 2019 03:11:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHzdgoLDlVo0rtbIG5ZL3VhDePzTubAOTYdDWT77WUMUdnI4aSVPbiUBdx210JgXVxO04Pn8KSBNhgsfCo3aqZFVfC6qy5FoaCAst5NlXOZwaNqhwTuklY/eAvUTvrhixOwo7nNxuUpoLGLv1xQEZilu7/zcZysnIwc9IeI0WlLIbzmStNE8tt5ks33ysohKcokotGe2lLZYiMhWnOV5Fhzhxo/Y1CEBdhTV+g8WVtrFlgla3qhLuoJSPGG8eNXygRpIpwDyXXBwjhg9UE2pFj/VQnBMUwnovW7fQb2XegZvcJEmtd7UTURFARIlamF8qHII1/FjYWJ+qVJWaCiyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5MENNtYd7Nb0C+oVW0i6uVQAnAKpqkec78APXH+wOc=;
 b=lQ6N7wfpnrZ4KcJ/fNjPrHsNuSf5i3or7WfVl9MayoEjukj0gB7yFDTcZcNT3WzpurYMSByTG7xbpiM+gPIfTkN229EDPt9JEaLEEizI0Yiuo0IsL9Fi5k4LC8aFXKpSH2pgY1LKYhPjqglu8miV9HTWBausmmwJjVMnFhcOdHyEDb4YzZIGLXeQOc2YMvgy/Pmis44bTU9HzDDbEPhhAKmMvCqnCqeVzacCaJwkrDD8FssjqiA8aQbaXDfcdW52jgSK8J5HQpdYdu3qvPRFvp5EdFUcrabNExeuIsuGNT2kEl3Ums5Ap5GlqtTSocPuOaRjUKs2KicCfhFHzFkd8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5MENNtYd7Nb0C+oVW0i6uVQAnAKpqkec78APXH+wOc=;
 b=KNObVgjFmJyLNggqIKxyD1PdiMfPr54dW9dx+dxmaXTklisIrZtOqcStyCrxZlBPTf+YpiBVR55d+GrkgAunebXjEz/aS6LY02G9W0eeYtx/BN+fUTvnPAK3vDnEVbq/7B2Qwf/EPfqOnU7nRxX0yFWC5IxbwYvZjTMWr7U8xlg=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0044.namprd11.prod.outlook.com (10.164.155.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16; Mon, 2 Sep 2019 10:11:58 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3%10]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 10:11:58 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v4 1/9] dt-bindings: i2c: at91: add new compatible
Thread-Topic: [PATCH v4 1/9] dt-bindings: i2c: at91: add new compatible
Thread-Index: AQHVYXba4163qYuRcEGO+lSoVX2w/Q==
Date:   Mon, 2 Sep 2019 10:11:58 +0000
Message-ID: <1567418773-2427-2-git-send-email-eugen.hristev@microchip.com>
References: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: dc6129ab-e732-4e7f-20bb-08d72f8dfd0a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB0044;
x-ms-traffictypediagnostic: DM5PR11MB0044:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB004420E69F2BE9BA9D11148BE8BE0@DM5PR11MB0044.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(136003)(39850400004)(346002)(366004)(189003)(199004)(2906002)(66446008)(2201001)(66556008)(66476007)(64756008)(8936002)(305945005)(3846002)(7736002)(66946007)(6512007)(446003)(6116002)(86362001)(36756003)(14444005)(5660300002)(52116002)(2501003)(11346002)(476003)(2616005)(256004)(6486002)(486006)(50226002)(14454004)(386003)(6506007)(53936002)(76176011)(186003)(99286004)(66066001)(81166006)(110136005)(7416002)(4326008)(107886003)(54906003)(4744005)(71190400001)(26005)(102836004)(6436002)(71200400001)(316002)(8676002)(81156014)(478600001)(25786009)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0044;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qgvDbvLKK3kzfBLj+B13rD1ohnOhHiOSNKVulyetX2Kkk9Jf8VnM1ybaR8cbWQzRXt3BopxhBihGUARlerDXy+fXCHtFas8FNx5t8mT9GibQPY2gTiKHyOy9o0bKrz76Rcnd3CTA74GGFOdclbh8Q3o70zysxdlffp44embDqbXb96dwUkmidFAtVItVXxlVHrRZKNqYqc52NtK/C5qSdbNasON8F0bQT6BU1vhBthttMirRY6bQyAbwNpyTCgg0yCdftdwy4XJcv+KUQ1Blv+EbcbuXdZwv11NVsqmX9KiFsX+PJbWYPRxquTbyvVkWmRHptVgbW7qMW7ijljbHwvb3Xg4vPFhO2ChsKnM5IQqDDA2NmmOSupIGCmf0xhCdItmLwDU++HbBewRf2f3nrKvT+IUZIA1EtNS9wOlG0fU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6129ab-e732-4e7f-20bb-08d72f8dfd0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:11:58.0986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YQNl4GOyP6X7Hljys43A5g8Oa7/++beeBWykLYCZdtwwlBt3QmwhaBOGTa+JsmNokX8qCb0peFUjCOXjiEw9JdSIfP6JWuo4L6BPe9prtA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0044
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Add compatible for new Microchip SoC, sam9x60

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 Documentation/devicetree/bindings/i2c/i2c-at91.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-at91.txt b/Documenta=
tion/devicetree/bindings/i2c/i2c-at91.txt
index b7cec17..2210f43 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-at91.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
@@ -3,7 +3,8 @@ I2C for Atmel platforms
 Required properties :
 - compatible : Must be "atmel,at91rm9200-i2c", "atmel,at91sam9261-i2c",
      "atmel,at91sam9260-i2c", "atmel,at91sam9g20-i2c", "atmel,at91sam9g10-=
i2c",
-     "atmel,at91sam9x5-i2c", "atmel,sama5d4-i2c" or "atmel,sama5d2-i2c"
+     "atmel,at91sam9x5-i2c", "atmel,sama5d4-i2c", "atmel,sama5d2-i2c" or
+     "microchip,sam9x60-i2c"
 - reg: physical base address of the controller and length of memory mapped
      region.
 - interrupts: interrupt number to the cpu.
--=20
2.7.4

