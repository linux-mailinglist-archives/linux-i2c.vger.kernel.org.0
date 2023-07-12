Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB89D750CC8
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jul 2023 17:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233767AbjGLPlE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 11:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233762AbjGLPlD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 11:41:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA6EDC;
        Wed, 12 Jul 2023 08:41:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33A0761844;
        Wed, 12 Jul 2023 15:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F5FC433C8;
        Wed, 12 Jul 2023 15:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689176461;
        bh=UPedqm+cNLafvml/brXpW6csB87fyB8bsJrVyHa3xVE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d09H2ptJ4+kBC0HBLsdjreRmpyYloLHoc8M4Y1sIHvaCZFypYU7dg2g0U8D1vwVYo
         j9+gZrGb1Alh+7XDyCdEbRXuyem4jyjKORD3bkptf0P/ral+t9YBVS1MPCJLlx+Zpd
         T8MxidvorIQBEODrMu72+1uX+igjJwxGHqVjRf8aukQvxc14qVu4pLWTzJ5VKCJzAK
         aXX4O50TLWFUEcVlU53LD1rJDlGOF0nXlk6ngjNnD4gvBFxL+DDBX3sD2tRiKmJQsF
         K5GVQTG0k+j2d5upvqYvAhX2f5vuKj6jWuD9IZ2u5ToWNnr2VmE/91AQ/fyr1gc+F3
         fyjZXV9mpgcGQ==
Date:   Wed, 12 Jul 2023 17:40:56 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <ray.jui@broadcom.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/11] i2c: iproc: Convert to
 devm_platform_ioremap_resource()
Message-ID: <20230712154056.4l65i5jeta5nvmxu@intel.intel>
References: <20230710063351.17490-1-frank.li@vivo.com>
 <20230710063351.17490-2-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063351.17490-2-frank.li@vivo.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yangtao,

On Mon, Jul 10, 2023 at 02:33:41PM +0800, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Acked-by: Ray Jui <ray.jui@broadcom.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
