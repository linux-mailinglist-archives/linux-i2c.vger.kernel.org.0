Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2930D777380
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 10:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234367AbjHJI4o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 04:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234222AbjHJI4m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 04:56:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B8B2123;
        Thu, 10 Aug 2023 01:56:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0501860B7D;
        Thu, 10 Aug 2023 08:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD84BC433C8;
        Thu, 10 Aug 2023 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691657795;
        bh=JnhEH4wMc8AeDCC0VFoQzQrj+iXNdjqhUQZWI00aVz4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rr8FrM0ZIPljqAf/YtTP0nPqKVf0SAWcJYosFK7Q2LQ+ppagF7NZsocOKvKfWW8Iv
         tOcB+r+K6DXD4L5lCrPuff4QCziSJERHeTikodP0HTpOD/bXibzsloh9hziKLqC7c3
         r6so+GeqiVHXchJPSJ5b2diWokVjVvkYHEbSSQUrfFe4WgAHFuJcDA8gM2FSKercB5
         6Yx7rg5ZQmO2uPu73ODAdx1gchqSnOzzoxs17BUMrfEqcUOV+NKYP1cLbIV4qtQr48
         SkZ7r50kj9j3QHeeuRJEHBgoFHEHqE2Y5lz4RT294C8Y8Z9vYMsA47Ne6KJqBVh8sz
         vRP4RsDiE8sKQ==
Date:   Thu, 10 Aug 2023 10:56:32 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 1/2] i2c: i2c-bcm-iproc: fix -Wvoid-pointer-to-enum-cast
 warning
Message-ID: <20230810085632.xzonkmse27mu4yew@intel.intel>
References: <20230809-cbl-1903-v1-0-df9d66a3ba3e@google.com>
 <20230809-cbl-1903-v1-1-df9d66a3ba3e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809-cbl-1903-v1-1-df9d66a3ba3e@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Justin,

> @@ -1036,7 +1036,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, iproc_i2c);
>  	iproc_i2c->device = &pdev->dev;
>  	iproc_i2c->type =
> -		(enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
> +		(unsigned long) of_device_get_match_data(&pdev->dev);

I think this should be uintptr_t, as defined in types.h:

    typedef unsigned long uintptr_t;

(I'm a bit puzzled to see a void *data cast to a 0/1 value.)

Andi
