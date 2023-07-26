Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB9476339C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 12:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233902AbjGZK1T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 06:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233906AbjGZK1C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 06:27:02 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2099.outbound.protection.outlook.com [40.107.237.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24EC2D55;
        Wed, 26 Jul 2023 03:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGXpoJNozKc3wHroN4Yt4imEEpnBAr2ZdRN7y5T0mOn4bkqFXMnTt31hHa75DwNcqI3uaYAJcGfJHY4CSNqhPCDL62TSAeqPqKzg8ybelfqGRCrqrupOlXZM1GK/pU3RDTJaSJAciQNp07seuS+jkb1erFMSfM/ujsZ/K+gcKsR5q9n2ROTh5cU5BxiQfveQFK15W6ivF1W2PC3/+DsBUfAmXbuGCFIGnfqN3qKboGH7KOEv9Wef4L8UAF7GNCNZbjd9FlQjKiiDXaefkw9IFCRJVYNzqOYzIDwQ+pwRKWs4WPdnkoJdotjImV6Xi95li0NDKs2VH+GYfRjWhbPxKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MklsHz+uxtFZ29xJulffUBccpDGQf+pEVq9CnDtpf1E=;
 b=QZZC2iB7z5PVll+XBDNzRRRXv37b2g6yQndg6PT0FZUSZjRkV211x/G9rPJEekJEpqM1kdkoDLea8c49xIPmA+/4dsAfHsP7Lkt+ET45g5u5DYViqoJq6+713AVjNWrT26yNgoZh8+Rpc3ropM+rRKVH8nYsn713f3aIyPsVmEqu3O+LA95wknSPTmTh5oS0HBoL/z9qaXeo7vpjfzcAvMGFyGvDy9GB4R7IP5lZoC/GD+PQSTUiKI+f2ckTQ8u5aWmzei+/t+SXMC/V04UeloUrY56I/jzjOpaQamsrjKQpwc81Ayz1yM/8ti8ZhO2vPDMn6O2azphFOqqGJxuJGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MklsHz+uxtFZ29xJulffUBccpDGQf+pEVq9CnDtpf1E=;
 b=Bg3dNAYph6XNRWefI3Jhkv8ah2Cm4aJApoRR9ix1jDDNDG+i2R2ku7LPCY8fOMd6y6L6ad3DLqiJZ6qaO8nfnGxzoEClh/PusRs6HeUhb0DvuNa5gYmgwSIXmc3GFKeG2PSfsXsqDhv95keLBjOjrZhSeLjz4J7P74kEkCWyVZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by PH0PR13MB5715.namprd13.prod.outlook.com (2603:10b6:510:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Wed, 26 Jul
 2023 10:26:47 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 10:26:47 +0000
Date:   Wed, 26 Jul 2023 12:26:35 +0200
From:   Simon Horman <simon.horman@corigine.com>
To:     Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc:     Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, alexandre.torgue@foss.st.com,
        vkoul@kernel.org, jic23@kernel.org, olivier.moysan@foss.st.com,
        arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
        fabrice.gasnier@foss.st.com, andi.shyti@kernel.org,
        ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org,
        richardcochran@gmail.com, Frank Rowand <frowand.list@gmail.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 07/11] bus: rifsc: introduce RIFSC firewall controller
 driver
Message-ID: <ZMD027pTNT/HCLe6@corigine.com>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
 <20230725164104.273965-8-gatien.chevallier@foss.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725164104.273965-8-gatien.chevallier@foss.st.com>
X-ClientProxiedBy: AS4P195CA0026.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::12) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|PH0PR13MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: bff1a428-97ec-4c14-3399-08db8dc2d0b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ldslQXRsadsNF9mXMtWXa0XoLzDa/T8OeTN/NKK4htjuQE3FNbUusg/coG8XXhq+NiquDGjzOfMtpaClOO5Q2MyFxxVMpT2WTr/Tl/PH3Of8E5rg6szJvPa0n/irg4mXeG23jRe++3asCiKdG1jA++MBOAU122gmdPLctjzEkw4QSAen6KZ7Fzo5ghqDwD3X97AexSHdFf81qsNNpDGFW2K1XS/HEWVD0Z37mN7mjuxTywRbZYjapsaS3h9sJ5CZqVzLcUQnaVZofo/cxIZx9oP+J7cYbh5KSZ36R29oTJr6Iehhw8mrh5si/X1/GaF+ExfbyrAcY5CAQUV1SP9DH26TI3Qfr0J0zP2t/WlHBvojnDPdi1DbNLOjc8mpSVX/5zv92WAuVDrkR9xavvIkPXbUU57zo04/hr7Pp6+G/av5OJNqsI+7YzkdaC1VOhYw3khr7+mVmV+zN31NpqKNOJbiF50lNuZ2916TEQn4UfqF1k4bovitPp3Tt5rh36JI8eBRbOoHSiCv7sP0JwE8x8t56uj5VMwddHPB4eHW/lQtJfxzlgfJlz3RbDOvrWaAxJXq/dgIwQhqSjYLjEneXvhpi/2u88wB9oCty8eLvHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39840400004)(366004)(451199021)(6486002)(38100700002)(86362001)(478600001)(6666004)(186003)(66946007)(66476007)(4326008)(66556008)(6916009)(316002)(6512007)(7416002)(41300700001)(83380400001)(2616005)(2906002)(36756003)(8936002)(8676002)(7406005)(44832011)(6506007)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RAsdspnlCm/JbJqmW/9jN0IoIsOvJq30ndlhtQxfJSJYooaA/YHpgmmjzpxj?=
 =?us-ascii?Q?SmMzHlZEgv794jdoBb4nUK665yGLcizEZLfb5Ry4TlnAV3JJZddh4e200KzI?=
 =?us-ascii?Q?WJtScutYtIZH7TOaVM+yOIYfnl81Z2mpQ3zwPg4E9jrSXx/O2jp9G6NFLGzW?=
 =?us-ascii?Q?JomBeQfd6uM/7CgCAPj1g83TDpShT7nEx6BmyPHdGovmqy7R5mq2aR3oMeuA?=
 =?us-ascii?Q?/Ey8A7WG7ZwYf+k7WZW752VW26GKIXydCykRQnP3eGYXk971lpFjU8+8Fyik?=
 =?us-ascii?Q?svuy98uW8AV4sJrBn+3IYyDRDwD4jyl6GkfeoP9FSS9IYfsPrF8oipHfyHLY?=
 =?us-ascii?Q?3bk63K1gSVfg0o2DHXzob3nEvj/Xnr6v/Cv+HPsJHmgZSLcZqbRhxUQYt47+?=
 =?us-ascii?Q?l3Lby6U1Dc4kvS+NAP+RfmLmU+Kc1l/tSf6Tj2ABbgboED0s5da0HGg/3o6W?=
 =?us-ascii?Q?l91SQWv8cWBR3IcPrIhGBkX4dXMc5LToBZRFrf8CXMSOhQ+BaqYDS4f+MrcD?=
 =?us-ascii?Q?May0lhNGutuhtpzc42gRuc7MT/T5AeXwUdAUAP87H1hcl8V84M9CGYOA0QLs?=
 =?us-ascii?Q?+dziZf6q7RbreaqnV9uFcCxaQPysFqZg2G/tl/S8kyCX1mWBUssyvtVY8p8I?=
 =?us-ascii?Q?GJNEyvR1rmc10YdkXkHxpbcwPSEmdbXg4E44Nfd6mcbqEOgnq6qO21ZkxAH5?=
 =?us-ascii?Q?O8cvrOKf0yjAh8BBMxdJA5CNuu3vvpyCtSUQv6Z9XA9LIey0DazhkL1K7OZG?=
 =?us-ascii?Q?xOPWyLoKe4wSd+4mK4v+PhvgJ3aA+qfPEjq53XTmsNe1O0wpQmrQ9Tn7xncj?=
 =?us-ascii?Q?HqHdy8DTKQoZQ4kzJ+WR2hv8cYRMj7zDpMgTDjgdozdzyV3Meb/kfgogw/kx?=
 =?us-ascii?Q?SsYQieZAKIPFGRW1m5zGT+Wj7yCyk7outfHIyaF12spjBqHYfzozuVCkIvAd?=
 =?us-ascii?Q?pu5hItzHjrNFf1oeCh09zNt8TnaSX24pHh8XyhaS+MygWKSN84Ao/R4hvweu?=
 =?us-ascii?Q?fNs7lDkMXRXd56+ChzqHtbQRVExwOrtkIfvnMKMeQ/hVhrs6dliVHlI1TQ7X?=
 =?us-ascii?Q?B22mDTmLysGbrYQIHBY5uLsaGNlQSb845ZlyInXbP1xFf+O0RERFWIxUc6Hl?=
 =?us-ascii?Q?a4P2PUPLsqFfj+gusyzMgdFjpHuWqHr3JaS0ipcPZnBT5vSKgrQKaAKc1QMb?=
 =?us-ascii?Q?8fdLbf9XANVNDFjw5pR/uFDhoNeGwlbVqqgevG0Vns9fuaXeLJ4Y5CsNn1Xn?=
 =?us-ascii?Q?NrYBLGlRH4KuYVF7N0Rpikwp8Fw5cJFWv68oTTIUwn7uhQBuEtMX//LAObrl?=
 =?us-ascii?Q?InCpYmG3L2af8Bg/IhXyKYMkB/wnPrO1hP1NIoA0o2kKMKEPMcKGiQQAl+S/?=
 =?us-ascii?Q?0/zvhZol9vIuG6Eu6YQulQN8m00AWhouW6wh2ZN0v7pT6fIvuqwHeGoJkimU?=
 =?us-ascii?Q?YLJFfs2kio2k9RW5DniVR59dr1gnJNKx14UtorH4lBi2pIzPLhjoMBlX6R3N?=
 =?us-ascii?Q?md0ELR1Iz5wYkEvLsniClgWmUUOTPKSD+HhrKZnszFZ5yBbREL81ajtM5usL?=
 =?us-ascii?Q?K5ltWFrruZO1/CQAav3a9xGpW+ns8D5LNpUm2qWqgQxYTYGN6Km/lv2Oxn7b?=
 =?us-ascii?Q?GusR9GuW9zjv+zm5p9qG/AbfaNWrg+UZM+gAA7owTKw/m4IK44wNveqZJcfx?=
 =?us-ascii?Q?i/I8gw=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff1a428-97ec-4c14-3399-08db8dc2d0b9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:26:46.9973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USXdBIeNWBYBXnNSOtb+MSOw98vbOPlPLxJ462/24lstZv01xXVMm44GYxy3KvqRGltWHGOKW95LLkvl9SUBT09dosan4dPftxDjRfTXwM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR13MB5715
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 25, 2023 at 06:41:00PM +0200, Gatien Chevallier wrote:

...

> diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c

...

> +static int stm32_rif_acquire_semaphore(struct stm32_firewall_controller *stm32_firewall_controller,
> +				       int id)
> +{
> +	void __iomem *addr = stm32_firewall_controller->mmio + RIFSC_RISC_PER0_SEMCR + 0x8 * id;
> +
> +	__set_bit(SEMCR_MUTEX, addr);

Hi Gatien,

Sparse seem a bit unhappy about this.

 .../stm32_rifsc.c:83:9: warning: cast removes address space '__iomem' of expression
 .../stm32_rifsc.c:83:9: warning: incorrect type in argument 2 (different address spaces)
 .../stm32_rifsc.c:83:9:    expected unsigned long volatile *addr
 .../stm32_rifsc.c:83:9:    got void [noderef] __iomem *addr
 .../stm32_rifsc.c:83:9: warning: incorrect type in argument 2 (different address spaces)
 .../stm32_rifsc.c:83:9:    expected unsigned long volatile *addr
 .../stm32_rifsc.c:83:9:    got void [noderef] __iomem *addr

But it's not immediately apparent to me what a good solution is.

> +
> +	/* Check that CID1 has the semaphore */
> +	if (stm32_rifsc_is_semaphore_available(addr) ||
> +	    FIELD_GET(RIFSC_RISC_SCID_MASK, readl(addr)) != RIF_CID1)
> +		return -EACCES;
> +
> +	return 0;
> +}

...
