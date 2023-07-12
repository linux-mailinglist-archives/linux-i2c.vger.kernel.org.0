Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B381B750D49
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jul 2023 17:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233320AbjGLP6d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 11:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232238AbjGLP6d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 11:58:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4136A2;
        Wed, 12 Jul 2023 08:58:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 44E8561800;
        Wed, 12 Jul 2023 15:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FD9C433C8;
        Wed, 12 Jul 2023 15:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689177510;
        bh=i0KOxKhT1Xq7gHoW71iFp7fjo8k1aansRE9L0aErbWc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KxCeM7VMhRsTGk6UiazC5hxfLgIuu/MUs2oDkNPnAuIOFxTBoBZz/fQGjNuvmBJhC
         Ya2F/L3XSq7kSj+VB2+5RTzYhCLe4BPnvClqD5LX2DEtVigu9DJCyJ7DgLr6iQuNLd
         Y1mcg16mlv0B8SQIhvzmMu17mx1tIHV2LoyRimZlfNC+jMEc4/MjuqyGhKMOTcnzBk
         lxCwyWp63rvWcXTOvF0jef2NViAdoPrP2dZW9X06X5a8kjtCKuxZkfaBpGDNi7M+RT
         axAQYGDUroBrrPxRAEf6uWGRLJHtPC+AK6tC75djvF2fInA6zpQc/DKhyVCBeW3uHV
         LPjzNHY+3+zBQ==
Date:   Wed, 12 Jul 2023 17:58:26 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/11] i2c: s3c2410: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20230712155826.hs63ef7gs4mwid7l@intel.intel>
References: <20230710063351.17490-1-frank.li@vivo.com>
 <20230710063351.17490-9-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063351.17490-9-frank.li@vivo.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yangtao,

On Mon, Jul 10, 2023 at 02:33:48PM +0800, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
