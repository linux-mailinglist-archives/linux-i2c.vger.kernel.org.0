Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE6C23CC38
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 18:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgHEQdC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 12:33:02 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:17497 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbgHEQcO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 12:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1596645133; x=1628181133;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=wnL2TrXyKzABJPiqqAF74hddmf2SrrqhPTQIopmI9Gw=;
  b=znVaG7fL31BZPS+RigNChqBntMqkFfsHN8caN2Kl2D1JxTzUrbOClDKK
   6ofvK81eTPcnipJOMABZGL5zwVmTntB55mfDqjyWwJFiWAW6lVbTK+ebt
   Q7cr9HgoVL08ppJj6kENzukZhUUWLzc+P5zo5Y2VkhmNQLkjr8W6/jM/P
   pgF8x2BuvLUSie/WkU6o6LdQlqClqn1t0KY8BemrgcOOHjWL2TZt4ClRA
   21vxGj7JkrRQh9J/crb77dXsXstmJQ3xZrnYhUH1WbKu9fvbNUVf6Wlck
   jKeZd2AZtCRxxb0Ku+wUnCzckOwq95IN7BYoXePsiKFJRWO/Hff1AOa2f
   Q==;
IronPort-SDR: S2jPRPjkaGat99MllwYkFt7sFf41MSmYzl10Q4lZV/x1ichSxuWJH7Jacsp8ngXhaKloS/OPQB
 Vr3FQYbChgm61iHqgqpkH5Oao48Nlbo6rJlcPl9brcQDAVx0EkmgGLjJz5KvzJxP0T8E6UFG+r
 WZ6AHrv/R/pr08sMNFQawstqn8tjj74VK1IbD/tK/s0VN4kIQGjw6wPbYVbAHjfUjPc9txKHmz
 8Oy4T02SRWHb+HB4SUpRrfJqnG9y/68TqgHnHGNmammD8ZHlCqJB/qrfRLeu90+ux8Q83CjRiO
 Iwc=
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; 
   d="scan'208";a="86765665"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2020 03:29:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 5 Aug 2020 03:29:30 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 5 Aug 2020 03:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6hY1v890qHKscqQhfeCuap6htwi8LDeKSufF39qk6LuP4fvreE2vSCCmsmZz5Xgg89PbMipkyLfKV6ObjnBVzORDfscbdIV2Zg4ElxTDP+OkKRu6miTbVHdlkA147FvXOuDZqpBt4AhnkcqG0kPuFeLdRhJ+/O3C1XcfB7yvcPK1Pr+EFJcYYQAd2ZUBtVa86itggomcweYLc9b6TjTnZ/zv9i4INSnEUVXCMe0aCzGYttu8KfMkyTa7t63yaTsXwTX8RkkuuIv5jcDJcpxqQbRJztxDgxcvCANvkDWNqHuywyYpdV6xj6MFJJ6CZ+VVPej9v1t+5GkaoZsPREJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOYTlFlry6VT0tU+WtmrdYuSroLKfMCXp1qZl3fXPpE=;
 b=nMO6n4MsrurKGb8NGc6/h2OyI8KvuazaXjwhPnW2UPGbDEYAsT3+NyX7NQAAAsaslswJssgYHg4KD3veYgIX5d7vSVInO38ClwMsZq7RGF2/VKpiuBeT1ABkQkVLSiGm+hgk3si+Olegx2hubUOpUsTOPZDE36+ppGxUNuUiYBRkWGHXpqlH09cn17fMwuLBE80P5cx5xa3mIXohnIkHL+8hFXYy3r3HYYndNSArhj8Q3LBnPJH6gh5gTMCGjgv4KIxjzP2ozrESCUGdHk/GW0OCIBuILLUVRhYzghqDahL9IbjNMjh72Awe8JLWchso9CJXlwb+jrwNy3bHoUhzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOYTlFlry6VT0tU+WtmrdYuSroLKfMCXp1qZl3fXPpE=;
 b=TylKdN+66x7ukhHvuRax4KU9urqY4k3Z2AtmuRCeUKb5n8/6Vn2mVuI8Tcaz51g0hAym9RDVlR8zGxX3Ctqe2pKOZzSZioUV0tA7PtdGzi+Q0cLBfkj2+M7QXrP7rWLDO4mCzEb3QcmZhSlm6I04nm7BuaelSVP5Xoztx2HoAmM=
Received: from SN6PR11MB3504.namprd11.prod.outlook.com (2603:10b6:805:d0::17)
 by SN6PR11MB2654.namprd11.prod.outlook.com (2603:10b6:805:54::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Wed, 5 Aug
 2020 10:29:28 +0000
Received: from SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::c83b:2062:4e59:8ebf]) by SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::c83b:2062:4e59:8ebf%7]) with mapi id 15.20.3261.018; Wed, 5 Aug 2020
 10:29:27 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: Re: [PATCH 0/4] i2c: core: add generic GPIO bus recovery
Thread-Topic: Re: [PATCH 0/4] i2c: core: add generic GPIO bus recovery
Thread-Index: AQHWakYA0GSN6ngj20ixEwnhfAzHRakpNvsAgAAa/gA=
Date:   Wed, 5 Aug 2020 10:29:27 +0000
Message-ID: <a776a0b1-dcf7-0e99-7076-0fb791258058@microchip.com>
References: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
 <20200805085236.GE1229@kunai>
In-Reply-To: <20200805085236.GE1229@kunai>
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
x-ms-office365-filtering-correlation-id: 8083837e-20f2-4f82-63d0-08d8392a6e92
x-ms-traffictypediagnostic: SN6PR11MB2654:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB26549C481F6B82529AD48BFEE74B0@SN6PR11MB2654.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DZqypMzNIe5/iM8zhTPSNAat2vFgBtHKPXkegtQnqUePAInVOBxaMNK2o8Lr/ADCY3m/GpvfC4jnLfPyH6VmV7YoQWZCqyAanzib5yLvmr6FFsnW0yFk0Wr7t6AQTmqF6f49+H9ThZTvQp1C25QqFdoHMEZQC0T4WVaTdwqMcj+AnaV6EmeBk6yEaWox67Kfo3NbJY2tNpI5TeJ0ARj9prWQ+0V1lXIL31bnke/uqRaFAaQDKAO6vrTLEC2/XhCvAWmf/Nk/wSb8kQDrwKAK0qaOezCXNBJtoWLE4YMIU2ay1MT1PpPeEF0hqcNBk7xJ9D4+/Ts20sDkyt/w/enA00BXg96YpjspsmIVmBf2kIqsh0J9Sze1AeczmG7AqxUVmRLxLnpUnjI4KSbd4S/Z/tfRlcASs9S5AfKvaF6e32I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3504.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(39860400002)(346002)(136003)(396003)(366004)(36756003)(71200400001)(5660300002)(186003)(26005)(6486002)(83380400001)(53546011)(66946007)(6512007)(86362001)(6506007)(31696002)(110136005)(8936002)(66476007)(2616005)(2906002)(478600001)(316002)(8676002)(66556008)(66446008)(64756008)(91956017)(76116006)(31686004)(41533002)(921003)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: K3NmTdZqyb1l4/5NBe6rgGJi3ZqagSIMrLCva2pq1U6CK4CvnI1BMDSTto1qcOWcUjxKmL5vr2O7kWVc97m90OQJwIMk9xCfIbpv0QXbnKyTFM44Z42Xnu79eMmWakvjD6CcOjjiNQQOwY2mUskTMkqItgvh8014IrMixPw6X02e6Z2aM7JSAcR8j5Q/PfbYQ44pq0uyVcxnVmunpwzHWFFSRGT+/moZrnz0GnBGzmZPt4QKjSNeW3nTaNL709vYfj/NGPLMG7xH+/iSMt0QXLdSg1R3ljXolkPd8b8oh00GQpyfcn8x03jUMFhTcR/NT/dVkWsIVKZ2dYo+fqkAM2gbpf/4wIV0bFnPrDTz1BxwDgbegh0xdBJUcjKmiqk8R/TxC0KFr75egd1RZXVAbWf9hv6cY5XZhe8IjDnET2SUQJ59jimHiY61hHR58qXjWQ3pkRBJBvL4P/tXo3xJuLCeE8KYHsAja/9bTtRm87hDdmg7e2q3IY0PAH/av6ZYwzoZWYe/QVA+B0SkWLwqsygaWSbq7iTqFuRpZkaX3GF2I/TaQ9fmkS48ds8KgXx0cpUVy8Du1ZfQpEaLC5RvpEsxGAW9buE1bUj726cvTDAQw/4O2axOgKHBQxF1qG+sFQ515JfF0Errif7VXQoluQ==
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <1270B91B2DCB434ABDBB25BDBA8AD4CE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3504.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8083837e-20f2-4f82-63d0-08d8392a6e92
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2020 10:29:27.7391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8sbB6fnv8Gg18dP5ziQ0uz8HAh8swMvdTk9qQoW6yWCuxp7DJpCL0sOwxz9zRgTTXopeJqa+jVYbbwwzUt56/iC8kHbxbL2Is/G5VP73jcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2654
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05.08.2020 11:52, wsa@kernel.org wrote:
> Codrin, everyone
>=20
>> This patch series was previously sent as a RFC. Significant changes
>> since RFC:
>> - "recovery" pinctrl state marked as deprecared in bindings;
>> - move to "gpio" pinctrl state done after the call to prepare_recovery()
>>    callback;
>> - glitch protection when SDA gpio is taken at initialization;
>=20
> Thanks for the fast update, now all merged for inclusion into 5.9. I
> think it is really good, but to verify and double check, I think two
> things would be even better..

Happy to help.

>=20
> One thing, I'll definately be doing is to add this feature to
> i2c-sh_mobile.c and scope the results.
>=20
> The other thing would be to convert the PXA driver and see if our
> generic support can help their advanced use case or if we are missing
> something. Codrin, do you have maybe time and interest to do that? That
> would be awesome!

Naturally, these would be the next steps. I can do this, sure, but I=20
don't have the HW. I'll look for some development kits. If you have any=20
recommendations, please let me know.

Best regards,
Codrin
