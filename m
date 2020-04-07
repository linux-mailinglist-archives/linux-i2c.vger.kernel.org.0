Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12381A165C
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 22:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgDGUAz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 16:00:55 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:2574 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726436AbgDGUAy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 16:00:54 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 037JuMdL029320;
        Tue, 7 Apr 2020 13:00:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pfpt0818; bh=pPbIbRq+FibJCH25w6h7QmAvaE21lwNrRwEtpG1Y3ww=;
 b=TaFqo5dBWevjK6QJc2bzh2kzn/87nWTRebpGkKtIldxxEVCkCeaHhsFLHm5VLxrFlqwp
 bFHyUCL2Sblv9p/AVts7Yqm9AiVmxF49c8TwYgFWgO5JZaEtHc6yuL81HpvlaRaiRALp
 5mK+kPPKTV5RenDquTenD7vCsUp8NV5tXFIq6dXRZ+QRPoLKpLOGkBDqn5iwB9mERPpV
 2T4EY7b7BnXzz/YoyYpjYYjUlJYyTnE3vcIai0WCawdfqeDmNcBm2WgaIIA3/q136df8
 2viWm4pAi7QZF/2jsEkQi7/ylEnnmYoGWU6boOWx0I7I/eH22dpXYM2Mf7WbT13j/hTR YQ== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
        by mx0b-0016f401.pphosted.com with ESMTP id 306srmbyny-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 07 Apr 2020 13:00:49 -0700
Received: from SC-EXCH04.marvell.com (10.93.176.84) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 7 Apr
 2020 13:00:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by SC-EXCH04.marvell.com (10.93.176.84) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Tue, 7 Apr 2020 13:00:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogE5JJmeDfZJyGwlcJZH4H3+AVrLWyXilWnD/NbXU4LWxBTG3Phy3vwZXa+wLMyG9DW+yacVZZKhyo/D0v5uk9skWIBpD09ceLKNtQv+Z6q77wpVc5iTg9JD3hX0tPJCnWfhyNJYbCvVTARe8ARzaOReKkLou8Og4tCs/FzL2k+XcgIw1TkTnLxayQceVqaMVVqabxUX/m7/DcK+W0qe48iWg4PHNwmOwS2s9RkrAV8jecJdPyUq0w1EXFGvRE6EjXLBcoq1v4ucit1VUN/mPYribPbUpKKnY1liijLONSAxf93Cbuz3YnTiPg+3bgJefVZ1Ytj746B5B70IDhHhrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPbIbRq+FibJCH25w6h7QmAvaE21lwNrRwEtpG1Y3ww=;
 b=jqfUFOoJ8+EaTmSHhftlrp+5o4EfqV9A/zJb+7NJOhjZXDAavRkXPTg9xGiXmfUkeGoCqenfPsjLcBSu5AcYKKw/TLktNcb4FO8gXHALv8154gyPO6ejf0Zgdkc9HyLq51n1HynHSuCIf0KEu4fT6Yne4E0Abfjpajll1ppynGgcd0nYjC+aWJoyc/j3BdGlWlHascQzHiZkAlRnVXDiDr5DtziCQd0/KBAl51qKclJCk+Ik+ClDfKkxAVx224brCalylGPHZ/x7mOB1qMCmSknQxY98FK5BZRqcPOin29hve1Ibz/NA9jIxDJN3JStDRiTmPVAaOpMPuH6NAcnkvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPbIbRq+FibJCH25w6h7QmAvaE21lwNrRwEtpG1Y3ww=;
 b=rS6W/fAfci6Tmht3uVfLuRQjHwDMUoc16d93huw89o/SZeujgC5df4AP7jO1L2EXhnNuWKLXDgkNrLEC436kYEO2inXgCR7dwf3smGQdK4IPtJrufr3vjfapUT9WkZm44l2H3mnQGL8qNjHynQAQF1lPIt7CgOB0/olHRzjT3X4=
Received: from BYAPR18MB2661.namprd18.prod.outlook.com (2603:10b6:a03:136::26)
 by BYAPR18MB2997.namprd18.prod.outlook.com (2603:10b6:a03:133::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Tue, 7 Apr
 2020 20:00:47 +0000
Received: from BYAPR18MB2661.namprd18.prod.outlook.com
 ([fe80::78a2:38df:6c52:a953]) by BYAPR18MB2661.namprd18.prod.outlook.com
 ([fe80::78a2:38df:6c52:a953%3]) with mapi id 15.20.2878.022; Tue, 7 Apr 2020
 20:00:47 +0000
Date:   Tue, 7 Apr 2020 22:00:28 +0200
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
Subject: Re: [PATCH v1 28/28] i2c: octeon-platdrv: convert to
 devm_platform_ioremap_resource
Message-ID: <20200407200027.dm3d2bjoi4tkgwn3@rric.localdomain>
References: <20200407163741.17615-1-zhengdejin5@gmail.com>
 <20200407163741.17615-29-zhengdejin5@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407163741.17615-29-zhengdejin5@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-ClientProxiedBy: HE1PR0501CA0015.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::25) To BYAPR18MB2661.namprd18.prod.outlook.com
 (2603:10b6:a03:136::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from rric.localdomain (31.208.96.227) by HE1PR0501CA0015.eurprd05.prod.outlook.com (2603:10a6:3:1a::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend Transport; Tue, 7 Apr 2020 20:00:35 +0000
X-Originating-IP: [31.208.96.227]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26ecc044-6954-4af9-2133-08d7db2e5c90
X-MS-TrafficTypeDiagnostic: BYAPR18MB2997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR18MB29973E2073A5A80067893590D9C30@BYAPR18MB2997.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:299;
X-Forefront-PRVS: 036614DD9C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB2661.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(366004)(346002)(376002)(39850400004)(396003)(956004)(8676002)(7416002)(6916009)(7366002)(53546011)(316002)(81166006)(81156014)(8936002)(478600001)(52116002)(7406005)(4326008)(7696005)(6506007)(2906002)(9686003)(55016002)(86362001)(66556008)(66476007)(66946007)(16526019)(186003)(26005)(6666004)(5660300002)(1076003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L2LnJpJDPg+gIC7/3/4lcXgra/PvKepvYNtPlu/HNO8fcRvkBV8NSjWAajeV0EL/Hi4g9Lnkjc8ory8YD4ufACRU6J9qD/x2Ippr4r0vzm+WpeO1bs0FuDPU+9gOob+ginjL+B2xrmPe0x8dMvhJt+o+Bgne25pcLDpqlXlyd7OJmGINjb46gBsFdeZJnVyBcBj38+s/KCts/Jcerphrw/Wd5G+xQmuBZ0E39qlMPcmrYedjqz0R4ZA7f7tMpC0ce5WbBbl/sl9yAFJIHv8t9EmOWyDb6Ke733NtjRu/7HDjZmXOAdKYynv16XnUfeYTdppHejZYZVyQEDqs1yUn7ELB3wcmx1gpjJGkT5GGg8sANi5czW2Ed3O21b0YMflAaZIA3nCh/1x2onUP4J4+nKrZgQqbjE8vscKiD7n14u/4lW/yjPo9XuVN3Unc+JBR
X-MS-Exchange-AntiSpam-MessageData: YNuzF3VR/yFmfGFB8m8EBNBH9dyZxOHVk/rMoEg97C9QAdzCB/hMNCOx5XxKfwIUwSLqRIRW0toXCqoTSYBm8kIa4/8BmL7/Tm5FDiRVYZ0wREKj21+Yyrgw+9Ddc5V4uAHoyRSboEgSeAS/OkvUCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ecc044-6954-4af9-2133-08d7db2e5c90
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2020 20:00:46.8420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjaVjcpcbPLFvgRdetPAh48ZT5vuwjqvKdNcqsfSYhKT0XPxrvIDTdusDxAVj7ySWAN9TJblYPQ+VF4SPL/Raw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2997
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-07_08:2020-04-07,2020-04-07 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08.04.20 00:37:41, Dejin Zheng wrote:
> use devm_platform_ioremap_resource() to simplify code, which
> contains platform_get_resource and devm_ioremap_resource.
> 
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Acked-by: Robert Richter <rrichter@marvell.com>

> ---
>  drivers/i2c/busses/i2c-octeon-platdrv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-octeon-platdrv.c b/drivers/i2c/busses/i2c-octeon-platdrv.c
> index 64bda83e65ac..0c227963c8d6 100644
> --- a/drivers/i2c/busses/i2c-octeon-platdrv.c
> +++ b/drivers/i2c/busses/i2c-octeon-platdrv.c
> @@ -136,7 +136,6 @@ static int octeon_i2c_probe(struct platform_device *pdev)
>  {
>  	struct device_node *node = pdev->dev.of_node;
>  	int irq, result = 0, hlc_irq = 0;
> -	struct resource *res_mem;
>  	struct octeon_i2c *i2c;
>  	bool cn78xx_style;
>  
> @@ -167,8 +166,7 @@ static int octeon_i2c_probe(struct platform_device *pdev)
>  	i2c->roff.twsi_int = 0x10;
>  	i2c->roff.sw_twsi_ext = 0x18;
>  
> -	res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	i2c->twsi_base = devm_ioremap_resource(&pdev->dev, res_mem);
> +	i2c->twsi_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(i2c->twsi_base)) {
>  		result = PTR_ERR(i2c->twsi_base);
>  		goto out;
> -- 
> 2.25.0
> 
