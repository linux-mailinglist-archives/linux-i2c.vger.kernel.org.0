Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16BDA783DBC
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 12:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234694AbjHVKO4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 06:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjHVKO4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 06:14:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47707CC1;
        Tue, 22 Aug 2023 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692699294; x=1724235294;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=v3kCkqaI1EHggZDLHMlxLe8djfBcWc9iGWYm8Tx2+zo=;
  b=dHgb0FIHD0DOdxziutaik3sWmyWj7EsFeoDPlL5qULlmo7doqF10WlLl
   GTBvqafF0vZ38nfQGEfEpkEBZEzNpE5hoXjK4Rhh+GVOjMq9rjiFgBUb2
   TsytFxFeaO7GEEJX03r34Z+qNkb5nS4uCuoIKkgHS329hZcYss6nHd5fq
   5b6BUXoMrRxjIbtM3VpqihCtpo8kRFe5+ALj4OCIFUX/tGtPEn7rC2jEP
   GigvMJyIlXdicwme0lSxpw4Q04cvpUhxzhuHKvoGG1FvD7t0FX8CnCXZj
   hjAz2XaAdVWe/GnAj1tLlOreiFj5CHom/Dsdn96PxpwxkR+EcPdp+zwPg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460206939"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="460206939"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 03:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="736159070"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="736159070"
Received: from mylly.fi.intel.com (HELO [10.237.72.67]) ([10.237.72.67])
  by orsmga002.jf.intel.com with ESMTP; 22 Aug 2023 03:14:46 -0700
Message-ID: <2f215e0f-c2ed-4300-8b75-1949f17cdf1c@linux.intel.com>
Date:   Tue, 22 Aug 2023 13:14:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: designware: fix __i2c_dw_disable() in case master
 is holding SCL low
Content-Language: en-US
To:     Yann Sionneau <ysionneau@kalray.eu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Borne <jborne@kalray.eu>
References: <20230822090233.14885-1-ysionneau@kalray.eu>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230822090233.14885-1-ysionneau@kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 8/22/23 12:02, Yann Sionneau wrote:
> The DesignWare IP can be synthesized with the IC_EMPTYFIFO_HOLD_MASTER_EN
> parameter.
> In this case, when the TX FIFO gets empty and the last command didn't have
> the STOP bit (IC_DATA_CMD[9]), the controller will hold SCL low until
> a new command is pushed into the TX FIFO or the transfer is aborted.
> 
> When the controller is holding SCL low, it cannot be disabled.
> The transfer must first be aborted.
> Also, the bus recovery won't work because SCL is held low by the master.
> 
> Check if the master is holding SCL low in __i2c_dw_disable() before trying
> to disable the controller. If SCL is held low, an abort is initiated.
> When the abort is done, then proceed with disabling the controller.
> 
> This whole situation can happen for instance during SMBus read data block
> if the slave just responds with "byte count == 0".
> This puts the driver in an unrecoverable state, because the controller is
> holding SCL low and the current __i2c_dw_disable() procedure is not
> working. In this situation only a SoC reset can fix the i2c bus.
> 
Is this fixed already by the commit 69f035c480d7 ("i2c: designware: 
Handle invalid SMBus block data response length value")?

https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git/commit/?h=i2c/for-next&id=69f035c480d76f12bf061148ccfd578e1099e5fc
