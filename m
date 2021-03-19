Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A889C341543
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 07:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233902AbhCSGQm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 02:16:42 -0400
Received: from mail-eopbgr80078.outbound.protection.outlook.com ([40.107.8.78]:64249
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233829AbhCSGQ3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 02:16:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTMrL0PdsDLl961wAnjzZ/tUB3aw7YaZymglV+ybxgGzu1DJzxV3Ji1WtjZwos0G7Lsg+bp4+1FzDsdd0XVSln1ECkfisxplHRgiE4jJT+3mP/4BN0q5YOhtBANFalLpIhcT6uZELbMwD8nQzVJlHisVLzTBOcPtizxOE0POtn/Ddy9O3GCkuT+Hw3877B+r4c0GbzjbTC5K/Ir21tIBfy9Tk3c9UlUQlwj9DhxXxIxlqlAJvKxtQFd3kfe1hgRYDn7sEoimI+Pho0CKjiCfesYRWTtW5Ccy4ISi0H/4pPPngauoryADAI4vDq0h4+T2eAcDQzbLVMwIkb1htMfxoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+/0AP105PGHaLPk9cSQ3HpNMXCNw4rL1cU6TTTiwcE=;
 b=DwHeX7NjDaJiRnIPiXBP03WQKRR3g7ZGwhpkKyFSf/ZDWwiJMJDf8Yrq2mINnu9G/433m6VlrpuU+TgnpEneFmuJuBItaFTBbT+q9bWbsBBio2h5D+gyJas2byP4zIEMWn586OXsf9c06qXaiKPsfI3gmskSofINgQ67SEeFnFnGblknWJ47InXBLt0unYhQnpbtGNHR2UuZCjwGf2gdfVoqLu7vm4e5CNF9uuqtxlk3wVkf5rXawu7FHs44LyIYGXaPdYrGFN20/B8F1Vy2AbA4ohCQjBGXXKgDJBFjG3oxrzPrIayDilQiWhe6Ml1JguzY61tkYGUnwf+P2SVALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+/0AP105PGHaLPk9cSQ3HpNMXCNw4rL1cU6TTTiwcE=;
 b=NQKDTicGccRQffwmPIsxI4guOMkU9Dyi7BS0JaYUTyi9dGZ8LMos70BljhwYLJA+OXqCUOWawcs0JGaK8z8vD7Cj588/grCxokLnAHCLCxz1ce/giZrF/AEboqJh6VuBdLgaLJv5vC8yCpzsCStbXEKAlfv1RJrLqdKLTelYqeo=
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AS8PR04MB7894.eurprd04.prod.outlook.com (2603:10a6:20b:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 06:16:26 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::b0be:2596:6613:a4f8]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::b0be:2596:6613:a4f8%4]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 06:16:26 +0000
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
Thread-Index: AQHXGvpM0N0yJ4yMMk6QG++HKLYxPaqKve2AgAAPC9A=
Date:   Fri, 19 Mar 2021 06:16:26 +0000
Message-ID: <AM6PR04MB5623F105B7B218D99FA10229F3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-3-xiaoning.wang@nxp.com>
 <AM6PR04MB496648409D86D673355B9DAC80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB496648409D86D673355B9DAC80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a99147c2-858b-4f5b-3c3f-08d8ea9e8750
x-ms-traffictypediagnostic: AS8PR04MB7894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB7894456141E74CD0C8BC3D14F3689@AS8PR04MB7894.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SMxH0JEkTJHD+HpT3KihBbqZB+g5fX9i8G2qu9ZPrG9BNg81Cu4+GhTlwlY87WBblsWO8e/xe8HkRikXKGepLXhwF0GSr8bqF3hKbbNZzRa387rTF8cWkJy3wqRkLSmHsDr2KShv+W8tyrCwoztKNwZEEanGs0nxM1rA6w7shhXRb/udJM9maxWxMhwsHAiZN0sES/W72Frjnh/3y48OoFLY/vAwMAinpAfUhMFhL23INNhg2kJl56R0UFW7/0D4qo2oW1TZfZDEjT3k1AOJjl26GNL1FsJt16St4SY9Z9L2bx/pLDo2ySw0Z1rYG2YIO1wyniTAhs5XYx9KM0rKKsi+BZvJV4q07aGtxCRbLKZv1z0c9PWCfA8bNvnaB8Kx05PsHACTgCEFohgxsR54xpo+tjYCdLkXs5sKiIDyuyvd3AXO22uRAaDRa/spojYyNeE/xU8XEd3zg26O44Tvlt1T7nwZqmVg5gTkYDzAfJrSfm93EFH2sV/CVAS1y4svNfLbVIZda0Uqg248CYwD5WZhQb3KoAEpAvY0FbMxn9XvOo06NaK8Wk7a3g7BRKCh+/NwWsoB3MsScTZAJ0nfMWoxoR5B+QSAVe1yGQkVCMIrfth2XeNPMJoCNJMLybcJdDwFkqfT9VEmUZ2p+TjB/tTcT4phQeA5g1CI7aGZrfA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(9686003)(478600001)(38100700001)(6506007)(52536014)(7696005)(66946007)(76116006)(316002)(66476007)(64756008)(54906003)(66556008)(66446008)(2906002)(55016002)(99936003)(8936002)(5660300002)(71200400001)(86362001)(8676002)(53546011)(4326008)(33656002)(26005)(83380400001)(66616009)(186003)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?S2swUHczM1RvOVM1NEhIWFMrVEJpZmkxWWVmdjVSOU1YTTRsd20zOWdTQzgy?=
 =?utf-8?B?TXR4ZzB3TWVaREUzc0srVitmamFsMnRCN0tkSEpmMm1BdXNUS0pidnFObHNY?=
 =?utf-8?B?K3R6NEdJM2cxbHdmTmtQK1BhV2FmNmg2bjhsZ2hJYmtqV00vMy9Gam1Yb3hZ?=
 =?utf-8?B?a1ovWlRBRngyUjhONGZoakZMSGRvYjZPZTI1OEE1eklwUFBFTTdpR0pSRktI?=
 =?utf-8?B?cWJSU01jckdvZVhXbTgrK085Q05wNFQxK1VYR3F5K09XbXlLOWQzb0Z3M3hK?=
 =?utf-8?B?dzBqb0k5M2gxRStWMzRtV1hFVC8zOWFpUWhFTHE3Z0NYQlplWUtYZFlOUXJu?=
 =?utf-8?B?aTJUTnBJWWhONnBKZ1N1SkltTjRuRlFpaHdWakJLSXdWYjhnV0ZFcjhhQWJJ?=
 =?utf-8?B?RERLYnpCNTdINlUycjYrSG9oSWVxUzFkOUg5ZVBkUDRxblhXRDZtam5hWWhY?=
 =?utf-8?B?WnR5WE1FNWZyU1d4UTBQQ0hYNmt5OElJRmpCUkdCcldUTDhqbUJSYm5XL1dE?=
 =?utf-8?B?VkF3eXB6dHRWbkYzRlgvRmpIVTV2eExZQk0wczZQVEdhejdUbVc0cUZWVWRS?=
 =?utf-8?B?YTJLM3UyOHloaW5oRnh2K2pFOGxZZ3lyUm95WmRQL1FGWGFZMkk1NEViZUx4?=
 =?utf-8?B?YUkrZDR1QkNrRzl5NlNvdVI5WEtRK1NSMGVsSW15L3NUcHl0RkJRcW5ONnlB?=
 =?utf-8?B?QlhzU0ZJekFHT09HZHhYWERmcXZMeVhpZU1LVTdhcmZnREZSemtYcUlKUHV2?=
 =?utf-8?B?MWVzVSt4bWRQZEE5KysvdXBHY0V2L0tTeHdBcHZwVlFPckhLSk1vUVc2dndy?=
 =?utf-8?B?NEVua0h4bDFiT2UvdDdhOWsyQm9rZ1hoSE4zTFo4b2tOL0RUSWNueU5QWFBM?=
 =?utf-8?B?WGNTVzBXSTVnWVZUckFNQmVtS1FDOFlreENvelN6MGI3NHNYM1I4aDF6R0NF?=
 =?utf-8?B?MjJ3L0JNZm1qd0hWOTdncm5lRHNNVm9rZ0pnd21aT0VYUklJVHNSQXFBa09G?=
 =?utf-8?B?RHY2UHp5blNTV0kxWENIOVFEZ21MbXZkVzdPSU14akgvV3U2MzN1eVRCWitS?=
 =?utf-8?B?bVNsRGJub3g1TTdTMXVqbm84YjRIalc2WXlUaHFMemFmNERPSFRUMlhWc0FQ?=
 =?utf-8?B?QlFieUcvUy8ybmdISndVczBiZVNtNWhsbjJtay9vNnBKU21Mc0dPc2lPbFlU?=
 =?utf-8?B?VHVnS3VBK1BlanRWSm5relUyZFdzQ01zbU5VUlBIRk5LeGgyZGEyU1NWTTZo?=
 =?utf-8?B?QkVZWS81d3NGUzBpRXJ3dW1qUVpVNHJ5NnZhcHpEbU1vNmxWYTg0U0h5WW12?=
 =?utf-8?B?K05UMmVNYjVoTmFBRGxZV0Z0K3VxOW81Wlc0ZFBka05hTVFwTlBQVmNqNFg1?=
 =?utf-8?B?Smc1RldPcmlNUm52YmJ4R3I4MkVibW5SeFNWS0twejBGWEhHYWlubnJOQjR0?=
 =?utf-8?B?YWVhKzN1ellPNHQ2RWRvc0dWRDlkMnQwSFpScitpdE10WS90enMrYmJNS1RP?=
 =?utf-8?B?a2JHcExvbzBZMUNOZ25YaUxaMlFRTnVvV2tqMlFIZ3dmcldTRHYzVFpFenpw?=
 =?utf-8?B?Njc0d0RMVDJVVmQ5T05FV1dBWSs1K3hJQVVOT1RMQUlpMWU2N0ZTRERNMTVk?=
 =?utf-8?B?V3lmYTlaZGN2bUxPZURnaUtTQVc3ZDYrZjltd1V0RkhhcElUanBwSkk2ZHlS?=
 =?utf-8?B?ZnE2WW1UbXMzVVZKSDJwckxoaHpkYnV0cmNVYTJ3L25jMmRwUTFtbkFDSjE1?=
 =?utf-8?Q?5zpmGyy8AbjD/a3FA1drJfULteKP6xTyVyVk82p?=
Content-Type: multipart/signed;
        protocol="application/x-pkcs7-signature";
        micalg=2.16.840.1.101.3.4.2.1;
        boundary="----=_NextPart_000_02A3_01D71CCA.703F3100"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a99147c2-858b-4f5b-3c3f-08d8ea9e8750
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 06:16:26.7200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eV5pgT/3LdjbVQnPAZjWD2Fo01wGZmccPVY64Qk4uhFay/aZZ/wFdsmf0++4lzZalH9YcLeE+4U6RVUFpQnGNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7894
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

------=_NextPart_000_02A3_01D71CCA.703F3100
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Aisheng Dong <aisheng.dong@nxp.com>
> Sent: Friday, March 19, 2021 12:40
> To: Clark Wang <xiaoning.wang@nxp.com>; shawnguo@kernel.org;
> s.hauer@pengutronix.de
> Cc: kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-
> imx@nxp.com>; sumit.semwal@linaro.org; christian.koenig@amd.com;
> linux-i2c@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH 02/11] i2c: imx-lpi2c: add runtime pm support
>
> > From: Clark Wang <xiaoning.wang@nxp.com>
> > Sent: Wednesday, March 17, 2021 2:54 PM
> > Subject: [PATCH 02/11] i2c: imx-lpi2c: add runtime pm support
> >
> > - Add runtime pm support to dynamicly manage the clock.
> > - Put the suspend to suspend_noirq.
> > - Call .pm_runtime_force_suspend() to force runtime pm suspended
> >   in .suspend_noirq().
> >
>
> The patch title needs to be improved as the driver already supports rpm.
> And do one thing in one patch.
>
> > Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> > Signed-off-by: Gao Pan <pandy.gao@nxp.com>
> > Reviewed-by: Anson Huang <Anson.Huang@nxp.com>
>
> Please add your sign-off.
>
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 50
> > ++++++++++++++++++++----------
> >  1 file changed, 33 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index bbf44ac95021..1e920e7ac7c1 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -574,7 +574,8 @@ static int lpi2c_imx_probe(struct platform_device
> > *pdev)
> >  	if (ret)
> >  		lpi2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
> >
> > -	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
> > +	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr,
> > +			       IRQF_NO_SUSPEND,
>
> This belongs to a separate patch
>
> >  			       pdev->name, lpi2c_imx);
> >  	if (ret) {
> >  		dev_err(&pdev->dev, "can't claim irq %d\n", irq); @@ -
> 584,35
> > +585,32 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
> >  	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
> >  	platform_set_drvdata(pdev, lpi2c_imx);
> >
> > -	ret = clk_prepare_enable(lpi2c_imx->clk);
> > -	if (ret) {
> > -		dev_err(&pdev->dev, "clk enable failed %d\n", ret);
> > -		return ret;
> > -	}
> > -
> >  	pm_runtime_set_autosuspend_delay(&pdev->dev,
> I2C_PM_TIMEOUT);
> >  	pm_runtime_use_autosuspend(&pdev->dev);
> > -	pm_runtime_get_noresume(&pdev->dev);
> > -	pm_runtime_set_active(&pdev->dev);
> >  	pm_runtime_enable(&pdev->dev);
> >
> > +	ret = pm_runtime_get_sync(&pdev->dev);
> > +	if (ret < 0) {
> > +		pm_runtime_put_noidle(&pdev->dev);
> > +		dev_err(&pdev->dev, "failed to enable clock\n");
> > +		return ret;
> > +	}
>
> Can't current clk control via rpm work well?
> Please describe why need change.

I think the previous patch maker might want to use the return value of 
pm_runtime_get_sync to check whether the clock has been turned on correctly to 
avoid the kernel panic.
Maybe I can change to the method like this.
	pm_runtime_get_noresume(&pdev->dev);
	ret = pm_runtime_set_active(&pdev->dev);
	if (ret < 0)
		goto out;
	pm_runtime_enable(&pdev->dev);

Best Regards,
Clark Wang


------=_NextPart_000_02A3_01D71CCA.703F3100
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
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAzMTkwNjE2MjJaMC8GCSqGSIb3DQEJBDEi
BCAtBkFUqx8JHIj/AWh39rNcn5UG6GUL8e2BfzD8W3oDUTCBkwYJKoZIhvcNAQkPMYGFMIGCMAsG
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
zdosMAwAAAAAWXwwDQYJKoZIhvcNAQEBBQAEggEAONzfIEMxr0uELWaGczGuzmORAFNkl9tCbFkj
bZqDOCKzKhD3TQtpFO2qTak5eseHfZNIrDo6YUUVCEgwFKH8pkV9/GX92ItHd1rdp/0h8VVKp2/h
DLqRHKiN4HL9iXtneNClCcyVS/WulsbsiizX8VvH+RaaqfuHzsX8+7rgsRAO27zdCn52esYChWkE
/qfqfUDp6A4f+G2Ck2JGW06I2qtbjWGpFY2Z0pYru36xovRXot0GxVH1QiDZM/7Z+Y59JAy88VIb
z57Tq7xk1UkbYX3UiyqZ9OnbpqF09xbziGhLObp4WKnQuMKC1EVHI2U1H41Lx4/piBk5NKtnMtSo
swAAAAAAAA==

------=_NextPart_000_02A3_01D71CCA.703F3100--
