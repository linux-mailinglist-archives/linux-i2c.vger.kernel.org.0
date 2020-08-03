Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 061AB23A773
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 15:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbgHCN1d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 09:27:33 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:39072 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgHCN1c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Aug 2020 09:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1596461252; x=1627997252;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Lbn4IUBl1j8lk/uLWk/eFKgVKfFng2Pf8iCkGPiDDXc=;
  b=uVB015X+hlxtIcKkOGckOT5mAz4HYBX2YWLS+h03iLBkr6npcezy2Tn3
   yRLl2uNZztqo4MyOJSWGCFC2k5ifOfzFP+dwt57x65nFOUZ2iSMRgUiGk
   F1bCNLzrTYCdO2TNs1Hz6Y40rp5MvbznJnBBwQRcFEkSs7papkTYle2RI
   Ktfy/z8f2WSjPHt4t4CEg7Uu5Zd5ncjXM3Twd7DyGspMnwYQrtHqT3NNn
   a6IWn4Ms+9fwlbT67sq1rAKFM0jKfctJnYTGIFeb5VVrkRrUy/BzDhiZs
   pVCENDc5Wd/hXoLzeMamDoWqvoAmwsg+TBDPPozDHX4dogryWrNT8A5Xe
   w==;
IronPort-SDR: SoLNEFkO/0DWxRxyNpV/ISkoyfIM6R9qTy4Velxb+XMdL9otahBJdEJOUTFSCSqXnaTwosKqZp
 WPfy06VCG1TQ5GdJkO3QYWkdQ8SGgEpZH1Y5nN4LFsbZrTwo9cO3kKPH96sdnRQTyrAznx4C8F
 DWIR994v5ib4lCcvxpla0LKXWXfxBQyUQe9vySGzHXD5ExrOtwh1CqIIxx4SzKWojJzflvTBv0
 1sxXAaXyYBVoNzcocguqK7TyYjhwQlD2fT3H/zFGcnAY4ffL/uoyb0fmYMMLtw4bGGFmUmtb44
 LOk=
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="85621073"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Aug 2020 06:27:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 3 Aug 2020 06:27:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 3 Aug 2020 06:27:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLAgVZFg2neR6568bKjzL1afd5n5XP7e3wIOweryw2XXJQWP5Y/5dvRrJyOGEiegdGT9MP96hZ84EOT2PC/dC3O/5glTpnoHE5dPfTcJkavqGsQVDOiABR+RELMd0jp+9tNdTXl8ZiXdOQxlY+nx8SiL6Y6209eU98h2if8jpVwcQqCx/AxGg/YN2EDyzMwMpqu3JjitkLOj//RPxMj2Oez+jbA4LZF7yAxTIMLw2RgJw3+IekCPfM1Qp8I9TN1WpGuqL5Ju8Y3fCBYviq8w08VahvEnAXwjEztGASf2JKeBdsmmYuY9wF0obnd7uCzuYCFu1sd4fR+ilCGarCybpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/EjGCf/hhsRxlEp2oescU/rD7/Pfq9Tm4NeuyN4X88=;
 b=nGzinxobfHUpwg6XhSDaiaPl9Y9p8k3Uix0PkgNIJP1avZUnPMnPM4Ws8oB/3D4tMYbdH52EwlAw4P2Aip0cmynMWdIe0C8R155C9By9AVQJPBEpjjV8QdfI0NdtoFqVy1b1bcmE0daapXO8Iqru7EE7zgQY8h/xvLjc9Tm+N6uWU0Qt28HUZSLgWZDOI8ytXwrBFj00QXhQFAXS4sV0B5xPjiH6kJDVbZOezW99BwY/E79SGK9/K80Oetf0x27sJ7HHqTLMHVd1ooWTJQ+O0sOMk86EKUl0bGOL+gqa2EBJA8eN+lRyffI7ZXD3vaqOgfnAcf8iDNHvuHB1WzcoXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/EjGCf/hhsRxlEp2oescU/rD7/Pfq9Tm4NeuyN4X88=;
 b=g60GRc6gAz/UO/mvXfPZ7wH3GiDxRGLEdYfxaMx2pXr1hF04+gxD1Dasfp9s1g0nbpXvEmXmMKfOHudBuOaZo8jWbKFxVjzsGIB+1x53s61JhD6xjcZS+Ye6b/w1o/4E/zj0hJjy4sN+/hN0UeWK3ozepwyW8f26zIEx7dQXku4=
Received: from SN6PR11MB3504.namprd11.prod.outlook.com (2603:10b6:805:d0::17)
 by SN6PR11MB3039.namprd11.prod.outlook.com (2603:10b6:805:d3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Mon, 3 Aug
 2020 13:27:29 +0000
Received: from SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::c83b:2062:4e59:8ebf]) by SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::c83b:2062:4e59:8ebf%7]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 13:27:28 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: Re: [RFC PATCH 2/4] i2c: core: add generic I2C GPIO recovery
Thread-Topic: Re: [RFC PATCH 2/4] i2c: core: add generic I2C GPIO recovery
Thread-Index: AQHWRkTSAu6ZxU19YEGUx3XaLWZruaklTrYAgAFYYwA=
Date:   Mon, 3 Aug 2020 13:27:28 +0000
Message-ID: <084249c3-dd2b-a975-6c8d-8045def0293e@microchip.com>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-3-codrin.ciubotariu@microchip.com>
 <20200802165446.GA10193@kunai>
In-Reply-To: <20200802165446.GA10193@kunai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [84.232.220.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 848bb43d-6c22-474f-0b55-08d837b0f822
x-ms-traffictypediagnostic: SN6PR11MB3039:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB303972F04FBA479611BCF81CE74D0@SN6PR11MB3039.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7iUI55TaRdqLIh16+2rb+VUilYj/vUrmIo8IfaubZZXE8PFKksYtT5bbm/C3LY+MmhcvwT4WCxzIC9g7HSHnL13ZzziyyKnRQsAuoezVVwPg8fktGSDTvZGtjiqyrEHWijDpH3Ci7H6RDmm3powHYD9Yd0niL2hLl8o9BdczZ6xTqjmKct1Q12VRJPUGFIX0YGxrPSVPRM6liLq4T16VEhoF9U8JGdtf2Q+w+ekoTT6Rl3AXQ2mbutDW6qmJTj6Dg1BphO2xulx8PyP4y5I+KdiDVIloHHqWY1CX5NBmotLGBOBRQDGAN4rsJhkR9FkvrXOCJvkkW06p3oiykK88o6HuNaa3aNOiC3S9t5y4nnxR5BwO9e2991asXyc+g89/O5kssneMWVKa+EsTL/Z+YQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3504.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(39860400002)(396003)(376002)(136003)(2616005)(83380400001)(91956017)(71200400001)(66476007)(66556008)(64756008)(66446008)(8936002)(8676002)(2906002)(66946007)(76116006)(6916009)(316002)(186003)(6512007)(36756003)(31686004)(54906003)(26005)(6506007)(6486002)(53546011)(31696002)(478600001)(5660300002)(4326008)(86362001)(41533002)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: RAKTLn5Rz3tRqCLQ2F+91P7dJyGOrlbJoIt2ZnqxuLHPBBkeWtZWeiPfadqO83/TnSM6wx2pAPGt3PDA77ZqhLyYkELQqZN5hnJMnS2MZ6X2O031baq0JI4fr4zt+r2yECVzih/95aNhU+avda5eNO5D58b7kcSj9mtXTIDieyW56bHtR19F4P+L/rzRIBCmn0eLgOmpBLUwlmLWm4VNjgG9mBcBFmxKqfYkusJfjrashl9eXzXXg/3EZBMziRTQwHbRo2qgEVkq3ac4Q/SiDNnm0fj3NIdoIR4DZQynQ7Fl90Q3IL2LuF1ITCh0UpcAhhtcyBhAi8yD0PmVyRlcxnNQUDSrhkvf1LsHVtNzZq+xGhUZB/qAleiKJBhedqPKE+5RYDP/Jmzm6Rg63obnLKR859RulDsjc5RMVKxiJe2k/OQvGcsfTPu6PiXEeKasylz5LDK4ZIh9SgO95Zw0kXYUMyxq2rIcYUFLsZZellKXeGzjcL5AnBpVuLM+Exnwj1FktygnwW9sABTAR0yWqYn9CxwU1tyvQvJa6Vw8rvDh72u4DUIXXiNQphiIg8t7P1yk1+f3zjSc/OSJOf4gptonW5DkTxzWCVY6NhbFNZFHfgRVRdMoc8CcPIW8ri+gC729aRbeTftwIunMzKpfjw==
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <191FBE1E6110D846965BC0996AEFA8C6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3504.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 848bb43d-6c22-474f-0b55-08d837b0f822
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2020 13:27:28.7880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lv9FItNzWSPbLXMF2Or04YvMMLdk3xOWE73aFWNfjs+LTf9DcAiWkiC1gjfpj1qs7xLFH6ynM3XTDSB7y/4hA1QdLaY9d76mKFAzn7hcskU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3039
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02.08.2020 19:54, Wolfram Sang wrote:
> On Fri, Jun 19, 2020 at 05:19:02PM +0300, Codrin Ciubotariu wrote:
>> Multiple I2C bus drivers use similar bindings to obtain information need=
ed
>> for I2C recovery. For example, for platforms using device-tree, the
>> properties look something like this:
>>
>> &i2c {
>> 	...
>> 	pinctrl-names =3D "default", "gpio";
>> 	// or pinctrl-names =3D "default", "recovery";
>> 	pinctrl-0 =3D <&pinctrl_i2c_default>;
>> 	pinctrl-1 =3D <&pinctrl_i2c_gpio>;
>> 	sda-gpios =3D <&pio 0 GPIO_ACTIVE_HIGH>;
>> 	scl-gpios =3D <&pio 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>> 	...
>> }
>>
>> For this reason, we can add this common initialization in the core. This
>> way, other I2C bus drivers will be able to support GPIO recovery just by
>> providing a pointer to platform's pinctrl and calling i2c_recover_bus()
>> when SDA is stuck low.
>>
>> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
>=20
> Thanks, it looks a lot like what I had in mind!
>=20
>> ---
>>   drivers/i2c/i2c-core-base.c | 119 ++++++++++++++++++++++++++++++++++++
>>   include/linux/i2c.h         |  11 ++++
>>   2 files changed, 130 insertions(+)
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index d1f278f73011..4ee29fec4e93 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -32,6 +32,7 @@
>>   #include <linux/of_device.h>
>>   #include <linux/of.h>
>>   #include <linux/of_irq.h>
>> +#include <linux/pinctrl/consumer.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/pm_wakeirq.h>
>> @@ -179,6 +180,8 @@ int i2c_generic_scl_recovery(struct i2c_adapter *ada=
p)
>>   	struct i2c_bus_recovery_info *bri =3D adap->bus_recovery_info;
>>   	int i =3D 0, scl =3D 1, ret =3D 0;
>>  =20
>> +	if (bri->pinctrl)
>> +		pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
>=20
> I think this should come after 'prepare_recovery'. It may be that
> 'prepare_recovery' already needs to select the pinctrl state to avoid a
> glitch. In this version, there would be a glitch then. If we move it
> down, the doubled 'pinctrl_select_state' would be a noop then.

Agree

>=20
>>   	if (bri->prepare_recovery)
>>   		bri->prepare_recovery(adap);
>>  =20
>> @@ -236,6 +239,8 @@ int i2c_generic_scl_recovery(struct i2c_adapter *ada=
p)
>>  =20
>>   	if (bri->unprepare_recovery)
>>   		bri->unprepare_recovery(adap);
>> +	if (bri->pinctrl)
>> +		pinctrl_select_state(bri->pinctrl, bri->pins_default);
>=20
> Here it is OK and will still work with the PXA version which needs to
> select the state on its own.
>=20
>>  =20
>>   	return ret;
>>   }
>> @@ -251,6 +256,118 @@ int i2c_recover_bus(struct i2c_adapter *adap)
>>   }
>>   EXPORT_SYMBOL_GPL(i2c_recover_bus);
>>  =20
>> +static void i2c_gpio_init_pinctrl_recovery(struct i2c_adapter *adap)
>> +{
>> +	struct i2c_bus_recovery_info *bri =3D adap->bus_recovery_info;
>> +	struct device *dev =3D &adap->dev;
>> +	struct pinctrl *p =3D bri->pinctrl;
>> +
>> +	/*
>> +	 * we can't change states without pinctrl, so remove the states if
>> +	 * available
>=20
> s/available/populated/ ?

OK

>=20
>> +	 */
>> +	if (!p) {
>> +		bri->pins_default =3D NULL;
>> +		bri->pins_gpio =3D NULL;
>> +		return;
>> +	}
>> +
>> +	if (!bri->pins_default) {
>> +		bri->pins_default =3D pinctrl_lookup_state(p,
>> +							 PINCTRL_STATE_DEFAULT);
>> +		if (IS_ERR(bri->pins_default)) {
>> +			dev_dbg(dev, PINCTRL_STATE_DEFAULT " state not found for GPIO recove=
ry\n");
>> +			bri->pins_default =3D NULL;
>> +
>> +			goto cleanup_pinctrl;
>=20
> I'd leave out the goto here. It is OK to check both parameters, I think.

since default state is missing, the next check can be skipped, but I=20
agree that removing the label makes things easier to read.

>=20
>> +		}
>> +	}
>> +	if (!bri->pins_gpio) {
>> +		bri->pins_gpio =3D pinctrl_lookup_state(p, "gpio");
>> +		if (IS_ERR(bri->pins_gpio))
>> +			bri->pins_gpio =3D pinctrl_lookup_state(p, "recovery");
>> +
>> +		if (IS_ERR(bri->pins_gpio)) {
>> +			dev_dbg(dev, "no gpio or recovery state found for GPIO recovery\n");
>> +			bri->pins_gpio =3D NULL;
>> +
>> +			goto cleanup_pinctrl;
>=20
> This goto is not needed...

right

>=20
>> +		}
>> +	}
>> +
>> +cleanup_pinctrl:
>=20
> ... and this label can go then. Also nicer to read, I'd say.

I will remove it.

>=20
>> +	/* for pinctrl state changes, we need all the information */
>> +	if (!bri->pins_default || !bri->pins_gpio) {
>> +		bri->pinctrl =3D NULL;
>> +		bri->pins_default =3D NULL;
>> +		bri->pins_gpio =3D NULL;
>> +	} else {
>> +		dev_info(dev, "using pinctrl states for GPIO recovery");
>> +	}
>> +}
>> +
>> +static int i2c_gpio_init_generic_recovery(struct i2c_adapter *adap)
>> +{
>> +	struct i2c_bus_recovery_info *bri =3D adap->bus_recovery_info;
>> +	struct device *dev =3D &adap->dev;
>> +	struct gpio_desc *gpiod;
>> +	int ret =3D 0;
>> +
>> +	/* don't touch the recovery information if the driver is not using
>> +	 * generic SCL recovery
>> +	 */
>=20
> Not kernel comment style.

Right, sorry about this. Will fix.

>=20
>> +	if (bri->recover_bus && bri->recover_bus !=3D i2c_generic_scl_recovery=
)
>> +		return 0;
>=20
> No need for the first condition. 'i2c_generic_scl_recovery' is
> definately not NULL :)

It is not the same thing. Without the first check, it will return 0 if
bri->recover_bus is NULL, which is not what we want. If bri->recover_bus=20
is NULL (and the pintrl states and gpios are in place) we can set=20
recover_bus to i2c_generic_scl_recovery and use the generic recovery.

>=20
>> +
>> +	/*
>> +	 * pins might be taken as GPIO, so we might as well inform pinctrl abo=
ut
>=20
> s/might as well/should/

OK

>=20
>> +	 * this and move the state to GPIO
>> +	 */
>> +	if (bri->pinctrl)
>> +		pinctrl_select_state(bri->pinctrl, bri->pins_gpio);
>> +
>> +	/*
>> +	 * if there is incomplete or no recovery information, see if generic
>> +	 * GPIO recovery is available
>> +	 */
>> +	if (!bri->scl_gpiod) {
>> +		gpiod =3D devm_gpiod_get(dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
>> +		if (PTR_ERR(gpiod) =3D=3D -EPROBE_DEFER) {
>> +			ret  =3D -EPROBE_DEFER;
>> +			goto cleanup_pinctrl_state;
>> +		}
>> +		if (!IS_ERR(gpiod)) {
>> +			bri->scl_gpiod =3D gpiod;
>> +			bri->recover_bus =3D i2c_generic_scl_recovery;
>> +			dev_info(dev, "using generic GPIOs for recovery\n");
>> +		}
>> +	}
>=20
> I think this extra code from the PXA driver makes sense in case SDA was
> released while we were executing this code:
>=20
> 1383         /*
> 1384          * We have SCL. Pull SCL low and wait a bit so that SDA glit=
ches
> 1385          * have no effect.
> 1386          */
> 1387         gpiod_direction_output(bri->scl_gpiod, 0);
> 1388         udelay(10);
> 1389         bri->sda_gpiod =3D devm_gpiod_get(dev, "sda", GPIOD_OUT_HIGH=
_OPEN_DRAIN);
> 1390
> 1391         /* Wait a bit in case of a SDA glitch, and then release SCL.=
 */
> 1392         udelay(10);
> 1393         gpiod_direction_output(bri->scl_gpiod, 1);

I agree. I will add it.

>=20
>> +
>> +	/* SDA GPIOD line is optional, so we care about DEFER only */
>> +	if (!bri->sda_gpiod) {
>> +		gpiod =3D devm_gpiod_get(dev, "sda", GPIOD_IN);
>> +		if (PTR_ERR(gpiod) =3D=3D -EPROBE_DEFER) {
>> +			ret =3D -EPROBE_DEFER;
>> +			goto cleanup_pinctrl_state;
>> +		}
>> +		if (!IS_ERR(gpiod))
>> +			bri->sda_gpiod =3D gpiod;
>> +	}
>> +
>> +cleanup_pinctrl_state:
>> +	/* change the state of the pins back to their default state */
>> +	if (bri->pinctrl)
>> +		pinctrl_select_state(bri->pinctrl, bri->pins_default);
>> +
>> +	return ret;
>> +}
>> +
>=20
> Rest looks good! If you have some time for this now, I will make sure to
> get it into 5.9. With these minor things fixed, this is good to go, me
> thinks.
>=20

I agree will all your suggestions, except with the removal of if=20
(bri->recover_bus) . If you agree with this, I can send the next version=20
and remove the RFC.

Thanks and best regards,
Codrin
