Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 339F06FF1B7
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 14:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237411AbjEKMk5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 08:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjEKMk4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 08:40:56 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5287E5D;
        Thu, 11 May 2023 05:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=+CXxgv7BYMxVDWVYBvgEtBMk5M0gWA2h/9LTotfHEn8=; b=jo4WjyNyQ/ZZqPYeYmBRwJLTcR
        /dfOKhXTZV8ngfR082+9D2xUVbwmIEk0QCz82x1byL94HuHwJY5/J46oYPD9/Q50qNzztHUnj5I2i
        nhrEI6ROBRdPV2U7eNsjPUt0XQXrOhPmP0VKZPCEY6CiULgoiuy4MQJTi02wICneK4yM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1px5bC-00CYNL-7C; Thu, 11 May 2023 14:40:46 +0200
Date:   Thu, 11 May 2023 14:40:46 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com
Subject: Re: [PATCH net-next v7 7/9] net: pcs: Add 10GBASE-R mode for
 Synopsys Designware XPCS
Message-ID: <1825ca3f-a8f9-428d-ac9c-0c4b9a218fc0@lunn.ch>
References: <20230509022734.148970-1-jiawenwu@trustnetic.com>
 <20230509022734.148970-8-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509022734.148970-8-jiawenwu@trustnetic.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 09, 2023 at 10:27:32AM +0800, Jiawen Wu wrote:
> Add basic support for XPCS using 10GBASE-R interface. This mode will
> be extended to use interrupt, so set pcs.poll false. And avoid soft
> reset so that the device using this mode is in the default configuration.
> 
> Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
