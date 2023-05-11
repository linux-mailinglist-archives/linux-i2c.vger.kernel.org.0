Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE336FF157
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 14:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237858AbjEKMPl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 08:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237789AbjEKMPk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 08:15:40 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E067A5F1;
        Thu, 11 May 2023 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=uvtW7nI6+w4eTPnMLfAaybexQeAjAaePC4ggSclmWYg=; b=wPnVzlM/mDuX1iyvd0IAdBUwqb
        5rGoByhht3stxKjxEPUQGEORCG3vcw0nuXDC8iwzzx5yvcek18/jsk+kiDYROzJ6trc3Gonj4Q1Ey
        nNbNDfTSwDraeBBscdCUyQoAa6jmHG55/o/BO+iAIwVmLwAUrEXxIzHCTlWTOZZU+5LY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1px5BH-00CYEL-Ei; Thu, 11 May 2023 14:13:59 +0200
Date:   Thu, 11 May 2023 14:13:59 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com
Subject: Re: [PATCH net-next v7 5/9] net: txgbe: Add SFP module identify
Message-ID: <db497ec0-e997-489b-ab98-98b64b5f7795@lunn.ch>
References: <20230509022734.148970-1-jiawenwu@trustnetic.com>
 <20230509022734.148970-6-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509022734.148970-6-jiawenwu@trustnetic.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 09, 2023 at 10:27:30AM +0800, Jiawen Wu wrote:
> Register SFP platform device to get modules information.
> 
> Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
