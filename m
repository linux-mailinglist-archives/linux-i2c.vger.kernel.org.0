Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C75D10E73B
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2019 09:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbfLBI4m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Dec 2019 03:56:42 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:39939 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfLBI4l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Dec 2019 03:56:41 -0500
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: wX7/myD9BspXjK2YatdN9Ak23mGCYxFdeLlbS0MPB+3fwzlvQw3Y0JZqA2E9m7QIilOgbj+cGS
 FWBUsCy5rMg/NQXA/vhOPsXVpopQWY9y5RGaCVZ4lP+Lg+SU+Ma76shz2oa2ychc4ZsYCdUhM7
 u5CXmlYqTFKXVwpq5EU5v6Dn7xoCZZZOy6zQC8w7Rj0dC+435Bt7xRJyxTGj1CLz89jlBSSHZy
 II9YfMyapthlUqwdMqpsLLGskvM2PjEFuLUaYEc7jcws89zULzdl+ButbfsJvoKUP7QhCJX76O
 ZWk=
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; 
   d="scan'208";a="58938682"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Dec 2019 01:56:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Dec 2019 01:56:39 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 2 Dec 2019 01:56:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncB/UEV5U9Fxn2/jRwZviKW6r5HMVMsnWRL7T2RqJBJYjKdII0dxymXBaMLUHh4Zxx5jh2+3bPAXlcNrqktdz5HDR/Y+RyRHmUX7nEDgwFQjCx2y6z3etTtb8moJ55YH5uT04zJfyEfZaxLBlpqp0NyR1I6uRHsS74rRkc4xazFREXYdZvABE0NdGctp1/8WK0Fimx1W1v85uKnU8ZxtAtAie2TkiND/OwCl8Fjce/DPy9d9G6Jxbx3t5X0yr9kyBF3wnUNyCqfSqy3CruYqkyb98iGb1hkK2mWmdGorWurAjLEVUvdzEKBTGQwLqAkppTr6VIV9aAN7x6lMwPCMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+R/eq0F7tjnv8cy7AgGNyN1b2SJbWt7lmHnv9/qlCg=;
 b=ZqsxvWpdo7b3RvdAE+14ZfRVOzQiUmBMC1m+mxPpPVBjWmQEJxoGT2kxJS4H8Uw8sa8XtLDxQb/OznIRpuITPK/IMrTCm9g+OzZN/Onzu46nhOjVgqfdSlDKJN7H5QTy5LzjNNpVBisf9D6H5iSoeYv75yspWf5RxplpCRQ+WdbDFcLDwGBsBdpBZB4PMeO1r81CUch8E14/y3rc4M0bjKO1+C0H0DAI0crS/ku27Pjmy09rmBnQTxGDrAw6FZAgZ26EG3U8zSR8MoafoOnsbFRUvAad1SZKBVwPvkCviiz3KzIn7aFWiOerfmXLNYB1+NZe/AEgt4iXJAdoc9CAmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+R/eq0F7tjnv8cy7AgGNyN1b2SJbWt7lmHnv9/qlCg=;
 b=a4xoPvKSJ4K8KFlMnqRgfRx37r1rXYn3Ji0sE67YVo/SfhXdlbtP9YQWaXW6LDIc6bjG4PZsVFxH3eSG5D3/ATzV9AlNQ8Lv0WVsPi74uMd8iB2zZPp0ssmZrdLNGAVaDRQvErZXP1ZGrDHbWojLHc7bOF7M8B8//iuUV7tbA5U=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1482.namprd11.prod.outlook.com (10.172.34.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Mon, 2 Dec 2019 08:56:38 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1%12]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 08:56:38 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <Ludovic.Desroches@microchip.com>,
        <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <peda@axentia.se>
CC:     <Codrin.Ciubotariu@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <Eugen.Hristev@microchip.com>
Subject: [PATCH 2/3] i2c: at91: fix clk_offset for sama5d2
Thread-Topic: [PATCH 2/3] i2c: at91: fix clk_offset for sama5d2
Thread-Index: AQHVqO5ogpl24eM/bUmDmlYqF1dFRA==
Date:   Mon, 2 Dec 2019 08:56:38 +0000
Message-ID: <1575276957-5615-2-git-send-email-eugen.hristev@microchip.com>
References: <1575276957-5615-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1575276957-5615-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0037.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::14) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed2d21e4-b889-42e7-dae3-08d777058acf
x-ms-traffictypediagnostic: DM5PR11MB1482:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB148243019CBBA53DA364F5B6E8430@DM5PR11MB1482.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39860400002)(136003)(346002)(396003)(376002)(199004)(189003)(14454004)(305945005)(2906002)(6512007)(4326008)(54906003)(110136005)(4744005)(316002)(71190400001)(71200400001)(76176011)(5660300002)(6436002)(6486002)(2501003)(256004)(2201001)(36756003)(11346002)(386003)(6506007)(446003)(102836004)(52116002)(2616005)(186003)(26005)(7736002)(86362001)(81156014)(50226002)(8676002)(8936002)(107886003)(14444005)(25786009)(6116002)(81166006)(66556008)(66476007)(66446008)(64756008)(66946007)(99286004)(66066001)(478600001)(3846002)(138113003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1482;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rXAAzhCprj/i3LcjDzj+NRvoeJJN4STkvqBwGB8UUZbTpSKLhWP6ZoaVKdLRTEwCivvt+wVAE5wuHYiKu0RtFPwHXHs5lctgKlcvLw+owmnxFUZ1jtKwp2bNfHZGwuWGWXLq1ugGq1nqkLD40v/V+rYjulJhSHyTVPUQceMu7qZxdrZyWw01HQWrjklDqe9o43oTQlqrB/Ia47+ch00s45QRip7BCZm6QtV/stVTbaMAs2OPQVAYq7rcA2HatB3TzhvVHdg9m56yPTGeBVNZKMkRiTGaoydD7gGLYyNCkH6orbAVLtZSbQvtn7ulJLgAN2fqzgA/QoBFMYIE7MYgDnVka72r7Psfd7I8zkdHZHuvdpD/27TSlSaKM+h+2wP5vSojXiWDlH2RyLYv2qiw+lwMiQxD4uWj7/tgcs7eF8+f8v8VivVIJensO6ORXjAW
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2d21e4-b889-42e7-dae3-08d777058acf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 08:56:38.6952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mafY0Cbw0Z67XKHnlQKPx5asFHl11rJuG7My8SA9d5lZChI5DOjy3jfEShlICionSnywRO7JIOCwO+HFzc2OaHgSBvkKWjUHHu34hiakqgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1482
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

In SAM9X60 datasheet, FLEX_TWI_CWGR register rescription mentions clock
offset of 3 cycles (compared to 4 in eg. SAMA5D3).
This is the same offset as in SAMA5D2.

Fixes: b00277923743 ("i2c: at91: add new platform support for sam9x60")
Suggested-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/i2c/busses/i2c-at91-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at=
91-core.c
index e13af48..5137e62 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -174,7 +174,7 @@ static struct at91_twi_pdata sama5d2_config =3D {
=20
 static struct at91_twi_pdata sam9x60_config =3D {
 	.clk_max_div =3D 7,
-	.clk_offset =3D 4,
+	.clk_offset =3D 3,
 	.has_unre_flag =3D true,
 	.has_alt_cmd =3D true,
 	.has_hold_field =3D true,
--=20
2.7.4

