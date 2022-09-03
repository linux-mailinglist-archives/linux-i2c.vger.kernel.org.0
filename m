Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E98095ABC9C
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Sep 2022 05:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbiICDjE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Sep 2022 23:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiICDjD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Sep 2022 23:39:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09081DAEDE;
        Fri,  2 Sep 2022 20:39:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A4ECA621A1;
        Sat,  3 Sep 2022 03:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F2CC433D7;
        Sat,  3 Sep 2022 03:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662176339;
        bh=Qh/vsU4VBqPlAANpJ+O2hm1hLDan/ffR9IFOnobF9gY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F85L6UtbKcNabX5elItT4zXadUnVtqsOtLw7jcxHyL19lww5ZGyThGECpQA1H2ere
         4wcybQ9pQtk+9EPcTn47Iy7GwKeS8TWU2oARiAcAzMoD91QxzR6C7AxFwPSBwbO3WZ
         rVryK7wpO/dYxqzP1CYHdmfQfEpboXJ9qRL+2dP57F93E0/gzGEvzT85R23TsiVFid
         Ag9xZkfsy86CGe0Q9N6QiQDaMIAnBS4bupUS+6OLXZYyKgH2hNgBSQfpd5faJHulan
         BkapRvsilnMEDXMsGCLUHZVLeKtuhPa7D9R9SwOKe+j+ShkIDzrtyrbcDc391cidG5
         aUF054LWtXRCg==
Date:   Sat, 3 Sep 2022 11:38:51 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     wsa@kernel.org, aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 0/7] i2c-imx-lpi2c: add IPG clock
Message-ID: <20220903033851.GE1728671@dragon>
References: <20220823030215.870414-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823030215.870414-1-peng.fan@oss.nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 23, 2022 at 11:02:08AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> V3:
>  Add R-b
>  Correct clk_bulk_disable to clk_bulk_disable_unprepare in patch 7
> 
> V2:
>  use clk bulk API in driver to support backward compatibility.
>  Include a new patch, patch 1.
> 
> The i.MX LPI2C needs PER and IPG clock, not just PER or IPG clock.
> The current driver/dts/bindings use one CLK. Although it works with
> upstream kernel, but it not match the hardware design. If IPG clock is
> disabled, the LPI2C will not work.
> 
> There are changes made to ARM32 i.MX7ULP dts, ARM64 i.MX8 dts, dt-
> bindings, and the lpi2c driver.
> 
> The driver is updated to use bulk clk API to avoid break backward
> compatibility. But it is hard to avoid dtbs_check pass, because the dts and
> binding update are in separate patches.
> 
> Peng Fan (7):
>   ARM: dts: imx7ulp: update the LPI2C clock-names
>   dt-bindings: i2c: i2c-imx-lpi2c: add ipg clk
>   dt-bindings: i2c: i2c-imx-lpi2c: add dmas property
>   dt-bindings: i2c: i2c-imx-lpi2c: add i.MX93
>   arm64: dts: imx8-ss-dma: add IPG clock for i2c
>   ARM: dts: imx7ulp: Add IPG clock for lpi2c
>   i2c: imx-lpi2c: use bulk clk API

Applied 3 DTS patches, thanks!
