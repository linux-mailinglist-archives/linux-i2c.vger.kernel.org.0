Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0649B4B1798
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 22:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344605AbiBJVdn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 16:33:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbiBJVdm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 16:33:42 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140088.outbound.protection.outlook.com [40.107.14.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D089D102F;
        Thu, 10 Feb 2022 13:33:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvWTPg3lW43pmAwFWjGeYmJPbVUox0rgI0CuZClcmi1mPxdYEtrzQiGAxegJc+UYBtcD9tmEYUWrp4Y5QNHainZ+AvTROMam5/r568wE3TthxR7rCeiH9QbSxYRvE8BJcp83oVjq7DGZzpifeNmIzYFT3NmjgUFbX6V9xJJh1NunJMiztsBBZo9KwqHirOPK+3p6GUiSoWGVF/KCdgziBxgOJuL1XXypr6U8+pJvjsdnjzpjZ3x03NHJktjcVIQyXcseWHyTf9l6l4jvvaAfx4v7Ez0vdNCURivN+BFkbJbIWUdd/eF2wQNmpbDMm6Znu29Y6T/+b1hzCZBJS/h9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MtpD7IW46cwPezzmDojTR4IOQpiupBXQ2jWgYD3aW4=;
 b=MY2ba208f6M7RxFJv307DnKDpJez3q6Ad3qKryl7Da30+Q7AZQCxJv84X9igTBypxqzl/TPYidNaswt6qM6sUesrul5OG8nynctRjKbiPDsStb+hJAV01ofPZ7sJJs/w95z1RL1rUEk9tZXx/TP+4WifYGjenrUglNqT0n1Snwg9CAVOy2s88G6UZh1aZVf9EXvUJ5TPZi1HKDb288b/qgECaJmYVJIyC8+sAMAaSYqCq9+B2gdZTgrT8cBEfTCMrUQ/i0D3PLhGgGvw44JCwqHqBMj3dSHc02UOZLaf8iCMZuFYuhAH8VujnOBVJDt/UAqD2+r4pQRMYB7GoduzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MtpD7IW46cwPezzmDojTR4IOQpiupBXQ2jWgYD3aW4=;
 b=cgGuPp9c8Ds7DG014zNjmYJhh1Njn8oBWcOZnDaSp0SjX3B/hd5Y6z7T2zqE0TaWSKEJr/v/GioJX6aAhEbeNszjpMTATykCVNac31xr6NwM3O6eQK124IUsZ68yJl/q+Dqt/zDyfR4qUnAEEVb6w2H1eAlZsWbCO+oJPyrd9Wo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4679.eurprd04.prod.outlook.com (2603:10a6:20b:15::32)
 by DBBPR04MB6075.eurprd04.prod.outlook.com (2603:10a6:10:c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 21:33:38 +0000
Received: from AM6PR04MB4679.eurprd04.prod.outlook.com
 ([fe80::28f3:36a7:fc3c:b9aa]) by AM6PR04MB4679.eurprd04.prod.outlook.com
 ([fe80::28f3:36a7:fc3c:b9aa%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 21:33:38 +0000
Date:   Thu, 10 Feb 2022 23:33:36 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Jacky Bai <ping.bai@nxp.com>
Subject: Re: [RESEND v4 05/10] arm64: dts: freescale: Add the imx8dxl
 connectivity subsys dtsi
Message-ID: <YgWEsHZHqDK1sCYz@abelvesa>
References: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
 <1639680494-23183-6-git-send-email-abel.vesa@nxp.com>
 <20220126124732.GR4686@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126124732.GR4686@dragon>
X-ClientProxiedBy: VI1PR0102CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::40) To AM6PR04MB4679.eurprd04.prod.outlook.com
 (2603:10a6:20b:15::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88862aed-b2e0-4d40-d0a5-08d9ecdd0053
X-MS-TrafficTypeDiagnostic: DBBPR04MB6075:EE_
X-Microsoft-Antispam-PRVS: <DBBPR04MB607588A6A727609E82AE464DF62F9@DBBPR04MB6075.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hniuf8ELvYKDRlSSUinYWKeQR7+bDKUDzymAIix0CzHczz0cswbgy6XupsI9QCW6qLFefy0ZHXDlyE0sZNlWkUmT80gJCXv7doN8mV7JkM2MB82zU33LRKY9J+iBESG5EaV4/KJmB9HdPqYHJM3YC7lpvrIS5YnuLE2qgnprDuVuzjTQ6AGgqqmqiiPDKY1wjll9i5i5JtskY5WqjOuNzX+VM6Wd8kLIpi9J2C4vWafx+oVNxDgEy9jCgtcfU9+MSZOiYWEaFu/cTrJeUmN269W2lnu1C2nigqn4epwPtXSNj8MzkoHUDszVkc1CHvzjDF3BhI/sIwJc487KItHsyMD/cmq3DHZLk3Ecg/s+SgRIh87yrcYf8vfOAuxDUV1/QGtREOgQBxZYV4qn6eT3erGQQcg4+p+tz7jwVGRv8nzGxUN/3nQ+oLZzEzzVlHHJmLPW3LEHk4cfMVXhRLKdipkVLn7ocoJhcv2bHFVrOkSYVusTT/kP9BBqhSb47JHC58mRfTMjfaufEydZBgzjtvmjaWFcZfdfuZqdkz1dnJxINJq0wiOxSfsKGpwhhkv4ShS6zfaQWbCog4rljtV1UgsqrcTE0xuJgEeqBceafiyibNg5yMQGMrbY/yFzkyW4AlcXNpE4BBPeB08ZEWuG7GOJU4i3WW7Nh/Xadce11O4QEAFvxtqNA5beCqnyYScBJZllbvZXbzwgBs1heSIUcX9ZFDEwEkcdEQst36i3tYk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4679.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(52116002)(6486002)(83380400001)(508600001)(53546011)(33716001)(6506007)(8676002)(86362001)(38100700002)(7416002)(5660300002)(44832011)(8936002)(26005)(316002)(186003)(38350700002)(54906003)(6916009)(9686003)(6512007)(4326008)(2906002)(66556008)(66476007)(66946007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K7noT6TCaNbmqgJKrnCrbeyRnoxfid4QOR438MXVgRKXJgFjvk1MzU9WkPcV?=
 =?us-ascii?Q?5I4O0jS5INFxzLUJVl7ASyzJMJQRYaX9O8TS/uiIhnKpu09AQWHXjcGj0to7?=
 =?us-ascii?Q?QOW7o+m+tDcBMAZpLz3kPJlvaZkCF4E0UuRo/0uPmPWBHT89GLmBCkvu7SfV?=
 =?us-ascii?Q?B0Op34G6+nNpwnGH+fqf4SYh5fbWHwxORuSnePQ7KomoQiJtaTO5el6whvm2?=
 =?us-ascii?Q?VqH1WsV4ATVDAz0/PXYmrCRwpogL7OhXYrDaOqmLl73Zke6QqwzD1n1hN9tw?=
 =?us-ascii?Q?QI3Iz5ge8kkowdt91rpzBXaOOSroCk8TW5FRT2dEtxPKU7sywrGMFJ3TF+5E?=
 =?us-ascii?Q?zZZqnFA0rZhkf68AfbrY2FKIfuv0Ew+zM8sotx0k0RP6TMCYR3EOQEshwCQd?=
 =?us-ascii?Q?GcPhosJvTjSxLXHs9g7FnmfvKGoaZrGG7kE7A/FHcIAlxGIO0AXiLkl9Ivox?=
 =?us-ascii?Q?1HptVCethBZrEWEDjG0wY+vJdEsVA8j0iM9rkDBMdL8IM9Dh66sJGHeQGeDx?=
 =?us-ascii?Q?PJa5jVtrfCiRKc51b08kMVOUC7w/xgn0saChA2m6NvNe69awD5j3OiI68+PA?=
 =?us-ascii?Q?x4mD2xj48TRSOAtzhyWzyxmxKpEHXJwH5ZhO1cVj8oLctgMNLlaiHMrITEvK?=
 =?us-ascii?Q?Z0Y7DiRrjIdZy9Wv6DVicWfNdc8iY7sqNhsRXcNgCi1am2hxHys+ESBmPsJZ?=
 =?us-ascii?Q?94VckzdzStYf5sk31iR9Ao286KoOUkcAoJSAJyhvAcPKa3IKKqd/krJx3wjG?=
 =?us-ascii?Q?XG/wJ1pjOFbGZ7V6SYX0sWcEQUrn0yPOv24GmVB21u6CP2R2KgI5MS7P4+Ne?=
 =?us-ascii?Q?uweTeEi6ZZb5YpERcTyy7puasu8dcOAnxn5FtOIOeIDeWmyQHx/C8w1lw4Uf?=
 =?us-ascii?Q?1osiVFNVtGnK8jBcHZAr4MCjRTR4MPEDdiHcPwV6x7Qw3eeB3T9SELaSuRPO?=
 =?us-ascii?Q?8jQSIkWlAzyNgf6b1gagWsNOuJCfah7lUBKnL++OLAwBxouscIYkwmwtsJIK?=
 =?us-ascii?Q?qr6g8MlRYjndDFIt+wEIUIhUki8nv0dqCQZsmulzggHI97QEbN4J9kAZvnI+?=
 =?us-ascii?Q?QFOstVMLKMQoPFqSwSklMFuoJX2Dky5SYMDnO+JFqR3VVChhm/g6B86Im59Y?=
 =?us-ascii?Q?dgKwHcn1bzEBhvy4Dzp8yEtSNJJygRMrsZxW9X7wNPgBgaIhPCk0AxeVKWEs?=
 =?us-ascii?Q?S3Qms5fZjAXxQch9Zwgo6Tszjs8/Q2CpadVJnDrxg57eZFmNjFG6I0tEpMoL?=
 =?us-ascii?Q?SMRwjYRS9iSvPPrFPY8K4USDSeCYoZc1zYSClJLkjFRgEGFW3Jzm67hC50uL?=
 =?us-ascii?Q?YJoORDXcAZHYJz/8XNwWrW2hrAIybYeCHI/bDM9KO1GSU0y8/Ka0F+RLftXs?=
 =?us-ascii?Q?wNVizDvcMkD0/1qLZx5MxRBPdKwAO2338VWX3Tt+Z8UfAmQQp9UC+U3timTK?=
 =?us-ascii?Q?B0mZpW6aQNB/mRkaVXh25E+a0eT057vxOwfRWhY/0WjxsxBaYIDIqzukf3Pc?=
 =?us-ascii?Q?tZtjhB6oEP9ukOLzjJ5ZNhHoz8bE/+1BdBGv9PPMpkcmttGBtmOcpu5F6enA?=
 =?us-ascii?Q?/N972f8ty4t6tbK+9UjPIkh2c336BgwR0ER2pnKWCxC71WT3xu41ad6ZU+oE?=
 =?us-ascii?Q?Svah1Hep6FFDigl46TnsqBU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88862aed-b2e0-4d40-d0a5-08d9ecdd0053
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4679.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 21:33:38.8462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDksEAWXe0WyaMUejAkQlmPkAacLhGMU1bfqy5cbvOVt5GxSFT2sVd7cY2pMuGKRJ0vz23emqqbFmbEgZVzrhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6075
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22-01-26 20:47:33, Shawn Guo wrote:
> On Thu, Dec 16, 2021 at 08:48:09PM +0200, Abel Vesa wrote:
> > From: Jacky Bai <ping.bai@nxp.com>
> > 
> > On i.MX8DXL, the Connectivity subsystem includes below peripherals:
> > 1x ENET with AVB support, 1x ENET with TSN support, 2x USB OTG,
> > 1x eMMC, 2x SD, 1x NAND.
> > 
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> >  .../boot/dts/freescale/imx8dxl-ss-conn.dtsi   | 137 ++++++++++++++++++
> >  1 file changed, 137 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> > new file mode 100644
> > index 000000000000..b0059296a03f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> > @@ -0,0 +1,137 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2019-2021 NXP
> > + */
> 
> Shouldn't we include imx8-ss-conn.dtsi here?  Otherwise, the
> /delete-node/ and &conn_subsys reference below looks baseless.
> 

Nope. The way this works is: imx8dxl.dtsi includes both
imx8-ss-conn.dtsi (the generic part) and imx8dxl-ss-conn.dtsi
(the imx8dxl specific part), in this exact order.
And same does imx8qxp.dtsi. It includes the imx8-ss-conn.dtsi
(the generic part) and then includes imx8qxp-ss-conn.dtsi
(the imx8qxp specific part). And so on.

All other comments will be addressed in the next version of this
patchset.

> > +
> > +/delete-node/ &enet1_lpcg;
> > +/delete-node/ &fec2;
> > +
> > +&conn_subsys {
> > +	conn_enet0_root_clk: clock-conn-enet0-root {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <250000000>;
> > +		clock-output-names = "conn_enet0_root_clk";
> > +	};
> > +
> > +	eqos: ethernet@5b050000 {
> > +		compatible = "nxp,imx8dxl-dwmac-eqos", "snps,dwmac-5.10a";
> > +		reg = <0x5b050000 0x10000>;
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupt-names = "eth_wake_irq", "macirq";
> > +		clocks = <&eqos_lpcg IMX_LPCG_CLK_2>,
> > +			 <&eqos_lpcg IMX_LPCG_CLK_4>,
> > +			 <&eqos_lpcg IMX_LPCG_CLK_0>,
> > +			 <&eqos_lpcg IMX_LPCG_CLK_3>,
> > +			 <&eqos_lpcg IMX_LPCG_CLK_1>;
> > +		clock-names = "stmmaceth", "pclk", "ptp_ref", "tx", "mem";
> > +		assigned-clocks = <&clk IMX_SC_R_ENET_1 IMX_SC_PM_CLK_PER>;
> > +		assigned-clock-rates = <125000000>;
> > +		power-domains = <&pd IMX_SC_R_ENET_1>;
> > +		clk_csr = <0>;
> 
> Is this property documented anywhere?
> 
> > +		status = "disabled";
> > +	};
> > +
> > +	usbotg2: usb@5b0e0000 {
> > +		compatible = "fsl,imx8dxl-usb", "fsl,imx7ulp-usb";
> > +		reg = <0x5b0e0000 0x200>;
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> > +		fsl,usbphy = <&usbphy2>;
> > +		fsl,usbmisc = <&usbmisc2 0>;
> > +		/*
> > +		 * usbotg1 and usbotg2 share one clcok
> 
> s/clcok/clock
> 
> > +		 * scfw disable clock access and keep it always on
> > +		 * in case other core (M4) use one of these.
> > +		 */
> > +		clocks = <&clk_dummy>;
> > +		ahb-burst-config = <0x0>;
> > +		tx-burst-size-dword = <0x10>;
> > +		rx-burst-size-dword = <0x10>;
> > +		#stream-id-cells = <1>;
> > +		power-domains = <&pd IMX_SC_R_USB_1>;
> > +		status = "disabled";
> > +	};
> > +
> > +	usbmisc2: usbmisc@5b0e0200 {
> > +		#index-cells = <1>;
> > +		compatible = "fsl,imx8dxl-usbmisc", "fsl,imx7ulp-usbmisc";
> > +		reg = <0x5b0e0200 0x200>;
> > +	};
> > +
> > +	usbphy2: usbphy@0x5b110000 {
> > +		compatible = "fsl,imx8dxl-usbphy", "fsl,imx7ulp-usbphy";
> > +		reg = <0x5b110000 0x1000>;
> > +		clocks = <&usb2_2_lpcg IMX_LPCG_CLK_7>;
> > +		status = "disabled";
> > +	};
> > +
> > +	eqos_lpcg: clock-controller@5b240000 {
> > +		compatible = "fsl,imx8qxp-lpcg";
> > +		reg = <0x5b240000 0x10000>;
> > +		#clock-cells = <1>;
> > +		clocks = <&conn_enet0_root_clk>,
> > +			 <&conn_axi_clk>,
> > +			 <&conn_axi_clk>,
> > +			 <&clk IMX_SC_R_ENET_1 IMX_SC_PM_CLK_PER>,
> > +			 <&conn_ipg_clk>;
> > +		clock-indices = <IMX_LPCG_CLK_0>,
> > +				<IMX_LPCG_CLK_2>,
> > +				<IMX_LPCG_CLK_4>,
> > +				<IMX_LPCG_CLK_5>,
> > +				<IMX_LPCG_CLK_6>;
> > +		clock-output-names = "eqos_ptp",
> > +				     "eqos_mem_clk",
> > +				     "eqos_aclk",
> > +				     "eqos_clk",
> > +				     "eqos_csr_clk";
> > +		power-domains = <&pd IMX_SC_R_ENET_1>;
> > +	};
> > +
> > +	usb2_2_lpcg: clock-controller@5b280000 {
> > +		compatible = "fsl,imx8qxp-lpcg";
> > +		reg = <0x5b280000 0x10000>;
> > +		#clock-cells = <1>;
> > +
> 
> Unneeded newline.
> 
> Shawn
> 
> > +		clock-indices = <IMX_LPCG_CLK_7>;
> > +		clocks = <&conn_ipg_clk>;
> > +		clock-output-names = "usboh3_2_phy_ipg_clk";
> > +	};
> > +
> > +};
> > +
> > +&enet0_lpcg {
> > +	clocks = <&conn_enet0_root_clk>,
> > +		 <&conn_enet0_root_clk>,
> > +		 <&conn_axi_clk>,
> > +		 <&clk IMX_SC_R_ENET_0 IMX_SC_C_TXCLK>,
> > +		 <&conn_ipg_clk>,
> > +		 <&conn_ipg_clk>;
> > +};
> > +
> > +&fec1 {
> > +	compatible = "fsl,imx8dxl-fec", "fsl,imx8qm-fec";
> > +	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
> > +		     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
> > +		     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
> > +		     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
> > +	assigned-clocks = <&clk IMX_SC_R_ENET_0 IMX_SC_C_CLKDIV>;
> > +	assigned-clock-rates = <125000000>;
> > +};
> > +
> > +&usdhc1 {
> > +	compatible = "fsl,imx8dxl-usdhc", "fsl,imx8qxp-usdhc";
> > +	interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> > +};
> > +
> > +&usdhc2 {
> > +	compatible = "fsl,imx8dxl-usdhc", "fsl,imx8qxp-usdhc";
> > +	interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> > +};
> > +
> > +&usdhc3 {
> > +	compatible = "fsl,imx8dxl-usdhc", "fsl,imx8qxp-usdhc";
> > +	interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> > +};
> > -- 
> > 2.31.1
> >
