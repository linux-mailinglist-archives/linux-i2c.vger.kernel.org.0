Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3840D764E68
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 10:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233977AbjG0I7i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 04:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234087AbjG0I7K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 04:59:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B062C3A92;
        Thu, 27 Jul 2023 01:39:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 66BE161DA3;
        Thu, 27 Jul 2023 08:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21134C433C7;
        Thu, 27 Jul 2023 08:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690447132;
        bh=YVvOjlN4QplbkTfUU8STJw6R9WuXHmqKUY5GkeuIEdk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GmQUMygFjMhCHkEk7yNzMmMF6abTQoBE2kpsz8puTVGsKxh+A8yAAolQbhGOvnKFn
         PX400gUHtC/md1+4FBlUB3OYXsMjOYgkKwM+ZIxh1gxpI6ayza3MPoQmdeTkzAItdC
         M0CP3Qlru2Qin1PNkXBUmOJerKsiyGL//2j76TVcheZxpbXYzYKryaiwychlQTvuth
         efNcp05P1eooNxVwWENa8dx/DKi9SqdqyHy4qIUGkbBTlUoulOi6WsP9svaovm6ZND
         qfy7gEwkAu2t6z9ECQ6tWo5JHKeH+hOVMO5q4VYuQpy6wCWuScZ9KLJXDWVf9DVMWN
         LPx+ZGdwdQ+IQ==
Date:   Thu, 27 Jul 2023 10:38:49 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     carlos.song@nxp.com
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: imx-lpi2c: directly return ISR when detect a NACK
Message-ID: <20230727083849.qcsmgqds3wyre72t@intel.intel>
References: <20230727030347.3552992-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727030347.3552992-1-carlos.song@nxp.com>
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

On Thu, Jul 27, 2023 at 11:03:47AM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> A NACK flag in ISR means i2c bus error. In such condition,
> there is no need to do read/write operation.
> 
> In this patch, i2c will check MSR_NDF, MSR_RDF and MSR_TDF
> flag in turn, it's making mutually exclusive NACK/read/write.
> So when a NACK is received(MSR_NDF), i2c will return ISR
> directly and then stop i2c transfer.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

thanks!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
