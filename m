Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 823DC763996
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 16:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbjGZOwF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 10:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233787AbjGZOwE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 10:52:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B9A19A0;
        Wed, 26 Jul 2023 07:52:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 04D4761B0C;
        Wed, 26 Jul 2023 14:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C71C433C8;
        Wed, 26 Jul 2023 14:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690383122;
        bh=N9g1QYtpyOgI+H7opfB2/tLnw3a9OupGoURiO5eO3Y0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gdxMUltmt2ZLor+KpZOvC2SGPPePfuELcTwJHTfuehuWYxOGR5ao7UX3GzhjLRM+B
         yuWDbyaMy7WPI5qT5kQl+QV+cZFMOPwWmb9Tq23/0Fg7OgUbM5u0cQ0FYx0VPk6Dha
         ciBI0RNWA5z5xp6Y5D1j8MLRKmIcW3I0m+7OONKjet/NH25L0qdbC7QC41EPXjYkmS
         PaLt9/NKC8HFZAO21zAlATHeKqx/J+J3asubiPMTey+VlAU5VO7KMoWC5rVR0lmnvM
         lEs2H3CfGiQH4fU1P1BPL9dgNt4VRt9gxaSoQBnSlbyGSlNyAQAMyf+t5mbIskFllW
         ptGqpKOQpxPxg==
Date:   Wed, 26 Jul 2023 16:51:58 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     carlos.song@nxp.com
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: imx-lpi2c: directly return ISR when detect a NACK
Message-ID: <20230726145158.xhn2c7uzs6xsrguf@intel.intel>
References: <20230726092350.3432837-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726092350.3432837-1-carlos.song@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Carlos,

On Wed, Jul 26, 2023 at 05:23:50PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> A NACK flag in ISR means i2c bus error. In such condition,
> there is no need to do read/write operation.
> 
> In this patch, i2c will check MSR_NDF, MSR_RDF and MSR_TDF
> flag in turn, it's making mutually exclusive NACK/read/write.
> So when a NACK is received(MSR_NDF), i2c will return ISR
> directly and then stop i2c transfer.

Very good, thank you!

> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")

One last little question here. I want to know if this is actually
fixing something or cleaning the exit path. What I mean is:
can the device ever send an NDF along with an RDF or TDF?

If not, this "Fixes:" tag should be removed and this patch can be
considered a cleanup. Otherwise would be nice to know what
failure are you fixing.

I'm just trying to understand here :)

Andi
