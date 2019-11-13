Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBC3FB16C
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2019 14:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfKMNgv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Nov 2019 08:36:51 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:22999 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbfKMNgv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Nov 2019 08:36:51 -0500
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: iVXAs6rwQfsywuSktJa+/3r+IXq1XmHx6IEtakVd9e/nqRkeniyLTCzFHg4lHSV83lfta6f1aR
 WLV1hc5v4ZxftGhQRIR75RBOmGzqHvHxwlunG6DjVGZo7/qWsdflZDdmr27Iio70sK2lYAor3I
 gFk98WQ2bRFD3POfj4+yRD2imkmoCcuKbOxEb+M3q35JhEiM9hO8RBJc+PpEbreROXwLp0+okm
 aFYW4QgLqnrXRBmWMTz1KvMDXTf7MapbUNRPuhk1LHjm3D5HQxmQmraQ1SD1yAe7Sj3iKXlHGQ
 eZE=
X-IronPort-AV: E=Sophos;i="5.68,300,1569308400"; 
   d="scan'208";a="58228531"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Nov 2019 06:35:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 Nov 2019 06:35:13 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 13 Nov 2019 06:35:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc63qNC8pNtV5XMgg4QeKtgYixa0NKpuiuTgUE7vquN4yGQtZ0TYhab1VIW54vpNCxDcuqQTmpOUJkex4NBY312CgPqZYfaZweu6VgNM6/BiRP67zwLaqINo6Vp7ahux31mgYj2wXpWB3fl6Je3UrVbeJEwOcl5uUXqjTB2jmfqszSVIHiB/YoX793Oy80PKZ19cZCAYkWFpjHpZuQEo6yXkBgzwvLD+/7WrHjASuOKSBIXWaLqzpM9WBi3L/QZFFrAtEsqouuWEhsca8x0VBdvQRS8F60k14lUW5ESS9PIKWQUINXzaKepDSj3UOyvIoiD82daOxYJ85Suga1wY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44y6lIFSw3GfoHrWMrvldRM/LtwQqfl3UWmHIMlhBMQ=;
 b=kGnWr44alPuPWUkGEsWeH/qA1Kn4V63vAhNODSt3yKErBPIj8h8oSw4GWviZrs9+IZ59sqPImoEffYeTQht89BlELfdnoF6E8ofA2ojrSl+0/MT2EJ7HGIN2YyJpMJVKj4ZGZ5GP3e23NlDzRlYcphaXSN3gytQwGHhBjBz/yKSZ/9/VLJr9pmF5O8B5d6bi849GfWdS5v73VNAaZp2CynbJ7IYgt+D+6jOw4HbfQ48TOChVkaEapZSLvxJSqtAUpAet21jmP8knrEcf9MG8wGpKBO9yIIuZuPxVth2E7cPKndxsXuxHGb9O8Yr51yzb14Wjp8XFVdzV9X+ROhyPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44y6lIFSw3GfoHrWMrvldRM/LtwQqfl3UWmHIMlhBMQ=;
 b=TYWqB1tVF9R+AtHZsgcnSE9/Ms8+NXnEYgNk4kxlH9ORnACggpvTH+jYLR4YxNdGg/ZmUqOFqsGlTGj/guYkm/dPBLQyuxUmGel8XcK/pp6JdsJf75TDRHSB4SyRs4WUsdxY+VROoU4WBsmgEUgmbpV6M8ldxN6M54aY9VNasDY=
Received: from BY5PR11MB3895.namprd11.prod.outlook.com (10.255.162.149) by
 BY5PR11MB4338.namprd11.prod.outlook.com (52.132.254.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Wed, 13 Nov 2019 13:35:11 +0000
Received: from BY5PR11MB3895.namprd11.prod.outlook.com
 ([fe80::ac5c:4f74:3892:4787]) by BY5PR11MB3895.namprd11.prod.outlook.com
 ([fe80::ac5c:4f74:3892:4787%7]) with mapi id 15.20.2430.027; Wed, 13 Nov 2019
 13:35:10 +0000
From:   <Ludovic.Desroches@microchip.com>
To:     <peter.ujfalusi@ti.com>
CC:     <agross@kernel.org>, <wsa+renesas@sang-engineering.com>,
        <ldewangan@nvidia.com>, <vkoul@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <digetx@gmail.com>,
        <linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/4] i2c: at91: Use dma_request_chan() directly for
 channel request
Thread-Topic: [PATCH 1/4] i2c: at91: Use dma_request_chan() directly for
 channel request
Thread-Index: AQHVmgPE20YkN2IBi0WfRMb9U65SKqeJGkAA
Date:   Wed, 13 Nov 2019 13:35:10 +0000
Message-ID: <20191113133458.co7ygdb2wsjvdsbl@M43218.corp.atmel.com>
References: <20191113092235.30440-1-peter.ujfalusi@ti.com>
 <20191113092235.30440-2-peter.ujfalusi@ti.com>
In-Reply-To: <20191113092235.30440-2-peter.ujfalusi@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR1PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::37) To BY5PR11MB3895.namprd11.prod.outlook.com
 (2603:10b6:a03:18e::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [213.41.198.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fac4da1-ee9b-4838-19d3-08d7683e4e3e
x-ms-traffictypediagnostic: BY5PR11MB4338:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4338C8971E99B089C39A9351EF760@BY5PR11MB4338.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:281;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(346002)(376002)(396003)(136003)(39860400002)(189003)(199004)(25786009)(9686003)(71200400001)(102836004)(71190400001)(52116002)(66066001)(478600001)(76176011)(81156014)(4326008)(256004)(14444005)(11346002)(476003)(64756008)(446003)(8676002)(66476007)(26005)(486006)(6512007)(5660300002)(186003)(14454004)(6246003)(8936002)(66946007)(7416002)(66556008)(66446008)(3846002)(6116002)(316002)(7736002)(54906003)(229853002)(86362001)(99286004)(2906002)(6486002)(6916009)(6506007)(386003)(81166006)(6436002)(1076003)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB4338;H:BY5PR11MB3895.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cx5jQH+Mxj4JFGNvq7/Am3vy5FpZy1wtExRBHc6wPUObhNmsHnCGiiG/B6GX3LtMxD7cJrntTKZHQHOs6/cAlq+QQEEZTxv1/DPoqZc0aAEhyq7/vq0uT0C2kCiAOxklVXIXT74OJPTaB7MhAoWAdGhEXLGZK+DOXwpRBkOfyDeRHyVjwy7YI8zmu9ljwkqHKFDdq/TTZDq0+EbC9j+N2X2Zz42qhXdBge1BrvkG/V1WHIMK/EI3CfQNa5YCMwUcqssMR5cGPRjeYPUASuI3INkS7fFWJ8Pdbj2VkcqGLtjLTLwrAWP6gP8NB8b3zvkyQrcr7PInf5X4i0+x7SmFQZJWdPfmVhmlDY9y+bUqagz3XA459GyqoB7V8hCenfrf7Mo2i/9hYYwMR56feBpVI3qqCsld7r8ccKD/iQD/n3UYpcSeq2+VmspSbJWTYPQ/
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EFF23070F9667B4CB36A78FFEEEBA31D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fac4da1-ee9b-4838-19d3-08d7683e4e3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 13:35:10.7787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: miNit12MhHMT5xljRNHbnXe680cqgszrQ2dtlPNKJ32e+O89e5sNfzVggvm47oxKpN9wgLJxgs1U0WF4DpvGuyJAb/bwd5y1UcwkzNVwi4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4338
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 13, 2019 at 11:22:32AM +0200, Peter Ujfalusi wrote:
>=20
> dma_request_slave_channel_reason() is:
> #define dma_request_slave_channel_reason(dev, name) \
> 	dma_request_chan(dev, name)
>=20
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>=20

Thanks
> ---
>  drivers/i2c/busses/i2c-at91-master.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2=
c-at91-master.c
> index 6e0b554dcd4e..7a862e00b475 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
> @@ -758,14 +758,14 @@ static int at91_twi_configure_dma(struct at91_twi_d=
ev *dev, u32 phy_addr)
>  	slave_config.dst_maxburst =3D 1;
>  	slave_config.device_fc =3D false;
> =20
> -	dma->chan_tx =3D dma_request_slave_channel_reason(dev->dev, "tx");
> +	dma->chan_tx =3D dma_request_chan(dev->dev, "tx");
>  	if (IS_ERR(dma->chan_tx)) {
>  		ret =3D PTR_ERR(dma->chan_tx);
>  		dma->chan_tx =3D NULL;
>  		goto error;
>  	}
> =20
> -	dma->chan_rx =3D dma_request_slave_channel_reason(dev->dev, "rx");
> +	dma->chan_rx =3D dma_request_chan(dev->dev, "rx");
>  	if (IS_ERR(dma->chan_rx)) {
>  		ret =3D PTR_ERR(dma->chan_rx);
>  		dma->chan_rx =3D NULL;
> --=20
> Peter
>=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20
>=20
