Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F095DD6184
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 13:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730300AbfJNLlx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 07:41:53 -0400
Received: from mail-eopbgr80051.outbound.protection.outlook.com ([40.107.8.51]:50188
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730097AbfJNLlx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 07:41:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTgvOHjksyttS4WlJGCy+0cW0SAIV7rcBPNIN6ehRqVZwVsR733rrt+XXm7PnhcnuN3+KqGNmSsGtYTNGZQ3ccSQhB+8D2KR+wZ3OAnIiDtjt5vFi2BzGUEo/QCHnAwkBIx/49TJ4+OTkJ1sjp4WPCZdVbjHfCJziXSKZb0WtMnOmBRiEzkHQ/0PxqWJ9FW5eaDfquwgxZRYrbE/YNzb7UiwUaSCZG8JnRjyfNKqYOiCye25NgfZjRozZ4V0zncdGdF59F/CYw2P5/9chcWMDkZjwQj/Mel4UGsvh2lBD18n+EQDy0LKSVyiklCXepRdKVSkD+rM0M7sCgZq7w5Ziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpQ0ex7Gexb73flNztlZhgJp92i/JtfdchJxgGIlgoM=;
 b=JEojb1MpD7uWcpaRDRMX2JrtRDDSnuW9nlBmFepctH1sqx8IEJS9yU+HCBNY310UudLe+Ww4qRfH8enD/ZrJzMJO/me/wAjRLzrXh+QUDbynMlaNUHv7WzHz3MnirUFa76c0q+COaNovekAEiePQOkOtaE7o1T3vEl9RF6bVzn8XHSPcYFKyLe5+KtLXz2prp5+KXVgLXHSxoB1fhwKn7O2ixN/CvNdYU58Y3TcrlnAZXK0svLFt+q0P223n+lmiIvOqoCzam630XicTfgOhcm9wGZGZLhejTpqDJPG+Sy/QDmk5aqbsbf8VBIpN7WSK9IKA/LidXn29rMX4STNXCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpQ0ex7Gexb73flNztlZhgJp92i/JtfdchJxgGIlgoM=;
 b=M32b82oBL1s0AO+rKTIC1ZVGx4gAtEl68QCbZ+H1hfonFHfAZjmB2Lgoe9YmGLL3TptJjvcwS2rx7aAfZxE80MQ1OWxOoTzmH0oFGibSUqgpApwIx9oeWSmWSUlmOWvK8k+PlTTgUQ+aHl5VfJRk78d539xv121CvBvFfR2WbKw=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5179.eurprd04.prod.outlook.com (20.176.234.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Mon, 14 Oct 2019 11:41:48 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11%7]) with mapi id 15.20.2347.023; Mon, 14 Oct 2019
 11:41:48 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Biwen Li <biwen.li@nxp.com>, "peda@axentia.se" <peda@axentia.se>,
        Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: i2c: replace property
 i2c-mux-idle-disconnect
Thread-Topic: [PATCH 1/2] dt-bindings: i2c: replace property
 i2c-mux-idle-disconnect
Thread-Index: AQHVgoOwZ96O8ZHg3EmhfguQXwsY4adaAvCw
Date:   Mon, 14 Oct 2019 11:41:48 +0000
Message-ID: <DB7PR04MB44906CD36066595307E7848C8F900@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20191014112558.3881-1-biwen.li@nxp.com>
In-Reply-To: <20191014112558.3881-1-biwen.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8dc5766-533b-484c-0e0c-08d7509b7f9e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DB7PR04MB5179:|DB7PR04MB5179:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5179A7BAC004CBFB8798683C8F900@DB7PR04MB5179.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(199004)(189003)(7696005)(102836004)(6506007)(186003)(76176011)(26005)(11346002)(446003)(256004)(476003)(486006)(44832011)(71190400001)(71200400001)(2906002)(3846002)(6116002)(66066001)(25786009)(14454004)(99286004)(7736002)(305945005)(74316002)(966005)(478600001)(2501003)(6436002)(54906003)(66946007)(76116006)(66476007)(66556008)(64756008)(66446008)(4326008)(316002)(110136005)(9686003)(6306002)(8936002)(229853002)(55016002)(6246003)(33656002)(8676002)(81156014)(81166006)(5660300002)(52536014)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5179;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IfmxJLOhqWX2tigvCIBdS6Zw0szEaxtJrlZ7WqGqr3oHxy/ZKZ3XaUlBPsidtTARYoKg2herTC2YaLCpoDoyF+JsL/jA7pIQqwOgR/nNsKBYOiXgLTZibFI99AVdsn8wc/FV45lacy+1Rqu8S1BGbTGVMy3WWdtJ3cPwjvbdH78DfJRW1aiSACCiYjwc2fD882SGKjNQAUz2OzO5kg43M1Me+ve6j1XerS8EREfP1z/gxq9ncVZ7URGrubqVTKQbskTh9LuvKqJ6y3IOMeS05p+D+j+m4y9wn2rDx9Gz/Fn+gQm68C9g+1yZbZc5A6XLJVgqUDWyRww56cHhKqD3ZQ0K1Gjx7j+QrPLgfa62oRHBFvXbmlZSy9WTPvWML9WkE6qenkfuU5TPfb9Xk2YXkXFH371i+bCh/5dQTL70KaphRud39VExn4waPViBg2ahRveWA/dZWqeYpZm964C3nA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8dc5766-533b-484c-0e0c-08d7509b7f9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 11:41:48.6532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hyYCe9KoBOwEWsSayQgFKzFukjdPiqFHI+6J1QSDDYiGqjF9y3fG2LP6ZZs7lKdto3xBdHjU1ZNqqoD6hGuAAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5179
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter, Rob

This patch is a new method for https://lore.kernel.org/patchwork/patch/1132=
445/

Best Regards,
Biwen Li
>=20
> This replaces property i2c-mux-idle-disconnect with idle-state
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> index 30ac6a60f041..f2db517b1635 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> @@ -25,9 +25,7 @@ Required Properties:
>  Optional Properties:
>=20
>    - reset-gpios: Reference to the GPIO connected to the reset input.
> -  - i2c-mux-idle-disconnect: Boolean; if defined, forces mux to disconne=
ct
> all
> -    children in idle state. This is necessary for example, if there are =
several
> -    multiplexers on the bus and the devices behind them use same I2C
> addresses.
> +  - idle-state: Please refer to
> Documentation/devicetree/bindings/mux/mux-controller.txt
>    - interrupts: Interrupt mapping for IRQ.
>    - interrupt-controller: Marks the device node as an interrupt controll=
er.
>    - #interrupt-cells : Should be two.
> --
> 2.17.1

