Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72CFC44C4AD
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 16:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbhKJPzN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 10:55:13 -0500
Received: from mail-eopbgr60063.outbound.protection.outlook.com ([40.107.6.63]:61239
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232483AbhKJPzL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Nov 2021 10:55:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZO+9p+W3+HYueqABh3ZR4JVbmLdHmwVnE6/ERNJlM3nl5OCSHm/fgj7BlpIr6arEHug3Jkk2uqku5BWleZso+Kf4q5iCGD1Gskv01IpBD2pectxmjMafEw+PwCRYE0NzvJs9j7XvpsPqE94csbmHRfaa4/f0u4EJLs/tc2ZyVARiT/bq9ShYkHlUkMF/FA+MSNiZfU1FEgTr072KCFy1UN2NVcw+PbjXyhTlBjldifSx/xQLT8By1uHheK2TcwTUnPChaEpdpIBONgMOPsaogHILjFDgdVGHTJ3SL46NRBD4T05prWg+wWrIixZf8KXteokmQagH3+sDiooMjeF/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmAS/dYJAlW/eR43yaZtZsorQr21y5X61frfyHAOpNI=;
 b=YsEf3jw1EaTbtVBeAz3x7HKHzrbMNrMGBAnlIyASGIFuOvokmHqxowpYjxd7pifg0RGPraaji6I5FliMeVwpiJbFm1Y1F+xB6tgYv+4zAwzfshcGJJg+Fd0jO/iGcwpbtsQznqmDqXkqEpfzrCoYaUmQpG7tGZdsjh8v057+kt7G//S2Y/q0JpXXj9Z/sWyZRsJDCSFoeHv1fjK+jIQQX+9jFusUN1LnpIl/6IEu/fdhLOxwaq9Yrh35g22ujHpRVceTGcR6jKprVpKalcNxMoDaAR1fR14E0EP5nIak2v4qXKLzXzrjw+2zo1xX3qjypyrUky3xpJ5vK9QW9HBvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmAS/dYJAlW/eR43yaZtZsorQr21y5X61frfyHAOpNI=;
 b=GNRsHsB2RZ01b7p+pMV1zWyYM8SHkqhLtV2Srh8mclS/Mul//SiUBPN9P47duG6Ggr+bWftbKEJpx8spgJP9qNVCqe7OXPJ7BUuCX7wh0S2zhjoQ4A/x8uA4Ph9P1Q5rWz5W2hi1dP29YnzMk5IRw4XTVQMI5tTKW3XYWf1kipU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR0401MB2304.eurprd04.prod.outlook.com (2603:10a6:800:29::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Wed, 10 Nov
 2021 15:52:21 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::885c:ddee:c614:9787]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::885c:ddee:c614:9787%7]) with mapi id 15.20.4690.016; Wed, 10 Nov 2021
 15:52:21 +0000
Date:   Wed, 10 Nov 2021 17:52:19 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 09/11] dt-bindings: i2c: i2c-imx-lpi2c: Fix dtbs_check
 compatible oneOf error
Message-ID: <YYvqswlk59lI0fqH@ryzen>
References: <1633526764-30151-1-git-send-email-abel.vesa@nxp.com>
 <1633526764-30151-10-git-send-email-abel.vesa@nxp.com>
 <YWiMy5J/J/dxmkY4@robh.at.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWiMy5J/J/dxmkY4@robh.at.kernel.org>
X-ClientProxiedBy: VE1PR03CA0012.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::24) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
Received: from ryzen (5.12.226.136) by VE1PR03CA0012.eurprd03.prod.outlook.com (2603:10a6:802:a0::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Wed, 10 Nov 2021 15:52:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57de3ef6-85a2-4803-6b01-08d9a46214f4
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2304:
X-Microsoft-Antispam-PRVS: <VI1PR0401MB23040DBFC736A1F3645A80D3F6939@VI1PR0401MB2304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /d6gvUo+TVaOlMqnoHKzMf1hAyYCNFUQsuScSU4AYGhWD9KXJd5GxAfMJ2flMUrCmA2UPvT6/kt91AmvE70JMwzyb9LubIkB/t0YNIyDzwZ3LkPU2K4SJz2NO+lDtyBH6qlhnXUsA+BK8rvkDRp51W35HNCaN3RWJHqPWk8EBDPRZ0cTS56lssdOcWQI5R1Jl05u9r08b8RV9akd7DXmaoqbEUJi3B4pK1al+qga7/a/l4uH69qNJNrJ6cKNIe4EgRVE2s2bQ3W68r5qfek+Zl7ukSWMePKKxkOZVTg5k/86YT+91y1XsfLr1BeKkQG8d6px7uARblf71bad1tSUoLkPo12t/CLaabpV8zOwwe5OEYp2eXSdLUX1DXT14ahmPVPihV7h3VHGdbLf41tvkVMjBINZSoFFgVgyAIDCXXRnIB1MFKAgsIgpr6qpxkzeEY+ypYG+SuIX64Wq5WofVKzk4BskmbpAEsOs3y6PoSVjFsZMvZgdu5XsL/QypwebBvvfOl1+c0ileb8GR0dfiYDaO8gmD7isTqDKP1t4VQc5KF+wKeaDo8H9mu8/VmAEUDWDsJ//Dexlvg1S2Uca4OYWs1GHh9a+6mr7cFyDQExK9skYyacWcwjDqtX9l4qe6x2cBKR8aWCtUpf1jBuAPNrPcuXcYW93CzztkaYVOMJ46IxoOjwTsnipvi4K3t4eGNwiy0N6NplWWA8PcDfTnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(508600001)(316002)(8676002)(66946007)(6916009)(33716001)(54906003)(4326008)(9576002)(8936002)(7416002)(956004)(83380400001)(2906002)(38100700002)(38350700002)(53546011)(55016002)(66556008)(9686003)(186003)(26005)(66476007)(52116002)(6496006)(44832011)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gdGP76ppxksbza41wRzG8snTWZ8CmB3wXpVfddAm7Gi76G41A8Gu0wwfOBHe?=
 =?us-ascii?Q?miQJ23I5b0gijJ74OYVNKDoRtHAMAeUADoIuCHyAfR90JWkZCNHCwsEaGG10?=
 =?us-ascii?Q?ahVhpYSzyCbjl7OHYYXPWPyJ3iMxGqk1rzrexsDfB/xfLnYGa9klYrAaqv7q?=
 =?us-ascii?Q?/ulcJ+9zTOlOt5t5KWiRbmgssFhnjqjg8LnLXMauB2CKRREyZpMlO30ROBiN?=
 =?us-ascii?Q?uNLdKK26CZrAmoiP3jLhlO1uB7jxitVVe7dVn/zsWUGqw1YheTUlQfNvWVu7?=
 =?us-ascii?Q?pbact509PG2e+ZOiV5wCAqaBqB89xVhjEgDFySfzvpXX/gYDcebUWSiXvgzD?=
 =?us-ascii?Q?rjhgghRuEnXDADoluiHbH+XJ/3yF+iaOx20J6KL8vNtEXDc4EjnzM9nEk1O1?=
 =?us-ascii?Q?X5U8wc14x+M47ngdnPWLWQZjttwA5piJKc2FQxZP5tSj+s7mcqCru4IdGNcF?=
 =?us-ascii?Q?5bzgHo5uxDuGFzlc8r1xAOPlBbNty7yVZzW3jMczyxv+RY70/LKF0x1eEYwR?=
 =?us-ascii?Q?wEkKG8kjhc1/QnmZJuQLd3Gt4Tz8io80AnVRWLqu6df+p01U5p/jxqx2bGBa?=
 =?us-ascii?Q?/mazOu6PLhYvqtJAl8dAa61yyWCuV/IFNbKUvHnlwIE924ZCjS7HTX0OvlDJ?=
 =?us-ascii?Q?dsZLgQm94U69IwIEjvsu+7JThX3OZZQhTzFFww/Gs8WtQMdlgo+YXMk3Fkl6?=
 =?us-ascii?Q?KPOQMYppcgaQVDwcos0fokmjq6MZgtWscmQS8j3Fol4+Oj+1ObhllllB8j0C?=
 =?us-ascii?Q?MDmYapNql0XJC6psht5kKFLhfvA26C0Fsl91e9DLEi0HkP2Q8ux0YLdz7shN?=
 =?us-ascii?Q?Ak/ANE6F7kCWlPU2ImqYyMKEFN8+Z3EPXOKVO3kvpIjqR87Lj15glGEci5vU?=
 =?us-ascii?Q?vbxkvIAoIisA2T7/rHfA/RKHoEiwRSihJt8m7CACNnJwYNkY3AnRQBRUskU9?=
 =?us-ascii?Q?KlGiwTg5bXyGRXXFaYEiyND9tInXl9uwp4AzGRhDQre9Pn6RLn2GFO7vHY+/?=
 =?us-ascii?Q?6UdFjsNor9ibJ4j+7Y3yzgOLagTkIfn3oG+U8a8IqLd1+GoRLGgbILphv/Xv?=
 =?us-ascii?Q?AaWdxaIKl634eih0C92D+3CclZhrhCTYdwCnlb3z/JFtoOayAexk/qosAu1+?=
 =?us-ascii?Q?TFnHaJ4iixXRtx2C834nEB/o1qzE4K13bNRb/hGsuOvxENGTyUFkGHESnP/G?=
 =?us-ascii?Q?R19ifay58FwZvxKTQve6HaTB8S9T4Ay0oPMIBt0sziZB73QF7w23cYc6TGrL?=
 =?us-ascii?Q?RQ+Nu+3WD8KGC3N9VQ0LAl8HYsJaz/p/u0JR3mlGiVQBh1DerRVycJATh9wU?=
 =?us-ascii?Q?fqFxxlv2nuh1yKVdE3o3c0Oz0hdYOt0D+tPt2alqJD2B33CBGfrj8NweHFkZ?=
 =?us-ascii?Q?BswXOJwt1Ev2n+EVNJYBddJgADP2hVKRrA7eFXVDV9l1vBduwPorD3vxZ8B3?=
 =?us-ascii?Q?E2d+PL3reL/DlGu6Z1nvsERbYhcctLX04vr0XAy2pQU+4f7aqWa8xw56ceBN?=
 =?us-ascii?Q?YOsd753GM11ff8B/pByZyPuUSlL6lRhmZuk+bQGeuvdAq7i7wbdHk/7AS09X?=
 =?us-ascii?Q?0E9YFl0RR8IzXwDD5DC3q4sipDSpn/tqHtBH6UGw+dt+/MLn8+PB0qOt+2sq?=
 =?us-ascii?Q?Y7Y56ZoRUwEcnLaZa9IFdFA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57de3ef6-85a2-4803-6b01-08d9a46214f4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 15:52:21.7866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmLacRCceOq7qO2/7XEh70l8oqqPunHPnMG9B0FPIL7TyqTFF8hFwNh2IPu4xMTTh/lgtiPUCgRInap5Rozt8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2304
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21-10-14 15:02:19, Rob Herring wrote:
> On Wed, Oct 06, 2021 at 04:26:02PM +0300, Abel Vesa wrote:
> > Fix following dtbs_check error:
> > 
> > arch/arm64/boot/dts/freescale/imx8qm-mek.dt.yaml:
> > i2c@5a800000: compatible: 'oneOf' conditional failed, one must be fixed:
> >         ['fsl,imx8qm-lpi2c', 'fsl,imx7ulp-lpi2c'] is too long
> >         Additional items are not allowed ('fsl,imx7ulp-lpi2c' was
> > unexpected)
> >         'fsl,imx8qxp-lpi2c' was expected
> >         From schema:
> > Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> > index 29b9447f3b84..acf2d5f45f4e 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> > @@ -18,8 +18,11 @@ properties:
> >        - enum:
> >            - fsl,imx7ulp-lpi2c
> >            - fsl,imx8qm-lpi2c
> > +          - fsl,imx8qxp-lpi2c
> 
> Both with and without a fallback should not be valid.
> 
> Why are you changing fsl,imx8qxp-lpi2c when the error was for 
> fsl,imx8qm-lpi2c?
> 

Sorry for the late reply.

I assume the correct way would be like:

    oneOf:                                   
      - enum:                                
          - fsl,imx7ulp-lpi2c                
      - items:                               
	  - enum:                            
	      - fsl,imx8dxl-lpi2c            
	      - fsl,imx8qxp-lpi2c            
	      - fsl,imx8qm-lpi2c             
	  - const: fsl,imx7ulp-lpi2c         
				
Right ?

Since all the possible combinations are:
	compatible = "fsl,imx8dxl-lpi2c", "fsl,imx7ulp-lpi2c";
	compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
	compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
	compatible = "fsl,imx7ulp-lpi2c";


> >        - items:
> > -          - const: fsl,imx8qxp-lpi2c
> > +          - enum:
> > +              - fsl,imx8qm-lpi2c
> > +              - fsl,imx8qxp-lpi2c
> >            - const: fsl,imx7ulp-lpi2c
> >  
> >    reg:
> > -- 
> > 2.31.1
> > 
> >
