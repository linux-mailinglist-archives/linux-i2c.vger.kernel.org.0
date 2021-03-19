Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E7B34163E
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 08:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233973AbhCSHDa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 03:03:30 -0400
Received: from mail-eopbgr130043.outbound.protection.outlook.com ([40.107.13.43]:42500
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234018AbhCSHDX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 03:03:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYXbwkjzHoyUJba7doMmABuSE1AyQa3EPV2cLvIh3D9aIuwrB7SYnoZMqk+xG3V5guXs/+YX9jpgwz1JLmC8NOPXzKZ3MZ/c934IR3hMS9J8Jx0P7YCrGt0zkzJfOysELtCkI/C1lZxDtz124n1T5D3TiCI/prn7on1n1LQ2mgXIzv/r+b0MgQG2UN7nHTjNnZpGU2yqSJsPGJuitIk6Aic95QeP5H4sgwixSUv2GK574QBgBW3ZQs5LEX7SCX6xetvsJmCfLr/8zrWf5xtmewxgRntJURGiuqKHEZx092sgSsipoMGt5pN9dWJFC5R4TpvULoZbZ+ujvujiPSHziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwsVaBdfQqWQzkJa8Kuctje/SNBHejbnal6hMGGMviA=;
 b=Hn9rkBTt+SGLqbjToQB/uaCI0/doDDumLybIHqSdZH7ahurY/0DEOfVBoG7eS/1UAOqwXt82SsGqFDCsQnfd8oRnI9+8apkfmOyHPBystEbQe/vpTUtrLZeuarfBkxT4FGxGX8QJZtCEwdugfdcPZFlR9Wk1PKo9MrMkMcKSbtA8ryqGHDDrNynre3VSbKyeP1Qf4r+oP6l1PZV+6Es0Zf5xMWWOIceFzqe40y2p5nzP9qSFLYCLWaAXfHm7HTnRAGkWco3R+x2Jr70HgB1BU0eQ+Kzpm+fL/vCE4Dre6Fo0HQLbVdUAR0ggERDCRX9C1Co1fSchpFlR5GelQx1KJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwsVaBdfQqWQzkJa8Kuctje/SNBHejbnal6hMGGMviA=;
 b=L2SmXhfCertX/Lj9gmTiDQF8oBj8iBkVeBRkwttTxifzuMVK101lI2Z5QYbq9dWWxleENlPRMScCz7HUMZOe72xAnHlxLDir7QE99Ks4+hc47fBdK/5Cbvv4ed0A69DnXuMoVqw8u40UImAeTaogtoDNSIq+cFh9cGBU5eJbalI=
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AS8PR04MB7511.eurprd04.prod.outlook.com (2603:10a6:20b:23f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 07:03:19 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::b0be:2596:6613:a4f8]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::b0be:2596:6613:a4f8%4]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 07:03:19 +0000
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
Subject: RE: [PATCH 04/11] i2c: imx-lpi2c: manage irq resource request/release
 in runtime pm
Thread-Topic: [PATCH 04/11] i2c: imx-lpi2c: manage irq resource
 request/release in runtime pm
Thread-Index: AQHXGvpQTQouxk5MVk+9bkq/HPbds6qKwccAgAAc9GA=
Date:   Fri, 19 Mar 2021 07:03:19 +0000
Message-ID: <AM6PR04MB56237A9E5A332422D82FB30DF3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-5-xiaoning.wang@nxp.com>
 <AM6PR04MB4966C74D4E052317F22358C080689@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB4966C74D4E052317F22358C080689@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 49c042c0-4c67-42ec-0466-08d8eaa513fa
x-ms-traffictypediagnostic: AS8PR04MB7511:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB75113837FC05D440F607AC11F3689@AS8PR04MB7511.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: luymsEtZwQChJ0RHP9TSYK3tO4cEhlzifIkFJJLS+zskGfPUzwOI4hZxe2Kp5khpW8Bohu/hwEeRjTbQzWoAKempu+ic0PkGzsgpSpULt5OFYNfGZkCVF2TS/QZt5F506Ab9ufLwUeM6MBcDmtg2EukAmzK1OyAJ5Lilm8atc627vgs5KK+skGrJCdUlI1X6eNHxk6BPYjECxYUNEf3jpZB9mQc7yooTrrzazTNeLPakREThQh7a1KrABVZwjetIF4j5kxUVZX0LBLq88zjqzCcwxj2XvyHAjpNATMs2xV82D3LTUB867WyoY5/L3kRjLhEzEcVrWrs/eQGt33AnBgn4BUeVJRhGvptocPku+Jhf6UXscY2vFCVWJTjaek1bV6xTMu4v4GbZaydrYQ/uwjj2i153jEPI8jddPW2PDFX9xCWsPXX7Mtq97/5np5vWLlZtuznf7QaCB2aA8PXc0looX5Fxaez0WLglQ+he8aqs6R1lqryX1Qh0rjYs53njQ4fDC523s8Dg4e1PdQf7zPqNpBkGC1B8fRPGwasqdSJvb5BqkmhslG5dGfD7hdWzHuBjHR/MipaXeBbTz7xZWEoWnwbbh3zdgaMo+5viIFMlmebZq9TpWfLJ/6McyiGQLQfi4Dk5RT0jYUdLkXD3Vejua3ROPcuqMTvRMELDqqg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(33656002)(38100700001)(66446008)(5660300002)(64756008)(66476007)(66556008)(4326008)(86362001)(66616009)(52536014)(7696005)(83380400001)(71200400001)(8936002)(55016002)(9686003)(66946007)(6506007)(99936003)(478600001)(53546011)(76116006)(8676002)(26005)(316002)(2906002)(54906003)(186003)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Vkc1a0wxVHF6M3NYR0hoMmUvQzZvQ1p0WGs5bFJtR3QzUTZ3dm1mUjJRQjBY?=
 =?utf-8?B?YzUwOW5yc0I2dSt4TWl2N3hHVUR4NEY4d0Jjd3BpV0pKYi9RYUtoUWlTSHd3?=
 =?utf-8?B?T1NWaFR3RmVnNnltQkcrVlFnV0VpQUw1dEdOSGcrOWNNQkw3MGpyaUNvcW9F?=
 =?utf-8?B?czJZNFIyT3dwdUc2RmFPVCtUSW5HTTkvRlVxc2tzZ1RLYnlOTWJyM3NBSEdB?=
 =?utf-8?B?T2VsZExUc1hQNUc3aHhEQlB6MnlTa2xvdXNZL3c3L0YxMEpRMit0aTd6dXJW?=
 =?utf-8?B?a05BU20vQU5Zb3JkekFiZmhkalJOcVZ1anI3SDAzdFFNdkhheGNuTjdYcFdG?=
 =?utf-8?B?RTZFZE4rUEpNMWh3aVlkYk1uOCtDaXBDTlBnbVIwM21CRTFzOGtkbVRZTDFj?=
 =?utf-8?B?ZkZ2NUVVa3ROMTljUHhLZFBUU3ZWYmxzWXJBZlJ2UkVzNVRzamw3Z1FBcFVW?=
 =?utf-8?B?NXhYYW8rWnNtY2hpV0RyME01S0ZETzB4Z2pNbnl1VExTajJNaFg3cnFPRStn?=
 =?utf-8?B?azdHSWovZ2V5eXNYRU9VRWJySjVRa0wvRVBTT1J1VVlPSS95WnFyMnhVMHYv?=
 =?utf-8?B?cmp0L1c2QU1WM214cUNoZVZNUVpCQTk2VW1iV3JMOU16TytNNnZsYy8vc3Y2?=
 =?utf-8?B?a2tnM0NLOWxWRS9yaGM2dmRDOXY4SEhndkNBdzEybjl1VHZ2NFl4UjYvalFn?=
 =?utf-8?B?WnhCRUJyS1FLYkxISmlmYU50UFdFM0hWSVlVZDc2ZjlZaFJXMllYK3FCSzdP?=
 =?utf-8?B?clIrblRPR2VhYTJERG1HOUM0RFo4TWxHZzV3VmZXSHNGMGxVSHpqN0M4azBr?=
 =?utf-8?B?Qy8rM0lPWmZLeUU4MlhOM3NqVzROR015TWI5NjRYeDZla1dVOFIxa20vRHNR?=
 =?utf-8?B?UGR2ZDFCcDNaVG5MY3k2c0ZvU1NJd0dsSkpISllsaVJ2UjdaVjgvN3I3R1R0?=
 =?utf-8?B?SGZKclpaVC85Wlg1VXhaZWJZT2xORGJlLzJETGR1QnU2QjQxYkpiZkhhRElM?=
 =?utf-8?B?NXk1MEU2UEJBUFVvUE8wUFRmQktCQ05IQ3hneTA2Y3NucWozcTZoWERXRXAy?=
 =?utf-8?B?STB2ZlE3T3pqaE80WGIvWXlXSEVmQW5uam51TjJZWXlkcGJ5b0VwWFdYQ3Zm?=
 =?utf-8?B?K0psbTJ5TnFtWTFpdG1MK0xCSVE0WEIzVHQ1ejVCcTZxUWkwMFppK2FBUms1?=
 =?utf-8?B?SGRzcURES21aWmV6Mk93UHYvcE5lV200OGVhKytxT1JtUndYc1FtRTNINWtG?=
 =?utf-8?B?NmhoUkwrU2pUUWl5YWhpSXNNOGJZVkhaWFk4ZFltY0xsRE5qNFJsUHdGK04z?=
 =?utf-8?B?S3Y2ZkVtMUdNb3NWN1QyeUdMNnlPMzZweFJQV3dvWSs3MWxGemxQVG1mZHdF?=
 =?utf-8?B?UW9udFkvSWZjNnRvNFVYVG43cDNDZUQ5bXR5ckJuT1U1NS9Hb3E4YVNKU3RW?=
 =?utf-8?B?b1FyTDdRM0k3dS8vREtmUWhWUEJmRWlHOFpPQlZuZkdxc2JYcmdZUFVOSDgx?=
 =?utf-8?B?QzRNczVScFl2T09GQXFaU29od0ZiYWtlV3RCSEdjOEZYcy9KTGRnK0JWSkM2?=
 =?utf-8?B?RjZLbzdVYTZOdEVnM0ljNDhrbmsvbjJlMnFCY2w2aHdxY08xVXRMMk42Ty85?=
 =?utf-8?B?SHJjWmczYVhJdUlDYWFTSFhVZ0tWS2FEdytJdjhBUzYyZlNDckcxRkxqWm10?=
 =?utf-8?B?ZEZ5TnVtbit2cDhDSXFSL0NkY0FkdGFucGhBSFRmMnR6clhleGVnOTB1OE5u?=
 =?utf-8?Q?J95srGe9/BSWfQqI3DVCvsxCYtILDij3h3V9bMQ?=
Content-Type: multipart/signed;
        protocol="application/x-pkcs7-signature";
        micalg=2.16.840.1.101.3.4.2.1;
        boundary="----=_NextPart_000_02B8_01D71CD0.FE2853B0"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c042c0-4c67-42ec-0466-08d8eaa513fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 07:03:19.7441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3S9i/e3ISFZ9G9qimwoliturXIi4Z95P9ARxxJ5xCUc3u5mZPflzNOW/E8MDQNJHZUG3R8wS/UcHD4mLjXThAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7511
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

------=_NextPart_000_02B8_01D71CD0.FE2853B0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Aisheng Dong <aisheng.dong@nxp.com>
> Sent: Friday, March 19, 2021 12:54
> To: Clark Wang <xiaoning.wang@nxp.com>; shawnguo@kernel.org;
> s.hauer@pengutronix.de
> Cc: kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-
> imx@nxp.com>; sumit.semwal@linaro.org; christian.koenig@amd.com;
> linux-i2c@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH 04/11] i2c: imx-lpi2c: manage irq resource
> request/release in runtime pm
> 
> > From: Clark Wang <xiaoning.wang@nxp.com>
> > Sent: Wednesday, March 17, 2021 2:54 PM
> >
> > Manage irq resource request/release in runtime pm to save irq domain's
> > power.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 26 ++++++++++++++------------
> >  1 file changed, 14 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index 664fcc0dba51..e718bb6b2387 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -94,6 +94,7 @@ enum lpi2c_imx_pincfg {
> >
> >  struct lpi2c_imx_struct {
> >  	struct i2c_adapter	adapter;
> > +	int			irq;
> >  	struct clk		*clk_per;
> >  	struct clk		*clk_ipg;
> >  	void __iomem		*base;
> > @@ -543,7 +544,7 @@ static int lpi2c_imx_probe(struct platform_device
> > *pdev)  {
> >  	struct lpi2c_imx_struct *lpi2c_imx;
> >  	unsigned int temp;
> > -	int irq, ret;
> > +	int ret;
> >
> >  	lpi2c_imx = devm_kzalloc(&pdev->dev, sizeof(*lpi2c_imx),
> GFP_KERNEL);
> >  	if (!lpi2c_imx)
> > @@ -553,9 +554,9 @@ static int lpi2c_imx_probe(struct platform_device
> > *pdev)
> >  	if (IS_ERR(lpi2c_imx->base))
> >  		return PTR_ERR(lpi2c_imx->base);
> >
> > -	irq = platform_get_irq(pdev, 0);
> > -	if (irq < 0)
> > -		return irq;
> > +	lpi2c_imx->irq = platform_get_irq(pdev, 0);
> > +	if (lpi2c_imx->irq < 0)
> > +		return lpi2c_imx->irq;
> >
> >  	lpi2c_imx->adapter.owner	= THIS_MODULE;
> >  	lpi2c_imx->adapter.algo		= &lpi2c_imx_algo;
> > @@ -581,14 +582,6 @@ static int lpi2c_imx_probe(struct platform_device
> > *pdev)
> >  	if (ret)
> >  		lpi2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
> >
> > -	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr,
> > -			       IRQF_NO_SUSPEND,
> > -			       pdev->name, lpi2c_imx);
> > -	if (ret) {
> > -		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
> > -		return ret;
> > -	}
> > -
> >  	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
> >  	platform_set_drvdata(pdev, lpi2c_imx);
> >
> > @@ -640,6 +633,7 @@ static int __maybe_unused
> > lpi2c_runtime_suspend(struct device *dev)  {
> >  	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
> >
> > +	devm_free_irq(dev, lpi2c_imx->irq, lpi2c_imx);
> >  	clk_disable_unprepare(lpi2c_imx->clk_ipg);
> >  	clk_disable_unprepare(lpi2c_imx->clk_per);
> >  	pinctrl_pm_select_idle_state(dev);
> > @@ -665,6 +659,14 @@ static int __maybe_unused
> > lpi2c_runtime_resume(struct device *dev)
> >  		dev_err(dev, "can't enable I2C ipg clock, ret=%d\n", ret);
> >  	}
> >
> > +	ret = devm_request_irq(dev, lpi2c_imx->irq, lpi2c_imx_isr,
> 
> I guess unnecessary to use devm in rpm

devm_request_irq() will use device resource management.
Other resource like clk and struct space are all managed by devres.
Maybe we can still use devm_ to let devres manage irq here?

Thanks.

Best Regards,
Clark Wang


> 
> > +			       IRQF_NO_SUSPEND,
> > +			       dev_name(dev), lpi2c_imx);
> > +	if (ret) {
> > +		dev_err(dev, "can't claim irq %d\n", lpi2c_imx->irq);
> > +		return ret;
> > +	}
> > +
> >  	return ret;
> >  }
> >
> > --
> > 2.25.1


------=_NextPart_000_02B8_01D71CD0.FE2853B0
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
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAzMTkwNzAzMTdaMC8GCSqGSIb3DQEJBDEi
BCBJJpzewIEsfVX321MTdYozp2q40ADyR8+MOyKM18EI6zCBkwYJKoZIhvcNAQkPMYGFMIGCMAsG
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
zdosMAwAAAAAWXwwDQYJKoZIhvcNAQEBBQAEggEAm9O1zSM1kN69kJs/VZiqEbrYRcZ3bEWMcywu
rFla9+AyjWH3hOg8SDP3Q1IRaagblNBIKrgmaYSlSq4rU+S7NRix3vNJWXCTeEEDJ96So7QeCarF
yXP8YJsLaJbDW5vycfvdliDnjcVCXjLLPmSpE4RqPVQZS7w/enX2XkW8VAVeji40Ekgq9ZX3fDdU
MlpMP7KcYlTaNoHUizsYO7T9vIkcIescSZ5/vhsqByfGScvg5TzhPbGZkb8tEh0UaW903yenuDZz
ay+FjXLrmWSXBxCc3H/BvkwrbDlKSJwtNna5C+n4mTCYaweoTaRi2Qgu9tzzpDmrnphQFu+q1sVT
vQAAAAAAAA==

------=_NextPart_000_02B8_01D71CD0.FE2853B0--
