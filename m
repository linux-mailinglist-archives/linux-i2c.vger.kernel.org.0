Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD4976D852
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 22:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbjHBUCQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 16:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbjHBUCQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 16:02:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2614E2101;
        Wed,  2 Aug 2023 13:02:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A119761ADB;
        Wed,  2 Aug 2023 20:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EEBC433C7;
        Wed,  2 Aug 2023 20:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691006534;
        bh=p9cM58+oAa6P7YvWS48hf5WR0lLuMarIMxBDK7orTzc=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=s1pfejcUVe/PCtzRCaSVCqzz2UrZ26/+xjcimbrMTwknxL1nG84m12i4o8P5ubCX2
         B49XB7PoRRpbh6yzvQq1Ik2mSq+XLb2JtU8z7uwOyni5TRoc8J0wtFWPMLrkNo0TxG
         +u1PSNjwQR6vhKdDQLnTScYZn/Y8w0Tylq0AUyVTx83ytqiPLVnVjnxC8bWWIrAY11
         dlVGVCxix7Y9sW9n/uLZYqGoVAUOnLMaGb6wcCSx74Coo5vOgk6CJv/j1wdyiGV8m5
         wRQG1aCcA03rTmx+4le1i7B2Xwr+jS3+Ty2CGShslN0VyrPe4ikDqW4ByBi52Q0Tx0
         wFhJUrQpXGz1Q==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Till Harbaum <till@harbaum.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harry Geyer <harry.geyer@devtank.co.uk>
In-Reply-To: <20230727162255.21551-1-harry.geyer@devtank.co.uk>
References: <20230727162255.21551-1-harry.geyer@devtank.co.uk>
Subject: Re: [PATCH] i2c: tiny-usb: check usb base class before assuming
 the interface on device is for this driver
Message-Id: <169100653071.1957828.15637150072710562078.b4-ty@kernel.org>
Date:   Wed, 02 Aug 2023 22:02:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On Thu, 27 Jul 2023 17:22:55 +0100, Harry Geyer wrote:
> Patch allows usb devices with multiple interfaces to use this driver without
> this driver assuming all interfaces are i2c-tiny-usb.
> 
> 

Applied to i2c/andi-for-current on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[1/1] i2c: tiny-usb: check usb base class before assuming the interface on device is for this driver
      commit: c6607c0c7118ab96dcbc57df67fe316e871666a1

