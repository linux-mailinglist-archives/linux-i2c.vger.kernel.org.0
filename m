Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762DB34170A
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 09:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234249AbhCSIBI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 04:01:08 -0400
Received: from mail-eopbgr70040.outbound.protection.outlook.com ([40.107.7.40]:1885
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234215AbhCSIBE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 04:01:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A77D9MjykevYr0prUN11IXzyYLwb5iKMzi2XU2s4IrtWUa63J4w6PfcFDc4swdrxUmOTTaTXr0qZ1il2HwZjpRfAPyPmmbZ0B5Xb/Dr1haPC7/f0CBF2bcA/RXwqDK7u3uJfkISnmJo7sMjEyhqf7FOFS8sKCwSaWzEOiyrdV8TyFBFy4+5nfplW7DZeqDG0pkK/utYYIkL4fO3+gA2b+yzimSuLVvouPM1bCfD/8SDeWzuS2P555yv1Lb52mUmZENywkSB5a9yJT132cCE5BNRRy6RiC+yX1A4V1xm2d90CwnRLe6u+I5Hc9CHSvC8JQMCFUH4dQ3nVzr4R5WxHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QoIYW5VxRxuFqXuR/0b0ghTaLKw1z5aLInBWXaQG5I=;
 b=LRwKSZIaAccv7qTzUBEvQkLDSfB0eZZfVE//BBr9kKCuySf3ZpUykim4Cez7rZqc7yv9e4DIAKGKgoGtfE5Az6JWRWOrRrEwLyxEDOicCCDaNe+H+nkHQmBb4YTIZUBnZg/lFsmzweOZ+m5NmsxoYRlHioJKpwr1Nn+G8PnMmDhtGYzyHg+Ufp7FRtffyTHQIJbLLkyEbnj2TFtR5gyZINb0kR0u727DcJ8gqbf35HmjA6FruwTHJtM2/8DTKQSofzdh5hHCMDB1KR3FgcCUub6sUWyx8NU6rGemllrnSUB5S9VLGAv972W7LxHWog7OnnNNLhaUkuJV6GR8m/nPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QoIYW5VxRxuFqXuR/0b0ghTaLKw1z5aLInBWXaQG5I=;
 b=DVWd0KRbm8NGSEtbaoWYW2chHo2tPFraYNak66krF09Vrk6b3IBTicqgI+w3JVDDAtoRBBpP3eHPKHJ5I9/nJBYhWxM1biOFTgecO9l7Avz6LbaNMqWphvihwGoxfdo0ns5u9erqKbDlz1YihqY4M8MHyJuOseAmSOejUP0O0Mw=
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR04MB6680.eurprd04.prod.outlook.com (2603:10a6:20b:f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 08:00:59 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::b0be:2596:6613:a4f8]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::b0be:2596:6613:a4f8%4]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 08:00:59 +0000
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
Subject: RE: [PATCH 02/11] i2c: imx-lpi2c: add runtime pm support
Thread-Topic: [PATCH 02/11] i2c: imx-lpi2c: add runtime pm support
Thread-Index: AQHXGvpM0N0yJ4yMMk6QG++HKLYxPaqKve2AgAAPC9CAACegEA==
Date:   Fri, 19 Mar 2021 08:00:59 +0000
Message-ID: <AM6PR04MB5623EF66E8ED430F84F8A57DF3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-3-xiaoning.wang@nxp.com>
 <AM6PR04MB496648409D86D673355B9DAC80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <AM6PR04MB5623F105B7B218D99FA10229F3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB5623F105B7B218D99FA10229F3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ea3ac1ea-223a-431a-dfb7-08d8eaad2238
x-ms-traffictypediagnostic: AM6PR04MB6680:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB66804B41103FABC8F76331C0F3689@AM6PR04MB6680.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B3+yX10YmyFwvouMFl9B66IUcP9jlEEP5lYMLDQTF9IhSwx6hhhsXCAH7aV94SLdoXeU539u4xuZ1uLosBJruWGfQALzqehUM7L1oOpNbtHKTHkjqTs2uA568Qo/tudi3qgDM4OIdouiaI/h9/8BhcUKmFciYdvV3udyrT3R8D34Nbk+WuGqvpSXPWHfAs2DNEuWfrV7S7p+0Mk9RIygoN6n77xaJp9i4etwmjelnAyQUHKc7YlBAD8utYOwLIXeeSVNWeJEQLrMXW9tQwF+OBqmP02hzByiCOlTGGIkpfP58yE1bV4BkBek73OA6O8NThKJNL9GprvEHwp76rPMTif6u8hnUd7wHAWRjZVAHptrOhkhR7ET5SJ+Hv+oiJkKc3cqCfyY0ek94umkZwgLgN2Uu3p7s/KnHGUQCmiIaPSeukelAALV3wLtjS8GaIxcVJHDDNVI6huEFWncefP2wtUb+Ss1iyWcQaskXiOUxfDyowjWY7859Tpg08Ss9M/U6dcJH6yv7dlcbNJOSCjj6d33nXh1zmNrkSI8SF3xCyDiDRbQ96IHECtCmDjj1UiO0ZSJwUaVWpq+KbWto4zLvAYwf9YeRblfobFBxzr6EzC2I9sBkZIlM23QzRZutsLZAawi0aGlexczRS0trU+77rY0081ebiB/gTGup/0DGjM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(99936003)(7696005)(54906003)(6506007)(53546011)(52536014)(5660300002)(110136005)(2940100002)(186003)(38100700001)(26005)(33656002)(9686003)(55016002)(66556008)(66616009)(4326008)(316002)(478600001)(66446008)(64756008)(66946007)(2906002)(76116006)(66476007)(86362001)(8936002)(71200400001)(8676002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QnppaE14Z1BsMzFWNjJvdndZdlgwb0E1Wnk5bW1GZjg3a2YrL0ttSTgzblVh?=
 =?utf-8?B?UGJlaXBqVEFDb2YrRnk5Qzg1clYyVmlodHdBemNnZ1drek1oMnhJUmFIeFVR?=
 =?utf-8?B?YTRpdWFDeHJhWWd1SHRORFlZbXcyTmU4dGpwZ1JqY2xGbEkvTFZNeWk3bHRU?=
 =?utf-8?B?RmtvRFFlaTJjb0J5bFBRSnhtZ3NYMXRDU1ZwNlF0SUxybVlaU0hIRjNaR3kr?=
 =?utf-8?B?ZHA5Q2N1bGNLVXNkWFk2enFNZ2MwRW9iNU5KZWsxcGlKRWhnZlFHc1k4cSsv?=
 =?utf-8?B?RGFTQVNFMmVvRnZmYko2dGFvUm13ZHFOSDhGYmlDMjZ5a3JaMU81NHdNYWNX?=
 =?utf-8?B?LzU4MFVGM2lzWTdoT3hkK2Z5bDlvZjRoV0FxNzY5K3lwZC9JWFhMOFNBRUtC?=
 =?utf-8?B?YmdBMjRtNjJRMytUU2lYZk8xMHcxdmVvWVRGaTE2OW8zNG5SK01aNm5Nbmly?=
 =?utf-8?B?UE1jczlzUFNEb1g4OE1Zb1d2bUNLTGE1aVhDRGJhZVVuTlZjSUh0TllreXhq?=
 =?utf-8?B?YVJSSVc1U25kVXBMVmh6V2lyMkx6TzJiV0hwTnk0dllUZ005NitDVE90ellm?=
 =?utf-8?B?eTZiVXFreDE0b3EyWmd4ZWtDd0dUeUNTakZGNWoyeEdjbXBETVJMaktmbnpI?=
 =?utf-8?B?MjhneSs4aG1wbDRDSWdKcldWWkJYa0huU3ZwZnVMVWVVMEpFcDdoVXNoWjh2?=
 =?utf-8?B?MHRRWUl0c09OMzdUbkZJUTArVkZRVG43T09lKzFuYTU5OWcvajRpdHdDUUFJ?=
 =?utf-8?B?NFpsK3B3bkdWY2x0eTcydDZERElKV3Z2WDN6R2RiaXdFY05CMGNrVlRFWWoy?=
 =?utf-8?B?RlZicHM1a1d0bTg1SHdYSWkyMzdBZ2o1TXphbVZYdWYrajY2eFM2OHpPQ3NJ?=
 =?utf-8?B?YkNSVzdlQmpYWFRLY2RzeDcxN3R4dDVhWmQ3U0xYMGs3RUp0TjViNVEwMzVa?=
 =?utf-8?B?U2xOSEI2MFYwQUJteUJ1cWpiZ2NtaTY2Z0dKYlNkNDltSkJuZkt6WVVDcmNE?=
 =?utf-8?B?d2E5dWtnL1FrdmxkaFRFdzlUbStLckpPSUgxelFwNzdUQXc1NGFNNG9xejIz?=
 =?utf-8?B?ZVkya0Jzb3ZaU2Y3ZFluNGtJTG55MlZnVjd2eFdhKzZ3ZXBQNDFOQUpMRnJD?=
 =?utf-8?B?NVV5SGpDOTR0ZStEMzNoUHdZdzZTdXZtR1dFM2NQM1Q4eFNlR1RwU1ptOWRh?=
 =?utf-8?B?K2lMY1M2bEtZWVlUMk8wc1pYNnZDSlQzaFUwVzEzU3NsNW5HaWJBRGd3dXBG?=
 =?utf-8?B?UXJHMWkzWHViTVN0Q2IzY3prME0vY21xa1Nna29WMFdMYUpFV1hncXJsZ0Ez?=
 =?utf-8?B?UllXUFgzd3BNYXgyMHdRL0phd2c3OVVpNzlRUjcva1JyQWlnY25WaUFUdlBT?=
 =?utf-8?B?YmEvWmxad0FvMjlqWHdpV1pPT0RqcFM2N1pUUWRhT1gyYTBsbUx0bVVZWkd5?=
 =?utf-8?B?alhSWlVvbEMzYmRhbllYTHFvb1BObkFZQTlhQ1QwR3VrOHdXZURKeGNRc2pK?=
 =?utf-8?B?dnp6aWJ1M0pDdXdTUHcyK0hseHVPbXFucWo5M3dINkY3M1IvNEZJK1FzZXJE?=
 =?utf-8?B?Y1JWSjNROG5Ed2FGVlhmczRtamp3eXF3M28rWEVNL0Uxa3E3WXp0YktyZ2lx?=
 =?utf-8?B?UHh0eW1WblczdllmbzVWM2FPZU9lVkhrZGw0V0NlYWEzemh6ZVVEVlBXbWEy?=
 =?utf-8?B?TytMVzY4WmdzcW1La0JnblZXaUdndGFuRE1jQ25ibWpMSHoyMXhwUGdhU0VD?=
 =?utf-8?Q?3MaaMD6P0PDSvr7f3FapkWJVI+hi4IiwUqp2Bs4?=
Content-Type: multipart/signed;
        protocol="application/x-pkcs7-signature";
        micalg=2.16.840.1.101.3.4.2.1;
        boundary="----=_NextPart_000_0333_01D71CD9.0C067630"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3ac1ea-223a-431a-dfb7-08d8eaad2238
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 08:00:59.6420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wff824tqr6GHOo96teLEdxiJMPqIdRGylf7NIWP6YYzvf69rwwB5cIGYSNds9tBXr+SRg7pqPnz68omAAyqlaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6680
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

------=_NextPart_000_0333_01D71CD9.0C067630
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Clark Wang <xiaoning.wang@nxp.com>
> Sent: Friday, March 19, 2021 14:16
> To: Aisheng Dong <aisheng.dong@nxp.com>; shawnguo@kernel.org;
> s.hauer@pengutronix.de
> Cc: kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-
> imx@nxp.com>; sumit.semwal@linaro.org; christian.koenig@amd.com;
> linux-i2c@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH 02/11] i2c: imx-lpi2c: add runtime pm support
>
>
> > -----Original Message-----
> > From: Aisheng Dong <aisheng.dong@nxp.com>
> > Sent: Friday, March 19, 2021 12:40
> > To: Clark Wang <xiaoning.wang@nxp.com>; shawnguo@kernel.org;
> > s.hauer@pengutronix.de
> > Cc: kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-
> > imx@nxp.com>; sumit.semwal@linaro.org; christian.koenig@amd.com;
> > linux-i2c@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > kernel@vger.kernel.org
> > Subject: RE: [PATCH 02/11] i2c: imx-lpi2c: add runtime pm support
> >
> > > From: Clark Wang <xiaoning.wang@nxp.com>
> > > Sent: Wednesday, March 17, 2021 2:54 PM
> > > Subject: [PATCH 02/11] i2c: imx-lpi2c: add runtime pm support
> > >
> > > - Add runtime pm support to dynamicly manage the clock.
> > > - Put the suspend to suspend_noirq.
> > > - Call .pm_runtime_force_suspend() to force runtime pm suspended
> > >   in .suspend_noirq().
> > >
> >
> > The patch title needs to be improved as the driver already supports rpm.
> > And do one thing in one patch.
> >
> > > Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> > > Signed-off-by: Gao Pan <pandy.gao@nxp.com>
> > > Reviewed-by: Anson Huang <Anson.Huang@nxp.com>
> >
> > Please add your sign-off.
> >
> > > ---
> > >  drivers/i2c/busses/i2c-imx-lpi2c.c | 50
> > > ++++++++++++++++++++----------
> > >  1 file changed, 33 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > index bbf44ac95021..1e920e7ac7c1 100644
> > > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > @@ -574,7 +574,8 @@ static int lpi2c_imx_probe(struct platform_device
> > > *pdev)
> > >  	if (ret)
> > >  		lpi2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
> > >
> > > -	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
> > > +	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr,
> > > +			       IRQF_NO_SUSPEND,
> >
> > This belongs to a separate patch
> >
> > >  			       pdev->name, lpi2c_imx);
> > >  	if (ret) {
> > >  		dev_err(&pdev->dev, "can't claim irq %d\n", irq); @@ -
> > 584,35
> > > +585,32 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
> > >  	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
> > >  	platform_set_drvdata(pdev, lpi2c_imx);
> > >
> > > -	ret = clk_prepare_enable(lpi2c_imx->clk);
> > > -	if (ret) {
> > > -		dev_err(&pdev->dev, "clk enable failed %d\n", ret);
> > > -		return ret;
> > > -	}
> > > -
> > >  	pm_runtime_set_autosuspend_delay(&pdev->dev,
> > I2C_PM_TIMEOUT);
> > >  	pm_runtime_use_autosuspend(&pdev->dev);
> > > -	pm_runtime_get_noresume(&pdev->dev);
> > > -	pm_runtime_set_active(&pdev->dev);
> > >  	pm_runtime_enable(&pdev->dev);
> > >
> > > +	ret = pm_runtime_get_sync(&pdev->dev);
> > > +	if (ret < 0) {
> > > +		pm_runtime_put_noidle(&pdev->dev);
> > > +		dev_err(&pdev->dev, "failed to enable clock\n");
> > > +		return ret;
> > > +	}
> >
> > Can't current clk control via rpm work well?
> > Please describe why need change.
>
> I think the previous patch maker might want to use the return value of
> pm_runtime_get_sync to check whether the clock has been turned on
> correctly to
> avoid the kernel panic.
> Maybe I can change to the method like this.
> 	pm_runtime_get_noresume(&pdev->dev);
> 	ret = pm_runtime_set_active(&pdev->dev);
> 	if (ret < 0)
> 		goto out;
> 	pm_runtime_enable(&pdev->dev);
>
> Best Regards,
> Clark Wang

Sorry, I missed the point before.
If we use pm_runtime_get_noresume(&pdev->dev); and 
pm_runtime_set_active(&pdev->dev); here, the clk should be enabled by using 
clk_prepare_enable() in the probe function. However, the call of 
clk_prepare_enable() is already in lpi2c_runtime_resume().
Using get_sync() here can help to reduce the repetitive code, especially ipg 
clk will be added later.
Shall we change to use pm_runtime_get_sync() here?

Regards,
Clark Wang



------=_NextPart_000_0333_01D71CD9.0C067630
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
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAzMTkwODAwNTZaMC8GCSqGSIb3DQEJBDEi
BCD9M8OnAfWPyd+2ydZMzu2dpftztq50t5+eoofJLi+8MzCBkwYJKoZIhvcNAQkPMYGFMIGCMAsG
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
zdosMAwAAAAAWXwwDQYJKoZIhvcNAQEBBQAEggEAkBtJ3y585scZGSkfQBTNushy58bHliXY1Cvf
sPpkhBBSMQGXzU7dMNf+7iOBhgkLbkYq4sxo2to6mQ5MLRggqvLfmtRZolqV2OiIdo5m2rWpudFw
YCVUsQm582AcWnnBJLadvQDTy7m+a0dUtDhmrxKJhA83IRivRynRlg1vaqgC5buz7zwujPYyPkc4
ZxN3GiDr4Z1/jVl4k/QGI4rxoXxNqFHOCG8yhLEgQUXOVn3aZ/VjcYO21R95bgFeyTdKOi/i41Fv
0hXWth4YmF+L8X0IyO1kaB58m3m97T4Dn6OdnMkOUwgoLni31cL6gOCnA6pSFrkIWeLPTDxQrcND
ygAAAAAAAA==

------=_NextPart_000_0333_01D71CD9.0C067630--
