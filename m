Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C2322B37B
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 18:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgGWQ3F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 12:29:05 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:43777 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgGWQ3E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 12:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1595521743; x=1627057743;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eZCQ1dmQVJdRgF4hPZHE29F4K2hrnNSyviSfrrRpnXw=;
  b=i4lZmqr8dvndGMa0X7f16a4AzurKDdxP3FDLXZdgJTkGP68cG7Gtzj91
   Oc5QAd0JKHAutwXBcNZPYbbLtefeCOkTUA3eQBkJ/o6GZ3wKjvHk4At0Q
   6pT5Ck8hNAV7fXQ8pjVJw3m4YYUmihE1WUWjS0AmzJVLt7fSKTY25X9s7
   q48SkGcy/kuHaZGuki94CMRDZ6VhqiGHzL+dJdijJlEhv9KFe4S0Yfju1
   OQuOsxqCEggbR9LSvJ9C+acTtLggFtfnic/yizvIv5MBBAIsWRil2qfEn
   Di2aGIdKIWAe2HwdNsWhvlgPq4EivVcru2YEMsD7TRD8byJgl/u3MOSK4
   A==;
IronPort-SDR: 0ichbf3yCr2yWOnje0L3FieO6RUI47Si71C+pV2UpvsTZQgLPHGciv9mTqfCOZF9fVAVzi2QWf
 +p7ouwhE1lEyify3E9t5JoKrkU3U/OBxuQPi0s8lNj+CzJncBfsjiVqBkVZaOl6BdU2YnSGeoB
 +NETDf3G4sl0vvfBshcGo7UaoJOk7cSU145BJl6zt4+GU0EtSq4MO369EwzdxojzVgA23irHfb
 EpvQrT5tuJ8vaZqpF/qo05D26aO5dICc3FH9N0Gtz6jiv6853FlQ84F7Gc+CXxGC+mNzzSZYKY
 2sQ=
X-IronPort-AV: E=Sophos;i="5.75,387,1589266800"; 
   d="scan'208";a="85132091"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jul 2020 09:29:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 23 Jul 2020 09:29:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 23 Jul 2020 09:28:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0o3RZ6jdPlWRltyRC7TvLAhM91SQvDdtwUZ9e3Nqxa8B01Bio+J6l/obhU1/OaH8VbfMHMIzsQpiSIHn8yH2SfROi7/IAOHmeNGJhyA6lz3zm8frvEQ7heSPEBLwTmAafRU6HFcmIeiOwMBlqYusbEGgbmaTEgD6JITdtc9uIMlTqNrqXaD4kExQReHDykZytiHwCQF2Z8IjVJyAcJhkPXiGcorwlrDafLodGn/ZeQyXWwAMologwxJBudkuDiqQuSWX29Czrc7FItgLh5wLB/QGqPeByEITJVbCQ0DLE9MVKU5Sy5HOMHTxDRBcWB8Kya30k5sI/MlPvU5SMJerg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZCQ1dmQVJdRgF4hPZHE29F4K2hrnNSyviSfrrRpnXw=;
 b=RAr8oARmDV8xBWA1GrRFI+2MlVtpI6mJfsT25nPpUt29dAZNT/+EECqe5SMI7535GMbEmiBOec084EIJa6BfRM5CbVkGfF2ddtxqUMHcstWGy9OaJ8OeZ0feL+8ukUYNj0BfTM6a7MMpFBtavsnd1z08b3JSz2q0pE1ZJ6H9pnXobRrF3+PXKUpNv6gTcMTbPl2BRjsh2PqW237VYAHnCdvTrCfxOGmocgOxRnrNyTZHvj3cJoLT8Sz+6czs4+DVxMT724gHlgiY77uD171LwonmnYy5AeWjL/8EMWptukjDw9vF2JihaFhMhwBx5FV6U5QOsdOZ06fliIPZbnlWEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZCQ1dmQVJdRgF4hPZHE29F4K2hrnNSyviSfrrRpnXw=;
 b=XF4J/zA0QOlLPItF3FbveBBRIZ1cJ4wybEJctK+AWlaUanTUPcjehRqq8h++baeRr7XVDrDadXUFu6QDp7LVYuy5GxVAswYgcEGUt7ErpN/NtMUva0HjuyE4ssvnRAGkryRe11MVptPF9yacfEN6u1jSgD9ENdC/tjuTyCUZc+U=
Received: from SN6PR11MB3504.namprd11.prod.outlook.com (2603:10b6:805:d0::17)
 by SN6PR11MB3262.namprd11.prod.outlook.com (2603:10b6:805:bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Thu, 23 Jul
 2020 16:29:01 +0000
Received: from SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::851c:67fc:a034:9ea0]) by SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::851c:67fc:a034:9ea0%4]) with mapi id 15.20.3216.022; Thu, 23 Jul 2020
 16:29:01 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <wsa@kernel.org>, <Ludovic.Desroches@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>
Subject: Re: Re: [PATCH] MAINTAINERS: i2c: at91: handover maintenance to
 Codrin Ciubotariu
Thread-Topic: Re: [PATCH] MAINTAINERS: i2c: at91: handover maintenance to
 Codrin Ciubotariu
Thread-Index: AQHWVc5SjrrJuGRVekaFq8VagzHIAKkTgimAgAHu9wA=
Date:   Thu, 23 Jul 2020 16:29:01 +0000
Message-ID: <b8b2c829-48be-d7f0-1c37-27bf43f77b03@microchip.com>
References: <20200709084233.7846-1-ludovic.desroches@microchip.com>
 <20200722105727.GP1030@ninjato>
In-Reply-To: <20200722105727.GP1030@ninjato>
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
x-ms-office365-filtering-correlation-id: b9241b06-9f41-4110-0708-08d82f25820c
x-ms-traffictypediagnostic: SN6PR11MB3262:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3262E0C29456988E83B0DF9AE7760@SN6PR11MB3262.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: huqjEYWFvgiugE2uVMRvFpyAhyRXVcwRSU1U5g5LbOe/WAhQgiSCzrSq2PjXSRBeME78C5xP957qHCamMbJG2WAzqJY7KA+TKZVAGK1Ahc+RnGm0b48s7dTl63J38P1loFqRP7bhKeGhHWURIaH2n21447+y8g8JfsfLEmM8aQJ4UXHgLtXzc8XSI/alGP/upZ08l6wvcEatViWfu1LkTFadNHq0SlWpu6zLPR717rYEvIgp7IRp5MKzcHokzjb8r2aQr6IhNQjud5SGQ1eqLb8AszA4J2jN3H0FRXk93hvdkrUS6XQ5K7+U3fy9JL+t43QPvkI2Of4inJ4GUqcFIqSi7K7+N211H7DRKgiUu9YqOjUysvcugo2nFU7MvQFn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3504.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(346002)(39860400002)(396003)(366004)(64756008)(2616005)(66556008)(91956017)(76116006)(66476007)(6512007)(66446008)(66946007)(186003)(26005)(4744005)(31686004)(86362001)(6636002)(54906003)(110136005)(478600001)(71200400001)(2906002)(53546011)(31696002)(8676002)(36756003)(6506007)(8936002)(6486002)(316002)(4326008)(5660300002)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Nq3f2Y5LDL6RQGk2YZKCc7NxZce8ZEhiXcqbQqTWJRKpLhkL1w6E4qQ9j+AQicolA0Lc/aGi5hwHqH9PE8XLyGTYpmlZCopQCQ+ZPpC4ZC5kOW0lVM3H2PX6+UbeGXIoleHzZO1eBUQh0LEPEspHpJrGS4oRcVWrX3q7ZSha1zAcdXM3wfkohQDA8B8Tdj9aODTWp/nvf5MuWfcV5xVKyuD7ubz80LbRVjsO/9hy2oTvLEuJwXdakUG+T1EXOLo1XAJXCpF9rpZ7a+8zSUFO/YBsTJ5Sewz21lObeftH3Z0sQv8oY6layRLpEBe7llCs+3y+4CCIWj216EjxUDXIpojUy0j/pyOTAnnWJnpc0t4ZdRau+cyzRO8lPYq9jOjztdMZu6dN2QnWTx3wl3+piIV6a9SWMWe23iD8OwHJBkyIBK24KNut2TG+uwrQ3mAwr4AgpptSElzuHVUb277wMxk2hQTrmIwTEi2k8WcvJYLdVoPtQT83yHeCp9OPPoQm
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <78C624C35A91B341978337210D12EDEB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3504.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9241b06-9f41-4110-0708-08d82f25820c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2020 16:29:01.3627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uVtMUSt060FXlzZHll6OH3qpw0xv0YVpAg9/VtYhnQM+n6UZYe2XHqQSRQLPpyyrudTLMfH8KrAf43sqP/sUDzxDhTwSwD0hx1DLjcwNFjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3262
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22.07.2020 13:57, Wolfram Sang wrote:
> On Thu, Jul 09, 2020 at 10:42:33AM +0200, Ludovic Desroches wrote:
>> My colleague Codrin Ciubotariu, now, maintains this driver internally.
>> Then I handover the mainline maintenance to him.

Thanks Ludovic! Please continue to share your expertise whenever you can.

>>
>> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
>=20
> Thank you for all the work on this driver, Ludovic. And welcome, Codrin!

Thanks!

>=20
> Applied to for-current, thanks!
>=20

