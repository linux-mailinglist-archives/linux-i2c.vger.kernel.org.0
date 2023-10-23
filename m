Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3147D38EC
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 16:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjJWOGj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 10:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233188AbjJWOGh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 10:06:37 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE3B10D7;
        Mon, 23 Oct 2023 07:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBtyiYbmVFHb9oeHpGHn5mab/huzW3ExrPJAB4evLkNdHDck0F6nWZj4h4pC2E+vXpCvEYCr1/21y/meio0TX5f6TQOMj1rSJq+pczDiE0eNeBkhtTFIepsxXE01uoPiGLNaahDaiIfFcpMKXVOAXUgTDqCO7R72CiFcYxxfix6NFxxSuBzpLs7dyvbcpw77lpDHoxm/kMtQ/TP7zWGJw+RQbKGr+6ldeluwbANh2MwR1NvTM8g0uNXKBrrIy5CxL8JuoS6YW07iwd7rtjv4T3/bWj1uRfZJA8xmezsrsZ497i4hXtVE8XvhLi061zUDUWaNcWIZyvA3YRo01pD6qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0piiAJqNVsCJjiSCblbvSYyXjxYxrOalutMxrLLKKQ=;
 b=ZZWrPI39etteTXsZR1Z4OmKXYJJJ7kEXvArQA1KNVsmkcBCHDeVyyJL8HOvsO2dYz2P7tBchxX5vC697NOCaMhc43ufGhDIt4ai5MM/ZsHG9/OkTZCMiQXKD4ueXF6q+ucXOQvgR2W7bUBAa32XaoGDpBHoQoJZ3UqPJsKn3wXFj5XsSLz3AXNvRoZWBZ+6mKmIWRtgj7+2JGdoxSjH9Z5Fk3xWVXLKW1UgwXV270UV5bTJPpvnQ70chfIOLSRupB4qspMOldfi3UnEskIhksG2vvAKh445x+1VZDhj3D90hZWMzZ0m5F7SBoBy5yffSMzFdMyesEljDl6zASM3EuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=linaro.org smtp.mailfrom=axis.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0piiAJqNVsCJjiSCblbvSYyXjxYxrOalutMxrLLKKQ=;
 b=dBChw/RNIfwOgRKiJ0fOkolk9si6l4YW+t28KKm8LiKQTyeE8b0lRFypxrxZRdgJ0y5D7gL8PMXF7fY47R+3zC4758tsWc69WyZ2Ujmn0D505SlD645OlGUSHnObILdQMbxXF0uNdsd37lpxsAwQ7vX5RqIwp/MH4d63G6No/l8=
Received: from DUZPR01CA0173.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::27) by VI1PR02MB5855.eurprd02.prod.outlook.com
 (2603:10a6:803:137::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Mon, 23 Oct
 2023 14:06:28 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::71) by DUZPR01CA0173.outlook.office365.com
 (2603:10a6:10:4b3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24 via Frontend
 Transport; Mon, 23 Oct 2023 14:06:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Mon, 23 Oct 2023 14:06:28 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Oct
 2023 16:06:27 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Oct
 2023 16:06:27 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 23 Oct 2023 16:06:27 +0200
Received: from pc36611-1939.se.axis.com (pc36611-1939.se.axis.com [10.88.125.175])
        by se-intmail01x.se.axis.com (Postfix) with ESMTP id 76DEE1F6E;
        Mon, 23 Oct 2023 16:06:27 +0200 (CEST)
Received: by pc36611-1939.se.axis.com (Postfix, from userid 363)
        id 6E4646291A; Mon, 23 Oct 2023 16:06:27 +0200 (CEST)
Date:   Mon, 23 Oct 2023 16:06:27 +0200
From:   Jesper Nilsson <jesper.nilsson@axis.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
CC:     Camel Guo <camel.guo@axis.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@axis.com>,
        <linux-i2c@vger.kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] i2c: exynos5: Calculate t_scl_l, t_scl_h according to
 i2c spec
Message-ID: <20231023140627.GE11306@axis.com>
References: <20220912085943.1098651-1-camel.guo@axis.com>
 <CGME20231023103421eucas1p2f1415d69dd979036ef8bcb1a2dc88978@eucas1p2.samsung.com>
 <55812f75-3053-4970-bbbe-8ca563f33721@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <55812f75-3053-4970-bbbe-8ca563f33721@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009527:EE_|VI1PR02MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: 93aded00-3432-4456-153f-08dbd3d1403e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3XJS/AiYnyllcjQijPddmToR6CK/djSLFcoikgF1w5Wj/46fSBtCVwHpfkLxMgGVXJmPAqqbBr2LBeyxhgljK0GzEtzSM9pBU9TWSdTbRNEIu6HKBhvbRvs0SpH4w7yk7kPhq1nj03Ky5bM4FCqlsOtlV5bSYH9jw79PR+XAc6kZbBnCImB9M1eSgYG9DPdJXGWL4CH7cynkVqe8fuwySKOKf1bkekkaKULDoroWVFkmjh9mEHhz2DvJzf/Uas9kTgTUxRokzmgg9fU+InSai8JUdhFVE7jcIT/DIGYJDHqL2uoVy+gh2O0fV15PXxdsLYpygfgd4vNoaXH/MN5bszsGBGO3F0BB9OhsXT2d9Tzzn/KChza62RPHB/Z7re9+HbCLk9FjRIiV3ixVtyefzH9szuv/2UqjnITdJwo1PcK78rlpo8djYc/NW77GeFBC/K/cHzEFHQi8K4HW9f0emGIzkyA/3+C84TL/TbrcsBdnzKOgqtHKIbFah8u9MqVqk/rUbGKodRtmJKVYS1qjysBDK+tbO7UWKRqX84XbiAgtAMaxwZU1l7folAVz6T7QMwcxVdgM+0crY1h0rCphtN60PeFnYXvJXdQg3VZTk7cA9RPat2h5puWhNYSofOHr0mfBLtUORMesM2ZeeSPGgsOeDQx+DBLARPmEgJ8Ug9Dy01RPZ08fzTEcZyXWHeT6pgiS474xICsnogKmUWYJ/HBDLihoed0U4WDSA3NPRRkJLThfzuNQv6hWsy6N1H7H1qp2N+B0xmOxNDlzZxsXKg==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39850400004)(136003)(376002)(346002)(230922051799003)(1800799009)(64100799003)(82310400011)(451199024)(186009)(46966006)(40470700004)(36840700001)(44832011)(5660300002)(4326008)(41300700001)(8936002)(8676002)(316002)(6916009)(86362001)(2906002)(42186006)(54906003)(70206006)(70586007)(478600001)(53546011)(36756003)(2616005)(36860700001)(1076003)(26005)(81166007)(40480700001)(356005)(426003)(336012)(6266002)(47076005)(40460700003)(82740400003)(33656002)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 14:06:28.1711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93aded00-3432-4456-153f-08dbd3d1403e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5855
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks Marek for testing. We have been running with this patch for more
than a year now.

The patch has been orphaned for 6 months as Camel no longer works here,
but since I was involved in the creation of it I can resend it.

/Jesper

On Mon, Oct 23, 2023 at 12:34:19PM +0200, Marek Szyprowski wrote:
> On 12.09.2022 10:59, Camel Guo wrote:
> > Previously the duty cycle was divided equally into h_scl_l, t_scl_h.
> > This makes the low period of the SCL clock in Fast Mode is only 1.25us
> > which is way lower than the minimal value (1.3) specified in i2c
> > specification. In order to make sure t_scl_l, t_scl_h always fullfill
> > i2c specification, this commit calculates t_scl_l using this formula:
> >
> > t_scl_l = clk_cycle *
> >      ((t_low_min + (scl_clock - t_low_min - t_high_min) / 2) / scl_clock)
> >
> > where:
> > t_low_min is the minimal value of low period of the SCL clock in us;
> > t_high_min is the minimal value of high period of the SCL clock in us;
> > scl_clock is converted from SCL clock frequency into us.
> >
> > Signed-off-by: Camel Guo <camel.guo@axis.com>
> 
> 
> This sounds reasonable and works fine on all Exynos-based test board I 
> have. Feel free to add:
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> 
> > ---
> >   drivers/i2c/busses/i2c-exynos5.c | 34 +++++++++++++++++++++++++++++---
> >   1 file changed, 31 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> > index 4a6260d04db2..72bc8adea8d5 100644
> > --- a/drivers/i2c/busses/i2c-exynos5.c
> > +++ b/drivers/i2c/busses/i2c-exynos5.c
> > @@ -267,7 +267,7 @@ static void exynos5_i2c_clr_pend_irq(struct exynos5_i2c *i2c)
> >    * exynos5_i2c_set_timing: updates the registers with appropriate
> >    * timing values calculated
> >    *
> > - * Timing values for operation are calculated against either 100kHz
> > + * Timing values for operation are calculated against 100kHz, 400kHz
> >    * or 1MHz controller operating frequency.
> >    *
> >    * Returns 0 on success, -EINVAL if the cycle length cannot
> > @@ -330,6 +330,23 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
> >   	 *
> >   	 * Constraints: 4 <= temp, 0 <= CLK_DIV < 256, 2 <= clk_cycle <= 510
> >   	 *
> > +	 * To split SCL clock into low, high periods appropriately, one
> > +	 * proportion factor for each I2C mode is used, which is calculated
> > +	 * using this formula.
> > +	 * ```
> > +	 * ((t_low_min + (scl_clock - t_low_min - t_high_min) / 2) / scl_clock)
> > +	 * ```
> > +	 * where:
> > +	 * t_low_min is the minimal value of low period of the SCL clock in us;
> > +	 * t_high_min is the minimal value of high period of the SCL clock in us;
> > +	 * scl_clock is converted from SCL clock frequency into us.
> > +	 *
> > +	 * Below are the proportion factors for these I2C modes:
> > +	 *                t_low_min, t_high_min, scl_clock, proportion
> > +	 * Standard Mode:     4.7us,      4.0us,      10us,      0.535
> > +	 * Fast Mode:         1.3us,      0.6us,     2.5us,       0.64
> > +	 * Fast-Plus Mode:    0.5us,     0.26us,       1us,       0.62
> > +	 *
> >   	 */
> >   	t_ftl_cycle = (readl(i2c->regs + HSI2C_CONF) >> 16) & 0x7;
> >   	temp = clkin / op_clk - 8 - t_ftl_cycle;
> > @@ -343,8 +360,19 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
> >   		return -EINVAL;
> >   	}
> >   
> > -	t_scl_l = clk_cycle / 2;
> > -	t_scl_h = clk_cycle / 2;
> > +	/*
> > +	 * Scale clk_cycle to get t_scl_l using the proption factors for individual I2C modes.
> > +	 */
> > +	if (op_clk <= I2C_MAX_STANDARD_MODE_FREQ)
> > +		t_scl_l = clk_cycle * 535 / 1000;
> > +	else if (op_clk <= I2C_MAX_FAST_MODE_FREQ)
> > +		t_scl_l = clk_cycle * 64 / 100;
> > +	else
> > +		t_scl_l = clk_cycle * 62 / 100;
> > +
> > +	if (t_scl_l > 0xFF)
> > +		t_scl_l = 0xFF;
> > +	t_scl_h = clk_cycle - t_scl_l;
> >   	t_start_su = t_scl_l;
> >   	t_start_hd = t_scl_l;
> >   	t_stop_su = t_scl_l;
> >
> > base-commit: ce888220d5c7a805e0e155302a318d5d23e62950
> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
