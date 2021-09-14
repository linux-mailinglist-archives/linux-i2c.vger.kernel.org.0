Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA2F40A979
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Sep 2021 10:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbhINImi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Sep 2021 04:42:38 -0400
Received: from mail-eopbgr150084.outbound.protection.outlook.com ([40.107.15.84]:64898
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229663AbhINImh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Sep 2021 04:42:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6Ecq/SRS3JIHgbBcuTnp62ka9gGp5yCeA5jM4WfOowggi6o+dE2Y+lQZ4pnywIJiCoE8MG5iiNBbNXo9Khy+viWsBEavpk7BdiIR2zc0lwNgcB1BIJs7SopO6mUSJEu4wHMNZcWGYLRze996sIiQvN4sFavatV0toFo6LwLeHn8BhBVhX+RqSTQAZ1S5TGapTNf9CpudLzzGJD6El3yE+ZhGzEjyH1V64zLiWNsK/tlaKAB86GV/mppP1n9INMKJaBpkK3i1CJVV2A3u0GuboHPdg6AeKbPv57rqSJewueqf0Q/MYWPQmHi+D2UNpRFVG5Ml+o6PNPI/GfVX++wmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=SgPZxyR/uBmwXnSWvN2SuVxGZUp4bEcIW3N9hPb8VK4=;
 b=Q0lel2YfrZm6kCvzZi0lUdmAeUqY9pE33vKO0f1wWezOdrkr7To+FAf1VqmYaPB9xD4ywLTCTu0STYndMjeYkxkLIlrg8HZAaML4W3HpbUlCz7lM1UXqbXGIyEyxCkzYaPZyCmFmuBOlTnMqbtoqntPMu6HdvJT+TqeXlMDq/OJgbG1p3qqIhYZ2+hKP3rlblbhSzqPlBvqUuXg7hN1qrveHYr1jzohGo2UdYNZL+42iXxH2z6x2yaJUrkk0hzCQ4Ammom4BGTfxtIzOGUB47xkzT04V0SzYltxaasYC7SONHoPf3Rr5m208kkbxHB4XkrcYJUNd6uNlHiyvkIQuMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgPZxyR/uBmwXnSWvN2SuVxGZUp4bEcIW3N9hPb8VK4=;
 b=FRjwJvaWAOn95N3LkEIVUIV/LviUmY6vahPYsD6GAHZrwUlHC/APW4F2eZSNCzDGqTcJsVRDyjeQgWbMtmiSpX6ATw2SQyxmEmoPB1ZrKVcHvrP0ps9xbCSwphhr1e2LoQ1bDhd4afP5EMIsYEUTAszCfMFkEFTVW7YREjMaJvQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR04MB4000.eurprd04.prod.outlook.com (2603:10a6:803:4c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 14 Sep
 2021 08:41:17 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb%10]) with mapi id 15.20.4500.019; Tue, 14 Sep
 2021 08:41:17 +0000
Date:   Tue, 14 Sep 2021 11:41:16 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/10] dt-bindings: fsl: scu: add i.MX8DXL ocotp binding
Message-ID: <YUBgLFgfpOdVWSml@ryzen>
References: <1631522874-19862-1-git-send-email-abel.vesa@nxp.com>
 <1631522874-19862-9-git-send-email-abel.vesa@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631522874-19862-9-git-send-email-abel.vesa@nxp.com>
X-ClientProxiedBy: VI1PR0102CA0065.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::42) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen (188.25.164.198) by VI1PR0102CA0065.eurprd01.prod.exchangelabs.com (2603:10a6:803::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 08:41:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdbd5b6b-70a8-4719-9a6f-08d9775b6b3d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4000D52B01D0EF38864E8AD4F6DA9@VI1PR04MB4000.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:80;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ks3s1Xosl9FcXTcXggq1fWFtdsWRhWn0H99d7WrEjBA7VdZtIuB/o2+v4KgqBg8vF8apL2rCTJgw4VhUUfg7Uc5vfPFEgoCF5BsCqMrPiR2GZr/b+aDBWgRIuj2HxKiP/zqVcJjubN3+pxmuRYzl517j3xJ541putMQfAFPTeQJ6CmfyEFbmy8IiXQhydmaV9OJO0hHH0Mb0/QCyMGZHWHLkKazSqkZvH47tYY1Dzy6T0sEkWJeC8La3/sFFpgpNrEmIaOIEoygKhr4AQZ1wsDW8LJFGyeWMypo1agT47A01MxoH6BK0U1nj4PXd1uopdLqM61Ibnx5dH5ncrQmscnUlq2EDlTlbwH/rhVA3bSSaLcimIyyTZw6r3NwXOT8xmX6C3XNznKX1aoWURp1NjU53hTb4neuaTS0TaNwAnJ/ls2jmEFc8m/I/AYi3/jIT1IZEuacemoUgql5HiqSkP85t4S5yG5f7jJKymUy1y2F3hdt80sGguiHqegugLwYOaH6GB+BHWxPVzK+Pp87lxF+/3leJW6a/CTMsxDk8Ta5GhxqFp2cvpeIQAoltYu/YZek+f6Z2GfDUbAcDLrEGZ21ODVM35WwRvepihsSrHdCfcrm2Uf4QSEi7F5rVjiRVD+0r/JNFchd0bESOznuEylqPHgqZuqJRQ2rvfEOhAAsD2Jpfl04qEICKoWd5uI2iAErlmj81N4k9S3Oyz2ZXjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(66946007)(86362001)(52116002)(7416002)(478600001)(8676002)(8936002)(44832011)(33716001)(38350700002)(38100700002)(9686003)(5660300002)(186003)(54906003)(110136005)(83380400001)(66476007)(4326008)(6496006)(55016002)(66556008)(4744005)(26005)(316002)(956004)(9576002)(53546011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wSJngGSgzapAAp4UzltDmGjpQ1xKsP9RTMVSHUMzRZU6mV0gAL2eCvn+7zba?=
 =?us-ascii?Q?bjGZ4k3dTulfE00/P7h0NAIDuZApo0ZK4tWKRuXF2ZZzb1sa9cJrIy5uHLWl?=
 =?us-ascii?Q?isr1gZRnEpe+QSN5vpm0IxTirq102ftsXIHRiCAt9dTviD/CiHISOsNfWyZs?=
 =?us-ascii?Q?RT5ofxd4R0GfWl/eeApuUhVaG3hxvF1trHIptGs9mOqTitverKD5Q6wkOST/?=
 =?us-ascii?Q?4dM07T6OZuk2zbMG5CKmsPasiNsjkuYyZ7W7lbs5TB5LeHd0JTtLohuwqIri?=
 =?us-ascii?Q?dcYVMapKEUPyAtY6xwo+NwzNzMw/i/JXzEp5Mls7gMOBeAaeumthKlsbCe72?=
 =?us-ascii?Q?D0A0CG0xmyZ3tdkEs4/V0FgyFhhArXAwZmG2h3IQyQ7dl8oWbrG/SK1QxOyI?=
 =?us-ascii?Q?sgIQ/O3mAbF30pulUZFd4tmN5Ky8he99PrWoLeEofSswf8MPH4KKEBUiUNSi?=
 =?us-ascii?Q?MZ8j1Pkrzqn6Z6NYSTLzlpcFUbDrz9IpFMYD7mqfbw0hmw4vVhrf2MmFHqzM?=
 =?us-ascii?Q?VgiSN1OaAV/jp5zdY0Tk0c+tX/3kdNelT9ZW6Z4Lpk1RW5s9b03oWX6mamzZ?=
 =?us-ascii?Q?bunxSwR++7o47Remy3W+8J8sE+PRfPHaLxWA9XpVmJPlEuqArYe9fd5QoHp8?=
 =?us-ascii?Q?GtZzhnHEc+Vo6Go7ThA84oY7/fuNDlR9Jxp4CHz7Ot2/WFG9eBuZVCq320Wx?=
 =?us-ascii?Q?3mabj2gI8dJ+CnZccSr6HF0T/JgHdRC5ha9eS4UV+9/Xnj3Rjw2+yzz+ti5F?=
 =?us-ascii?Q?g9+qMbSP5C30f42GGmp3xCTocov/LyrgsjuEwPXiyh0nrUzG3e1Wx55CvCsV?=
 =?us-ascii?Q?Ac/OlMpnkj2At4ZYqIzpjH8dASfqfHT5dbHm2CsRSFe1s6PgZJPH4Ih/YMO6?=
 =?us-ascii?Q?CNkKpN51Ca4tCdGUbL+H8MW639OKGCdqsak6m2qtVLkPDZXNYP5si/+RdT9U?=
 =?us-ascii?Q?iYTV95Ru4NzL/f1HDumX5QFh8o1Q834PCqRgAgKHp7z8kDc6degByFzvYoJ3?=
 =?us-ascii?Q?O5xyceVuIkw2KrJ3Mw2vdHqWml2ZiXOCARdS9Gdi71FuFnF9bm8ofHfUw0eh?=
 =?us-ascii?Q?XxxO2DUM9zdFuU6qVTZokCVLuqmAEyZngazAgQHUg9x47PzUpWYvq++N9xrU?=
 =?us-ascii?Q?vCj1143FqaVOCiTGWTD9VU77CNYfjuZAluiKz1ny0P104cSWPyzJhSCYmw/W?=
 =?us-ascii?Q?8SguNZuRFlasJuYYdwqrYgzfcTUg1+pSmtc+fAHnP6lPt+6e0BGlqu0n8AOo?=
 =?us-ascii?Q?FiCSCqJ3tdmts6+Ry2ClOXNpCopeddUq65Ivc2tskJDKgMtKtZpqYqDQfsT+?=
 =?us-ascii?Q?vdxc/6N8xyEYCVc7toG2vFB/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdbd5b6b-70a8-4719-9a6f-08d9775b6b3d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 08:41:17.6123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhGiAVdKr33xLfYXGgj4qP78L1r9lgwAFw66t70XnwfisjtvbmxBIFFydcjXutJjwIDj6IQ5++0Cj38hqWAEFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4000
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21-09-13 11:47:52, Abel Vesa wrote:
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

Please ignore. Will resend with proper commit message.

> ---
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index fd0061712443..f1470d562156 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -141,7 +141,8 @@ OCOTP bindings based on SCU Message Protocol
>  Required properties:
>  - compatible:		Should be one of:
>  			"fsl,imx8qm-scu-ocotp",
> -			"fsl,imx8qxp-scu-ocotp".
> +			"fsl,imx8qxp-scu-ocotp",
> +			"fsl,imx8dxl-scu-ocotp".
>  - #address-cells:	Must be 1. Contains byte index
>  - #size-cells:		Must be 1. Contains byte length
>  
> -- 
> 2.31.1
> 
