Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6726F1D1097
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 13:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgEMLHN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 07:07:13 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:33015 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbgEMLHN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 May 2020 07:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589368031; x=1620904031;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CN1TZ08r3nuyq0pS1FoxuygVXDcVwaIRZjM1ujF1RyQ=;
  b=0yzshzPXnvEQYrA8so1SBwU64hlFLjuYzwc/WD5XHj6uOETel+yV092Q
   ssp146VORwi7fSYt7idZdyZksXsCV0tGRxBQLY7n0/WNleOHMCxN5f9Ps
   DvS4Uo2WJfNexOpCYLDmS1FWA46c5nSfjWPwxnMKADXlMYNFrYkYJDk5R
   v6Dc4RbnPKDhmgAirpSL3Zh3zxKqAIw950DY2/ZT5S3+xQcKlYynnyD2V
   dxdMPngZjJJ0UXeAL/V/86z9w82THYGQVSETjvUAcVC38XwiT9ebYqV0M
   jEmLlRJ17tKEIrV6o21oySkwm7fD73N86kWjGFtfRihaPNPgq8kh4zuqn
   A==;
IronPort-SDR: bSt1y5g9hd82+0lAcwRJKt7V61CYoZ4HYnxQq5e9hYBIUmra0bMF3+90A8LRP4uCuXNo7udIbU
 /YoAJ1w6eYCPw37sb8E3CtE1Y6MZ8BFwFI1sVs8/EAPHWwxMdHXKYIh9+yhcLqbHJVbQmud7mz
 fbpQEKO8Gkmw+zjyShRiJgqgNyMy/QkBof47QSHpsSghc977Dpa8oITmWH4awCzhY+r3/kXbfj
 jZf8MrVOiLM0BJB/KzU9TozPzSNQVvYw244V+r93qDo73+OXoF6zNdO5yRPsk8ENLdebk5vjF2
 Guk=
X-IronPort-AV: E=Sophos;i="5.73,387,1583218800"; 
   d="scan'208";a="79428776"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 04:07:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 04:07:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 13 May 2020 04:07:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESgjQwHJOcg4rg4hRoQyH4fXeLWG5dOPnUdivkVNZcyUjGnW5NmUcDJajGtOhKcvhHcWDdct3EVGCn4q9kervDHoR8B9R5efMBOdtCSEqvbAHob9wGqUjJo/tUeYeNtyHe2+ahXPN/YYoUXafzyNcX6nRrjAZ668HcmsOJwlhOgwjj/8kWiyPFhXTX+JvZfQB9SwoW0bDaFRa0SZNfbCkTu2lI5o6CmNwvetGQGlH7fCnqWir0Hl/fubXczfbdVXCe5P9RI1Dsk89nZSuobg9tY1JafvqLRrmyYpAjaQqOStwWyeGLXrIVH5et8YepEuBFhI0WhIM8QyKCZooFG0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CN1TZ08r3nuyq0pS1FoxuygVXDcVwaIRZjM1ujF1RyQ=;
 b=aF4LQEv7jBh57ePXg4N3WNT8QHwZfI/ooMg8ynuXDEUCPQARQ1ozQ6dhe0ArGtSF9t5QyD7HOjozKvLahKrmkwJh1ZYC1L7+gLF1KQkBos2iwvu/85C9w6szVTgAcXBSvDNcBGwKBEff6YRus/WlhAJ03HBjAp7A5ACLeWnLZwmaK9yHdK41ZoAPQY9wYh5oe+z6dKNLrgJDVYeW26pYTTF/fs7SgB4wUOcLe/1lcu+FgfobwA2GWcwk7aGOEURDzx+E6NnqsBtcvSS87YmL/iI5irYdQ7dQaQeGiVxXCIcx3KjlEQrAmE0uCQaXocR/v1wGpJpSWhR4r1nx1N/g9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CN1TZ08r3nuyq0pS1FoxuygVXDcVwaIRZjM1ujF1RyQ=;
 b=rNcaAXgGvxr6VcYgFkl0aEPox4qv8MfIyXNFekRwwnO5QbQXNKwYc2SuZ8xq+5k46FA95wJeaAqWhjQCAYEu5F3AS9IWeU5ASGiCllScw7kll+fPlLWHvxzm5w1UBAWQ7FGxnMRst45QOe2+feGOS3fJLao4iKm9EqWHXL6l5DQ=
Received: from CY4PR11MB1688.namprd11.prod.outlook.com (2603:10b6:903:25::23)
 by CY4PR11MB1752.namprd11.prod.outlook.com (2603:10b6:903:11a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Wed, 13 May
 2020 11:07:07 +0000
Received: from CY4PR11MB1688.namprd11.prod.outlook.com
 ([fe80::d414:b3d8:74c7:7488]) by CY4PR11MB1688.namprd11.prod.outlook.com
 ([fe80::d414:b3d8:74c7:7488%9]) with mapi id 15.20.2979.033; Wed, 13 May 2020
 11:07:07 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <wsa@the-dreams.de>
CC:     <linux-gpio@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <Ludovic.Desroches@microchip.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <kamel.bouhara@bootlin.com>, <linux@armlinux.org.uk>,
        <linus.walleij@linaro.org>, <alan@softiron.com>
Subject: Re: Re: [RFC PATCH] i2c: at91: Fix pinmux after devm_gpiod_get() for
 bus recovery
Thread-Topic: Re: [RFC PATCH] i2c: at91: Fix pinmux after devm_gpiod_get() for
 bus recovery
Thread-Index: AQHWEvR+GtAbavRk40KvRq7DN8dZF6iZuWYAgAxN9wA=
Date:   Wed, 13 May 2020 11:07:07 +0000
Message-ID: <c7a35978-03dd-3c73-6e7d-15ed40b5c57c@microchip.com>
References: <20200415070643.23663-1-codrin.ciubotariu@microchip.com>
 <20200505151256.GF2468@ninjato>
In-Reply-To: <20200505151256.GF2468@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [84.232.220.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e7c7028-1124-4569-e1bf-08d7f72dc677
x-ms-traffictypediagnostic: CY4PR11MB1752:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR11MB1752EC8E5F377C5FA360828EE7BF0@CY4PR11MB1752.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wAmBeAGCdbD7kzNN08huq96PiWzXEUafrhkc31gTmFAEn24Zi9Wttuz/1R7MIFxuNVUOmHFi8qxSat2t0dU0/R5e2VEAmSR9udzazPEhoMGjHj4GEl80BH3P/IMeRDU51pCGMDiwXMmRRmB2lT7p3eGIP0vRcU/BKURsGsglq83NsqnOwggZZXbqATUilFjLG7u9NY0vN5+WiR9KApIqfkKK0UrO9n1xd/RFwfg+8D7quaiqOppcFfpIIGdfhBU1m0oH6SECVxIS3stURueTZmWB/XUMdxSJybtT1GTAM+rUIKbp6z79uITzFWCel7st5twKgezX2wv9bZfe+RbEeqQ1z6R1S/y3shLDPksOXnfsUK8jaj8VsuEHTUpNsYfVd93NSoUKCE7fR25pAktvkwqPUlNrkl87TWPYFHwYE7wjTwSwelfWxvNop5TMNJ/zQSJ1SOcUN1OqXzqjO/GuMTsayoQws2Zl6r7KFmix+VAIjzhyE3lF1vB3dMBTAmi0tWWMZebsBNyXGeWdZmdvyBtDw8mLBv6UIo++8tLKZ6yGJ8u3DhfbHJV5a428jSzR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1688.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(39860400002)(136003)(366004)(396003)(33430700001)(8936002)(54906003)(8676002)(53546011)(26005)(186003)(31686004)(6916009)(316002)(5660300002)(33440700001)(478600001)(71200400001)(7416002)(6506007)(2616005)(36756003)(66446008)(6486002)(66476007)(6512007)(86362001)(76116006)(31696002)(2906002)(66946007)(64756008)(4326008)(66556008)(91956017)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Lh9m/UgIAMSKnyyyZQOwsPe708RDcsqtwMB9CgBX9ibeHLWpQCD/5MjJdYWhAW/BbMYBeCMPH/IF5SfUA2UtLFcL/sCrHWLsI3kzpFT9BJzVgk5mSHSa/jwdQsT9+EvaDUAplaM+yrbpMcPHCjU4bqvUbhGxNrfxgNo4W7hI/eSDQb1Ot4lqb0pOwo3soKKQJhjNgY4GK662lGgypFjRyKZhv5E89FjQ+XRVFjtd51Mdpmk+M2SC8oVdVcLHtrXbYHJ0e5nVTD8YDBU0vWcS5K4lCupJ5OW8GAsO/6CrJYemdTDhnkysytaP9cVzFuZDynB6GosdVZlDRVJefITvUkRLHDM+DuxCqFHQSfsoQiQoWjZf7YfErlxbsAXAHy+X0OojP/yM1Hm5UZRqkq28ehaNjaMUs3PHL7WwV5rRP1pngZZ/hp/Rzar9NxRzfM+QfnhSl7nAvekZIldJEiQSqPw6BqcEvCyZyyO+fYdMg3t4kPvy4bMeXZScHHpvw83N
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <F5A71579395B20448F9FB36722E0C959@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7c7028-1124-4569-e1bf-08d7f72dc677
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 11:07:07.0519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3eMS1Kv4UtX3thuxxvsW5NNZtKuuhH0+lmqeGHhonXL2J+00FiNLqChhdPeVmdx8j85EaBlR/HnyjMiisI2j1w71tKZMn5KkyV1Xm4ie4zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1752
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05.05.2020 18:12, Wolfram Sang wrote:
> On Wed, Apr 15, 2020 at 10:06:43AM +0300, Codrin Ciubotariu wrote:
>> devm_gpiod_get() usually calls gpio_request_enable() for non-strict pinm=
ux
>> drivers. These puts the pins in GPIO mode, whithout notifying the pinctr=
l
>> driver. At this point, the I2C bus no longer owns the pins. To mux the
>> pins back to the I2C bus, we use the pinctrl driver to change the state
>> of the pins to GPIO, before using devm_gpiod_get(). After the pins are
>> received as GPIOs, we switch theer pinctrl state back to the default
>> one,
>>
>> Fixes: d3d3fdcc4c90 ("i2c: at91: implement i2c bus recovery")
>> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
>=20
> Applied to for-current, thanks!

Just looked at this patch and noticed that I should change the pinctrl=20
state back to default if we can't get the gpio pins. I will submit a=20
patch to fix this.

>=20
> This will do for 5.7. For 5.8 or 5.9, I can imagine to take the two
> pinctrl_state pointers into bus_recovery_info and handle all this in the
> core. I will try this later this week if noone is super-eager to try it
> out before.
>=20

By 'all this' you mean to move the entire function in the core, right?=20
Having just these two pointers bus_recinovery_info won't help much. I=20
can try it, if you haven't already started...

Best regards,
Codrin

