Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E68C1784228
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 15:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234201AbjHVNf4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 09:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbjHVNf4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 09:35:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DCB6193;
        Tue, 22 Aug 2023 06:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692711354; x=1724247354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rkqk5+j/XQXLyx73Oxvf1MyU2fTfCtcyasVG1GZmA1A=;
  b=gtHmK75iuOQu2R6F9rKXUe6ET77u5e62e6gci4CHzMko+ZaRV/naEUyN
   cjRbVNItBPUoz59bigUL9+J95JaINxbjDxN306S0SL1xR9vcLa+qG68m5
   5A+q0TXzfFXqgZf9oo3wInY25JF6g+NO5F4+8y2hd1CJj+OYhjlPBZu3o
   QO/plv4ByCI2u0PLmeSxE7WyKZKGUUKIWjZdfH0A9MisarhwkNh3dzszZ
   MyX7PWxVEuLM3sHo+9wjonSiLH0LB8V+L3tDgbuqr8DdcmPZktInvl4sO
   Tj4C84LLfs5QayLv570Sq7zfTWfk1RSof7lmf1yxlaQ2h3VBS6Vhwf/7l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358865256"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="358865256"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 06:35:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="686046940"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="686046940"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 22 Aug 2023 06:35:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B4A54D87; Tue, 22 Aug 2023 16:35:48 +0300 (EEST)
Date:   Tue, 22 Aug 2023 16:35:48 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Yann Sionneau <ysionneau@kalray.eu>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] Currently if the SoC needs pinctrl to switch the SCL
 and SDA from the I2C function to GPI
Message-ID: <20230822133548.GO3465@black.fi.intel.com>
References: <20230822131123.5041-1-ysionneau@kalray.eu>
 <ZOS3cI7RL443mizj@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZOS3cI7RL443mizj@smile.fi.intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 22, 2023 at 04:26:08PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 22, 2023 at 03:11:23PM +0200, Yann Sionneau wrote:
> > scl-gpio = <>;
> > sda-gpio = <>;
> > 
> > Are not enough for some SoCs to have a working recovery.
> > Some need:
> > 
> > scl-gpio = <>;
> > sda-gpio = <>;
> > pinctrl-names = "default", "recovery";
> > pinctrl-0 = <&i2c_pins_hw>;
> > pinctrl-1 = <&i2c_pins_gpio>;
> > 
> > The driver was not filling rinfo->pinctrl with the device node
> > pinctrl data which is needed by generic recovery code.
> > 
> > Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> > ---
> > V3 -> V4:
> > * Replace `else if` by simply `if`.
> 
> You forgot my tag. Why?
> Also I think this will generate more code and more noise in debug case.
> So, I admit I gave a bad suggestion in previous round.
> 
> Please, go for v3 with my tag (as v5).

While there fix $subject to follow the convention used in the driver.
