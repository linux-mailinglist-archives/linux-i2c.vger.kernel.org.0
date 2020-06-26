Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F322920B12D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jun 2020 14:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgFZMOD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Jun 2020 08:14:03 -0400
Received: from mail-bn7nam10on2085.outbound.protection.outlook.com ([40.107.92.85]:11444
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727977AbgFZMOC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Jun 2020 08:14:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2Ld8LOhmxBIVl4ABdC/oblaerGFvC8YqtvcAiFk1MraxvCRBuczzqT0/+26R4/VBJZhaGMp8cngTe59dr8L8uwF2duu+5sd6WLQzMGJst6sYmsKhPQoxyXv5kzDNqpjEqf9SXrbvA4y1Z7SU9dZmblW7McB49qTFLISjSbSmJYPkjQOgUowF1e+JTNfG4ESt1SLp1E45K0OxYcw3rlsystf+XGsvHximj0ccBlWHTfvTr4EuzGOKBqy+q7jOnaRxB5q4PVpHFFDuLVaSlBco9aUAicZ9uUzoICxqudMDKsKJP1vQrYwn2Zjv9C/aZC4m+jXd8ReJgXWEbQ1ecu5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryxuLiKg/mKAF/SjT+QdZlBvhwNAWmgb9NzdBTRPGlw=;
 b=V0DA7VVNWgX7+FewalCcjGymbP0BrCyi0scosrxx6WIcJU6NT7fepbztRPCusDswToZVc5fEYegxvxkilruVGjrE2Th6Am1zp61xmhBZWaAbPW5DjyRRVwhX+equpQ2nz7nzvxl6s30i/xQjKRRnM0Nf5LdNBEtjRMepv6jzu/ny7VA4HuScL2ztDTzui6DISg5mh6eXd5Mc3IHADBMuw4Auyv0QseaRcQTqtSQ6FdbQtJu6FOHvRlXKsBpQccJg34uA5tGOriW1EWHMkzHtXFThwFLvgycxaGitoik/9q2wRRU9b6N0YNseFXz8BOSUjxClWgwy/UMkZiFrMoMdhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryxuLiKg/mKAF/SjT+QdZlBvhwNAWmgb9NzdBTRPGlw=;
 b=mtXdUJFP6LfnX+eSrb29Hchsr2QA+yndnYzQM8QAkODBr0qhRtXZu4jf94BYDo2PdHAGPhR6+Qvu3nF8H4AYW/D5wZS036533OrAEk/HVeOl3AG622szGlk3GNuDjtntR8DRsQO7zCBJi+dfpK8jhchIPchY3l05pGjp/OiT0bo=
Received: from MWHPR0201MB3484.namprd02.prod.outlook.com
 (2603:10b6:301:77::36) by MW2PR02MB3753.namprd02.prod.outlook.com
 (2603:10b6:907:f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 12:13:59 +0000
Received: from MWHPR0201MB3484.namprd02.prod.outlook.com
 ([fe80::f487:3551:25a3:f0a1]) by MWHPR0201MB3484.namprd02.prod.outlook.com
 ([fe80::f487:3551:25a3:f0a1%7]) with mapi id 15.20.3131.021; Fri, 26 Jun 2020
 12:13:59 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH 4/5] i2c: xiic: Switch from waitqueue to completion
Thread-Topic: [PATCH 4/5] i2c: xiic: Switch from waitqueue to completion
Thread-Index: AQHWQZR2qAxmP1sj9UKNsjSFt55DtqjqutlA
Date:   Fri, 26 Jun 2020 12:13:59 +0000
Message-ID: <MWHPR0201MB3484AB3D1AB03068D56B18E9CA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-4-marex@denx.de>
In-Reply-To: <20200613150751.114595-4-marex@denx.de>
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
x-ms-office365-filtering-correlation-id: 3bccb0a7-314a-4519-af77-08d819ca6863
x-ms-traffictypediagnostic: MW2PR02MB3753:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR02MB37534F0E2A7AEAB0917C0105CA930@MW2PR02MB3753.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0446F0FCE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: agTXzffsFtkcstemoRBxmY8hi1jWwq7UhlvPaTe41Z+dfW57G+LfwWSAPYUcjz/K258WJmSjf3V7P1dFv8VT0MjR6/TEcsgj3PLUiG8JXwkMjcspD16EnlOBEtBK9EJwlCRPSg4FJRSST1N5bf/+rwCda6Ur/YVinKDLAToBkiXuc8MIHcghJrQ2KFDgaKQKzREaIkXhxrfIZOoa5Ol4/hwZbdVyKi22ixB2igvop7N514z15YtfEbgF9wn4mI36p+/q7BW1If7+9xysbr0T0vJ1DMt1BeDcjZVHbufaobeQBb/TEkkI2EigeEkXv+k0eaUos3lzNFCA7ObDMyqTww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR0201MB3484.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(396003)(39860400002)(110136005)(54906003)(478600001)(6506007)(9686003)(86362001)(7696005)(2906002)(55016002)(53546011)(71200400001)(316002)(186003)(4326008)(26005)(8676002)(76116006)(8936002)(66556008)(83380400001)(33656002)(64756008)(66476007)(5660300002)(66446008)(66946007)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ztnLQ8b662i96aSBcU+xBNV0hB0toiTRkfILs/vaGqVlYlws6O+CA9pcMVmdWd4ULzjJ7u4WN7pJhH9DWAMlj9GrhfvWCJI77zSrxEKr89Vs4R7fSnyDBxPSZb3GF8DGgu8gmIjuAXr54yMzz0uD5Hm2TL+TS8SZaW2FZDQvHn5fKsFNefLRsRsGdOpIPNZUUBPWHkU2Su8CackI1gci3y4LoQlzNSIEeoLsT3DCaFbDLVcTZr9TQLFUKAhcprYdzARGfAqiNl+0eVvb5veTdsWlArG/sxiF48DQBjPKeRG+NEEBouBkg8mtJI6JIc6LTxfD8Qy3lXiZ28Wp4Els3MJeHrdcfLNV8HqwUQ3540mODkBjKpvbyF3T69rGm10i+fnaNRXvqw1CJT8dCeLIG6DnGrvnsABbNEzB7kvRgBdtjhFkk65K0ahQEK88MwUKGHcxB+IUY6VE2ShHoNVTg+eT86x0idv5MzVvYoMxkxpQgu5At+jZy9hcZZoPSEd6
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3484.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bccb0a7-314a-4519-af77-08d819ca6863
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2020 12:13:59.6148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EaDWCkNIW8taEeLgSkt+G2htg4aeYH/5jrHnnF7An9pNUHF+HTBjtFaR0zJpr6QC
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
> Subject: [PATCH 4/5] i2c: xiic: Switch from waitqueue to completion
>=20
> There will never be threads queueing up in the xiic_xmit(), use completio=
n
> synchronization primitive to wait for the interrupt handler thread to com=
plete
> instead as it is much better fit and there is no need to overload it for =
this
> purpose.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Cc: Wolfram Sang <wsa@kernel.org>
> ---
>  drivers/i2c/busses/i2c-xiic.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.=
c index
> 87eca9d46afd9..e4c3427b2f3f5 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -23,7 +23,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> -#include <linux/wait.h>
> +#include <linux/completion.h>
>  #include <linux/platform_data/i2c-xiic.h>  #include <linux/io.h>  #inclu=
de
> <linux/slab.h> @@ -48,7 +48,7 @@ enum xiic_endian {
>   * struct xiic_i2c - Internal representation of the XIIC I2C bus
>   * @dev:	Pointer to device structure
>   * @base:	Memory base of the HW registers
> - * @wait:	Wait queue for callers
> + * @completion:	Completion for callers
>   * @adap:	Kernel adapter representation
>   * @tx_msg:	Messages from above to be sent
>   * @lock:	Mutual exclusion
> @@ -63,7 +63,7 @@ enum xiic_endian {
>  struct xiic_i2c {
>  	struct device		*dev;
>  	void __iomem		*base;
> -	wait_queue_head_t	wait;
> +	struct completion	completion;
>  	struct i2c_adapter	adap;
>  	struct i2c_msg		*tx_msg;
>  	struct mutex		lock;
> @@ -365,7 +365,7 @@ static void xiic_wakeup(struct xiic_i2c *i2c, int cod=
e)
>  	i2c->rx_msg =3D NULL;
>  	i2c->nmsgs =3D 0;
>  	i2c->state =3D code;
> -	wake_up(&i2c->wait);
> +	complete(&i2c->completion);
>  }
>=20
>  static irqreturn_t xiic_process(int irq, void *dev_id) @@ -677,6 +677,7 =
@@
> static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, in=
t num)
>=20
>  	i2c->tx_msg =3D msgs;
>  	i2c->nmsgs =3D num;
> +	init_completion(&i2c->completion);
>=20
>  	ret =3D xiic_reinit(i2c);
>  	if (!ret)
> @@ -703,23 +704,24 @@ static int xiic_xfer(struct i2c_adapter *adap, stru=
ct
> i2c_msg *msgs, int num)
>  	err =3D xiic_start_xfer(i2c, msgs, num);
>  	if (err < 0) {
>  		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
> -		goto out;
> +		return err;
>  	}
>=20
> -	if (wait_event_timeout(i2c->wait, (i2c->state =3D=3D STATE_ERROR) ||
> -		(i2c->state =3D=3D STATE_DONE), HZ)) {
> -		mutex_lock(&i2c->lock);
> -		err =3D (i2c->state =3D=3D STATE_DONE) ? num : -EIO;
> -		goto out;
> -	} else {
> -		mutex_lock(&i2c->lock);
> +	err =3D wait_for_completion_interruptible_timeout(&i2c->completion,
> +							XIIC_I2C_TIMEOUT);

This is causing random lock up of bus. Since it is "interruptible" API,  on=
ce we enter Ctrl+C,=20
It is coming out of wait state, the message pointers are made NULL and the =
ongoing transaction is not completed.=20
Can use " wait_for_completion_timeout" API in place of this.

> +	mutex_lock(&i2c->lock);
> +	if (err =3D=3D 0) {	/* Timeout */
>  		i2c->tx_msg =3D NULL;
>  		i2c->rx_msg =3D NULL;
>  		i2c->nmsgs =3D 0;
>  		err =3D -ETIMEDOUT;
> -		goto out;
> +	} else if (err < 0) {	/* Completion error */
> +		i2c->tx_msg =3D NULL;
> +		i2c->rx_msg =3D NULL;
> +		i2c->nmsgs =3D 0;
> +	} else {
> +		err =3D (i2c->state =3D=3D STATE_DONE) ? num : -EIO;
>  	}
> -out:
>  	mutex_unlock(&i2c->lock);
>  	pm_runtime_mark_last_busy(i2c->dev);
>  	pm_runtime_put_autosuspend(i2c->dev);
> @@ -781,7 +783,6 @@ static int xiic_i2c_probe(struct platform_device *pde=
v)
>  	i2c->adap.dev.of_node =3D pdev->dev.of_node;
>=20
>  	mutex_init(&i2c->lock);
> -	init_waitqueue_head(&i2c->wait);
>=20
>  	i2c->clk =3D devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(i2c->clk)) {

Raviteja N

