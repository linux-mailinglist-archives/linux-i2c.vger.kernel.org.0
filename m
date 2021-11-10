Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC01944C667
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 18:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbhKJRvI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 12:51:08 -0500
Received: from mail-eopbgr60078.outbound.protection.outlook.com ([40.107.6.78]:48302
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232548AbhKJRur (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Nov 2021 12:50:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqzXg2S1boXv5IfgZMrP7Zbfb7OuAXF8PYZHIkzvOl8KNxk9OajZu/GPAXtpbQQ5MKy00lAm5SJFJZ+djTWW6+j+zPCMawK2El/IJ+FsOxd+44PE8pNba7HBxZOaNVfxaDmi1f9YIVa1NyT8pmSyaR81+ejZSyxnh/7wWR1/QGrek6zT8sgNjDdLnHRSiGbs8pA3hvQ9SEydFAm6ehNsQyuXYUAtP66TmyeNO6l1TsJ/9EzWr9DfilJUM4hbb81e/lHmDCrsEv4C9SmzUtSkf43KHHpFD6qv09ZyBZ98cci3b2NFZhYrce4quuhg+GRBuXoJoZ07tSWrABZSko5MRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiYWJtChtPloMHnVm+/91oiLVPd5r7NjTkGfr8O4Hgw=;
 b=Tk2wVQs1BEMUm5VvETfVzCgWcqa6MuXtwfK+1e4ENtAKKNIqqxvhkiwqzkkoty7DU09VNLsby+5StGcdxZxSHhwDkdl2utdka5JjSFih9zjRxn5SGHR/YCRn1IehZjfqtnPNxVsvjce+Adfd0piOcPJ1SsadrvnkfrbJWXCiBgXsQ4fzumMn3lr+oRSdGX3wVYf22fZEN3aSo4q41VQBnnzjPaQ9ShUUTbkU/bgThTg6Z0oRNOt2GA/Ti6qtudWyHAYQVVw/a6coWl8muF9wujGvyK0QmWLkCDCue0x4twoRcstA/3lZzM0+41e8Cg9/CCuWTKmWkANLdzUaDdgxUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiYWJtChtPloMHnVm+/91oiLVPd5r7NjTkGfr8O4Hgw=;
 b=hGBPlWUjfCeL4GC7lOLYB+ZHMvFErqqY1PjHEuGdcCdgdjaXezErqc7EsNFaspqziTHlws0wYzgA0pwvGqENmvj+n/LYnH0GbnXFOWQYAP/L2AEBp03Kr+o/CalAHOrq2738cS8CLKgapkFDr9fuZwos7KbcxqA/c+6BhXRD2pE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VE1PR04MB6702.eurprd04.prod.outlook.com (2603:10a6:803:123::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 10 Nov
 2021 17:47:57 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::885c:ddee:c614:9787]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::885c:ddee:c614:9787%7]) with mapi id 15.20.4690.016; Wed, 10 Nov 2021
 17:47:57 +0000
Date:   Wed, 10 Nov 2021 19:47:55 +0200
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
Message-ID: <YYwFy+aVrYEDls4x@ryzen>
References: <1633526764-30151-1-git-send-email-abel.vesa@nxp.com>
 <1633526764-30151-10-git-send-email-abel.vesa@nxp.com>
 <YWiMy5J/J/dxmkY4@robh.at.kernel.org>
 <YYvqswlk59lI0fqH@ryzen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYvqswlk59lI0fqH@ryzen>
X-ClientProxiedBy: VI1PR04CA0084.eurprd04.prod.outlook.com
 (2603:10a6:803:64::19) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
Received: from ryzen (5.12.226.136) by VI1PR04CA0084.eurprd04.prod.outlook.com (2603:10a6:803:64::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Wed, 10 Nov 2021 17:47:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d5c5107-ae72-4008-ef60-08d9a4723afd
X-MS-TrafficTypeDiagnostic: VE1PR04MB6702:
X-Microsoft-Antispam-PRVS: <VE1PR04MB6702360152AD112310F3029CF6939@VE1PR04MB6702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iEaU5qVp/Tf/r9U3R/z0Lldx8RIgaQUuEELHN5EOk/DXxZSwM1APUTevbP5eozCrzecYIYuKqi0SgQxGYtliENLjd4uh1R0nH3APJf0rgZLSiGV2U/qsONTtJdKBdXT/g6xbLhC1FYPgytVKCfqXBgQo0CHcY0XRtF1zph8h8FdcmsoQQzVz0i67UwokL2tfkYAD+Au0YrQ0508qZWcyye+JXlK58RYxMX7WoKgu1fKK8ul/5oop7sciWSFsQ3mHyD0tPADHn6/Cqz1Hhkke8X0bwusRzyBS1dit6R9C9qE8/ZQEX9hCSQjJYP8HP13RlQNIqTQB8jg8nFwyED8/Uai7avJpb5dKOunHXp+8YpPJ3dnE7oVwYL5jAOuuaj2QJGjSMAK+TxaRrH7N+ihAd2vHK9WWelq/uyo0UWW/hRe5NVY1SIm1AanGOtgsiMQCi5Bp7hfVgvENspyDGjJKhg7hiDaeVJrzJ/UKx6lVJPrs2GMusQwEWlXtJ2JUnCc3PN86vwRPKzlvkL31MljV799KASAl71FA9ELSU2m5NZA0+Zx2cPlsXsTa5mitGFKk1JyKRXupwcYb2MswVWg7KZYJ93UF8wvBeJ4Edan4V5tSuRNXHFTnu7u56zJMFKvaXlYwLSUOqCTAB1nTlb0oVj/kb5GaJiagVnuBkWTpnU11Kb67Hgz/stLGdL2pLUoh9REHmBVAzIG6BNZL8yhKNjBh9nYmIhMZKEeE2VOzC2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(66946007)(8936002)(6496006)(316002)(26005)(508600001)(66476007)(2906002)(66556008)(83380400001)(86362001)(6916009)(53546011)(33716001)(9686003)(44832011)(38350700002)(54906003)(38100700002)(9576002)(8676002)(5660300002)(52116002)(4326008)(186003)(7416002)(55016002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zBZU+j1ImOBG3ZLATf+AjTmvTMhsBc46eLqbCgOhPsxOslJAz/wNa1PZ9Xw6?=
 =?us-ascii?Q?ArBXKF3kk2KbSSDraQg4J4wgDh9v99QW1/xmVIf+XXW5u76j4dKgdBYHlwJy?=
 =?us-ascii?Q?yd2zuuNemXzpH1aTRNPoXvJje4zGB7WrMtjEdVW4e0DlFJKRS3NZRzCNqa/2?=
 =?us-ascii?Q?c/2DZ3rHtBTJ8SE36qsPzuouE7f095nhU/pb7orDXpJEfidz6NQ0LAzfkQfY?=
 =?us-ascii?Q?OGOCN03tT/PNddlrrXZuP2EfX1M5vNFan61qP+xkrOeMg5hOW4C+kD/G1gjP?=
 =?us-ascii?Q?u1yRcLTRHgpCuqT3YNyc/ms8yo2aQQSu4ZqSBRFhczqrTjkr5v10Xv95shnL?=
 =?us-ascii?Q?iZKwANxCYvL2PJJKr3vdMyenHRpdic1D6C0P3mDxv90qgFDM7IsctN14eSuA?=
 =?us-ascii?Q?yOEjwtJ5J+JyoOiJcu1Rg4tZ+QjbIKax/cP9Nm5i7qJLD2QUZMFvCodXkV+I?=
 =?us-ascii?Q?eHHgotShv3PujycOLeutSafDafgUU8ru5HWDhxxQZShkTiAzlP18omVb6739?=
 =?us-ascii?Q?tJjkBJI0tGRmpvEBeDvOKOAnndLOahg0fgCLZUF4eHMDPiGyBAQjI9+YYfDC?=
 =?us-ascii?Q?zNwnsaJ9sBb9mzKBaBPeBVZ75ngNy/CrnL3ByNf6qq9CwX+pU5Febr09MpH8?=
 =?us-ascii?Q?zMzXtKoPkdUoaP5VkzwTCFwuJZQj038T2poLtcRc7IMxZ+vHIAOKFuSmwB/g?=
 =?us-ascii?Q?VC6pQDkTrhX6h0J8wMqX1RzX3FsZyOLCcdhiqSXuFn0sOlmYcmo/RVobIkwZ?=
 =?us-ascii?Q?6IbN1nRYFnnLjdM+Qhzvq8gzLAdYVuUDWwMXeUS1kqn50bj5Vmiqlnt2V86g?=
 =?us-ascii?Q?zx0oSC1i5QCpnbv/nMvnMPD9shhnbv4MnS2DfI0L0HPNpRDqLKUSOPZkTaUg?=
 =?us-ascii?Q?eigbVGTToJ7sxLQyujaKkrCQcooSGgrA72qZgu20/Ec2xZp4vz0BQeiHnls4?=
 =?us-ascii?Q?l4qwcNHrdVwYye8rOb0IbLxNqf7RUreVs4cxJxor2l1eyHRTrxoNTI5hNGKu?=
 =?us-ascii?Q?12XWQcx21JOFaM06WXyywz/kZ+pcRhOCpvfzuofZf3zaJKuunYqV55KGLKOk?=
 =?us-ascii?Q?NsZxKSMi6TZgduxm/Z5EDXg9I2wz0yCQ16cscQB6IluZ92vGyRVn5No/T5IQ?=
 =?us-ascii?Q?FH4y/lH31E0p9V2g6UFeEnHWYo17mKUV8MEW/K8kPizJJ1UjrsXjUvUfgIW5?=
 =?us-ascii?Q?fKbC06SO+zAVrCQdTVeRb81PmQ7TRuFYWf4Xmzrk2VfQfR0C5GY+W7ubtxpa?=
 =?us-ascii?Q?bO2dJ27KYTQNYIATA+QKdhSKuaWEEERYpwTydR+zKSqumBHLB1f6NfAysXav?=
 =?us-ascii?Q?7bnHpKkW0jbmAhQ8lRa4fDa9PRLhecyG9zrYAt+KqEMS6MeT+WpjEPS8kh42?=
 =?us-ascii?Q?aT72cWtGzmYLlpX+0J2qoDPB0wpaWrkhSxoyvCFzN6I637s1vrmeJhl+2k+d?=
 =?us-ascii?Q?jgERa4uEYFC1TLOIXvIDfv9Z90VIf+5RLDMp/FenA5vy/eUXTSbwW+v0ledY?=
 =?us-ascii?Q?nNL22W+LCGwWrWTVPyueYbV4WEyWJVJJFxDzAH0jfBs0/quI1SstpmuZ1Zr/?=
 =?us-ascii?Q?+t+E9d33B2axjJj+/90q+pJzcknqxrAG5TFiOT+IInG68KeIJrh0NMMKqiYt?=
 =?us-ascii?Q?nRia5d87cRCveDAZjqZE6vA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5c5107-ae72-4008-ef60-08d9a4723afd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 17:47:57.3802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UH8kpfkb0n13ulDSuGQENXCQMoe7wjNXtxUGkqkJO0Nwuv1BPN9F1c0r34IZRNzbiJ6Tx2od/eg0S/KKvu66Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6702
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21-11-10 17:52:19, Abel Vesa wrote:
> On 21-10-14 15:02:19, Rob Herring wrote:
> > On Wed, Oct 06, 2021 at 04:26:02PM +0300, Abel Vesa wrote:
> > > Fix following dtbs_check error:
> > > 
> > > arch/arm64/boot/dts/freescale/imx8qm-mek.dt.yaml:
> > > i2c@5a800000: compatible: 'oneOf' conditional failed, one must be fixed:
> > >         ['fsl,imx8qm-lpi2c', 'fsl,imx7ulp-lpi2c'] is too long
> > >         Additional items are not allowed ('fsl,imx7ulp-lpi2c' was
> > > unexpected)
> > >         'fsl,imx8qxp-lpi2c' was expected
> > >         From schema:
> > > Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> > > index 29b9447f3b84..acf2d5f45f4e 100644
> > > --- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> > > +++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> > > @@ -18,8 +18,11 @@ properties:
> > >        - enum:
> > >            - fsl,imx7ulp-lpi2c
> > >            - fsl,imx8qm-lpi2c
> > > +          - fsl,imx8qxp-lpi2c
> > 
> > Both with and without a fallback should not be valid.
> > 
> > Why are you changing fsl,imx8qxp-lpi2c when the error was for 
> > fsl,imx8qm-lpi2c?
> > 
> 
> Sorry for the late reply.
> 
> I assume the correct way would be like:
> 
>     oneOf:                                   
>       - enum:                                
>           - fsl,imx7ulp-lpi2c                
>       - items:                               
> 	  - enum:                            
> 	      - fsl,imx8dxl-lpi2c            
> 	      - fsl,imx8qxp-lpi2c            
> 	      - fsl,imx8qm-lpi2c             
> 	  - const: fsl,imx7ulp-lpi2c         
> 				
> Right ?
> 
> Since all the possible combinations are:
> 	compatible = "fsl,imx8dxl-lpi2c", "fsl,imx7ulp-lpi2c";
> 	compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
> 	compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
> 	compatible = "fsl,imx7ulp-lpi2c";
> 

Sent v4. Please have a look there.

> 
> > >        - items:
> > > -          - const: fsl,imx8qxp-lpi2c
> > > +          - enum:
> > > +              - fsl,imx8qm-lpi2c
> > > +              - fsl,imx8qxp-lpi2c
> > >            - const: fsl,imx7ulp-lpi2c
> > >  
> > >    reg:
> > > -- 
> > > 2.31.1
> > > 
> > >
