Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C56D3414E6
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 06:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233819AbhCSFdk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 01:33:40 -0400
Received: from mail-eopbgr130040.outbound.protection.outlook.com ([40.107.13.40]:1603
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231787AbhCSFdT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 01:33:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTz6pg9ehB0Gld9ysttPpDWdCxijzKEMMCzCHtaVTwrKKRzOv1J6b5FLeuNUUl9LfAgI05LDc+UGWUgrE4OZeaHo8GbXDIISnSenF+bglEIMHrBVwcq2CT2dBS1LC92g16xGzcuZa9ztsfRyfgTxmbkUeIxScq7HgQl1xxpiIc4mh5G8YXp9bVCutBIt8ZqS4TrrmL4w6PULlkWvKqPm4AAFa5XXItbJma+LSyavCfgIoU9Zohna9L2k68dbdZ9yi5GS7UyAsvQHn2NrbssXwggLAAFBtdcWNNWFJTZsWk0CiaeU4wYoortdP2riR06gEGLYsCF1ZbrjMe2JFuNy5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WPSsF8+HlhGv6yCkYkYqCSBfOAYC8OBxz1UuQbyNns=;
 b=MGABOlOk0PXqp6k4Cbb7TAJbsdpVSRphO5RHlw4AHVQvw7V0tEzKG6WObNb9vpEKEzC4EOIpADftgmQQKIQzpc7V3+Tdew4HG4CuYOAfUvzOkND87oTuZnqmbp7+NzTedXJdihqMI4cyjDkGYrm7dvoR6B7G8o69L/2aFGaLme9zyGkfVdEEFrgjab9qvyz+1B8mLUW3WcouuOZH1fLnlLSsYFmmg+O8CtB0Whxfe/tDDxYhw1TzcfQKQi5h0zAhMZkQHAUwxkrfsVL2CqpVDTZEn+//54JvgMntLz9lhzQbyJ/Zqp50tEjv/Y4Umpw78iZUabVLXES3K5ise8z0Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WPSsF8+HlhGv6yCkYkYqCSBfOAYC8OBxz1UuQbyNns=;
 b=UEDAGGCo40/xmy4bSoBIL7ZoxhquaRXcAyfVTh4xFmUnolXSlk3DXHjAHZhnnngq9n8Cvw/JR38EcqBFWz0QofGnExf0tkdxFJs70Kop7FXX7WQPWjvzZuVf2EhfcX85+0Af4QZfv+FJRdygOaCZ+dpfkoIAiMFrxCC40eWEsO0=
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR0402MB3541.eurprd04.prod.outlook.com (2603:10a6:209:7::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 19 Mar
 2021 05:33:15 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::b0be:2596:6613:a4f8]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::b0be:2596:6613:a4f8%4]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 05:33:15 +0000
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
Thread-Index: AQHXGvpM0N0yJ4yMMk6QG++HKLYxPaqKve2AgAAOmQA=
Date:   Fri, 19 Mar 2021 05:33:15 +0000
Message-ID: <AM6PR04MB562363F2FEE10DA55E7897AFF3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: fa43ec1c-03b1-4b2e-1e3a-08d8ea987efa
x-ms-traffictypediagnostic: AM6PR0402MB3541:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB35413117208D03B6F6DA902FF3689@AM6PR0402MB3541.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XFXU01HjynFjykvkeuJ9eEBXzNee7fN/yvyaTzfH6QGEYdT8sj1wBL4z0+rvlKV8LhBv7v2TwP59oMhjkXpW5x1KUi4Wpf5oMSGBS2+qdpBkOgn5Izq2HEyJtU1MwjfTgmCBSc20A9TuAbMd/8z/STRI4JMPyCiO6fy5KSk8wtIFi7d70TsXE3TF2onGzzjnpezGew4az7mVEjvmWkGFMfZbXma5c4bqmaE5p1CLCga2YbDZ3hcJS/l1haWAIAT3wJGEBuyOSfbLVWM+vwEE22EP8dmfKi6N+yMPMTzajTMvU2O+TQilK8Oz7bDQDFSBePo9+zw8nk0/Akdmuq3X2y21Pw3aqR0t+7K9BlmWjq3eoRsY9JcNstHULUXiXNB2PQrhhy1XjNaRXdIdjruTAPqM4tpqU0PxnCIoD0fQKzsXZpo+cNYQWOgawl6ULyQ0qOjrEv/teO8juosDPFZHeT/Eg8VfyY8AIVTRbgSjNrcJy1PXz/ZIAJ8RylST5Dc2WePhYE8eEYVnEavP0JaNSA58cLwIjW1LBij77d7L7c6sFB2IjZduZjtpidiTWmuWJHrfg/vDkrvwRWVa4jDld5GKw5n3bZHZyz0Rj9Owd6hJ4fwO6s7XoyJf/uQIhq7O5rw3b4UQ21RUyyxWcLtN8g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(55016002)(71200400001)(86362001)(38100700001)(26005)(66946007)(186003)(7696005)(4326008)(2906002)(478600001)(99936003)(83380400001)(9686003)(64756008)(8676002)(52536014)(33656002)(66556008)(5660300002)(54906003)(316002)(6506007)(76116006)(66476007)(53546011)(110136005)(66446008)(66616009)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bFVmRHFkRHpMbnY3eTFzTjdxbGV4Y1BRMXB4R1liV3BkRUcyanVqV29Pa3NL?=
 =?utf-8?B?QmJQY2ltNDZmMXhITmQzTHVleStBM3RIcnE2SjRKRDd4TGM2OFUxR3NiZUtw?=
 =?utf-8?B?Rk5qRHcrUGVOUDhZNnRxS0I5QWNidXdWbStFVW1sTDRweDIxOUM5am5IRWRt?=
 =?utf-8?B?MzZXMU5QbWJBVElUMUgrWFdlR0FuQld1TUxaT3cvREgzU0hzTFpvWXFCY0Nu?=
 =?utf-8?B?NVZvcHRJVm9XRVNRZmQvTG5HakljOCtGamE4c3FJUGFWdnZOUFp0anRYSnFF?=
 =?utf-8?B?VFVScm5RMU95WEdSVlBnbzRhZGJNc2ZrVkhiRmpIRVFoQ20rbzBiM3FqM2pj?=
 =?utf-8?B?c2g2bjNXYkRTMnM2ek5zemxYU1RaUmNTd2YzYThhR09PUGNHUHA3NlJHRGNs?=
 =?utf-8?B?R1BvSmI2SlZ6SFgrYkwwU0ZVVFpPNmlWV3doYzNqNHFVUWxIQ3hDSkR5ZTdD?=
 =?utf-8?B?NjJ6SXlhL3V3dXI1VjFaVi9Ma0VSS1Q3dWExSEZSRWhLcFdSUy9IcjBhMDll?=
 =?utf-8?B?MHF1U2FHMHR3VTVpR2haUTVDVzhLU2l4TC9SMDVQMGk4eUVSYzRHMEFYRXll?=
 =?utf-8?B?MDg3Y3VXQTlLU2FMSkNhZjd4RHViQzlnMENNZzJwMjVMZ2lYOFNkcHFBS254?=
 =?utf-8?B?OUxhZWdJUHp6eXFiNS9PSzhGd29QQUhQZ1RoSElvN2tjUlVPN3BYdms5amJR?=
 =?utf-8?B?Q2ljVnNYcE5VcE85WnNyeXI2UVQ0WkhlMkVna0JzWW9YM0pLU3cxb1ZWVUFD?=
 =?utf-8?B?ZWw0dmllak96N3cxS2dzWkRNY0J4Z2pqWUppMW9jTUUxVWszOUpBY25TMkZ2?=
 =?utf-8?B?MU96ejRXWm5WN1ZKamdVbkl6RmRIV21QYTE4dnB2ZklDd0JHdkprRHVKTmhV?=
 =?utf-8?B?YlJONGJrYWVhQlZZZjd5SjEweDVEYUJaQStSQXpnVHYyM3pPc1FOdFY1S2ZF?=
 =?utf-8?B?TmpGZU1RR0IydnE5ejlINWxhcXlVVjVQekdCMXJrQW9DNUNyNDNMK0w3U3F4?=
 =?utf-8?B?ajlITlBZdDZmTjdWdlg4M2RMbzl3bU5iK2h2Q05BaDlaVHZFeC82VFBaWjJy?=
 =?utf-8?B?T1RnM0lHbUpQWkNFUzZ5LzVobkt1VTlzQjlnZTBxVjhwMEErSEJlUnVCQ0to?=
 =?utf-8?B?OXU3WDg3TVNkS2JNdnV5d1RQTnVza3pueFQ4Wm5HWVNrOU1Pb3hsb3BxaDI5?=
 =?utf-8?B?WFhRMmdQSVhkUENJaXpIMTZEY3hPSDc0aE9vZ20vM0x4L0hqakZVVXdvcGU0?=
 =?utf-8?B?MzJGUmpnMzhjUGJzSHNERHJ2VWgxaDNKR0ZSMmRSbXJLQzdkRXlWcTJMcVc2?=
 =?utf-8?B?NkEwOTE4d2RYaXdKbExhRzB1a1p3aERwR2NBZC8xT3FDbm9Gc09Jc1pYZWx6?=
 =?utf-8?B?Y2JrQ1JzbURrNXdHUnNONzFJUmdZSzVwQ2hIVnlhcXhSaXU2MlM5RHJPaVlq?=
 =?utf-8?B?bGR2TWE5Q1JVYnlVcnJrcGJVcHBCaGt1R3p0b0d6K0JwS050WGhUTzZid0d1?=
 =?utf-8?B?Smg0Vi9LdTkxZ1ZmM3Q0RXQrc1VYQjU3UU1GMjNRYTFjYzd0RndFY3dROXV1?=
 =?utf-8?B?N0N0T0lrL3V4djJWM3VXQytpalY5bUNpdzVqczZvbHlrTU9IVDNBOU9JTFZB?=
 =?utf-8?B?N1BzRk9JUVhNN3plVGZOMy84V1R6Z2t0RnM2djFGRm8yNENkTWVXWnRJSHVD?=
 =?utf-8?B?NHQ4YWY3UHdwTFNvb2dMZGZQSUdidEhIc2l2OVRnYlVjVHl4dkpMRHUwTGt3?=
 =?utf-8?Q?Z80C/lUZsLA2oZgMJM=3D?=
Content-Type: multipart/signed;
        protocol="application/x-pkcs7-signature";
        micalg=2.16.840.1.101.3.4.2.1;
        boundary="----=_NextPart_000_028D_01D71CC4.67A0D400"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa43ec1c-03b1-4b2e-1e3a-08d8ea987efa
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 05:33:15.7825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m1RblZYF5GT5BCSLnNvXP+cIuG8LG9xcG5DykTTqyuzNljiZV9IAqDLHd6kyfk+VUTfQpkV4NKaEItxckJeEhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3541
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

------=_NextPart_000_028D_01D71CC4.67A0D400
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

Thanks. I will split this patch into several and resend.

Best Regards,
Clark Wang
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
> 
> > +
> >  	temp = readl(lpi2c_imx->base + LPI2C_PARAM);
> >  	lpi2c_imx->txfifosize = 1 << (temp & 0x0f);
> >  	lpi2c_imx->rxfifosize = 1 << ((temp >> 8) & 0x0f);
> >
> > +	pm_runtime_put(&pdev->dev);
> > +
> >  	ret = i2c_add_adapter(&lpi2c_imx->adapter);
> >  	if (ret)
> >  		goto rpm_disable;
> >
> > -	pm_runtime_mark_last_busy(&pdev->dev);
> > -	pm_runtime_put_autosuspend(&pdev->dev);
> > -
> >  	dev_info(&lpi2c_imx->adapter.dev, "LPI2C adapter registered\n");
> >
> >  	return 0;
> >
> >  rpm_disable:
> > -	pm_runtime_put(&pdev->dev);
> >  	pm_runtime_disable(&pdev->dev);
> >  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> >
> > @@ -636,7 +634,7 @@ static int __maybe_unused
> > lpi2c_runtime_suspend(struct device *dev)
> >  	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
> >
> >  	clk_disable_unprepare(lpi2c_imx->clk);
> > -	pinctrl_pm_select_sleep_state(dev);
> > +	pinctrl_pm_select_idle_state(dev);
> 
> This belongs to a separate patch
> 
> >
> >  	return 0;
> >  }
> > @@ -649,16 +647,34 @@ static int __maybe_unused
> > lpi2c_runtime_resume(struct device *dev)
> >  	pinctrl_pm_select_default_state(dev);
> >  	ret = clk_prepare_enable(lpi2c_imx->clk);
> >  	if (ret) {
> > -		dev_err(dev, "failed to enable I2C clock, ret=%d\n", ret);
> > +		dev_err(dev, "can't enable I2C clock, ret=%d\n", ret);
> 
> Probably unnecessary change
> 
> >  		return ret;
> >  	}
> >
> > +	return ret;
> > +}
> > +
> > +static int lpi2c_suspend_noirq(struct device *dev) {
> > +	int ret;
> > +
> > +	ret = pm_runtime_force_suspend(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	pinctrl_pm_select_sleep_state(dev);
> > +
> >  	return 0;
> >  }
> >
> > +static int lpi2c_resume_noirq(struct device *dev) {
> > +	return pm_runtime_force_resume(dev); }
> > +
> >  static const struct dev_pm_ops lpi2c_pm_ops = {
> > -	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > -				      pm_runtime_force_resume)
> > +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(lpi2c_suspend_noirq,
> > +				     lpi2c_resume_noirq)
> 
> Belongs to separate change and explain why need do this
> 
> >  	SET_RUNTIME_PM_OPS(lpi2c_runtime_suspend,
> >  			   lpi2c_runtime_resume, NULL)
> >  };
> > --
> > 2.25.1


------=_NextPart_000_028D_01D71CC4.67A0D400
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
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAzMTkwNTMzMTBaMC8GCSqGSIb3DQEJBDEi
BCA74iDg5BXYA0EXy9KkawiQ32Ql1HuAICP27TDjelrFsTCBkwYJKoZIhvcNAQkPMYGFMIGCMAsG
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
zdosMAwAAAAAWXwwDQYJKoZIhvcNAQEBBQAEggEAio5wcSjyAtio8Na/2YS5zd3oBZfG6za0jkcU
mG37wKQCZTIKIst4cPEwvlimIAk1ngian7oBerGX7zsb2pVqHxtOLU+gyIqYbqxtvcMj5wOTdc9A
PTHMnXUGbBKwWzYTHyFiaxd4TblMARowxsOlUx1q/WX0ZvyVRRPS63BA1yPZABmFLoI/HdsiQEVF
V9DnMO59ZnQOMOIR4i+Ox6BVtKO9P4x67l79ZB3rOlpmdWCx1GWZslhgn4YPTK66J7at+fzgLtNk
974yNdlWJB3gPbrbp58tnC+6cWnsCgc5CzZZQslNaTmL9kvlVimGAOnBMEWlEgyAiVXw8X/YnOMe
IgAAAAAAAA==

------=_NextPart_000_028D_01D71CC4.67A0D400--
