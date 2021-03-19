Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAC9341557
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 07:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbhCSGXq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 02:23:46 -0400
Received: from mail-eopbgr140077.outbound.protection.outlook.com ([40.107.14.77]:8197
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233993AbhCSGX3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 02:23:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDJXWq/JtsNqLNR7nSwlsCbCoJQ3/hkx6MMc+NbNMt7mdeEqowfs4M+VgCr/o88243/h4tdcD/l3txOp9K3pQxqhSqjLg71LA7f69jKdH8hPOkVbeVzy910zpGQoHiedvHWKBR4WtSmVmpSakJ//rnUExwzNzVXvJWQJWu8nNGBJjX5C0Ou864MIycSB7AWbR1aaSkSBlzmEuS7sU8AC79AX6ngXYXF9FuJMsmnMBmMlIx54rXvjmsgUV2kJktr+Whd8XQ7cDnVk7i/Nybl2JJQHB9Dey5NpcN76sd+355Yv0/K1yi6ICARhEj/Aj30Hz63MD8vZINDnp12UY5nejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOGDlSZWYLP/eOHOY5ejoSUsXoq+HmbAWSEvoZUzkis=;
 b=au1zE2R2J5u0c3Zr7XVXSlvoD3g7GfqHGhMZM5TPBMtEvtKN+Qgy8HPdejSHJ1ogJ6Lc0/dCsz8tz5085Bv8W1mVTycCHTuF3Ap8Jky96J4MQMOdxDOFOKbGe56xOFdV3agMS7Jydk7RIxxB372VOj9kkPBInPhjE3ytz+ITpoum4BXJn5OOJ5NEe6lJ+j9JaW2oMz2c6qFG+nUYhHTGAJTEVqNTU4BbtrJ3+BYpwYJl2fKFzMQKPYOxdKianTrCKRNVUf4VObl6hEbmdTbwrcQG/iRjPrmHxm5dOoCrpxkRepBLcXYv7qgsMpll6XSVTr9lTcbrUKlSpe7oRzUv5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOGDlSZWYLP/eOHOY5ejoSUsXoq+HmbAWSEvoZUzkis=;
 b=C2SJBu2Rq+JBd5YpPsqnKfyH5ocObmfkats6rwLm+4JTcbUHeRzZFPizO+lU+glwfzYXurQrzoTKQkisgALypsXyA5rggxn64dmpFvXntDcPh7ZVVGA43glNDkWLGt/L4LBoEknMXXCwE3atOqWG5+R4l1jkxpjuQF8yOv1HNS4=
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AS8PR04MB8359.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Fri, 19 Mar
 2021 06:23:26 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::b0be:2596:6613:a4f8]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::b0be:2596:6613:a4f8%4]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 06:23:26 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 03/11] i2c: imx-lpi2c: add ipg clk for lpi2c driver
Thread-Topic: [PATCH 03/11] i2c: imx-lpi2c: add ipg clk for lpi2c driver
Thread-Index: AQHXGvpO+ej15fj3Skux0OyKjkme/KqKv7KAgAAaExA=
Date:   Fri, 19 Mar 2021 06:23:26 +0000
Message-ID: <AM6PR04MB5623C88A286E99F55EEC0A48F3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-4-xiaoning.wang@nxp.com>
 <AM6PR04MB4966B34788B83306B64E92CF80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB4966B34788B83306B64E92CF80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c60737b8-356e-4ba0-f87e-08d8ea9f8156
x-ms-traffictypediagnostic: AS8PR04MB8359:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB8359C06A94683D7794256DB4F3689@AS8PR04MB8359.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:549;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ic3mmP42W8KG/LyM8wlmEJrH5rX/H657tcQSrKggX9ULwucw/ZXT8TA7s8WEyIWfGAGjmTZwOEBO3jisSL0A4+AqkV1s2MuHkHdD+0ozgf5PYL8ksyZMA3Wl/LcXu7QJ6Dyy9BLs7k4Q9mZF/gslSs19yZT582Hi7kWaJ+J54yfDi5jYhvhrsCAFl7d85PrvPAnbW3KfadONekunIm653wG9FpOiYfO21PBTupX0YUmTJRRKCHxX7gvTE5iwdSRx0dLhARSvmn6fA4PNC6rQyYWvkZu6Do2DOktLR/IfxisNi7PqYpQpdiKSueCyNeh6Z5/HkogifKI/rYpxly6rgdEeA4yDkDN+KhfIfKDZkdMZTrAYGqjJ2/0ARN76mOAkiUsmLpt/IjufFGXb9hId9Ij79iVhj6S+ADM6vpCnszOxfwzm4AaxEyCJJbJAw9mYR4kW4XexW795YLULSajHyJQ1hgf9TIfnKz4Z2K+uZXVqa2ZN7xj5WZArPBMP2SXdkeMeHjK0PK042RP1+ZVbSKyE0kYnZbwhmlZ/PSWZgyy4pvRu7wHXKFb5Xj21nO0mZrX1KaaxRm99sSZDXC0QVfFGux9ZGBeUF6TUSaEWkhyPrBa8ZsKXFsZBNZF4/TyGiQj61g1jKT+929dzFLKM878ylRXWS7VXjbQUu9AySyQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(66616009)(66446008)(64756008)(66556008)(66946007)(66476007)(86362001)(110136005)(478600001)(2906002)(76116006)(71200400001)(7696005)(5660300002)(4326008)(8936002)(55016002)(6506007)(53546011)(83380400001)(99936003)(26005)(54906003)(186003)(52536014)(9686003)(38100700001)(33656002)(316002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?U0hNYStBcFB0UEJrcm5TbzhiMWx5dC8vcktzWkxTc2YzNkM5VU55ZVZuSXoz?=
 =?utf-8?B?SXBWY0hIL1hqWHluYzFvRU1qWXVDSU5GblJ5ZU1kN25EOW0xWk5Zc0grTjJG?=
 =?utf-8?B?enZzd0plaFBMN1lkMW1QOWM1QmVsSmg4bm1DSm5xbGRvakwyRU5IQzFqVjFa?=
 =?utf-8?B?L3l2NHE2bWJDanhwd0Ywd3Z3clNCVndEYWMycGdRWnErZUUrN2FKdDdwTEU2?=
 =?utf-8?B?eFJadXF6cWExMUJqSTJ4TnY1d3I1V0pDOHlJdktoaktTc2RkNWQ0VnBvUVkv?=
 =?utf-8?B?c2kwT2xRM3Eva3Y0WmNFSm5qdnk5aktPWkpFWWNTQkk3SFoyOVdIdzdvZHJh?=
 =?utf-8?B?Um5BS2NPTXpWc20wbFVVRmJjandyVzVnMkc0WGFRNU90OHF4aFhTeExvY3Iy?=
 =?utf-8?B?NjJZNmhKN3Ivb2JaZ0VCSE1xWkpOZ1NNMVlpa0E4S0NwNUdidmMwSmNSQW96?=
 =?utf-8?B?Y2hEMktycFNwLytUMEFPMXJvQXFqS3FpMnRXUzdzNnJsckk4aU02Q2sxaDQ5?=
 =?utf-8?B?R3YxSjJJd1dNYU1Kb3k2RExIVmE4eWJmc0lrN2xtZmhtMjVDa0xWVk9XNTVN?=
 =?utf-8?B?eUxyK1dpNU9pVHFSWmhtUmVkZ0xtekxJeWhBVnRrYjRHb3lkbEo2S2NBTmY1?=
 =?utf-8?B?OEhSL200eUQrMjFXejZqa2d0VVpoSi82WG5JNHN5R0kwaTg2SlVQTk1UMTdZ?=
 =?utf-8?B?MmUxWDI3WW9FWlJ1Wi9oLzFFcGRWZmZzbml4S2kwTDN1UnpDSGs1M1FKNXRz?=
 =?utf-8?B?S3dJMXVrQ1BUd2dnSHBUV1BjUkNENlZaWHRmTTJDWXluemprRHhNeWJGVjRH?=
 =?utf-8?B?V05LREhCY1A1Si8yOFJDdmdhYXdMSGpFVDBuVGliZlBFYmZjM1RqSzhDd3ZQ?=
 =?utf-8?B?WkFNeHVRbEkyTC9mdkJiTjYwNExIdHZSak1oSjdINlI1YlJ0MVc4aHpWV3JG?=
 =?utf-8?B?OGRSTlRjajlNdUFlVzVmZHpzR3V3VWhCS01RNTIrY0V6WUl6OVp5UkdWMUVT?=
 =?utf-8?B?QjFJTGpvZjVwTS80Yk00T05nUi95bGxFZ3hySzhPaUVaZERLSHFEWVgvYzUy?=
 =?utf-8?B?SVV3bzJGdG5NejRBd2U5Z1kyKzg5S1pMeUxvVTdmVFdWR3llSjNpN2hPRUIz?=
 =?utf-8?B?RnRkVWpRYTl2MG5JQ2JQVDVGL2pjSUVMZ0pVOW51WHBxSWYvR24yWVY0dHZJ?=
 =?utf-8?B?RzVaem11S1ZncXFiUHc3djBHdnBheDVNZWJDbUcxaGpXRFNGNzNpVnR5UzdY?=
 =?utf-8?B?aTRlNUF1S0F1T016M20rdWVaYmIzK3VrSjZnTGpPamMwbXdRWS9zQkhFZWg3?=
 =?utf-8?B?OXFkYnFvL2ZHclp5dXVHOXk3U2VueUVEc2ZlSTg2Zno2U2dDckRabnovTjl3?=
 =?utf-8?B?OHgvSTY4TlhhaExnb2Q5QnBubHBHVDYrVHF2VXVOSjVtZG5udHBHWDVRdE5y?=
 =?utf-8?B?M1A4N0FhSExEOWdXaWEvclNvcXNIVGF4SWJSUC80bDVxV0JkR214Y3F4MHlB?=
 =?utf-8?B?YkVacUh6M0doT2VEdldsZWMvTWRZNTNIbytPQ0JQSm9OK0JWbWNmU21iYUtU?=
 =?utf-8?B?dmJEMmN5Y09wdDJ0MTc0d2o1RHh6cHNTRk1TNStQcWRhamdLM0hIZmEwNGFq?=
 =?utf-8?B?SUIzRzlNQk13cStiTzk5aWU1WjBwMkkzNE5MRzZKakNzZ1YrWUpzN2VTRFR0?=
 =?utf-8?B?OXdKaDAzcU44aGRxVEdNaU85S0pHWGxvK25oMUQ0eHAyWXA3aXBmNXg4ZFZD?=
 =?utf-8?Q?cASXQ8MPvRja9xEYHB3WGvr0xzSTEDhfj2/Quvl?=
Content-Type: multipart/signed;
        protocol="application/x-pkcs7-signature";
        micalg=2.16.840.1.101.3.4.2.1;
        boundary="----=_NextPart_000_02A7_01D71CCB.69EEDE80"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c60737b8-356e-4ba0-f87e-08d8ea9f8156
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 06:23:26.2705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: btOXVCOjTSpaVzIisEquq21t+EqbUZOkaA3CUPo5ZqUzCpiqCcIutVqJKpoqRE7kB7E07jyeak3jKDZgEWXFVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8359
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

------=_NextPart_000_02A7_01D71CCB.69EEDE80
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Aisheng Dong <aisheng.dong@nxp.com>
> Sent: Friday, March 19, 2021 12:46
> To: Clark Wang <xiaoning.wang@nxp.com>; shawnguo@kernel.org;
> s.hauer@pengutronix.de
> Cc: kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-
> imx@nxp.com>; sumit.semwal@linaro.org; christian.koenig@amd.com;
> linux-i2c@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH 03/11] i2c: imx-lpi2c: add ipg clk for lpi2c driver
>
> > From: Clark Wang <xiaoning.wang@nxp.com>
> > Sent: Wednesday, March 17, 2021 2:54 PM
> >
> > The lpi2c IP needs two clks: ipg clk and per clk. The old lpi2c driver
> > missed ipg clk. This patch adds ipg clk for lpi2c driver.
> >
>
> Pleas also update dt-binding and sent along with this patchset.(before this
> one)

Okay, thanks.

>
> > Signed-off-by: Gao Pan <pandy.gao@nxp.com>
> > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > Acked-by: Fugang Duan <fugang.duan@nxp.com>
>
> You can drop the Ack tag if the patch was changed
>
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 28 +++++++++++++++++++++-------
> >  1 file changed, 21 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index 1e920e7ac7c1..664fcc0dba51 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -94,7 +94,8 @@ enum lpi2c_imx_pincfg {
> >
> >  struct lpi2c_imx_struct {
> >  	struct i2c_adapter	adapter;
> > -	struct clk		*clk;
> > +	struct clk		*clk_per;
> > +	struct clk		*clk_ipg;
> >  	void __iomem		*base;
> >  	__u8			*rx_buf;
> >  	__u8			*tx_buf;
> > @@ -563,10 +564,16 @@ static int lpi2c_imx_probe(struct
> > platform_device
> > *pdev)
> >  	strlcpy(lpi2c_imx->adapter.name, pdev->name,
> >  		sizeof(lpi2c_imx->adapter.name));
> >
> > -	lpi2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
> > -	if (IS_ERR(lpi2c_imx->clk)) {
> > +	lpi2c_imx->clk_per = devm_clk_get(&pdev->dev, "per");
> > +	if (IS_ERR(lpi2c_imx->clk_per)) {
> >  		dev_err(&pdev->dev, "can't get I2C peripheral clock\n");
> > -		return PTR_ERR(lpi2c_imx->clk);
> > +		return PTR_ERR(lpi2c_imx->clk_per);
> > +	}
> > +
> > +	lpi2c_imx->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
> > +	if (IS_ERR(lpi2c_imx->clk_ipg)) {
> > +		dev_err(&pdev->dev, "can't get I2C ipg clock\n");
> > +		return PTR_ERR(lpi2c_imx->clk_ipg);
> >  	}
>
> Will this break exist dts?

It will not break the build. But will break the lpi2c probe for imx7ulp and 
imx8qxp/qm.
I will send two patches to update dts in V2.

Best Regards,
Clark Wang

>
> Regards
> Aisheng
>
> >
> >  	ret = of_property_read_u32(pdev->dev.of_node,
> > @@ -633,7 +640,8 @@ static int __maybe_unused
> > lpi2c_runtime_suspend(struct device *dev)  {
> >  	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
> >
> > -	clk_disable_unprepare(lpi2c_imx->clk);
> > +	clk_disable_unprepare(lpi2c_imx->clk_ipg);
> > +	clk_disable_unprepare(lpi2c_imx->clk_per);
> >  	pinctrl_pm_select_idle_state(dev);
> >
> >  	return 0;
> > @@ -645,12 +653,18 @@ static int __maybe_unused
> > lpi2c_runtime_resume(struct device *dev)
> >  	int ret;
> >
> >  	pinctrl_pm_select_default_state(dev);
> > -	ret = clk_prepare_enable(lpi2c_imx->clk);
> > +	ret = clk_prepare_enable(lpi2c_imx->clk_per);
> >  	if (ret) {
> > -		dev_err(dev, "can't enable I2C clock, ret=%d\n", ret);
> > +		dev_err(dev, "can't enable I2C per clock, ret=%d\n", ret);
> >  		return ret;
> >  	}
> >
> > +	ret = clk_prepare_enable(lpi2c_imx->clk_ipg);
> > +	if (ret) {
> > +		clk_disable_unprepare(lpi2c_imx->clk_per);
> > +		dev_err(dev, "can't enable I2C ipg clock, ret=%d\n", ret);
> > +	}
> > +
> >  	return ret;
> >  }
> >
> > --
> > 2.25.1


------=_NextPart_000_02A7_01D71CCB.69EEDE80
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

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
U2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNv
bT9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0
aW9uUG9pbnSGL2h0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEVudGVycHJpc2VDQTUuY3Js
hi9odHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybDCCARAGCCsG
AQUFBwEBBIIBAjCB/zCBuwYIKwYBBQUHMAKGga5sZGFwOi8vL0NOPU5YUCUyMEVudGVycHJpc2Ul
MjBDQSUyMDUsQ049QUlBLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENO
PUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29i
amVjdENsYXNzPWNlcnRpZmljYXRpb25BdXRob3JpdHkwPwYIKwYBBQUHMAKGM2h0dHA6Ly9ud3cu
cGtpLm54cC5jb20vY2VydHMvTlhQLUVudGVycHJpc2UtQ0E1LmNydDBHBgNVHREEQDA+oCUGCisG
AQQBgjcUAgOgFwwVeGlhb25pbmcud2FuZ0BueHAuY29tgRV4aWFvbmluZy53YW5nQG54cC5jb20w
DQYJKoZIhvcNAQELBQADggEBAK4JPoIkTbfuhwLtQ9Fm320K9JnOD+UvIk7UY5A58pq540ABcjCz
LggHvY+pE9m6IdsLfPL0lj4rrK660DRFM7k6XQEoJXjOBlZ+FGi7oTGL+VVi4+TYQzwPUMr8Ukg1
EBMzKb84Kh3oA96THluC3OFR3DbU/3NJsMYI6hIpvL4G+MQS0NZiEOf0CW73kreekaWUzCcnDbjr
9c8a1dI966lFSHr+2MAjj1iiNou1MXi3YA0jTy2qW78wdbtk/UbWkFIp11SyqA6Va6i96c7WgohG
zzxofRhw1yf5mb0SSjrbcFvLWRyx5iVZIhapdbztkYGYJiroxzI+ndpbztisjkYwggfxMIIG2aAD
AgECAhMtAABZfNGGA83aLDAMAAAAAFl8MA0GCSqGSIb3DQEBCwUAMIG2MRwwGgYDVQQDDBNOWFAg
RW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcM
CUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmSJomT8ixkARkWA3diaTET
MBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTELMAkGA1UEBhMCTkwwHhcN
MTkxMDI5MTM1MDU4WhcNMjExMDI4MTM1MDU4WjCBmjETMBEGCgmSJomT8ixkARkWA2NvbTETMBEG
CgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA3diaTEMMAoGA1UECxMDTlhQMQswCQYD
VQQLEwJDTjEWMBQGA1UECxMNTWFuYWdlZCBVc2VyczETMBEGA1UECxMKRGV2ZWxvcGVyczERMA8G
A1UEAxMIbnhmNDc3NDkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCZY70u6L2tkQw7
9PyXIwnCQZGWP+8gSezFvuegmg10bDVMZux1jQKY48+p9oQeUBOfM9652qP5o4VTqDCR4MBxbtB7
CXxyjzKOdVxraRqx+xibX12lcs4LmCtz3JeEduJkKJ7W+QJtTbqtF6okCUCQRT/vF/BqUyfNyVs6
Mexrp1Lj4Yv841rbsVKC6k3jdt1pqi/0YZscxs7rqP5VsvFcK1der8zrQ/98AbMMjoagsu+nq64x
xPly7BcBfjUMTlw2PsL5viDocyLeVtW22VInObVN2bvFKdtkQEliZtoBKVwevOx1UMYis/yAbqhE
x+7g2Z/59jqDaZSy7SOxigvhAgMBAAGjggQQMIIEDDA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3
FQiFgsB+gY70VYbthTiC65lLmpJWP4Xmim6EteF+AgFkAgE6MBMGA1UdJQQMMAoGCCsGAQUFBwME
MA4GA1UdDwEB/wQEAwIFIDAMBgNVHRMBAf8EAjAAMBsGCSsGAQQBgjcVCgQOMAwwCgYIKwYBBQUH
AwQwgZQGCSqGSIb3DQEJDwSBhjCBgzALBglghkgBZQMEASowCwYJYIZIAWUDBAEtMAsGCWCGSAFl
AwQBFjALBglghkgBZQMEARkwCwYJYIZIAWUDBAECMAsGCWCGSAFlAwQBBTAKBggqhkiG9w0DBzAH
BgUrDgMCBzAOBggqhkiG9w0DAgICAIAwDgYIKoZIhvcNAwQCAgIAMB0GA1UdDgQWBBSZJY1p6Y56
X4YAWIozHW4aGPBzZDAfBgNVHSMEGDAWgBRYlWDuTnTvZSKqve0ZqSt6jhedBzCCAUYGA1UdHwSC
AT0wggE5MIIBNaCCATGgggEthoHIbGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1
LENOPW5sYW1zcGtpMDAwNSxDTj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2Vy
dmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jZXJ0aWZpY2F0ZVJl
dm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnSGL2h0dHA6
Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEVudGVycHJpc2VDQTUuY3Jshi9odHRwOi8vd3d3LnBr
aS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybDCCARAGCCsGAQUFBwEBBIIBAjCB/zCB
uwYIKwYBBQUHMAKGga5sZGFwOi8vL0NOPU5YUCUyMEVudGVycHJpc2UlMjBDQSUyMDUsQ049QUlB
LENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24s
REM9d2JpLERDPW54cCxEQz1jb20/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29iamVjdENsYXNzPWNlcnRp
ZmljYXRpb25BdXRob3JpdHkwPwYIKwYBBQUHMAKGM2h0dHA6Ly9ud3cucGtpLm54cC5jb20vY2Vy
dHMvTlhQLUVudGVycHJpc2UtQ0E1LmNydDBHBgNVHREEQDA+oCUGCisGAQQBgjcUAgOgFwwVeGlh
b25pbmcud2FuZ0BueHAuY29tgRV4aWFvbmluZy53YW5nQG54cC5jb20wDQYJKoZIhvcNAQELBQAD
ggEBAEH+a5BarGYCUuH4P4sFJkrA7Y1U1aWb2nxNOPDARJLTwdEyMP6pPY0Bm7AyypW60HlI3Z4I
eP6NiMibW55/xz5EEcHxOrbYFmPyLY9twXLluCHnpZYT3NrDCD9dbOhUeZbDB1FXG93zfMJ8zzL4
9njRn5J6mcLiHkUpVRacp9susO1zN3uzp8TXCHy/y483CE6g1qUijUyiTPlAT9gz7xvyxAhTmrhH
8Fue00PWfK0B7zzjd1b0Da2nWFZXk4IsYJeyt+RTWC07VscWFiJ3avbgN0kaCswkvB1f6DVOqDRx
r5hHoNADBEcsMNdQNRVu2ospazEVq8wtXPTB7Ihf564xggTDMIIEvwIBATCBzjCBtjEcMBoGA1UE
AwwTTlhQIEVudGVycHJpc2UgQ0EgNTELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIw
EAYDVQQHDAlFaW5kaG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZ
FgN3YmkxEzARBgoJkiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYT
Ak5MAhMtAABZfUBCujlfjY1jAAAAAFl9MA0GCWCGSAFlAwQCAQUAoIICxTAYBgkqhkiG9w0BCQMx
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAzMTkwNjIzMjFaMC8GCSqGSIb3DQEJBDEi
BCAj4UqQa2u+OFT2gbhogQESLKNVbnYVDLpsqNeAKrBcjzCBkwYJKoZIhvcNAQkPMYGFMIGCMAsG
CWCGSAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDALBglghkgBZQMEAgEwCwYJYIZIAWUDBAIDMAsGCWCGSAFl
AwQCAjAHBgUrDgMCGjCB3wYJKwYBBAGCNxAEMYHRMIHOMIG2MRwwGgYDVQQDDBNOWFAgRW50ZXJw
cmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcMCUVpbmRo
b3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmSJomT8ixkARkWA3diaTETMBEGCgmS
JomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTELMAkGA1UEBhMCTkwCEy0AAFl80YYD
zdosMAwAAAAAWXwwgeEGCyqGSIb3DQEJEAILMYHRoIHOMIG2MRwwGgYDVQQDDBNOWFAgRW50ZXJw
cmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcMCUVpbmRo
b3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmSJomT8ixkARkWA3diaTETMBEGCgmS
JomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTELMAkGA1UEBhMCTkwCEy0AAFl80YYD
zdosMAwAAAAAWXwwDQYJKoZIhvcNAQEBBQAEggEAE3EcK4FZUndsy4aqxs8UYyv4Tp7YHAQRiev3
Ir2QFIFbpT7PjeOXPxKK+FYq4/EWEGxaKo7EesOHrp9OzrLb9R2XWS4so39VpE0TvIn9+28FAbFg
tDI1/GA+HrzqXRWZ549ILYuZqwr2/vjl6xzWL/EP7bOdH4ipSLz5vXSD+rM4WN63UkYMAEQj7uQn
0gNlAEMvu3qQFlisTTF/nhaNK95S5eF5fHKf5vQPv11VGZbjJ9OdRfz1+sUa3fGKrWPAyUY4gG0z
kYFUNfzcBbrNGZFADugmH+e0fuaJH4CxApSGPOe/i5O9EHaIGHJztRXtBH+GiDVkCvwRh6PVTcLM
ugAAAAAAAA==

------=_NextPart_000_02A7_01D71CCB.69EEDE80--
