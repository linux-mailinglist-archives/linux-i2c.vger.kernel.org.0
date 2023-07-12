Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57D06750D1F
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jul 2023 17:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbjGLPw4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 11:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233856AbjGLPw4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 11:52:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B02AEA2;
        Wed, 12 Jul 2023 08:52:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D89361888;
        Wed, 12 Jul 2023 15:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13465C433C8;
        Wed, 12 Jul 2023 15:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689177174;
        bh=r+kChX2C24ujI3cqakNo4nQuT6sumweAW1ikpYPWIbQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ovKo+lYenOpY2U9lxPuiwnm+74AOMO9ytQ6D3UE8i+Cirp8VTvzetCoBV71R3Vayq
         zbRO8JjLmcBKMNDp8ZPTh2xRj722yRDlRbosN7lwkTmAqM0rtZnzqXHfBJkliu17ce
         u8I0cXNF6M1w64dV1FLCeu4767UzOhKDYwGCQktzcgyu30XpbaKgSl+NEGt0BakcNC
         JQaqnXmrgBcdcESBQ9vynD6Ch07OkGndL0Zbry2/cMvRwsbORStH1sOTi9j6kPxQHJ
         xMeVzwAIrBjA/5T84pcpDPs3GqhRS/7K7RY+NbowcNE/RRta17f9lcSO2kk3DQAAXj
         +p81lS6HYCyEA==
Date:   Wed, 12 Jul 2023 17:52:50 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/11] i2c: st: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20230712155250.6aageby5dqmep24m@intel.intel>
References: <20230710063351.17490-1-frank.li@vivo.com>
 <20230710063351.17490-7-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063351.17490-7-frank.li@vivo.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yangtao,

On Mon, Jul 10, 2023 at 02:33:46PM +0800, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
