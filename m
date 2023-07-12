Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A46D750CE1
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jul 2023 17:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjGLPnp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 11:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233792AbjGLPnp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 11:43:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658C61BB;
        Wed, 12 Jul 2023 08:43:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 03BD561828;
        Wed, 12 Jul 2023 15:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0DC0C433C8;
        Wed, 12 Jul 2023 15:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689176623;
        bh=+HcaojxcQ0HbiXwPEBJ7/gWMgehCAC5FvKNYIEjOiMw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Az7Q9si/pTalCEz4e6K3L1UyUxAiZfu3bZOLmcKoRUmKBxtd4E7JOiQWn8/1A2WSh
         JXtnxUM9eXdIfeQEQ51qKJUk/Q/9SQ0si6s+ieolmgv2MyajjkxN2/HU6JZ5wS4oFr
         c1esNWyX8qk952A4ID6WjSmKDxox2dMFMpZtitdtBESeBubFsxH0madvLGCcqjs3Kz
         R72FbDkAXUab+q9maeCoYSe8AIvEs+xNqSae4do3H+PKB2BJe1EjfevfW6a5Dj0r9S
         kAGKl12jJwcw3cdfg+uT0V42ObGybVbYCFL1Eec4Ugc3Da4UMLY8/+V8JJbJsesu4q
         239+5+KGsjWfw==
Date:   Wed, 12 Jul 2023 17:43:39 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/11] i2c: brcmstb: Convert to
 devm_platform_ioremap_resource()
Message-ID: <20230712154339.tjw5zt7icmna34yz@intel.intel>
References: <20230710063351.17490-1-frank.li@vivo.com>
 <20230710063351.17490-3-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063351.17490-3-frank.li@vivo.com>
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

On Mon, Jul 10, 2023 at 02:33:42PM +0800, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
