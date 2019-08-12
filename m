Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE0889600
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 06:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbfHLEWI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 00:22:08 -0400
Received: from mail-eopbgr80047.outbound.protection.outlook.com ([40.107.8.47]:48389
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725808AbfHLEWH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Aug 2019 00:22:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJPR/Iprftl0Hzn4iRkXSABnt+q6ldrH8Cyj8AcKdAM1O850iWbhzeN0GRcXmLGwqtm+Krt4hy+MDbY31qjOiP+SWq1vu/IUsnPLg9YIxFFqEtDIQc/0ooenkmjiglRAxyoTkhYU+PGKdngpXedgAMosKwVsfsK51+tou2r/lDWBld8zHNyqMzV+FRTxBUpUQpgj01A9fLKNX81G45ncAwIiIA/QUMlqsn9Q0CUuUkCCcp4jOR2J6x9RH/kqf7Pv99rnisWhgCeIUYLttKxlguGmYxy/QcH/+p7y6FESD1Sr9SoPzsR0IBkQ3CINrxqG7I5qiHtkNKpv/KIGvpSo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsUeZjdA1z7V5yP7VwtYCbnE0+ZJa3q+KpMnCwx0Haw=;
 b=HwkdOxvwcHrlQJ0e45rxV6fNn5mKY7CkqE3jBB1MbPtd1ykXzfCN4IQcjcrfQI2dFGYNyUSlTr+3Hv/O20Q81hIIvKNOg9lJcUrFqUM4vR3gdhnBry2JnTOAwrfbIIwG0XeQ6O0vVZ5kezBmgbMsrfnuL8NeudPcYZkbx6zAxdFLPe09cPYUvNmcflhxwFRgiI8T1UXNVHQTI/raSYeAA9OBCtSeW8C8F+9/jC7M2XpzQPw9fxQLwPcm2qE6ZqKm6y7v/IUNI7fDUa4Lq3fj6vkPYeNw3Wgz7vnJRgm86Ry37db6YZTa5MGzIZr9N7LVMtp6dT2DBPtkzkWroGyb5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsUeZjdA1z7V5yP7VwtYCbnE0+ZJa3q+KpMnCwx0Haw=;
 b=gJMeUqz2YuexvozcwNHKwd7RhPPRrlQHBLWuHAfppy5/HLrSk2zNYwjnK/KqyKpFmKVTj1RqwYB3G5R+osk8Ul+0T8a0PjtM94oc9tA1RujPwLh3nkoaBj/io09Rg2vMACV7YToAd1xZj4rA2vFVyvZdq9c4epxhshzm7IZpjR4=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5515.eurprd04.prod.outlook.com (20.178.106.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Mon, 12 Aug 2019 04:22:03 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::ccc8:8:c071:8283]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::ccc8:8:c071:8283%5]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 04:22:03 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Leo Li <leoyang.li@nxp.com>
CC:     Joshua Frkuska <joshua_frkuska@mentor.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: RE: [EXT] Re: i2c: imx: support slave mode for imx I2C driver
Thread-Topic: [EXT] Re: i2c: imx: support slave mode for imx I2C driver
Thread-Index: AQHVTZ48m9LP8x07tUuNIj/REJ9fGqbxrQ0AgAB2tSCAAMoxgIAD/bIQ
Date:   Mon, 12 Aug 2019 04:22:03 +0000
Message-ID: <DB7PR04MB44909B080A8C8D53416F34058FD30@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190808035343.34120-1-biwen.li@nxp.com>
 <20190808200202.GA6609@ninjato>
 <VI1PR04MB4495EA1A44120654B494EB3D8FD60@VI1PR04MB4495.eurprd04.prod.outlook.com>
 <20190809151035.GB5099@ninjato>
In-Reply-To: <20190809151035.GB5099@ninjato>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5889917-5d7b-4685-2c8f-08d71edca096
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB5515;
x-ms-traffictypediagnostic: DB7PR04MB5515:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5515D9DDB6C12E4F0906E8438FD30@DB7PR04MB5515.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(189003)(199004)(53936002)(74316002)(6636002)(4326008)(33656002)(2906002)(25786009)(229853002)(8936002)(6246003)(5660300002)(4744005)(52536014)(66066001)(256004)(14444005)(14454004)(71190400001)(71200400001)(966005)(8676002)(81156014)(81166006)(6116002)(478600001)(7736002)(86362001)(305945005)(55016002)(66946007)(66476007)(66556008)(64756008)(99286004)(11346002)(6306002)(76116006)(66446008)(26005)(7696005)(6506007)(110136005)(186003)(54906003)(476003)(102836004)(9686003)(486006)(76176011)(316002)(44832011)(6436002)(446003)(3846002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5515;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kgIBb5+Cr23OIGg3EeZUGIxIG6ON+fB0KvZkhkxcNjVWDwpU4Ie3ZkMYO4bPYYNhYJCNY2KsqL67+cIs/+3txhQksiuHttFG3yhzCtMhvCtySjh0z44KxD5Xh2TCZYex7MG27+GQ7n94rLWMRqfViVhQu59FatZQiVUNHJNlyIP//yKFaneNW3yzVzkjzq3vup2nWlIqioNvDBlOlbBM6VdyiDFpDizp0l5Cvav3ourxUa30Lwjay5W/DzS7RpuVcfrjWZ0anum2BRW3gobiNZfe/fe1qNbo+hO97dukZGtLr+3ratykG9VioudoDuC1gFlxDV4P7JpBH75UjlX6+W7f23D/2+pRM6IxsnHyBmk3DcVNgJCLsUmHN5dLa6uvbkz0Nd4COBK4326mn0tMABC+aFWPFokSr23ELEqrmZg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5889917-5d7b-4685-2c8f-08d71edca096
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 04:22:03.1279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: opi5C0tfeAe7q/l/XiNjsRSNZquJLLrjUcQxw9jFozQsczhfosFVrFFPqjNfS21aDEcu8neQiEDQF17Q3rPOTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5515
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> On Fri, Aug 09, 2019 at 03:18:01AM +0000, Biwen Li wrote:
> > > > The patch supports slave mode for imx I2C driver
> > > >
> > > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > >
> > > Wow, this is much simpler than the other approach flying around:
> > >
> > > http://patchwork.ozlabs.org/patch/1124048/
> > >
> > > Can this one be master and slave on the same bus, too?
> > At the same time, the same bus is in master mode or slave mode.
>=20
> So, can someone kindly point out the key differences to me?
The I2C module cannot be a master and a slave simultaneously.
Such as: if the i2c module is used in slave mode with command
'echo slave-24c02 0x64 > /sys/bus/i2c/devices/i2c-0/new_device',
At the mean time, you cannot do master operations(i2cset/i2cget).=20
You can switch mode from slave to master with command 'echo 0x64
 > /sys/bus/i2c/devices/i2c-0/delete_device', then you can do master
operations.

Adding Leo to this version too.
