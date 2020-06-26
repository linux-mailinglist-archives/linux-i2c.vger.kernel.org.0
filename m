Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8171320B126
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jun 2020 14:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbgFZMLb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Jun 2020 08:11:31 -0400
Received: from mail-bn7nam10on2087.outbound.protection.outlook.com ([40.107.92.87]:58812
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727977AbgFZMLb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Jun 2020 08:11:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASaPICB3u85hwZQFHmgiVqyPuHl8NoJXuD0GmEPuf1umLQ6XmxeJL8EDiUsZQP1Lx77VWZ6eOn9LaEd0VT8LlQnssgbQ4bHuGvPtYpHagCgY+AW3HvWo/crDxjOzR6pM0crJfaE7fK+AL0aW64OsOGF3g+xy83skv2dzGVncESFqaf95P0O1NvfjDqAFrXqJ9Ic9/BcAKw6D9g+CNTXM3j0sApzPo03nqfp+cdMAokIn6q/TtmQ8+4Bg6P4nRwMY+3Hl0bS6cg2HHBqZYO+47JsG2FJAQduFjb4NOZlsAyaA+72QpSWOnQSyWo3wG/xj55ebeQOJK4xpRwsLkGiTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9tkZ4d5sKnRJEza+itMdY/34/o0boV+tS3PnIPhQF0=;
 b=Ur6wrYo7D2NOIL7H9p0GqGn2wPVEoKVhf6Y2EIVFtKm5Eu333K4SUvOAP4ddei5fUyyNPPlyIvaUKqCPkJaXlbKqOXnbzRD4OK4lkYvzZD+T3O29wN2CRD4m6QkosH+BRnX9tLLjmUod6Oho15GLBTB710CxAhgtaxSYqOZ9ulggb9Cwho8gT1kKczf0g+0MUZPjxlNjkhwiS/ohRKP3WqgN6f+/Rv2eg1rEuIaF4zCgD8bbxt2NaokUEdMscbnfxbjNO7Z54AXWz4ZBs6RaYyehR28ed4HSiQ+fWXvXz8H9hhl6BG6mnRbZyn8bLJomtrBtgNxYUy7NWeLgCOfq6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9tkZ4d5sKnRJEza+itMdY/34/o0boV+tS3PnIPhQF0=;
 b=kEn/NItDJcKwS1ISclBffEFUYHfUKxEb1zg8AiRgbBfuZpYgettLa+mBmygEzp3G/trtQUNOcFg15D+pPOg7yhcnLCuyD1KuSL0PbB+LAF0RdxyGOUgd8STmISqNih2dJ+GZ5vawu6kYRKmDtNBz7C+TxDt8XlCBLiCweut3WwQ=
Received: from MWHPR0201MB3484.namprd02.prod.outlook.com
 (2603:10b6:301:77::36) by MW2PR02MB3753.namprd02.prod.outlook.com
 (2603:10b6:907:f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 12:11:27 +0000
Received: from MWHPR0201MB3484.namprd02.prod.outlook.com
 ([fe80::f487:3551:25a3:f0a1]) by MWHPR0201MB3484.namprd02.prod.outlook.com
 ([fe80::f487:3551:25a3:f0a1%7]) with mapi id 15.20.3131.021; Fri, 26 Jun 2020
 12:11:27 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH 1/5] i2c: xiic: Fix broken locking on tx_msg
Thread-Topic: [PATCH 1/5] i2c: xiic: Fix broken locking on tx_msg
Thread-Index: AQHWQZR16ESRHITuAECl/9tfqloeHqjpJiIA
Date:   Fri, 26 Jun 2020 12:11:26 +0000
Message-ID: <MWHPR0201MB348439A109964704D30EF0B4CA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
References: <20200613150751.114595-1-marex@denx.de>
In-Reply-To: <20200613150751.114595-1-marex@denx.de>
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
x-ms-office365-filtering-correlation-id: 5af59cf6-29e6-4c80-50d0-08d819ca0d62
x-ms-traffictypediagnostic: MW2PR02MB3753:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR02MB375348708E8366B447C69B35CA930@MW2PR02MB3753.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0446F0FCE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dFtBvaesRGE7Q16jL1zN8FrqNhE3PjN4Pya6t9zB+FyR9C0KVRhYan0QO8opAHhmfwXXsK3Aovq5FHIwi3NsjzvTNUGLaVpHsKcJkFlgKX1j6adqRamaqEkeJWka1OgMCLPAO8l+2Us3QYP5ns1WYcARUzZ4fw5qp07GycQalrEpDc7HIX+0Jy1uNzw0oy9WtStVIBdldye9H+nGYduM7ACUx4WlZBOAMEtcTlCxHyUnO/qqxIDSvjQpIHPELv6+DO7H4YDt905f81mO8fTCUER5umr8DwVCpyGCZuA0ZhJGoLGxFaFbCYJ08D9YGEbLs4JNWHEgExawC/vumezRgg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR0201MB3484.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(396003)(39860400002)(110136005)(54906003)(478600001)(6506007)(9686003)(86362001)(7696005)(2906002)(55016002)(53546011)(71200400001)(316002)(186003)(4326008)(26005)(8676002)(76116006)(8936002)(66556008)(83380400001)(33656002)(64756008)(66476007)(5660300002)(66446008)(66946007)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uTkdHmZJ2w7ahs67vLs6ooQq5mAslYTwVc2KoFJ2Tgwtwwvgyx76AX5Tekalt62To2Rqllnju8GV3YDgrv03M1tnxjyTVupfEnKe7d51AXjoushONCwXPiHo/1YGROw/rV9Deg/T1SmDYHZt7qqad9/tYYwHNEYOSFYgGhBmIrAbRwhWXLGXGVsyxLk92EAdS+ovlznMoU8hCeOybHcNBiPtsN0WsMWDN2mAEg0liZXMx3cjsllBFGM5n9G0TIFaur8jC5fEYw17+3kET4QUy3U5udDeUlYaV4J9Q4Ms7jwsT2ZF1lcPIujzV8ZiumKLWKQGuCpUaXnLMImHVI2xehl3DSPAPrbKufRMQivT7LfQTDyJJ/jovD4ShdLAF0uGcrvYJS/qX5xzxCRkaKcjo8tX3UpJ14j7AzNsjA2Ybq3aMV6A8mAwcmo7Iqu95iNv2YRh+q2CXn0h17HDPruT/3fDIIYVZpCrWW59qvgVSK2PawzBHVN54lZzaYnwarbJ
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3484.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af59cf6-29e6-4c80-50d0-08d819ca0d62
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2020 12:11:26.7782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uxSXLeY15cs6Neh6JmTvrqQbMbepyamU1+pc3Sw9jy4gXR/0IncJehmTTXKS4pee
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3753
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marek,

Thanks for the patches. I have tested them. Please see comments inline.

> -----Original Message-----
> From: linux-i2c-owner@vger.kernel.org <linux-i2c-owner@vger.kernel.org> O=
n
> Behalf Of Marek Vasut
> Sent: Saturday, June 13, 2020 8:38 PM
> To: linux-i2c@vger.kernel.org
> Cc: Marek Vasut <marex@denx.de>; Michal Simek <michals@xilinx.com>;
> Shubhrajyoti Datta <shubhraj@xilinx.com>; Wolfram Sang <wsa@kernel.org>
> Subject: [PATCH 1/5] i2c: xiic: Fix broken locking on tx_msg
>=20
> The tx_msg is set from multiple places, sometimes without locking, which =
fall
> apart on any SMP system. Only ever access tx_msg inside the driver mutex.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Cc: Wolfram Sang <wsa@kernel.org>
> ---
>  drivers/i2c/busses/i2c-xiic.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.=
c index
> 90c1c362394d0..0777e577720db 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -168,7 +168,7 @@ struct xiic_i2c {
>  #define xiic_tx_space(i2c) ((i2c)->tx_msg->len - (i2c)->tx_pos)  #define
> xiic_rx_space(i2c) ((i2c)->rx_msg->len - (i2c)->rx_pos)
>=20
> -static int xiic_start_xfer(struct xiic_i2c *i2c);
> +static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs,
> +int num);
>  static void __xiic_start_xfer(struct xiic_i2c *i2c);
>=20
>  /*
> @@ -673,15 +673,24 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
>=20
>  }
>=20
> -static int xiic_start_xfer(struct xiic_i2c *i2c)
> +static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs,
> +int num)
>  {
>  	int ret;
> +
>  	mutex_lock(&i2c->lock);
>=20
> +	ret =3D xiic_busy(i2c);
> +	if (ret)
> +		goto out;
> +
> +	i2c->tx_msg =3D msgs;
> +	i2c->nmsgs =3D num;
> +
>  	ret =3D xiic_reinit(i2c);
>  	if (!ret)
>  		__xiic_start_xfer(i2c);
>=20
> +out:
>  	mutex_unlock(&i2c->lock);
>=20
>  	return ret;
> @@ -699,14 +708,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struc=
t
> i2c_msg *msgs, int num)
>  	if (err < 0)
>  		return err;
>=20
> -	err =3D xiic_busy(i2c);
> -	if (err)
> -		goto out;
> -
> -	i2c->tx_msg =3D msgs;
> -	i2c->nmsgs =3D num;

On an SMP system with multiple i2c-transfer command scripts running, the ab=
ove critical section is expected to cause serious trouble overwriting the p=
revious msg pointers.
But that's not happening as the i2c-core is having a lock at adapter level =
inside i2c-core-base.c (rt_mutex_lock_nested).
So, the race condition between different threads is not possible. They are =
all serialized by the locking in i2c-core.

Although no issues are seen in the tests, the contention within the driver =
is still possible (isr vs xiic_xfer), if there is a spurious interrupt. And=
 this patch is needed in that case.

> -
> -	err =3D xiic_start_xfer(i2c);
> +	err =3D xiic_start_xfer(i2c, msgs, num);
>  	if (err < 0) {
>  		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
>  		goto out;
> @@ -714,9 +716,11 @@ static int xiic_xfer(struct i2c_adapter *adap, struc=
t
> i2c_msg *msgs, int num)
>=20
>  	if (wait_event_timeout(i2c->wait, (i2c->state =3D=3D STATE_ERROR) ||
>  		(i2c->state =3D=3D STATE_DONE), HZ)) {
> +		mutex_lock(&i2c->lock);
>  		err =3D (i2c->state =3D=3D STATE_DONE) ? num : -EIO;
>  		goto out;
>  	} else {
> +		mutex_lock(&i2c->lock);
>  		i2c->tx_msg =3D NULL;
>  		i2c->rx_msg =3D NULL;
>  		i2c->nmsgs =3D 0;
> @@ -724,6 +728,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct
> i2c_msg *msgs, int num)
>  		goto out;
>  	}
>  out:
> +	mutex_unlock(&i2c->lock);
>  	pm_runtime_mark_last_busy(i2c->dev);
>  	pm_runtime_put_autosuspend(i2c->dev);
>  	return err;

Raviteja N

