Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43CA13E92C2
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 15:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbhHKNfM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 09:35:12 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:6548 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbhHKNfL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Aug 2021 09:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1628688888; x=1660224888;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=JM5qqCfStMIkBqADrFPmXPIDv1HVNOE+ST8jkgyyOi0=;
  b=QJBe9CaLz+WEJSnh7XzdOyoAztLeq3A339dRazZt0/0Odkqd7hQFOrdd
   eSWIuMxIDrEsgVfeKvqDSlco28uP2T2i1OBJ8vM3zmy9Rdbk2UDgonrQH
   nMoOtgArknJmfchurR27cYOAjpLcjL/vbJuSd8/bFrSlbPPNPe8Qa+oUD
   GTbkPCJHf6E1EIi7bVK3PT7KsCznM2/tQB08NNc5u73vHyPhxZKMAp23i
   zIHP/PYH5HWjX0tfHS22CBNHFDy2lsZ/VuOXO+YbiaQLBC3jYnirzorOr
   qK+FyRus14mDK+imnv1wNPIQRtwLAwWqew7o7J8WwpYPnyOMseUzZ7+3Q
   w==;
IronPort-SDR: 6QmB9EdjIWsrQZbIzAybLROSeF37smAJCrToKxwFL7zknZEEMBQlB0cA2LBllX5rOhBWa5u+1Y
 EMbC098guTyLFpEzEjxr/zdUPqRQxvBXLR+mu5zLjDHGzofXj4UDRWzw7GqxGUo3gxACx+z53U
 GSAzVTqZvmqAbBc8bmWeERAQ3nzyICL7ALd0mXPEUoHvLQdfIjwlIM54sPIOqLTULQbLX0vtY6
 0pg4U/E4JA7Oc7MsbM3xvudWRfQ9YC1g4GI/rkNacjn2dmUhhRorbtLRrdXhEX5NFBMismyh3x
 rFptdekJ4hZjF4Yw+eqNUIqV
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="65466949"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Aug 2021 06:34:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 11 Aug 2021 06:34:46 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Wed, 11 Aug 2021 06:34:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXTqtJ8b8ItA5+1xmuhHAN8dc9PAevRiI1BokkcZfOBpJ/p+lb9yqI+d8kzd0io89y/gm3DZW5+vzefhenTAacc40/gORJlDeob88RtQ/FPUPVEH26Kng26gQjwM9lyH2fVBoC3A+iZqwPl9mGA+DS3XHgwoXdcbtubnMSWn8CX4ccvW02ZPHRZPesf9+vpD1ugPD9xqRJ7Sa7izFegkQn++hJXUDfjLpxsaKUu6o9L0fOGCjLKezy4eBypWkezG4py4FWKBCzaVsvYPAwJvkvw0AmIDgmEB8itevA7NnIBx0bWrd54BzaG91TH9Sd5pR3+gc4P6Svs04pOQj9I1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4swopNeUGBNaSijU/I9/QPkHhdESmS/WkjrRhCDUzA=;
 b=T3nXYDOzSKj+Enq1hii/se/whjNBpWxHUcevXamF+9QXqasuDBGF7+HpJpps+Z7HgnWVFX0vBZBFxhwh3wESKw2qg8X3E2FX2iwEGLpbmKmZW2sEmovAe4qJsRh3EDRBi5dwirYAIiyoICa32TKZQ2ru4ACpOR1JJniXRm0GKi2Fh+wobD4w7LNHUO82cmV7TtSRqhUgULgYTEFveiCG9dtzdReOX9s0mxNxImcNdb48buXsfdFAj3IM15yWaoQ9p7J8N5xBcIctEDwP0S3Oio1u7L0B2Ub7ZROrBxKUz4AIwX+AHlYH/hhht2laTelXmOZHBBSA443f/o9bMtz3YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4swopNeUGBNaSijU/I9/QPkHhdESmS/WkjrRhCDUzA=;
 b=aNzX3HsddYa95lVndAZ9iAkCsNQYi4tprRA1aiPtpNiR0W+kEOv8SMry4/k4ry3aYLvCl7BbaP7LI0+ZVnOzBKgMaZi2pyJbVGfcKkrJ42p6Z7CqMfKir5bsXCkq1Jva9z8Xoo2EY4WO/e6HV4pl2xqns+pDss6MZDJ38VWx5nQ=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM5PR11MB1530.namprd11.prod.outlook.com (2603:10b6:4:c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.20; Wed, 11 Aug 2021 13:34:44 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::bd6e:aa3a:af25:11a6]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::bd6e:aa3a:af25:11a6%6]) with mapi id 15.20.4415.016; Wed, 11 Aug 2021
 13:34:44 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <wsa+renesas@sang-engineering.com>, <linux-mmc@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] i2c: at91-master: : use proper DMAENGINE API for
 termination
Thread-Topic: [PATCH 1/7] i2c: at91-master: : use proper DMAENGINE API for
 termination
Thread-Index: AQHXaBaLO0AD4EQjfk67xnkt2E5KSqtumDiAgAAC44A=
Date:   Wed, 11 Aug 2021 13:34:44 +0000
Message-ID: <de55cf2e-e97d-276a-838f-4ed432928411@microchip.com>
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
 <20210623095942.3325-2-wsa+renesas@sang-engineering.com>
 <YRPPh6ucRfL/gGZG@shikoro>
In-Reply-To: <YRPPh6ucRfL/gGZG@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3eb27f4a-2241-4b3a-0f35-08d95cccc7b4
x-ms-traffictypediagnostic: DM5PR11MB1530:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB153023FE8C55FAE488AB61FCE7F89@DM5PR11MB1530.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fLS6hGEqO9KYWBqe22nxPN8IE0OnkrOeZtt9z7vTtYct1g0WacLx7lg9DZio2EMJuFuuIsfeSOaSfWO7f9qVm4qDMGMxM2FA5GaHnybvS/9K9kW45uPRAuLwhHlAERB/nYvsCIwM5/upIMWonJi7h+mx9KRRC1wEpwSipszfO4uZ3XFGxN6hEbVUhjEhl55cvzCPE7ISQ2IDY/CmkBn55WfslvNticHytw2IR+1DNAL5k76Hd2aZZvpNROoBL7Oiwx9Pb1s7fZtAFeJfEEEbkM4K1LigHDRQVQ5NfhE9FaBWbkGna73+VntQGz/lrPU0wGMNcfIzcboZPS1hpnY3Jad8Ho7GghoQXaM+guX9hoVQ2eioW0GhriQy23WKNda5/SUftyvrc8PhyMPiqvcf0Iwh1SsAGECTsuStObzMgWVN5jporkk8btYaIFF2h/NrM4miBbpC6+bKdiVanAugUscPT97z+klAp/tEgwPUbCr4uKgZCOPFTPkxXZjEjXduaLJR1GzEte4gb6VOCCn6u/08H5FGTbX6ivMVZSxZP1eEkCw2O9kds8b6ZOLNH2xH6JWX0gRethTJYpI21g/EUIoxXvOKB0X8YQF/Q78ERnfIz0vpnhZyZGJNbHHHSV+1ornCjqaL7nWjYwsbfBh3WX2LhqJ91soVIagKVu+b7LrYjlLUMLe7LRckhpa4ZRGCclLYYl7lfyVpZvExSAR1OKW8CSiLMviKlye0MHy1oOHHBxeInCc+gF1/O8FF2GG/CxnyQNv6LeWAzz7H5PEEGQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39860400002)(346002)(366004)(376002)(110136005)(6486002)(66446008)(66476007)(76116006)(66946007)(66556008)(64756008)(2906002)(36756003)(4744005)(91956017)(186003)(5660300002)(53546011)(26005)(6506007)(71200400001)(122000001)(316002)(8676002)(8936002)(2616005)(31686004)(38100700002)(6512007)(86362001)(478600001)(38070700005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?gqb+kLYqv+4Vx6/Nq/hOG7KnWWfg7tfc/+6vH3l6fnHsuTI3zg/KJNe7?=
 =?Windows-1252?Q?+fZPgsEHLBcVJIRw9tvsnen91CVy/K/Du3AVDUZ9kRupl0Z6tBitV6n4?=
 =?Windows-1252?Q?rBBIyeBU4l20UujTi3w2OuVTZx1IBi53e0tr6Xi21/KeRretAuz67UtW?=
 =?Windows-1252?Q?Nfh/OtSIXPEof/mWLZnzuzZ4eWu7umymbqbjWkz03fBwv/IS4SD4KPmM?=
 =?Windows-1252?Q?/OlUqy5LlSx2ziZVHL3TyCDDWk1ne5PZtQhYE+HVvd5cCAsLlKBoqgc0?=
 =?Windows-1252?Q?qtJ2Zl1JPo1nZmYkaKdS98QZqCunUjGIt3rbI78q2wclRifumW5WS01E?=
 =?Windows-1252?Q?dfKPFFAEH7YfutoGeE2NaGmy/sZlS0b0od6txt94fzyVkl7VE1b9fx6f?=
 =?Windows-1252?Q?mUN4H0qGrDYbUdSdmTKmhpgaK6TiKw6N3/x3E2PVHR2gCJf7psJRU9+5?=
 =?Windows-1252?Q?9/neI/EJAEk84grIa/If9aTXAqTd16X4qO70RtJiTP09TGPdPPhUwBpp?=
 =?Windows-1252?Q?Uq5WYlw0IOOOAp3TddI/pv6Ah6cMnMiltMnqXtDtEYPMb3nneYk9jL2h?=
 =?Windows-1252?Q?nV6K/6OftpUBrCFb7gikoK8WGYkiHYKY4ms1+xNcqyczsliF76Ajp3//?=
 =?Windows-1252?Q?+40wvEU/GsF7rDUkD0bIY4c84o1BUgQ6tPrd8dRX3IWJnj2/TBaJGRwV?=
 =?Windows-1252?Q?DyDvYMrTQb3DwXktwn/blS8GwIPQMYL01inVsB0U9oZO2HPfM7cZOHqk?=
 =?Windows-1252?Q?nDPh4kLOoHd+5d0XukjWhl4Vi7mSlVAzYMmydDN0bmfucQM0bPr6m7lJ?=
 =?Windows-1252?Q?ddn1XMz9/6rHBU9jbJwu/N0fZ55o0OO7PIODjaHVjUN4Z3FsdSUIbq9N?=
 =?Windows-1252?Q?jSdBKHSp2Qws5vezMSD+obrxlsld0to4AFmCFt98V/jneOAKz47HqNCj?=
 =?Windows-1252?Q?mnd7HonGuS2WLhJ4lHLqLee75rq2eLJDhB7SH6/oN7Ptb3tSyXDqiHZ8?=
 =?Windows-1252?Q?yi6gaK+9ZQaOEaNIXk9qqK9IPZvC2pKMHpwDW7TZ//SdCpjtqHAzIJrw?=
 =?Windows-1252?Q?rpBreF0HGvioFIXIvHVrV0qqeVvF4q9w6C1HoClun3+ehUevzx9OkU48?=
 =?Windows-1252?Q?q+OlHLAKZeztIt8LBrmhSn1oA9LVpE6ea0x4T+SOz3DOgpEPT6psPI3c?=
 =?Windows-1252?Q?5h1Rq1Y20CE+rx6JOOQnTSkDXshYuVwR4AwUGth80HGWeYJ0ndjKKW1a?=
 =?Windows-1252?Q?eXmmoJEKQsCwor59AQ8llYLKN/MRcLeJcdZSmRLa/iopDIuoB0/tRfqu?=
 =?Windows-1252?Q?oWBM/k4PcNIkOXkFCGL6B3XVVDRxO2kdQ2tt0p3t/4u0CMt1GEv9/rbO?=
 =?Windows-1252?Q?CSAQAjcX64c1Ly5EyHIgFGG8q7BDZcrGE+M=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <C5553D320A198B4DB4A80B9CFD8FA197@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb27f4a-2241-4b3a-0f35-08d95cccc7b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 13:34:44.1563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /RApEeQFnz3I8Hja4GKlxelNepIOzAvH7xkcGzXitrF8LG12eZfL24vnTACvYYyyWIcmKsDCBbfHDjg8oRO2Mnt0xcNao8joKKnlvZKiA4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1530
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11.08.2021 16:24, Wolfram Sang wrote:
> On Wed, Jun 23, 2021 at 11:59:35AM +0200, Wolfram Sang wrote:
>> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
>> it should be sync or async. Here, we want dmaengine_terminate_sync()
>> because there is no other synchronization code in the driver to handle
>> an async case.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Applied to for-next, thanks!
>=20

just saw it now, there is a double : :  in the subject. Maybe you could=20
fix it if it's not too late...

Thanks and best regards,
Codrin
