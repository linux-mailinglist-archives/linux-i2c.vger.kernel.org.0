Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B272D59E4
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 13:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgLJL7q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Dec 2020 06:59:46 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:18973 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbgLJL7q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Dec 2020 06:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1607601585; x=1639137585;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=0YHATgU1+leqABZGbPMbOcQFPXDKDkCDSAsEmpUy+8o=;
  b=vI7p8KK8kHxBSywH0lW/iD5burNNUvDZXhgJmtgbcNxcJnnZZUqqh6NN
   bVDmxDlnp1DuYtKbOhuP4lgq3O4SlJTAU+8fmZkA8MdXZNR92HProYIXq
   fqFKk4N4ojcAVzH9YuUxMf2Flf95okX6FYESgDWB74mDXXFpcm5IYh2Rc
   IZc2/2ZvbalK1sBtpA9yofk6P1K8KZruyYovwolVJCnSxDXCdabNLnktg
   H25bFzBpyCNoL91v+GIGBqf/w+Gr2f6W9363hZ79jGWRhCtixQ52aTQKn
   RRbUJpFgayMkOo9tRo2jSgZUbny0/x0w8vB7dGqMLYET7PcPtqK5jvIDa
   g==;
IronPort-SDR: 7zmCNj/Fwqv8pY5hgaLEH19ofqvOlEg7mL6xDS6yhyFiTm0SFFB6RtkbtZdp1Atyib6d6tUUji
 fxzeP0d2i+6xhoSbYzrv8EZd6BMmw42Cz0wRLUT66396vRToSDWFSopEmDkVzVAQxiusUU7zI3
 5TJzAg/8s9TsxSBhuNqth62B/6HGq57CTYqFrAoHikgSIDVkBBIkp6pLFuU3K38KbOQTbPri83
 XxkZJFJNx4KXmjS42tw1sLuPf4CR0hKEXt3WP1DmxPzG1sjCMSpy3vfiPnaGRBSZskCcXUJBZr
 OuI=
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="99348432"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Dec 2020 04:58:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 10 Dec 2020 04:58:29 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 10 Dec 2020 04:58:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmmB7ysJnbA5JDEmOCBMdaaCfbi++kYao7yI6g5RXDmyaTb137GNzkZiedkDiLhCnjojvl0ousSYM2QFFRG1Zw8WaKmcRs5MZk2eLruwtyUfL1lZ+yux3bB67YyZQ/mEZnRE9S6qZpmEJDS+/F4XO2TiJRZLmD7iWLeDmsXzHTI2KT0/EBkDfmiNsFcOPsMLz6/0coGB/frP2XhLKx0GNTSKC/bUJ9vLOYCglVDeBAm1+Y5dodXgyuVMPxOGIPFjXnJOSbtb4r+8Cg5ODBYbv38mo1k4jbWAru2JI6TbqhkJQWtxpoapHwxnAtYDRGVfDLCvuayL8xO5WJOBzCjvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YHATgU1+leqABZGbPMbOcQFPXDKDkCDSAsEmpUy+8o=;
 b=CqGz6PX1gBJ/qjFnYs74CENSBmfrx0angzAbFy7rs5hoS7hoCxrG+mX9xaW++b5KUXJDD6DG1wAALUCgt94tAzd1x7zbe2z+t87/snilw0zgr3NNgGfjOEY0IItP6Qhi1eeV5sRmbhBQAL71WJkd/lggCQWo5yyXSuR1t6+wzl0aVlAdHmoU0rb1s6Uk6N9HhW1YNjYlcD5JZIN8hg0yP1bSEpWVi9CVqgOG8g2068QAVrb6z9SjhGP2cBjVuQhTsQvM+bTeZcWlesdIzsj7mmylWFDTqeGH6AhdP8bJBw++utyBWoWYEepUgH79ms4Wa7SoU8wGZFZ2/+gMjNiW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YHATgU1+leqABZGbPMbOcQFPXDKDkCDSAsEmpUy+8o=;
 b=sqPhtjuS1zHAFy9pELpBREU9oR8AgH1Vr+NFdehF//oJEL3CLh3uRCaQQeo0+lmKJx7DQjapMf29dT7vcDsVrpVxkpJcS+4uzay2szH3W6VjVYdnzpEAbUMkNB883qNwKQgSKXQHxytMGoKV69KYWH3BH7K8X9ySBiN5TxLTob8=
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 (2603:10b6:903:b1::22) by CY4PR11MB2038.namprd11.prod.outlook.com
 (2603:10b6:903:30::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 11:58:26 +0000
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::a52e:2a1b:e5d9:4fdb]) by CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::a52e:2a1b:e5d9:4fdb%5]) with mapi id 15.20.3632.027; Thu, 10 Dec 2020
 11:58:26 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <rmk+kernel@armlinux.org.uk>, <alpawi@amazon.com>
Subject: Re: [PATCH v3] i2c: pxa: move to generic GPIO recovery
Thread-Topic: [PATCH v3] i2c: pxa: move to generic GPIO recovery
Thread-Index: AQHWmjY/Ht43BvB7fUusOaX7Y3A0canvpGOAgAD+t4A=
Date:   Thu, 10 Dec 2020 11:58:26 +0000
Message-ID: <0c699b9f-fe6a-8f3f-f95c-5a5c0cf10fc9@microchip.com>
References: <20201004100711.1093343-1-codrin.ciubotariu@microchip.com>
 <20201209204645.GF3499@kunai>
In-Reply-To: <20201209204645.GF3499@kunai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [188.27.102.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a18d058-55bd-4c7f-d55d-08d89d02e6dc
x-ms-traffictypediagnostic: CY4PR11MB2038:
x-microsoft-antispam-prvs: <CY4PR11MB20387CC7027B047680B71844E7CB0@CY4PR11MB2038.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EdDmfDVZgIWVPxfVlzSfg9gnGwBy76eCkc1hsR4J4NDW80feLuQ7q8wAHJT1vEXEc+2/yf789aBszrmjbwsFhHXfKef5ZX4g24CHaT/LKbplLLtWOlKsOG3rXvVDQSKT9KcuEpKmx6tvqjVRsmABgsIb6U+llD1aZ1gR+/J4NJSVbwDoCvauwadIv34Tv15pQhF068246ML4qQhMResdu19GYeS8K/rCBk7UJk3emrqpnYEV6LIoFZvnNmPUk8WzOobIAVWGXjp9y3PO4wimegQFFAarWHO6XEgMSo7SdFzRjM7VOHHjvMZfzpJqzkl2xGs+fQ7ZINUiCKP3jjQkq7b4+WexKNnOCpljXR0hDAnLzXdTwIehzkBZuRIZBbI5QgDgsykytKZCdpV0uA71pI6Y+tL+nn1vldite33bGBsSIVQyuQnzI2Dxk8Yp9ChL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1101MB2341.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(136003)(66476007)(186003)(6486002)(86362001)(6512007)(31696002)(6506007)(91956017)(76116006)(71200400001)(110136005)(31686004)(8676002)(26005)(36756003)(5660300002)(66556008)(558084003)(8936002)(2906002)(64756008)(66446008)(508600001)(2616005)(66946007)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?Mhz+zk+UuzZAKMyWoVjcaZQQz5/Jt3JUrgqF6KQpPu5NCXw1Wd9tv8/o?=
 =?Windows-1252?Q?TUg+5IXxCLO1gSzlcCF1iXLtSexpL2RCTS6ngHYLcaR5AEx1nMzFMfpI?=
 =?Windows-1252?Q?X3gwO9foUEeBbKScw3oAnsTb1evSX7omGhn1vf2zmCsWww22aOH5qvr+?=
 =?Windows-1252?Q?zN/UjsTD7AnxcU4AL7O4+fTqInJvM5xrhzuf+zw9iQTLomL8ugHqKwxc?=
 =?Windows-1252?Q?5yW5OU1+03C3a5/scAdW3mgZUHKOG0gprY3Nq6535THEHnKLkqHHMbOn?=
 =?Windows-1252?Q?9dJrWkWB9+dF8Uwd4yRqHM28R4E/ok4f9z2xeLqQrHXYgxHY5cFCtblA?=
 =?Windows-1252?Q?p4igqyUoPkpzurbzIggG5HlFyXT9vjx2EhIXxOGhsbb0qMa9UNYNnCLq?=
 =?Windows-1252?Q?dOrdeB1jwEEfnjKFTZ0QI5PiCHv51moSGhgxnZsBneoXSL7VQxmtZraT?=
 =?Windows-1252?Q?7gQkCx8j4X1VMyGfPngSvzu67JpnkeI2WaUegpNUh9XGb0XBTUcWy41c?=
 =?Windows-1252?Q?DVNu2/3xAeTkk/rKX0d86mNOo1NG0KYKg2xfW0dLi3TWg8KW3zguRJyR?=
 =?Windows-1252?Q?Z7mWFsVmyxBYC+yGLxv0wCkIYiTdTWTZ9e9qrUPc8wbwvACou9Uzb6r6?=
 =?Windows-1252?Q?D1RJjVk8mfmwjw+BqqekYwIjqMl0G2bK7bIk7oTCRpfq//ScH5WypkmK?=
 =?Windows-1252?Q?2tknJxP5zMa5cS1+CfhQJ3QzJFLxHmu4Ne/XdT0QPfzPIC8r3H6jFAGf?=
 =?Windows-1252?Q?NUOxXjVVYpYEfaGpJpQiJDmjs1jWQeNwe0WBPDqDFlvpAHgJY538E1IN?=
 =?Windows-1252?Q?VPhuBXv1QeC6S2nPqdsI5CaRYrzKrKhu4Vmh7d87pfGnsngeJBJXzMTz?=
 =?Windows-1252?Q?jORvxB+9qN6xhCnEbiYX8qeMfwdtMKD7AkoEvBAQ5tWR+POrBVgxpusq?=
 =?Windows-1252?Q?uX7ja3EnApBwfGDWqMZ+E+u8Hdy8s0/Nf8a3NOxJg5JSQGTrMFFvhW4r?=
 =?Windows-1252?Q?KMiQMtNoxHkAdsYGXnn9+ilDkMl6t3g9DZWCv0wxtvk4VX7JgVU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <767592AAAF84A349967A98D95966AD23@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a18d058-55bd-4c7f-d55d-08d89d02e6dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 11:58:26.0643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ej3QLEgXQZooYSACVazYOoZl8f8lFceGYqeToeoJ57/WoRoT9rxwfK/CQG9fSVkbjwQN4CVarRZuHC4en2pJJmUHT8wPAgnb80w5AAkWYOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2038
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>> patch not tested.
>=20
> LGTM. In case we missed a glitch, we can still revert the patch later.
>=20

Sure, just CC me if anything goes wrong.
