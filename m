Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380947874D0
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 18:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241562AbjHXQCp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 12:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242352AbjHXQCg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 12:02:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4120EE50;
        Thu, 24 Aug 2023 09:02:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8659A63940;
        Thu, 24 Aug 2023 16:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169CFC433C7;
        Thu, 24 Aug 2023 16:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692892950;
        bh=6N3nK6G1uLpE0sElUZA4UYZxyhq4wrGpZUufldFRgVw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LBbmJHsQOex9jyi+TH7Zs+nUzobSMi1RT3N3dSebPJlO7KScYTSBWu0IKg1nDdp+a
         Vk8Z0bxwkIxNteUzZmpLPqyw95Nw1tSaX3a3/gLDu3NUcIPwxYcL/ZPmTi+1wH6QEG
         Ec1X8PRLBJ2fiKhTP8kNmzjK/yMcGfHpSLGTB1xUI04MuaZqwWGBg1Qs94T2wHLxef
         xrWez0SQ82cqYLFnv6zGfTWuL2Y8WYa3kj+imZWIuas8KJCtWzom+u+zR69Fpm4IdA
         V6tjYF11SDGdMSkHDILTx18EWR6TwvBI5/SMn0TF5tK1+kjz7GwMuxBVSXsDQooYZN
         /TPiYUPS5xwpw==
Date:   Thu, 24 Aug 2023 18:02:26 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc:     linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/14] I2C: nforce2: Do PCI error check on own line
Message-ID: <20230824160226.xh3wnk6vtpyljlki@intel.intel>
References: <20230824132832.78705-1-ilpo.jarvinen@linux.intel.com>
 <20230824132832.78705-9-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230824132832.78705-9-ilpo.jarvinen@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ilpo,

On Thu, Aug 24, 2023 at 04:28:26PM +0300, Ilpo Järvinen wrote:
> Instead of a if condition with a line split, use the usual error
> handling pattern with a separate variable to improve readability.
> 
> No functional changes intended.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
