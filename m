Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43C3EA5238
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 10:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbfIBIyJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 04:54:09 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:12731 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729849AbfIBIyJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 04:54:09 -0400
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: yPTd4nFNtCbQrkRPlEaLQRzDVDetN/j1uINpTJcr7CP5ISmZDtYnSJbUUyRDgCahRxUN+uSWeO
 4Jj47QPFfHCgrqsjq/k/b04Mr6nt4eSjoWPrWrY8MLHzQm0nRN8HjGaqad6WhZYv1KBN5vbMx3
 4+YMZuyEZPMLfPN831a9o3CwYC8a8HFbgUQ5iRbGllT8/nIM21k2QOIjkxl84LExNBcvO0dm5v
 FJaM7LvamlLX+3Ne8l5HJ/oXVJZXkvxNiWZGCvkMXBnOQCPZv2GCnMGc8Mfdm4NMl6pX5E92f5
 Jik=
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; 
   d="scan'208";a="45874833"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2019 01:54:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Sep 2019 01:54:07 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 2 Sep 2019 01:54:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+a31x4xuLlr+0bGywJ5x9zL8oAsTiNlTo7fbV7ZEONb71lFu1BwZtxpG54uprBc1sx3bBkLz6fr/zgHGQXkiyrS7RJPZlb9HL3gkdGogw2JNis4pX3BwMowDsQDz4rvHM8wk5ubprLiFAShh4y82Pn9b5whfLbyW9gCJi72mYCsSw4g1xUYbnnz31Q+hSglOdytmrD25aZxIZdceUV/yOT7DHhJYFiMues9I53F5+TgkVJTtVhDm2mMJPvZ8M0dNWDUhJ/hssuiLdwxJP61InwDMuAdREmvmITbACppctDIAhAAWwMfZxdwY//hSXEHTPOU65Q1R9pmrEldW2I98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4plhd8t7AnmzJIX55wPihgt9ctRDcx8RRXh9KKZo4ao=;
 b=WXqe07a1Mpsa+0dyzGowZ5osRoACl1m5h4o0x24RaLs8FlWQQ+MXQPYwZot8Uz2b3BqVgpFwVDDk1AodGuhfOW5sgFZccGqruDlh3wRSEnqxP6jaxUETrWaU4FEFPB/UFWfmA7PbDQzILCTjak3x9jdhXn1F5839fWb3FvphWySduU3fZPc04Ktx5I11Aer/ARMuE1HaP6dU7OAQzNDsyB7b6lqCah1k6oyzF79j86k/sHJ35QvL+qHwnyADVyHJSy4gJZvesNYSGA7To2bDmqXJcq7caVqSSzjtc9UYw5K5pFFefd99j3V+Zhfh06yikv2b37vtCFQUEdx4FDiu1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4plhd8t7AnmzJIX55wPihgt9ctRDcx8RRXh9KKZo4ao=;
 b=P7hn6PuDO9Vnv/VOzuKqXQXIEiFmienQF92yAaFEf9jdFquQETJD4RyODbOjckxKeNGsNLSThiolb3Ndbd/pAFB64+lVEuuRMFn5fZPvdkm9UI9aR86iVgknQ5LqAFU5saa+6f8OeDPp6ASF/SKQeMJmUa05YxYfxrknbmVPfMk=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1930.namprd11.prod.outlook.com (10.175.85.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Mon, 2 Sep 2019 08:54:06 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3%10]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 08:54:06 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>
CC:     <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        <alexandre.belloni@bootlin.com>, <linux-kernel@vger.kernel.org>,
        <pierre-yves.mordret@st.com>, <Ludovic.Desroches@microchip.com>,
        <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <peda@axentia.se>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 5/9] i2c: at91: add support for digital filtering
Thread-Topic: [PATCH v3 5/9] i2c: at91: add support for digital filtering
Thread-Index: AQHVNlj4SZXsGDZbFke7Py4QXQ+nT6cVfjQAgAABUYCAAuouAA==
Date:   Mon, 2 Sep 2019 08:54:06 +0000
Message-ID: <d461426b-50ac-bf6c-79e0-71e17a63400e@microchip.com>
References: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
 <1562678049-17581-6-git-send-email-eugen.hristev@microchip.com>
 <20190831121308.GB1032@ninjato> <20190831121751.GC1032@ninjato>
In-Reply-To: <20190831121751.GC1032@ninjato>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P189CA0036.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::49) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190902114832939
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: daf65498-9809-45ba-d170-08d72f831c77
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1930;
x-ms-traffictypediagnostic: DM5PR11MB1930:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB19309F9F45FF2F21FC18A730E8BE0@DM5PR11MB1930.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(346002)(366004)(39860400002)(376002)(199004)(189003)(86362001)(14454004)(31686004)(478600001)(99286004)(66476007)(66556008)(64756008)(66446008)(476003)(53936002)(52116002)(102836004)(81156014)(81166006)(6486002)(966005)(31696002)(6306002)(25786009)(66946007)(76176011)(6916009)(7416002)(2906002)(8676002)(53546011)(6512007)(486006)(6436002)(446003)(305945005)(7736002)(386003)(4326008)(8936002)(2616005)(11346002)(6506007)(229853002)(256004)(6246003)(54906003)(316002)(66066001)(5660300002)(186003)(36756003)(6116002)(71190400001)(71200400001)(3846002)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1930;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MrfrATZwObVjzjVRwgPkkOObfOPDyrLMNVptsA8ejW3NksHDGi9LFhgheFMsy9RG3tDK0iVrK4dqMHfPdSrovBMAz150jJt5eTmbIRqhAvMLdYA6O3gc9OdIHbwLdEOK5P/6ncu7OKjFK/3WPhs2B0jWU5CiHvzM2YolLjxx/oNlERJFS5VUyDBsFTnNZ8NNi7I9bG3BoECaby+6FrbxHUyjvLo2JpyD2EHx/iFcfuNS2m89+O7yXO7m1ivQTSORjzkN5Y9OQB5JmpqZd1DQ0DLRdL+UsaAkmwm3i6tRgircBIOfrzoDRMyeTehtrQuv+sONU0f0jxsnLZSfOIRIk3zNqF7HWYV/pjOi+7fP+wUT5hXwttxMF8CC39L7EIljPVUltDr+ZVxNtr9SOe0/YSULY3kzHOD7nmE0xNShRQc=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <6F1F9E0097244B4784028B912D065ADD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: daf65498-9809-45ba-d170-08d72f831c77
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 08:54:06.3559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eN90fKVx81vqltFaisoCbiMue76A4Xq4yaVnG/165Pn4/h6bwZqWuUTQKomfKO/sk+bYo27Owgcac19gMwp8gctl/xE0ENzRMnKH0FQROGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1930
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 31.08.2019 15:17, Wolfram Sang wrote:
>=20
>>> +	dev->enable_dig_filt =3D of_property_read_bool(pdev->dev.of_node,
>>> +						     "i2c-dig-filter");
>>> +
>>
>> What do you think of the idea to introduce 'flags' to struct i2c_timings
>> and parse the bindings in the core, too? Then you'd have sth like:
>>
>> 	if (t->flags & I2C_TIMINGS_ANALOG_FILTER)
>>
>> Would that be useful for you?
>=20
> Forgot to say, we can also implement this incrementally to make sure
> your patches land in 5.4 in case you are currently busy with sth else.
>=20

Hi Wolfram,

Your idea looks good but I would prefer to have it as a separate=20
enhancement patch, after this series gets in.
As things are now, this series/patches do just the filtering part. We=20
can then move all the optional 'flags' as another change.
So yes, we can do this incrementally.

Thanks !
Eugen

>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20
