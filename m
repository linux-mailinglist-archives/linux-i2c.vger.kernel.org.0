Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0466230E8DF
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Feb 2021 01:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234306AbhBDAr0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Feb 2021 19:47:26 -0500
Received: from mail-eopbgr1400118.outbound.protection.outlook.com ([40.107.140.118]:53639
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234550AbhBDArF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Feb 2021 19:47:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1KtVjKtkeoOU0FjnUYkG9cArG9iV7ohqPKGsZoo7d0git9Gm6fNkBy+f+5eOW1gPOV6NniyavG5OLSc5Yex2lPfNKoR4+ps5Zg5qhtQG51qfddaVvpdPscq8FdiVaCZXvc4Q79Z2uuMMOjoz/KpU7Bl9nf9v+xx8TUKS6hlpnA6vIIyCMcVcw3RwnCL6cceTPKa6tegFwlPOvWhqvPYvxK4JgPoUXiGxb28is5WV5IrePtW/qLakqrO9pRIrGgrO73bZ6eQKohNNxTc1kaaCFc3TBgaL/ISunMbqoOBcWZKONh6lVtoNhDeuZE9cqcA8yOj68JO9EefNd4oxUJvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbmISciCAVQilwtr3iSwn22zbD+d/BX4/zFvzaS5/3g=;
 b=cyN7xKCcUX2G9tQ5Nq/p4AWSLNLskrmFbcOLLSw24DVt03uEV5/xCKOYyr6PMhssjsOvLUE3fagFzZigth+rsK6zRLDLatdN+YqnxQgfux/em6bE13zmoyCbpXLL2LHA2uWt6xzxBkkJCe2WrKSbZVCTzRVXB5One7cF7SMTFkVWa30LrFD10z4Esfe3F2XHMvO5PON3BkzSpy0Qk3/hRxHaNGezwgu2nYnTQhjnU6aSRwm9+mjkY/aYeL1nt6PfE1QY/7cVoOiPee7a0xr0DRr0uhOxg+88B/LU/TyR3LOtFlhiqjvMtM3il3CpCmhGpEpYjMgfw0G/5ck4qVPpMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbmISciCAVQilwtr3iSwn22zbD+d/BX4/zFvzaS5/3g=;
 b=OkckjyXeJ9xl6C10bvoR9ju2yd49VtAaYCQ3EHSnmGkX1CvfgH8CigfEQLelz7O03Ywc+vFE34d+FylZ+8pF9oukikCpH/42MWl04Av26QXFrpHeSoTWrfeCqvjtKBxv2mtbcsxWe4aFq42ysJGGPi66LmKjBbGE8et9Agz8Blo=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY1PR01MB1738.jpnprd01.prod.outlook.com (2603:1096:403:4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Thu, 4 Feb
 2021 00:46:16 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3805.026; Thu, 4 Feb 2021
 00:46:16 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Palmer <daniel@thingy.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Vincent Cheng <vincent.cheng.xh@renesas.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: RE: [PATCH 1/3] dt-bindings: Fix undocumented compatible strings in
 examples
Thread-Topic: [PATCH 1/3] dt-bindings: Fix undocumented compatible strings in
 examples
Thread-Index: AQHW+aXLnk1q1RZsG0C3bQLH8doykqpHKl9Q
Date:   Thu, 4 Feb 2021 00:46:15 +0000
Message-ID: <TY2PR01MB3692C2B0EA72A7A681CE0EDBD8B39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210202205544.24812-1-robh@kernel.org>
In-Reply-To: <20210202205544.24812-1-robh@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:8026:caa1:e178:9d3a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5e282fd8-55ea-40ef-ab64-08d8c8a6476e
x-ms-traffictypediagnostic: TY1PR01MB1738:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1738D28DBC42C3F2295EC7AED8B39@TY1PR01MB1738.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T31aKGTPNrpjik7AeVy0zegvGdlnV7djLbM26nXZ7Lruawh4y6ICQtDaAQUVi3fpv0Ena5mP+ejd1v/6gfCUeI/I35wPPOlt+p/+iioq1+q9haIY/26EU/XwijwqepLUQGq48QtpgCob1T0VWTZw0xP8ECYrRPwE0liMoC+84KfsiEA9jn4ZexUxgFb4mJ3e/GzUXyP+i4S0ObLA+cBm/vK03wjprliaWFRsWo3h0pKrYR7EbjoA7PuNsP7oouXMLmfMeDqFTu/YReNfB6YOrjHElJh9RtIm0A/yIiJ2mxKaa3agS1BGqwV2Qo3zRWFA0aRCquu37nBkDd5eHdOnzZiZeRYVmb8JwkhkYDdb4uY7W7URLRWETAKoi1SIOHVVw7FbOtcdc+I28MIbJHp0/rns/80KvYDFPymXC8DyUpmtwyhQu1Pr1OetbPVQUV1LdTBhS8C6D+TmUd5ljadwdsvP5x47Buey3V/pTuS/xkxOFStGvsxadiKeLt4zLipWoEqSoscfqShd6dFLxCd2iw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(66476007)(64756008)(76116006)(66556008)(110136005)(66946007)(7416002)(316002)(7696005)(8936002)(66446008)(4326008)(86362001)(54906003)(2906002)(478600001)(83380400001)(71200400001)(6506007)(5660300002)(8676002)(186003)(9686003)(55016002)(33656002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?a1gjVaMHSS4tF0M+KNOJ57yrWmzTG2v/7GwmwnKCv+wcgurCnMJqrh0Lcn3E?=
 =?us-ascii?Q?46UeV/TAzJuP7bRuRpUkZeZovwL3f3JOkSjXLgfIPSwOkTtpUv76jhMQjgoc?=
 =?us-ascii?Q?A2MGHvKE3YjQxYULbPGW1sRcNtJqysHMGg5hNKNOpuv4D5XXrgDSSt5Sj3ro?=
 =?us-ascii?Q?zynhmE5DF99BZ3QZkoG/0oFpHy6kKNzvvWR4+nC4v7VmFqJA5+kgnV/lwTcp?=
 =?us-ascii?Q?3xm7L6JgmoMm0EluAmdYz3vzsEZCGuEEUWS3YqSUuZA4i8gc7/BFCFHTGDGF?=
 =?us-ascii?Q?nq27i6Cvq4ZCAeVlNoazTZiSepxLwbz9UyWHXDw/wtw6QhCPQ/O/VtQYnoRF?=
 =?us-ascii?Q?e0xZuCzvnS3Kpv8dOayKYNvu7L0zAiQ35axSo/F8I89ewnapIYkJr7Bcq5Ht?=
 =?us-ascii?Q?BRQ3vSUs/9UyKhoKosZ/0MQ9OMUBdwoDiQ3Upk3Bm7jZAVSLTw7hZLcRWwt2?=
 =?us-ascii?Q?nfDAiO4ImTX43yUSpvMRTY9yTxnSe3ZW28ucq9pGks3IXXt5FKO13JRTABG3?=
 =?us-ascii?Q?37xhDFs4X++F+eLtvrfbgzBjf8cLILPbsw94ZSdJyrebQbw9Q5nQKR+BQ0ru?=
 =?us-ascii?Q?iQmEAstTc9d1Ps3NPjhAchaEUpcYauSISk9orgTqPmLOwT0unbmxUQHLST8i?=
 =?us-ascii?Q?tMKPu+HgTEjcmDnUHmXLmAsLxIDztJse/n3K20Bz8CY5OmghgaJI70gaRqVh?=
 =?us-ascii?Q?gxwCk1YyUseEZLaBM/0Pv6iVXMq8bhr+Ru86yFi+J1V6IrbNXTwkgE2EF7bn?=
 =?us-ascii?Q?KGKk4wiTtiCPBw6mW5yGj0eGu178p2mMlbF4onRQsVmgAdc9mdjnqRJM8fv+?=
 =?us-ascii?Q?TGxe/t+KC7ou7QFFcwzhxW8nsU5g0+AtQxoV4L/sOQA3qgVHIAPpGNiQQi9v?=
 =?us-ascii?Q?Fmx6s6z9IajzTVTFuv7Y+rtai5p5TUubx+4MmssMUFqIqX8cogrJfLe/ndON?=
 =?us-ascii?Q?s1Dvo/m2WFlyVuQEh5XI6YRpFKKDqcLS64nzvqA9fFwDxgoVCUCK1sLHkELM?=
 =?us-ascii?Q?yYZqlMS4EkCCk660MApM7oaNM2theh7rtd2erOWp3y3xjGcG60h2mTpOoM9V?=
 =?us-ascii?Q?a1O3Ciqo3Tbb9rV2kYxLXH90Vo+kag262zc5FH2uQBB3lEJNhXQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e282fd8-55ea-40ef-ab64-08d8c8a6476e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 00:46:16.0327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xtW41ue/BpMZ1I0e2PfUwxs7ZvfulLSw6dFCqefvGpdMayP2woaSNtRc/sPB1VEMnsylz2VDrzfAclI7yHa3DskEdBnLJ5jJnl2gPLAv8ZxeMW2sX/vzMLPgj/IzEbMV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1738
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

> From: Rob Herring, Sent: Wednesday, February 3, 2021 5:56 AM
>=20
> Running 'dt-validate -m' will flag any compatible strings missing a schem=
a.
> Fix all the errors found in DT binding examples. Most of these are just
> typos.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Daniel Palmer <daniel@thingy.jp>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Vincent Cheng <vincent.cheng.xh@renesas.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
<snip>
> diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.y=
aml
> b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> index cde1afa8dfd6..349633108bbd 100644
> --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> @@ -93,7 +93,7 @@ examples:
>      #include <dt-bindings/power/r8a7791-sysc.h>
>=20
>      ipmmu_mx: iommu@fe951000 {
> -        compatible =3D "renasas,ipmmu-r8a7791", "renasas,ipmmu-vmsa";
> +        compatible =3D "renesas,ipmmu-r8a7791", "renesas,ipmmu-vmsa";

Oops. Thank you for fixing this.

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

