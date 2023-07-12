Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7A61750D41
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jul 2023 17:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbjGLP5a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 11:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbjGLP53 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 11:57:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C20199D;
        Wed, 12 Jul 2023 08:57:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 351E461889;
        Wed, 12 Jul 2023 15:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6296C433C7;
        Wed, 12 Jul 2023 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689177447;
        bh=irtHxWZQ/pjuQ4xowSpTxILW4ozSSaj/79le9KVqiDQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ocKBLgmGFIxdj0maYkMq0oLKmzB9VOkIKe5HS7usp38sX1F4XLB+Ki3/fCIO8RxoV
         +hyM1maJ/Jpka7g7U+ERePOtdmgVy2EGsWTlbPpIq6M/yLlDWelJ9/H82kpM6jLDKJ
         FAUrhui/9F0R1YjeuU5/7T2zeWo+J85hsvkeZP2YRJsnaqJRZ56tQJ6jhcoFLQpUjD
         M/unq9nrTrRrxIaHHKL3FUW9ZImKBakPKUH5bdimrKxdVXKPYwOY5Pe3WtAw6CBbu0
         d8F9Ox7DPhsfuRru/PQV9fYHdYVxj+yPN6SEYGTUSBE36CeUxTbdvvo7STzJUHxEHM
         VMELzHF6RS1Gg==
Date:   Wed, 12 Jul 2023 17:57:23 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/11] i2c: sh_mobile: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20230712155723.7qlu32bls47bhtir@intel.intel>
References: <20230710063351.17490-1-frank.li@vivo.com>
 <20230710063351.17490-8-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063351.17490-8-frank.li@vivo.com>
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

On Mon, Jul 10, 2023 at 02:33:47PM +0800, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
