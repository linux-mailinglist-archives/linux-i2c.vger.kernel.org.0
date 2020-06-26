Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A7F20B12A
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jun 2020 14:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbgFZMNT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Jun 2020 08:13:19 -0400
Received: from mail-bn7nam10on2065.outbound.protection.outlook.com ([40.107.92.65]:4805
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727977AbgFZMNT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Jun 2020 08:13:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuQFnHD8kEoGMzZybAx5wKVBitpxh/+vJRKS6rXbyu2YhwwNk1FEo4I94+HvIsJ21GzMJk2McqWQu9RDcQatzRnxjwydIRABRAjdj5yJ7SjMw2Irf8bRtugwhF6jzSB1Ezv0e2P4NXrqGKRp6ybXlKTIS2yWoJ/NHSSQ17px/xOmec5stiDn3l2RwHGKNt6MizUWzsJjFx0umQnQkS0Zvu0PUbvmNO7adXJbxDl7OdidyScwWU6lWhgct7JYV2CeVg02usGqLJXRo71UhaVfuBCmUzyyeVK+bLKc1WnNmQV6yUNsN+hxQXEmm4J6QmowcUJ0SaS+wwZCeNKAhNq/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ctZb8McIWzbVGfNNOZrfAHmzTsJW9N+U80yOp97PhE=;
 b=JuCujWpmgv2MQj1+6OqpLgd/Jjbtzh1wdQnUbe4bV+b8eMh0+CORoKuTXDXUO9nSukIU6MBcCqQCkAHh9Rq4Ku3OXvtPhPJVQv4Hc2EP+0cUDFQ4LIiyhjZaABBkdh9NHh3qDGtX80ll9OSkDRiki8SA7beHCxFoWR053TXz3PYsG8IJwaVGTur5RADdcy25GedsGToBYJhp/LPh77/nWyaanQuaCsyaFQdUV+rdrj6wpZQieOysIrbR/a9MlPU1hIV40FM6hxSQVMf0xoMj59fHGWVTBphLmKSpjZ073+KKxHJVnqaSDt7gG+PfikDmBaKfEfy3LuAyDAapzr3eaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ctZb8McIWzbVGfNNOZrfAHmzTsJW9N+U80yOp97PhE=;
 b=QcGugtr4BhXMXUEgqc66nXvIUupcEytdPWq2hiO8H+BnksCyJlk+AOfSnlOwBOVAnOpm1TsuoQDLcAIxVuDrxIWKFgzxBkcSXIY4AUzVfEf5AHtXGWkDGWaAd9JjbPtsOFbgFJhhE7/XzHoszDLcxaiXWiC+L//A6YzqnDFmU5s=
Received: from MWHPR0201MB3484.namprd02.prod.outlook.com
 (2603:10b6:301:77::36) by MW2PR02MB3753.namprd02.prod.outlook.com
 (2603:10b6:907:f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 12:13:15 +0000
Received: from MWHPR0201MB3484.namprd02.prod.outlook.com
 ([fe80::f487:3551:25a3:f0a1]) by MWHPR0201MB3484.namprd02.prod.outlook.com
 ([fe80::f487:3551:25a3:f0a1%7]) with mapi id 15.20.3131.021; Fri, 26 Jun 2020
 12:13:15 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
Thread-Topic: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
Thread-Index: AQHWQZR25/MIEeDZnk+rxvX2lvEMMajqhKAA
Date:   Fri, 26 Jun 2020 12:13:15 +0000
Message-ID: <MWHPR0201MB3484A9A018788EA755645D2DCA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-2-marex@denx.de>
In-Reply-To: <20200613150751.114595-2-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ae671944-b666-4f24-bf4b-08d819ca4e3d
x-ms-traffictypediagnostic: MW2PR02MB3753:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR02MB37531A8D5A026778472DC088CA930@MW2PR02MB3753.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:605;
x-forefront-prvs: 0446F0FCE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aguwDMV9+9sS9WnpXU0k6obIjEwGsyn/Lv/8I77gXvLR2MhWJ0t5tXSbG8cT4wFrMy09r1PGZKAMiGOOgJPr7jTxHbcpKAQ7L3TA7xTkKxp9AmjXF/qmtYGaps9XkyXLXD4pLpM2L2OtOOwNApOKltrIFDwU4zfuOkXiPqEOJ6/cAo35wK2YrEFHU0xS0J/9l60zkR7mSFxdq5mbtBwBkQnX15nVSpy2tM1dyMfarcf4rQ/0InD3z5sTSLRUeJT6AfnVdc9EKnU1Mkx2KInJJZG8TZQ8QZlu8DyxBMrzVCPeL8Ddfp21aCPkUPMdNFjlsxkT3Q98HziYnDEpOuzQQQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR0201MB3484.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(396003)(39860400002)(110136005)(54906003)(478600001)(6506007)(9686003)(86362001)(7696005)(2906002)(55016002)(53546011)(71200400001)(316002)(186003)(4326008)(26005)(8676002)(76116006)(8936002)(66556008)(83380400001)(33656002)(64756008)(66476007)(5660300002)(66446008)(66946007)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: KP36NM9laoerGSXxg5YqYQwNTzeUXuwSpVBQd99aQdSY0ABlrFDStCiYf9xnKX6nAbHHTiIfVQ8n3GEm2IfRPVnn9XHtrmG2P0+a9cFKPQyyAlvcXWYy99fgfBVKAOydFehZCY+qn+1AFQ2qgxq3KRYQgYDrrUg0eW3WmDK+mJfWK5d7CAq45UyOxoHNBpavfUsnLu6tqlWmYzMbsF1x8SbImMyHzGg4i6w7zPm+HQy8vGd/wAA+AVvKQOvPDGMNy3+M4aqsqmMowF2RgBSKGUIhJCIZnje7ecGE67eDhxq+ONP2phDmaIG15J54euAY6PtV0LozcAyM3YQmpaW8kjkM7ZycyKwMyHCN/eMX8Hekesj/pJ5zroROxvScY/+Hp9LdE4JrJhl1wfYBNGAFDCtPSXPu6SxXr8F4QQfn4nUfEesaCrBrj+B3+VNLoj5FjYAej/ML9KXBwYUV5IanVnidC/LyZuz277w4xeKlYHAsEUb8wMMpy+7ndhBKPqE/
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3484.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae671944-b666-4f24-bf4b-08d819ca4e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2020 12:13:15.7374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSBgrKLrQrlQrCB+XLjIqQMsJyIfGEt5M1dFUdRD08Mub6aqFtKIxj1GMYpchrcn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3753
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: linux-i2c-owner@vger.kernel.org <linux-i2c-owner@vger.kernel.org> O=
n
> Behalf Of Marek Vasut
> Sent: Saturday, June 13, 2020 8:38 PM
> To: linux-i2c@vger.kernel.org
> Cc: Marek Vasut <marex@denx.de>; Michal Simek <michals@xilinx.com>;
> Shubhrajyoti Datta <shubhraj@xilinx.com>; Wolfram Sang <wsa@kernel.org>
> Subject: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
>=20
> The interrupt handler is missing locking when reading out registers and i=
s
> racing with other threads which might access the driver. Drop it altogeth=
er, so
> that the threaded interrupt is always executed, as that one is already se=
rialized
> by the driver mutex. This also allows dropping
> local_irq_save()/local_irq_restore() in xiic_start_recv().
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Cc: Wolfram Sang <wsa@kernel.org>
> ---
>  drivers/i2c/busses/i2c-xiic.c | 25 +------------------------
>  1 file changed, 1 insertion(+), 24 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.=
c index
> 0777e577720db..6db71c0fb6583 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -543,7 +543,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)  {
>  	u8 rx_watermark;
>  	struct i2c_msg *msg =3D i2c->rx_msg =3D i2c->tx_msg;
> -	unsigned long flags;
>=20
>  	/* Clear and enable Rx full interrupt. */
>  	xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
> XIIC_INTR_TX_ERROR_MASK); @@ -559,7 +558,6 @@ static void
> xiic_start_recv(struct xiic_i2c *i2c)
>  		rx_watermark =3D IIC_RX_FIFO_DEPTH;
>  	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rx_watermark - 1);
>=20
> -	local_irq_save(flags);

It is added as part of (i2c: xiic: Make the start and the byte count write =
atomic - ae7304c3ea28a3ba47a7a8312c76c654ef24967e) commit
to make the below 2 register writes atomic so that the controller doesn't p=
roduce a wrong transaction. (If there is a delay between the 2 register
writes, controller is messing up with the transaction). It is not intended =
for locking between this function and isr. So, this can't be removed.=20

>  	if (!(msg->flags & I2C_M_NOSTART))
>  		/* write the address */
>  		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, @@ -569,7 +567,6
> @@ static void xiic_start_recv(struct xiic_i2c *i2c)
>=20
>  	xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
>  		msg->len | ((i2c->nmsgs =3D=3D 1) ? XIIC_TX_DYN_STOP_MASK :
> 0));
> -	local_irq_restore(flags);
>=20
>  	if (i2c->nmsgs =3D=3D 1)
>  		/* very last, enable bus not busy as well */ @@ -609,26 +606,6
> @@ static void xiic_start_send(struct xiic_i2c *i2c)
>  		XIIC_INTR_BNB_MASK);
>  }
>=20
> -static irqreturn_t xiic_isr(int irq, void *dev_id) -{
> -	struct xiic_i2c *i2c =3D dev_id;
> -	u32 pend, isr, ier;
> -	irqreturn_t ret =3D IRQ_NONE;
> -	/* Do not processes a devices interrupts if the device has no
> -	 * interrupts pending
> -	 */
> -
> -	dev_dbg(i2c->adap.dev.parent, "%s entry\n", __func__);
> -
> -	isr =3D xiic_getreg32(i2c, XIIC_IISR_OFFSET);
> -	ier =3D xiic_getreg32(i2c, XIIC_IIER_OFFSET);
> -	pend =3D isr & ier;
> -	if (pend)
> -		ret =3D IRQ_WAKE_THREAD;
> -
> -	return ret;
> -}
> -
>  static void __xiic_start_xfer(struct xiic_i2c *i2c)  {
>  	int first =3D 1;
> @@ -807,7 +784,7 @@ static int xiic_i2c_probe(struct platform_device *pde=
v)
>  	pm_runtime_use_autosuspend(i2c->dev);
>  	pm_runtime_set_active(i2c->dev);
>  	pm_runtime_enable(i2c->dev);
> -	ret =3D devm_request_threaded_irq(&pdev->dev, irq, xiic_isr,
> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
>  					xiic_process, IRQF_ONESHOT,
>  					pdev->name, i2c);
>=20
Removal of isr is fine.

Raviteja N

