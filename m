Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A721711EB3
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 06:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjEZEOI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 00:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjEZEOH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 00:14:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2373C12F;
        Thu, 25 May 2023 21:14:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ABE4864AFA;
        Fri, 26 May 2023 04:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88201C433EF;
        Fri, 26 May 2023 04:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685074445;
        bh=XQQ+kgqkZ6yxlcPNw2kRtmV+gbrNBEpPhA9H44tfW8c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=P2NRcnEuC+CctA2+4Yluv5ThpN/mAKyz1+OT7psXtE3fIW0NkkeC54/mWPyuGYdzH
         qOq8kCoM3q1Ljl6bqNy/a+uplX98WLSWfN/THyStwmOK0DWui25PMhSPoRqbrf6CV9
         OP8j1ZkisGbrIMWN3k/fSfMKhqexNMMY3MXN88kHScJ0ZxMq7EbFjXULa0gWFrlsmL
         llEbhvgWCMqi5m85lkPDnxXLOiRU3ux4mhiFZ1oFf/4zvPqaoM8WVm4qCC1YEWKLpB
         Dt5CVtpGGPk7o1CvI45f+axCjVJAectLut93EnpPogJrHYrE7/Qq+ZhAxnRZO30/rH
         nvwDlhGk3JIXQ==
Date:   Thu, 25 May 2023 21:14:03 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com
Subject: Re: [PATCH net-next v9 8/9] net: txgbe: Implement phylink pcs
Message-ID: <20230525211403.44b5f766@kernel.org>
In-Reply-To: <20230524091722.522118-9-jiawenwu@trustnetic.com>
References: <20230524091722.522118-1-jiawenwu@trustnetic.com>
        <20230524091722.522118-9-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 24 May 2023 17:17:21 +0800 Jiawen Wu wrote:
> +	ret = devm_mdiobus_register(&pdev->dev, mii_bus);
> +	if (ret)
> +		return ret;
> +
> +	mdiodev = mdio_device_create(mii_bus, 0);
> +	if (IS_ERR(mdiodev))
> +		return PTR_ERR(mdiodev);
> +
> +	xpcs = xpcs_create(mdiodev, PHY_INTERFACE_MODE_10GBASER);
> +	if (IS_ERR(xpcs)) {
> +		mdio_device_free(mdiodev);
> +		return PTR_ERR(xpcs);
> +	}

How does the mdiodev get destroyed in case of success?
Seems like either freeing it in case of xpcs error is unnecessary 
or it needs to also be freed when xpcs is destroyed?
