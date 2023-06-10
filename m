Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C96072ABD8
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Jun 2023 15:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbjFJNrS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 09:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbjFJNrR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 09:47:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F68FCA;
        Sat, 10 Jun 2023 06:47:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 982E961092;
        Sat, 10 Jun 2023 13:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825D6C433D2;
        Sat, 10 Jun 2023 13:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686404836;
        bh=fFblAE/qGsp8PFZpy9/5e/2/gCXc7t2KJnm41+27ak4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TNr6O30E3b2aQrZRZCtBWlzl0F6N83CCRIzDiFzDEbWDH1hbe9H3yn4KQll1pfVW+
         yRYsLvQ5iK6qMgcHWpqtdaEsHTxiSDZsKfCgZm5COMLJgRFhKrQIkghaxw3XBGclS8
         B5QppcQqFG9heDSilAFwmXg9+bZxyon8Qq3owerLRL8D1fHBR2nkpurZdA06DOq1de
         /Duit5TmMRV2r6Ny6vSToIVsuMNkhe0A2Wi0TlMLdnkNizoVnOCL8dfffozzbXYigB
         QXObiUodEo6IIhKiQXU0ZBU2kMKLSurdfQC3W6YhGuAlcDuVdPUHaYOzXHSrCRZVvE
         m8ksBba9dYjYw==
Date:   Sat, 10 Jun 2023 15:47:12 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     ye.xingchen@zte.com.cn
Cc:     linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: versatile: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20230610134712.scw5nwp7pgpumybj@intel.intel>
References: <202301191721230148862@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301191721230148862@zte.com.cn>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ye,

On Thu, Jan 19, 2023 at 05:21:23PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
