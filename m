Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7893420B12F
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jun 2020 14:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgFZMOZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Jun 2020 08:14:25 -0400
Received: from mail-bn7nam10on2067.outbound.protection.outlook.com ([40.107.92.67]:6081
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727977AbgFZMOY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Jun 2020 08:14:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhuZFK0oXqSYNb8ulaDluaRaVV7pzYTJ36g+gbs2HcUeEnnHWMwBvffO9wOUcpzuCXUDLr6xkZCyFTpBJn3Av2GPSiyY7H0gyj0TBie/tJDEz0xIcC4Xq1lct0+P0cMmQWmL1cowblLO375fLlj893Rv28+jNqu3JUmNZLOZDFZ1DAhLPai48y25f/btXUSjPp05SWVK9+gZdn/qIeQj+EIabKe1QsXSumOzuPqMRZApbqLYFdjDkBhrhjfgibQfphzma0I44SJqeI48wPIFXLRE9GSLtWBGAW8do/BCaKeO3USNRBRsEcZTY7IIM0g7hYhYUioDleGb8p3j6YSCww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3w8upsDF6JaHZmwXMJz5++JrX2zsI7xx5S/sOAsV4o=;
 b=gFIRIDPdrjJ5ePlKiX38RQX1iUAz8XpgL9XAhTyWfByK0nb6IwKPRXruy8NfJSzp09dhn5eA7B+sLgLPgNYZSFnH5rMtqbrfFuxuJnDbWZ5R0BDhnBJcmv4/OyChmIBx0gPgql4c6hGC2QuZ5YtYgeMUYQJv1CsixYVaQgeIh6kZsI2zuFYi6TiEqR9jdQBwd9qXo3OqZyb6bP3paTMLZG8rXui6PhpvEskxEi0MsqYn1CSp3cUI/+iYJMRz5wVuYXaASADzePDJ19VXJrYqPjcefLY/t+lWd4PiD6//GgLVZkjHF7mSWxS7/uy3O+IzbaQ7Jwd/obyHVW7E7X0Syw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3w8upsDF6JaHZmwXMJz5++JrX2zsI7xx5S/sOAsV4o=;
 b=O4CREj/AzoBtAdGwMChb75lIE6r5BgtEfNTMabS080QY0o/PAcffhBfNRJL3psDstrZWogQAjv05iXRNLJ3QNfWr0Kox0JEaUa4tbHyqyHLfOpe8AzUVHjs1mDpPYsIOYCTmVnTNqwFkeiZNbL4XYUdJzo+pn4BtkLCrSFRr5/k=
Received: from MWHPR0201MB3484.namprd02.prod.outlook.com
 (2603:10b6:301:77::36) by MW2PR02MB3753.namprd02.prod.outlook.com
 (2603:10b6:907:f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 12:14:21 +0000
Received: from MWHPR0201MB3484.namprd02.prod.outlook.com
 ([fe80::f487:3551:25a3:f0a1]) by MWHPR0201MB3484.namprd02.prod.outlook.com
 ([fe80::f487:3551:25a3:f0a1%7]) with mapi id 15.20.3131.021; Fri, 26 Jun 2020
 12:14:21 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH 5/5] i2c: xiic: Only ever transfer single message
Thread-Topic: [PATCH 5/5] i2c: xiic: Only ever transfer single message
Thread-Index: AQHWQZR3WqfG+n+cFUqf2N/xDPERq6jqvWTg
Date:   Fri, 26 Jun 2020 12:14:21 +0000
Message-ID: <MWHPR0201MB34847FB7BECB3181D6153F1ECA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-5-marex@denx.de>
In-Reply-To: <20200613150751.114595-5-marex@denx.de>
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
x-ms-office365-filtering-correlation-id: 1499626e-c179-4d5d-917b-08d819ca7566
x-ms-traffictypediagnostic: MW2PR02MB3753:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR02MB3753EBF25BAC65D0CE5A1419CA930@MW2PR02MB3753.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0446F0FCE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FHgwSF16c+wX5e3IfQEWs6gAEeTr3k1WHB7064KYzC9iAbBNL2AalYjNXfh4WTh8PvYsPkK4Z37dvrqI9pZUYq3TSO+omSXBY6RZ6YH4FFsqKUl3aF/QG6FIVPUjGOaqcedOA1wvzGb6BZnk31PKMNFUQO+RDBN1F7kVNkYno+xKAW456JTe6W9aMhA1zUtvpBaKuWbSz3T8PgcQe1CdZdGHCc6+MSaY9QSey56/Z/TYKhTUPeAOcXwJPgTKOxIf0Imnavm/tjxzPPQRo9SEgk06uxErd7SWsbKevbESQ4iAUxBy2z+r/5shXDog6sV6ZBsKHM4DmHZ4q9fxG5DQVQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR0201MB3484.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(396003)(39860400002)(110136005)(54906003)(478600001)(6506007)(9686003)(86362001)(7696005)(2906002)(15650500001)(55016002)(53546011)(71200400001)(316002)(186003)(4326008)(26005)(8676002)(76116006)(8936002)(66556008)(83380400001)(33656002)(64756008)(66476007)(5660300002)(66446008)(66946007)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: IEaVCrOJvltXkv7AssNXAxoz9Ac2kusI7bBmUWSPP+XH5rcRJ1s3zvcZTyxLAZG60BWM+pOcU0e2se0sh3DullFCHCzTXHdN8cehGgih+2CnfXgXzU1xPsJ3mU6qD3AXsheN+j6zpQ+SLy2jftT9W04c6f+IbR+xkd+XjwOZDmUN7OFJTx2/FOKRXlVSaC46rcledT1d/3HUL0Jfe2VT6qXBOsdgLYdXnu276FFkrp4R9RGC6k9S7OXmWfw41P2yOeVf6j6y7ZHUVs2SEA7EoOyVyhSoUqdc8BogwAZVs+2Sz/IK3dzz0xQFbvGB4eokQ+LOr6ZhXVK7x4isCJRr3BIfe1k2mv2F8pGWw39Txj9meRzuvpmaJM3rfx6xLoJWKyZ5CU+EDwFXpBL7JfrcXej6Hq4iL6MyqmTga3rHBrjwkDI5wKrdmNyqdveLh2ej4EYzT4qQkPVF+la2/jzyfOVF7zDMnfLGU2BhyFdi0sA3SQQgEp7taG5wBCJxKcKD
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3484.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1499626e-c179-4d5d-917b-08d819ca7566
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2020 12:14:21.4200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76xb66pkvnpfBbm9LXtVetV/gVaBSZoyhHESVHbPklaMX0gsm2O4T7P//0SXeBar
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
> Subject: [PATCH 5/5] i2c: xiic: Only ever transfer single message
>=20
> Transferring multiple messages via XIIC suffers from strange interaction
> between the interrupt status/enable register flags. These flags are being=
 reused
> in the hardware to indicate different things for read and write transfer,=
 and
> doing multiple transactions becomes horribly complex. Just send a single
> transaction and reload the controller with another message once the
> transaction is done in the interrupt handler thread.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Cc: Wolfram Sang <wsa@kernel.org>
> ---
>  drivers/i2c/busses/i2c-xiic.c | 43 ++++++++---------------------------
>  1 file changed, 10 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.=
c index
> e4c3427b2f3f5..fad0b84a273d1 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -595,8 +595,6 @@ static void xiic_start_send(struct xiic_i2c *i2c)  {
>  	struct i2c_msg *msg =3D i2c->tx_msg;
>=20
> -	xiic_irq_clr(i2c, XIIC_INTR_TX_ERROR_MASK);
> -
>  	dev_dbg(i2c->adap.dev.parent, "%s entry, msg: %p, len: %d",
>  		__func__, msg, msg->len);
>  	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n", @@
> -614,11 +612,13 @@ static void xiic_start_send(struct xiic_i2c *i2c)
>  		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
>  	}
>=20
> -	xiic_fill_tx_fifo(i2c);
> -
>  	/* Clear any pending Tx empty, Tx Error and then enable them. */
>  	xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
> XIIC_INTR_TX_ERROR_MASK |
> -		XIIC_INTR_BNB_MASK);
> +		XIIC_INTR_BNB_MASK |
> +		((i2c->nmsgs > 1 || xiic_tx_space(i2c)) ?
> +			XIIC_INTR_TX_HALF_MASK : 0));
> +
> +	xiic_fill_tx_fifo(i2c);
>  }
>=20
>  static void __xiic_start_xfer(struct xiic_i2c *i2c) @@ -634,35 +634,12 @=
@
> static void __xiic_start_xfer(struct xiic_i2c *i2c)

Can remove the definition of unused variable ("first").

>  	i2c->rx_pos =3D 0;
>  	i2c->tx_pos =3D 0;
>  	i2c->state =3D STATE_START;
> -	while ((fifo_space >=3D 2) && (first || (i2c->nmsgs > 1))) {
> -		if (!first) {
> -			i2c->nmsgs--;
> -			i2c->tx_msg++;
> -			i2c->tx_pos =3D 0;
> -		} else
> -			first =3D 0;
> -
> -		if (i2c->tx_msg->flags & I2C_M_RD) {
> -			/* we dont date putting several reads in the FIFO */
> -			xiic_start_recv(i2c);
> -			return;
> -		} else {
> -			xiic_start_send(i2c);
> -			if (xiic_tx_space(i2c) !=3D 0) {
> -				/* the message could not be completely sent
> */
> -				break;
> -			}
> -		}
> -
> -		fifo_space =3D xiic_tx_fifo_space(i2c);
> +	if (i2c->tx_msg->flags & I2C_M_RD) {
> +		/* we dont date putting several reads in the FIFO */
> +		xiic_start_recv(i2c);
> +	} else {
> +		xiic_start_send(i2c);
>  	}
> -
> -	/* there are more messages or the current one could not be completely
> -	 * put into the FIFO, also enable the half empty interrupt
> -	 */
> -	if (i2c->nmsgs > 1 || xiic_tx_space(i2c))
> -		xiic_irq_clr_en(i2c, XIIC_INTR_TX_HALF_MASK);
> -
>  }
>=20
>  static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, i=
nt num)

This patch is much needed to simplify the logic. Tested, working fine.

Raviteja N

