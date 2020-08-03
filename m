Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496C523A970
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 17:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbgHCPdp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 11:33:45 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:28253 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgHCPdp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Aug 2020 11:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1596468824; x=1628004824;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZP9zHc+RtoW/r4LN9MNnECKyPjcD3QCtYDpMMSGohgA=;
  b=gxeYSalNa+x1I7S+Ce8V2KIesFE3dyRsKLoOEf3QmK2Rs2cAcQ5bjxih
   nU0uvHjItrkG4/PmXQ2+Q0tah7HIadXAVgb2LaExuybAS8W82y1fsnOvi
   W85kYVXv1LaWpxgwPepYf76u/UBfMbEbk08bKCTkup4ipW2X6BN/IHPdC
   3wIwl8BS6Y5V3slHzNYnJvHjZLYwyM9kyPGtNveO1uOxACZKsVD5VjMia
   wbIjZzgj/ziZf4F/dhyueiWhCPswkC53QAiNhvxWYybIBu8B5nwXgMq5O
   NtIr16oe7xZdGyExocr9UPG0j558BGa0bdOr2zARi5fkSEVmjGfBkHy5x
   Q==;
IronPort-SDR: t+86kMvNcOsyW1owOM/S5oHoVYgrbN4VF6cFc4lrjMaV+RGGLA4nRppnV6llvtad93J9e/LOKh
 nV3fkzVjuLgF//zNQ+/ORoHE9SLdf1VruxA6eXBi2MwXchNSAgrLDbLNPh+iHLEza2kNWKDrfv
 0Ep7bk7oAevNYcNS9NoE3Q7NyWaJIUoJUI/nApbGdKn2ARkPA+z7/l68XjjIUaYWEEXlNwi62J
 wFCNyJTElX04ZbfvUArebCrPSs37W05WGR00NaYjITp1zHyTqh7vtyCcdkSmWjX5+BrBCs2+Pw
 pb8=
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="86500958"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Aug 2020 08:33:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 3 Aug 2020 08:33:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 3 Aug 2020 08:33:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLU+C4pHDa4ePfhZS54jpjv2ofdPg9MmJ7cIgbkJHR/1ep+wS8ulW2TpU/P96UjFFcCtshGGp6vmIJAtJOj2+yu44m0GVAL2HPiExoJ82zlkp0d8MiMRnwb+gFdUWYeVEqvCQ/r+y+JkHQ1GqCl/WG8sl2WhQSTeIS3HLkaoq8cwb3Iud9EfxhlfhKbqc/51rjxNY+KdMBtly8oJx2ymUaO/rQWTtOrvAPRhKTw0n20iB2LUARzg77lblSTj7PqfWY3tmSnPq7Sr9MjSrCxDi7v9Ww4ZcQ+L+eEv0juQkO7OGtCz2WUkpHJ/2En1m6SveZBMh4zaXyEgFbRQ5uHqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFie4Z6MePp8d167KBYoHXywZHUOH+lggMzRgLCZ66A=;
 b=NFM32w5ypgZJMHx1eoUSMXG6PlsnSVA6HOGotS24MByLVCX+CZRM5k0SkD73b/FUSyibVCOBTG4LU0vdMGO11isJeM1HMnbW4y9SWNsftzb3S4BO3X+BlYHybZP37/1lmIDW1w2kFC+mMyv+aq7WZEVWwT1BAR1PD0ug0lBwM9+NVN17rK53sfP/VZ2IKUBVHDtXsOIPw7HCypjk7atofX2rH9a66JjHkYeC9JKVFQcnSzUr3eNpshf2gXG+8o+9xUTStklow4qx6X4jkg3qfilA/J7qg+o2pGNFN6WaxrlZW9uGp9SLQIvgbHD+HLp3dBmB1lU3t0xXLs6TpMjE1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFie4Z6MePp8d167KBYoHXywZHUOH+lggMzRgLCZ66A=;
 b=aLBdQVUhn3gVJahROYw6h3mZjmTTs2StOmoBNbv/M0LEDEBmh6TK9GDPiJCTU+cI3OjxWuCG98B1sJFOaKPleoysSa5+KaDk3/mGJWLecC/Dy1ocl086VQpn8EEZNFhJyRsMSOC0BaprRKE5kQVZ1kYE5SfNorqcPdEYyMHuug0=
Received: from SN6PR11MB3504.namprd11.prod.outlook.com (2603:10b6:805:d0::17)
 by SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Mon, 3 Aug
 2020 15:33:42 +0000
Received: from SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::c83b:2062:4e59:8ebf]) by SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::c83b:2062:4e59:8ebf%7]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 15:33:42 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: Re: [RFC PATCH 3/4] i2c: core: treat EPROBE_DEFER when acquiring
 SCL/SDA GPIOs
Thread-Topic: Re: [RFC PATCH 3/4] i2c: core: treat EPROBE_DEFER when acquiring
 SCL/SDA GPIOs
Thread-Index: AQHWRkTnXY0butV020yTUidEL/axqqklUZIAgAF4w4A=
Date:   Mon, 3 Aug 2020 15:33:41 +0000
Message-ID: <15a449fa-d649-846a-e6f2-1540f9581846@microchip.com>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-4-codrin.ciubotariu@microchip.com>
 <20200802170500.GB10193@kunai>
In-Reply-To: <20200802170500.GB10193@kunai>
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
x-ms-office365-filtering-correlation-id: 1e70a0a5-d500-4095-c229-08d837c29a0e
x-ms-traffictypediagnostic: SA0PR11MB4765:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4765CD69C2986B03026DC574E74D0@SA0PR11MB4765.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +XQrR8ULTxhRP+0/qWNkrUAppcVLg/eJzBuX7X32d3zvEnl6Ma1poIPwgJFHURMtLm8uPmd8Rz4BAVBbNRj8k6qV//9PWkUCeTmDR7hghoi3YxR08aGEhQq1H03iOKtG+8kcdM8TZgnGWIBgELSWsKECCm+8RwQVMKnUVnOF5LhMUnfeV7ilImYUX0WIfszyBgILgn5tuNK363aFAcLLfTmCivQU54ppuQKaED6FLcFSdQKAx3A97RZEA+wv8hbXUmPZEIjeXMSAR/O/Sdl3JEHhb28Sf7yInRdhw2geGmTmmEqOP1rNqTyQBd1bQXxB7mra6TBYHRRZKCCb57KZHC0FT9aCUBR6rdhKdSJfqLmpGhSnIhRvRKMwM8ctLDSY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3504.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(396003)(39860400002)(136003)(6512007)(91956017)(64756008)(66446008)(26005)(186003)(54906003)(76116006)(5660300002)(66946007)(66476007)(66556008)(53546011)(31686004)(6506007)(71200400001)(316002)(83380400001)(8936002)(4326008)(478600001)(86362001)(8676002)(36756003)(31696002)(2906002)(2616005)(6486002)(6916009)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: EHvCS5bATUqWJYGI+6cZJmPVnVCuk7+sV4ifZUP4FfJ4cFEt0vwZ8/vl6WlR9Y/Fq2Hi0rkTiqUrJszt9OkX4hB4D4eSpVNMxHxxhyaN6DMvCd6znv/+85yacz5NgcsbxiirSMaI2Xxa20qM9GHO/pfAz9yP5xtNdzJjntQv9BLf7f+S2k7mI5kcDnKRAmBy9CA2VQut45rDsOr5Z9CguFAk9UQtMIxUlooNLfeqUTDcCcN6lcdo0E98QonvHPfY+76vxR9FDdMRem7rWu5pb+LfsHZudePfDShfusJxXOPgrVg+mq+7XNZh8XwLhtzTfWOppJQiUHLkIbeB1codp0HpFckdlmLR13zddH1uMfPik/6Z+7Uv8C54rT+YhmjVjkYAe/JjAgcW7sC1OjtPbL9X4mwIipklLCCJK5r528/+2cjVeWsCWYze09YxIuhdc6ub1NgFoD3rlJuTXKlTnr5IbOp1aGcjPENn1k5MLbFjrdOT7GhiMLz9nD/UoBTdaN1MZrCmGydA95xK9bcQIxy/jUIZkER+Q10pplt7eaqM2nNCHmRqukKUE2j9BUwWJ5S6ezFP1SOPhlPO57SRMYRVKVY7VaPDEe1N9BEI+nFNgSQsyvrvUX3KmQ7u9w2YUt2rQmJTCFcLVEVtXF5bVA==
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <35F793B60A5DE54AB90ADAB6C9FCEB5A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3504.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e70a0a5-d500-4095-c229-08d837c29a0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2020 15:33:41.9394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ior3wEQ6sR4Ssw2yVN4/v1IByjN6KiSeLILS0n5PIi4GFYIzFusjU1Ql3hMdpBIatOw8j/sr8DQ1laxHG2ZG1LWOOInUMz+mo9hvTSgDG24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02.08.2020 20:05, Wolfram Sang wrote:
> On Fri, Jun 19, 2020 at 05:19:03PM +0300, Codrin Ciubotariu wrote:
>> Even if I2C bus GPIO recovery is optional, devm_gpiod_get() can return
>> -EPROBE_DEFER, so we should at least treat that. This ends up with
>> i2c_register_adapter() to be able to return -EPROBE_DEFER.
>>
>> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
>> ---
>>   drivers/i2c/i2c-core-base.c | 22 ++++++++++++++++------
>>   1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index 4ee29fec4e93..f8d9f2048ca8 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -368,15 +368,16 @@ static int i2c_gpio_init_recovery(struct i2c_adapt=
er *adap)
>>   	return i2c_gpio_init_generic_recovery(adap);
>>   }
>>  =20
>> -static void i2c_init_recovery(struct i2c_adapter *adap)
>> +static int i2c_init_recovery(struct i2c_adapter *adap)
>>   {
>>   	struct i2c_bus_recovery_info *bri =3D adap->bus_recovery_info;
>>   	char *err_str;
>>  =20
>>   	if (!bri)
>> -		return;
>> +		return 0;
>>  =20
>> -	i2c_gpio_init_recovery(adap);
>> +	if (i2c_gpio_init_recovery(adap) =3D=3D -EPROBE_DEFER)
>> +		return -EPROBE_DEFER;
>>  =20
>>   	if (!bri->recover_bus) {
>>   		err_str =3D "no recover_bus() found";
>> @@ -392,7 +393,7 @@ static void i2c_init_recovery(struct i2c_adapter *ad=
ap)
>>   			if (gpiod_get_direction(bri->sda_gpiod) =3D=3D 0)
>>   				bri->set_sda =3D set_sda_gpio_value;
>>   		}
>> -		return;
>> +		return 0;
>=20
> This is correct but I think the code flow is/was confusing. Can you drop
> this 'return' and use 'else if' for the next code block? I think this is
> more readable.

Ok, it makes sense. Should I make a separate patch for this only?
One more question, should we keep:
if (!bri->set_sda && !bri->get_sda) {
	err_str =3D "either get_sda() or set_sda() needed";
	goto err;
}
?
Without {get/set}_sda we won't be able to generate stop commands and=20
possibly check if the bus is free, but we can still generate the SCL=20
clock pulses.

>=20
>>   	}
>>  =20
>>   	if (bri->recover_bus =3D=3D i2c_generic_scl_recovery) {
>> @@ -407,10 +408,12 @@ static void i2c_init_recovery(struct i2c_adapter *=
adap)
>>   		}
>>   	}
>>  =20
>> -	return;
>> +	return 0;
>>    err:
>>   	dev_err(&adap->dev, "Not using recovery: %s\n", err_str);
>>   	adap->bus_recovery_info =3D NULL;
>> +
>> +	return 0;
>=20
> 'return -EINVAL;' I'd suggest.

OK

>=20
>>   }
>>  =20
>>   static int i2c_smbus_host_notify_to_irq(const struct i2c_client *clien=
t)
>> @@ -1476,7 +1479,9 @@ static int i2c_register_adapter(struct i2c_adapter=
 *adap)
>>   			 "Failed to create compatibility class link\n");
>>   #endif
>>  =20
>> -	i2c_init_recovery(adap);
>> +	res =3D i2c_init_recovery(adap);
>> +	if (res =3D=3D -EPROBE_DEFER)
>> +		goto out_link;
>=20
> Please move 'i2c_init_recovery' above the class-link creation. It
> shouldn't make a difference but we can skip the extra label and the
> ifdeffery.

Ok. Perhaps I should also move the debug print with the registered=20
adapter after calling i2c_init_recovery().

>=20
>>  =20
>>   	/* create pre-declared device nodes */
>>   	of_i2c_register_devices(adap);
>> @@ -1493,6 +1498,11 @@ static int i2c_register_adapter(struct i2c_adapte=
r *adap)
>>  =20
>>   	return 0;
>>  =20
>> +out_link:
>> +#ifdef CONFIG_I2C_COMPAT
>> +	class_compat_remove_link(i2c_adapter_compat_class, &adap->dev,
>> +				 adap->dev.parent);
>> +#endif
>>   out_reg:
>>   	init_completion(&adap->dev_released);
>>   	device_unregister(&adap->dev);
>> --=20
>> 2.25.1
>>

Do you want me to integrate this patch in the previous one?

Best regards,
Codrin
