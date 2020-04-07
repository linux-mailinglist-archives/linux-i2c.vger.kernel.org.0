Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E37C1A1656
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 22:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgDGUAA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 16:00:00 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:26768 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726712AbgDGUAA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 16:00:00 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 037JtFxW004152;
        Tue, 7 Apr 2020 12:59:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pfpt0818; bh=+CcX/ZacW91eEztv4lSaOLEbKPjkicu+2eD3Rg+h9qg=;
 b=b04CZImBt5jlsHCeJZeyHmmSoKhyDttU6OSRl1wCaXBuFVuH+THNgsJA/EDnsQq+4UiI
 ZaI7Wm9PCufM0MfkDckPqYxG5Rbhby8/Q3VUKSu+lDBwG4uVk9U4y5FXGObrhK3ZJdJv
 Os78fGNlAfAs+ZijbtOlbGqbf8gq1p5Zcj7P78WunJ0zUPOgXWUZ20/BtZJiqY/tFxwF
 HfUc+Rm+m0W8x9SOR4INJDIB122g7L1ehDV19ebhMWICo3+N+KTJFPb0htvUqrnxY/T3
 lhAkI/P2272iQ/3FPBZzyBL4LsEfJQ5CT2l2X10SF113sW+HeyLMugwsJ9mGbnXKJ1D+ 6g== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
        by mx0a-0016f401.pphosted.com with ESMTP id 306qkr4exr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 07 Apr 2020 12:59:55 -0700
Received: from SC-EXCH02.marvell.com (10.93.176.82) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 7 Apr
 2020 12:59:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by SC-EXCH02.marvell.com (10.93.176.82) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Tue, 7 Apr 2020 12:59:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gw+ueTujkOmB44IrPFmfSFWfKkjEttzXs4Y7WE6arIbAf18hFih4x7zypqXf+c+xRRuvYDSHtI3+1wjO3OCIQ6T+AvDX4LoBSZR4z69RuAFxELDuCpvoPpkDAxYiHCNDiWC+Ym6ziB2if/T9WmmncnFNG02PYTVgof15TQ6y5nZKHDoHt/THRSi6JzKFhvBziqOw7/wQtnid4OIFGTLV+2Wl9MKTFbQST54+gwkrkk7ohn2RHpTGcdLil7Hrf6GBYpm38/xCM0Daimm4tAl+zsAcdBGtVV6Yn8sIBmiPyn/yzl8gtfzx1rQxZ/z9jTj3ZUjeCh5nJJhUIZwu8Yl/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CcX/ZacW91eEztv4lSaOLEbKPjkicu+2eD3Rg+h9qg=;
 b=n84ezDP+9WFBOT9phRayP7OqAJ2gtP+ouIfbUQqrGeha1bgm6wnd2yXgqskK+vNQFJKLE21YjxfUpGGweDackoCES4rhr8cHcYQTX39fOG609gVCKRcQ3Ahm72pCNcSA1TMBcdIALbnwemzRT5zGYuJpUl86ywPTQZjzje+vuoBBJ16hIUbSuYnUnCkNdOVqaUSe8wjyYn1ftTvjEnUoUSSnzmlrmMXw6qgnoksqTLkq4gz4GOfvW0YCJW7DF6AdbBuly5DEfYAxpoByPu1DEqNGqTSM9XXZdRo1r0MRqQ72dhodrVhdy6kMzebo5R7L22ODuMIy65pDijixc5jwUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CcX/ZacW91eEztv4lSaOLEbKPjkicu+2eD3Rg+h9qg=;
 b=qxoiSBT+iSbZFzzVsPj8DvfK/r4IFeyaqBXWDIvTqXsxhULbXwFWYfTYptuuGJbdXSNzLJib9RAd5Wo9WVkCS0WGObiVEyK5KjzwoZT0Gf6hjfq4qr71EqW0MTNn5ggEJiv4KJA/LYu7F6pQzZ5Dw0jLAl/yQmjP4Pl3wx7ShOs=
Received: from BYAPR18MB2661.namprd18.prod.outlook.com (2603:10b6:a03:136::26)
 by BYAPR18MB3720.namprd18.prod.outlook.com (2603:10b6:a02:c3::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Tue, 7 Apr
 2020 19:59:51 +0000
Received: from BYAPR18MB2661.namprd18.prod.outlook.com
 ([fe80::78a2:38df:6c52:a953]) by BYAPR18MB2661.namprd18.prod.outlook.com
 ([fe80::78a2:38df:6c52:a953%3]) with mapi id 15.20.2878.022; Tue, 7 Apr 2020
 19:59:51 +0000
Date:   Tue, 7 Apr 2020 21:59:31 +0200
From:   Robert Richter <rrichter@marvell.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
CC:     <thor.thayer@linux.intel.com>, <krzysztof.adamski@nokia.com>,
        <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <f.fainelli@gmail.com>,
        <nsekhar@ti.com>, <bgolaszewski@baylibre.com>,
        <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <baruch@tkos.co.il>,
        <wsa+renesas@sang-engineering.com>, <kgene@kernel.org>,
        <krzk@kernel.org>, <paul@crapouillou.net>, <vz@mleia.com>,
        <khilman@baylibre.com>, <matthias.bgg@gmail.com>,
        <gregory.clement@bootlin.com>, <afaerber@suse.de>,
        <manivannan.sadhasivam@linaro.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <heiko@sntech.de>,
        <baohua@kernel.org>, <linus.walleij@linaro.org>,
        <mripard@kernel.org>, <wens@csie.org>, <ardb@kernel.org>,
        <michal.simek@xilinx.com>, <gcherian@marvell.com>,
        <jun.nie@linaro.org>, <shawnguo@kernel.org>,
        <rayagonda.kokatanur@broadcom.com>, <lori.hikichi@broadcom.com>,
        <nishkadg.linux@gmail.com>, <kstewart@linuxfoundation.org>,
        <allison@lohutok.net>, <gregkh@linuxfoundation.org>,
        <tglx@linutronix.de>, <bigeasy@linutronix.de>, <info@metux.net>,
        <hslester96@gmail.com>, <narmstrong@baylibre.com>,
        <martin.blumenstingl@googlemail.com>, <qii.wang@mediatek.com>,
        <drinkcat@chromium.org>, <hsinyi@chromium.org>,
        <fparent@baylibre.com>, <opensource@jilayne.com>,
        <swinslow@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 08/28] i2c: xlp9xx: convert to
 devm_platform_ioremap_resource
Message-ID: <20200407195931.jzcgpkjvnufbv7ax@rric.localdomain>
References: <20200407163741.17615-1-zhengdejin5@gmail.com>
 <20200407163741.17615-9-zhengdejin5@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407163741.17615-9-zhengdejin5@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-ClientProxiedBy: HE1PR0301CA0020.eurprd03.prod.outlook.com
 (2603:10a6:3:76::30) To BYAPR18MB2661.namprd18.prod.outlook.com
 (2603:10b6:a03:136::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from rric.localdomain (31.208.96.227) by HE1PR0301CA0020.eurprd03.prod.outlook.com (2603:10a6:3:76::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.17 via Frontend Transport; Tue, 7 Apr 2020 19:59:39 +0000
X-Originating-IP: [31.208.96.227]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21408b31-d306-4721-b072-08d7db2e3b28
X-MS-TrafficTypeDiagnostic: BYAPR18MB3720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR18MB3720A271A2A1D28177238677D9C30@BYAPR18MB3720.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:279;
X-Forefront-PRVS: 036614DD9C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB2661.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(346002)(366004)(39850400004)(136003)(396003)(5660300002)(6506007)(7696005)(52116002)(66946007)(956004)(53546011)(16526019)(26005)(66556008)(9686003)(86362001)(6666004)(316002)(66476007)(4326008)(55016002)(186003)(1076003)(6916009)(7366002)(8676002)(81156014)(81166006)(7416002)(7406005)(478600001)(2906002)(8936002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kDaMPq1HrN96RXs6Sj6qPk7huRuCTJieNh3HmW1WlpC2zptHLAxHW3sXkUKXosWorxK8WfrH4v2AisNTL1BZPljWWxvt/Z8Q0eC++pOwV5YQwT1FN0w9SIGWftZaDRjstk8fyX+Ub2+Sf1tMo7Kr7Uivte5n2jBMsru13q/cesDm1j1ouTnkd3vkxCvoT5zyVYziduHSrrnvpG3SdUkTfDHBqXL8gnxm1uwro3tXCi/izp2XVUOXq2tqPHRBf5vpMYIwrsAQd5rlDS+vyHXMtOHifSgQXz/AdNVrw/TGnBm4rN8W00XuRFADaJAxT90hn1aKYZkgZLQkdgnCsYFxZPJ3Tk8FHKIjyQpypZi92hRRq01A6dHCgv6ssS2zMJGot/ouzr7fG+39LWj+/Ry4F8L6QkaTfDpNTl/2X7dtehTwVvQJ7WKsVLXUdme2w4OU
X-MS-Exchange-AntiSpam-MessageData: 90DBIPnVoX863nzbKdCMpKkXh5bS6TpfnRBecBp3pCs1uhLSHcdyvfM+4Lq67LMpaefbhDQ6VE+ratGXxVjamMqjM6fwlLjbvMwvTePXjuKSwIJRkoKCXarXszE78hEVW6h08jHrvpML6scP15kRWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 21408b31-d306-4721-b072-08d7db2e3b28
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2020 19:59:50.8522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwZuG38wGi8crNQTqPWWchnnQC2sG9sI78LHbT+v1yo5T0vJSwwpbEL5jyBjKZ+V9R7tShyMsxb1vaZ0Wr7q/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB3720
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-07_08:2020-04-07,2020-04-07 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08.04.20 00:37:21, Dejin Zheng wrote:
> use devm_platform_ioremap_resource() to simplify code, which
> contains platform_get_resource and devm_ioremap_resource.
> 
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Acked-by: Robert Richter <rrichter@marvell.com>

> ---
>  drivers/i2c/busses/i2c-xlp9xx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
> index 8a873975cf12..beb2bb6905d6 100644
> --- a/drivers/i2c/busses/i2c-xlp9xx.c
> +++ b/drivers/i2c/busses/i2c-xlp9xx.c
> @@ -504,15 +504,13 @@ static int xlp9xx_i2c_smbus_setup(struct xlp9xx_i2c_dev *priv,
>  static int xlp9xx_i2c_probe(struct platform_device *pdev)
>  {
>  	struct xlp9xx_i2c_dev *priv;
> -	struct resource *res;
>  	int err = 0;
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->base = devm_ioremap_resource(&pdev->dev, res);
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>  
> -- 
> 2.25.0
> 
