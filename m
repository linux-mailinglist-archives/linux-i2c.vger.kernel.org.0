Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C36F23A9BF
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 17:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgHCPm4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 11:42:56 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:5014 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbgHCPm4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Aug 2020 11:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1596469375; x=1628005375;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=X7GhNHDNBld0ATHsHCpT4wlfpTjNxEFBBI5jSwbyCTM=;
  b=i7M+yxWOc5tK1+oS3jA22NOOWQsr/fNIFujRkikwH6v0+WpdDZtFizzx
   MlvyH45DhaR/2QOzahhGl98ffPv9jkB3z8em9DRyLT0V6ccZZnvqjpZmI
   NuXxae5IE1J6/CE+ZlCcKtnfJ1iPP7hy74/ig21hbZIQUCrQvcp+xjulP
   7R/sk0qE8n7d480/8bHTXZvHDG2HmD/jJxTgYv0HwKaPCO1QHsXitLDdx
   a/cahOQNtwcKUcgiQvlb3RqTcQSRVNazSxXoQgpUak6Y60Pj8xpZD7Bvr
   62SnpZnNlmlhUQDcGJEgj727/m6u5cCP1tlcni7bZsA74b5lwVAkJZgFU
   Q==;
IronPort-SDR: 0NE7ifo3Q032NIOl/p0cY2f986dlDk0+hxYwnCXxfuUAdSXs8frYbeoG6Zu1RhYR3BIi5RdoXc
 EAct2Vo575sK0gK02OA8rzwGEaKooRgFfRGoEFNgW7mV/UrIRRbiUdT6l9VJ2STT9dBhUcs9vj
 YZUpoIJrmLVustIxBfOZj15eIAvc7PqxVcOTJOgyw0fSQQ1uErZnVC24zLuU06eWye3O8duzvL
 58BEU2iqVSmYpZdRD27LZSMzmE8am40WBieqBxLtyTjFsGtNGYKw9nuU3+9J1fckMDuUJcE9LF
 Dmk=
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="90257468"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Aug 2020 08:42:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 3 Aug 2020 08:42:54 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 3 Aug 2020 08:42:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpjTgr2xdH5OgLAPh8WhXTh9vwv9rmlSGrPtibkDKQsKbZXRzplFyEYWUPwjq49lIHQo0B1wwGOgiVQd5tto0sIYLY1YIMIUqyHDEmF8t8KK+C+RzT9dYT/ve0EOcJ4PVdB0TyNjexAYz85gH5ZRtpc6yl4zCRcYCKM9Z35YSpWdzxAH5LUA96KfLOS8Dxh5/PfEjiqG6yEdAq3g4LVJYJE9eukkFnbOFYDEXKDS95RRtprn1yMbyvjGiKIbF73AS4+psrO10pQWGt//hkSxyHBhO7lOUSC9v9ngUr0XVdDYii7Ehes4UyjC4lwcNULQcaMIQWRu9GImHraOtFOh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4hazMDevnP0aXs4MkGpT80XdIS4hMMLvFnjRrNwyxw=;
 b=SumvKF2xVjDFY6BQjQJNY9k6UhCe38Zp6hssjQA/Lhe6uhfRk8kitiNv5r52jauIb+LAKLkm/ONipl4h0Tj1jyTs1NZlev3RWDpW6d6Tv+rnzA2IIuTIh4t36Ok11N7gsRZM34qVAh5k3PjL8M1up3FS0lSopmi/XBcvH7zrblpReithgDZwsvQaPpuFR/e0j5rqvrzMTtPb62c3Y5NQmzaBpBDChkT6kvgFxStnLmDWQOnDS+JwClwzEZMBWrqqo2fgMlsAikrvnYndv5xdVXq0JMmerKdZIq6sxhNIz+0qLi7jN3u20ui5EQRbWyNFlUw4GFMxat+lqqlUWs6nOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4hazMDevnP0aXs4MkGpT80XdIS4hMMLvFnjRrNwyxw=;
 b=lbUwMAYj69xTgX/VcQnEaYVgYxjeZTQsc7vzGQQMLiSv0C9d/zSheNGsyI1VulsNY7wGPjWT9il9KE3A1oWl0ZxGf2ZPrx3wC5338VGyapVHDGkNLap8+6BOUPcjh3ZKejpdhnpvVH+8Gt04HYxrAU9HZd6AbI3Zq4C0E2/To+o=
Received: from SN6PR11MB3504.namprd11.prod.outlook.com (2603:10b6:805:d0::17)
 by SA0PR11MB4734.namprd11.prod.outlook.com (2603:10b6:806:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Mon, 3 Aug
 2020 15:42:53 +0000
Received: from SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::c83b:2062:4e59:8ebf]) by SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::c83b:2062:4e59:8ebf%7]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 15:42:52 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: Re: [RFC PATCH 4/4] i2c: at91: Move to generic GPIO bus recovery
Thread-Topic: Re: [RFC PATCH 4/4] i2c: at91: Move to generic GPIO bus recovery
Thread-Index: AQHWRkUH28LN6vyz50q8ydS45lftAKklUoAAgAF6cgA=
Date:   Mon, 3 Aug 2020 15:42:52 +0000
Message-ID: <65890aab-1d19-7e7e-abff-3c6ee05c8ade@microchip.com>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-5-codrin.ciubotariu@microchip.com>
 <20200802170820.GC10193@kunai>
In-Reply-To: <20200802170820.GC10193@kunai>
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
x-ms-office365-filtering-correlation-id: 62fd1798-b8b0-45bd-013b-08d837c3e26b
x-ms-traffictypediagnostic: SA0PR11MB4734:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4734ADB862052287EC3E392BE74D0@SA0PR11MB4734.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m0NeT7BK/mdhfPrcZGmGYeNMlcl5qRK55Iw1IEscxmpuRJrw3buM3DGIWFJ5DRqRywlaxT0MNtr2Cu21gTJfP9v2yulgAn6/oZKKr02XhUP9lrvK8CE3UceJqX6SQkY8L3JvjWCbzxtwwLtvAzs3UO2nd03ewOxbvIse3JlEARbI8cWAp0v6o8NLGnjFsetf+yTTCgsYZwPb05eGsH3GyQHvraqRYeGIPW1+KDlzCmOf0ioTIRzyyfRwx84QBvjjT9BI+ONCVn+5fTMNAWBnwbMpdT5wc6DLoYD1ix19Sem7JMObP0lSGWU33pql1hVGbHV3K8W9pjpNilNysg+EEWDYzGLDldY8wHjE0kKh1C0MJqgIPBc8y6sO/8K5Zh0x6vLsscBAHHHdXgswrZ2vXw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3504.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(136003)(39860400002)(376002)(346002)(366004)(8936002)(6512007)(66946007)(6916009)(83380400001)(478600001)(4326008)(8676002)(31686004)(36756003)(66446008)(64756008)(66556008)(66476007)(2906002)(76116006)(91956017)(2616005)(26005)(316002)(86362001)(31696002)(71200400001)(54906003)(6486002)(5660300002)(6506007)(53546011)(186003)(4744005)(41533002)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: m5h5+4QPb6I9kiJSAVkzs1eFv7RYf2eLvBWIAl2+sA1cISXBNFV/lJx5f6D9v75zjtjJOOxp8Vlou9jbrPZ/7wuuzLlMj1SDznk8CiRXEkvgFC3o2ZJZ0R9LjnzRfMRUknb5EPXJe1a0Ey6ipQxJU2T7gwATvznksmK4rf0Ja0WkVlG0vTevVcO09eqx6SV+XdrDkVESEOwYQwgp2ZAzNVJT6jV2s8x8NtkXjDgjYj/P8BTNbbe3+wxvjxU3klxvCA0aaP6tOznaOgFN/YgsQ5b0DQaBZBjH/BqtxvPBYoVval6yOm39I+t2bP6EF2wRn8aEmUcU68EvyTHOpb3deGT7z3u1fTEFBlYwQQxc5BwOOOBSgwMHxIQI4EOKFLRr/9RkFY6srMfqjaPPyj+f3an5WS/a0FEhuRB6goxu60Dj4ym8CF7GbWZZsSrT2goBv47+v+hqA+4Do+gs06IhDR0EFtvbqyocZUMkTIj0/zjlVitcXNYkDLh5sEElGJmySSdXZtONPL/+g6vB26dt4ERuOzcfCX5xEXyoSkx9hAJexGkYGCslrsHv5CuPhH2/EuZpxWwPYw5OZBNC0Po9LqYqQNsyzRq7z6LpboVpDos7L+qA7E6iz5DzpxcGbvzPb2qrQcsg94E8KfG2hvY4WA==
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <69FD854A2D0B194680CD655B27C7A1B7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3504.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62fd1798-b8b0-45bd-013b-08d837c3e26b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2020 15:42:52.8606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waTJSgHFbBHOr1pcjZmPq2NsFGH9BiHdJ/wEvKFaJr+nK96UM0BdbNXw5/I4wGLuHeabGvRVu4vzoLw84+pe0Z2lGI8MKDvFa/MfA4BFRyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4734
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02.08.2020 20:08, Wolfram Sang wrote:
> On Fri, Jun 19, 2020 at 05:19:04PM +0300, Codrin Ciubotariu wrote:
>> Make the Microchip at91 driver the first to use the generic GPIO bus
>> recovery support from the I2C core and discard the driver implementation=
.
>>
>> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
>> ---
>>   drivers/i2c/busses/i2c-at91-master.c | 69 ++--------------------------
>>   drivers/i2c/busses/i2c-at91.h        |  3 --
>=20
> Nice diffstat! I will try using this new functionality with another
> controller next week.
>=20

Thanks, this would be great! I tested this on a sam9x60, with the HW=20
feature for the 9 pulses disabled, with a picky audio codec as I2C device.
Please let me know of the result.

Best regards,
Codrin
