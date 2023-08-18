Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8B11781360
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 21:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379630AbjHRTfR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Aug 2023 15:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379629AbjHRTfO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Aug 2023 15:35:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061571FCE
        for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 12:35:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 939C561124
        for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 19:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447BEC433C8;
        Fri, 18 Aug 2023 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692387312;
        bh=YPTgYTmKmCZYJJ3ohH6T6xBi09EXtJr+95ksiXfJzEk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N5Q6/ag5l5PNlR0MeqZpxCcdhvoY7LUel22fr4AzynXIzklPn1YfRhWC9TP0klJUA
         RVddPwERQGeNIJMjwK0uyJSiitbABiGMYl7/ihcexACQ/+i4fFX7HaFDP2wdbAFb3x
         t7awHpU2svuj3XxlFLwuBzeCZNtcqK3Wg5zhbaaBbIazzBjpc9kJrHBi8SOw0KQeEe
         s/YoY5hFMUsPe/MoSxJMfZQ9S2HFVjw5Cay3BKFYl6D6jUlPZNvYKVLIo6pyOjIT/v
         SuL12so8la5I8EL2Wa+nh4by8R69ul1Ed5IrW6pwVbSG6Dkwbj45B5sY+XWctbBfgP
         0NG2SyTaHBmsA==
Date:   Fri, 18 Aug 2023 21:35:09 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     linux-i2c@vger.kernel.org, git@amd.com, michal.simek@amd.com
Subject: Re: [PATCH] i2c: cadence: Fix the kernel-doc warnings
Message-ID: <20230818193509.tfelfw5cx3htygyo@intel.intel>
References: <20230818104654.9604-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818104654.9604-1-shubhrajyoti.datta@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Shubhrajyoti,

On Fri, Aug 18, 2023 at 04:16:54PM +0530, Shubhrajyoti Datta wrote:
> This fixes the below warnings
> 
> drivers/i2c/busses/i2c-cadence.c:221: warning: Function parameter or
> member 'rinfo' not described in 'cdns_i2c'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308171510.bKHBcZQW-lkp@intel.com/
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
