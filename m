Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 341CB7095F5
	for <lists+linux-i2c@lfdr.de>; Fri, 19 May 2023 13:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbjESLHp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 May 2023 07:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbjESLHo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 May 2023 07:07:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB55173F
        for <linux-i2c@vger.kernel.org>; Fri, 19 May 2023 04:07:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 04818656C8
        for <linux-i2c@vger.kernel.org>; Fri, 19 May 2023 11:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CD1C433D2;
        Fri, 19 May 2023 11:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684494449;
        bh=FyJ50kw7xvmJo0F0np0kU5j+/pZPzn0vgPfcWrel7O8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bWQmVdnY2IWZ2GDLnvojcqPmXgak8nQibQToCLr0//BjKz7C4ADck29Nqn2RGJKjV
         oLtEiZ3Xrvz2CfRkO6FoOBM53vSPPN97+BBjXQ21RE22p58uqHY3ndPhP80HTdaJU2
         rFLMpf0xblTxv+QABh/BQ+0xoWij0ciSwiqpEy3cDEkttLczr9FyKwqodCU3pdGTYj
         psYYDzz5BBzNISq81VCMzTQGJztJTSw8UxBYQKAXVuce2av/G2OlQL5+6YSSMLlr4j
         NnJklNEGQczwOprLj1h59wKVhNGfZOrlPO82ks/SF6b6gJsLUQDdH9c6Ru3VR/detJ
         QrB1aQiaLarDg==
Date:   Fri, 19 May 2023 13:07:26 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3 2/3] i2c: i801: Add support for Intel Meteor Lake SoC-S
Message-ID: <20230519110726.4hhlcotkfvrihbhb@intel.intel>
References: <20230512115001.81309-1-jarkko.nikula@linux.intel.com>
 <20230512115001.81309-2-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512115001.81309-2-jarkko.nikula@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarkko,

On Fri, May 12, 2023 at 02:50:00PM +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Meteor Lake SoC-S South.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
