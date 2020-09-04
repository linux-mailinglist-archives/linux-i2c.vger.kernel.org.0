Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B6F25D404
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 10:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgIDIzn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 04:55:43 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:63110 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbgIDIzl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Sep 2020 04:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1599209741; x=1630745741;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=d6f7YL2OKhwDdKRk1U2kHqWvAbfZy1bmjZUOIS8/UNQ=;
  b=AJBFD2WygGvfstVXLIOeMQ+vVw6Kg7CMIeYn+DncaUNr6Gnv7bSxSNd2
   du0XF5wsl90VjOaOXT0KB1S4poUMDtaZMrh5qL4PtLCSlNRPUXWE6k4/2
   w7hvxJE4rqb8goq122oK+4hy1iyAy59TPzZSk1PPoWrV+CmaMSUhvsOuM
   EDNZMtx4Q5XRKguROmosJMUbu5UQ2+zyu+fMq8SwPP2FJFLxqGV4TXBWs
   iGMIBPvd04RFNjjzaO3cLL8vHbMIt77NNASXQSB3Vxn46FqVedwPMlyow
   FYXGk+UImO2PjlF0z/0HAX73QnjMT99gMeRPtGk8NaiuJt0ZZiO0+cr1G
   A==;
IronPort-SDR: 7HhQMYrOoqZvi6ER8Jyhp+oEDQmDX+/2/CxaYnvKjdBAPyx5YQDZy3kbiQ6J3WQkNuI6HwaIca
 HxEgIJe0CNMu1VDdfJCUQf2Aefp9I4+mSLL96Wx0f+eQUnewyNCT4hm5bt21Yo4FoDnbj0h915
 Gk236FJpr9tdd/JNHAkFE1AXBNf33IKz64/baTQsAhILZqC/9LOi4V2W42m/J6CWyFnHMe67qj
 7v8PAiIGupivTMTRPMxp+85XlfXMLltDUmQXonjZeHkHhmpurmUfLoXEq5/z3lP/3dsuYARx8l
 z4w=
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; 
   d="scan'208";a="94410736"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Sep 2020 01:55:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 4 Sep 2020 01:55:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Fri, 4 Sep 2020 01:55:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZzzSx1BWovzvWSI5xPK1Vgows6teu/3BwpjbdMScV46TZC89Pl7IJumY8W4zdyhhE7c4zaTzB9C+4NfmWM8Lycog0mBLwwEAp9vfhsVTvwButHRUE9f8AgsnIpwbGZ4HI7vPMInU/5igRCj1Iq0e0cFFExuD43DIa9xAEwdrpCGHlZHyOYS3HLIwleIyyBnFt3TDMKRjlf++D/eJxfdi1hmntrcGiEwD0rCP7o63OxmlKiTzHwkQh8FRIzCtio/3TVP8x4sTGh9FWTH6imI8b7pFVlPqGyv9cuumxKpz6XXxa70QyQB5kinyDE4L9UeB2n/IDFMHqgoIHgh7Eay/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6f7YL2OKhwDdKRk1U2kHqWvAbfZy1bmjZUOIS8/UNQ=;
 b=Ih3Zn7+LZX5M4VHJQA5nW4FdfUujP6y74jaLS+BDMXtTLl98yur+57HcMJDqiqvFwCcrF2ruh3sSCUcZ/QcW8ifF9CkPB+yTkHNZ5jvgSk1Q/SGwLZnebaZ8/FXwIXeI3jGeKmtKH9AomKpB4kS2Jr9og7+IErXqcV1ODsr4EBQBpMsszVp/RNRmaCj+76b9WJMPIblYiohpznmbdCFUORto/a6L9OhT8QuXEEGqt78dpYLlIjFz3Lu62DDXMXDRWno/0rIA9hbo0DwQlE0IBeh/MSJxTW8vGwtlRvzDj8VavnZgl9xeu5+Q06PKxPU7jyP74Ki5G8SzdQpSrfQazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6f7YL2OKhwDdKRk1U2kHqWvAbfZy1bmjZUOIS8/UNQ=;
 b=b9ZvJxqv3cZz86g7fYlWgswj+ikSW5S5shEsu18tJ8kDf2aw95YHp4GwlHvnE7MJY484yAAzRT24VgvCthidkIVNSpnVJAz331+z1z+MTrN5U2MNJXZmQrpwRPpi0zaP4FVaVPMrzxY64mdGB+h3DUdJTqHVK9XhErsjoBJQFY4=
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 (2603:10b6:903:b1::22) by CY4PR11MB0070.namprd11.prod.outlook.com
 (2603:10b6:910:78::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Fri, 4 Sep
 2020 08:55:31 +0000
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::c57b:e93f:98a8:c654]) by CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::c57b:e93f:98a8:c654%11]) with mapi id 15.20.3348.016; Fri, 4 Sep 2020
 08:55:30 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: Re: Re: [RFC PATCH 4/4] i2c: at91: Move to generic GPIO bus
 recovery
Thread-Topic: Re: Re: [RFC PATCH 4/4] i2c: at91: Move to generic GPIO bus
 recovery
Thread-Index: AQHWRkUH28LN6vyz50q8ydS45lftAKklUoAAgAF6cgCAI4blAIAOUeWA
Date:   Fri, 4 Sep 2020 08:55:30 +0000
Message-ID: <15466c95-f1ea-63a4-1429-24d9b7567c1c@microchip.com>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-5-codrin.ciubotariu@microchip.com>
 <20200802170820.GC10193@kunai>
 <65890aab-1d19-7e7e-abff-3c6ee05c8ade@microchip.com>
 <20200826061444.GB1081@ninjato>
In-Reply-To: <20200826061444.GB1081@ninjato>
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
x-ms-office365-filtering-correlation-id: 28e66f7c-3827-41e6-6e1c-08d850b04712
x-ms-traffictypediagnostic: CY4PR11MB0070:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR11MB007080ED110C76346A3059A5E72D0@CY4PR11MB0070.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wekr7cd6G+K2YkGbZPNSuPkg1ecUq+JRk7OS4ppKCHm6ufE7e+zle59FXdYEf/c//SsF1xqPX4geG9Mlfnre5IWDENux8pta2HKoIVASIpTySpim+Qexko330bxJxc4PdzMgIWrfu7xVb72WqjH8UyzrJtn9FGD4FiOHdgcWBFzdJfQF/MOx03Mh2/P+nbXTushEH0q7p1NlhsO7mNPYs62YiczZSIzH4noYi18J16MfrxS75R1WRmcohv5/qj7sWyn0Dh4neBwdlVRUp/NP+ALwty4BO5KinhqBcAbK8lFyYlI8vE6qVH0wl7cM0tFXuyxK2QiAoY4KCxWVo37cMZ3bImlF09V5VLJQ/6hfmAm//nuIpYD8XCfmvh7/hgC0qrLAGVtg2WB+FvrXniDmLw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1101MB2341.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(366004)(396003)(346002)(39860400002)(66556008)(64756008)(6512007)(66446008)(76116006)(91956017)(6916009)(66476007)(66946007)(6486002)(83380400001)(8936002)(478600001)(4326008)(8676002)(2616005)(5660300002)(31686004)(53546011)(86362001)(26005)(31696002)(186003)(54906003)(71200400001)(2906002)(316002)(6506007)(36756003)(41533002)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ClxthGaQVqoXf+ggxkPZORNQbRPiMriKDCo9IowgilMVs9Trt3FQQuhEGIliID8wH2ODtDu9OXFaEnNoS8zatWMeR6Zh7IY2+YilkNCJ7q3BPgcdPszwVzB69ePWUkGwhVRKpM3yT1YcxQ6ECp72hKP/If1R502cebG8oPTWTwoAK0ku0QbVNht4zMAZ9qv7r3W2H8KF+4xVEYexSBMRsSQQOjO6Dh5qOWLEcdb8X78kVSIGfQ4etZsBAQZmeLJWtl91AYVZTVCg+VZpX5NokGH8sGOdk4/pC0O4SH51ZfSRJL7/3ppsw8hvCEB7NVkg/GFxrpK0XxzDS/YOyXwB5W6X53xFXe6qByaMW3Udy1F6eOU9jdVGLpmsYYxHijLpXJO0AEmf43LGn9fP+d3INohw+76JHFcM1T7nQHpDrLt0b+l8JwRBkeuHJUYY/tpA6UyaJFFHbUKXBeM6Vf5L2kzgTJv4y37aUjsEM0H0w9ac2pKr89Lzb6HOn68TNYiwqiTa8XbsRD6jmFyYIgL25c0EW1QVB2GPOLWSDlB/J4cV3sOo1JH6IZZmh/yN6RxqG3Bfth/duvvVEhdddHVk7E+sLydcpkbuMBkbLIdJUWTNBkaLfA9qwucZ+K4GSFX6ZGag2+iFSNQ2U4hBFOMBCQ==
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <F03D349C753B32459467A66588A5B40D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e66f7c-3827-41e6-6e1c-08d850b04712
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2020 08:55:30.8592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LM00InGX560ruvvsdhtkuJ7WhcbmOHyZrmC3m16cj/t/Sk3h8RvuGDq6ZPCoYRopqXxBWa+14y+G7EUBD0aDUZpAnMkNTBbOepaXzz8SR3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0070
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26.08.2020 09:14, Wolfram Sang wrote:
>=20
>> Thanks, this would be great! I tested this on a sam9x60, with the HW
>> feature for the 9 pulses disabled, with a picky audio codec as I2C devic=
e.
>> Please let me know of the result.
>=20
> I can't make use of the feature on the platform I had in mind, sadly. It
> doesn't really support switching from/to GPIO pinctrl states. If that
> ever changes, I will add bus recovery for that controller, but I think
> this is low priority.

The pinmux driver needs to have strict set to false, otherwise the=20
switching is not available, not at this time at least. Perhaps there is=20
room for improvement here, because the I2C bus is not using the pins=20
while we are doing GPIO recovery.

>=20
> On the good side, there are patches which make i2c-mv64xxx another user
> of your new mechanism, so everything is well, I think.
>=20

I saw them, I will try to take a look.
I am not sure I'll have time the next week to work on what you asked me=20
regarding sh_mobile and PXA, but I will look into it the week after that.
Sorry about my delayed reply, I was on vacation.

Best regards,
Codrin
